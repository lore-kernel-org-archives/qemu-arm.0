Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3228002njb;
        Tue, 10 Dec 2024 03:29:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+Xehd+MQ+wMI4Cfp5akZ8H8CGoJ1Mzy+nUj3jB0Udxwy+i+aFvEGxizj2GzQ4z70WSO1jkw1C4GQdtw==@linaro.org
X-Google-Smtp-Source: AGHT+IFmZAGsNABXpxPOI/e7rZvmdy3hK5MPFzQkf/1QXentug11eMEgzYE55/Lla+70iYjywNoF
X-Received: by 2002:a05:622a:8f:b0:467:64b9:4693 with SMTP id d75a77b69052e-46771e9afa2mr67012641cf.5.1733830151960;
        Tue, 10 Dec 2024 03:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733830151; cv=none;
        d=google.com; s=arc-20240605;
        b=ikZD7DvnfzpXARJUuqYhYZCg/ozI6YLMOGg/NZ11qt1lTu9H+CVXDWwM26ezVXF+yQ
         wCtwP9fRUbSZX23l7KSJ6kK/HHD9DxHjc1ECe3pZ5toSqay2d9E4WVOmeP9M3OPIoRwB
         osLBmy7gZTpRrRoI4s71PIq30uNxeRQRpXktEXNNbog+C+alVVVmE9UuIBXIWhc+nAwj
         f6mCju4G13OvLyWhxuDWLA7vFr3MNghWNniMCypxXRMN239QEly9naYik2YG6sJ3DBP0
         GXD2DjPSWJVoqiR1HLhPiBuaTkmrlbvSLncUEPkrncZ6BMef2wDh3JBOOUUuoYiN3rH9
         xHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=G2upt/6XfG8rRb+ORZkYBYsjF0vMgvUCoDjhiPvvgFI=;
        fh=HwrSv7/ZFmQSKTx/BjapUTlbuYYJ8VTw0arX6mqwvoc=;
        b=GsPZqJP3cApkJeEjmQ1n3IHic3ciy606zYGONMo7BthXVpMFNkaPVN7U2sW+LoRWsU
         Dd+SU+VR6XoB6qJ4KS9D5d3XfSJ5kOHmd4HP92X7blcGEZonaaLzaZJxDeuJurLG3UIZ
         ywN1Zd0rxLhhStxrRU46v44tnHn4yXBHhcBXv5EU/fYcpkCKyL2N8pbpBpzgBaH4AbU2
         n2WPtwV4m5Yk4TizS+XkM4oEwKA2dUOGAqp4/RS5riXNgEn5ifTxpemv4uSVcykHcECG
         /mbx8AhumfpQTdSWPw2Dl52iqO0U3SQYJiS1acp0C3dIOa8IBREz1lFJ2mhQ2EwXvqTF
         tC/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=FYH5RRsp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729840011si130030251cf.597.2024.12.10.03.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 03:29:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=FYH5RRsp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKyQ0-0002Sm-AV; Tue, 10 Dec 2024 06:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKyPy-0002Rz-BI
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 06:28:42 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKyPw-00049h-2M
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 06:28:42 -0500
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4aff31b77e8so1035881137.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 03:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733830118; x=1734434918;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G2upt/6XfG8rRb+ORZkYBYsjF0vMgvUCoDjhiPvvgFI=;
 b=FYH5RRspBX8erai/lwJtS2KXqWICby55SEXN4gZqA09UJw61aaLGEuD/x3zr/07M/z
 ph8ecbeSUowTtd5/L8viFiZHoU+pvLyWmSy1TsOwRUv9snl+Dh6iF03czg0EXwCbpIFl
 BMfcmLEN+6MIfP70f3e9UbTCyBwr5+8esyrTgDZZHJp8mU8E5gLHNb1WRFhd8w5arnjC
 zCxNFf0QodxutOoSBG+Uh/81hMGLFe+5Ly2oitSVxUw6GyMe5J4KcztNOuwF8vDMQ/1y
 6gkL+yh+fcO8R/aHaPcTpPAtyOfhCTRC6vdCH/BmNBripNmADNUGoD70dhh8B9ZxWhZK
 4Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733830118; x=1734434918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G2upt/6XfG8rRb+ORZkYBYsjF0vMgvUCoDjhiPvvgFI=;
 b=eZ6dGxGkfCSDaHsE6lZVEjK1dtUocOTbtzfiwrU+vgh0Eji0PtJ25u0KVF4qHcPkqV
 c5P5losPOw+Ts+Y4HacZQd+izm4dZ3H355agyQ2izub3RdHfuL8okKveDROj26PVURgL
 SWa5dbkXoJWSi2pL7ppMrK7uXEnk1SdHjnNVDmqxg2KOd56UmbhWw4dI80qRkqO4L5ce
 GTG/nLwsUcmwxxVxyUfzAngbg+pY1+pBD/DyXYzzj+O/3TM3hJFogYSPSFEPU/YWOYj/
 rKtTmqTr3/YH+dge7fHzgjaXkYILPeJqN6uhHd7VQCcj4guHdSPEonZQf+ijOailt2FO
 hq3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOrg0Ijqq56b61ORo2UqBXpJyTVEQ4dn484nA5V9457D8WNdNUD7FHbGwSUSQXc8FBYJdVm/mL7w==@nongnu.org
