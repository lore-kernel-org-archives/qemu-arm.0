Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1366300njb;
        Sun, 6 Oct 2024 03:28:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSLewl5rMBZ7+yDOr7DRCC4GxyNXX3arw9BRIbpOwC0gFZX/JhjhQI659+HpRn/Z0wdPoazDFmaUG/zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHZgXKxk4MOdeZ7zTYXfBnUSoDvkh5Ve0GMWaJO5x6D60JYR+WgerxgfeAVi53svVmIcAQ6
X-Received: by 2002:ac8:5a46:0:b0:45d:5786:80b4 with SMTP id d75a77b69052e-45d9ba6449bmr137035661cf.26.1728210536290;
        Sun, 06 Oct 2024 03:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728210536; cv=none;
        d=google.com; s=arc-20240605;
        b=AYjmzobSADXQS6zXmLObC5Ojvpj6z6tOyntnvZlxF/LMhYxenZRvVvqQFA/4nmE713
         I+3o7zGpqoTe8p5AJ2HmmA8QPKxpahP1WDQ016i432H2hsTu6RXpTg9i/849hztSUDn2
         EWM7G0rChq16ypWUnjsHliJ4XDSq65X/APYwhilsoezV0H+gWTNF1dOxt1yZaGUq1cYE
         0QXbFuyCaO72p8dmUAXpzBfKQ4mriYGg3mu6tVTJpgC8jE9ZYBrzZI4ke6RtauHsVo7T
         GQfDeCvMczzrYJjwAVREuT8XdjhYM+5HCZQQKf9D7CAuwgsUQ0PxjFMNDRlZpfNxln68
         IqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=oMiszMrmqx7T1GgKa2HzSE4vKJ1XYLKtJFIo/Isp1Bs=;
        fh=SnFmhe+5i6KgsJ5Q6TvjqQXtXYEN4xB/iCvHkChcy9c=;
        b=gKA1cCXsXeZy2JlqoRk+n/LR0SlygOiOBeBcVAA+NWsc6qu+us6Ke5q4bDG4mDlqBI
         tHMDTwpo+vnTjRu4JWihA/1YV+JbWeYg1jF9lqvu+txkgQA8m6D0h9pt5icuyxGiNTrN
         4gjudz8XCz3nrjavvgdFqOg6Hy5Xg1k2IarvxIKC4tvyzVDHv9WrzWPV4NXhiRkM17QC
         R8aGgvweEc1hB24jJFjqvTRhnYIniwyX1cJLT9FsOw15jmSaLZZ5qrGya+8AdQDKrJfx
         3Pg5xkWNt2qYbwZwC91JQ+B3OtlIDtQel6uQ0CdGPcvPmkSRs3W6kKGRU78A/2H5havh
         V68A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=K3IxjiMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da75df8c4si40307371cf.358.2024.10.06.03.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Oct 2024 03:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=K3IxjiMy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxOV9-0005TV-NL; Sun, 06 Oct 2024 06:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1sxOV5-0005Sm-Bi
 for qemu-arm@nongnu.org; Sun, 06 Oct 2024 06:28:31 -0400
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1sxOV1-00010W-TH
 for qemu-arm@nongnu.org; Sun, 06 Oct 2024 06:28:29 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17D42A40193;
 Sun,  6 Oct 2024 10:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437DFC4CEC5;
 Sun,  6 Oct 2024 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728210506;
 bh=qQResh1CcWQO+c6Odpl8c5StGvv2HmNjqiNTYvGALNg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K3IxjiMyyiajCHdln/10sV19fD/J+xDyFqAVAcIXluVkjYnKNvOlapBiT7Y/HSrNP
 uhgMmCLkK1CkoE++6Bb38HEl3VHA4CME0DyCPvl1aHLksbZ6p39/GulEkPn7Y73aFe
 OW89w/nZAikRIJ3qGed6/jnmAIXr6cqQxW5a+eX2rypOtqdgQvju3rGiDGtvnixXdm
 0KxnRa1t1l3qcHdFdzXgZngHL3LJF0kxtOhBzIBWmwGgXG2t5yy0PcTZh+5gzDlHzU
 xNxhMRG5TduTIc/ZYMLMNpSjllc4di4751gj7gWX4UUQiIL31gHN0seMnPy4P7tTgL
 dNkRzVCPcs9rg==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1sxOUy-000lyd-1W;
 Sun, 06 Oct 2024 11:28:24 +0100
Date: Sun, 06 Oct 2024 11:28:23 +0100
Message-ID: <8634l97cfs.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO
 address
