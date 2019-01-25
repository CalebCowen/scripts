puts 'Intalling redux packages'

`npm i redux react-redux redux-thunk --save`

puts 'We need to ask you some questions to set up redux. Just press enter to select the default choice (*** Do not add trailing slashes)'
sleep(2)

directory = 'src'
print 'Where would you like to store your redux folders (default: src/) > '
userDirectory = gets.chomp
directory = userDirectory if userDirectory != ''

index = "#{directory}/index.js"

print 'Where is your entry point located? (default: #{directory}/index.js) > '
userIndex = gets.chomp
index = userIndex if userIndex != ''

puts "Creating redux directories..."
sleep(2)

`mkdir #{directory}/reducers &&
mkdir #{directory}/actions &&
mkdir #{directory}/store &&
touch #{directory}/reducers/baseReducer.js &&
touch #{directory}/reducers/rootReducer.js &&
touch #{directory}/reducers/initialState.js &&
touch #{directory}/actions/actionTypes.js &&
touch #{directory}/actions/baseActions.js &&
touch #{directory}/store/configureStore.js`

puts "Writing to files..."
sleep(2)

open("#{directory}/actions/actionTypes.js", 'w') do |f|
  f << "import * as types from './actionTypes'
export function baseAction() {
  return {type: types.BASE_TYPE}
}"
end

open("#{directory}/actions/baseActions.js", 'w') do |f|
  f << "import * as types from './actionTypes'
export function baseAction() {
  return {type: types.BASE_TYPE}
}"
end

open("#{directory}/reducers/rootReducer.js", 'w') do |f|
  f << "import {combineReducers} from 'redux'
import base from './baseReducer'
const rootReducer = combineReducers({
  base
})
export default rootReducer"
end

open("#{directory}/reducers/baseReducer.js", 'w') do |f|
  f << "import initialState from './initialState'
import {BASE_TYPE} from '../actions/actionTypes'
export default function base(state = initialState.base, action) {
  switch (action.type) {
    case BASE_TYPE:
      console.log('BASE_TYPE action')
      return action
    default:
      return state
  }
}"
end

open("#{directory}/reducers/initialState.js", 'w') do |f|
  f << "export default {
  stuff: []
}"
end

open("#{directory}/store/configureStore.js", 'w') do |f|
  f << "import {createStore, applyMiddleware} from 'redux'
import rootReducer from '../reducers/rootReducer'
import thunk from 'redux-thunk'
export default function configureStore() {
  return createStore(
    rootreducer,
    window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
    applyMiddleware(thunk)
  )
}"
end

open("#{index}", 'a') do |f|
  f << "
//This is the basic setup for redux if you used create-react-app.
//import configureStore from './store/configureStore'
//import {Provider} form 'react-recux'
//const store = configureStore()
  //ReactDOM.render(
    //<Provider store={store}>
      //<App/>
    //</Provider>,
    //document.getElementById('app')
  //)"
end
