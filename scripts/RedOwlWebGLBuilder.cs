#if UNITY_EDITOR
using System.Collections.Generic;
using UnityEditor;

public static class RedOwlWebGLBuilder {
    public static void build() {
        BuildPipeline.BuildPlayer(getScenes(), "webgl", BuildTarget.WebGL, BuildOptions.None);
    }

    public static IEnumerator<string> getScenes() {
        foreach(EditorBuildingSettingsScene scene in EditorBuildSettings.scenes)
        {
            if(scene.enabled) yield return scene.path;
        }
    }
}
#endif