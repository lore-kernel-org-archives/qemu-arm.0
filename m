Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp242500lff;
        Sat, 18 Jan 2020 01:10:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVkF1/bCNyvRZ9HPyyMqqdw4gja923JYQGSDQL6faK7Q1+ZrFaWXgU+fXCW3jDP8mFyPLc
X-Received: by 2002:ae9:f80d:: with SMTP id x13mr37437124qkh.226.1579338611104;
        Sat, 18 Jan 2020 01:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579338611; cv=none;
        d=google.com; s=arc-20160816;
        b=cLyEVhwlaIZENgSyK0YnfVeYtR52DVvMQOeI4eErV06Qu2eFPy7iW8Fyvh5zKeQlIT
         BWIVt9QJS5Y6UnEiIZQN9U7VmwYLeSpk0uzyM7eFsCMjA8ZLtBqKAahRbh4joNoHxJAV
         8RbbCS6/MEmHXHVRzLzey4OOkuSByvpBIs1lB45Wyp03w+6qp7zUDhzMCuRIUyRn/oBY
         9wKrXgNAdXKbq2PCnSDc04CKJAuYl9Bqayi0FoBDosvu6ZCj4Twqul2zn8Rw0dpgS1XX
         I9I8OmFORdhO1O46tnMWH6QCM8G5ZHxdUZB7hNjlp5BQNNpcPuWOjvdnmaS7Qq2R9o1Y
         QmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nxwM+ygsbmPLVuVMHFiKlUPZjvSHJyaiMS81XNiGRdo=;
        b=z0Yp3cRW6n8N7d9pScmNfA6QVlzHqzDPqyAl2J1eHqk26T9pixdZn1JSMbBTj7U18v
         H4qIRat+cHpiaEh1jhPONxc2iI94unaIvsHt8ueIqJGUvYkrTaeilOGjNWLZArXzO3xe
         5psKeeCKUkKiDX1zELa9/4f9BdmKAr2ARxY5SfYzc2v4bnx8ts9wGl0v+TUivjTgUBmc
         JduHpiokfSDH62EVMLEzljWTQ2DL68fuAz61ZQoz7zBIYPh5qUIN4bb8Oxp9J2c7vIGw
         e8p60Xh7djVJ/NixWFNmE+HjoJMhz18FIA886t83nDIRwzDAFoSnWRy50cmaVGjV3i2x
         vNxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KerHwAdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145si17301137qkf.352.2020.01.18.01.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 01:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KerHwAdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isk7O-0006o9-IU
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 04:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isk7G-0006jv-Iw
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 04:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isk7F-0004el-2X
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 04:10:02 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54671
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isk7E-0004ea-V1
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 04:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579338600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxwM+ygsbmPLVuVMHFiKlUPZjvSHJyaiMS81XNiGRdo=;
 b=KerHwAdSFgOoCYJFi5vxlFOybc6HeyQUxHM72B9R1rBbHpy6HbrAOPPZfHNUsddqxIouC4
 T3QEQARLnjb/Xcnos56jBx+GiJ+BeSqIZAl2mZu6XYwa1bKqGpxE+o+ifO8zFdWSIYXaly
 NX98YCnk8iGGrwWEGdYYSe/x0RVWnRw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-gFRP13z4OPKnqOoqNNap3g-1; Sat, 18 Jan 2020 04:09:57 -0500
Received: by mail-wr1-f72.google.com with SMTP id y7so11604810wrm.3
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 01:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YR/ze6cbF7opX5cNd+rfmrTw6/hZTLCkg5OIhEZRAvw=;
 b=V6TiaPM+yiybVpJWJuB0+GrGfhXx2ugcwhD8X6FsXcpmc+D0jux83IrQxIcCeYB3La
 X9NjROuF2Xug07E8wglCsjZcWIUdfnOz5YVtG9DMT50rzhrzApkSK95JZXIpNWuO1AG5
 ihHOp/NQItMlVBmiDD7gwO/vdKChRCHeyY7kvETjofoMiigXzEYjL6/wWvQX7shTd+Ki
 iTvDNhN1jbQn4rbZroO5fPygCtYC7lBBHVSk8LoueKldl5uLgeaTwAp5ZTjW8wvwbzcG
 yF5fJ6LIKXalj5ZiMcW9t0uE4fikebZQ/XCOaxB0lsoTzQMR2n9ZdK0Bo2iNy5OMMhQz
 Lv+A==
X-Gm-Message-State: APjAAAW9OG665X+0q4Zq96qFGQ9v8pMk/ICZHrWq3n04g4q8JnLa4f6v
 rm8Xpb5xFjwHidwRcdlb+L/bEs0AaaAWfGhUnvY5KpvKtDRQWnVNmbE1oV22YxRCKiBGWuyKugx
 /a5bi38kMmGx9
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr7916654wrx.39.1579338595637; 
 Sat, 18 Jan 2020 01:09:55 -0800 (PST)
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr7916634wrx.39.1579338595346; 
 Sat, 18 Jan 2020 01:09:55 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id r5sm37145399wrt.43.2020.01.18.01.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 01:09:54 -0800 (PST)
Subject: Re: [PATCH v3 10/17] hw/arm/allwinner-h3: add Boot ROM support
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-11-nieklinnenbank@gmail.com>
 <9c878f16-b18c-cc1a-9e82-40dbdd31b823@redhat.com>
 <CAPan3WpNxGRfixQp5CwCwTU_boCq4h-BdJgD=KJEhRrGt7S7wg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <316c94b7-fea2-f44e-6d31-10fb41b09be3@redhat.com>
