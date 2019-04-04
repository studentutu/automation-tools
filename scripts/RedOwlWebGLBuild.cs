using UnityEditor;

class RedOwlWebGLBuilder {
    static void build() {
        // Need to build a full scene list?
        string[] scenes = {"Assets/main.unity"};
        BuildPipeline.BuildPlayer(scenes, "webgl", BuildTarget.WebGL, BuildOptions.None);
    }
}