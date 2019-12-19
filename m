Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2621775lff;
        Thu, 19 Dec 2019 11:07:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhUcUcGhdl12gKUuOB1VBHnHVVv081/qJrexyurXjcBEaL1cqesEZ0xKFzhNJUYZeAA1yM
X-Received: by 2002:a9d:5888:: with SMTP id x8mr9830302otg.361.1576782425341;
        Thu, 19 Dec 2019 11:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576782425; cv=none;
        d=google.com; s=arc-20160816;
        b=ly78/eCRewrG2IEqtpmKQ9Lmzq/lb7U9nrdkjK7ZbXTWdWl4/FYuQKQ4NouUIZYluI
         SXKs/zcYaOyeIFos5VdY8urTnu9eetq7TzqfKnq6vfY5ZXiOsSfMuztPZ2dOYhUZy+wq
         yBBxPxD/5Z2G0GPNvVNs/EpgmsR/vAa/yGnvnIfwInQarBwSwejFMCD8FIZq7YieaZLT
         ny1WLW97hkTE9i4/Nc3Vo0vwB5xsLwYcsN9kcIFFfSjq5anIIuYy49rw1Tx+/9JgmqBg
         FjjXoz5zlO+rlRspVdz5N/JFSnNrl2HObs598Tm/oflEwgi9YFSnOiBH7Shejofb4Y28
         9l/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TynpDEwj2AG/Pgz/mZbQv9Qkv++l8kSA22+NdVyZDnw=;
        b=t8OYeJhxdW9Z5UQlt/WUcgyqsMMbaeVhLtr4YbF4sxERKWroT+cxiJYmTDGtazMpgy
         h7gLxOLiFHpdF2MaRBzmrpJWji0j/1zkRfiMkqKiMLIf6aySfFk1dvSsPAN36gXTbqIX
         dHHfsPo0apQDtKLKq5n+AaV2CDBIFDfD1A1wYSuoHZs0pk60g3EdaOx06vwmZ2j0seI3
         ZJWgbJLmK+xgQzl1WLdmsWs6GRbE4qqa+sovhvbKEF9wIgnl0pxRc+4uy3RjYlzEhWI3
         2Ay58hBnShwgXJ9c8y8ZMWaq/+1z+JtQeeRLRKSh+aQZgiQArDCs2nJcMTGmM3KKHETS
         FUWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iu3yQQsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25si3688270oto.191.2019.12.19.11.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 11:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iu3yQQsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii18a-0007tV-1c
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 14:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ii18K-0007oS-Ky
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 14:06:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ii18I-0007Lt-T0
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 14:06:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21770
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ii18I-0007JA-Lk
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 14:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576782406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TynpDEwj2AG/Pgz/mZbQv9Qkv++l8kSA22+NdVyZDnw=;
 b=Iu3yQQsdZA2GCJd8P8l3XPMOmHGWK5ppz7DXVLs39m+yJRkqzUdke64WW4Uv5Va8Sx0XGj
 TwJeigCjRCWuXl788ctCrT9tYHvm8cMi1+LyHvHr1yLgepkUEJH44S7yjsbmaP6ozXVJrA
 Txz7Fk/KN9kvDvOiE9xaC7yaV/W10gQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-bpQPLGkpNyqhjER7HgkbnQ-1; Thu, 19 Dec 2019 14:06:39 -0500
Received: by mail-wm1-f70.google.com with SMTP id q21so1547759wmc.7
 for <qemu-arm@nongnu.org>; Thu, 19 Dec 2019 11:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o2OSrHs0YUZFw1j6IF6ir4xvmI4fQhqh/dV7Wa/zFdE=;
 b=P/FlafJpOu7mjPNPVEmm8TV/hsj4KaxG+K9Rc0fsklvnZIuc3/pW6ryFZMKsIFMQLS
 16GsydjVDwJ909a8R7CQKu58FXzWvmAdkz+AsDYxmQejUz4u82xFmeUcyieoRK7A4Ph7
 PVO61IshZYA985htKR1gommTz4dZXh2MJ6ERDwz3DqyuRAZ7A8/As+VllCTkdNPOBTFb
 m70k04EIOvaY9z9ZTGVAIzfvSWEoF3dfeysgFxLXErtbKlY8b5vnPstKYN0tTfp2WTBP
 iHuwyrA+ZL3C+dkT0Z0sK8VgGkCenX62xiJ7Apfd+W/lYGoN0QEYNzwjszRuP8k9lU2Q
 4+Aw==
X-Gm-Message-State: APjAAAWrWKNrjwzw/rZWY10bHEzywOvUwzFqlD7NhgsRa0lFb/yeju2I
 PJmZ+v2/BZJx066PWOTW1ifcV2z+0Vm/CC5WGJm/qzTGPzE4ZQDATVyLy/F+Lk46CltFd/gDC/B
 Cgjjvjs/9w/lT
X-Received: by 2002:a5d:51c1:: with SMTP id n1mr10913411wrv.335.1576782398739; 
 Thu, 19 Dec 2019 11:06:38 -0800 (PST)
X-Received: by 2002:a5d:51c1:: with SMTP id n1mr10913386wrv.335.1576782398422; 
 Thu, 19 Dec 2019 11:06:38 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id g7sm7360592wrq.21.2019.12.19.11.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 11:06:37 -0800 (PST)
Subject: Re: [PATCH v2 02/10] hw: arm: add Xunlong Orange Pi PC machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <20191216233519.29030-3-nieklinnenbank@gmail.com>
 <e66415e1-7dcc-9fa3-7ff3-6526087be799@redhat.com>
 <CAPan3Wq6iM1k=UBP7kFUF-hYuSu836VLH+_YNFwdWAffbmnvYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fd3359ca-cbfb-5491-37e7-cf4fe3e783f8@redhat.com>
