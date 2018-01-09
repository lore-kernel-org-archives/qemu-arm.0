Received: by 10.28.173.206 with SMTP id w197csp3906906wme;
        Tue, 9 Jan 2018 08:54:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBovFzCkIbEwtMwz0qgyeF7Kndvrl8zPmBrTUOhgh8F583H42fDlKMfugOggWlORrNHmS+H8D
X-Received: by 10.129.41.79 with SMTP id p76mr1856683ywp.181.1515516886385;
        Tue, 09 Jan 2018 08:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515516886; cv=none;
        d=google.com; s=arc-20160816;
        b=W3+9UmBjrumfhqHydatxOeu8GbWrkP7//32pwSaRNhwIjYNNfW3oUb34x74sfwQCPw
         0xLK2R/yVUHNUYtUn3Cl4z5pkXzWUBLV/Q1clHCKBw7iixPR2XhrTZ1XLFmj0Pa9XcTK
         YiiKwPNmW6uHJJOGl5UH+kLGN1dWNShF39w7sU2eDGlFpJ5joEDbWdP1T31zAQPWtm39
         GqD14v4OsPDVKjUW67DlUjX01IlPUEzhxQsZuhER4Cy9eWzBfkyODwfLPFgL55+xzXxV
         2akkIk/uit7Y28SqVsSiJuPJvl7W+N2t1f8h+d98gpOZjYnuv6/gTJOxywQ2orZmkU9p
         S6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:message-id:references
         :in-reply-to:to:from:date:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8TL813pm4l4IpjcTMctZnt8zOfrzTCwb6wILeB3SHfA=;
        b=prf9YJHtItVK+055NgJNXtt8Kv0ppznO0T429geujttlXlvzNXvVeDQElCWXfyCNoU
         v/TJbQ0Fm4xKQpdDNYY9mXtPkNyo2M595NgetlSmPHt3JJy0LA0QGOADHUa6QXNCEDXZ
         T/4E3QSxnSr4Rn1xvlXAQ6XqMDmhnu6I6DTFiaGVxym6aIXQuW7x+w5By/jDhpnw6asZ
         OowrH7XaycQ9RgZDZKntY8c33u1aNhxbZASwyMnSphGgDNZLVqXZ6mcxlSD8w4OpocbA
         lThFwa+PYR/nP8Kgdp1iA5Q2FUIBwI53kLJjDi0pL09TYNQpNTittjZDJHc8u0aUZ8Ls
         ZRGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@walle.cc header.s=mail2016061301 header.b=QGFufOhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si3030071ywg.506.2018.01.09.08.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:54:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@walle.cc header.s=mail2016061301 header.b=QGFufOhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYxAj-0002mv-TG
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:54:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1eYxAa-0002m9-D0
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:54:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1eYxAZ-0000Kl-Az
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:54:36 -0500
Received: from ssl.serverraum.org ([2a01:4f8:222:d45::1:2]:52859)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1eYxAY-0000IA-Tl; Tue, 09 Jan 2018 11:54:35 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher DHE-RSA-CAMELLIA256-SHA256 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id C14F922234;
	Tue,  9 Jan 2018 17:54:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1515516870;
	bh=ga/Rg7IMsdxfMhlPNvKR13sc3kROjThbc/aDcvmYU2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QGFufOhrZUzBxWvQZ4AT2RddrbmBM+s++a0twt+rGLTtO0DHguXpP386C5SRJhv+8
	ouO6EpJe3cji/v8xxuZCJLyEPQCAoyacyHmRmBD3FzLxB62CajHI5xaQx3Vjo5anCu
	hqw3QopeXV4dPiz4OBldmH13GQm6+GhO7dgtGBG8=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Tue, 09 Jan 2018 17:54:30 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
