// Prezence - Copyright 2019 The Innovation Group
// @author Kenneth Reilly <kenneth@innovationgroup.tech>

import 'dart:core';
import 'package:flutter/material.dart';
import '../components/subpage-header.dart';
import '../components/smart-button.dart';
import '../components/duration-picker.dart';
import '../services/timer-bus.dart';
import '../types/geometry.dart';

class MeditationTimedScreen extends StatefulWidget {

	const MeditationTimedScreen({ Key key }) : super(key: key);

	@override
	MeditationTimedScreenState createState() => new MeditationTimedScreenState();
}

class MeditationTimedScreenState extends State<MeditationTimedScreen> {

	Duration _duration = Duration(minutes: 20);

	void _onChangeDuration(Duration duration) {

		_duration = duration;
		setState(() {  });
	}

	void _onPressStart() {

		TimerBus.init(_duration);
		Navigator.pushNamed(context, '/timer'); 
	}

	@override
	Widget build(BuildContext context) {

		Geometry geometry = new Geometry(context);

		DurationPicker _durationPicker = DurationPicker(
			rootSize: geometry.root,
			duration: _duration,
			onChange: _onChangeDuration,
		);

		return Column(

			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[

				Container(constraints: BoxConstraints.expand(height: geometry.rootThird)),

				SubPageHeader(text: 'Set Timer'),

				Container(constraints: BoxConstraints.expand(height: geometry.rootQuarter)),

				_durationPicker,

				ButtonGroup(
					buttons: [
						SmartButton(
							text: 'start',
							onPressed: _duration.inMinutes > 0 ? _onPressStart : null
						)
					]
				)
			]
		);
	}
}