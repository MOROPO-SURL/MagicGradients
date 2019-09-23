﻿using Playground.Services;
using Xamarin.Forms;

namespace Playground
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            DependencyService.Register<GalleryService>();

            MainPage = new AppShell();
        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}