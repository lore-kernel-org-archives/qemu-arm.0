Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1575491wru;
        Mon, 16 Jul 2018 07:34:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeHlQqNBaHWuDbpCJh7rhaQNPL4NLqtmP8s2mkETwQF7oRLxXAgSYSZf5bsVqsKEPp5MOHL
X-Received: by 2002:a37:1f87:: with SMTP id n7-v6mr13726263qkh.308.1531751640482;
        Mon, 16 Jul 2018 07:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531751640; cv=none;
        d=google.com; s=arc-20160816;
        b=1LBtOIXTeuZwApfifz2L2Co6wtqIaUyjw+szq6KnU7CHna7lTtWuhAspEMrmNalDmT
         bunfMqtXacrZB51een5diowjtvgwawL/JK7z/KZpshsij3aUeLOVBltZmJZlzYy/E5MN
         Pra6Tc2tUOtLgDZ94PTf2T/ut8zY8rQBIUzzRDbkFTDQ9KzzSf/O95FRpcu14G2aXZ1N
         Mu7C7A+8ymVlV8MxzqqHcqls+vbc+X+RbBR1pgI85Kf4CacSHp34ZyRYMzVFWjogaxsJ
         E3NXJiokh1Xq7DIS2QBcH8vI9BKfzaU3gKp/0PCUF3l7pzppffqOdzVpilX/FiSK0scm
         iq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9I9ghnsmHyTziDzyQgo+kXSOT3BMWZaLdtMv7vK5DcM=;
        b=Fg/urGKbpDtabSBKMb+LF5gEyF57+p/J7o2L+lRh2iwjSp1LSJWX580KilM4Y+2sm3
         TrNzRVvj48Zo6kPK5OJP/8LY4nJq0to5dE1tZ7YtJq3iS+ERyo73bmTxIXVbX+fjAfVI
         iRxZG9gp5KLX/ASLTnOJxjnY93MsNeYRqvokvwjHiuyDLNNVoXLTQ+XJB1mFqU5/5csy
         l7G//ntVfh9Kj7XAhra4c426xgIPerx9vdWxWYncPYeco/tcktdd0cWIob/UNat992Ia
         r5lfeP+ojtcrAuFk6j/FOi3DE1hMO4vg16BKrfTthfK4RqxmgN1lv8cd08mm9huNXLNF
         4NFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nf4JemH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19-v6si10254667qkh.271.2018.07.16.07.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 07:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nf4JemH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff4Zb-0007cX-TO
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 10:33:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff4ZI-0007ar-O9
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff4ZE-0003yi-KS
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:33:40 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34789)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff4ZE-0003yU-DC
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:33:36 -0400
Received: by mail-oi0-x244.google.com with SMTP id 13-v6so75187069ois.1
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9I9ghnsmHyTziDzyQgo+kXSOT3BMWZaLdtMv7vK5DcM=;
	b=Nf4JemH/nYgHiS2IMaTII0lNrDDfgZT/3DKq9GMaBJLG/LeXICXs58VYoVCf0Ak50L
	WFBVTHNapEr1HBbysuRu6ACtq4R1zpQdJE5yTbfvnVFrNhRdZxRUARstDdMtD1w3XzB6
	+iRlFbKQVhq2dxwddkonitDA1eiylM8yVvJis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9I9ghnsmHyTziDzyQgo+kXSOT3BMWZaLdtMv7vK5DcM=;
	b=ftBTqUhGNvabAV01vdtodlEVyZr8PM1fll8YbkdkfbOBoku4evlwJAgrKSMEd2/waJ
	sBbNzhJyG0et3iRtmA0pg+fGLUd9LNR1wMW0y/TVG1ks+hRwDO1Fxm2NvUUttuFlEE6u
	iN6M7c3eOauz0TjQulTIyn20pftAA2XhCPgW/4+BQ45rm9njtvr/MZSJf7Bd16A9IrKp
	h4169giRS6Zdack6o2Bm3X+k5nld5J7amUv1cx1SJ+IGZqeS5N/iCJim9zqqj5ukTM5i
	W9dTtYXcNhG9EkJrjg8sH0W7jzVLBMJjkToCws0+8qVer2Zq3yBY8eg6eaAJTtjVWBaB
	ha7w==
X-Gm-Message-State: AOUpUlGTB3RB/5cz4R1U+gOCKFIIlaBhoL5p7I3DMddn44Z7iHQMOv9w
	pMFsMmMfep3ff/rrW9Ejdesvy8k2yaQBu2OKeJidnQ==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr19259365oic.252.1531751615631; 
	Mon, 16 Jul 2018 07:33:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 07:33:15
	-0700 (PDT)
In-Reply-To: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 15:33:15 +0100
Message-ID: <CAFEAcA_k7Pq8MCJ+hEMO-9q=A=GkmjMgE-S1o4oU9MG-KLdPOw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman
 (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsYxYpFLDLpo

On 15 July 2018 at 23:06, Guenter Roeck <linux@roeck-us.net> wrote:
> Add basic support for BCM283x CPRMAN. Provide support for reading and
> writing CPRMAN registers and initialize registers with sensible default
> values. During runtime retain any written values.
>
> Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
> and raspi3 systems.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I don't seriously expect this patch to get accepted, but I thought
> it might be valuable enough for others to use it when playing with
> raspi2 and raspi3 emulations.

Looking around I guess that a stub version of this device is
worth having. It's not like we'd be wiring up the clock control
information to anything anyway, given that QEMU doesn't much
care about clocks...

> +#define CM_GNRICCTL        (0x000 / 4)
> +#define CM_VECCTL        (0x0f8 / 4)
> +#define CM_DFTCTL        (0x168 / 4)
> +#define CM_EMMCCTL        (0x1c0 / 4)
> +#define A2W_PLLA_CTRL        (0x1100 / 4)
> +#define A2W_PLLB_CTRL        (0x11e0 / 4)

The information at https://elinux.org/BCM2835_registers#CM
and https://elinux.org/BCM2835_registers#A2W
suggests that the A2W is a separate thing from the CPRMAN...

> +static void bcm2835_cprman_reset(DeviceState *dev)
> +{
> +    BCM2835CprmanState *s = BCM2835_CPRMAN(dev);
> +    int i;
> +
> +    /*
> +     * Available information suggests that CPRMAN registers have default
> +     * values which are not overwritten by ROMMON (u-boot). The hardware
> +     * default values are unknown at this time.
> +     * The default values selected here are necessary and sufficient
> +     * to boot Linux directly (on raspi2 and raspi3). The selected
> +     * values enable all clocks and set clock rates to match their
> +     * parent rates.
> +     */
> +    for (i = CM_GNRICCTL; i <= CM_VECCTL; i += 2) {
> +        s->regs[i] = 0x11;
> +        s->regs[i + 1] = 0x1000;
> +    }
> +    for (i = CM_DFTCTL; i <= CM_EMMCCTL; i += 2) {
> +        s->regs[i] = 0x11;
> +        s->regs[i + 1] = 0x1000;
> +    }

If you believe the register lists from the links above this
loop will set CM_PLLB, which is an exception from the
pairs of CM_FOOCTL/CM_FOODIV) registers in this range.
There are also a few CTL/DIV register pairs in the gap
between CM_VECCTL and CM_EMMCCTL.

> +    for (i = A2W_PLLA_CTRL; i <= A2W_PLLB_CTRL; i += 8) {
> +        s->regs[i] = 0x10001;
> +    }
> +}

thanks
-- PMM
