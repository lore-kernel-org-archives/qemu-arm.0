Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp352022njb;
        Fri, 4 Oct 2024 03:41:02 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUxovTHOPsM8+JYLFgkAV6Fhrk7Iwr3JEgV3RdBQCq+8WyXwsZjlt6qNkeK5wnX5mduPg/fOpAFykF4vQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBwUz3vOtF9zCYs51zMm0josAZQJdASD54MRBp1OIAJytTEi3gxU748Tyh7IGPgWf0rbGp
X-Received: by 2002:a05:6a20:aaa8:b0:1d4:becc:6eeb with SMTP id adf61e73a8af0-1d6dfab6e1cmr3052314637.31.1728038462434;
        Fri, 04 Oct 2024 03:41:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1728038462; cv=pass;
        d=google.com; s=arc-20240605;
        b=jYWopte53MtPyLswv8UvvlNoYyve/RFd4qFcnRLD+Wr5sOTeIoL4qtDil12aocwhmP
         SiIaVPtNSqArVP5CF6j8TWlofgEeXjq8PEREADYemnuC+4B/EkNbLAjJMILKHc8OwHvL
         FrvfV7A7DJpEtyKQ3We6+5NCorCzqtxDt30vTXrzbVDd/OkLTJceej5/0zXPBoyP0Lax
         Zce+inqwz5NndpUK7Euzll7rdi31rjJ6o5sPW9XIrkD2yvh6coV/qMV8F5cduV37zyXJ
         nj9zCsSOwgQ8cITcEhOqe9Tcm7EJ3idPXSv89d/aZAwwbY4YAc4TNoA8Jqj52z81Ud38
         qnKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=vPl3qITF2ywrXWkVItFCsKUU6jByCU7uvcVLmVgL0Vg=;
        fh=6rnhk0rQ8GbzbEiZfcZ/YO9EGGincrydzWUy+IWfexo=;
        b=IMQNvnoyOjZz3vdFckRXXVm512aSh4C1TqqBOl6ust3VHcaqnhzYB9OqwhvtYqA2wy
         P5ok/1fuuDtGldv/xEm2kF+aiqYZIIz/QvXcGcZQlnCADQIa7yVeYi3qrWS4pIsnhsyV
         A33Z2dCNqTUNH0nIVIHR8hCliCJTDxtRko05Zge6X7/nOC5kPvig/76fxyFn2ZqRBwVw
         RtkCPTc4iaXrrPah/k5jgTLefTaY+BN8b3ELattaW3XcpZV+oCGaCejDwidg1Rglm+FD
         10Fleiq45BLoo30/2GcrY2eNVZPvs8XxG40vQEK2ZQuHts/yfqqysDLTkTPrs4Y4ua0g
         keQA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGvboOdt;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvmarm+bounces-16147-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvmarm+bounces-16147-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm+bounces-16147-alex.bennee=linaro.org@lists.linux.dev>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e9f0864699si216263a12.348.2024.10.04.03.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 03:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-16147-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGvboOdt;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvmarm+bounces-16147-alex.bennee=linaro.org@lists.linux.dev designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvmarm+bounces-16147-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBEAC28269F
	for <alex.bennee@linaro.org>; Fri,  4 Oct 2024 10:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C7B15574C;
	Fri,  4 Oct 2024 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGvboOdt"
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978F1553AF
	for <kvmarm@lists.linux.dev>; Fri,  4 Oct 2024 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728038459; cv=none; b=dtK8GnI+xRX2ZgCvSWq7HtzVup/K+4BT7AosKNCwKnGTiqCqH9Q1c3gOv9H7QaZxs1xkK/cWAZMfz9GCMZr8XP+tTfwWxYC6NyfTw2ZUr/wSK8MplnFRzjBCrhQhk2BFXJ/qpgTncS8gOkAGHjAUr2r9Qah3k98p7sqZ4Vb8tdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728038459; c=relaxed/simple;
	bh=lu6Ci95X3ixh416Hp8eWMyA2WcZFrjpot9w6voMZyBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMyXoTQo7Vgbb2xxai4cNR5y5A6935bHEPe6FoUuUvvhe9hOKCe8nMRvGV2LXTbNABzOT1Bc0FEIVxzAWr5/hZFgFIts8SxdolVBwtdm4WzBtI8Qv7slxoiJugPAXGT0ye0lyCBfjE74jxCCiUgpbFV2xaclAqCu6SCL8xJZPVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGvboOdt; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2facf48157dso21831931fa.2
        for <kvmarm@lists.linux.dev>; Fri, 04 Oct 2024 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728038455; x=1728643255; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vPl3qITF2ywrXWkVItFCsKUU6jByCU7uvcVLmVgL0Vg=;
        b=RGvboOdtKgh0YWU2S/zMbaXeWUBCbvi80l3qfeM8bF5xnGdXrij9i41LkN6cqxGUzl
         kSFyk7nomlJRod7ruGtlZ6XJ43KHA76zYzcW3gTj6hnpleXCKmOcGeECiHVlzKBn3RmD
         HG8jzMiOetQeqRQB3bEHrt0G+pWiTKb5FcFErHBHjBdblzt6rq8l8hH19/kb0/f6penD
         8SFGKWoxBTFy/JfKBO+551bYPadONJn3s+/C7DnhAHwqng/XlL8XwQWms1PvcquoRTfr
         RJTtwPBqMryz9EtFsCjaRar+5SdiF/VQCyhTRuYp52//n5u+hUr6/c2HiR/82B7hlveH
         2zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728038455; x=1728643255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPl3qITF2ywrXWkVItFCsKUU6jByCU7uvcVLmVgL0Vg=;
        b=M8wgPF798K/enUslA9iZl6MC1Pcj05Ryc9bFQaVkvpIjJ+lEcbIVbKAIgY4nwgS7eh
         B3ob4LCecdUxL4jOyExizTHuOrLScCZg5EyhcEE/PaSu2YrDQkOECDPwWFBOh4bPDw9A
         xzMqZoXR/DhMyEpIYCk5HeOdV8iC0jLbJoE2ypoTgX+DPhdheJ1Hinxp7hAcPA0/kUSq
         aI62AuFbOYY0BiiRU5qEeFc6yrrh3CYPsPk+buI/uLkFgUKLC73GxVJQyXzpubMga8qJ
         YjWVOzggjGyjzlAWNmf2mQ/CdgKVF4e0Fl7S7lom4hQ7JL+prX+g3ZgcT3lv+TyFC2II
         viWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDV/AaTfqOcKPb7XfJUerBLZ7HY4S/D7gbAMIOg1UjjxaGETMz6tXpRwE1rb13S3NdUYVjHIk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsrYiKMe8qNyMawNeNh7S7n4Byq4VwUoAZ3tDmlWZ2+dT7GXBt
	jpcbXgBeFo1fkY7I5j/QBs5+sEcDQUMGjiIgXFLrXnoGWtoGGl2guROQfJhRGkfRg3ehZIw0/ci
	+F0EwpFYTx+BgDs4Nr3MdWw4lytB3OQJsQ7jlFg==
