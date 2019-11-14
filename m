Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5008094wrr;
        Wed, 13 Nov 2019 21:12:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzlmaUgAs7NFlVK2o+iA+Xu7DAEDMNXCGJ/zrCRlyv3DAc9jvtAUH6/QN2sU77UDK9b49bL
X-Received: by 2002:a05:620a:149a:: with SMTP id w26mr5846861qkj.361.1573708331848;
        Wed, 13 Nov 2019 21:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573708331; cv=none;
        d=google.com; s=arc-20160816;
        b=YmcI8INdPpUlCW7eZswPxtq4QhD7yaPAkj/rIhPqFuLuPbiWxj2ifUtmBR5jJuGWAP
         HdQwCi8+47e9kpbrTcQ0YuyOoA/3GNwrijzP8Oy1HUxQfuPN72tbcY8DE0DI5Sd4yJ34
         xgn4t62SDVtJ2/RIg5E4yT534znkgICRqmrFOoSOeDpOv+ovQXiVzzRqimeEihFJApv2
         kXhWYw+d4StEhTwCZODFfeGvU/mKcpd82RiOqrF9XhjnAjVzocjcPv95EvOge45XKq8e
         NoNM87reSmw3ugxdBHI0TuyivYHgCTd41bqD5mG/CHiy6CsNm+FAuKYmprma9xRI2EJ1
         x+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qurGMs96yYd/u+W79GcEmwcPbKTUkpo4qilX3j6mjFY=;
        b=U9ok7/4WLW/mcLLNAOjkSeePSvqVhKw/arcXGHl+wjTLCIidxJK6ojP0n76ijvhw2U
         jbOdIkupk218ErJET3LeTBE37L5QxLsKymxPFfsaJfXjA3KNfw4btqbI3GYxmh+oK+dT
         Xk6L2wskXRXSZn9lkJRcTeYJFibfHr9mkDjcnMdgJQJKE0+UL4he3n0Uj8U8SEeuRqew
         FZyVOAWsab0xplWb34YQo/lEpeBiFjWVD5O6GPnT9FytUxz0uMKVyidgX2hkWEfmlMGN
         T+eyfDXjgOlX/6iXazTzA4u7QpbIvLliZ1CXXgIxRjklFLa2MaxrVq/znGZOhTt5tbNA
         qn4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@vayavyalabs.com header.s=vayavyalabs header.b=MDgpTeyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si2663574qkd.13.2019.11.13.21.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2019 21:12:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@vayavyalabs.com header.s=vayavyalabs header.b=MDgpTeyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iV7QR-0003aG-AS
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 00:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pratikp@vayavyalabs.com>) id 1iV7Q7-0003aA-GS
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 00:11:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pratikp@vayavyalabs.com>) id 1iV7Q6-0004JW-6l
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 00:11:51 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:39587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pratikp@vayavyalabs.com>)
 id 1iV7Q6-0004HU-0G
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 00:11:50 -0500
Received: by mail-ot1-x32d.google.com with SMTP id w24so3317184otk.6
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2019 21:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:from:date:message-id:subject:to;
 bh=qurGMs96yYd/u+W79GcEmwcPbKTUkpo4qilX3j6mjFY=;
 b=MDgpTeyDMlrm4sAPlj8ng1u8ol3+dXYFnETWjCeRLg62LyMBhkm2UbCHqzwpeR0Jnz
 ayu2+RmkybX3gQxG/LkB0AYVcAgKyoNIwP8q5cc8qy1EH1Q8HuMfOvXSemOTeTQRPaid
 UoIDOc7jA/B0K93eKW9FGjFelj8P0OSHiAR4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qurGMs96yYd/u+W79GcEmwcPbKTUkpo4qilX3j6mjFY=;
 b=nx+h1rzIQEUljiRVoVxS4iiek1tKy7KUm1GBaS4MEufNcu36YCLTNbIaUzBvkUyS1w
 cj/qywouW/REMlGfcKYUI9+8qvYP32nld3xAkYcpD7Rhr5qk0TxvIscZQnyKGN8rrK+u
 WDAs/MI+nWnXtkZttGonTzd+s2S3k7spocjpmV/FHq26l4WN7yzImc+1JyX9DYjzCNhi
 H5a48bFvIY0Q8acOt146fYj1jEygDsykTCOhWGvVPub+C/Ee5uWKJ+lwFLB30LgGEFe8
 8dLUp0RcelquyLAbl2R/JCdUO1QyqMAc/Lp2Qxy6Fn9wt96KB1S1UBdbCIxWJXsoAAT4
 wtxA==
X-Gm-Message-State: APjAAAVLnOgBlq+Y99P6HYpLirBd74rHk/GHFkovSpqVFpguHz5VWt7E
 j8/Dp+o0uqmrVFQCCkLXvrudwHqc344E+zyqxcK+v0Gp
