<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectAttachments.ascx.cs" Inherits="ACWeb.PlanManager.ProjectAttachments" %>

<script id="projectAttachments" type="text/template">
    <h4>Attachments</h4>
    <div class="row">
        <div class="col-md-3">
            <input id="uploadImage" class="form-control" type="file" name="myPhoto" data-bind="change: $root.previewFiles" multiple />
        </div>
        <ul id="queuedFileList" data-bind="visible: $root.queuedFiles, foreach: $root.queuedFiles" class="list-unstyled">
            <li class="col-md-2">
                <img class="thumbnail" data-bind="attr: { src: source }" />
                <span contenteditable class="text-muted" data-bind="text: name"></span>
            </li>
        </ul>

    </div>
    <div class="row">
        <ul data-bind="foreach: attachments" class="list-unstyled">
            <li class="col-md-3">
                <img class="thumbnail" data-bind="visible: type() == 'Photo', attr: { src: path() + filename() }" />
                <span class="text-muted" data-bind="text: description"></span>
            </li>
        </ul>
    </div>
</script>
