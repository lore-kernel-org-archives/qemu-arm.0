Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp398551njb;
        Fri, 4 Oct 2024 05:11:08 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX8bOcaPBXGO0Lk2g1S7svnXTljNGuj1AmX9EA7++V2cFRFh3rzKCYMEY88qQaN22/Hxdb8XV4NzJ2Bpw==@linaro.org
X-Google-Smtp-Source: AGHT+IHHoqbyVPd4JuLSeSinQb/r0YHtItWcBlzdrfi+4DleD1emWdOdaqgyoV7aHjgUU8p2ubZD
X-Received: by 2002:ac8:718e:0:b0:458:32ca:a306 with SMTP id d75a77b69052e-45d8d0b93bamr92364261cf.14.1728043867784;
        Fri, 04 Oct 2024 05:11:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1728043867; cv=pass;
        d=google.com; s=arc-20240605;
        b=dQdl/c1975xUIij4rU7trX+ZR7YhYYwpT02jwB/KQXmoCBoq6pXraz9yKMmMEpJkrX
         0EK0Ds54qFyRU80vK+EztmDdHhXvV14xEzDx77G5sphamyQxU4V+dt9gHkX258dU2SEL
         xmN6kJCX3hvmSYV67zLFs7TysVPmur/+F4wO9mclPpAZ0TSQLA43I9fHuQMUaEGvg4uZ
         D1fyQXFATAdDXxu/tz90CqqtMvcFidluck6gEwKDOBr8/NYMsd4p85Xok5PyJ5PKietI
         ynPI60YY2lNF+95ZE0LES7z4gF2RKYaCHq6nGCu+eT9aP+HPsbTdJZ25EM/91VRiSKUL
         Am4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=nLRWxfYoK6Cafgt/qUAdxdQ9UmXyz/QoFGn6MQbA2BY=;
        fh=/LHt/0/ta1Z4RpjXtg9aTIQE1/OTneDV8E7++ai6Ghw=;
        b=IKcTdG2gWUVNZeq8V3kWuX2ZLgfLk0x4qyq6RD6AkAylY5m5Q8Vk2kkvBcMf930+dA
         jQYFrZ9C8B+SUdYFiER8nroTwc/QPZmK+rcXaZizAGo8jR0gxyqgMLKRxBEou9/YDVWt
         DG1/nqKEe3gZBnjRjx36716PI86FaGuirLIRitBh0qBv2Pih1NR48L5YtJ+uLHUJ9H/s
         95G4EkhbR1pr4zTkiEZFGbuqRFH4vCqM+rPBMqigMQo1ACq+A8h9m8gvQZOGkrTXDQoB
         1zo14ynJ7J/aNJAegmNnJZq1/UaLK/xKh8C+zgomdjVAuX64OJ66fxkAAsfuA+ISvSAM
         urkQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFzb2MPl;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvmarm+bounces-16160-alex.bennee=linaro.org@lists.linux.dev designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvmarm+bounces-16160-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm+bounces-16160-alex.bennee=linaro.org@lists.linux.dev>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-45d95399a08si31971141cf.235.2024.10.04.05.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-16160-alex.bennee=linaro.org@lists.linux.dev designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFzb2MPl;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvmarm+bounces-16160-alex.bennee=linaro.org@lists.linux.dev designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvmarm+bounces-16160-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F101C20F6D
	for <alex.bennee@linaro.org>; Fri,  4 Oct 2024 12:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F30015B0FF;
	Fri,  4 Oct 2024 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFzb2MPl"
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7015A849
	for <kvmarm@lists.linux.dev>; Fri,  4 Oct 2024 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728043864; cv=none; b=RZNkuyxeI4KDvGTCkFdxXkFrQQyS2D8VMpbRUnTUJT2poEYGla1xbjXdVOfF2zVXvcOQNBKSG4gE3OXJK9IGIh06D3ioyel5Kt3djVAZoflipJkoumWK0m4SYcLxR/ZYC+BMW2VpQCIbOuN/DeHauyeFoXIw374P1sUerCyekcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728043864; c=relaxed/simple;
	bh=98x+DS7oU+wIiN6bcto2bvBmsfMEBT/Omef5cOzT0d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWMzgI/GohX2vfRrDNKhYToQw2fs7VVv+MDoik8lYdGTT5BlVdaunIIk93pSXZtFuLSJJ97U2XiiUjlpgpZ5CDAbURVqGhy/Vo+L2+YQgqhmW+H6QC2pwSorR9SkYIF2N6VhpM7QrWaMYMT9m1KYZLsmWbajZereNKqWfjloenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFzb2MPl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c8952f7f95so2295216a12.0
        for <kvmarm@lists.linux.dev>; Fri, 04 Oct 2024 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728043860; x=1728648660; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nLRWxfYoK6Cafgt/qUAdxdQ9UmXyz/QoFGn6MQbA2BY=;
        b=YFzb2MPlqe55jPhs3q+Reldnz8rTdHJ9AuD1xldpxhLG1WfG0WLn+9wOKcV58mNiP9
         t5i8Ti1DcI0w+sDJwI0Dq1t4IJbLqY4pm5FRNMzGxO6UA0et3xSznhqq6ZYgCokFvOqc
         HF4AlxSCNpLJfRe3KCRDGm0mC6TFq2eFckDvMNsbzIOvYxJXIaUJDlT5//6ZfOL+ujmZ
         uRJkGs5mW9wQL73lyJmMCTzD81XZDk32kcXCCGsVR7CE8tSllMQyCJhb1OXfrvFbBlYK
         fbKlSXSqw2gQ893k1ljVdHhyV1vLIkk68wwaG6NsnzNpLL7x4bqMaxX0AuWMYSVipF3+
         L9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728043860; x=1728648660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLRWxfYoK6Cafgt/qUAdxdQ9UmXyz/QoFGn6MQbA2BY=;
        b=wSKgy3d24Tsw2mI/RbVXtxH9+fswnos4VsnnWj8hJH+kB1wO4j5yZ57saK0XDfL/N1
         29RBHyJklF8KmXiTcXcRZrl1gS2x672szriIYHvrROCmESTl3rgoVBYxuSxceNln3EPV
         BXhetbU09atQPcjY28GZx1PXa4UVVBlh+f6Wv2D7rA8Lj0ds6C4rstHbhh2tD1uVUkKN
         k/XifvQJGCs9vLbiTPm088fYpHg22h4xDA+fk5u5wDIXxgS/J++DptL8bhQIIRpypXJS
         Qv0Ks6Qb/sHfbW0BRil73yRrVM5ChIfVJ7paPy3ej54g1njI785F6ehPVs3ambOGYG//
         it1w==
