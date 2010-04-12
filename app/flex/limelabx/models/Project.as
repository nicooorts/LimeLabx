package limelabx.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="projects")]
  [Bindable]
  public class Project extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    [HasMany]
    public var mediaObjects:ModelsCollection;
    
    public function Project() {
      super(LABEL);
    }
  }
}
