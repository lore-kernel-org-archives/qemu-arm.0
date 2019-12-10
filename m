Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5503264lff;
        Tue, 10 Dec 2019 00:26:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbWNt9C8iOuRk4wa/Y6DtciTsTNoanQtSukn9uE/kGzIB8iKexhcpNBihJo/VheUeSkONV
X-Received: by 2002:a05:6808:14d:: with SMTP id h13mr3113468oie.58.1575966405532;
        Tue, 10 Dec 2019 00:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575966405; cv=none;
        d=google.com; s=arc-20160816;
        b=WFhEp01P/8BB29SpPxV7Us2cWQztThloBPsSM2Xwd+NKFX1Cs2uNlZakoAEsbrRrZc
         ZsvhXVWdUCk3Atc6COaFXI1ArPihgWuncPmBOgYv1qH2xEXygkJCQcQF6lGfOHJsGYzB
         AzwcrZGFtCg2Y/vTOm0h8oaC5FgOjuP2g6F37ekb0z6gnKMVI4jUv+As+D1S4Lnz2doU
         HM5Qpemojq3otJ82XE7RhtSFOmMHdn9MYl3/Bjkk7M8GBZYtMSHSc4AaPxcOA31SDsJf
         ehaPWfu5TPH551ZKtXG72C03UnTyWJKl7Y/xnpvFeZoEswCgypK6PIZKxMRF2lCOp0Ag
         PU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dMG+X4ie8KeFqsnRejYKO/bvF4tzP5FgFVUdCQ74kK4=;
        b=a9cZg/dQeJq3/t3NQX3yElTwBOstsjExw0WtB3QA1qcDCTh+x0q2eNP3DKmYkH3+1J
         3n+AXONXDSh7Qvg3lDIlJRVG5ZZtTkVuGbO3vxf7tJ3o96FMZSZJen8DfEmVvgW6OvvS
         MqgmBIzkPPlcn4tm59Fe07yeG0cwP2HZvqoyuWzhoHdWvXRR8N46VsfAFVQ+MTYMlCDJ
         SEVvSB/xbCCqfhIXzbAOIU8yEyn7YZiVOpHcDxxtsTjPiWit6yHQQvY92Zx2EzmBDBoE
         xFbJycfZoBJuQIS2GPV8QrTq5Q1x3hbr6wktQv4LkgNGrnw0pS9WgoAyPCnAR2Aisz6C
         kmOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bxr+jKob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si1475822otp.212.2019.12.10.00.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 00:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bxr+jKob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieaqy-0005og-KO
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 03:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ieaqp-0005n0-Mq
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 03:26:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ieaqn-0004pR-JT
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 03:26:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36148
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ieaqn-0004p9-GX
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 03:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575966392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMG+X4ie8KeFqsnRejYKO/bvF4tzP5FgFVUdCQ74kK4=;
 b=Bxr+jKobDgvjLTe9YCPJFGGTyDEa7+KxPyLAk5XzwSq+qD8itFbU1ovx4Z1KVtwPzlBDAH
 oTQq0F+23754D9t/vnWr/k6wX+drjd2I0YNX9/VAdzqaO/UbqsePfabadAOmcNFz2l/q6f
 FGj/oHNlU42M7Vx6Wl4a/ZRLhZ91OSk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-5oKwWILCMUq1lG4TCTEZpA-1; Tue, 10 Dec 2019 03:26:29 -0500
