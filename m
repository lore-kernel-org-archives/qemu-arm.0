Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp59841lfg;
        Mon, 24 Feb 2020 00:55:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxD/DXthTqXQTnYC0wvS5FlEn6HK01WyXfc3Hb4QlaYfP4jrxOh9E4pYIjw4sXm2Om0/oOK
X-Received: by 2002:a05:620a:135c:: with SMTP id c28mr23081484qkl.19.1582534533161;
        Mon, 24 Feb 2020 00:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582534533; cv=none;
        d=google.com; s=arc-20160816;
        b=Q26VpmOh8TA0XVLYkSDLs+1rJbq4KcSkZ5NkPrBKFuzp8K13RQlPNqqCRFB8r9h+I8
         /u46mUHmrdV92ZizfhGGbSwRb+/dh10n1e/hN4B9xfTMKUHjmINuRoWAT3SCse9EtqdE
         33aB8u3Q40QM41bnHTZL1/TkMoAG4E8mUov9HslIRhfyWQr0uES4lqUjy5yg3Mq41ok3
         N90aEwIwU3hK18UH5KXab52hsUjRevH5LWDEsx9lIq+XdGQ5sFAFbbL91YqeR9XnEys4
         /9gcprLKEC0BAbR8Ys618xz8eNHYoeyYXYwVtMbEV7OIt27vA7LLScScNaZMMqYWC/rO
         JAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZkNmrMbSu3Nb0pRVSIntGehLRlG903huIbMFBQ4VT98=;
        b=E5rJcqfA0FxCM7Um3lIL3+yyVAPCRUH+1877/+/ki2nr5OB6qnpv37wCcNM+22/4WX
         Vps1UnCahOkc/D6+QRyICtmu6DybYWtTNg0oHWUq4H/4tSELqT43HFXkt4/R9uta4kFk
         uMVnvnN6op5FcD4ffgHuUHQWqD+mnFc5eJGvQ+bxsUpBAuBN6YcNnmJNM2DWzFlT6ixA
         UFvGRsJZNE6ONsFGkAfoltXVt98RkwTctZR8tokw+tF4lkV0udBrxAhy1tbZElrlgFL0
         7++Sca1AgYqzlni68BR5JfWmenPzfMGir2L/8BTPjhtQUK75qjhPgmTTIP9slMh8mzTV
         zfpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a+iWWYDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si5432058qtp.41.2020.02.24.00.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 00:55:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a+iWWYDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j69WW-00055R-K1
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 03:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j69WO-00054t-0M
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 03:55:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j69WM-0006JC-H7
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 03:55:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29612
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j69WM-0006Io-Dw
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 03:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582534522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkNmrMbSu3Nb0pRVSIntGehLRlG903huIbMFBQ4VT98=;
 b=a+iWWYDdRiRAiadgV5HQ/2xoT1LhGtRKqeK7GQ+sM3T97TENZrlER7hDRbbC12UxXbBtm5
 SrqL6kcmB/cdokeOUQJ7Ms2FxGP9CXJYdnxxEdFp6o3HGoKIo5zzzK/JqJBpfadyMGiloF
 J2zoIp69snU3H5LhIyS7U/ey6BNOr9Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-D59sYTfuMj2nEd1yhVcbkQ-1; Mon, 24 Feb 2020 03:55:20 -0500
X-MC-Unique: D59sYTfuMj2nEd1yhVcbkQ-1
Received: by mail-ed1-f70.google.com with SMTP id d21so6182984edy.3
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 00:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5fYMjZEHwxp9ijHOKIbEy/YprHO4ogLS6F+5dH+4mQE=;
 b=qO9UjGuPf1CvNiN8VZx0eXp4nSdJRJp/RedRpDK/yLkuClgmeT9jbnSdva7+tVzSJc
 uMXwOr3ZZ+9kziLOfUsVTnyCQIhyUP7hg5F/UomdFYER8ysO45u+2ABifDGqSdi9tWmp
 c5Ykun1XhEFrTYW+U//BvnS16Tcgnn1TLDTR18frAwGWqZ/w6OLw+kAf5dnVuAyAr1wn
 JI8FMHFh1gbUMIDUfO4exZ+hVbtomxZ8kCPu7bFanaKxmWK6ztuRtkfC2+a+90+QsEIJ
 wHUlW5QGwvucT7YkUN744k5bdowzIrm5MBKUvxalZhiI2Fsh/jdvwxmxXW8GnYLb2t1B
 b0uw==
X-Gm-Message-State: APjAAAWk519bIh2hx+vFFEXO6oYXoiKw2e2CniZ7C3RVC5It10YFuET1
 GBfVw9O/mdqP9dDbuuV5ZJFA8VKaiIBRfurbrVepQ+/J6LcgcQpGdWH0GPpZ6LYqV9YbIPSZ9YZ
 2nyu6mcOJbFR8
