Received: by 10.28.71.27 with SMTP id u27csp2449157wma;
        Thu, 15 Feb 2018 03:49:32 -0800 (PST)
X-Google-Smtp-Source: AH8x226J/w/fSPjs9FVnzSNnNvSyB5W0p9Lusme6gxKIhCg1O8iKg2Q3jZ4nKRUKnVPArHeEvOpt
X-Received: by 10.37.133.9 with SMTP id w9mr1665524ybk.51.1518695372627;
        Thu, 15 Feb 2018 03:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518695372; cv=none;
        d=google.com; s=arc-20160816;
        b=KwZmxrqvvkLF2cARDd6HOZZIiP6Py19SDWS9zgVxKjdrtXg2XbU8sXS5DIM6zBIYpL
         FhRppHynG29EWFgCO13mHct6mWh0+ZkjnOaU9Z7fvmeOoUJf+992Qjv3SwdGMoPLHMiv
         VQj4CQ1A7OYp+QjfOCt59W1FvL4Ulm8XwFqfXNt0P5IoCRW8uZVSzmwlYpHgT7lL3MhU
         KRkbiyuJ5mIKU/ku43DplWuqxX4vdcSdruND04pkI47qr4WA7M+aHyMrMM4EJf4SND/P
         8GLLWLxoqXJB12an8R/1/g9Zq1/wuTzZkgwsEWPkpsBbr1ekYLXQV2HEyJelNTai6U27
         sHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4LnJw6vWgkeuIlQNYl0Shq8CPfAuP07R3Cbv4aJGBS8=;
        b=cTjiMfRn+wgYdDfS8FKtzqt5ImsXptpm+VesEkvVikhX2L5MUE38xNhJMnXzJqh1vv
         625gPubs/WO6YGroOSsQ7hyyi+Td87A0jQbDiT5AvEN7wElzuEoZ1XhBnwu+Fxaj3IiB
         4IEiVpps42/e+ZJObbFHD4VfWvbQBwvWM3B3tEEP3V0IRyhJ+PR1IAyT0y1hw7cpRc/Q
         lRXKggHV3APF4v+2g0HyJCF/4VSeMqPee2Iv7bk60YEkfZUmNXvaWgGd0ZWQnSx2R2Of
         rChuJEIw9M9DvJslnd9mc/i7EeWBr1Hc8K6oLUyUCbt7g4JuxQG/CH27lobVvcs2D4w4
         QEDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fZN79kO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66si1151106ywf.203.2018.02.15.03.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 03:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fZN79kO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emI2e-0007er-1G
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 06:49:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emI1h-0006vy-O4
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 06:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emI1g-0002YP-MD
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 06:48:33 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:40281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1emI1g-0002Y5-Ef
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 06:48:32 -0500
Received: by mail-ot0-x242.google.com with SMTP id s4so23117242oth.7
	for <qemu-arm@nongnu.org>; Thu, 15 Feb 2018 03:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4LnJw6vWgkeuIlQNYl0Shq8CPfAuP07R3Cbv4aJGBS8=;
	b=fZN79kO3VxxDcgF6ZjmP04qctcBEU0L7HD9A+jvaG16gvoXcsdrD5UOXw9gy9fdqrp
	mL5UJ11nzENEhVg18aercefovWBTsaNY3XQBI53YSxCdjGbb+XIZUYvDYAS1PcuxzYEj
	ybcl55WjTg9rEDzrv+c/0mxgcf4HhNTzShKxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4LnJw6vWgkeuIlQNYl0Shq8CPfAuP07R3Cbv4aJGBS8=;
	b=a4oGeY0UGV+bMqAitmmECb2L5PwReXPKugMVcLYY9vriWaN8nmoq/jN/fVnlmG0ByA
	xMMa0+A4LGlAFBQQCJ7OBUhb3BGfhC7DUjPy7yGETHx9ICx0Tus8xrxqMxoL0XfoRnNd
	FBwKAypo4KcjCckfMT0w8+npzd++DuLaJnV+q9dn9zvPODye6UlitkUi7zPltjBQ/Mje
	dYMpB4zvyMsAxrtEky0BuRmq0qSloDePAH2XVvYrn+2Ln4RJw9XfmWBJuIEUGQpX6R71
	dNskDZShlrVdcMcoWygFHKuhYgo8ueiFzXCawcYeVomyFjEV2AtumFGOWvLGce/DvLd2
	292Q==
X-Gm-Message-State: APf1xPD4oc6P5aoZsDXm4Lm51KaA2MbJkq1vn4qh0QqUi6igsxZ/j9Bj
	qvnegkw7pX9ZBfBfk1al5NI9AUnSzKloQRjBg8fvMg==
X-Received: by 10.157.68.215 with SMTP id p23mr1490718otg.91.1518695311615;
	Thu, 15 Feb 2018 03:48:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Thu, 15 Feb 2018 03:48:11 -0800 (PST)
In-Reply-To: <20180208055039.24666-2-penberg@iki.fi>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-2-penberg@iki.fi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2018 11:48:11 +0000
Message-ID: <CAFEAcA8EWmaf5JWEmgBsNknTHuKDaHCnEAQgatn7Ppq-Gy8Fzg@mail.gmail.com>
To: Pekka Enberg <penberg@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v1 1/3] bcm2836: Make CPU type configurable
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8clFgQ/pXftC

On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
> This patch adds a "cpu-type" property to BCM2836 SoC in preparation for
> reusing the code for the Raspberry Pi 3, which has a different processor
> model.
>
> Signed-off-by: Pekka Enberg <penberg@iki.fi>

> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -135,6 +135,8 @@ static void raspi2_init(MachineState *machine)
>      /* Setup the SOC */
>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
>                                     &error_abort);
> +    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
> +                            &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
> @@ -166,6 +168,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->max_cpus = BCM2836_NCPUS;
>      mc->min_cpus = BCM2836_NCPUS;
>      mc->default_cpus = BCM2836_NCPUS;

This change means that instead of ignoring the user's -cpu argument
we'll now unconditionally accept it even if it's nonsense for this
board. Neither behaviour is great. However, the patchset to allow
boards to easily specify the valid set of CPU types is still in
code review:
https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg00308.html

so I'm happy to take this as-is, and we'll add the validity check
when that patchset goes in.

thanks
-- PMM
