import { MUSCLE_FORCE_CHANGED } from '../actions/actionsTypes';

export default function(state = null, action) {
  switch (action.type) {
    case MUSCLE_FORCE_CHANGED: {
      return action.payload;
    }
    default: {
      return state;
    }
  }
}