In-Reply-To: <0352a327-0e78-48d4-a876-d33689fcd766@pengutronix.de>
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
 <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
 <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
 <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
 <4d559b9e-c208-46f3-851a-68086dc8a50f@pengutronix.de>
 <864j5q7sdq.wl-maz@kernel.org>
 <65ab10d7-6594-490c-be07-39f83ac3559a@pengutronix.de>
 <87a5fiutai.wl-maz@kernel.org>
 <0352a327-0e78-48d4-a876-d33689fcd766@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: a.fatoum@pengutronix.de, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 ejo@pengutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=maz@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TCVR2ljhfjgk

On Sun, 06 Oct 2024 08:59:56 +0100,
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
> Hello Marc,
> 
> On 05.10.24 23:35, Marc Zyngier wrote:
> > On Sat, 05 Oct 2024 19:38:23 +0100,
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>> IIRC, the QEMU flash is implemented as a read-only memslot. A data
> >>> cache invalidation is a *write*, as it can be (and is) upgraded to a
> >>> clean+invalidate by the HW.
> >>
> >> So it's a write, even if there are no dirty cache lines?
> > 
> > Yes.
> > 
> > At the point where this is handled, the CPU has no clue about the
> > dirty state of an arbitrary cache line, at an arbitrary cache level.
> > The CPU simply forward the CMO downstream, and the permission check
> > happens way before that.
> 
> I see. When I added that invalidation, it was suggested[1] that instead
> of invalidation after the remapping, I would clean the range before
> remapping. Cleaning the zero page triggered a data abort, which I didn't
> understand as there should be no dirty lines, but now I get it.
> 
> One more question: This upgrading of DC IVAC to DC CIVAC is because
> the code is run under virtualization, right?

Not necessarily. Virtualisation mandates the upgrade, but CIVAC is
also a perfectly valid implementation of both IVAC and CVAC.  And it
isn't uncommon that CPUs implement everything the same way.

This is why, if you dare looking at the definition of ESR_ELx for a
data abort, you will notice that ESR_ELx.WnR (which indicates whether
the abort was triggered by a read or a write) is always 1 (denoting a
write) on a CMO, irrespective of what CMO triggered it.

Additionally, FEAT_CMOW requires both read and write permissions to
not trigger faults on CMOs, but that's a bit orthogonal to your
problem.

> 
> [1]: https://lore.barebox.org/barebox/9809c04c-58c5-6888-2b14-cf17fa7c4b1a@pengutronix.de/
> 
> >> The routine[1] that does this remapping invalidates the virtual address range,
> >> because the attributes may change[2]. This invalidate also happens for cfi-flash,
> >> but we should never encounter dirty cache lines there as the remap is done
> >> before driver probe.
> >>
> >> Can you advise what should be done differently?
> > 
> > If you always map the flash as Device memory, there is no need for
> > CMOs. Same thing if you map it as NC.
> 
> Everything, except for RAM, is mapped Device-nGnRnE.

Right, no problem then.

> 
> > And even if you did map it as
> > Cacheable, it wouldn't matter. KVM already handles coherency when the
> > flash is switching between memory-mapped and programming mode, as the
> > physical address space changes (the flash literally drops from the
> > memory map).
> > 
> > In general, issuing CMOs to a device is a bizarre concept, because it
> > is pretty rare that a device can handle a full cache-line as
> > write-back. Devices tend to handle smaller, register-sized accesses,
> > not a full 64-byte eviction.
> 
> The same remap_range function is used to:
> 
>   - remap normal memory:
>     - Mapping memory regions uncached for memory test
>     - Mapping memory buffers coherent or write-combine
>   - remap ROMs: BootROMs at address zero may be hidden behind the NULL
>     page and need to be mapped differently when calling/peeking into it.
>   - remap device memory, e.g. in the case of the cfi-flash here
> 
> The invalidation is done unconditionally for all of them, although it
> makes only the sense in the first case.

Indeed.

> 
> > Now, I'm still wondering whether we should simply forward the CMO to
> > userspace as we do for other writes, and let the VMM deal with it. The
> > main issue is that there is no current way to describe this.
> > 
> > The alternative would be to silently handle the trap and pretend it
> > never occurred, as we do for other bizarre behaviours. But that'd be
> > something only new kernels would support, and I guess you'd like your
> > guest to work today, not tomorrow.
> 
> I think following fix on the barebox side may work:
> 
>   - Walk all pages about to be remapped
>   - Execute the AT instruction on the page's base address

Why do you need AT if you are walking the PTs? If you walk, you
already have access to the memory attributes. In general, AT can be
slower than an actual walk.

Or did you actually mean iterating over the VA range? Even in that
case, AT can be a bad idea, as you are likely to iterate in page-size
increments even if you have a block mapping. Walking the PTs tells you
immediately how much a leaf is mapping (assuming you don't have any
other tracking).

>   - Only if the page was previously mapped cacheable, clean + invalidate
>     the cache
>   - Remove the current cache invalidation after remap
> 
> Does that sound sensible?

This looks reasonable (apart from the AT thingy).

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
