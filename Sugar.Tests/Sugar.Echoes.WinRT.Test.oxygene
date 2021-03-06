﻿<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="12.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProjectGuid>{90b9f375-6c66-4316-81d7-7e549c959b30}</ProjectGuid>
    <OutputType>AppContainerExe</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>Sugar.Test</RootNamespace>
    <AssemblyName>Sugar.Echoes.WinRT.Test</AssemblyName>
    <DefaultLanguage>en-US</DefaultLanguage>
    <ProjectTypeGuids>{BC8A1FFA-BEE3-4634-8014-F334798102B3};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <PackageCertificateKeyFile>Sugar.Echoes.WinRT.Test_TemporaryKey.pfx</PackageCertificateKeyFile>
    <Name>Sugar.Echoes.WinRT.Test</Name>
    <DefaultUses />
    <StartupClass />
    <InternalAssemblyName />
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <TargetPlatformVersion>8.1</TargetPlatformVersion>
    <MinimumVisualStudioVersion>12</MinimumVisualStudioVersion>
    <TargetFrameworkVersion />
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <CpuType>AnyCPU</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <Optimize>false</Optimize>
    <OutputPath>bin\Debug\WinRT\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <CpuType>AnyCPU</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release\WinRT\</OutputPath>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|ARM'">
    <DebugSymbols>true</DebugSymbols>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <OutputPath>bin\ARM\Debug\WinRT\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <CpuType>ARM</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release|ARM'">
    <OutputPath>bin\ARM\Release\WinRT\</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>ARM</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|x64'">
    <DebugSymbols>true</DebugSymbols>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <OutputPath>bin\x64\Debug\WinRT\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <CpuType>x64</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release|x64'">
    <OutputPath>bin\x64\Release\WinRT\</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>x64</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Debug|x86'">
    <DebugSymbols>true</DebugSymbols>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <OutputPath>bin\x86\Debug\WinRT\</OutputPath>
    <DefineConstants>DEBUG;TRACE;NETFX_CORE</DefineConstants>
    <CpuType>x86</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)' == 'Release|x86'">
    <OutputPath>bin\x86\Release\WinRT\</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <DefineConstants>TRACE;NETFX_CORE</DefineConstants>
    <Optimize>true</Optimize>
    <CpuType>x86</CpuType>
    <Prefer32Bit>true</Prefer32Bit>
  </PropertyGroup>
  <ItemGroup>
    <!-- A reference to the entire .Net Framework and Windows SDK are automatically included -->
    <Folder Include="Main\" />
    <Folder Include="Main\WinRT\" />
    <Folder Include="Main\WinRT\Assets\" />
    <Folder Include="Main\WinRT\Common\" />
    <Folder Include="Main\WinRT\Properties\" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="App.xaml.pas">
      <DependentUpon>App.xaml</DependentUpon>
    </Compile>
    <Compile Include="Main\WinRT\MainPage.xaml.pas">
      <DependentUpon>MainPage.xaml</DependentUpon>
    </Compile>
    <Compile Include="Main\WinRT\Properties\AssemblyInfo.pas" />
  </ItemGroup>
  <ItemGroup>
    <AppxManifest Include="Main\WinRT\Package.appxmanifest">
      <SubType>Designer</SubType>
    </AppxManifest>
    <None Include="Sugar.Echoes.WinRT.Test_TemporaryKey.pfx" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Main\WinRT\Assets\Logo.png" />
    <Content Include="Main\WinRT\Assets\WideLogo.png" />
    <Content Include="Main\WinRT\Assets\SmallLogo.png" />
    <Content Include="Main\WinRT\Assets\SplashScreen.png" />
    <Content Include="Main\WinRT\Assets\StoreLogo.png" />
  </ItemGroup>
  <ItemGroup>
    <ApplicationDefinition Include="App.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </ApplicationDefinition>
    <Page Include="Main\WinRT\Common\StandardStyles.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </Page>
    <Page Include="Main\WinRT\MainPage.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </Page>
  </ItemGroup>
  <PropertyGroup Condition=" '$(VisualStudioVersion)' == '' or '$(VisualStudioVersion)' &lt; '12.0' ">
    <VisualStudioVersion>12.0</VisualStudioVersion>
  </PropertyGroup>
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it.
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
  <ItemGroup>
    <Reference Include="mscorlib" />
    <Reference Include="RemObjects.Elements.EUnit" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Sugar\Sugar.Echoes.WinRT.oxygene">
      <Name>Sugar.Echoes.WinRT</Name>
      <Project>{3ab69816-9882-4fa6-abe5-c146199f5279}</Project>
      <Private>True</Private>
      <HintPath>..\Sugar\bin\WinRT\Sugar.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.WinRT.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
  <Import Project="..\Sugar.Tests\Sugar.Shared.Test.projitems" Label="Shared" />
</Project>