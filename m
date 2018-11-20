Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp628153wrt;
        Tue, 20 Nov 2018 06:29:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5e1FTYe4jkHgCeEw2BSPmlCSMjt2MbpAA/v/IEAd5hFDSeLe0r3NENLucz1GUQ9H72My15F
X-Received: by 2002:a81:b147:: with SMTP id p68mr2156021ywh.352.1542724198434;
        Tue, 20 Nov 2018 06:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542724198; cv=none;
        d=google.com; s=arc-20160816;
        b=rYbOccQzOcMnGNRb0gQk3PhPU/RlpeD8zb0OPN/ROx3DeWHyW4gRqgJZm6bkjoxJv0
         wJylzZYXv2ejFqjeOx6jcbleWzMlNYrpk69GbSUg2YrrXITK7b8ZMDVOATRZ1ImUsx5P
         /YWbPXS5oUNyEpKEkhoilw7b5ChhKCiBCbhiZm0aEdP3XFm8TXOpsZd6ce5XyLHBsTwD
         8sX2YhIIuRpOz3ervdzzqFepQDisUn/8ZgazhRRhqETUw0iwWumcsiiZlL5Flwmon2Bh
         QeW9qAlT3sRGUiCROYNZ0CzWrMlN9MjLGwBAhAFa+4ItR/9zjxZcLUW6N74GvyC6Fee3
         iIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=LZnbDepeIQvPnVk6Yn0smEcXJfy4ghB4nJN8gNpL01Q=;
        b=GC/Wp4yoT4TTXJwQH0xdh/aMwtlVlPpndAlw/M+ONu8+y/ACZj0/dzun00mGqWNrJn
         U/6sW0JwD9NQfijLPhPur0jYuYXwtr6MQXnmNxTtZkeLMSiM3qwmsaWoGn1SfcO0ZpPg
         Ypx8+Jp8HSX/aWxfAibPwufsyDaknKBBTw84hZHS53rYPU1uyn8JgOp+0bx3r09QlWg7
         JfYrPeRO4XLJrYn+FyHt0xDyWnwJSH4AO0RdcTEnh7q0iZQb1n3FnZ77FOG2Yel2H4HM
         Yf2yrKvOwWxMhwOHWEaFi/HDcUeIE/KI4rs6KYRa4f4U24IujyV2q6zhcs3tr2vMT/Na
         ZAJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LIITAgY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si412025ybx.439.2018.11.20.06.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:29:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LIITAgY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP72L-0005Ij-HE
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:29:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP72A-0005I1-JG
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:29:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP729-0005kX-9r
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:29:46 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP729-0005k1-0D
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:29:45 -0500
Received: by mail-oi1-x241.google.com with SMTP id b141so1600936oii.12
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LZnbDepeIQvPnVk6Yn0smEcXJfy4ghB4nJN8gNpL01Q=;
	b=LIITAgY7R0EFnKG+ynSIwM3Z8eCDQv36R3H/1AHLrHAKYZ1LgusHJWeqJN65+5RWVj
	dGmB+q+B5jwNqWhQSvHzMXtAuGqEiyGIfaUF/p6XngE3YL4gVrDnrkwugdb8Q0RJoNFI
	SvRyUOcd9vmuNnSaEYeZT/la8GeXtO5Ot/oXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LZnbDepeIQvPnVk6Yn0smEcXJfy4ghB4nJN8gNpL01Q=;
	b=PvJgBeQi7yI63/unNL9+aOaPgW6a+WOgAdvOiy313eviCSMU9fVVHKlaRwsZ3KuwJr
	7Ihjmis/xefhmxLSCckxUEQINaTnWqOlJu9yT4IMyIkcrbVHyCGA5kC/KjA6g/UDkeHq
	snf1q9iKjjXOSEFxSNN9aTW8WdjEm1G9BFtsAMHjvwMF7Yptos6+TaUjUL/A+eJ7tBFo
	42d46p73jQZGuPiMdePKXlp1RIoH/HzxGAEvbwj0LQB9KV0o/PAyeos9Nhn4THwLncCI
	lEP6jOTwkTSWftcJMM2ICiXyKTQ7FN7i0QmOXPP9JgKZ+QLhpGiuuj0hVWOU5El1di9X
	VGAQ==
X-Gm-Message-State: AGRZ1gJOEu+CdAfHvdtd7/1wHRUXDhIMnfi10L7e+k/XrdYXDXdtsXto
	1jR3EUn7ACTwb3m5SnT4854lGVRcR+VQiP1g5bC6Sw==
X-Received: by 2002:aca:5ac5:: with SMTP id
	o188-v6mr1126301oib.146.1542724183970; 
	Tue, 20 Nov 2018 06:29:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:29:23
	-0800 (PST)
In-Reply-To: <1542365406-81310-4-git-send-email-peng.hao2@zte.com.cn>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
	<1542365406-81310-4-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:29:23 +0000
Message-ID: <CAFEAcA_2ScVO3=K4b+r5RTTnNs3uqyeXwX=tH=qYS2To+y7PRA@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH V7 3/6] hw/misc/pvpanic: Add the MMIO
 interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Wgsh+qtPevg

On 16 November 2018 at 10:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
> Add pvpanic new type "TYPE_PVPANIC_MMIO"
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I'm not entirely sure I understand why we have two
signed-off-by lines here -- who is the author of this patch?

