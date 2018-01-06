Received: by 10.28.173.206 with SMTP id w197csp4582wme;
        Fri, 5 Jan 2018 18:26:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBosy0HyH6F4BG2paZjD1+wbtUkS3SNRBWG0m9ZB0ZQc+ufvVJO/HzphCionxlAiu3AXR4wtf
X-Received: by 10.129.182.65 with SMTP id h1mr4567599ywk.348.1515205595269;
        Fri, 05 Jan 2018 18:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515205595; cv=none;
        d=google.com; s=arc-20160816;
        b=0rEdttA8KW6MwgByNJOkwPVtTlNhyXxvauUzPoQCz+GrTQy/BasZ4PT4MEJVcnh1K6
         ubWXdnymLHo+eDN9ZvLE1cD+R49/oaGeKtFl1GxI+e+fZzGplJvB3nE37EAC5aShd+68
         R63Fo3XkepCeTYHZ+D5Y47ES4AtQTWEU4Rbcub+yiqz8v12i8z406SM+uM2OlIhd7otp
         uokUMeFZAWb8UsoIIW+FlB48zKy3rKUddlkyRlHaPsI9ugfynaVoLLFcwM3VxAlmH1X9
         NrA7Qpv1VBJ8CIGJBGiwRhAaNoon6BhumdEL8liVH4vypiiP375EHw6FAKkrCEW2eKW+
         3Ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=tou2KEmaUjeWv777b28X15W1CvkAXUhcm80mU9eDKP8=;
        b=L15lVj9X+n6SNYqvnj+3B6kFK05u4LzNRZyCVaGQyjSa6QNbDPcxjd+c5AXnuV3zwu
         IhP+q9k6H0rPCZOPokQULkd8aJ1o9sri60BES2AdCTTLbBxCucdSXmRLFdTYLgznPXHF
         vRPaS3xhmmVT9WVoJbV1LpsrE9B8nKSx6L3TKeWoG+UCeYgCYTDLrWlXkq/MxDDtnF5A
         PJRZdAU82rcvDLIFCnkLYQx7+MVti05r/GjsCe/xkiix20OJaPHQUW0+E3i8QxmKcGXF
         Amc1vY1Gjo5+lDf8SziO+1n+35ytnH0C3kLriJkzx5BAoK7RCfmPvHffGZpu5lKRy33D
         YYhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Juzd8HNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h21si1446886ywa.500.2018.01.05.18.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 18:26:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Juzd8HNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXeBu-0002cO-Pf
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 21:26:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXeBE-00027J-Ks
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 21:25:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXeBD-00015S-MT
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 21:25:52 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eXeBD-00014q-Ep; Fri, 05 Jan 2018 21:25:51 -0500
Received: by mail-wm0-x235.google.com with SMTP id a79so5471126wma.0;
	Fri, 05 Jan 2018 18:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=tou2KEmaUjeWv777b28X15W1CvkAXUhcm80mU9eDKP8=;
	b=Juzd8HNKpkYi2oiAeuhb1yXU+oqpr/d3Sz/7rBbosrhT+Ihl0Z6VI5fle1TZ5TCZaq
	pAm5bGXvGV9OyrVRGnzLdDQQu6ULvNeil+GFUxGrJXuKaFZ8t1GbJwF6UX3NT2SlRMbZ
	2/KqxSSXQXFosOrPcNdXrwQTV+g+p9mGQqOrbuscY9zsati8NjkoXSrpvl2ujhTo+HvT
	Oqurv5HggZchOD4Nbust6V7FaqRVB+WRjIeoHhsx1jSGQHF2rwvtHDn3gEYABs7Io5ZK
	AK31rqhbkCa4gULuslJqcsB+IgjmI3vrWOH6qiKwjHaezxquIiip5Vvtq4F0AWvX6Sli
	HAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=tou2KEmaUjeWv777b28X15W1CvkAXUhcm80mU9eDKP8=;
	b=jF+BXc0yFInuf4WeIblMnrJ28dP7K4b8uEXitHf+y0nKufiFZaZPB1T6IoZ2bTYjlJ
	Nwa89Z7UaMqTdJ3nFLj6hnKiwFPi6BZEGRegA/jflNPAkKv0bQjnBvhjl2zbL0jsTRLN
	PqawS5Sg450bB6ff770RujuJ1uAiI8ozOHoKSGjh69jMqHWRxF9OaXOyVZN20X/sROIf
	uUrT7uxbRkD1btUPK/3AgBOx0UYR340Zi5oUuOSWFXM47cmQ3m+nVsvbxP4/S56QGYvW
	JA9YwMAjQs3iYGTNnwfV8eb+DIneduydwR/j8vqpH/TmyfDKLGCn9EA+m7vjfjhEQAti
	eGrA==
X-Gm-Message-State: AKGB3mL8kI2r2r4drSRx7AfgpcQzpm4vrNZP05feiv8h5eFe5B/ssIez
	tnvp295iaPLDuTPONhZQQ6XSDXh9lJ0PNnQDqss=
X-Received: by 10.28.17.76 with SMTP id 73mr3888755wmr.104.1515205550459; Fri,
	05 Jan 2018 18:25:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:25:19 -0800 (PST)
In-Reply-To: <20180103162400.10396-3-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Jan 2018 18:25:19 -0800
X-Google-Sender-Auth: r-d8GfjXggDqhC19INk9F3Dm8RM
Message-ID: <CAKmqyKPzQhhK80WOnP7qbKMUBsQwfC7yT+2A67u=AU3g2rLUzQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/6] hw/sd/milkymist-memcard:
 split realize() out of SysBusDevice init()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Xiaoqiang Zhao <zxq_yx_007@163.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NUAptGp9y491

On Wed, Jan 3, 2018 at 8:23 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Create the SDCard in the realize() function.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/milkymist-memcard.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 5de3e00e2f..5df3a0f815 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -255,24 +255,29 @@ static void milkymist_memcard_reset(DeviceState *d)
>  static int milkymist_memcard_init(SysBusDevice *dev)
>  {
>      MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
> -    DriveInfo *dinfo;
> +
> +    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops,=
 s,
> +            "milkymist-memcard", R_MAX * 4);
> +    sysbus_init_mmio(dev, &s->regs_region);
> +
> +    return 0;
> +}
> +
> +static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
> +{
> +    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
>      BlockBackend *blk;
> +    DriveInfo *dinfo;
>
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo =3D drive_get_next(IF_SD);
>      blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
>      s->card =3D sd_init(blk, false);
>      if (s->card =3D=3D NULL) {
> -        return -1;
> +        error_setg(errp, "failed to init SD card");
> +        return;
>      }
> -
>      s->enabled =3D blk && blk_is_inserted(blk);
> -
> -    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops,=
 s,
> -            "milkymist-memcard", R_MAX * 4);
> -    sysbus_init_mmio(dev, &s->regs_region);
> -
> -    return 0;
>  }
>
>  static const VMStateDescription vmstate_milkymist_memcard =3D {
> @@ -298,6 +303,7 @@ static void milkymist_memcard_class_init(ObjectClass =
*klass, void *data)
>      SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
>
>      k->init =3D milkymist_memcard_init;
> +    dc->realize =3D milkymist_memcard_realize;
>      dc->reset =3D milkymist_memcard_reset;
>      dc->vmsd =3D &vmstate_milkymist_memcard;
>      /* Reason: init() method uses drive_get_next() */
> --
> 2.15.1
>
>