In-Reply-To: <20180103162400.10396-3-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-3-f4bug@amsat.org>
Message-ID: <60c89dbec86c14e2f0883d121872d0f6@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:4f8:222:d45::1:2
Subject: Re: [Qemu-arm] [PATCH 2/6] hw/sd/milkymist-memcard: split realize()
 out of SysBusDevice init()
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
	Xiaoqiang Zhao <zxq_yx_007@163.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jXJJ/A88vIbE

Hey Philippe,

Am 2018-01-03 17:23, schrieb Philippe Mathieu-Daud=C3=A9:
> Create the SDCard in the realize() function.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/milkymist-memcard.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 5de3e00e2f..5df3a0f815 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -255,24 +255,29 @@ static void milkymist_memcard_reset(DeviceState=20
> *d)
>  static int milkymist_memcard_init(SysBusDevice *dev)
>  {
>      MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
> -    DriveInfo *dinfo;
> +
> +    memory_region_init_io(&s->regs_region, OBJECT(s),=20
> &memcard_mmio_ops, s,
> +            "milkymist-memcard", R_MAX * 4);
> +    sysbus_init_mmio(dev, &s->regs_region);
> +
> +    return 0;
> +}

Creating the device (milkymist_memcard_create()) fails with an=20
assertion:
   sysbus_mmio_map_common: Assertion `n >=3D 0 && n < dev->num_mmio'=20
failed.

because dev->num_mmio is still 0. Seems that sysbus_init_mmio() hasn't=20
been called yet. Do we have to move the milkymist_memcard_init() to=20
.instance_init?

Eg.

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 5df3a0f815..21c0e91926 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -252,15 +252,14 @@ static void milkymist_memcard_reset(DeviceState=20
*d)
      }
  }

-static int milkymist_memcard_init(SysBusDevice *dev)
+static void milkymist_memcard_init(Object *obj)
  {
-    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
+    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(obj);
+    SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);

      memory_region_init_io(&s->regs_region, OBJECT(s),=20
&memcard_mmio_ops, s,
              "milkymist-memcard", R_MAX * 4);
      sysbus_init_mmio(dev, &s->regs_region);
-
-    return 0;
  }

  static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
@@ -300,9 +299,7 @@ static const VMStateDescription=20
vmstate_milkymist_memcard =3D {
  static void milkymist_memcard_class_init(ObjectClass *klass, void=20
*data)
  {
      DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);

-    k->init =3D milkymist_memcard_init;
      dc->realize =3D milkymist_memcard_realize;
      dc->reset =3D milkymist_memcard_reset;
      dc->vmsd =3D &vmstate_milkymist_memcard;
@@ -314,6 +311,7 @@ static const TypeInfo milkymist_memcard_info =3D {
      .name          =3D TYPE_MILKYMIST_MEMCARD,
      .parent        =3D TYPE_SYS_BUS_DEVICE,
      .instance_size =3D sizeof(MilkymistMemcardState),
+    .instance_init =3D milkymist_memcard_init,
      .class_init    =3D milkymist_memcard_class_init,
  };

-michael

> +
> +static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
> +{
> +    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
>      BlockBackend *blk;
> +    DriveInfo *dinfo;
>=20
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
> -    memory_region_init_io(&s->regs_region, OBJECT(s),=20
> &memcard_mmio_ops, s,
> -            "milkymist-memcard", R_MAX * 4);
> -    sysbus_init_mmio(dev, &s->regs_region);
> -
> -    return 0;
>  }
>=20
>  static const VMStateDescription vmstate_milkymist_memcard =3D {
> @@ -298,6 +303,7 @@ static void
> milkymist_memcard_class_init(ObjectClass *klass, void *data)
>      SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
>=20
>      k->init =3D milkymist_memcard_init;
> +    dc->realize =3D milkymist_memcard_realize;
>      dc->reset =3D milkymist_memcard_reset;
>      dc->vmsd =3D &vmstate_milkymist_memcard;
>      /* Reason: init() method uses drive_get_next() */
