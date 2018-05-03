Received: by 10.28.4.212 with SMTP id 203csp1670379wme;
        Thu, 3 May 2018 02:18:31 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpzBSHunACaPID42Wb0xy07AzQX30JqIVsJZtzLpBO329OgqCR2se7bNBCBMDMnDs3YQJsj
X-Received: by 2002:aed:23d0:: with SMTP id k16-v6mr15870727qtc.20.1525339111660;
        Thu, 03 May 2018 02:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525339111; cv=none;
        d=google.com; s=arc-20160816;
        b=qZ0aBD4LxUuPnQg4G1AhlWQs0od+clVv0GXAguYa7q2BryQtsYtWiSfYZJFYuFdIka
         S+PjHdOX4DA2aEiRCzAL0QD9i601zEVMeLgkyjJ9PRxLXXNSeWeoKgLVeJKnc20/OVWE
         dOfxsLrxBCEF1NKyz2ns/Y4J3SJxwWw6SDgUJs+yYNAi8pOKwpQP1SxbnjJyfhs+Fwb4
         beG6R+w3pLnP2TblEAJyvD23y5OWqrfKULa1qTiiQb6HN5jYhqYXzK8WNOw86HvS2JsA
         P8mRTbwfB6ekRkd9c2OF4cTxF0+w144GKuMqKinAiYe5fU29+F6va6+/JBXd2TrLNtCN
         BvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=a0rEG5vqvkX2DKAk/uk/e4eO83O3wmuU+ZsOZ+xpcHA=;
        b=RLho6ZO9d4zJQqFujPXysLSg5KpQhfAZJDYRMzhM5c7JmW17/kTZCa74F3hXvk2kDy
         AyU5NYpxam1YE7ZD+Sy7uYmuVovlN/yTZfGfyM+YA55HkqMnwSFh4y97YGKS8Qsi16jQ
         Y4DZEtp3TCGxWD/5qygWD3+ncvn9tA8jDHVMKlhGByU6fsPkZ44mNI/RYStAaqCFOpsL
         bc69n/AjVLSkiAhMc4FRV1vRY4DR5ptl1+9Svg0a+k3J1TY966EepY+A9jcnetwW4K5E
         /yEq7pyy9PrelxxSTmG3mabYDBOVB90Ipgk01EbMJUCYjuQJFJfGNLB9bEGVNP3aRcXw
         VErQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J/X72F2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u53-v6si1155382qvh.212.2018.05.03.02.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 02:18:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J/X72F2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEANj-0008A0-5B
	for alex.bennee@linaro.org; Thu, 03 May 2018 05:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEANS-00086b-N9
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:18:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEANR-0004WZ-BK
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:18:14 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:43218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEANR-0004WC-5t
	for qemu-arm@nongnu.org; Thu, 03 May 2018 05:18:13 -0400
Received: by mail-ot0-x244.google.com with SMTP id y10-v6so19808576otg.10
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0rEG5vqvkX2DKAk/uk/e4eO83O3wmuU+ZsOZ+xpcHA=;
	b=J/X72F2jk4fYhyOHP9uMUPbRJW9H94P3OY4KDmZN9xNNzVhC9A+n2djUL9QwL2FMd+
	W/xe6jzgBKc3WEGOX7abYLJMwljpXnq2xc+HD6OtburImfC42DfbY08N8ufXUhMf0aPD
	/czEpTu3+qIAIaIwRvaCICgHvyQtcK3RuZPyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0rEG5vqvkX2DKAk/uk/e4eO83O3wmuU+ZsOZ+xpcHA=;
	b=pgUjdZ6dax+Sr02eYoPRAJ3Dz2uxTN/L2IWeLq+FYSPNCJaCeG+dYlg05UdLpQhjk5
	DMsLF4D7gKwLAXScHC21JlvYI2Xyqgowrhjw/KHA6mmYV8ZuD+0QByPPWH8YgUm1hr21
	S2afOHXAw8F/0kk6KG9BoF6e5ss7h3BjtxR3Z3KSWrP8fsuJZsU2KK0jR7yFoqTAccCv
	4JFlCZ8gtNsJgNiQw1Wtmqd7qx20X3ay9oJyPK1iTdA04Q71NO5mJtk4+pgoEDfmUZeP
	wsQ05HPp4WFslThrzE43Rb938/ykpdFMJN3hXE3TOTPsZ8Wo6zsArIMY30awq6NUtJ2o
	jyYg==
