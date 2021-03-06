import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { selectElement } from '../../actions/index';

const bodyMuscle = (props) => {
  const { muscleForce, muscleId, muscleSVGPath } = props;
  const muscleFillColor = () => {
    switch (muscleForce) {
      case 1:
        return "#FF0000";
      case 2:
        return "#FA6401";
      case 3:
        return "#FFC300";
      case 4:
        return "#FFFF00";
      case 5:
        return "#00FF00";
      default:
        return "#FFFFFF";
    }
  };

  const handleClickMuscle = (event) => {
    event.persist();
    props.selectElement(event.target.getAttribute('id'));
  };

  return (
    <path id={muscleId} fill={muscleFillColor()} onClick={handleClickMuscle} d={muscleSVGPath} stroke="#CD0F0F" strokeWidth="8" />
  );
};

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { selectElement },
    dispatch
  );
}

export default connect(null, mapDispatchToProps)(bodyMuscle);
