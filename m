Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2939234lfg;
        Mon, 2 Mar 2020 14:22:01 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtI1o+JNZ6fCJ1dQ6crqZSyTUh6gg9YV5z0xwuBllonABw+pgqRsUW5cI+fF1epPuJb0Bk1
X-Received: by 2002:a37:b285:: with SMTP id b127mr1326889qkf.413.1583187721047;
        Mon, 02 Mar 2020 14:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583187721; cv=none;
        d=google.com; s=arc-20160816;
        b=lUBhkopFXyivrOKz0E5yLEUQSLtYdvcrXkvKiVUwlevYihqiSNh0nKy8F2xfOYTV5E
         Hdvvu612QNV+RG9HV/HRPFjhapCw5b+Psat+KKRxi+Mc5QrU2uLvPjrp8SbozDeF/4ui
         RIvamdtaIRPEyAfDoxdhZlcCIsyr0sX7hRhMFgsl20wbuIdK93XNunHYLXgnK5jWk53B
         Mt305LDVWmBYOqWrXKaDssc3heOXw3ou+uH4xlMhaa4VlWf230c/2sPj4Nd9f1Hc0HkE
         qs1SQFeU7dLpfvGl+tlIvLdQVCEvqc8+jzhN6MDKDakM7AAH2301jQXOPUXFra5bytPk
         twyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O0nm6twvES1OV6+jbGXO4+jNcXTeR0V4Bbun41/J21g=;
        b=Dk7QEEgVTc3VgAqCCalUQfP1nifE2pdTFIOAyMzs1PKC5w56CMEAd6AkiysfvkIF1S
         VJFidCc7sjuQBHwfQSHIEHkJAhHHCcsIeL+JB7LSy9lPTU6i6CJfHeEFIm7J039ifrpn
         PBdD1Sh+mdprzxR0++w3DwC2DULqwSjNwF0gFXCCqivQeqPD9lkZntic8x9rbnYe3m+d
         pXVZUUBp1cyrg8S6SiYWoFvNwlWqeIsCXgO/908Md8Ayp95fiy/fNfZY2urCkkEG0IHP
         +bRmmT2kv8RW+UBctlkjW4TiTOt1YpLSRhDWUc4YUB5nexHnKwGpFC1OBrJ7xMUsF8e3
         KUKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IwnXHVtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z188si7138843qkb.249.2020.03.02.14.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 14:22:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IwnXHVtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8tRo-0003xt-Hv
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 17:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j8tRf-0003xa-VE
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 17:21:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j8tRe-0002xD-NA
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 17:21:51 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:36444)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j8tRb-0002td-UE; Mon, 02 Mar 2020 17:21:48 -0500
Received: by mail-il1-x144.google.com with SMTP id b15so968667iln.3;
 Mon, 02 Mar 2020 14:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O0nm6twvES1OV6+jbGXO4+jNcXTeR0V4Bbun41/J21g=;
 b=IwnXHVtUjLC0ySATbVievCZ03j0mFdySUOXV0qdJFJ7kYCC/Y/xT4pk/AuyClAZDSD
 9j45Ijq8M18A+42qSPa4IdrA2jz3HwHZo82ie2V/V/yiIBLVB4sHIpWP+842n42Uy8um
 Vym0qzElAjaR65aeMa7j4a+AzLvAdMwg3OavLT7mUjkpOVl7d5/3Gr73epb/7TZzoBd9
 vNgvN4x+zlxowfkQLl23IOeCQv9BCMm1YZfnoUv8JZWlX6XEuYUIEnqktvfC5HKfM+xC
 47SZ6g1bYEYNw+dEg1eIcLV2lx9/8afR7A7fo6DQ/s/gNOKPvjVJMDg0RPOVuf9K0efR
 gC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O0nm6twvES1OV6+jbGXO4+jNcXTeR0V4Bbun41/J21g=;
 b=iNAdS8OFiQWa+C3ea0uBRf853F/lW2+NPYaLTVfgOFqT0Ym3SMJJQ0kjpnP2NZLc0o
 pf4TEqgaMhl2oC3+xgioqjJmbztCQ6PAynJPjCJ8/Gtdop0j1f709z0HbfUuv9WcBd8G
 cOTlxLXXZa/47ew1HFRdjqD0wKIPm5hI6aiqtn2taCaPGeZwnAmQnJEpp0vh729dECJy
 p5+DYxki6vYWKZMO+G3EJpsrudQoiD3u2dBCSjWnD4+4I6g60EV04dnTT9ZDvNqduDDK
 NL/8fp7gu8563/vQ2nP6ZHIdZflTSkhFh5M8rnF+j/9ylQLhfa4tMYKN+M0ALYjUYGJI
 UbgQ==
