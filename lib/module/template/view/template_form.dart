import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemplateForm extends StatefulWidget {
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? titleText;
  final color;
  final fillColor;
  final borderColor;
  final initialValue;
  final onChanged;
  final double? fontSize;
  final double? formHeight;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final formatter;
  final bool enabled;
  final bool adaValidasi;
  final bool keyboardNumber;
  final bool numberOnly;
  final double bottomMargin;
  final double? radius;
  final int maxLine;
  final int minLine;
  final prefixIcon;
  final buttonEnd;
  TemplateForm(
      {this.fieldKey,
        this.onChanged,
      this.hintText,
      this.helperText,
      this.labelText,
      this.onSaved,
      this.validator,
      this.controller,
      this.enabled = true,
      this.adaValidasi = false,
      this.keyboardNumber = false,
      this.numberOnly = false,
      this.titleText,
      this.textCapitalization = TextCapitalization.words,
      this.bottomMargin = 12.0,
      this.maxLine = 1,
      this.initialValue,
      this.prefixIcon,
      this.color = Colors.white,
      this.fontSize = 14,
      this.radius = 16,
      this.formHeight = 48,
      this.minLine = 1,
      this.formatter,
        this.fillColor = Colors.transparent,
        this.borderColor = Colors.black,
      this.buttonEnd});
  @override
  _TemplateFormState createState() => _TemplateFormState();
}

class _TemplateFormState extends State<TemplateForm> {
  String? _validate(String? value) {
    if (value!.isEmpty) return 'Please fill this form.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.titleText != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.titleText!,
                    style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.fontSize),
                  ),
                )
              : Container(),
          Container(
            padding: EdgeInsets.only(right: 6),
            height: widget.formHeight,
            decoration: widget.buttonEnd != null
                ? BoxDecoration(
                    border: Border.all(color: widget.borderColor, width: 0.8),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius!)))
                : null,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: widget.onChanged,
                    minLines: widget.minLine,
                    initialValue: widget.initialValue,
                    cursorColor: widget.color,
                    maxLines: widget.maxLine,
                    controller: widget.controller,
                    keyboardType: widget.keyboardNumber
                        ? TextInputType.number
                        : TextInputType.text,
                    inputFormatters: widget.numberOnly
                        ? <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ]
                        : widget.formatter != null
                            ? [
                                widget.formatter,
                              ]
                            : null,
                    key: widget.fieldKey,
                    enabled: widget.enabled,
                    style: TextStyle(
                        fontSize: widget.fontSize, color: widget.color),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius!),
                          borderSide: BorderSide(
                            color: widget.buttonEnd == null
                                ? widget.borderColor
                                : Colors.transparent,
                            width: 0.8,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius!),
                          borderSide: BorderSide(
                            color: widget.buttonEnd == null
                                ? widget.borderColor
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.radius!),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.8,
                          ),
                        ),
                        hintStyle: TextStyle(
                            color: widget.enabled
                                ? widget.color
                                : Colors.grey[600]),
                        labelStyle: TextStyle(color: widget.color),
                        fillColor: widget.fillColor,
                        filled: true,
                        prefixIcon: widget.prefixIcon,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                        hintText: widget.hintText,
                        labelText: widget.labelText),
                    validator: widget.adaValidasi == true ? _validate : null,
                    onSaved: widget.onSaved,
                  ),
                ),
                widget.buttonEnd ?? Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
