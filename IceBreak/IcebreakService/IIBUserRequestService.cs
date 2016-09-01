﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace IcebreakServices
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ITestService" in both code and config file together.
    [ServiceContract(Namespace ="http://icebreak.azurewebsites.net/")]
    public interface IIBUserRequestService
    {
        [OperationContract]
        [WebInvoke(Method = "POST",
            UriTemplate = "/addMessage",
            BodyStyle = WebMessageBodyStyle.Bare,
            ResponseFormat = WebMessageFormat.Json)]
        string addMessage(Stream streamdata);

        [OperationContract]
        [WebInvoke(Method = "POST",
            UriTemplate = "/setUniqueUserToken",
            BodyStyle = WebMessageBodyStyle.Bare,
            ResponseFormat = WebMessageFormat.Json)]
        string setUniqueUserToken(Stream streamdata);

        [OperationContract]
        [WebInvoke(Method = "POST",
            UriTemplate = "/userUpdate/{handle}",
            BodyStyle = WebMessageBodyStyle.Bare,
            ResponseFormat = WebMessageFormat.Json)]
        string userUpdate(string handle, Stream streamdata);

        [OperationContract]
        [WebInvoke(Method = "DELETE",
            UriTemplate = "/removeUser/{handle}",
            BodyStyle = WebMessageBodyStyle.Bare)]
        string removeUser(string handle);

        [OperationContract]
        [WebGet(UriTemplate = "/getUsersAtEvent/{eventId}", ResponseFormat = WebMessageFormat.Json)]
        List<User> getUsersAtEvent(string eventId);

        [OperationContract]
        [WebGet(UriTemplate = "/getUser/{username}", ResponseFormat = WebMessageFormat.Json)]
        User getUser(string username);

        [OperationContract]
        [WebGet(UriTemplate = "/getMessageById/{msg_id}", ResponseFormat = WebMessageFormat.Json)]
        Message getMessageById(string msg_id);

        [OperationContract]
        [WebGet(
            UriTemplate = "/imageDownload/{fileName}",
            ResponseFormat = WebMessageFormat.Json, 
            BodyStyle =WebMessageBodyStyle.WrappedResponse)]
        string imageDownload(string fileName);

        [OperationContract]
        [WebGet(
            UriTemplate = "/checkUserInbox/{username}",
            ResponseFormat = WebMessageFormat.Json,
            BodyStyle = WebMessageBodyStyle.WrappedResponse)]
        List<Message> checkUserInbox(string username);

        [OperationContract]
        [WebGet(
            UriTemplate = "/checkUserOutbox/{sender}",
            ResponseFormat = WebMessageFormat.Json,
            BodyStyle = WebMessageBodyStyle.WrappedResponse)]
        List<Message> checkUserOutbox(string sender);

        [OperationContract]
        [WebInvoke(Method = "PUT",
            UriTemplate = "/imgUpload/{fileName}",
            BodyStyle = WebMessageBodyStyle.Bare)]
        string imageUpload(string fileName, Stream fileStream);

        /*[OperationContract]
        [WebInvoke(Method = "POST",
            UriTemplate = "/updateUserMailbox",
            BodyStyle = WebMessageBodyStyle.Bare)]
        string updateUserMailbox(Stream fileStream);*/

        [OperationContract]
        [WebInvoke(
            Method = "POST",
            UriTemplate = "/signup",
            BodyStyle = WebMessageBodyStyle.Bare)]
        //[WebInvoke(Method = "POST", UriTemplate = "usrRegPOST", RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]//, ResponseFormat = WebMessageFormat.Json, 
        string registerUser(Stream streamdata);

        [OperationContract]
        [WebInvoke(
            Method = "POST",
            UriTemplate = "/signin",
            BodyStyle = WebMessageBodyStyle.Bare)]
        void signIn(Stream streamdata);

        [OperationContract]
        [WebInvoke(
            Method = "POST",
            UriTemplate = "/addEvent",
            BodyStyle = WebMessageBodyStyle.Bare)]
        void addEvent(Stream streamdata);

        /*[OperationContract]
        [WebInvoke(
            Method = "POST",
            UriTemplate = "/addEventImg/{eventId}",
            BodyStyle = WebMessageBodyStyle.Bare)]
        void addEventImg(string eventId, Stream streamdata);*/

        [OperationContract]
        [WebGet(UriTemplate = "/readEvents/", ResponseFormat = WebMessageFormat.Json, BodyStyle =WebMessageBodyStyle.Bare)]
        List<Event> readEvents();

        [OperationContract]
        [WebGet(UriTemplate = "/getEvent/{event_id}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        Event getEvent(string event_id);

        [OperationContract]
        [WebGet(UriTemplate = "/getUserContacts", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        List<User> getUserContacts();
    }
}
