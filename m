Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp307066lff;
        Thu, 5 Dec 2019 21:41:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAPCP0lZOIiKKUwrceBDD9Zxowbk1q/EP0iCrIgBR8APYlsRbqvExRkHEgdHLe+DaxCtmq
X-Received: by 2002:a9d:640d:: with SMTP id h13mr9713022otl.325.1575610900269;
        Thu, 05 Dec 2019 21:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575610900; cv=none;
        d=google.com; s=arc-20160816;
        b=jmyP4nBZdKkMD+UN03jn0wQUVqP9p6FPTl0qji1H+oZr9hDuEcvWNiIZIYA/uIX0s7
         acbrsBXXYeNi5T+Z0+RFD7xEIGeG5LI4tWAaJNwgX03bJzfqqP2rH/Iex0lU+MD9/Y7V
         zr178vEyr5pImW0LYtob4gZukDXH+5pThASihZXa2L2/MF4GLg353xhxf/hxiWpfTyGu
         INmcEsfsuiJCjfOLTZHEl9+A9rMYWHlhS9DGeXMrOga+HYq3QiH+sTpvNmxxaF8yk38A
         MZhka5U314xxqzAsTUi2YINVA9EJ2ftam+ewGAmnLcO8cXIv/BCfjoOpGrI4yXa/NjQe
         XieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gpht+lNQ/9sd0vurxREQ/SXN5IoHArmzj8U2DlqYFwQ=;
        b=oYlmaQ+c739dvyccXVbtJCVV6gOukhU4CXNtMn3VNOzL8LiE678uBCPmu3jkilsJyM
         DJ5ZnmTQbDDr+AIdt9kJ9yLfWCqh8XjMBUefwhIC44FEuzpOTknle0jvUH7MihzgqmRq
         o/aL5i1Z4FSI5JHAOJ5RbymweguLC3QO6sTKJo8YJ+YdZhAfEfP+2SM/S+DtF3ARpOch
         g3kirFeYZXWgrkdrntCr3PSufvPLgvYE5lSzWLVceDoz8vJhwNTrGHDPzod2egW7zqWA
         gsAg6YCbMqUgKE+p02ywl4P+ENSLGy0jgsuFCKbXl+HIjNDF521ztRLqtKM0X6X3lu1U
         nGIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=huCRkJiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si6780407otp.46.2019.12.05.21.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 21:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=huCRkJiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1id6N1-0004uQ-Cy
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 00:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1id6Ma-0004sj-PD
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 00:41:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1id6MW-0003q7-Jg
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 00:41:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24346
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1id6MW-0003oN-5c
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 00:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575610867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpht+lNQ/9sd0vurxREQ/SXN5IoHArmzj8U2DlqYFwQ=;
 b=huCRkJiYktyuwmGTAu8vtekxMY39x2O87rn2CfjYcRtHrIUJ9kFICzm3dXqqIr8R0Vluxa
 DzmfHKKq7LrhkAZ0r1l1p2TgzREGsNwrQd9hQRztacl/OmEVV6+bk3naig1r12em8m6oV6
 QnYmdNEW8phWR3ddN6nBLHLobaljqtI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-0_yhLOiOMuGpnoMsnKf3Ng-1; Fri, 06 Dec 2019 00:41:05 -0500
Received: by mail-wm1-f70.google.com with SMTP id n4so1465804wmd.7
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 21:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynFXsQw9qP5ebi87xd/vqFwV/WSAFxR6XBn2PF7Hcro=;
 b=gbtiDI2t47/eJWvQeu2A/rxhvW5fH/1dSwQM5/JICK+4lBbyHf0y+Ahzy9MgVv5pNt
 v1lV/g1Gv9alwLOnY2ZLFFMU4DQ133ryD262JSO6+HhNLq2u5QqfcV7C60l37o/zbL6x
 oTdydQ60+PQHRDjNTpst+ROFqou/b1z2QuTGY6M2GS2yr4/mKJZbQfpDuStTk0fhG2Fs
 6HbaMnj2scjQ6rXL8m9m6RXs7GjeDzBjvQsRlDHHdQXrlg4GX/+QzEDgb1FoU6hcT5cu
 NsuxKVdqgX8uql/KY+XLsSU+BPksrVNH8LcVUZotwjFFyRAacJKuZScXJqzdT2LS+TXq
 fTDA==
