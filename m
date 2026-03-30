Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CD7FF494B
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 06:53:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w76Um-0003f7-Dy; Mon, 30 Mar 2026 02:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1w76Ul-0003ep-MY
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 02:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1w76Uj-0002VF-1y
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 02:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774853583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLbww21pZiHN2WIuueS8p9qQpEMTdf0rmHSqoGzQQQo=;
 b=Z6Jv4XJq+W3Wa4d89/G42J/cYkipheVfgyNiAao53dDKAGLlvfHc2gRzBbEjmjwUHlJXnt
 MjbxNYxFiVCa4f28ST1/uXl5yUU8OzFCGNslaDo1jK1b3o45YonhZg7MkW42uVKHl2JTnl
 R0pp2n9O0C7AgYq7pfXHDDspcke1BUc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-dGukLrMFOxeipEUHlaCI8w-1; Mon, 30 Mar 2026 02:53:01 -0400
X-MC-Unique: dGukLrMFOxeipEUHlaCI8w-1
X-Mimecast-MFC-AGG-ID: dGukLrMFOxeipEUHlaCI8w_1774853580
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50939597b85so108103161cf.2
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 23:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774853580; x=1775458380;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLbww21pZiHN2WIuueS8p9qQpEMTdf0rmHSqoGzQQQo=;
 b=qIt1JnyhGO5PlOJ+8hB+sJ8AiWpPBhGSqv01S+KIyQSRE3+rWF1PEPmXIeYmYycKnc
 /uHs4dXktQdgjGI/Sf2St2rawui7MSOrjF2KS7M+U0zTkN8gNYC2SSztG8i31I1WaXC6
 318RTnFPAoZkE1ZInLvasEiUdevlCyBWePg58SPm7RctvkTdBZ23DPYHAvEXSWKnhqzV
 Tz3sjSVv3mqRpBa6H1fWj7gdQCMHZd84SvAikV7ZQHtXKQR+ZiblmGfOI6v/ejYiIuUr
 uSqGTCI1xK3uCkI1CCFac1uI82k/FT5dOX5h9q6cq63n3Zcy3e41kGqtAJC+MatI7HHy
 UguA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCCOYrjZ355KRxA2p8sVBjXOvrQNSwiA7xQlkGCgwfGxyql46Pz8lmZL8KJC6j+unFObhsh9l54A==@nongnu.org
X-Gm-Message-State: AOJu0YyiZq4+1BC27nurXBwkMfFpfP016iDJWuquGrnYLwHhv5h2JTCR
 SUGCYrRgfAHXXzDsvC0hD/PkL/xG1nwqer38DCRUQcPogNhcahsKuUhu/ouXDmL0P3wY3uCIMbe
 5l1guRyjfpkHBc6OVIKoKYMLdDx2QED6DZ3RSBUtTlCfafPQnTHmEt71QQHp0ItBllssg48GBx6
 ZegaH86M51NqsQst9TjkC8+nnOKQAl
X-Gm-Gg: ATEYQzyq7bcsmy1wxYx29NdiJZ+JREuQUujpsYANfw2+v5oJOjm0lcYLcs+tPjsp6RK
 /rmmrJlopGSjB3RPQFtW4uY2vEmsC2Fw0Mak60r5GvmsU6rFQqG3UBtyPFB1E56rEyTyuLWdWeN
 UnxLElkJhsHtJrlQwWSIXDFvf8004TNR4Ux2ziEqyPUCBV1+f60drHisek9dXVWjL0zoJyMzrCK
 veYxckG
X-Received: by 2002:ac8:5754:0:b0:509:4d26:25df with SMTP id
 d75a77b69052e-50ba39c1849mr147012201cf.66.1774853580522; 
 Sun, 29 Mar 2026 23:53:00 -0700 (PDT)
X-Received: by 2002:ac8:5754:0:b0:509:4d26:25df with SMTP id
 d75a77b69052e-50ba39c1849mr147011961cf.66.1774853580022; Sun, 29 Mar 2026
 23:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260327145012.907264-1-peter.maydell@linaro.org>
 <CAKmqyKMUaHQ2uiqVnT7M98AFenmZOGJd5AAShgtKt5RgDo8APg@mail.gmail.com>
In-Reply-To: <CAKmqyKMUaHQ2uiqVnT7M98AFenmZOGJd5AAShgtKt5RgDo8APg@mail.gmail.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Mon, 30 Mar 2026 09:52:49 +0300
X-Gm-Features: AQROBzCXE40WsDV_T-TLJrQn6B1LEDwJXzRbTAX9rpgTk5rJ71CwAci0IXeeaS0
Message-ID: <CAPMcbCqFHi=se+RRLJAeekaSxVCv7ft6vcRV-u=QGDCOWyRLRA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Use strcasecmp to parse boot-mode
 option values
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dnTycVpwae71DKs52MbfaujNJ54T2Mfxba-PybyEYYk_1774853580
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002a831b064e384d6a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1, RCVD_IN_VALIDITY_RPBL_BLOCKED=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--0000000000002a831b064e384d6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

On Mon, Mar 30, 2026 at 7:32=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com>
wrote:

