Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp50535lfg;
        Mon, 24 Feb 2020 00:42:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/SbJqSDvmm8RyWVYHh4NI+Fi8ZhpES2Vg5/pOimZcVAzXmKehjKWK7THstAeHsIHyUrAL
X-Received: by 2002:ac8:7484:: with SMTP id v4mr46775232qtq.19.1582533769363;
        Mon, 24 Feb 2020 00:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582533769; cv=none;
        d=google.com; s=arc-20160816;
        b=ug0WiLbtj7Bxiqa10TS2IvjO0tKNXGwJ0LM2HhZ7AOI6A8gFl4ZhWPNpgNr81HjSAx
         hXFmfZy5mLsgK/HXCfWCCtkq0Gol2bZFqFGMflikGNOGozMtf5EE65kFVlg/fRLd3a8h
         AxblKyCFjhPBAYQFhA/YAJcnTGIP61Ho6VyhBVzMGyAmK8BfyBl6wq/0bpNNHxpoGYL2
         kcRu38yVzDexqugZFy2C2y3f/TPHPJAzZdSWiixwohwGK2H4RWYRrSb8wb5xNqUfBF2o
         6L5wO8NIQKXZ3EqLRQSwacB/m6TQ+e6Z1WHaBzESD3NmgQItlzCCC80DAVijHnufrpxB
         RFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OwmCxfaSC8BnNrb2l2gUmkelLJJswti0t2MykcFmdug=;
        b=llCtCYnfjUjFJml7lSVcbrK9CogqQU4RpkHsiG9ji1kQGxKhVeGxZLu14zkAsTl+HE
         1sqvY24knHvqeMSHZPk00izmCElc4dH9KizqsMKCL8v2qsPWrJaxjM6gbFWZu+MtHBWn
         o/EAjf76q022WGmxIpniJYmXY5HaH2F7rLDeLAWcB3mTuE0zuhSaYGdoAkGzf+rEKJyR
         M/UcjNDDQRvwpHV/I8v2LS57kVJuuMcsEDvSx8mij1OAt0Pt9U1OWA1nhKoC+XtviRI1
         qPMJXHPK6FWXK9EqSOOz9lRMP1kgl91Vg2KpMYuVo5nJMTZaQSwitRNCECyESJRVhdqu
         q2DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ekU7BBiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si5476577qtn.202.2020.02.24.00.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 00:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ekU7BBiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j69KC-0006bB-Ql
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 03:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j69Iu-0005C0-Rf
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 03:41:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j69It-0003Sz-Lw
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 03:41:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44779
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j69It-0003S1-Hh
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 03:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582533686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwmCxfaSC8BnNrb2l2gUmkelLJJswti0t2MykcFmdug=;
 b=ekU7BBiClLbIH12RmFlgVdz2Mtz94455pYj+n8vDhadSSOAIpNdYmvz6B9uKDy0FBgaY2U
 1U+y2Yc8srtoZucBZCHLLxO/t0XeQNxeUVll1T0m85b6ZRu9xLSQtmGSEyqlsHxKRdw426
 EajrmtFZ+R3jJaZomI2B1aeqv7N3AJM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-QCnKiuNQMh-tnr11uIDwtw-1; Mon, 24 Feb 2020 03:41:24 -0500
X-MC-Unique: QCnKiuNQMh-tnr11uIDwtw-1
Received: by mail-ed1-f70.google.com with SMTP id m21so6131637edp.14
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 00:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QBXkf4oEF9/VUOQA1C13p3RtrE2RbrIhkBgJqdINYaQ=;
 b=alYizAsesQLIRZXkg4YffPdKGxJFsVVXDeZ/QMHqg3vrQcz19tFDJ8S+rb+lghKXw6
 H+SOvAxSfEhIHEqDGlZzEfoluog1b5TalU0CBzID8zVWL65tUjHuXn68739Bw4SjkGtX
 /iDFmXuf23PvB2IvvVHLjRdG7cqaZeblJki4mOdf3sReNS8GUUPBXea5MK7qN8LoQ2Yz
 ka0KkBJGuxKHaEQeYVj5ifJFlvxi74U0c7l5OKNhxs7/cTf7zKjD2ZnaEoS1RfkBqIPm
 RBLrKIxv5OzBmTpv3DS6/a/41cMzKY41uqeCikA2xPsho+mctGP1XcdMyV3IYiXLk5EJ
 dcaQ==