X-Gm-Message-State: APjAAAWU66HFNemYXgdKzGJecKCQrjarnp5FxHvSuvYHDN4Y7vRDNtMe
 WnvHEQPhEV0a4d07Xbb4g8od2o8aEfsToJ4C82ASSrlogz9Cx5qmjv5AmV79Va45mfy772AoMOw
 A71n6aRNFWMwx
X-Received: by 2002:a5d:4752:: with SMTP id o18mr13256964wrs.330.1575610864296; 
 Thu, 05 Dec 2019 21:41:04 -0800 (PST)
X-Received: by 2002:a5d:4752:: with SMTP id o18mr13256945wrs.330.1575610863950; 
 Thu, 05 Dec 2019 21:41:03 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id e16sm2149845wme.35.2019.12.05.21.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 21:41:03 -0800 (PST)
Subject: Re: [PATCH 02/10] hw: arm: add Xunlong Orange Pi PC machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-3-nieklinnenbank@gmail.com>
 <b14e5a75-ebe3-311e-60a8-3f71b0874a10@redhat.com>
 <CAPan3WohBP_47h1ZPP12ZuyiY43B3B6tGFMH-sK=LAAjMbwpaA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce2125dd-004c-a5a2-81cf-b8aaae76444e@redhat.com>
Date: Fri, 6 Dec 2019 06:41:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WohBP_47h1ZPP12ZuyiY43B3B6tGFMH-sK=LAAjMbwpaA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 0_yhLOiOMuGpnoMsnKf3Ng-1
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3tdCpKGdryLE