X-Gm-Message-State: AOJu0YwTCPSL+mL38cJ4WIgfrf0xGHtgSJiJfxQvEIdmliUR+vL8RERv
 qIxI0g0dQwLwC0rIei/aK7NYEYriMKnGtpv7eY/Vk6g1Z6hQeYy8Crt83z+N6pHzxaYyU6ToPyI
 hLbd9Y+BdIDoWx4nQWbI9pvTjqbmN+BngzzZi
X-Gm-Gg: ASbGnctrASUbF/S/Hfuhqq/nXYIna8IxOr6aAuFH/2RLyVSRKCupajnrIWGHoJDjBKG
 PPNvNeC8FECkM5V7waoD/ujQVg/UHEUmHDxA=
X-Received: by 2002:a05:6102:c04:b0:4af:e61d:e228 with SMTP id
 ada2fe7eead31-4b1160c2a31mr4063814137.6.1733830118625; Tue, 10 Dec 2024
 03:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-10-phil@philjordan.eu>
 <3d0d87b8-d86f-4411-b1dd-7e825ec237e4@linaro.org>
In-Reply-To: <3d0d87b8-d86f-4411-b1dd-7e825ec237e4@linaro.org>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Tue, 10 Dec 2024 12:28:27 +0100
Message-ID: <CAAibmn2ijkbOqy-oD9F_50N4WBHQ77JadenvDfFHtREv_ReUSw@mail.gmail.com>
Subject: Re: [PATCH 09/11] i386/hvf: Print hex pairs for each opcode byte in
 decode error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000529baa0628e8c8be"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::e33;
 envelope-from=phil@philjordan.eu; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: KBOiUwcLFeO+

--000000000000529baa0628e8c8be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Dec 2024 at 21:54, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
>
wrote:

> On 9/12/24 21:36, phil@philjordan.eu wrote:
> > From: Phil Dennis-Jordan <phil@philjordan.eu>
> >
> > Printing a sequence of bytes as hex with leading zeroes omitted just
> looks odd.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> >
> > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> > ---
> >   target/i386/hvf/x86_decode.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.=
c
> > index 6c7cfc820f..f8d37f2d53 100644
> > --- a/target/i386/hvf/x86_decode.c
> > +++ b/target/i386/hvf/x86_decode.c
> > @@ -30,7 +30,7 @@ static void decode_invalid(CPUX86State *env, struct
> x86_decode *decode)
> >   {
> >       printf("%llx: failed to decode instruction ", env->eip);
> >       for (int i =3D 0; i < decode->opcode_len; i++) {
> > -        printf("%x ", decode->opcode[i]);
> > +        printf("%02x ", decode->opcode[i]);
> >       }
> >       printf("\n");
>
> Maybe we should use monitor_printf() here?
>

Or perhaps snprintf it into a buffer, then change this=E2=80=A6


> >       VM_PANIC("decoder failed\n");
>
>
=E2=80=A6 to a VM_PANIC_EX() that also writes out the opcode buffer?

--000000000000529baa0628e8c8be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 9 Dec 2=
024 at 21:54, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lina=
ro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 9/12/24 21:36, <a href=3D"mailto:phil@philjorda=
n.eu" target=3D"_blank">phil@philjordan.eu</a> wrote:<br>
&gt; From: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjordan.eu" tar=
get=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; <br>
&gt; Printing a sequence of bytes as hex with leading zeroes omitted just l=
ooks odd.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br>
&gt; <br>
&gt; Signed-off-by: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjorda=
n.eu" target=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/i386/hvf/x86_decode.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode=
.c<br>
&gt; index 6c7cfc820f..f8d37f2d53 100644<br>
&gt; --- a/target/i386/hvf/x86_decode.c<br>
&gt; +++ b/target/i386/hvf/x86_decode.c<br>
&gt; @@ -30,7 +30,7 @@ static void decode_invalid(CPUX86State *env, struct =
x86_decode *decode)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%llx: failed to decode instruct=
ion &quot;, env-&gt;eip);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; decode-&gt;opcode_l=
en; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%x &quot;, decode-&gt;opcode=
[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%02x &quot;, decode-&gt;opco=
de[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\n&quot;);<br>
<br>
Maybe we should use monitor_printf() here?<br></blockquote><div><br></div><=
div>Or perhaps snprintf it into a buffer, then change this=E2=80=A6 <br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VM_PANIC(&quot;decoder failed\n&quot;);<br>
<br></blockquote><div>=C2=A0</div><div>=E2=80=A6 to a VM_PANIC_EX() that al=
so writes out the opcode buffer?<br></div></div></div>

--000000000000529baa0628e8c8be--
