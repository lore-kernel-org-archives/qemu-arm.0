Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6246212lff;
        Tue, 10 Dec 2019 11:17:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7jii825YHinP4YbZeIDJXQ+9OEXla/cpKtDbiRojeffaCNLXRl4aUTNjPfZDnfy3RDWD5
X-Received: by 2002:a37:4e86:: with SMTP id c128mr620246qkb.39.1576005462730;
        Tue, 10 Dec 2019 11:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576005462; cv=none;
        d=google.com; s=arc-20160816;
        b=ez4G1oH95q6bBbluALS3UvOpZpO4GMPAvlSd7IBR8MdFHNvsY/+wehou94lO5daBo4
         FctgUZVaGVq9Yc72b06AQvC2vo1gWpCq1HddQmz2K9bDrdFLhR+99wdr3Mc1CHmxUH7w
         MBvioxSLtfgVA+xmuljNva3/l4EzcZ7Aic60+TEC1qypZoNYJFVzs6gowgH9JnKmx7Q1
         F/X6DmXfQVLraMSIu6QKxkAPY0ixXOWSFgbUUfV8luYk3blTpZD2e7gJDCNkPg25EgNI
         hEcZCGkMGpZQx9vq2GdYowdhP626JZIn+QC2LgVig7W4eo2CkigsQD3DcTis+gWd75Q1
         6qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MD7YecZp3gunHf5drvkVKW7805f8VNuz6VEdbrGQghA=;
        b=CgjChA8En5I+Ef+35zMm7BiAVm1slt/fv1a4K20ml0sYADiDBBUeyvA7zcYimImIor
         zjq3XfTcrjs/l8zRiUJDGLPk27/7+GSJQb9/VfOluUX8sm24XmgDX6+JVEsCldKkfaf3
         UdsUMgikwRZLhT9sqoapUma3SGcb3KJO3YmJbBf9ThNYPL4aDvcr59gUFarQjcJGEXBX
         LmG65mqf9XFlklCcSqFbGWyAv9b6OrUjhE2DPtlZZ0MlEkQLC9HumAcHzx/g39Dn9o1G
         Mo0Oh+n2Ya6HFpCq1AVOUQP10E4loPT71iuWuyFQBhY4s9XnOQAmajWUlw8kAgDWioJ4
         o7mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i0KMhWl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z41si2576145qtb.134.2019.12.10.11.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 11:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i0KMhWl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iel0v-0006Gf-VD
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 14:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1iel0e-0006A5-QI
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:17:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1iel0d-0000ka-7P
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:17:24 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:32906)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1iel0a-0000ia-0d; Tue, 10 Dec 2019 14:17:20 -0500
Received: by mail-io1-xd43.google.com with SMTP id s25so5323235iob.0;
 Tue, 10 Dec 2019 11:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MD7YecZp3gunHf5drvkVKW7805f8VNuz6VEdbrGQghA=;
 b=i0KMhWl1rYgaUmevg5a5gU1Cn4e8YcTBFENVc5NjoDllpGlrbPb5bxa5jTSuZAtbZH
 E/4TKcs9qrvjkpKJotkVhnujB9qGGtAxiMWU7XK2wcgLgEO85cSxaLUQJedJwDcP0YYU
 /vKO8cgfqHffn6LsUcjQBX9m3oSfTXPcc4BY9iukK8qycCdRbNi4skmark/L4luKoSOP
 snA2udjJO1JrJiPjaHf2l5gzRFE+V3G+H0mcDAryS2f4SYJtXEaCUZjB2IiSKT5SGQbZ
 jCjXA0n2yIKy9S3Ey4PTgi8fSMVN9R5U9KNA5nWVORm8W8/5o3d9jKnysbieRElvJAtO
 0GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MD7YecZp3gunHf5drvkVKW7805f8VNuz6VEdbrGQghA=;
 b=V9VUdNFG2zhUY7XmL7ATPNVOJEXfFgqIli3ReCT/2WCxRTlzh09Tr4UpRKhWlAjnid
 4dpkVSl7UhNKubbi1RD480VWfdgd5kysOCmOpM8QRhUVxEunc1m5RlII8uHQ56L+Jat2
 cN4PNz/VuyTm6oPUi2LGCHjYaWL9Cny+BfKEuYFyNPFcQJZ93Rad7aSgWAb5w3DFvInz
 Nl0RcKj172qjOBWF2q/tlVsi/KPBB97KZvqJhHpDKtxPHslN8wquY54I42q3uZsqM169
 Hpn1LJS0mtUxN/rPOfKlHfoOFcJ7WiGeUDXWz7c8gLmmJ9gnCMZFrpVomwS8682+HlgT
 wEAQ==
X-Gm-Message-State: APjAAAV6/BkA1HoXy8RsvSi9ll63xrfcoRt8L4ThGP+/bNsDCF+nBVyD
 pPbnSiwMT7lJW5vheo/EwYFp6glsQ8S3WJ+x4HE=