On 12/5/19 11:15 PM, Niek Linnenbank wrote:
> Hello Philippe,
>=20
> On Tue, Dec 3, 2019 at 10:18 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     On 12/2/19 10:09 PM, Niek Linnenbank wrote:
>      > The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
>      > based embedded computer with mainline support in both U-Boot
>      > and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
>      > 512MB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
>      > various other I/O. This commit add support for the Xunlong
>      > Orange Pi PC machine.
>      >
>      > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>
>      > ---
>      >=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +
>      >=C2=A0 =C2=A0hw/arm/Makefile.objs |=C2=A0 2 +-
>      >=C2=A0 =C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 | 90
>     ++++++++++++++++++++++++++++++++++++++++++++
>      >=C2=A0 =C2=A03 files changed, 92 insertions(+), 1 deletion(-)
>      >=C2=A0 =C2=A0create mode 100644 hw/arm/orangepi.c
>      >
>      > diff --git a/MAINTAINERS b/MAINTAINERS
>      > index 29c9936037..42c913d6cb 100644
>      > --- a/MAINTAINERS
>      > +++ b/MAINTAINERS
>      > @@ -485,6 +485,7 @@ L: qemu-arm@nongnu.org
>     <mailto:qemu-arm@nongnu.org>
>      >=C2=A0 =C2=A0S: Maintained
>      >=C2=A0 =C2=A0F: hw/*/allwinner-h3*
>      >=C2=A0 =C2=A0F: include/hw/*/allwinner-h3*
>      > +F: hw/arm/orangepi.c
>      >
>      >=C2=A0 =C2=A0ARM PrimeCell and CMSDK devices
>      >=C2=A0 =C2=A0M: Peter Maydell <peter.maydell@linaro.org
>     <mailto:peter.maydell@linaro.org>>
>      > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>      > index 956e496052..8d5ea453d5 100644
>      > --- a/hw/arm/Makefile.objs
>      > +++ b/hw/arm/Makefile.objs
>      > @@ -34,7 +34,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o
>      >=C2=A0 =C2=A0obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o
>      >=C2=A0 =C2=A0obj-$(CONFIG_STRONGARM) +=3D strongarm.o
>      >=C2=A0 =C2=A0obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubie=
board.o
>      > -obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o
>      > +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o orangepi.o
>      >=C2=A0 =C2=A0obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836=
.o raspi.o
>      >=C2=A0 =C2=A0obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>      >=C2=A0 =C2=A0obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-=
zcu102.o
>      > diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
>      > new file mode 100644
>      > index 0000000000..5ef2735f81
>      > --- /dev/null
>      > +++ b/hw/arm/orangepi.c
>      > @@ -0,0 +1,90 @@
>      > +/*
>      > + * Orange Pi emulation
>      > + *
>      > + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>
>      > + *
>      > + * This program is free software: you can redistribute it and/or
>     modify
>      > + * it under the terms of the GNU General Public License as
>     published by
>      > + * the Free Software Foundation, either version 2 of the License,=
 or
>      > + * (at your option) any later version.
>      > + *
>      > + * This program is distributed in the hope that it will be useful=
,
>      > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>      > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See=
 the
>      > + * GNU General Public License for more details.
>      > + *
>      > + * You should have received a copy of the GNU General Public Lice=
nse
>      > + * along with this program.=C2=A0 If not, see
>     <http://www.gnu.org/licenses/>.
>      > + */
>      > +
>      > +#include "qemu/osdep.h"
>      > +#include "exec/address-spaces.h"
>      > +#include "qapi/error.h"
>      > +#include "cpu.h"
>      > +#include "hw/sysbus.h"
>      > +#include "hw/boards.h"
>      > +#include "hw/qdev-properties.h"
>      > +#include "hw/arm/allwinner-h3.h"
>      > +
>      > +static struct arm_boot_info orangepi_binfo =3D {
>      > +=C2=A0 =C2=A0 .loader_start =3D AW_H3_SDRAM_BASE,
>      > +=C2=A0 =C2=A0 .board_id =3D -1,
>      > +};
>      > +
>      > +typedef struct OrangePiState {
>      > +=C2=A0 =C2=A0 AwH3State *h3;
>      > +=C2=A0 =C2=A0 MemoryRegion sdram;
>      > +} OrangePiState;
>      > +
>      > +static void orangepi_init(MachineState *machine)
>      > +{
>      > +=C2=A0 =C2=A0 OrangePiState *s =3D g_new(OrangePiState, 1);
>      > +=C2=A0 =C2=A0 Error *err =3D NULL;
>      > +
>=20
>     Here I'd add:
>=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(machine->cpu_type,
>     ARM_CPU_TYPE_NAME("cortex-a7")) !=3D 0) {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report("This board ca=
n only be used with cortex-a7
>     CPU");
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>=20
> Done!
>=20
>      > +=C2=A0 =C2=A0 s->h3 =3D AW_H3(object_new(TYPE_AW_H3));
>      > +
>      > +=C2=A0 =C2=A0 /* Setup timer properties */
>      > +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&s->h3->timer), 3276=
8,
>     "clk0-freq", &err);
>      > +=C2=A0 =C2=A0 if (err !=3D NULL) {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err, "Couldn't set =
clk0 frequency: ");
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);
>      > +=C2=A0 =C2=A0 }
>      > +
>      > +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&s->h3->timer), 2400=
0000,
>     "clk1-freq",
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &err);
>      > +=C2=A0 =C2=A0 if (err !=3D NULL) {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err, "Couldn't set =
clk1 frequency: ");
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);
>      > +=C2=A0 =C2=A0 }
>      > +
>      > +=C2=A0 =C2=A0 /* Mark H3 object realized */
>      > +=C2=A0 =C2=A0 object_property_set_bool(OBJECT(s->h3), true, "real=
ized", &err);
>=20
>     I'm not sure if that's correct but I'd simply use &error_abort here.
>=20
> Done, I applied it to all the functions and removed the err variable.
>=20
>      > +=C2=A0 =C2=A0 if (err !=3D NULL) {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err, "Couldn't real=
ize Allwinner H3: ");
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);
>      > +=C2=A0 =C2=A0 }
>      > +
>      > +=C2=A0 =C2=A0 /* RAM */
>      > +=C2=A0 =C2=A0 memory_region_allocate_system_memory(&s->sdram, NUL=
L,
>     "orangepi.ram",
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0machine->ram_size);
>=20
>     I'd only allow machine->ram_size =3D=3D 1 * GiB here, since the onboa=
rd
>     DRAM
>     is not upgradable.
>=20
>=20
> Agree, we should add something for that. Would it be acceptable if we=20
> make the 1GB an upper limit?
> I see that the Raspberry Pi is doing that too in hw/arm/raspi.c, like so:
>=20
>  =C2=A0 =C2=A0 if (machine->ram_size > 1 * GiB) {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report("Requested ram size is too larg=
e for this machine: "
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0"maximum is 1GB");
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);
>  =C2=A0 =C2=A0 }
>=20
> I think it would be helpful to allow the flexibility to the user of=20
> reducing the RAM to less than 1GB,
> in case resources of the host OS are limited. What do you think?

