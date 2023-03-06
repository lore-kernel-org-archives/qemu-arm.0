Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4365868ejc;
        Sun, 5 Mar 2023 23:57:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/QSDgslQu+CeyCNDEFpcZSCLhQ8tjZ/wV8llc5vVSEQK7c23Ppt9zFyLs2YipoqYUR/ET2
X-Received: by 2002:a05:622a:451:b0:3b8:1be5:3bff with SMTP id o17-20020a05622a045100b003b81be53bffmr17734556qtx.26.1678089460310;
        Sun, 05 Mar 2023 23:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678089460; cv=none;
        d=google.com; s=arc-20160816;
        b=sYwTZ3hJ6DHW8pKpW6eVE4wk+KRMyFsi/DwQWOMwY+ZyuhDdxKZGspMQG/YGS8sGLR
         WdOQIlOsHYjZ6FoBDuIVQqLLSLG6HLGzm9/WrmWZq1CSHMffo0Q7cc3+JLGNznqa0qqM
         SFFw/OHj1DEZDi6x97X4n+/KuE0cJrPPEYGSTmBmh+V+sXHPO5AnPt+fdeDDbQK7Gn93
         YuwjjuQ8ZJ3tqEoArb+EnkZ2jhnY60+SYcuT4TbeJx7O8o5osZ7jbViAisZWG49TNx9f
         ZHrA8Q2LFAY5JKMztabpAwxCfh2pMNSyWbtDDEdVSD70C8Gfs9xosKVkz7pH3Cz0YlG4
         XwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Mo5NRFqqj7VFhwMPCDbBVwA07RQ77KPhZ8sQ6fb9zbU=;
        b=KhLBD7rYAjrT1DNORiOgFGSbDQ1YCLquK0Xmsho6VZsaPGAIPKY6o22JzcTEeUphZa
         X/Xp2OEj/UyWnTxtSmU0VnhvoauFKBUQBi7qgdVT7INaNokOxAHDWA5XOpYYVcj8InlS
         6kRKTcvCp8p2ODOQZa/BRC59oZG70rPGYl/Qu15/o9W0scmcgy+i4yreTnFoKR5CSCPH
         9u6+CQ3ZLAe2ovGqy73u8r0WBvBmXCw30WphtPP+J1tHMvzmTk7T+0EH2dB5hxCc33+q
         PGPP++FSsxMuqlPgD61DZwIr8lBmCEiACBf13c6I1a2NWJ1vCm97o7bhu7F02n7ydD6/
         /3Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avsOhLtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t81-20020a374654000000b0071d9bff7703si6366278qka.329.2023.03.05.23.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Mar 2023 23:57:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avsOhLtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZ5ik-0001F1-Nh; Mon, 06 Mar 2023 02:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ5ii-0001E2-CV
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 02:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ5ie-0004sh-4r
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 02:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678089434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mo5NRFqqj7VFhwMPCDbBVwA07RQ77KPhZ8sQ6fb9zbU=;
 b=avsOhLtUZX/DfiMka56XKVY4htf/DP0oCQxI+hR1FzIPW+WDOeHois7POW9vp5W3HWSHiM
 lIq69WXbFbPi9jWq9tCX3xr3j4qbhqTpLTv0ZiR1IAX3lXig+uWV5uKRQhGf5hhpbfA9ot
 DTINR3AyzQl6rUpYHlOsAXPBYqkqi6M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-CZJbJFM1OTOzFMpySL8swQ-1; Mon, 06 Mar 2023 02:57:13 -0500
X-MC-Unique: CZJbJFM1OTOzFMpySL8swQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso12673170edh.15
 for <qemu-arm@nongnu.org>; Sun, 05 Mar 2023 23:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mo5NRFqqj7VFhwMPCDbBVwA07RQ77KPhZ8sQ6fb9zbU=;
 b=5btsJF3ajzTt/Vof+nspsIxTmquz729AVxdOWiPGSR1WeDFvcr2WKB4rSEsARPqx4M
 bW6lzqwjASbrt0OH+HI+4CO5SquFjRYE+rC5KN/+L9W00PmrApC8LV9ta9nA+GBaF16m
 +P15CCkrpWsa19O52M18vG4MEi2aU00/rWa5tKJrsnbGLQTXBYcwi5qn4HLScV46f6bi
 AUBZRJuNFTGwAIDEhFgRNq8/DbMk6Av/KXDOeE06b7++mz3o1kPHTXLDOgEHmVoFEWdY
 LkKna4Lf5IpTXFTd9XpxJmP9+lnh0Lu4Ljb+ucS7i3ATnyjQj9A5Z3sTnY5WhS09bcsC
 Bm+A==