X-Received: by 2002:a9d:7284:: with SMTP id t4mr6556722otj.259.1573708307943; 
 Wed, 13 Nov 2019 21:11:47 -0800 (PST)
MIME-Version: 1.0
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Thu, 14 Nov 2019 10:41:36 +0530
Message-ID: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
Subject: Qemu support for mcimx6ul-evk machine
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ace5ee059747842f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32d
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QiiUBQdaWCe3

--000000000000ace5ee059747842f
Content-Type: text/plain; charset="UTF-8"

Hi Support team,

Lately, I am trying to get Linux up on qemu-arm *mcimx6ul-evk* machine
using buildroot. I have generated all the images required for my target
machine. Following are the steps I followed for building images on
buildroot (*version: buildroot-2016.11.1*).

$ make freescale_imx6ulevk_defconfig
$ make nconfig

I have selected the packages required for my qemu build and then built the
images using command

$ make

in "*output/images"* I see the following images generated,
*boot.vfat,  imx6ul-14x14-evk.dtb,  rootfs.ext2,  rootfs.ext4,
rootfs.tar,  sdcard.img,  u-boot.bin,  u-boot.imx,  zImage*.

I am referring this <https://dzone.com/articles/an-arm-image-with-buildroot>
article to replicate the same for mcimx6ul-evk. I ran the below command to
boot Linux on my target machine

$ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage
-monitor stdio -drive file=output/images/rootfs.ext2,format=raw

I don't see Linux booting on the serial0 console without any logs. can
someone please help me how to resolve this? Or am I missing something here?

Note: The qemu(*version: qemu-4.1.0*) is built for arm target using below
commands.

$ ./configure --target-list=arm-softmmu --enable-sdl
$ make
$ sudo make install

Thanks & Regards,
Pratik

--000000000000ace5ee059747842f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Support team,<div><br></div><div>Lately, I am trying to=
 get Linux up on qemu-arm=C2=A0<b>mcimx6ul-evk</b> machine using buildroot.=
 I have generated all the images required for my target machine. Following =
are the steps I followed for building images on buildroot (<i>version: buil=
droot-2016.11.1</i>).=C2=A0</div><div><br></div><div><font face=3D"monospac=
e">$ make=C2=A0freescale_imx6ulevk_defconfig</font></div><div><font face=3D=
"monospace">$ make nconfig</font></div><div><font face=3D"monospace"><br></=
font></div><div><font face=3D"arial, sans-serif">I have selected the packag=
es required for my qemu build and then built the images using command</font=
></div><div><font face=3D"arial, sans-serif"><br></font></div><div><font fa=
ce=3D"monospace">$ make</font></div><div><br></div><div>in &quot;<i>output/=
images&quot;</i> I see the following images generated,</div><div><b>boot.vf=
at,=C2=A0 imx6ul-14x14-evk.dtb,=C2=A0 rootfs.ext2,=C2=A0 rootfs.ext4,=C2=A0=
 rootfs.tar,=C2=A0 sdcard.img,=C2=A0 u-boot.bin,=C2=A0 u-boot.imx,=C2=A0 zI=
mage</b>.<br></div><div><br></div><div>I am referring <a href=3D"https://dz=
one.com/articles/an-arm-image-with-buildroot" target=3D"_blank">this</a> ar=
ticle to replicate the same for=C2=A0mcimx6ul-evk. I ran the below command =
to boot Linux on my target machine</div><div><br></div><div><font face=3D"m=
onospace">$=C2=A0qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/ima=
ges/zImage -monitor stdio -drive file=3Doutput/images/rootfs.ext2,format=3D=
raw</font></div><div><font face=3D"monospace"><br></font></div><div><font f=
ace=3D"arial, sans-serif">I don&#39;t see Linux booting on the serial0 cons=
ole without any logs. can someone please help me how to resolve=C2=A0this? =
Or am I missing something=C2=A0here?</font></div><div><font face=3D"arial, =
sans-serif"><br></font></div><div><font face=3D"arial, sans-serif">Note: Th=
e qemu(<i>version: qemu-4.1.0</i>) is built=C2=A0for arm target using below=
 commands.</font></div><div><font face=3D"arial, sans-serif"><br></font></d=
iv><div><font face=3D"monospace">$ ./configure --target-list=3Darm-softmmu =
--enable-sdl</font></div><div><font face=3D"monospace">$ make</font></div><=
div><font face=3D"monospace">$ sudo make install</font></div><div><br></div=
><div><div><div dir=3D"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr">Thanks &amp; Regards,<div>Pratik</div></div></div></div></div></div>

--000000000000ace5ee059747842f--
