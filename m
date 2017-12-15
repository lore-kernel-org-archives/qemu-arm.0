Received: by 10.223.159.74 with SMTP id f10csp6982781wrg;
        Thu, 14 Dec 2017 16:59:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBovxk4CMedMrc5IywaF5KF/viA5+c8u8LLqnWsLdsaGKg5wlzwSyC6nj0KV5xs05OJO4QyV5
X-Received: by 10.37.117.5 with SMTP id q5mr5819175ybc.504.1513299544818;
        Thu, 14 Dec 2017 16:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513299544; cv=none;
        d=google.com; s=arc-20160816;
        b=DujMRJbDu10iDTAI3Y8r5kM862qnbzIxTTJJDW35mQMZwb7t3Fh7SDHcAZDliKbwQ6
         w0fLZF0yzJwf2Wxhvqx3F7IYOH/zUjxGIgL3Ow10VlQFYXQaS2aGYUu7+rJ1NAbvuxcV
         2ZADDhpRK5laIvAp/FI15rcbyQpBie8jcwNWK/L2KSWsD63FNKxip7Xr5zSZ2OD8orPQ
         9Ada6a3Yoh84FK6BX3bGUprdG+e6Wb2eQmq0/BDlVLdOaKM4it87TrtQcxOrt/ikIAdA
         pweyAUl/PQ2FN2a5+r4yH7l0ET/ZEH1kTCpEy7EGvFEdiGov3NKfRonkNlDRU0KKGyPm
         1BpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=NP/nEDFyh5MkoUR1CUgp6Ji6kK2PPZ3JwSl8qpKH97E=;
        b=AYSxRdAYRsqm2G72UAyAuBPxxRim0Ly5EpSpgA+O9nTsfnq9oALWcvgvOngogmaXB+
         0/LRMQpOuGfCmu335bZDQpEd51JAKmeKCo8Cu/pRNXxtrDQmf9sO3kSk8jJUSC6UThMM
         MXOPoKPk4PX/pR0mvV1xYDSpkxYRvATjLatU5NdIULPRLz+FbWqXlSG59MmbFuLF4MM8
         SsL5DwXAaFjgBTjBFyjPT6pF6lAAHfurDOWp1wSC7YlptzK7PGUyfLV2XW2CVn1cfoyA
         aRPUbYz0ZwGg66K8kPL1GueBBu+DkWRNGVZdXtttJyxwMtDrdl3/ZYjGciv8P+JgKjyH
         zfNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YCnsWDwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g136si1067738ybf.294.2017.12.14.16.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 16:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YCnsWDwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePeLA-0004Ej-7a
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 19:59:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePeKs-0004Ci-OW
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 19:58:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePeKr-0007ub-Po
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 19:58:46 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:40869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePeKr-0007th-IQ; Thu, 14 Dec 2017 19:58:45 -0500
Received: by mail-wm0-x241.google.com with SMTP id f206so14599351wmf.5;
	Thu, 14 Dec 2017 16:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=NP/nEDFyh5MkoUR1CUgp6Ji6kK2PPZ3JwSl8qpKH97E=;
	b=YCnsWDwOf7hXhjPFI4+EQnGDyPz6O5e6KOIlsqhRuNhWFzwUcz4loD52fajrU5U7fC
	Obi/8suHygjmlfRC4LVk4gaPCsLSucdsD9SABQ7ASYPZ+/diz8Ibp9/oucGDvmG2oNNd
	LZ5LUnfO5feVqju/JcpOYqhMJbKT+CBZxpXQqqhhwajOxeoa/artzFl4agD1vO7wAElN
	dUoBkZssQR0Gi0eywGDqP+l1NGQo2cM5cHwvOVM9EBAVXn2EPlWbPRxbuvKDKRTcnbio
	HZEQzgiVBy8nsitR8ssrnpAUEFyHQ9PHxWKnNHH2mrrauoJ7Z+sqpVWReAqZhtoatnm5
	DwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=NP/nEDFyh5MkoUR1CUgp6Ji6kK2PPZ3JwSl8qpKH97E=;
	b=ZkUWD5wnRMbjjJQZmHwRZ19cry6a7k4U90ICFX69E3zzFqvEpFpmWrEiCDGy94QOID
	nwZhyH0ZcpYdBnc3jm7xKsFs1WlexipYDhZDwKoPRT/KEb+JiaANsVm1rbTPtmY3M4k7
	8tZBwlaPdwhLZim1UxHLkkRtL2han/+Y9m/jxudA1b0KXCtAIxpFMHp2xNNMyyL+oxxl
	rXdesfIgJMF3zl4wbda/iq7x3J98PTKznkLvLJ84+n+yy3Jz5ANyaCC284xdibHgx8bZ
	VqW4cLU1iqpsta2Xa3LHrSUSyUIMlDKfggMUTibWTM11Xbp8t7Tdhvrd/GILj4KkZunv
	LC4w==
X-Gm-Message-State: AKGB3mKhwaahr/KtqbLOU2YXgZlZhqkPZ6HUW5aGvdL4cy0OYK62DK3B
	Edda/zXvFTU7tsNQShKndxV/IyfqUX8tR+dlFqU=
X-Received: by 10.28.202.11 with SMTP id a11mr3838252wmg.77.1513299524382;
	Thu, 14 Dec 2017 16:58:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Thu, 14 Dec 2017 16:58:13 -0800 (PST)
In-Reply-To: <20171213204436.5379-3-f4bug@amsat.org>
References: <20171213204436.5379-1-f4bug@amsat.org>
	<20171213204436.5379-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 14 Dec 2017 16:58:13 -0800
X-Google-Sender-Auth: qLM_5urcwSJUDadScwJj7r8CSlg
Message-ID: <CAKmqyKNq92a3P-M9x3P2sRBHEq7QuyRqvbSyOFgUQLrN_ejVPQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/11] bcm2835_peripherals: move
 GPIO 'sdbus' property link from init() -> realize()
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Yt3Zqx0qFgl

On Wed, Dec 13, 2017 at 12:44 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> We can then use dynamic sdbus creation (from realized HCI devices).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/bcm2835_peripherals.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 12e0dd11af..7f30f19c4c 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -112,11 +112,6 @@ static void bcm2835_peripherals_init(Object *obj)
>      object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
>      object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
>      qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
> -
> -    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
> -                                   OBJECT(&s->sdhci.sdbus), &error_abort=
);
> -    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
> -                                   OBJECT(&s->sdhost.sdbus), &error_abor=
t);
>  }
>
>  static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
> @@ -314,6 +309,10 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>      }
>
>      /* GPIO */
> +    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
> +                                   OBJECT(&s->sdhci.sdbus), &error_abort=
);
> +    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
> +                                   OBJECT(&s->sdhost.sdbus), &error_abor=
t);
>      object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> --
> 2.15.1
>
>
