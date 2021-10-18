Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2845244lfc;
        Mon, 18 Oct 2021 03:29:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN9dw9JYZJtaEa6C+svAN6gkEQoMZ/LY8RCEeVEwHWYtCzK6/VoXlNZWoh1lJzCi6w5i0M
X-Received: by 2002:a05:6638:4197:: with SMTP id az23mr12263053jab.56.1634552995719;
        Mon, 18 Oct 2021 03:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634552995; cv=none;
        d=google.com; s=arc-20160816;
        b=k+bLHAezFKznKT5r4lMyFfu/hI/IiIL7OUGX1ChGC9DMIAxWzI9m3PqN2FCNGmNV0W
         dRixHzl9AIeEpy5Eotf+41vqhlGX8FhHDUoNz7pACQ5qGoUT5hZzedl/qKNPjpdU4Gwc
         7OpBrmMWpWMHyiXF1NZAEsC/8mNrQ/BbdnaglZj+8UBFyTsB2j1fj6QWyWjfBB+EEnmf
         Z96ouUVIfyHU7Y5FrYv6jtJOeWgfI6KBAE8uYIdGg0Txb7Ci5L9jRbnMjvCeek9Hvvsh
         rGZKCXvCmWSv3aJDZNmEcAVieywHke8/W5p0NigBh8RGjonrogFRGUDdaCV3rOU1W0Z7
         E2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=B22eGaGUOKk0J3SJZgsx1hP3MgcCddbo/mStgieP6e8=;
        b=Ny4pcYfvraGl4QMBWr3e97AZZ/5goqEkN9lNardHfggKQuD1zh2jHJ/J3I0BsVo2V8
         CGvyLCBI4HuQOqXSU5oj+z/VjX/e+8pv6YsHwh+Afga4gB5pvNDQF43Bn6PsT1Fwr9zP
         /eMawX+QH7lHfMCw1CfXyMRf0pE3wB2uwz5DoYMj8eyZwFlcyAzDtCkENAKWmhw49otx
         m415mGrU3pi7ZnPnFrBOixFv7+VMiLZGzST3nULV2pj+fPfwqOJe3ofwYaJeFZYbI27u
         McsLel4SdjsGmkxPZnrLBgkDF92xFFMuPp1j3vZ2eqqXflIKt5ysrQ0ZaRN4RqUsd8qo
         tpXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org. [63.228.1.57])
        by mx.google.com with ESMTP id i4si14222453iov.75.2021.10.18.03.29.55
        for <alex.bennee@linaro.org>;
        Mon, 18 Oct 2021 03:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) client-ip=63.228.1.57;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 63.228.1.57 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19IARoht018201;
	Mon, 18 Oct 2021 05:27:51 -0500
Message-ID: <a55f82099075eeaaa544f6f7fc7575b90d051caa.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with
 recent RPi kernels
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Date: Mon, 18 Oct 2021 21:27:50 +1100
In-Reply-To: <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
References: 
	<5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
	 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
	 <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
	 <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LSF7UMpOviKG

On Mon, 2021-10-18 at 11:47 +0200, Philippe Mathieu-Daudé wrote:
> 
> > I've just checked the rpi-5.15.y branch and it's the same.
> 
> Indeed. I stopped testing recent kernels because they use too many
> features QEMU don't implement.
> 
> Our model should generate the DTB blob of devices implemented, instead
> of giving false expectations to the guest by passing an unmodified dtb.
> 
> This is on my TODO, I might give it a try next WE.

Indeed. That said, we do implement the fb, so we probably want that
fix. The fix for the virtual gpios is probably unnecessary however if
we do what you want.

That being said, with those two fixes, I can boot the latest 5.10 I get
from raspbian.

Cheers,
Ben.