Date: Thu, 19 Dec 2019 20:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3Wq6iM1k=UBP7kFUF-hYuSu836VLH+_YNFwdWAffbmnvYQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: bpQPLGkpNyqhjER7HgkbnQ-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b18luSi7fViU

On 12/18/19 9:14 PM, Niek Linnenbank wrote:
> Hi Philippe,
>=20
> Thanks again for your quick and helpful feedback! :-)
>=20
> On Tue, Dec 17, 2019 at 8:31 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     Hi Niek,
>=20
>     On 12/17/19 12:35 AM, Niek Linnenbank wrote:
>      > The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
>      > based embedded computer with mainline support in both U-Boot
>      > and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
>      > 512MB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
>      > various other I/O. This commit add support for the Xunlong
>      > Orange Pi PC machine.
>      >
>      > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>
>      > Tested-by: KONRAD Frederic <frederic.konrad@adacore.com
>     <mailto:frederic.konrad@adacore.com>>
>      > ---
>      >=C2=A0 =C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 | 101
>     +++++++++++++++++++++++++++++++++++++++++++
>      >=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +
>      >=C2=A0 =C2=A0hw/arm/Makefile.objs |=C2=A0 =C2=A02 +-
>      >=C2=A0 =C2=A03 files changed, 103 insertions(+), 1 deletion(-)
>      >=C2=A0 =C2=A0create mode 100644 hw/arm/orangepi.c
>      >
>      > diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
>      > new file mode 100644
>      > index 0000000000..62cefc8c06
>      > --- /dev/null
>      > +++ b/hw/arm/orangepi.c
>      > @@ -0,0 +1,101 @@
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
>      > +
>      > +=C2=A0 =C2=A0 /* Only allow Cortex-A7 for this board */
>      > +=C2=A0 =C2=A0 if (strcmp(machine->cpu_type,
>     ARM_CPU_TYPE_NAME("cortex-a7")) !=3D 0) {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report("This board can only be =
used with cortex-a7
>     CPU");
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);
>      > +=C2=A0 =C2=A0 }
>      > +
>      > +=C2=A0 =C2=A0 s->h3 =3D AW_H3(object_new(TYPE_AW_H3));
>      > +
>      > +=C2=A0 =C2=A0 /* Setup timer properties */
>      > +=C2=A0 =C2=A0 object_property_set_int(OBJECT(&s->h3->timer), 3276=
8,
>     "clk0-freq",
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &error_abort);
>=20
>     You access the timer object which is contained inside the soc object,
>     but the soc isn't realized yet... I wonder if this is OK. Usually wha=
t
>     we do is, either:
>     - add a 'xtal-freq-hz' property to the SoC, set it here in the board,
>     then in soc::realize() set the property to the timer
>     - add an alias in the SoC to the timer 'freq-hz' property:
>      =C2=A0 =C2=A0 =C2=A0object_property_add_alias(soc, "xtal-freq-hz", O=
BJECT(&s->timer),
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "freq-hz", &err=
or_abort);
>=20
> Good point. I shall rework that part using your suggestion.
> Actually, I copied the timer support code from the existing cubieboard.c=
=20
> that has
> the Allwinner A10, so potentially the same problem is there.
>=20
> While looking more closer at this part, I now also discovered that the=20
> timer module from the Allwinner H3 is
> mostly a stripped down version of the timer module in the Allwinner A10:
>=20
>  =C2=A0 Allwinner A10, 10.2 Timer Register List, page 85:
> https://linux-sunxi.org/images/1/1e/Allwinner_A10_User_manual_V1.5.pdf
>=20
> The A10 version has six timers, where the H3 has only two. That should=20
> be fine I would say, the guest would simply
> use those available on H3 and ignore the rest. There is however one=20
> conflicting difference: the WDOG0 registers in the Allwinner H3 start
> at a different offset and are also different. The current A10 timer does=
=20
> not currently implement the watchdog part.
>=20
> The watchdog part of this timer is relevant for the 'reset' command in=20
> U-Boot: that does not work right now, because
> U-Boot implements the reset for the Allwinner H3 boards by letting this=
=20
> watchdog expire (and we dont emulate it).
> Also, this timer module is required for booting Linux, without it the=20
> kernel crashes using the sunxi_defconfig:
>=20
> [    0.000000] PC is at sun4i_timer_init+0x34/0x168
> [    0.000000] LR is at sun4i_timer_init+0x2c/0x168
> [    0.000000] pc : [<c07fa634>]    lr : [<c07fa62c>]    psr: 600000d3
> [    0.000000] sp : c0a03f70  ip : eec00188  fp : ef7ed040
> ...
> [    0.000000] [<c07fa634>] (sun4i_timer_init) from [<c07fa4e8>] (timer_p=
robe+0x74/0xe4)
> [    0.000000] [<c07fa4e8>] (timer_probe) from [<c07d9c10>] (start_kernel=
+0x2e0/0x440)
> [    0.000000] [<c07d9c10>] (start_kernel) from [<00000000>] (0x0)
>=20
>=20
> So in my opinion its a bit of a trade off here: we can keep it like this=
=20
> and re-use the A10 timer for now, and perhaps
> attempt to generalize that module for proper use in both SoCs. Or we can=
=20
> introduce a new H3 specific timer module.
> What do you think?

See my answer about generalize/reuse here:
http://mid.mail-archive.com/20191219185127.24388-1-f4bug@amsat.org