X-Gm-Message-State: AO0yUKU5ZWXE1+T4EJDCxbW2j17OSwL3j8l781UowQgivVo5gWtpzTFx
 gngGptJTGWqLkpBQlyKcRi3hTxYaO5eyfXZE2yWBiUYBU3uhixrk18T6tniyS+u7ZYfEmB9Blpo
 G9I9xHGB6x0HJ6ZaU0xrtLHwSA9j1
X-Received: by 2002:a17:906:64d:b0:8d1:57cf:ef3c with SMTP id
 t13-20020a170906064d00b008d157cfef3cmr4407953ejb.2.1678089431961; 
 Sun, 05 Mar 2023 23:57:11 -0800 (PST)
X-Received: by 2002:a17:906:64d:b0:8d1:57cf:ef3c with SMTP id
 t13-20020a170906064d00b008d157cfef3cmr4407932ejb.2.1678089431710; Sun, 05 Mar
 2023 23:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-13-marcandre.lureau@redhat.com>
 <bded165f-39de-c84e-38c4-755f99ec6f92@linux.ibm.com>
In-Reply-To: <bded165f-39de-c84e-38c4-755f99ec6f92@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Mar 2023 11:57:00 +0400
Message-ID: <CAMxuvax7uPYSB6FWiEDmoq3uFgN6hcKxaXYCKqeod=sMBk5vsA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] slirp: unregister the win32 SOCKET
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
Content-Type: multipart/alternative; boundary="0000000000007a8fcf05f636a405"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: lDZSKWdsx0+3

--0000000000007a8fcf05f636a405
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 2, 2023 at 10:45=E2=80=AFPM Stefan Berger <stefanb@linux.ibm.co=
m> wrote:

>
>
> On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Presumably, this is what should happen when the SOCKET is to be removed=
.
> > (it probably worked until now because closesocket() does it implicitly,
> > but we never now how the slirp library could use the SOCKET later)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   net/slirp.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/slirp.c b/net/slirp.c
> > index 0730a935ba..a7c35778a6 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -259,7 +259,9 @@ static void net_slirp_register_poll_fd(int fd, void
> *opaque)
> >
> >   static void net_slirp_unregister_poll_fd(int fd, void *opaque)
> >   {
> > -    /* no qemu_fd_unregister */
> > +#ifdef WIN32
> The majority of code seems to use _WIN32. Not sure what is 'right'.
>
>
Both should be correct. I think I like the "WIN32" version better though
(see also
https://stackoverflow.com/questions/662084/whats-the-difference-between-the=
-win32-and-win32-defines-in-c
)


> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>
>
thanks


> > +    qemu_socket_unselect(fd, NULL);
> > +#endif
> >   }
> >
> >   static void net_slirp_notify(void *opaque)
>
>

--0000000000007a8fcf05f636a405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 2, 2023 at 10:45=E2=80=
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
&gt; Presumably, this is what should happen when the SOCKET is to be remove=
d.<br>
&gt; (it probably worked until now because closesocket() does it implicitly=
,<br>
&gt; but we never now how the slirp library could use the SOCKET later)<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/slirp.c | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/net/slirp.c b/net/slirp.c<br>
&gt; index 0730a935ba..a7c35778a6 100644<br>
&gt; --- a/net/slirp.c<br>
&gt; +++ b/net/slirp.c<br>
&gt; @@ -259,7 +259,9 @@ static void net_slirp_register_poll_fd(int fd, voi=
d *opaque)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0static void net_slirp_unregister_poll_fd(int fd, void *opa=
que)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 /* no qemu_fd_unregister */<br>
&gt; +#ifdef WIN32<br>
The majority of code seems to use _WIN32. Not sure what is &#39;right&#39;.=
<br>
<br></blockquote><div><br></div><div>Both should be correct. I think I like=
 the &quot;WIN32&quot; version better though=C2=A0 (see also <a href=3D"htt=
ps://stackoverflow.com/questions/662084/whats-the-difference-between-the-wi=
n32-and-win32-defines-in-c">https://stackoverflow.com/questions/662084/what=
s-the-difference-between-the-win32-and-win32-defines-in-c</a>)</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com" tar=
get=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br>
<br></blockquote><div><br></div><div>thanks</div><div>=C2=A0<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 qemu_socket_unselect(fd, NULL);<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0static void net_slirp_notify(void *opaque)<br>
<br>
</blockquote></div></div>

--0000000000007a8fcf05f636a405--