Received: by mail-wm1-f69.google.com with SMTP id l13so705868wmj.8
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 00:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/e05jDBikp/tjsEQDo5mgfhNu4dFe2AjTV/O+YQRg74=;
 b=B+lcF7+OI8vzMM6bnFfM1g36+TsTW+TX74B9qP5b07mdIhyniY33TtuJjiUGfigiJz
 yPGLdzf9Rhn85YLoXsBaIo5E79ESx5vNEelUc5ist/1z8k0j1I7grfzlQK4aKz38ttmh
 aHPbJnHfpeGpqcRHcELToCfe8ykio81/A19Bmyhk/RLKbfKMZi6Ala9tqRH41jb/FREk
 U42KoJ4hUWkTGT++aYJiFlRPf867HdTgEGGp8L2sXVzb0OembXhmPdhZcHqrszTywWhF
 bOs+LpVDc3JFsQ8Mc7lkRBNYjNSBGMKXP+3oocya4AIyRC/8gyz+r6bGx6KUS9RQ6ynJ
 hNyA==
X-Gm-Message-State: APjAAAWQpkc+bWnM7TWapA+tDFXl+QpYd6f/V9jNMDVUzWLjKeRrcNUs
 WEgUfWiKwZ7+0VBTJdplqnQf/8CiN6AMf3P+vYBK1eNlhDh2RZzCQu3Vfmy37CmoAxAD33GU1Bc
 fvIc+gOGmhgYW
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr3870490wml.31.1575966388264; 
 Tue, 10 Dec 2019 00:26:28 -0800 (PST)
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr3870452wml.31.1575966387806; 
 Tue, 10 Dec 2019 00:26:27 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id w188sm2343378wmg.32.2019.12.10.00.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 00:26:27 -0800 (PST)
Subject: Re: [PATCH 00/10] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <f54375da-4383-04c5-d57c-3a2f6ff46189@redhat.com>
 <CAPan3WrAgWZF1JvSAe=nWUb4rvN6qjfC6JDCnH2P6xmBuitn5w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <74df65db-1f84-62ba-6d01-edf765fd1dc2@redhat.com>
Date: Tue, 10 Dec 2019 09:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WrAgWZF1JvSAe=nWUb4rvN6qjfC6JDCnH2P6xmBuitn5w@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 5oKwWILCMUq1lG4TCTEZpA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DoEPplF3WTvZ