X-Gm-Message-State: ALQs6tAhX9sE87JrfqJUrsQSHtzfz2mvamx+RrNbwhncRNd12OUh8o1f
	qmEfOSRZeab+V3JTIeIbsCa8Fhka8qpcwtLuzPOiCQ==
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr15167270ote.126.1525339092418; 
	Thu, 03 May 2018 02:18:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 02:17:51 -0700 (PDT)
In-Reply-To: <20180503090532.3113-2-joel@jms.id.au>
References: <20180503090532.3113-1-joel@jms.id.au>
	<20180503090532.3113-2-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 10:17:51 +0100
Message-ID: <CAFEAcA_4EiWXdSNdbiEWO_Q2Sac7qzNduhyWVNwW-crc5=w_nA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH 1/2] arm: Add Nordic Semiconductor nRF51 SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sx/VC2jrkpgy

On 3 May 2018 at 10:05, Joel Stanley <joel@jms.id.au> wrote:
> The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
> plus other common ARM SoC peripherals.
>
>  http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf
>
> This defines a basic model of the CPU and memory, with no peripherals
> implemented at this stage.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

> +static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    NRF51State *s = NRF51_SOC(dev_soc);
> +    DeviceState *nvic;
> +    Error *err = NULL;
> +
> +    /* IO space */
> +    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> +
> +    /* FICR */
> +    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> +
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
> +    MemoryRegion *flash = g_new(MemoryRegion, 1);

An SoC object doesn't need to allocate memory for things like this:
it can just put them as struct fields in its state structure.

> +
> +    memory_region_init_ram_nomigrate(flash, NULL, "nrf51.flash", FLASH_SIZE,

You should pass in OBJECT(s) as your owner argument, not NULL.

> +            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    vmstate_register_ram_global(flash);

Rather than using the _nomigrate init function and then registering
the ram by hand, if you use memory_region_init_ram() it will automatically
register the memory for migration for you.

> +    memory_region_set_readonly(flash, true);
> +
> +    memory_region_add_subregion(system_memory, FLASH_BASE, flash);

SoC objects should avoid directly adding things to system memory.
If you look at hw/arm/iotkit.c it's an example of an SoC that
takes a MemoryRegion property from the board, creates a 'container'
region, adds the board memory and its devices to the container,
and then passes it to the CPU.

> +    memory_region_init_ram_nomigrate(sram, NULL, "nrf51.sram", SRAM_SIZE,
> +            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    vmstate_register_ram_global(sram);
> +    memory_region_add_subregion(system_memory, SRAM_BASE, sram);
> +
> +    /* TODO: implement a cortex m0 and update this */
> +    nvic = armv7m_init(get_system_memory(), FLASH_SIZE, 96,
> +            s->kernel_filename, ARM_CPU_TYPE_NAME("cortex-m3"));

We recently refactored the armv7m init code so you don't have
to use this function. Instead you can:
 * in this SoC object, initialize and realize an armv7m object
 * in the board code, use armv7m_load_kernel() to do the initial
   image load

That way you don't need to pass in the kernel filename as a
property to this object.


I'm a bit reluctant to take these patches until we have an
actual cortex-m0 model, because anything we take into QEMU
master is then something we have to support. My rule of thumb
is that it's ok to have board models that are missing
functionality, but we should avoid models that have wrong
functionality (like the wrong CPU) where we can.

thanks
-- PMM
