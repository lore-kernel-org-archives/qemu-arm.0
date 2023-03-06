Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4679376ejc;
        Mon, 6 Mar 2023 06:03:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/XxHZ/zR+V/8OYXySbtlwiibA1J9u2iGsUGNMjE4X3xXfSDbO7j9QiZzo3PHBJeWG/PPuK
X-Received: by 2002:a2e:87c4:0:b0:293:1b3e:985f with SMTP id v4-20020a2e87c4000000b002931b3e985fmr2931953ljj.24.1678111419162;
        Mon, 06 Mar 2023 06:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678111419; cv=none;
        d=google.com; s=arc-20160816;
        b=pBarkjZvB9Jnb3v+UEwn2uVx8CO7YcHD5EZi75O8RY/Vwk4t6h1ZbBwh4PGBTK+v3S
         tCCKj2Fe02tndGOBCY3z83/ZwS4ny7TOlsHKwYC/dSdAeY5mW2BalvlBbL0OQ/KdJl8q
         GvoiagB7VZfDIUBMT+IDn17jTEipckGrUCCvCTrmushhKyPPv/jBIpX/yl0vtJ56BdTq
         0wCshaBntd1V5Wov5vhKu4TM+fsohysp+2hR1U/le/bkbt14WKYdCcpENjYWR7Xrmrdx
         t2nM1aHsySLMb9iv9vz/PsF9zhfmiAEHjicUg2BmgcZgiGDS29Gzv4HGzTJreVSduyvX
         VDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=n+SFJSTjmlSeqC1OVYw4FuqPUs+9/63fR+ScS00qouI=;
        b=IVNy7+ozOUPsmYCfTj/h5wDNn/oz/JLLxgV5Jx7EY0ZlkNl83aE6xVNr2zAzRfUiim
         VcexuWVDCEB4AKE5FgnrXUP33JEP7WSjp0xsgtjzw1RpwtBJ1c0HcZVs4sCvuC8Cs/BD
         yzyDpzNbh9gL4Ma6yrwE9eQqao6p3Q3LVXzpwyKI0frLru+c5+6VgcuZrjLo7Hbsehkk
         2eBNtB1ay08BAxUrlTkzw5iH/Koa56kLsxrJAEKJmM0b62WbNOJbofTCW975CtYVNcnX
         nPHpTO8qHTZwpJsnrVL4jXjN4IoKbQdz46X8gdxWLnM0M+yjf7UvppIC7mNza4OkF57l
         UFFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HA/oGUEA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a2e7006000000b002958bf5c045si4193249ljc.105.2023.03.06.06.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HA/oGUEA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBR1-0002Nf-NU; Mon, 06 Mar 2023 09:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZBQv-0002C8-LJ
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZBQt-0006ne-8f
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678111397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n+SFJSTjmlSeqC1OVYw4FuqPUs+9/63fR+ScS00qouI=;
 b=HA/oGUEADQWDttcCDbghE1lipurDS0K7mWuvQW5sEL65bM4rJg8vU+oJsH4y6CvDK65Xdh
 wIh0kqtSnC8rnhGggJeZrKJevxVufNxLiApdH69w0t5XiFC5bbV9ZX1rVKmEquR5NXFJ6a
 5cwlShT++AUYODBBTDoZD6lz2OyvToY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-KHWfGmiTMTig5TDzkTvAtg-1; Mon, 06 Mar 2023 09:03:15 -0500
X-MC-Unique: KHWfGmiTMTig5TDzkTvAtg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so14134813ede.11
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 06:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n+SFJSTjmlSeqC1OVYw4FuqPUs+9/63fR+ScS00qouI=;
 b=n5bMfzBTACto0dEW8F52cwnPl9dZTDZSUlbX0BYz4Fl4C4WbNtffCOy7IoGNiFFA2j
 dqwVRRgnY9cbY3+Y+kkA76Qk7PAls2pH+ya8EmOWNusK1yZMu9i2wtPQN+dMiXBlq+nz
 MyGIUndLiuftWsMIgOEIQ/ro+3K8UJqxGdBrdKH/dMC35mV13LZu+/loij3kb61jLdus
 01JWuA7Np709K97Fy1YNAqF3TeW29Luu3dykbnyrWUNM75scOmK6u5LaFmKbRoiA8BS5
 sbQTdPtYHOU2qQnMbLlfJRoRVy5iX0RHQCs4VWMBAbHPoH5OM2BAFx+l/j3uroDMFJWV
 BJkQ==
X-Gm-Message-State: AO0yUKVghWhSoewENqjg8+T3YeQt4k71wJ6MpdegO+sKvSJIF5M/if6I
 8dnFqI9jm7t4Lf4vuf1iUJJJZWrpuj2P5EUsXKFDuokAO7iFntBID0w9va+eQrbTRRxjGyWNPvm
 n0621w9h03oyCBjVdwP7zdzVDT+Ov