X-Gm-Message-State: APjAAAXQYpa+BW3xmFFy87lN10h7Ndk/eaT5Y8UVLKDNmpSfjDFGT1je
 rKPzEog85Vsaz4+5lCwvsDszS1zX0bq3Z8W42FgWWQFvr3kYNMdbJDjhwXwlGLkt+Q+rIOjrFRC
 PsHhVd+G8G116
X-Received: by 2002:a05:6402:12d2:: with SMTP id
 k18mr45569428edx.253.1582533683752; 
 Mon, 24 Feb 2020 00:41:23 -0800 (PST)
X-Received: by 2002:a05:6402:12d2:: with SMTP id
 k18mr45569404edx.253.1582533683487; 
 Mon, 24 Feb 2020 00:41:23 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id g4sm907219edl.6.2020.02.24.00.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 00:41:22 -0800 (PST)
Subject: Re: [PATCH] hw/arm: Use TYPE_PL011 to create serial port
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200224041633.97345-1-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ea5d13ba-e736-2c73-f2c0-6e42e512afa2@redhat.com>
Date: Mon, 24 Feb 2020 09:41:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224041633.97345-1-gshan@redhat.com>
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
Cc: peter.maydell@linaro.org, radoslaw.biernacki@linaro.org,
 alistair@alistair23.me, shan.gavin@gmail.com, leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vUP3TEtrM0fZ

On 2/24/20 5:16 AM, Gavin Shan wrote:
> This uses TYPE_PL011 when creating the serial port, to make the code
> a bit more atomatic.

Do you mean aUtomatic? I'm not sure this automate the code, but using=20
the TYPE definition is definitively cleaner.

With description fixed:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>=20
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/sbsa-ref.c    | 3 ++-
>   hw/arm/virt.c        | 3 ++-
>   hw/arm/xlnx-versal.c | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9b5bcb5634..df0a165047 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -39,6 +39,7 @@
>   #include "hw/pci-host/gpex.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/usb.h"
> +#include "hw/char/pl011.h"
>   #include "net/net.h"
>  =20
>   #define RAMLIMIT_GB 8192
> @@ -409,7 +410,7 @@ static void create_uart(const SBSAMachineState *sms, =
int uart,
>   {
>       hwaddr base =3D sbsa_ref_memmap[uart].base;
>       int irq =3D sbsa_ref_irqmap[uart];
> -    DeviceState *dev =3D qdev_create(NULL, "pl011");
> +    DeviceState *dev =3D qdev_create(NULL, TYPE_PL011);
>       SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
>  =20
>       qdev_prop_set_chr(dev, "chardev", chr);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f788fe27d6..d0da513737 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -71,6 +71,7 @@
>   #include "hw/mem/pc-dimm.h"
>   #include "hw/mem/nvdimm.h"
>   #include "hw/acpi/generic_event_device.h"
> +#include "hw/char/pl011.h"
>  =20
>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -724,7 +725,7 @@ static void create_uart(const VirtMachineState *vms, =
int uart,
>       int irq =3D vms->irqmap[uart];
>       const char compat[] =3D "arm,pl011\0arm,primecell";
>       const char clocknames[] =3D "uartclk\0apb_pclk";
> -    DeviceState *dev =3D qdev_create(NULL, "pl011");
> +    DeviceState *dev =3D qdev_create(NULL, TYPE_PL011);
>       SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
>  =20
>       qdev_prop_set_chr(dev, "chardev", chr);
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 1cf3daaf4f..403fc7b881 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -22,6 +22,7 @@
>   #include "hw/misc/unimp.h"
>   #include "hw/intc/arm_gicv3_common.h"
>   #include "hw/arm/xlnx-versal.h"
> +#include "hw/char/pl011.h"
>  =20
>   #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>   #define GEM_REVISION        0x40070106
> @@ -144,7 +145,7 @@ static void versal_create_uarts(Versal *s, qemu_irq *=
pic)
>           DeviceState *dev;
>           MemoryRegion *mr;
>  =20
> -        dev =3D qdev_create(NULL, "pl011");
> +        dev =3D qdev_create(NULL, TYPE_PL011);
>           s->lpd.iou.uart[i] =3D SYS_BUS_DEVICE(dev);
>           qdev_prop_set_chr(dev, "chardev", serial_hd(i));
>           object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_=
fatal);
>=20

