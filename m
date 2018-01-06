Received: by 10.28.173.206 with SMTP id w197csp1574wme;
        Fri, 5 Jan 2018 18:21:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBovj5v1PFMRpjOOAO8zXk6d5/Q5/gR2MrjxRdJ8pzggh8SQEkBQOgw5uk8WWl+pB9TrTzPkg
X-Received: by 10.37.231.149 with SMTP id e143mr3175992ybh.457.1515205287389;
        Fri, 05 Jan 2018 18:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515205287; cv=none;
        d=google.com; s=arc-20160816;
        b=uaMIA8dw8iuFBXapZHUx4biNRjS8MZ1BdzH/mb/A3Z0+0OZNeYg47XFXLGYyplrU1R
         gz2gA1SykBNFCZ0fvAneuE2Auu0WxyU9Qi6fYr/Su+MZ/GrKU/pk/YttcNTF+d+BkkiW
         SgHt4lGvIX8Y/1+8OERHrpUMqimOsaocboBDtlCmosdALuy0xjghiLQoj9apgXQDxWM0
         mlZO9aByAD6k53B2mbY4k06UxG+zm8TYq/mql9cYOrY9wnTSzMCIPbsuu2QD9lkKo7NY
         DfkVKw1jz5uMiRxBdL9CNH/gXE4qE3voHfRNkWfiXaNQLqWB4haQDU63VGOmih0uft/2
         VCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Pp/o0jTW9T7lcFcmSKvrznlzKPetoR1OySVvAPBwkYE=;
        b=QYNIjZz8UnVEc9VVR7LM2wA6+iUUkLVjqwlBG3Qe1E+BVxYgljTjR3L/jzI5tmUKSz
         2FrxVDKmZwY5ByCgfWZLPoM71NIsDDAURb2c+EMrIHJG4wg5yop6HPKDHV34LHWgXdQ8
         538J3JEjCDuI/RKHuU8MXB0wDTfkVb+d4HCuBAma1UMgS60XhQkavx7wsF+oX8rlz6nc
         PDn+FPiY7rH/3wtklhPY3+YyZMt5VQU+vIe8xelT9ZtZ9ho/j8KlkRvnk2Uxl/BxBi28
         SybntgX97Q/IKgJiJDSc6v31hYluTbyPYc8RMJDF9VBmCmnd1R7JHDPf3rfJKALfd0Sg
         JcpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T2P+FlY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w205si1490794ywb.541.2018.01.05.18.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 18:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T2P+FlY7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXe6w-0007JY-PD
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 21:21:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe6i-0007IB-E3
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 21:21:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe6h-0005hM-MS
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 21:21:12 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34953)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eXe6f-0005f8-9T; Fri, 05 Jan 2018 21:21:09 -0500
Received: by mail-wm0-x242.google.com with SMTP id a79so5463099wma.0;
	Fri, 05 Jan 2018 18:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Pp/o0jTW9T7lcFcmSKvrznlzKPetoR1OySVvAPBwkYE=;
	b=T2P+FlY7sJ16gyG0IE3kdvPvBrjssQW0/hjVqRpNL/BfQFi7C+wnbHpucYVBoF/wd1
	mMv378q52Zy0BRItiA5YP8adToMPjjnvR2umecmT9bop5Lvjo+jE1h/KztQV9L372Cg3
	tG/7uF2Ri56XqsvM/pLwv7gBCKuHfuP7xHMPmK85u7DkZ4eHNl8zhPD5MiVG0/25YWHH
	qE0E2a4++b+cRxKRpj6uuteaYD1kmsCxOH6Zm0UwrXy79sIGrGSf0MABjT8720w7fcD8
	qunKzUYndmCAPkIgTFw5cFS8MWnT38BX6Of6Y5k8YzKerfWrvZfMpsR43Te4KsEt5bri
	Qwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Pp/o0jTW9T7lcFcmSKvrznlzKPetoR1OySVvAPBwkYE=;
	b=BEkvmmfehsuvD/wAq73OHpkjtKFkN970o0/N2hfmsg5XhPKduupXBGq3fuLuSzxx9a
	dUeil4oVH64ka04lSUBap8EslAf0x1YR9xCnjMutzfo/TMyLrXqdFxFxL80AHsLzzOf0
	W536A7w0hbMJk74MWhAJsvNrdvfaA+rFrT/iDpn/BM0tXXiPEORIgGZPN/43HfWBSTqc
	uhPbRanSvHu1InNuH8AfRODIGD8Co3zT9jL7DbsGlgs1KAkJ8hS2zy1cGN2rcy3TJfBt
	bZPnt/Un0krpU5A60ZuJlTdspy5Bcv3BKzSDkGSbxQvDBNNeWL9V3KaM6uUAqYIaZ6j6
	6Heg==
X-Gm-Message-State: AKGB3mLZi/Kos9pZxhJwY9tLLx7VA/nfm60tKHwWIooiLURTWrJT7Eax
	pLtrWc6ceAq0gxtOgv7lAE7Wh8HMaz5bjgJh7Xo=
X-Received: by 10.28.231.8 with SMTP id e8mr3471796wmh.16.1515205268281; Fri,
	05 Jan 2018 18:21:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:20:37 -0800 (PST)
In-Reply-To: <20180104144046.30793-7-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-7-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Jan 2018 18:20:37 -0800
X-Google-Sender-Auth: reUarO2eMNP9wn8now6RwiFf0bk
Message-ID: <CAKmqyKPGXMYH5AJRbN8x7ks42LjcdQUDaw9QutnbqG_7ojy=2g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 6/6] hw/arm/xlnx-zynq: use
 FDT names for the Cadence GEM
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
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ESFzF0Yj+GPi

On Thu, Jan 4, 2018 at 6:40 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 1 +
>  hw/arm/xlnx-zynqmp.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index c45c364583..5ae18921c1 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -245,6 +245,7 @@ static void zynq_init(MachineState *machine)
>      sysbus_create_varargs("cadence_ttc", 0xF8002000,
>              pic[69-IRQ_OFFSET], pic[70-IRQ_OFFSET], pic[71-IRQ_OFFSET], =
NULL);
>
> +    /* cdns,gem */
>      gem_init(&nd_table[0], 0xE000B000, pic[54-IRQ_OFFSET]);
>      gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 38f038786c..1aed89707c 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -150,7 +150,7 @@ static void xlnx_zynqmp_init(Object *obj)
>      qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
>
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
> -        object_initialize(&s->gem[i], sizeof(s->gem[i]), TYPE_CADENCE_GE=
M);
> +        object_initialize(&s->gem[i], sizeof(s->gem[i]), "cdns,zynqmp-ge=
m");
>          qdev_set_parent_bus(DEVICE(&s->gem[i]), sysbus_get_default());
>      }
>
> --
> 2.15.1
>
>
