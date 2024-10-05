Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1171916njb;
        Sat, 5 Oct 2024 14:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVroqqaa9jzc9TA8FxXH1cmHGnvqdNMLshb/yaVEaE0HWIz7YXaIfoFQYTdYU9rWpGjDZkLH+UkTchblg==@linaro.org
X-Google-Smtp-Source: AGHT+IGFCR2UrPVivUY/oJSXllytQfs8Fu/FkzZu6tX4H3UlBFJ+kTdiTCHBGlhjoXD2e4DfnzYa
X-Received: by 2002:a05:6214:4604:b0:6b7:aed3:408f with SMTP id 6a1803df08f44-6cb9a326d09mr132670346d6.13.1728164158120;
        Sat, 05 Oct 2024 14:35:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1728164158; cv=pass;
        d=google.com; s=arc-20240605;
        b=hIotLuSvOaixkO6T1s1dj+qKEMeSjJlIn3iOdTaWmjQoeJ9KuZObKKjrVtbiq/YO5n
         dNnmQEquF05gilw1iY9jTln+IG3XenDq2pcFprTcHROOPWwou7Qy1H2anKsh43rmAFLQ
         hIueN5h4ktmvGptQ5mzVl6smiH97bj0BpWF/72WiG0jU8wj//R4137b8R8mOx5nTPIIZ
         TGjkCAj2eurgaACSODDJWenho4Rowp8ikJcUj+MQ9MVWhxTuM+hAKS6BpAU3zSDt+N9m
         k9Gy6YVc0n+FILJDNcby4KQjh1DL85PMPOwSLpHDedrUDaz49m5tTQPMvys91dyu2Bpi
         KNag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:references:in-reply-to:subject:cc:to:from:message-id
         :date:dkim-signature;
        bh=/ph5e/ooB5DbMO9pPsaPBZoZvZyscRnw9zmtso6XVLE=;
        fh=SnFmhe+5i6KgsJ5Q6TvjqQXtXYEN4xB/iCvHkChcy9c=;
        b=J5HUJHgMjn7OpVa8kpQiFGHH2V2Q3RDMQFoCddVMOqGwl1hp15/1v1vyXPqkWpPvG4
         3CzUCvwi6F4EJah0EGsPAHEc3vTJPtOiMVtIWJWjtNNreR/IoGDbGfaPiysVHHyjYoUy
         4OgC89QrRq4KMrgcZ+h0gaFzOSA2qw3HVKWE6/yg684FPsIE8l8gie/Nzf1OmLeK2ke+
         QKm/Gey1yPTtxacjjlb7HvBGLMHnBkOzl8+j7bPC7hnOEvdAddXdawklVig3F5hMFPzo
         TKS9gtGsvmAfTOqgSfL74pRbAiG5tCKqdXOl7IJmSwG1az11I9JPaRTWn2vZ8mvSb/Sg
         XDYA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nOpfuY9R;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvmarm+bounces-16251-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvmarm+bounces-16251-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvmarm+bounces-16251-alex.bennee=linaro.org@lists.linux.dev>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba46d6fd9si29343936d6.70.2024.10.05.14.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 14:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-16251-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nOpfuY9R;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvmarm+bounces-16251-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvmarm+bounces-16251-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C3D1C20DAA
	for <alex.bennee@linaro.org>; Sat,  5 Oct 2024 21:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06F2158DC4;
	Sat,  5 Oct 2024 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOpfuY9R"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED518E1F;
	Sat,  5 Oct 2024 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728164152; cv=none; b=PUZyLP77U8RBJa/pBuf4YIwE+UrwYDb8r3u0Hpq199+zr0ws8IWQDgCiPZmA8wFZ2PvVgYILiR/9vxJcqvOcQl2JuM6m6oamsFYChwRtokK8zXS4ytIiLmUGZUdGuSMUy8eqbSfNt11d+5OXGtf/c3RAislbEkx5T3Dfis10eQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728164152; c=relaxed/simple;
	bh=4sfPDWl1oJaJQh9DQfDD4n4dpgiSjjXdaE92+qki+no=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rIALBscndcVJnmNBpeiJX67Nh83xqhPnObdktu5adgh3I2776aXdqUVP8d4mf38H6G31dJdr9NQ9H6BgIwK1PeYyu67mE4hbitUN/zBNEmxXZ2za7SW59EYH2PGLGfYX+4PrbHmigImq75sUwQgHNtYT4CUQXr6GoEOMdiUZ0r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOpfuY9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F30C4CECC;
	Sat,  5 Oct 2024 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728164152;
	bh=4sfPDWl1oJaJQh9DQfDD4n4dpgiSjjXdaE92+qki+no=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nOpfuY9RkAvbGr1+JirOtWdENC8a8hWxm/fOFqgfo4xdotxuvlbrkvdQJVCOzVYed
	 oEDTlkg4EHoaUSYvw0EafAfcLbV2SAfH53l8Zgyv7dx1xfKDWsf269E3LGWmsOdtyn
	 2uf1vXvDzqMiUOUJlwUe3t+/mGiAjlT/khk8qmaKdIY2Ww+Rwxq96pP4K9MWFCqdZe
	 p1FcHyhU0XyArpT9kczq4YZeT1imC4CahdX8/sP+kuFmwkPl9d/tXGTunaPlxCdl6d
	 0SiTSmoOXKMRIbhrJUw9dOnDDfJnJus7M+I/qcnyadOv8wdrsU0Vc4UocmvcjLC6h0
	 uqhqGrSdG5krA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sxCRK-000h6U-1X;
	Sat, 05 Oct 2024 22:35:50 +0100
