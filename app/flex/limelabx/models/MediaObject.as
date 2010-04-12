package limelabx.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="media_objects")]
  [Bindable]
  public class MediaObject extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    public var owner:String = "";

    public var restrictions:String = "";

    public function MediaObject() {
      super(LABEL);
    }
  }
}