> On Sat, Mar 28, 2026 at 12:51=E2=80=AFAM Peter Maydell <peter.maydell@lin=
aro.org>
> wrote:
> >
> > In zynq_set_boot_mode() where we parse the string the user has set
> > the boot-mode option to, we use strncasecmp(str, "qspi", 4) and so
> > on.  This is wrong, because it means that we will ignore any trailing
> > junk on the end of the option string, and handle
> >  -machine boot-mode=3DsdXYZZY
> > the same as
> >  -machine boot-mode=3Dsd
> >
> > In the documentation we say:
> >  Supported values are ``jtag``, ``sd``, ``qspi`` and ``nor``.
> > and that's obviously what we meant to implement.
> >
> > The correct tool for this job is a simple strcasecmp operation.
> > Switch to that.
> >
> > We use the g_ascii_strcasecmp() rather than plain strcasecmp()
> > because we're comparing ASCII strings here and don't want the
> > potentially locale-specific behaviour that strcasecmp() implies (and
> > we're trying to standardize on the glib function for this kind of
> > string comparison).
> >
> > Fixes: 7df3747c92d13 ("hw/arm/xilinx_zynq: Add boot-mode property")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> > Kostiantyn: I sent this patch out while it was on my mind, but
> > don't worry about conflicts with your series -- assuming your
> > patchset goes in first I'll fix this one up later.
> > ---
> >  hw/arm/xilinx_zynq.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> > index d43f36b718..9dcded9219 100644
> > --- a/hw/arm/xilinx_zynq.c
> > +++ b/hw/arm/xilinx_zynq.c
> > @@ -186,13 +186,13 @@ static void zynq_set_boot_mode(Object *obj, const
> char *str,
> >      ZynqMachineState *m =3D ZYNQ_MACHINE(obj);
> >      uint8_t mode =3D 0;
> >
> > -    if (!strncasecmp(str, "qspi", 4)) {
> > +    if (!g_ascii_strcasecmp(str, "qspi")) {
> >          mode =3D 1;
> > -    } else if (!strncasecmp(str, "sd", 2)) {
> > +    } else if (!g_ascii_strcasecmp(str, "sd")) {
> >          mode =3D 5;
> > -    } else if (!strncasecmp(str, "nor", 3)) {
> > +    } else if (!g_ascii_strcasecmp(str, "nor")) {
> >          mode =3D 2;
> > -    } else if (!strncasecmp(str, "jtag", 4)) {
> > +    } else if (!g_ascii_strcasecmp(str, "jtag")) {
> >          mode =3D 0;
> >      } else {
> >          error_setg(errp, "%s boot mode not supported", str);
> > --
> > 2.43.0
> >
> >
>
>

--0000000000002a831b064e384d6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Mar 30, 2026 at 7:32=E2=80=AFAM Alistair Francis &lt;<a hr=
ef=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Mar 28, 2026=
 at 12:51=E2=80=AFAM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lina=
ro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; In zynq_set_boot_mode() where we parse the string the user has set<br>
&gt; the boot-mode option to, we use strncasecmp(str, &quot;qspi&quot;, 4) =
and so<br>
&gt; on.=C2=A0 This is wrong, because it means that we will ignore any trai=
ling<br>
&gt; junk on the end of the option string, and handle<br>
&gt;=C2=A0 -machine boot-mode=3DsdXYZZY<br>
&gt; the same as<br>
&gt;=C2=A0 -machine boot-mode=3Dsd<br>
&gt;<br>
&gt; In the documentation we say:<br>
&gt;=C2=A0 Supported values are ``jtag``, ``sd``, ``qspi`` and ``nor``.<br>
&gt; and that&#39;s obviously what we meant to implement.<br>
&gt;<br>
&gt; The correct tool for this job is a simple strcasecmp operation.<br>
&gt; Switch to that.<br>
&gt;<br>
&gt; We use the g_ascii_strcasecmp() rather than plain strcasecmp()<br>
&gt; because we&#39;re comparing ASCII strings here and don&#39;t want the<=
br>
&gt; potentially locale-specific behaviour that strcasecmp() implies (and<b=
r>
&gt; we&#39;re trying to standardize on the glib function for this kind of<=
br>
&gt; string comparison).<br>
&gt;<br>
&gt; Fixes: 7df3747c92d13 (&quot;hw/arm/xilinx_zynq: Add boot-mode property=
&quot;)<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt; Kostiantyn: I sent this patch out while it was on my mind, but<br>
&gt; don&#39;t worry about conflicts with your series -- assuming your<br>
&gt; patchset goes in first I&#39;ll fix this one up later.<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/xilinx_zynq.c | 8 ++++----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c<br>
&gt; index d43f36b718..9dcded9219 100644<br>
&gt; --- a/hw/arm/xilinx_zynq.c<br>
&gt; +++ b/hw/arm/xilinx_zynq.c<br>
&gt; @@ -186,13 +186,13 @@ static void zynq_set_boot_mode(Object *obj, cons=
t char *str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ZynqMachineState *m =3D ZYNQ_MACHINE(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t mode =3D 0;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 if (!strncasecmp(str, &quot;qspi&quot;, 4)) {<br>
&gt; +=C2=A0 =C2=A0 if (!g_ascii_strcasecmp(str, &quot;qspi&quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D 1;<br>
&gt; -=C2=A0 =C2=A0 } else if (!strncasecmp(str, &quot;sd&quot;, 2)) {<br>
&gt; +=C2=A0 =C2=A0 } else if (!g_ascii_strcasecmp(str, &quot;sd&quot;)) {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D 5;<br>
&gt; -=C2=A0 =C2=A0 } else if (!strncasecmp(str, &quot;nor&quot;, 3)) {<br>
&gt; +=C2=A0 =C2=A0 } else if (!g_ascii_strcasecmp(str, &quot;nor&quot;)) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D 2;<br>
&gt; -=C2=A0 =C2=A0 } else if (!strncasecmp(str, &quot;jtag&quot;, 4)) {<br=
>
&gt; +=C2=A0 =C2=A0 } else if (!g_ascii_strcasecmp(str, &quot;jtag&quot;)) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s boot mode =
not supported&quot;, str);<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000002a831b064e384d6a--