Date: Sat, 05 Oct 2024 22:35:49 +0100
Message-ID: <87a5fiutai.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	Enrico Joerns <ejo@pengutronix.de>
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO address
In-Reply-To: <65ab10d7-6594-490c-be07-39f83ac3559a@pengutronix.de>
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
	<CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
	<a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
	<CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
	<4d559b9e-c208-46f3-851a-68086dc8a50f@pengutronix.de>
	<864j5q7sdq.wl-maz@kernel.org>
	<65ab10d7-6594-490c-be07-39f83ac3559a@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: a.fatoum@pengutronix.de, peter.maydell@linaro.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, ejo@pengutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: 67sDGvxNfzej

On Sat, 05 Oct 2024 19:38:23 +0100,
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
> Hello Marc,
> 
> On 05.10.24 12:31, Marc Zyngier wrote:
> > On Fri, 04 Oct 2024 20:50:18 +0100,
> > Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> With readl/writel implemented in assembly, I get beyond that point, but
> >> now I get a data abort running an DC IVAC instruction on address 0x1000,
> >> where the cfi-flash is located. This instruction is part of a routine
> >> to remap the cfi-flash to start a page later, so the zero page can be
> >> mapped faulting.
> 
> [snip]
> 
> >> Any idea what this is about?
> > 
> > IIRC, the QEMU flash is implemented as a read-only memslot. A data
> > cache invalidation is a *write*, as it can be (and is) upgraded to a
> > clean+invalidate by the HW.
> 
> So it's a write, even if there are no dirty cache lines?

Yes.

At the point where this is handled, the CPU has no clue about the
dirty state of an arbitrary cache line, at an arbitrary cache level.
The CPU simply forward the CMO downstream, and the permission check
happens way before that.

> > KVM cannot satisfy the write, for obvious reasons, and tells the guest
> > to bugger off (__gfn_to_pfn_memslot() returns KVM_PFN_ERR_RO_FAULT,
> > which satisfies is_error_noslot_pfn() -- a slight oddity, but hey, why
> > not).
> > 
> > In the end, you get an exception. We could relax this by
> > special-casing CMOs to RO memslots, but this doesn't look great.
> > 
> > The real question is: what are you trying to achieve with this?
> 
> barebox sets up the MMU, but tries to keep a 1:1 mapping. On Virt, we
> want to map the zero page faulting, but still have access to the first
> block of the cfi-flash.
> 
> Therefore, barebox will map the cfi-flash one page later
> (virt 0x1000,0x2000,... -> phys 0x0000,0x1000,...) and so on, so the first
> page can be mapped faulting.
> 
> The routine[1] that does this remapping invalidates the virtual address range,
> because the attributes may change[2]. This invalidate also happens for cfi-flash,
> but we should never encounter dirty cache lines there as the remap is done
> before driver probe.
>
> Can you advise what should be done differently?

If you always map the flash as Device memory, there is no need for
CMOs. Same thing if you map it as NC. And even if you did map it as
Cacheable, it wouldn't matter. KVM already handles coherency when the
flash is switching between memory-mapped and programming mode, as the
physical address space changes (the flash literally drops from the
memory map).

In general, issuing CMOs to a device is a bizarre concept, because it
is pretty rare that a device can handle a full cache-line as
write-back. Devices tend to handle smaller, register-sized accesses,
not a full 64-byte eviction.

Now, I'm still wondering whether we should simply forward the CMO to
userspace as we do for other writes, and let the VMM deal with it. The
main issue is that there is no current way to describe this.

The alternative would be to silently handle the trap and pretend it
never occurred, as we do for other bizarre behaviours. But that'd be
something only new kernels would support, and I guess you'd like your
guest to work today, not tomorrow.

	M.

-- 
Without deviation from the norm, progress is not possible.
