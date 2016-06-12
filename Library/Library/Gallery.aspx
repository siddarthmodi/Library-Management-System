<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

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
     
      <div id="gallery" class="clear">
        <h2 class="title">Latest Images From The University</h2>
        <ul>
          <li><a href="images/pics/k1.jpg" rel="prettyPhoto[gallery1]" title="Image 1"><img src="images/pics/k1.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k2.jpg" rel="prettyPhoto[gallery1]" title="Image 2"><img src="images/pics/k2.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k3.jpg" rel="prettyPhoto[gallery1]" title="Image 3"><img src="images/pics/k3.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k4.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img src="images/pics/k4.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k5.jpg" rel="prettyPhoto[gallery1]" title="Image 5"><img src="images/pics/k5.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k6.jpg" rel="prettyPhoto[gallery1]" title="Image 6"><img src="images/pics/k6.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k7.png" rel="prettyPhoto[gallery1]" title="Image 7"><img src="images/pics/k7.png" alt="Title Text" /></a></li>
          <li><a href="images/pics/k8.png" rel="prettyPhoto[gallery1]" title="Image 8"><img src="images/pics/k8.png" alt="Title Text" /></a></li>
          <li><a href="images/pics/k9.png" rel="prettyPhoto[gallery1]" title="Image 9"><img src="images/pics/k9.png" alt="Title Text" /></a></li>
          <li><a href="images/pics/k10.jpg" rel="prettyPhoto[gallery1]" title="Image 10"><img src="images/pics/k10.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k11.jpg" rel="prettyPhoto[gallery1]" title="Image 11"><img src="images/pics/k11.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k12.jpg" rel="prettyPhoto[gallery1]" title="Image 12"><img src="images/pics/k12.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k13.jpg" rel="prettyPhoto[gallery1]" title="Image 13"><img src="images/pics/k13.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k14.jpg" rel="prettyPhoto[gallery1]" title="Image 14"><img src="images/pics/k14.jpg" alt="Title Text" /></a></li>
          <li><a href="images/pics/k15.jpg" rel="prettyPhoto[gallery1]" title="Image 15"><img src="images/pics/k15.jpg" alt="Title Text" /></a></li>
        </ul>
      </div>
     
      <div class="pagination">
        <ul>
         
          <li><a href="Gallery.aspx">1</a></li>
          <li><a href="Gallery2.aspx">2</a></li>
        
        </ul>
      </div>
     
    </div>
  </div>
</div>

</asp:Content>