Date: Sat, 18 Jan 2020 10:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WpNxGRfixQp5CwCwTU_boCq4h-BdJgD=KJEhRrGt7S7wg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: gFRP13z4OPKnqOoqNNap3g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-TUID: fahaGdy8/ktt

On 1/15/20 12:10 AM, Niek Linnenbank wrote:
> On Tue, Jan 14, 2020 at 12:28 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     On 1/8/20 9:00 PM, Niek Linnenbank wrote:
>      > A real Allwinner H3 SoC contains a Boot ROM which is the
>      > first code that runs right after the SoC is powered on.
>      > The Boot ROM is responsible for loading user code (e.g. a bootload=
er)
>      > from any of the supported external devices and writing the downloa=
ded
>      > code to internal SRAM. After loading the SoC begins executing the
>     code
>      > written to SRAM. This commits adds emulation of the Boot ROM firmw=
are
>      > setup functionality by loading user code from SD card.
>      >
>      > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>
>      > ---
>      >=C2=A0 =C2=A0include/hw/arm/allwinner-h3.h | 23 +++++++++++++++++++=
++++
>      >=C2=A0 =C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 28 ++++++++++++++++++++++++++++
>      >=C2=A0 =C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +++
>      >=C2=A0 =C2=A03 files changed, 54 insertions(+)
>      >
>      > diff --git a/include/hw/arm/allwinner-h3.h
>     b/include/hw/arm/allwinner-h3.h
>      > index 5d74cca28e..4b66227ac4 100644
>      > --- a/include/hw/arm/allwinner-h3.h
>      > +++ b/include/hw/arm/allwinner-h3.h
>      > @@ -50,6 +50,7 @@
>      >=C2=A0 =C2=A0#include "hw/sd/allwinner-sdhost.h"
>      >=C2=A0 =C2=A0#include "hw/net/allwinner-sun8i-emac.h"
>      >=C2=A0 =C2=A0#include "target/arm/cpu.h"
>      > +#include "sysemu/block-backend.h"
>      >
>      >=C2=A0 =C2=A0/**
>      >=C2=A0 =C2=A0 * Allwinner H3 device list
>      > @@ -130,4 +131,26 @@ typedef struct AwH3State {
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion sram_c;
>      >=C2=A0 =C2=A0} AwH3State;
>      >
>      > +/**
>      > + * Emulate Boot ROM firmware setup functionality.
>      > + *
>      > + * A real Allwinner H3 SoC contains a Boot ROM
>      > + * which is the first code that runs right after
>      > + * the SoC is powered on. The Boot ROM is responsible
>      > + * for loading user code (e.g. a bootloader) from any
>      > + * of the supported external devices and writing the
>      > + * downloaded code to internal SRAM. After loading the SoC
>      > + * begins executing the code written to SRAM.
>      > + *
>      > + * This function emulates the Boot ROM by copying 32 KiB
>      > + * of data from the given block device and writes it to
>      > + * the start of the first internal SRAM memory.
>      > + *
>      > + * @s: Allwinner H3 state object pointer
>      > + * @blk: Block backend device object pointer
>      > + * @errp: Error object pointer for raising errors
>      > + */
>      > +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk,
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);
>      > +
>      >=C2=A0 =C2=A0#endif /* HW_ARM_ALLWINNER_H3_H */
>      > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>      > index e692432b4e..e7b768ad5b 100644
>      > --- a/hw/arm/allwinner-h3.c
>      > +++ b/hw/arm/allwinner-h3.c
>      > @@ -27,6 +27,7 @@
>      >=C2=A0 =C2=A0#include "hw/char/serial.h"
>      >=C2=A0 =C2=A0#include "hw/misc/unimp.h"
>      >=C2=A0 =C2=A0#include "hw/usb/hcd-ehci.h"
>      > +#include "hw/loader.h"
>      >=C2=A0 =C2=A0#include "sysemu/sysemu.h"
>      >=C2=A0 =C2=A0#include "hw/arm/allwinner-h3.h"
>      >
>      > @@ -168,6 +169,33 @@ enum {
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_NUM_SPI=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 128
>      >=C2=A0 =C2=A0};
>      >
>      > +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk,
>     Error **errp)
>      > +{
>      > +=C2=A0 =C2=A0 uint8_t *buffer;
>      > +=C2=A0 =C2=A0 int64_t rom_size =3D 32 * KiB;
>=20
>     Why restrict to 32K? The A1 SRAM is 64K.
>=20
>=20
> The reason is that the actual Boot ROM on the H3 also uses 32K:
> https://linux-sunxi.org/BROM
>=20
> See the 'U-Boot SPL Limitations' table at the end of the page.
>=20
> You can see the comment in the table there regarding the 32 KiB:
>  =C2=A0 "Sizes larger than 32 KiB are rejected by the BROM. Exactly 32 Ki=
B is=20
> fine, as verified by writing a special pattern at the end of the SPL and=
=20
> checking it in the SRAM."
> Probably it would not harm to increase it to the full size of the SRAM,=
=20
> but I tried to model
> the behavior as close to the real hardware as possible.

OK, then please document this difference in the commit description -=20
such "While the A1 SRAM is 64K, we limit to 32K because ..." - and add a=20
reference to https://linux-sunxi.org/BROM#U-Boot_SPL_limitations