X-Received: by 2002:a05:6402:1347:: with SMTP id
 y7mr45778045edw.140.1582534518449; 
 Mon, 24 Feb 2020 00:55:18 -0800 (PST)
X-Received: by 2002:a05:6402:1347:: with SMTP id
 y7mr45778024edw.140.1582534518194; 
 Mon, 24 Feb 2020 00:55:18 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id sa9sm759075ejb.28.2020.02.24.00.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 00:55:17 -0800 (PST)
Subject: Re: [PATCH v2 12/13] hw/arm/raspi: Add the Raspberry Pi B+ machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-13-f4bug@amsat.org>
 <CAPan3Wr=hxEu_XdKWEYJAZXJY4hHf774O2UfsJd0OmCHc8X0OQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4d419e3f-9e85-c014-7cc7-b25544eb341f@redhat.com>
Date: Mon, 24 Feb 2020 09:55:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPan3Wr=hxEu_XdKWEYJAZXJY4hHf774O2UfsJd0OmCHc8X0OQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1mS6HTBpmcP

On 2/22/20 11:19 PM, Niek Linnenbank wrote:
> Hey Philippe,
>=20
> Very nice to see that the Raspberry 1 will be supported again, thanks=20
> for contributing this!
>=20
> I tried to bring up the machine using raspbian 2019-09-26. It ran=20
> throught the early kernel initialisation
> but for me it gets stuck at this point:
>=20
> ./arm-softmmu/qemu-system-arm -M raspi1b -kernel=20
> $HOME/raspi/boot/kernel.img -append 'printk.time=3D0=20
> earlycon=3Dpl011,0x20201000 console=3DttyAMA0 rootwait root=3D/dev/mmcblk=
0p2' \
> -dtb $HOME/raspi/boot/bcm2708-rpi-b-plus.dtb -m 512 -sd=20
> $HOME/raspi/2019-09-26-raspbian-buster-lite.img -serial stdio -s
>=20
> [ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0
> [ =C2=A0 =C2=A00.000000] Linux version 4.19.75+ (dom@buildbot) (gcc versi=
on 4.9.3=20
> (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1270 Tue Sep 24=20
> 18:38:54 BST 2019
> [ =C2=A0 =C2=A00.000000] CPU: ARMv6-compatible processor [410fb767] revis=
ion 7=20
> (ARMv7), cr=3D00c5387d
> [ =C2=A0 =C2=A00.000000] CPU: VIPT aliasing data cache, unknown instructi=
on cache
> [ =C2=A0 =C2=A00.000000] OF: fdt: Machine model: Raspberry Pi Model B+
> [ =C2=A0 =C2=A00.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
> [ =C2=A0 =C2=A00.000000] bootconsole [pl11] enabled
> [ =C2=A0 =C2=A00.000000] Memory policy: Data cache writeback
> [ =C2=A0 =C2=A00.000000] cma: Reserved 8 MiB at 0x1b800000
> [ =C2=A0 =C2=A00.000000] random: get_random_bytes called from=20
> start_kernel+0x8c/0x49c with crng_init=3D0
> [ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on.=C2=A0 T=
otal pages: 113680
> [ =C2=A0 =C2=A00.000000] Kernel command line: printk.time=3D0=20
> earlycon=3Dpl011,0x20201000 console=3DttyAMA0 rootwait root=3D/dev/mmcblk=
0p2
> Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> Memory: 434380K/458752K available (6973K kernel code, 635K rwdata, 2080K=
=20
> rodata, 464K init, 797K bss, 16180K reserved, 8192K cma-reserved)
> Virtual kernel memory layout:
>  =C2=A0 =C2=A0 vector =C2=A0: 0xffff0000 - 0xffff1000 =C2=A0 ( =C2=A0 4 k=
B)
>  =C2=A0 =C2=A0 fixmap =C2=A0: 0xffc00000 - 0xfff00000 =C2=A0 (3072 kB)
>  =C2=A0 =C2=A0 vmalloc : 0xdc800000 - 0xff800000 =C2=A0 ( 560 MB)
>  =C2=A0 =C2=A0 lowmem =C2=A0: 0xc0000000 - 0xdc000000 =C2=A0 ( 448 MB)
>  =C2=A0 =C2=A0 modules : 0xbf000000 - 0xc0000000 =C2=A0 ( =C2=A016 MB)
>  =C2=A0 =C2=A0 =C2=A0 .text : 0x(ptrval) - 0x(ptrval) =C2=A0 (6975 kB)
>  =C2=A0 =C2=A0 =C2=A0 .init : 0x(ptrval) - 0x(ptrval) =C2=A0 ( 464 kB)
>  =C2=A0 =C2=A0 =C2=A0 .data : 0x(ptrval) - 0x(ptrval) =C2=A0 ( 636 kB)
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0.bss : 0x(ptrval) - 0x(ptrval) =C2=A0 ( 798 k=
B)
> SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
> ftrace: allocating 25197 entries in 74 pages
> NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every=20
> 2147483647500ns
> clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff,=20
> max_idle_ns: 1911260446275 ns
> bcm2835: system timer (irq =3D 27)
> Console: colour dummy device 80x30
>=20
> Maybe it should switch to the graphical console here, but I dont see the=
=20
> boot splash logo either (when using -stdio instead of -nographic).
> With -M raspi2 and -dtb bcm2709-rpi-2-b.dtb the same raspbian image can=
=20
> fully boot to the login console.

Argh this is because I split this of a bigger series and didn't included=20
changes related to the GPU 'properties', sorry.

>=20
> Regards,
> Niek
>=20
>=20
>=20
> On Mon, Feb 17, 2020 at 12:51 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org=20
> <mailto:f4bug@amsat.org>> wrote:
>=20
>      =C2=A0 $ qemu-system-arm -M raspi1b -serial stdio \
>      =C2=A0 =C2=A0 =C2=A0 -kernel raspberrypi/firmware/boot/kernel.img \
>      =C2=A0 =C2=A0 =C2=A0 -dtb raspberrypi/firmware/boot/bcm2708-rpi-b.dt=
b \
>      =C2=A0 =C2=A0 =C2=A0 -append 'printk.time=3D0 earlycon=3Dpl011,0x202=
01000 console=3DttyAMA0'
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] Linux version 4.19.69+ (dom@buildbot=
) (gcc version
>     4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1261 Tue Sep
>     3 20:21:01 BST 2019
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] CPU: ARMv6-compatible processor [410=
fb767]
>     revision 7 (ARMv7), cr=3D00c5387d
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] CPU: VIPT aliasing data cache, unkno=
wn instruction
>     cache
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] OF: fdt: Machine model: Raspberry Pi=
 Model B
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] earlycon: pl11 at MMIO 0x20201000 (o=
ptions '')
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] bootconsole [pl11] enabled
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] Memory policy: Data cache writeback
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] cma: Reserved 8 MiB at 0x1b800000
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] random: get_random_bytes called from
>     start_kernel+0x8c/0x49c with crng_init=3D0
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] Built 1 zonelists, mobility grouping=
 on.=C2=A0 Total