X-Forwarded-Encrypted: i=1; AJvYcCWYKSkDyS8Y/TdfioGNI7I/Ty22AYupSgXxaxf/qIAob6PgLdJmH0dEO0tri8KUDZQrCdal59U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+CwgWEAe622T8hpP5rENRG8ouqccaSa3U6vltezF0fVq99C4u
	bwEi8laG+eTe5Kc6S9se81sWhIy/l8811mMRXqBhAzu6BLQZMAlyWPimXeL7hakbDG6s1UNnPxP
	GSjvgPi8wfL133lWwHOE5s0tbO8dh4jYM0R41/A==
X-Received: by 2002:a05:6402:26c8:b0:5c8:ae9e:baba with SMTP id
 4fb4d7f45d1cf-5c8d2dfcf50mr1510339a12.2.1728043860273; Fri, 04 Oct 2024
 05:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
 <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com> <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
In-Reply-To: <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 13:10:48 +0100
Message-ID: <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO address
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: qemu-arm@nongnu.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Yu97WyD8ccG0

On Fri, 4 Oct 2024 at 12:51, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Peter,
>
> Thanks for your quick response.
>
> On 04.10.24 12:40, Peter Maydell wrote:
> > On Fri, 4 Oct 2024 at 10:47, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> I am investigating a data abort affecting the barebox bootloader built for aarch64
> >> that only manifests with qemu-system-aarch64 -enable-kvm.
> >>
> >> The issue happens when using the post-indexed form of LDR on a MMIO address:
> >>
> >>         ldr     x0, =0x9000fe0           // MMIO address
> >>         ldr     w1, [x0], #4             // data abort, but only with -enable-kvm
> >
> > Don't do this -- KVM doesn't support it. For access to MMIO,
> > stick to instructions which will set the ISV bit in ESR_EL1.
> >
> > That is:
> >
> >  * AArch64 loads and stores of a single general-purpose register
> >    (including the register specified with 0b11111, including those
> >    with Acquire/Release semantics, but excluding Load Exclusive
> >    or Store Exclusive and excluding those with writeback).
> >  * AArch32 instructions where the instruction:
> >     - Is an LDR, LDA, LDRT, LDRSH, LDRSHT, LDRH, LDAH, LDRHT,
> >       LDRSB, LDRSBT, LDRB, LDAB, LDRBT, STR, STL, STRT, STRH,
> >       STLH, STRHT, STRB, STLB, or STRBT instruction.
> >     - Is not performing register writeback.
> >     - Is not using R15 as a source or destination register.
> >
> > Your instruction is doing writeback. Do the address update
> > as a separate instruction.
>
> This was enlightening, thanks. I will prepare patches to implement
> readl/writel in barebox in ARM assembly, like Linux does
> instead of the current fallback to the generic C version
> that just does volatile accesses.
>
> > Strictly speaking this is a missing feature in KVM (in an
> > ideal world it would let you do MMIO with any instruction
> > that you could use on real hardware).
>
> I assume that's because KVM doesn't want to handle interruptions
> in the middle of such "composite" instructions?

