Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2479572lfc;
        Sun, 17 Oct 2021 17:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoUIWvTmiiM8pf+CEK0JzaZeYRbfIhCtQwt6T7DBpdR0v0u2scKtxKuOz0K+1VavPauF5k
X-Received: by 2002:a25:adc5:: with SMTP id d5mr5336892ybe.537.1634517801708;
        Sun, 17 Oct 2021 17:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634517801; cv=none;
        d=google.com; s=arc-20160816;
        b=Qw2EB6T4ecz/5o0WXgynVMUA43sByZqxPpq2jEjkq1eJVn4e6KgTEbsqF/uw9MS9gT
         IO39n4exFS+2BV4RVGKobjC4AOYXyHoXQsUiKfNo4/VlZKrYE7mjQPbFHjwK2doBt9fr
         9ToK51v/i7TdWX1nh8Jfb+mT7BOVadyaVVlvH5Fvce7qEhPqrZSofH2aqLYWkfuQpsnv
         VDpi2GtgLZatcLMSkah8UMocy+PS3Km/Pcgiidz7f1JQKUFuK+0J97h3UH7bhfsxBnL2
         1odjoDTmCBQXW7fqoryeRPamCwUx7tWWgNwBdzpHI4pC3FTvdt9NYprQOeOmaGdaLvAY
         hmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=63cEuuAdfzcbX28lKcQas+H+n2hFuHdcnj+k4IDEc1s=;
        b=a2cj5Ypd1v1VBOH/aS8Qy2kXfO3tzJSi3iF8G9X5TqIyi+2KnJCpEz0kx/1RJzO/zR
         HgS9QOT4uGZTdeq2gZ7r1ZpvX2dVSCcd6i3jRaSABbiAIBQ0pXDUM7cBHuYP6BF6bCzo
         5lNrPwdwJsDtyYoQ6QBjQ0AAE9ffl+KnsfAXMKzDAzuszqHrcO7VBGa8H2jPWHHLO3jk
         Y4nkgXuK/HNKadWG8GtUvDmZRYm/zLGhJS8qP9ZyWMByCjEPP6bD+03C3hGG8P9mCGzQ
         4+R7OewK7CEcUSJIOu8pajwmKUVL7UbR7+hkUwmJtTfvmmPBtxPmmen79gZG5US2BplF
         JPSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org. [63.228.1.57])
        by mx.google.com with ESMTP id p189si19874451ybp.294.2021.10.17.17.43.21
        for <alex.bennee@linaro.org>;
        Sun, 17 Oct 2021 17:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) client-ip=63.228.1.57;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19I0f9q9024702;
	Sun, 17 Oct 2021 19:41:10 -0500
Message-ID: <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with
 recent RPi kernels
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Date: Mon, 18 Oct 2021 11:41:09 +1100
In-Reply-To: <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
References: 
	<5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
	 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z0MjAc8uW4mm

On Sun, 2021-10-17 at 17:08 +0200, Philippe Mathieu-Daudé wrote:
> Hi Benjamin,
> 
> On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> > The framebuffer driver fails to initialize with recent Raspberry Pi
> > kernels, such as the ones shipped in the current RaspiOS images
> > (with the out of tree bcm2708_fb.c driver)
> 
> Which particular version?

The one I dug out of 2021-05-07-raspios-buster-arm64-lite.img (note
that this then fails to boot some time after the fb is setup, even
after the fix, in the vchip driver init (before serial is up even).

That said, the same fb problem happens with 5.10.60-v8+ from raspbian.

I'm not sure your fix will work on these, see below:

> +        case 0x00040013: /* Get number of displays */
> +            stl_le_phys(&s->dma_as, value + 12, 0 /* old fw: unique display */);
> +            resplen = 4;
> +            break;
> 
This should have been equivalen to not having the property. However,
the failure path in the driver looks like this (note the mismatch
between the comment and the code.. this is rpi 5.10.73 from the rpi
repo :

	ret = rpi_firmware_property(fw,
				    RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS,
				    &num_displays, sizeof(u32));

	/* If we fail to get the number of displays, or it returns 0, then
	 * assume old firmware that doesn't have the mailbox call, so just
	 * set one display
	 */
	if (ret || num_displays == 0) {
		dev_err(&dev->dev,
			"Unable to determine number of FBs. Disabling driver.\n");
		return -ENOENT;
	} else {
		fbdev->firmware_supports_multifb = 1;
	}

So it appears that the intention at some stage was to set only one display but
the code as written will fail to initialize the drive if the properly is absent
*or* if it returns 0.

I've just checked the rpi-5.15.y branch and it's the same.

Cheers,
Ben.