On 12/9/19 10:37 PM, Niek Linnenbank wrote:
> Hi Philippe,
>=20
> On Tue, Dec 3, 2019 at 9:47 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com=20
> <mailto:philmd@redhat.com>> wrote:
>=20
>     On 12/2/19 10:09 PM, Niek Linnenbank wrote:
>      > Dear QEMU developers,
>      >
>      > Hereby I would like to contribute the following set of patches to
>     QEMU
>      > which add support for the Allwinner H3 System on Chip and the
>      > Orange Pi PC machine. The following features and devices are
>     supported:
>      >
>      >=C2=A0 =C2=A0* SMP (Quad Core Cortex A7)
>      >=C2=A0 =C2=A0* Generic Interrupt Controller configuration
>      >=C2=A0 =C2=A0* SRAM mappings
>      >=C2=A0 =C2=A0* Timer device (re-used from Allwinner A10)
>      >=C2=A0 =C2=A0* UART
>      >=C2=A0 =C2=A0* SD/MMC storage controller
>      >=C2=A0 =C2=A0* EMAC ethernet connectivity
>      >=C2=A0 =C2=A0* USB 2.0 interfaces
>      >=C2=A0 =C2=A0* Clock Control Unit
>      >=C2=A0 =C2=A0* System Control module
>      >=C2=A0 =C2=A0* Security Identifier device
>=20
>     Awesome!
>=20
>      > Functionality related to graphical output such as HDMI, GPU,
>      > Display Engine and audio are not included. Recently released
>      > mainline Linux kernels (4.19 up to latest master) and mainline U-B=
oot
>      > are known to work. The SD/MMC code is tested using bonnie++ and
>      > various tools such as fsck, dd and fdisk. The EMAC is verified
>     with iperf3
>      > using -netdev socket.
>      >
>      > To build a Linux mainline kernel that can be booted by the Orange
>     Pi PC
>      > machine, simply configure the kernel using the sunxi_defconfig
>     configuration:
>      >=C2=A0 =C2=A0$ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make m=
rproper
>      >=C2=A0 =C2=A0$ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make s=
unxi_defconfig
>      >
>      > To be able to use USB storage, you need to manually enable the
>     corresponding
>      > configuration item. Start the kconfig configuration tool:
>      >=C2=A0 =C2=A0$ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make m=
enuconfig
>      >
>      > Navigate to the following item, enable it and save your
>     configuration:
>      >=C2=A0 =C2=A0Device Drivers > USB support > USB Mass Storage suppor=
t
>      >
>      > Build the Linux kernel with:
>      >=C2=A0 =C2=A0$ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make -=
j5
>      >
>      > To boot the newly build linux kernel in QEMU with the Orange Pi
>     PC machine, use:
>      >=C2=A0 =C2=A0$ qemu-system-arm -M orangepi -m 512 -nic user -nograp=
hic \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel /path/to/linux/arch/arm/boot/zIm=
age \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-append 'console=3DttyS0,115200' \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-dtb /path/to/linux/arch/arm/boot/dts/su=
n8i-h3-orangepi-pc.dtb
>      >
>      > Note that this kernel does not have a root filesystem. You may
>     provide it
>      > with an official Orange Pi PC image [1] either as an SD card or as
>      > USB mass storage. To boot using the Orange Pi PC Debian image on
>     SD card,
>      > simply add the -sd argument and provide the proper root=3D kernel
>     parameter:
>      >=C2=A0 =C2=A0$ qemu-system-arm -M orangepi -m 512 -nic user -nograp=
hic \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel /path/to/linux/arch/arm/boot/zIm=
age \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-append 'console=3DttyS0,115200 root=3D/=
dev/mmcblk0p2' \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-dtb
>     /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0-sd OrangePi_pc_debian_stretch_server_li=
nux5.3.5_v1.0.img
>      >
>      > Alternatively, you can also choose to build and boot a recent
>     buildroot [2]
>      > using the orangepi_pc_defconfig or Armbian image [3] for Orange
>     Pi PC.
>=20
>     Richard, trying the Armbian image from
>     https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/ I get:
>=20
>     $ arm-softmmu/qemu-system-arm -M orangepi -m 512 -nic user \
>      =C2=A0 =C2=A0-append 'console=3DttyS0,115200' \
>      =C2=A0 =C2=A0-kernel boot/vmlinuz-4.20.7-sunxi \
>      =C2=A0 =C2=A0-dtb usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc=
.dtb \
>      =C2=A0 =C2=A0-serial stdio -d unimp
>     Uncompressing Linux... done, booting the kernel.
>     rtc: unimplemented device write (size 4, value 0x16aa0001, offset 0x0=
)
>     rtc: unimplemented device read (size 4, offset 0x0)
>     rtc: unimplemented device read (size 4, offset 0x0)
>     rtc: unimplemented device read (size 4, offset 0x8)
>     qemu-system-arm: target/arm/helper.c:11359: cpu_get_tb_cpu_state:
>     Assertion `flags =3D=3D rebuild_hflags_internal(env)' failed.
>     Aborted (core dumped)
>=20
>=20
> I'm trying to reproduce the error you reported here with my patch set on=
=20
> latest master,
> but so far without any result. The host OS I'm using is Ubuntu 18.04.3=20
> LTS on x86_64.
> I ran several times using the same 4.20.7-sunxi kernel and same command=
=20
> line.
>=20
> Some questions that might help:
> 1) Are there any specific steps you did in order to produce this error?

I build QEMU with:

./configure --enable-trace-backends=3Dlog --extra-cflags=3D-ggdb --enable-d=
ebug

> 2) Could this be a known / existing issue?
> 3) How many times did you see this error?

Always

> 4) Are you also using Ubuntu 18.04.3 LTS on x86_64, or a different host O=
S?

Host is Fedora 30.

>=20
> Regards,
> Niek