X-Received: by 2002:a50:d615:0:b0:4bc:aefd:da6c with SMTP id
 x21-20020a50d615000000b004bcaefdda6cmr5986787edi.8.1678111394197; 
 Mon, 06 Mar 2023 06:03:14 -0800 (PST)
X-Received: by 2002:a50:d615:0:b0:4bc:aefd:da6c with SMTP id
 x21-20020a50d615000000b004bcaefdda6cmr5986776edi.8.1678111393981; Mon, 06 Mar
 2023 06:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-14-marcandre.lureau@redhat.com>
 <3a828966-2032-a432-ad44-b8198fb95945@linux.ibm.com>
In-Reply-To: <3a828966-2032-a432-ad44-b8198fb95945@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Mar 2023 18:03:02 +0400
Message-ID: <CAMxuvaz_ij7aY0U=EpMiDg=sj7qaUZyky0w6Rr1WqETK9HYyNA@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] slirp: open-code qemu_socket_(un)select()
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Hanna Reitz <hreitz@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000088342b05f63bc144"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c+0A58WilEZw

--00000000000088342b05f63bc144
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 6, 2023 at 5:59=E2=80=AFPM Stefan Berger <stefanb@linux.ibm.com=
> wrote:

>
>
> On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > We are about to make the QEMU socket API use file-descriptor space only=
,
> > but libslirp gives us SOCKET as fd, still.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   net/slirp.c | 10 +++++++---
> >   1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/slirp.c b/net/slirp.c
> > index a7c35778a6..c33b3e02e7 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd,
> void *opaque)
>
> Shouldn't this int fd rather be a SOCKET s instead? Or do you get compile=
r
> warnings then?
>
>
Yes, you would get compiler warnings, because the "int fd" argument is from
the slirp API, whether it is posix or win32.


> >   #ifdef WIN32
> >       AioContext *ctxt =3D qemu_get_aio_context();
> >
> > -    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
> > +    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
> >                          FD_READ | FD_ACCEPT | FD_CLOSE |
> > -                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
> > +                       FD_CONNECT | FD_WRITE | FD_OOB) !=3D 0) {
> > +        error_setg_win32(&error_warn, WSAGetLastError(), "failed to
> WSAEventSelect()");
> > +    }
> >   #endif
> >   }
> > >   static void net_slirp_unregister_poll_fd(int fd, void *opaque)
>
> Same here.
>
> >   {
> >   #ifdef WIN32
> > -    qemu_socket_unselect(fd, NULL);
> > +    if (WSAEventSelect(fd, NULL, 0) !=3D 0) {
> > +        error_setg_win32(&error_warn, WSAGetLastError(), "failed to
> WSAEventSelect()");
> > +    }
> >   #endif
> >   }
> >
>
>

--00000000000088342b05f63bc144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6, 2023 at 5:59=E2=80=
=AFPM Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@li=
nux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 2/21/23 07:47, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"=
_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; We are about to make the QEMU socket API use file-descriptor space onl=
y,<br>
&gt; but libslirp gives us SOCKET as fd, still.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/slirp.c | 10 +++++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/slirp.c b/net/slirp.c<br>
&gt; index a7c35778a6..c33b3e02e7 100644<br>
&gt; --- a/net/slirp.c<br>
&gt; +++ b/net/slirp.c<br>
&gt; @@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, v=
oid *opaque)<br>
<br>
Shouldn&#39;t this int fd rather be a SOCKET s instead? Or do you get compi=
ler warnings then?<br>
<br></blockquote><div><br></div><div>Yes, you would get compiler warnings, =
because the &quot;int fd&quot; argument is from the slirp API, whether it i=
s posix or win32.</div><div>=C2=A0 <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt;=C2=A0 =C2=A0#ifdef WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AioContext *ctxt =3D qemu_get_aio_context();=
<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 qemu_socket_select(fd, event_notifier_get_handle(&amp;c=
txt-&gt;notifier),<br>
&gt; +=C2=A0 =C2=A0 if (WSAEventSelect(fd, event_notifier_get_handle(&amp;c=
txt-&gt;notifier),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 FD_READ | FD_ACCEPT | FD_CLOSE |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0FD_CONNECT | FD_WRITE | FD_OOB, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0FD_CONNECT | FD_WRITE | FD_OOB) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(&amp;error_warn, WSAGetL=
astError(), &quot;failed to WSAEventSelect()&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0static void net_slirp_unregister_poll_fd(int fd, void=
 *opaque)<br>
<br>
Same here.<br>
<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#ifdef WIN32<br>
&gt; -=C2=A0 =C2=A0 qemu_socket_unselect(fd, NULL);<br>
&gt; +=C2=A0 =C2=A0 if (WSAEventSelect(fd, NULL, 0) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(&amp;error_warn, WSAGetL=
astError(), &quot;failed to WSAEventSelect()&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000088342b05f63bc144--