X-Gm-Message-State: ANhLgQ2kb/VOFw0CH2LWJz5khJJqltBh+WWaWpTwoOx7PfK4rDRuCngI
 0AtjG8xVABaaGs8PVxzhulmyRnVpmOJJGKR653I=
X-Received: by 2002:a92:aaca:: with SMTP id p71mr1710228ill.67.1583187706999; 
 Mon, 02 Mar 2020 14:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <CAFEAcA8uEd_RqNi6iQDxZmGaAGpYoy=bgXFJVj-ow0Ci_Vz+DQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8uEd_RqNi6iQDxZmGaAGpYoy=bgXFJVj-ow0Ci_Vz+DQ@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 2 Mar 2020 23:21:36 +0100
Message-ID: <CAPan3WqZ8p6ooSxnbYqE+wvNQ2NJETPLXeuaLLKQwskYaSxbNQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] hw/arm/cubieboard: correct CPU type and add
 machine argument checks
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e3785d059fe69c08"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AE5riiWGAH2p

--000000000000e3785d059fe69c08
Content-Type: text/plain; charset="UTF-8"

Hi Peter, Philippe,

On Mon, Mar 2, 2020 at 5:06 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 27 Feb 2020 at 22:01, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> >
> > These patches change the Cubieboard machine definition to use the
> > correct CPU type, which is ARM Cortex-A8 instead of ARM Cortex-A9.
> >
> > Additionally, add some sanity checks for the machine input
> > arguments in the initialization function.
> >
> > Niek Linnenbank (4):
> >   hw/arm/cubieboard: use ARM Cortex-A8 as the default CPU in machine
> >     definition
> >   hw/arm/cubieboard: restrict allowed CPU type to ARM Cortex-A8
> >   hw/arm/cubieboard: restrict allowed RAM size to 512MiB and 1GiB
> >   hw/arm/cubieboard: report error when using unsupported -bios argument
>
>
> Applied to target-arm.next, thanks. (I tweaked a couple of commit
> messages as mentioned in replies to those patches.)
>

Great, and thanks for your quick and detailed responses Peter.

And to be clear, these improvements came from the excellent reviews done by
Philippe on the Allwinner H3 patch series
which I submitted earlier. Since that series is quite big and will take
more time to complete, I thought it would be nice
to take a few of those improvements and meanwhile apply them to the other
similar boards as well.

Regards,
Niek

>
> -- PMM
>


-- 
Niek Linnenbank

--000000000000e3785d059fe69c08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter, Philippe,<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, 2020 at 5:06 PM=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydel=
l@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 27 Feb 2020 at 22:01, Niek Linnenbank &lt;<a href=3D"ma=
ilto:nieklinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; These patches change the Cubieboard machine definition to use the<br>
&gt; correct CPU type, which is ARM Cortex-A8 instead of ARM Cortex-A9.<br>
&gt;<br>
&gt; Additionally, add some sanity checks for the machine input<br>
&gt; arguments in the initialization function.<br>
&gt;<br>
&gt; Niek Linnenbank (4):<br>
&gt;=C2=A0 =C2=A0hw/arm/cubieboard: use ARM Cortex-A8 as the default CPU in=
 machine<br>
&gt;=C2=A0 =C2=A0 =C2=A0definition<br>
&gt;=C2=A0 =C2=A0hw/arm/cubieboard: restrict allowed CPU type to ARM Cortex=
-A8<br>
&gt;=C2=A0 =C2=A0hw/arm/cubieboard: restrict allowed RAM size to 512MiB and=
 1GiB<br>
&gt;=C2=A0 =C2=A0hw/arm/cubieboard: report error when using unsupported -bi=
os argument<br>
<br>
<br>
Applied to target-arm.next, thanks. (I tweaked a couple of commit<br>
messages as mentioned in replies to those patches.)<br></blockquote><div><b=
r></div><div>Great, and thanks for your quick and detailed responses Peter.=
</div><div><br></div><div>And to be clear, these improvements came from the=
 excellent reviews done by Philippe on the Allwinner H3 patch series</div><=
div>which I submitted earlier. Since that series is quite big and will take=
 more time to complete, I thought it would be nice</div><div>to take a few =
of those improvements and meanwhile apply them to the other similar boards =
as well.<br></div><div><br></div><div>Regards,</div><div>Niek<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000e3785d059fe69c08--
