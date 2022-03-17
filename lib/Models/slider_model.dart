class SliderModel {
  String? title;
  String? desc;

  SliderModel({this.title, this.desc});

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getTitle() {
    return title!;
  }

  String getDesc() {
    return desc!;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  //1
  sliderModel.setDesc(
      "Bool your brand recognition with each click. Generic links don't mean a thinkg. Branded links help instil confidence in your content.");
  sliderModel.setTitle("Brand Recognition");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //2
  sliderModel.setDesc(
      "Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.");
  sliderModel.setTitle("Detailed Record");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //3
  sliderModel.setDesc(
      "Improve brand awareness and content discoverability through customizable links, supercharging audience angagement.");
  sliderModel.setTitle("Fully Customizable");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
