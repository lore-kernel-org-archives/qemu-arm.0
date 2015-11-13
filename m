Received: by 10.182.105.169 with SMTP id gn9csp1127437obb;
        Fri, 13 Nov 2015 10:52:02 -0800 (PST)
X-Received: by 10.129.154.86 with SMTP id r83mr23460560ywg.149.1447440722440;
        Fri, 13 Nov 2015 10:52:02 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x229.google.com (mail-yk0-x229.google.com. [2607:f8b0:4002:c07::229])
        by mx.google.com with ESMTPS id j129si15313315ywf.20.2015.11.13.10.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2015 10:52:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::229 as permitted sender) client-ip=2607:f8b0:4002:c07::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykdr82 with SMTP id r82so162156260ykd.3
        for <alex.bennee@linaro.org>; Fri, 13 Nov 2015 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=lIi8GYt/M6yjTOfTdmFTfsQbvUv/rkotfPCbhFU058M=;
        b=astixXppfHmBdJP42OeQ62Y1xLWmcAdEubmgw6OQsIaxSbH0i5wuFTpBLSevBrGpwX
         dQGeZyL7HoTAFzoCcE/cRnOdYkuAMgYv60vySYv/KlpGPKmAj7XCLYyzkTlTlkR7tyRx
         sAeo0qi56kQzcLIdayPUbXl6ZDGSBMDFnK4ofjG/VEeKBIsuexfN2p1fH890SXPXnKZs
         gh5mpqnyP2IzhKaUgNrJwrsl4Th1yaejiMMEwfKZ+Xsm6kGUwIrxub87hf05/98gUXC/
         F4Pfcz10KNq/lzDK5eDZ4ZH868GUF6RsgkDyAq8W54OdEVoSFK2V6IDsnqh3NMa6IeK9
         dAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=lIi8GYt/M6yjTOfTdmFTfsQbvUv/rkotfPCbhFU058M=;
        b=h8rF4MvIopzDKiS6O3THDpPF2xjYrHMGNzB+zbnzpvpzUZ5qOh3juSF5Tq78iazOiT
         itw82kHu9kLlE7Ei+bs8j6bn/PZKKReB86rq5UB9/3nbhImciWX0WmxbT1RX7dHKNgJ6
         mviCdxCzBmX4gG58thFrH/9W0Desm4AvQG/BIeGlE6xYvQGAjkxKzsXHDFiQLqCqaci9
         gW5osrDFI1OHm+5GDVFyeU2n30eKEYmwEHXvRHcm0OUx67T/JtpTc5Bb5ZIq+Jl4BoZa
         2eoBByJvF5pC7cOqs16Eb1azgOKTq5rfg0pHH9RagcwySVTPvHTFUafS5SyJoYwIO7Ox
         rFpA==
X-Gm-Message-State: ALoCoQlVpw85zADKKfxJTJskJTa7opzQ+1zlCtQancOwYwq5xyK3N2RznrfMDai2s8duTiUUnJD0
X-Received: by 10.129.99.195 with SMTP id x186mr21717040ywb.345.1447440722181;
 Fri, 13 Nov 2015 10:52:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 13 Nov 2015 10:51:42 -0800 (PST)
In-Reply-To: <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
 <56407AC8.9020100@redhat.com> <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2015 18:51:42 +0000
Message-ID: <CAFEAcA-rt0J-mHb8fdYWuk5FR+bTcZyvzXgYB-hk3HYNthNBUw@mail.gmail.com>
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: PiasBs3puPiW

On 9 November 2015 at 10:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 November 2015 at 10:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>> On 05/11/2015 19:15, Peter Maydell wrote:
>>> If we have a secure address space, use it in page table walks:
>>>  * when doing the physical accesses to read descriptors,
>>>    make them through the correct address space
>>>  * when the final result indicates a secure access, pass the
>>>    correct address space index to tlb_set_page_with_attrs()
>>>
>>> (The descriptor reads are the only direct physical accesses
>>> made in target-arm/ for CPUs which might have TrustZone.)
>>
>> What is the case where you have no secure address space and you have
>> TrustZone?  KVM doesn't have TrustZone, so it should never be in a
>> secure regime, should it?
>
> You mean "what is the case where is_secure but cpu->num_ases == 1" ?
> That happens if you have a TrustZone CPU but the board has only
> connected up one address space, because there is no difference
> in the view from Secure and NonSecure. (vexpress is like this
> in hardware, and most of our board models for TZ CPUS are like
> that now even if the real h/w makes a distinction.)

Looking more closely at my own code I was wrong here. The
case where you have only one AS is when the CPU is using KVM.
In that case in theory we should never end up being asked to
pick an AddressSpace for a set of MemTxAttrs that say "secure"
[in the new design where we figure out the asidx from the
txattrs], but it's a bit tricky to be absolutely certain that never
happens...

thanks
-- PMM
