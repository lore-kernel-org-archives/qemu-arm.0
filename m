Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7738248lff;
        Wed, 15 Jan 2020 18:01:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMAcZL4s1/vpFz6/LSkcz3OgB01pfWFKiyyK2yRsR4id0N+UeefgwFTFPhyNL82YHjj7Lv
X-Received: by 2002:a5e:c907:: with SMTP id z7mr23626810iol.88.1579140099473;
        Wed, 15 Jan 2020 18:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579140099; cv=none;
        d=google.com; s=arc-20160816;
        b=SdPgcwuQQ3Tsnw4x6cIrhaPtGTAYaJPh/TtBi1huHf1a7QmeXI5dE3CXznZKKcx8VX
         Oc5eN/bNOIQmf5LG1BH63y4vuPdhbzOemfJcHyxLQD5yXuPRnU2WOxE34qPW/xQ10c/f
         XwHoYJjSqhUNi1SWsls0YamG9snRuOSeAP/3DXaORXIVPrlgt46TiYpiq6xE0dYiHZY/
         VJLppe51wpNueNifnQk7C3c1chYecDw8cBtVY42rYEd/p+TnIiMiAB+y5usDfIyrWh/M
         XmglopAtvrCS/9ekzkMLgqqMWPnULUSbzzov8XB6sBCOihPOc8MYdS8yRZjEV1dt624u
         +YCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id;
        bh=zFRMS/C5DfSlN18BBAMpmKFft89B3e25aZ5AltDt59U=;
        b=K5w9y1qJRpuJbJcRCPNrEbnUsnx54w/VIz5fxFk+M6soP06OPfyExRJLPEjdEfBXjB
         yoKDXDmBKLYP5rSaIDrNqREQJjvYKwpKgC2l55gn2TRkGUAipX7ieQKRIcMW5BnIsi2y
         pMlducvcTb1fMRP12nUBRc2tkAZ09rxp84yIIg+SsfLro/5afDXbSpF085uBLMKvKUAd
         8qWDyvGx102dzsMLQpQU7fXHUTE66IahIWPJlsLqC1QxHtCRwlW1w0qMAxFxhJkPtEvi
         yVMF+rIvgNy+hw7CDIgPtTDcqvE9Ck9F1dkBOlu0sc6Rr58yQEtyO0dyPs63sNtQ1L9A
         VsUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id n134si11561060iod.43.2020.01.15.18.01.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 18:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00G21PXT024767
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 15 Jan 2020 20:01:31 -0600
Message-ID: <5dabf7d9e2af43d6c01d2e7e51e466616d84a8df.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini
 <pbonzini@redhat.com>,
        Keith Packard <keithp@keithp.com>, qemu-arm
 <qemu-arm@nongnu.org>,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Date: Thu, 16 Jan 2020 13:01:23 +1100
In-Reply-To: <CAFEAcA8mphBky9Q2HTdOpQHiizd+5-o=yRnBbd_k1y6Uk-h8dA@mail.gmail.com>
References: 
	<11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
	 <CAFEAcA-A_caQgwi5DzExdZChoTg-Qa73hq7Ho7dPLiN633Yj1Q@mail.gmail.com>
	 <3ab2ca1f7a9b37b201a58f3a817edc5193e8b1f4.camel@kernel.crashing.org>
	 <CAFEAcA8mphBky9Q2HTdOpQHiizd+5-o=yRnBbd_k1y6Uk-h8dA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: q9yoq34OSw0G

On Wed, 2020-01-15 at 13:32 +0000, Peter Maydell wrote:
> On Wed, 15 Jan 2020 at 01:17, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > On Tue, 2020-01-14 at 09:59 +0000, Peter Maydell wrote:
> > > Note that semihosting is not a "here's a handy QEMU feature"
> > > thing. It's an architecture-specific API and ABI, which should
> > > be defined somewhere in a standard external to QEMU.
> > 
> > There is no such standard for powerpc today that I know of.
> 
> So you need to write one down somewhere. You're proposing
> an ABI which will be implemented by multiple implementors
> and used by multiple consumers. That needs a spec, not
> just code. I don't want to see more semihosting implementations
> added to QEMU that don't have a specification written
> down somewhere.

That's ok, I can probably get openpower to put a link to the ARM one
somewhere :-)

> The point about the mistakes is that you can't easily fix
> them by adding extensions, because the core of the biggest
> mistake is "we didn't provide a good way to allow extensions to
> be added and probed for by the user". So we had to implement
> an ugly and hard to implement mechanism instead.
>  New
> architectures could mandate providing the good way from the start
> and avoid the painful-to-implement approach entirely.
> (I think RISCV has already missed this window of opportunity,
> which is a shame.)

It is done and so now we have two architectures using that standard, I
think the value in using the same overweight the value in fixing it but
yes, we should try to agree on a method of extending at least. Is it
really that hard ?

IE. We could add a new call for capabilities that takes a pointer to
a region which we pre-zero before calling in the client and if remains
zero after the call, then the new stuff isn't there for example. That
sort of stuff is easy, or am I missing something ?

Cheers,
Ben.