It's because with the ISV=1 information in the ESR_EL2,
KVM has everything it needs to emulate the load/store:
it has the affected register number, the data width, etc. When
ISV is 0, simulating the load/store would require KVM
to load the actual instruction word, decode it to figure
out what kind of load/store it was, and then emulate
its behaviour. The instruction decode would be complicated
and if done in the kernel would increase the attack surface
exposed to the guest. (In practice KVM will these days
bounce the ISV=0 failure out to the userspace VMM, but
no VMM that I know of implements the decode of load/store
instructions in userspace either, so that just changes which
part prints the failure message.)

> > In practice it is not
> > a major issue because you don't typically want to do odd
> > things when you're doing MMIO, you just want to load or
> > store a single data item. If you're running into this then
> > your guest software is usually doing something a bit strange.
>
> The AMBA Peripheral ID consists of 4 bytes with some padding
> in-between. The barebox code to read it out looks is this:
>
> static inline u32 amba_device_get_pid(void *base, u32 size)
> {
>         int i;
>         u32 pid;
>
>         for (pid = 0, i = 0; i < 4; i++)
>                 pid |= (readl(base + size - 0x20 + 4 * i) & 255) <<
>                         (i * 8);
>
>         return pid;
> }
>
> static inline u32 __raw_readl(const volatile void __iomem *addr)
> {
>         return *(const volatile u32 __force *)addr;
> }
>
> I wouldn't necessarily characterize this as strange, we just erroneously
> assumed that with strongly ordered memory for MMIO regions and volatile
> accesses we had our bases covered and indeed we did until the bases
> shifted to include hardware-assisted virtualization. :-)

I'm not a fan of doing MMIO access via 'volatile' in C code,
personally -- I think the compiler has a tendency to do more
clever recombination than you might actually want, because
it doesn't know that the thing you're accessing isn't RAM-like.

thanks
-- PMM
