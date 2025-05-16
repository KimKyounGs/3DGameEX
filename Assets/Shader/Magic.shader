// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Magic"
{
	Properties
	{
		_c("c", 2D) = "white" {}
		_d("d", 2D) = "white" {}
		_Move_X("Move_X", Range( -1 , 1)) = 0.5
		_Move_Y("Move_Y", Range( -1 , 1)) = 0.5
		_Scale_U("Scale_U", Range( 0.5 , 10)) = 0.5
		_Scale_V("Scale_V", Range( 0.5 , 10)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Off
		ZWrite Off
		Blend One One
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _c;
		uniform sampler2D _d;
		uniform float _Move_X;
		uniform float _Move_Y;
		uniform float _Scale_U;
		uniform float _Scale_V;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float cos15 = cos( -1.0 * _Time.y );
			float sin15 = sin( -1.0 * _Time.y );
			float2 rotator15 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos15 , -sin15 , sin15 , cos15 )) + float2( 0.5,0.5 );
			float cos13 = cos( 1.0 * _Time.y );
			float sin13 = sin( 1.0 * _Time.y );
			float2 rotator13 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos13 , -sin13 , sin13 , cos13 )) + float2( 0.5,0.5 );
			float4 appendResult5 = (float4(_Move_X , _Move_Y , 0.0 , 0.0));
			float4 appendResult10 = (float4(_Scale_U , _Scale_V , 0.0 , 0.0));
			o.Emission = ( tex2D( _c, rotator15 ) + tex2D( _d, ( ( float4( rotator13, 0.0 , 0.0 ) + appendResult5 ) * appendResult10 ).xy ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16700
1920;23;1920;1031;3105.615;512.0467;2.086351;True;False
Node;AmplifyShaderEditor.RangedFloatNode;7;-2267.695,409.021;Float;False;Property;_Move_Y;Move_Y;4;0;Create;True;0;0;False;0;0.5;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-2274.695,297.0209;Float;False;Property;_Move_X;Move_X;3;0;Create;True;0;0;False;0;0.5;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-2136.887,-24.97936;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-1854.741,747.2123;Float;False;Property;_Scale_U;Scale_U;5;0;Create;True;0;0;False;0;0.5;0.5;0.5;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1856.041,899.3126;Float;False;Property;_Scale_V;Scale_V;6;0;Create;True;0;0;False;0;0.5;0.5;0.5;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;5;-1871.687,342.021;Float;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RotatorNode;13;-1834.64,21.37754;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;10;-1468.642,762.8122;Float;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;-1224.024,-75.64989;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;3;-1525.686,162.0207;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-1116.342,632.8122;Float;True;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RotatorNode;15;-912.2559,195.9415;Float;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-408.1759,301.0186;Float;True;Property;_c;c;1;0;Create;True;0;0;False;0;1ada4da83dbf9354385571bb24953c70;1ada4da83dbf9354385571bb24953c70;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-378.3208,616.2762;Float;True;Property;_d;d;2;0;Create;True;0;0;False;0;b7d09b0b5c3a5564fa67bd642008b7e7;b7d09b0b5c3a5564fa67bd642008b7e7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;16;31.08108,454.6763;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;446.7599,281.2337;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Magic;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;5;1;7;0
WireConnection;13;0;4;0
WireConnection;10;0;11;0
WireConnection;10;1;12;0
WireConnection;3;0;13;0
WireConnection;3;1;5;0
WireConnection;9;0;3;0
WireConnection;9;1;10;0
WireConnection;15;0;14;0
WireConnection;1;1;15;0
WireConnection;2;1;9;0
WireConnection;16;0;1;0
WireConnection;16;1;2;0
WireConnection;0;2;16;0
ASEEND*/
//CHKSM=06E0B7D992DE7761249F09077368ABD3F978B86E