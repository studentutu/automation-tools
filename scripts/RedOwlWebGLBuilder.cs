#if UNITY_EDITOR
using System.Linq;
using System.Collections.Generic;
using UnityEditor;

public static class RedOwlWebGLBuilder {
    public static void build() {
        BuildPipeline.BuildPlayer(getScenes().ToArray(), "Build/WebGL", BuildTarget.WebGL, BuildOptions.None);
    }

    public static IEnumerable<string> getScenes() {
        foreach(var scene in EditorBuildSettings.scenes)
        {
            if(scene.enabled) yield return scene.path;
        }
    }
}
#endif