> ---
>  hw/misc/pvpanic.c         | 81 +++++++++++++++++++++++++++++++++++++----=
------
>  include/hw/misc/pvpanic.h |  1 +
>  2 files changed, 65 insertions(+), 17 deletions(-)
>
> diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
> index dd3aef2..5d0fbc6 100644
> --- a/hw/misc/pvpanic.c
> +++ b/hw/misc/pvpanic.c
> @@ -2,10 +2,12 @@
>   * QEMU simulated pvpanic device.
>   *
>   * Copyright Fujitsu, Corp. 2013
> + * Copyright (c) 2018 ZTE Ltd.
>   *
>   * Authors:
>   *     Wen Congyang <wency@cn.fujitsu.com>
>   *     Hu Tao <hutao@cn.fujitsu.com>
> + *     Peng Hao <peng.hao2@zte.com.cn>
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>   * See the COPYING file in the top-level directory.
> @@ -25,9 +27,6 @@
>  /* The pv event value */
>  #define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
>
> -#define PVPANIC(obj)    \
> -    OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC)
> -

We just added (renamed) this macro in the previous patch:
has something gone wrong in a rebase ?

>  static void handle_event(int event)
>  {
>      static bool logged;
> @@ -45,30 +44,50 @@ static void handle_event(int event)
>
>  #include "hw/isa/isa.h"
>
> -typedef struct PVPanicState {
> -    /* private */
> -    ISADevice isadev;
> +/* PVPanicISAState for ISA device and
> + * use ioport.
> + */
> +typedef struct PVPanicISAState {
> +     /* private */
> +     ISADevice isadev;

This should be "ISADevice parent_obj;" and go above the /* private */
comment, because a PVPanicISAState is-a ISADevice (this is not
a has-a relation).

Again, this seems to be undoing changes from the previous patch
somewhat ?

> +     uint16_t ioport;
>
>      /* public */
>      MemoryRegion mr;
> -    uint16_t ioport;
> -} PVPanicState;
> +} PVPanicISAState;
> +
> +/* PVPanicMMIOState for sysbus device and
> + * use mmio.
> + */
> +typedef struct PVPanicMMIOState {
> +    /* private */
> +    SysBusDevice busdev;
> +
> +     /* public */
> +    MemoryRegion mr;
> +} PVPanicMMIOState;
> +
> +#define PVPANIC_ISA(obj)    \
> +    OBJECT_CHECK(PVPanicISAState, (obj), TYPE_PVPANIC)
> +
> +#define PVPANIC_MMIO(obj)    \
> +    OBJECT_CHECK(PVPanicMMIOState, (obj), TYPE_PVPANIC_MMIO)
>
>  /* return supported events on read */
> -static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned =
size)
> +static uint64_t pvpanic_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      return PVPANIC_PANICKED;
>  }
>
> -static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val=
,
> +static void pvpanic_write(void *opaque, hwaddr addr, uint64_t val,
>                                   unsigned size)
>  {
>      handle_event(val);
>  }
>
>  static const MemoryRegionOps pvpanic_ops =3D {
> -    .read =3D pvpanic_ioport_read,
> -    .write =3D pvpanic_ioport_write,
> +    .read =3D pvpanic_read,
> +    .write =3D pvpanic_write,
>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> @@ -77,15 +96,16 @@ static const MemoryRegionOps pvpanic_ops =3D {
>
>  static void pvpanic_isa_initfn(Object *obj)
>  {
> -    PVPanicState *s =3D PVPANIC(obj);
> +    PVPanicISAState *s =3D PVPANIC_ISA(obj);
>
> -    memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s, "pvpanic",=
 1);
> +    memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
> +                          TYPE_PVPANIC, 1);
>  }
>
>  static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
>  {
>      ISADevice *d =3D ISA_DEVICE(dev);
> -    PVPanicState *s =3D PVPANIC(dev);
> +    PVPanicISAState *s =3D PVPANIC_ISA(dev);
>      FWCfgState *fw_cfg =3D fw_cfg_find();
>      uint16_t *pvpanic_port;
>
> @@ -102,7 +122,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, E=
rror **errp)
>  }
>
>  static Property pvpanic_isa_properties[] =3D {
> -    DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicState, ioport, 0x505)=
,
> +    DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x5=
05),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -118,14 +138,41 @@ static void pvpanic_isa_class_init(ObjectClass *kla=
ss, void *data)
>  static TypeInfo pvpanic_isa_info =3D {
>      .name          =3D TYPE_PVPANIC,
>      .parent        =3D TYPE_ISA_DEVICE,
> -    .instance_size =3D sizeof(PVPanicState),
> +    .instance_size =3D sizeof(PVPanicISAState),
>      .instance_init =3D pvpanic_isa_initfn,
>      .class_init    =3D pvpanic_isa_class_init,
>  };
>
> +
> +static void pvpanic_mmio_initfn(Object *obj)
> +{
> +    PVPanicMMIOState *s =3D PVPANIC_MMIO(obj);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
> +                          TYPE_PVPANIC_MMIO, 2);
> +    sysbus_init_mmio(sbd, &s->mr);
> +}
> +
> +static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static TypeInfo pvpanic_mmio_info =3D {
> +    .name          =3D TYPE_PVPANIC_MMIO,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(PVPanicMMIOState),
> +    .instance_init =3D pvpanic_mmio_initfn,
> +    .class_init    =3D pvpanic_mmio_class_init,
> +};
> +
>  static void pvpanic_register_types(void)
>  {
>      type_register_static(&pvpanic_isa_info);
> +    type_register_static(&pvpanic_mmio_info);
>  }

I would suggest refactoring the ISA device in one patch,
and then adding the MMIO device in a second patch. Currently
this patch is mixing the two.

thanks
-- PMM
