Received: by 10.28.71.27 with SMTP id u27csp12309wma;
        Tue, 23 Jan 2018 14:51:37 -0800 (PST)
X-Google-Smtp-Source: AH8x224la/g/yWE1PTqpqPVFPCqLWc6lVBmqVWCizZYXp0zLH3y299E2iOBD0Uhd14maEwOHAMui
X-Received: by 10.129.45.135 with SMTP id t129mr3880549ywt.64.1516747896936;
        Tue, 23 Jan 2018 14:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516747896; cv=none;
        d=google.com; s=arc-20160816;
        b=uLdicGoguu6soWYzv+oF+N5c5ni6UmDqp/V4a/yoCLN6HN1vQXY5XYp9o/5mutu9aq
         GpuaaPncczTxdhOd0tvFGCHQbxitx0OWvbyvjAT7Zw98JEhDcKZJpZc1dIr3dFxMTeFh
         BH8vy6DaA6iueHovOebblgEbdF+OXI3h+8o5+w4959LQa+yzKDQaI1Rxuk+m1tJXKOha
         QYnUp42Lw20TjuMopGx5rwMzZNcFpOTPZ+JoNKRZap6fv8R8MNJyKanxRQEufXiyQU+7
         PQNUmK41o6YTnDAMuWndLZsIuAq0iMsprgCyCy8TwnktonsIgLsmen3Cs3XCkO5uRwef
         4DYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=T4Fk2HPY9/y13fRCM0KNq72TMqRuzl6q8I5rCW3utJ4=;
        b=SJgL6jRe4baszQR1yOi6pALMEozWgNYNuWPMj5pZ5OLhtqsU1DCdz+H+hzY+rSPT2u
         hyFlCyXdxA2kjdMazqDKoCfqxkfRPzSL1znb0nyWidXh02CHG4B/v3Wo9QrIYrSCkxOK
         YMVAq7x/euzZeLNLDhDuat4Gg5BuOJXR7vjXd3HvwQFe3ZVxJn0sxQpDwp7bnox8JAEb
         ymSUI+f2upUyjSpCD16hV187iihhX2t+ceGGaJKMQNeJ5FRuVwHmDNcDoS8K0mOVX3q6
         /pMUFEbplX+O+SMUQsKHdamBLAROMhqEUjGA1cugp55hVnrudiAt1FE70XiYHx12hwku
         o1Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XVH8R0R3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k81si2604176ybk.546.2018.01.23.14.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 14:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XVH8R0R3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7Pk-00086X-Cn
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 17:51:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7LP-0004s6-Oo
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7LO-0004TX-2J
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:47:07 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:39914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee7LN-0004Rc-MM; Tue, 23 Jan 2018 17:47:05 -0500
Received: by mail-lf0-x243.google.com with SMTP id w27so1427404lfd.6;
	Tue, 23 Jan 2018 14:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=T4Fk2HPY9/y13fRCM0KNq72TMqRuzl6q8I5rCW3utJ4=;
	b=XVH8R0R3ZFxahZyGW6r2Muj/pKsDwGAVOZE+j6FWSsQ7fwyAEEILdbdX8UPCH8HHWt
	O9YoNr2ECp2ZUXCcTfsvXCL9Qm1a+vd4TixgWgQfShNDMKIge3GnKtKrKv9KmW5l2s/N
	imHtMuuPZGgVKHLipXUSHLxIqFv/sGNLFB5EpHMn4VIVmPN6ibXUZJGZjiXAF8O22y9C
	mHtKtEDie5CPSpFmDJ/W5L7SbTgc2IsS53nLZPVvWjspJy/bHcG8upNtJzz3l9XXA9jh
	m9PM625YFIQx4mEqOGWls8keqriiECYh/Bk1o2yl80U8IQhCT4t7eb9OXymvwFQXzWcZ
	aiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=T4Fk2HPY9/y13fRCM0KNq72TMqRuzl6q8I5rCW3utJ4=;
	b=IvDy0Nt8oXhVm/n48ZD02o/sxwwq1ftrXqsnWu/cUqKzkFPitkgv233LhRGD8HZLjb
	laQGLGIs34M5I6gvi7qAx2+qRKbGAq/PAIbHfa3uNhFzl9Tontux1sGB8ZGWHYrmzmvG
	1cuzlYbudkC+sx7HGdJxH0UKO7fNLt4N5pe4qA0n2ZeNKZ32LnU1NYo+5vfC7r4ABv+0
	XIoP7ff/u9oKwJi8DvpWODb5Xlk7mkitfreCGR1Fv1cH03ktTBfFPIPlx1rfm3MLd+Hu
	Mz+MDIN6iSkaiK/aNB1A48FxjPRy9rkFoVAJj4T81dpiTIa9CJG9Ml1B2Ue+IEC4N25c
	I8Mg==
X-Gm-Message-State: AKwxytduFZH95akc4pWELN7P/QaIyXIiRexys5/Gc9VI6AJuJ+enNYdz
	A1IaQndHW62j7ilGLL3jOvLNkoTBO231A6SjI1k=
X-Received: by 10.46.41.93 with SMTP id u90mr2155359lje.35.1516747624420; Tue,
	23 Jan 2018 14:47:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 14:46:33 -0800 (PST)
In-Reply-To: <20180123030630.26613-10-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
	<20180123030630.26613-10-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 14:46:33 -0800
X-Google-Sender-Auth: xBdFpHqbDvdc4Rm_FI-n8b02J8c
Message-ID: <CAKmqyKM3TpAF3bJMpiYF=JVRpiuMJbfSTMOeRgm2i3EerTeadQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [PATCH v8 09/14] hw/arm/fsl-imx6: implement SDHCI
 Spec. v3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /gfr+Z4POhpQ

On Mon, Jan 22, 2018 at 7:06 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
> various FreeBSD console output from google search show this register havi=
ng
> a value of 0x0377c800.
>
>  hw/arm/fsl-imx6.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index b0d4088290..1f4607f206 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -27,6 +27,8 @@
>  #include "chardev/char.h"
>  #include "qemu/error-report.h"
>
> +#define IMX6_ESDHC_CAPABILITIES     0x057834b4
> +
>  #define NAME_SIZE 20
>
>  static void fsl_imx6_init(Object *obj)
> @@ -348,6 +350,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error=
 **errp)
>              { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
>          };
>
> +        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
> +        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-versi=
on",
> +                                 &err);
> +        object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABI=
LITIES,
> +                                 "capareg", &err);
>          object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized",=
 &err);
>          if (err) {
>              error_propagate(errp, err);
> --
> 2.15.1
>
>