>     pages: 113680
>      =C2=A0 [=C2=A0 =C2=A0 0.000000] Kernel command line: printk.time=3D0
>     earlycon=3Dpl011,0x20201000 console=3DttyAMA0
>      =C2=A0 Dentry cache hash table entries: 65536 (order: 6, 262144 byte=
s)
>      =C2=A0 Inode-cache hash table entries: 32768 (order: 5, 131072 bytes=
)
>      =C2=A0 Memory: 434380K/458752K available (6971K kernel code, 635K
>     rwdata, 2080K rodata, 464K init, 797K bss, 16180K reserved, 8192K
>     cma-reserved)
>      =C2=A0 ...
>=20
>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>     ---
>      =C2=A0hw/arm/raspi.c | 13 +++++++++++++
>      =C2=A01 file changed, 13 insertions(+)
>=20
>     diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>     index 3537a329ac..2d9f4e3085 100644
>     --- a/hw/arm/raspi.c
>     +++ b/hw/arm/raspi.c
>     @@ -324,6 +324,15 @@ static void
>     raspi_machine_class_common_init(MachineClass *mc,
>      =C2=A0 =C2=A0 =C2=A0mc->default_ram_size =3D board_ram_size(board_re=
v);
>      =C2=A0};
>=20
>     +static void raspi1b_machine_class_init(ObjectClass *oc, void *data)
>     +{
>     +=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);
>     +=C2=A0 =C2=A0 RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
>     +
>     +=C2=A0 =C2=A0 rmc->board_rev =3D 0x900032;
>     +=C2=A0 =C2=A0 raspi_machine_class_common_init(mc, rmc->board_rev);
>     +};
>     +
>      =C2=A0static void raspi2b_machine_class_init(ObjectClass *oc, void *=
data)
>      =C2=A0{
>      =C2=A0 =C2=A0 =C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);
>     @@ -348,6 +357,10 @@ static void
>     raspi3b_machine_class_init(ObjectClass *oc, void *data)
>=20
>      =C2=A0static const TypeInfo raspi_machine_types[] =3D {
>      =C2=A0 =C2=A0 =C2=A0{
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D MACHINE_TYPE_NAME("raspi1b"),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D TYPE_RASPI_MACHINE,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D raspi=
1b_machine_class_init,
>     +=C2=A0 =C2=A0 }, {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D MACHINE_TYPE_NAME("raspi2b"),
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D TYPE_RASPI_MACHINE,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =C2=A0=3D=
 raspi2b_machine_class_init,
>     --=20
>     2.21.1
>=20
>=20
>=20
>=20
> --=20
> Niek Linnenbank
>=20

