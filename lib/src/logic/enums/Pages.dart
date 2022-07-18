enum NavPages {
  Upload,
  Settings,
  Stats,
  Edit
}

enum Pages {
  Upload,
  Settings,
  Stats,
  Edit,
  Login,
  Error
}

bool isPageInNav(Pages currPage) {
    for (var i in NavPages.values) {
        if (i.toString().split(".")[1] == currPage.toString().split(".")[1]) {
          return true;
        }
    }
    return false;
}