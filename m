Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7321755wrx;
        Thu, 11 Apr 2019 08:32:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwXgnXtKJEAijZ289wg9MI6eZKPRmbS74dAD9llbX4lUlk+GVSFBDQ9XvWNLj6xomA92zZ
X-Received: by 2002:a1c:e185:: with SMTP id y127mr6576587wmg.76.1554996768367;
        Thu, 11 Apr 2019 08:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554996768; cv=none;
        d=google.com; s=arc-20160816;
        b=QbbBShgBM98Rq6SKtLpb69xZheMJCNiZcL+6b5WI91NzAmWig+gDELPET+VrZ7Rp/q
         /P8u6jI6+l8i96lb7vAKVDD+DN/YQcdxt3nrC1cf/iiOjYduFb5cEwzNVhCzzreSVYf3
         bsqoOTMCrhTsb/sD4F+9Ax84ULIiHVlXFHyzaDwJMR2s9WSNg9gYwlP+K6x1K+cv8Mwz
         hsrJg0gneupEoI/wbgQYjhQnbG876MlciLiJJRKWcfCm6qJ5ooGfs2WHuevtizLrQUcb
         kfIKhJq9OTDxwTnAgDx7/hylrHhbzGdyEdTxuR3ou5lGzdGvD7aB2YH1HZPLOegXV5g3
         HhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=XYYsrFHGswDJzCTPuKo+xM5aht6kUZN06zVl0UdRDwk=;
        b=o3nLKkiPU2vhDU16QnXXAPtdAj81zbm2uEHdWbGmUdxykF1VhDtGAzsuNBgYpyd054
         Ofq1bE8MMqERHWSS4e/xMYPd0B5ZnV3AJQWf2oueVjLPUx4sKbcvNI250CLEAlwXlr7e
         1/US/lG3Rg9EQBkVAnS6/t9x6X9H/1JfG6FpcKWBiL+Tkon8a5dP/oncFp4oegS1dQRT
         9LTk5qekDE4YHSudN3uM8mEG1TLbpsjDmrTNNLqBlz1jihl5iU4nZ0T8WeaN+HIdre/K
         TsgYiAbLkl0/ZMLm2f9wmkNzAMzqZXorkOg03rUznRfwErLlUBhEiCHpsw/B9Bd0+iAB
         CkMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xHnKzDwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si24749352wrr.246.2019.04.11.08.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 08:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xHnKzDwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEbh1-0003mo-Cn
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 11:32:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEbd9-0000Pj-GR
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 11:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEbd8-0000qk-EO
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 11:28:47 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEbd8-0000pm-5p
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 11:28:46 -0400
Received: by mail-ot1-x344.google.com with SMTP id s24so5558097otk.13
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XYYsrFHGswDJzCTPuKo+xM5aht6kUZN06zVl0UdRDwk=;
	b=xHnKzDwLKfAS0xebJ1gwBuFO2YYe0dy0LBxnGJhj45/cQOGNz6+Mt0iQ3TtLX1/XFQ
	KC0rdsTibG8xRzVipQpQmZz+BMvCJ5uqW8j2YYSQjk8VOIJztv3b1OtlvAAzY6qWbf1o
	YWnwjM6XpQaVX4KNkMlG6WMH+4Ko/NFczCQKfiL+l8+6ONwlZaEMcWW0nVMlfQM5fiTq
	Ufh7P4qq8JkaB+iP6sP+KpoymmPScHnJxzqaJR1llfCDs0HYcAFiqwiiqRUSEtxaAEcs
	0EA80P1lmH+khvNdPIoODOTxmNy5QxlL8SC7dD3jOBnvkPrAysbood4Ewmg9q6OCDyAj
	HSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XYYsrFHGswDJzCTPuKo+xM5aht6kUZN06zVl0UdRDwk=;
	b=iWRDjHEJI/V6N66743RM5baZPxALEaTuCb5f+jbjcu+Hz1rrJ8Sz5Cof2yjLPi61Oc
	me/ymrhXUwSVSHHctEqNJK1zbalj+LEtbLQ3K8orEtzC2uTzWvZG5xAHx7cyXXUjoObX
	jyLLEBG0yir5xKY+ziSp6MsuYVjG9aFpUtSUNdMQxZv1aMzjgLTSSMvMhONWA7jbcjdE
	FWgBPVKnC7iSsBicQ2/OIaHrpPKrKFZnFRZG68StVRqMKc9plgItemZ+vhJtbF5wGHL3
	U6vyOu5Ptb9FET0dDkACxIGn6BzO9LavL9/qVvCbxIH3JzbiCq8l0wIY2oB5+LNk1GYf
	3+Dg==
X-Gm-Message-State: APjAAAXleZYkGZdh3K9b3sxfNxXkkp2OQVmYSs8zt+cTmVFNQ+89S+X6
	Kft0QNouZ25NzFMC9un21L/BOngBCB6MDnIqqDa4bYd9WzM=
X-Received: by 2002:a05:6830:1cb:: with SMTP id
	r11mr27768250ota.302.1554996525415; 
	Thu, 11 Apr 2019 08:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190328062222.8409-1-joel@jms.id.au>
	<20190328062222.8409-3-joel@jms.id.au>
In-Reply-To: <20190328062222.8409-3-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2019 16:28:34 +0100
Message-ID: <CAFEAcA9G9Xrt5nDRJrSCC1SdeR987YzK+etRLTSyokLE+yyJSw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/aspeed: Add RTC to SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPxtHpBnQtEJ

On Thu, 28 Mar 2019 at 06:22, Joel Stanley <joel@jms.id.au> wrote:
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_soc.c         | 15 +++++++++++++++
>  include/hw/arm/aspeed_soc.h |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index a27233d4876b..628ec633c91a 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -32,6 +32,7 @@
>  #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
>  #define ASPEED_SOC_SCU_BASE         0x1E6E2000
>  #define ASPEED_SOC_SRAM_BASE        0x1E720000
> +#define ASPEED_SOC_RTC_BASE         0x1E781000
>  #define ASPEED_SOC_TIMER_BASE       0x1E782000
>  #define ASPEED_SOC_WDT_BASE         0x1E785000
>  #define ASPEED_SOC_I2C_BASE         0x1E78A000
> @@ -135,6 +136,10 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
>      qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
>
> +    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_ASPEED_RTC);
> +    object_property_add_child(obj, "rtc", OBJECT(&s->rtc), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->rtc), sysbus_get_default());

These three lines should be written
       sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
                             TYPE_ASPEED_RTC);

which is both shorter and also avoids leaking a reference to
the child object.

(We should also at some point fix the existing uses of this
pattern in this file.)


thanks
-- PMM