Sure, good idea.

FIY (in case you add more models) we recently noticed there is a problem=20
when using 2GiB default on 32-bit hosts, so the workaround is to use <=3D=
=20
1GiB default.

>      > +=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(),
>     AW_H3_SDRAM_BASE,
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &s->sdram);
>      > +
>      > +=C2=A0 =C2=A0 /* Load target kernel */
>      > +=C2=A0 =C2=A0 orangepi_binfo.ram_size =3D machine->ram_size;
>      > +=C2=A0 =C2=A0 orangepi_binfo.nb_cpus=C2=A0 =3D AW_H3_NUM_CPUS;
>      > +=C2=A0 =C2=A0 arm_load_kernel(ARM_CPU(first_cpu), machine, &orang=
epi_binfo);
>      > +}
>      > +
>      > +static void orangepi_machine_init(MachineClass *mc)
>      > +{
>      > +=C2=A0 =C2=A0 mc->desc =3D "Orange Pi PC";
>      > +=C2=A0 =C2=A0 mc->init =3D orangepi_init;
>      > +=C2=A0 =C2=A0 mc->units_per_default_bus =3D 1;
>      > +=C2=A0 =C2=A0 mc->min_cpus =3D AW_H3_NUM_CPUS;
>      > +=C2=A0 =C2=A0 mc->max_cpus =3D AW_H3_NUM_CPUS;
>      > +=C2=A0 =C2=A0 mc->default_cpus =3D AW_H3_NUM_CPUS;
>=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 mc->default_cpu_type =3D ARM_CPU_TYPE_NA=
ME("cortex-a7");
>=20
>      > +=C2=A0 =C2=A0 mc->ignore_memory_transaction_failures =3D true;
>=20
>     You should not use this flag in new design. See the documentation in
>     include/hw/boards.h:
>=20
>      =C2=A0 * @ignore_memory_transaction_failures:
>      =C2=A0 *=C2=A0 =C2=A0 [...] New board models
>      =C2=A0 *=C2=A0 =C2=A0 should instead use "unimplemented-device" for =
all memory
>     ranges where
>      =C2=A0 *=C2=A0 =C2=A0 the guest will attempt to probe for a device t=
hat QEMU doesn't
>      =C2=A0 *=C2=A0 =C2=A0 implement and a stub device is required.
>=20
>     You already use the "unimplemented-device".
>=20
> Thanks, I'm working on this now. I think that at least I'll need to add
> all of the devices mentioned in the 4.1 Memory Mapping chapter of the=20
> datasheet
> as an unimplemented device. Previously I only added some that I thought=
=20
> were relevant.
>=20
> I added all the missing devices as unimplemented and removed the=20
> ignore_memory_transaction_failures flag

I was going to say, "instead of adding *all* the devices regions you can=20
add the likely bus decoding regions", probably:

0x01c0.0000   128KiB   AMBA AXI
0x01c2.0000   64KiB    AMBA APB

But too late.

> from the machine. Now it seems Linux gets a data abort while probing the=
=20
> uart1 serial device at 0x01c28400,

Did you add the UART1 as UNIMP or 16550?

> so I'll need to debug it further. I'll post back when I have more results=
.
>=20
> Regards,
> Niek
>=20
>      > +}
>      > +
>      > +DEFINE_MACHINE("orangepi", orangepi_machine_init)
>=20
>     Can you name it 'orangepi-pc'? So we can add other orangepi models.
>=20
>     Thanks,
>=20
>     Phil.
>=20
>=20
>=20
> --=20
> Niek Linnenbank
>=20