X-Received: by 2002:a2e:d01:0:b0:2f7:4c9d:7a83 with SMTP id
 38308e7fff4ca-2faf3d70157mr9230261fa.40.1728038455301; Fri, 04 Oct 2024
 03:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
In-Reply-To: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 11:40:44 +0100
Message-ID: <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO address
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: qemu-arm@nongnu.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-TUID: YD/TGoI8ACFI

On Fri, 4 Oct 2024 at 10:47, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> I am investigating a data abort affecting the barebox bootloader built for aarch64
> that only manifests with qemu-system-aarch64 -enable-kvm.
>
> The issue happens when using the post-indexed form of LDR on a MMIO address:
>
>         ldr     x0, =0x9000fe0           // MMIO address
>         ldr     w1, [x0], #4             // data abort, but only with -enable-kvm

Don't do this -- KVM doesn't support it. For access to MMIO,
stick to instructions which will set the ISV bit in ESR_EL1.
That is:

 * AArch64 loads and stores of a single general-purpose register
   (including the register specified with 0b11111, including those
   with Acquire/Release semantics, but excluding Load Exclusive
   or Store Exclusive and excluding those with writeback).
 * AArch32 instructions where the instruction:
    - Is an LDR, LDA, LDRT, LDRSH, LDRSHT, LDRH, LDAH, LDRHT,
      LDRSB, LDRSBT, LDRB, LDAB, LDRBT, STR, STL, STRT, STRH,
      STLH, STRHT, STRB, STLB, or STRBT instruction.
    - Is not performing register writeback.
    - Is not using R15 as a source or destination register.

Your instruction is doing writeback. Do the address update
as a separate instruction.

Strictly speaking this is a missing feature in KVM (in an
ideal world it would let you do MMIO with any instruction
that you could use on real hardware). In practice it is not
a major issue because you don't typically want to do odd
things when you're doing MMIO, you just want to load or
store a single data item. If you're running into this then
your guest software is usually doing something a bit strange.

thanks
-- PMM