X-Received: by 2002:a02:662a:: with SMTP id k42mr27760296jac.73.1576005439308; 
 Tue, 10 Dec 2019 11:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-2-nieklinnenbank@gmail.com>
 <70e9d4e8-49fb-02f9-23b4-d7cbf6e55eac@redhat.com>
In-Reply-To: <70e9d4e8-49fb-02f9-23b4-d7cbf6e55eac@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 10 Dec 2019 20:17:08 +0100
Message-ID: <CAPan3WryKW02OGGPnBZzGjE5_pvkm28=xDHvqwu317n0238h=Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw: arm: add Allwinner H3 System-on-Chip
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005fc6b305995e5c00"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hG1udECxvl6P

--0000000000005fc6b305995e5c00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Tue, Dec 10, 2019 at 10:02 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 12/2/19 10:09 PM, Niek Linnenbank wrote:
> > The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> > processor cores. Features and specifications include DDR2/DDR3 memory,
> > SD/MMC storage cards, 10/100/1000Mbit ethernet, USB 2.0, HDMI and
> > various I/O modules. This commit adds support for the Allwinner H3
> > System on Chip.
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
> [...]
> > +
> > +    /* UART */
> > +    if (serial_hd(0)) {
>
> As the uart0 is always mapped in the SoC, don't use 'if serial_hd()',
> instead map it regardless a console is connected.
>

Indeed, the UARTs should always be mapped for this SoC.
Noted, I'll solve this too for in the v2 patch update.

Regards,
Niek


>
> > +        serial_mm_init(get_system_memory(), AW_H3_UART0_REG_BASE, 2,
> > +                       s->irq[AW_H3_GIC_SPI_UART0], 115200,
> serial_hd(0),
> > +                       DEVICE_NATIVE_ENDIAN);
> > +    }
> > +
> > +    /* Unimplemented devices */
> > +    create_unimplemented_device("display-engine", AW_H3_DE_BASE,
> AW_H3_DE_SIZE);
> > +    create_unimplemented_device("dma", AW_H3_DMA_BASE, AW_H3_DMA_SIZE)=
;
> > +    create_unimplemented_device("lcd0", AW_H3_LCD0_BASE,
> AW_H3_LCD0_SIZE);
> > +    create_unimplemented_device("lcd1", AW_H3_LCD1_BASE,
> AW_H3_LCD1_SIZE);
> > +    create_unimplemented_device("gpu", AW_H3_GPU_BASE, AW_H3_GPU_SIZE)=
;
> > +    create_unimplemented_device("hdmi", AW_H3_HDMI_BASE,
> AW_H3_HDMI_SIZE);
> > +    create_unimplemented_device("rtc", AW_H3_RTC_BASE, AW_H3_RTC_SIZE)=
;
> > +    create_unimplemented_device("audio-codec", AW_H3_AC_BASE,
> AW_H3_AC_SIZE);
>
>

--=20
Niek Linnenbank

--0000000000005fc6b305995e5c00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10, 2019 at 10:02 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 12/2/19 10:09 PM, Niek Linnenbank wrote:<br>
&gt; The Allwinner H3 is a System on Chip containing four ARM Cortex A7<br>
&gt; processor cores. Features and specifications include DDR2/DDR3 memory,=
<br>
&gt; SD/MMC storage cards, 10/100/1000Mbit ethernet, USB 2.0, HDMI and<br>
&gt; various I/O modules. This commit adds support for the Allwinner H3<br>
&gt; System on Chip.<br>
&gt; <br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
[...]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* UART */<br>
&gt; +=C2=A0 =C2=A0 if (serial_hd(0)) {<br>
<br>
As the uart0 is always mapped in the SoC, don&#39;t use &#39;if serial_hd()=
&#39;, <br>
instead map it regardless a console is connected.<br></blockquote><div><br>=
</div><div>Indeed, the UARTs should always be mapped for this SoC.</div><di=
v>Noted, I&#39;ll solve this too for in the v2 patch update.</div><div><br>=
</div><div>Regards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 serial_mm_init(get_system_memory(), AW_H3=
_UART0_REG_BASE, 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0s-&gt;irq[AW_H3_GIC_SPI_UART0], 115200, serial_hd(0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DEVICE_NATIVE_ENDIAN);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Unimplemented devices */<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;display-engine&quot;,=
 AW_H3_DE_BASE, AW_H3_DE_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;dma&quot;, AW_H3_DMA_=
BASE, AW_H3_DMA_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;lcd0&quot;, AW_H3_LCD=
0_BASE, AW_H3_LCD0_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;lcd1&quot;, AW_H3_LCD=
1_BASE, AW_H3_LCD1_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;gpu&quot;, AW_H3_GPU_=
BASE, AW_H3_GPU_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;hdmi&quot;, AW_H3_HDM=
I_BASE, AW_H3_HDMI_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;rtc&quot;, AW_H3_RTC_=
BASE, AW_H3_RTC_SIZE);<br>
&gt; +=C2=A0 =C2=A0 create_unimplemented_device(&quot;audio-codec&quot;, AW=
_H3_AC_BASE, AW_H3_AC_SIZE);<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000005fc6b305995e5c00--
