<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Gallery2.aspx.cs" Inherits="Gallery2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="../layout/scripts/jquery.min.js"></script>
<!-- prettyPhoto -->
<link rel="stylesheet" href="../layout/scripts/prettyphoto/prettyPhoto.css" type="text/css" />
<script type="text/javascript" src="../layout/scripts/prettyphoto/jquery.prettyPhoto.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("a[rel^='prettyPhoto']").prettyPhoto({
            theme: 'dark_rounded',
            overlay_gallery: false,
            social_tools: false
        });
    });
</script>

    <div class="wrapper row2">
  <div class="rnd">
    <!-- ###### -->
    <div id="topnav">
      <ul>
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="background.aspx">All About Kmit</a></li>
       
        <li><a href="FS.aspx">Finishing School</a></li>
        <li><a href="Gallery.aspx">Gallery</a></li>
       
      </ul>
    </div>
    <!-- ###### -->
  </div>
</div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear"> 
      <!-- ####################################################################################################### -->
      <div id="gallery" class="clear">
        <h2 class="title">Latest Images From The University</h2>
        <ul>
          <li><a href="images/pics/k16.jpg" rel="prettyPhoto[gallery1]" title="Image 1"><img src="images/pics/k16.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k17.jpg" rel="prettyPhoto[gallery1]" title="Image 2"><img src="images/pics/k17.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k18.png" rel="prettyPhoto[gallery1]" title="Image 3"><img src="images/pics/k18.png" alt="Title Text" /></a></li>
          <li><a href="images/pics/k19.png" rel="prettyPhoto[gallery1]" title="Image 4"><img src="images/pics/k19.png" alt="Title Text" /></a></li>
          <li><a href="images/pics/k20.jpg" rel="prettyPhoto[gallery1]" title="Image 5"><img src="images/pics/k20.jpg" alt="Title Text" /></a></li>
          
        </ul>
      </div>
      <!-- ####################################################################################################### -->
      <div class="pagination">
        <ul>
         
          <li><a href="Gallery.aspx">1</a></li>
          <li><a href="Gallery2.aspx">2</a></li>
         
        </ul>
      </div>
      <!-- ####################################################################################################### --> 
    </div>
  </div>
</div>

</asp:Content>



