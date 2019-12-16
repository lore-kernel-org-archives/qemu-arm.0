Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4712367lff;
        Mon, 16 Dec 2019 07:44:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZ2D1N2uEhCyXFC2EwB0BJGL7Fnp7R8WefHcDJQDdeUchtRCO2kYN+2q7+yHdRS63omA39
X-Received: by 2002:ac8:67c6:: with SMTP id r6mr24487105qtp.42.1576511071142;
        Mon, 16 Dec 2019 07:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576511071; cv=none;
        d=google.com; s=arc-20160816;
        b=awBWJ8cx4aTRddg+sDHn7BuG8NQTUYOkuGNCFXhD+yCCgunHbdBtv6HOzyppHonXUZ
         yNHGXG3B8g+UTcoc6+k0yvGEgGTrVpEThUDN/pE6RZp9vwOmupeVrpJrxN7BAhQpK9i1
         1/Z0hHIHtc9TfX+6OFBwbfqfyrK4hZNEkoCYCkxtpYv/VZrwRRlPFX+pcBmEBE1r2O4d
         0QB1pX5+zde8AlemaGRNwRLFbFdDg32OR3djC7QOqJYBVnzTjZjqJb+KAgtuKi/mD7pi
         yGsSX4oClFzWbz7StVpdQxxi12CZ8OTJYhnc2iInWEKMB/fWrKz73622nDtIcaBYf1+I
         j1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KpCH6ZwqEOP5jhIVF4FH+hLREz6L24C45jAN2PLFqpA=;
        b=fXv6Iq8F/U1E0Crz1ZghzWtLG5ysH1AoDIZzX5gZqN9zXRKCbLgGMdQtPDaPyWnnla
         OyAInOTEosw+WHLLUlzqHiGYnCZrMphY50Ca1EQGzRd48Hmu5Ty6RsdPrPEP/QNEOJWJ
         mCi6yU3eAM/1kqNX3XhWtYMvQJxr059dPjoG86Eh0sb+ruHJ6T7Ncan5K2d+U8HZAUR/
         Bu5bciOtFk4gHFHt3eXJQA1NhYf0VwPOcuPZ9sRGX7K+TreEyR6Zr6VbGplGPqXvy2PQ
         bOFIbRJKK+HNXadDClw0N2QU8Hh8f3U4s3nRjFhcGWhNdGhQMoYSV6uBcvVFFmS1YNgR
         oJeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x0IRJblQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si5909977qkg.133.2019.12.16.07.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x0IRJblQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igsXu-0008Pn-FX
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igsXi-0008Ma-GT
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:44:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igsXh-0003Rz-Gq
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:44:18 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igsXh-0003QW-Bw
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:44:17 -0500
Received: by mail-oi1-x242.google.com with SMTP id 6so3635448oix.7
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpCH6ZwqEOP5jhIVF4FH+hLREz6L24C45jAN2PLFqpA=;
 b=x0IRJblQ0iBiMkD575D3nz/0svhnHhzPDpNjafxUpqhLw3htp0/aeDRRL9OaLTRzt+
 huLwhC1kAfqUzaaYCM48hZlaBIR0uOrbnpABy9+IzEKGwjLGfynqs1jIrwjiBoScCL0e
 S6WsXsveN6vC3JR9SrkfSUJkPypNW7/kTTxnzsSw2vrH+CxfqEXCJw4AbqXhIPsL333S
 E7G3rh1cmxvslBHFTa9gKngW8R4z9byK3pz7zrNY9yyCoV/sZ/MNODxNYGfCP8bm+qgS
 V+66KyHIw29QMCt5OLtaUcf0BETTVFJ+eYqx2AxfJeuz6q+2FUxU9Yh5BT0Xz0xMVzYl
 F3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpCH6ZwqEOP5jhIVF4FH+hLREz6L24C45jAN2PLFqpA=;
 b=MoAqm8jmgSsmcqmDsvn0AxJWNb9ECttYZqtWQSPxiTske2bs1POqVeqPL3ky9JB3nB
 D0DTWFRvFeVP/3REGtBPLysZRlxZ7ym3GhwHWOlry/Sj631Dg5Hm4KKVO2H9iB1BsHt0
 Z2HnJFo6ouenOjzWAw1QyU2wqs/dEPMgO7/li4frCCZq+OGGjxusoiSBZPi5GO+5YuXg
 Is0ThqmWv1r8CQe8oCwoRiOxtYq1fTY9d72jg3AnGKiwxlHROPRymrpDRwIatookc53f
 ogKWHNSWDAo72XMgpFD+JmW1+PUElGv1FpHLi+wDB7TV5PtEOsCjOl3hPVufYWR/lt6a
 AgNA==
X-Gm-Message-State: APjAAAUEyW9UB2R9Xrmi74LpM6K1RNUwzoBG+8246Q69yLsMTCcSx97x
 6iY3PVbXZtT+pkvlvOKlQqAKR39MlhW+4Wvld7T+fA==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr10220024oih.98.1576511056477; 
 Mon, 16 Dec 2019 07:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20191212173320.11610-1-drjones@redhat.com>
 <CAFEAcA9FprSotg11rS0fM94QiciysZ6kgKhyU4eQfZg7YYaL5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9FprSotg11rS0fM94QiciysZ6kgKhyU4eQfZg7YYaL5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 15:44:05 +0000
Message-ID: <CAFEAcA_oF2MX5PGNtp2YZeNRHB5vHM8NbMqQs2=2sAw1PnqfBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] target/arm/kvm: Adjust virtual time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+StemE8oKDX

On Mon, 16 Dec 2019 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> So, to be clear, you mean that:
>
> (1) the kernel headers say:
>
> /* EL0 Virtual Timer Registers */
> #define KVM_REG_ARM_TIMER_CTL           ARM64_SYS_REG(3, 3, 14, 3, 1)
> #define KVM_REG_ARM_TIMER_CNT           ARM64_SYS_REG(3, 3, 14, 3, 2)
> #define KVM_REG_ARM_TIMER_CVAL          ARM64_SYS_REG(3, 3, 14, 0, 2)
>
> (2) some of the RHSes of these are wrong
>
> (3) but the kernel internally is using the same 'wrong' value, so
> userspace also needs to use that value, ie trust the #defined name
> rather than manufacturing one ?
>
> That's awkward. I think it would be worth at least having a kernel
> patch to add a comment clearly documenting this bug.
>
> (This error seems to only be in the 64-bit ABI, not 32-bit.)
>
> QEMU does assume that the kernel's ID register values match
> the hardware for sysregs in some ways -- we use this when we
> construct our mapping from KVM register IDs as returned by
> KVM_GET_REG_LIST to QEMU cpreg definitions and thus CPUState
> struct fields. I *think* that in this case the only visible
> effect will be that gdbstub will show you the CNT value
> if you ask it to print the value of the CVAL sysreg.

...perhaps we should work around this kernel bug in the
kvm_to_cpreg_id() and cpreg_to_kvm_id() functions. (Need
to think through/test whether that would break migration.)

thanks
-- PMM
