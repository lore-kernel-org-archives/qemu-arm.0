Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7965185lff;
        Wed, 15 Jan 2020 22:33:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQ8FR7KcYba/QXYKuVSNoHq9c7p5Z9bM/S4cq/g5ROGeZhc2Hyaxdp77XaAX8JJOA1Rsik
X-Received: by 2002:a25:618a:: with SMTP id v132mr23001853ybb.95.1579156438393;
        Wed, 15 Jan 2020 22:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579156438; cv=none;
        d=google.com; s=arc-20160816;
        b=HlWL289mw6Ih38xupPTeFVSkDdETZDiPDhNKKlgIMLAEr4a8dbTpkbjPrEsggiOCd1
         Jc3F6hVrX1N5jCx2UjyBmrG+BcypPHNotZ3t9W70DamFgT2g9/fd5heAVt/lw3nVNBrW
         BZVB/QRQPTpOUnwuaSTF4PNE71G6i70v4wZ8qNCV0WzvP9o65lrvGruii6F0FMSswu4S
         wmIpZCiOQrtuk0p1+jzHAq2N/OqxrQskFVozhUDvgkdaadMd6MrB5m6IqL3nirp+pcgY
         fGRmREnkgzBPDD658usrAqrPhahTD7wBTINtb+sUrRlKtx8hER/W4Gqgg5hAWD1L9ITY
         OTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id;
        bh=AKt2nHmbupDP1D7rMBG26S5XQ4QHheuKI1RGKLhxQ2A=;
        b=bwvVmZVJNCXCUQc0K6C6bRw6f5kciDL11eLruT4EvnkZFPPNMiBVHOrCieGgPZaV3I
         4JnscgWIK6NApMnXEYvXXKucQrq5XePUCK7J4ssrxpfYzhecSJLPLdYIg1SU5ovmJuq7
         cwDWk4geciUbqqraMON4iR7MrXLkMjhKet8vlJ6Xm6cM9qnkEBKyMphjAL4ufLKTBY1L
         txcjNKcSvkGeaw4CyVPrG6ApTE9rREPJk5svMVsxj20U9l9JMR+cOjNmj4lV2NFk98s1
         /yVsk9pZcIf+6OuH7rRsnCZYGtoPSEpoGGwi2zk0qvhHqx8GGQCSjrJgtVuCI1LoBNV5
         io9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id o205si13034701ybc.229.2020.01.15.22.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 22:33:58 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00G6XiWk027019
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Jan 2020 00:33:48 -0600
Message-ID: <15ba2e1f782eec69173fe9c0f85a4dcff1d57f14.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, qemu-devel@nongnu.org,
        Paolo Bonzini
	 <pbonzini@redhat.com>, keithp@keithp.com,
        qemu-arm@nongnu.org
Date: Thu, 16 Jan 2020 17:33:41 +1100
In-Reply-To: <87wo9tkjxz.fsf@linaro.org>
References: 
	<11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
	 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
	 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
	 <87sgkimkma.fsf@linaro.org>
	 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
	 <87wo9tkjxz.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZB0qgpoRoWGd

On Wed, 2020-01-15 at 12:01 +0000, Alex Bennée wrote:
> 
> > There seem to be some linux-user stuff in there, I'm mostly considering
> > whatever ARM does today but we can certainly extend later.
> 
> Depends on if it is to be used. AFAIK the main users of arm linux user
> are compiler test cases for M-profile CPUs. 

For microwatt I was going to implement HW support as well via JTAG
but the user linux-user bits are less obviously useful to me.

That said, most of that code can trivially be made arch neutral by
replacing the use of the arch specific CPU type with CPUState as
the first argument to most functions. There are only a handful of arch
specific helpers needed from there to extract the op & arg, set the
result etc..

> > The idea is to make sure ARM, RiscV and POWER use the same protocol and
> > code base to make picolibc (and others) life easier. Bug compatible
> > :-)
> 
> Hmm, I'm not so sure. QEMU tries to emulate real HW although I
> appreciate that is a somewhat loose definition once you get to things
> like -M virt and other such SW like abstractions. Is semihosting even
> going to be a thing on real RiscV/Power silicon?

It will be on microwatt once I add support for it. We could probably
make it work on real power9 if the systems give access to the external
debug facilities of the processor as well. I'm no longer involved with
powerpc in a professional capacity but I can ask Anton or Paul to help
there.

Cheers,
Ben.

