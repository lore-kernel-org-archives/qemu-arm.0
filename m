Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4418864wrt;
        Tue, 29 Jan 2019 04:51:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6HCfPoQGfISyUPklEkrPa/Vyd4MejflV83+Mq9urR2fF+GMozz+mfieONbfNMy6nxqrQT8
X-Received: by 2002:a50:b0a4:: with SMTP id j33mr23935750edd.267.1548766267373;
        Tue, 29 Jan 2019 04:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548766267; cv=none;
        d=google.com; s=arc-20160816;
        b=xH13wdlxVwplphq0m4FsdTspL7yGQBPuDmIHsbbYw92In+do/r4gLC9AaMOifKmjEq
         bwxaqJLD3/oxEh0dhRoqiLuqoQd5rcMNFbHMNAJBADZsS1vd/KVOCqEge4lNlCw8Ad+G
         L19ZlNIqBg7o42RaefNTpmc/LMT+Av99fZ7YWOYaoYeXOIJZZb5iHzJAGMZdlmHU1Zic
         Umzh6JYrO3v5e7X/Z93b1kIDhNXej+mdS/paIosAOa8WraPSdnkUPlbKY8u8HJ7+7e6J
         tL7IcM61OaPRshKZNtluZ3wAsraCYAaAM+J3S8TtggJECW2m4i0e9MeAzFB8crI41sGa
         3SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=fr6V82jm2gK2k+9lVfd2tSScaYTQxZ95lhAgWeXbghE=;
        b=dO4CUNoVXoyu/tP5M++BbaQJp5tjSc9fl02CzIaI64KoH9ekkmQ0bGNt05riGiNmD8
         I+Uur0NBBjM2EUjzudV8/vhWZByZc8T1qMLdLmEBolENwswddCm7f8WPNpG0LNhmdoHe
         s4TXaDMvT4PndkazjmkKUEl8CFe3Ahj2j2LOvB2Z2L000zZfkFCA9cMQH7Je0GIMq7Sv
         AxgAk/a8S54oqzgx4g97+cQSRtfM3Oskx39VUTyKqAoAxuO5dRoXEde1pIWJKFY/M22D
         Oz5BQCEU/CuP7fzc9K5F+/BLeh9MM3y31xCRjazmZvSNn3tX4tVfJLUzG3FWbaogs0E4
         PoCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Return-Path: <mark.rutland@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id k23-v6si1010569ejd.180.2019.01.29.04.51.07;
        Tue, 29 Jan 2019 04:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45BF1EBD;
	Tue, 29 Jan 2019 04:51:06 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B67B3F59C;
	Tue, 29 Jan 2019 04:51:04 -0800 (PST)
Date: Tue, 29 Jan 2019 12:51:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Kernel boot regression with PAuth and aarch64-softmmu -cpu max
 and el2 enabled
Message-ID: <20190129125101.GC25983@lakrids.cambridge.arm.com>
References: <87va27n2l8.fsf@linaro.org>
 <20190129114609.GA25983@lakrids.cambridge.arm.com>
 <CAFEAcA-_ShbUthqPSPgEPmV0EeRUO85n=sC-+76gRAH830co_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-_ShbUthqPSPgEPmV0EeRUO85n=sC-+76gRAH830co_g@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-TUID: hvv5jAkUKvTF

On Tue, Jan 29, 2019 at 11:54:13AM +0000, Peter Maydell wrote:
> On Tue, 29 Jan 2019 at 11:46, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Tue, Jan 29, 2019 at 11:08:19AM +0000, Alex Bennée wrote:
> > > The -cpu max enabled a cortex-a57 + whatever extra features we've
> > > enabled in QEMU so far. It won't match any "real" CPU but it should be
> > > architecturally correct in so far we implement prerequisite features for
> > > any given feature. The cpuid feature bits should also be correct as we
> > > test them internally in QEMU to enable features.
> >
> > Just to check, does this enable VHE?
> 
> It does not. (We have no implementation of VHE yet -- as and when
> we do implement that "-cpu max" will turn it on, but today it doesn't.)

Ok. In that case, the kernel should drop to EL1N and stay there after it
configures EL2.

There are no pointer authentication traps taken to EL1N, so if something
is going wrong, I suspect either:

* a trap is taken to EL2, and we hyp_panic()
* an UNDEF is being taken to EL1N

Thanks,
Mark.
