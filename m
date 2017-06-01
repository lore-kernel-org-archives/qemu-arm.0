Received: by 10.25.0.6 with SMTP id 6csp893422lfa;
        Thu, 1 Jun 2017 10:10:36 -0700 (PDT)
X-Received: by 10.200.48.149 with SMTP id v21mr3475366qta.84.1496337036679;
        Thu, 01 Jun 2017 10:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496337036; cv=none;
        d=google.com; s=arc-20160816;
        b=n1D+UL6zAxkalqhqJ/1WhD29N1PvVOjKMEqes9UpKY31w2m02Om3AApYippFOis7Dp
         HYXXbhRcamtTWzH/0jTjhI5lNtDkWcvWkljebPpR208FXUnnokuViXP5/b1aEPS1T2d6
         TmrPUyvtBti7GPwo0ZzQlHxd8WlHja8ri9js2zy06BzlkXTrzKNEcL5UFc5TSPc532dR
         WmM9XE0BCh42fOaMwEGuVrTP1B+4YCTHnF5IgXwL/G1kjWCuWhcvB6sbyWR2dkh4aqr+
         F/BkNeQalVnuVJTvxp3/993e+g23BxTspS4hi9WRpYZPBzO1eo/KZla3G2Ciy3Amstn4
         et7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=LhzrsrNDD00BhQlzEmCRba0Km92vKmiK8vnUxWVglkA=;
        b=AkQ4uEytiv8jiwqLAoWrFTW262+hkgYUKUgI1YYphVz7x/InI6hbVCFJXSfv6sb4BH
         J77Uz8T0Pwv29YDNpgbFB+cb6hFdUdEBe6EoLTU1MaJyIpumoRmftOsnoeDUjLJyA1Rl
         eR7mD3Yh707FNFHZe7nmsYLoEgFrGE/nqupVAN8sDqDW6H2r6i838IIvnMTSfMi1qkc1
         Hz24OTQCS5dYijHOUNooumB2ctfPRC88na2oi9mtMl4Tgku6fyoGsQYhFLmjv3t/Yb9i
         JugtYozsTvbl+J8FMCwPjTcCMnrFOkD0Slah8TAnmPXS/oVg4j/j4GyLB07DiIv1PQun
         xsCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si3035741qkb.323.2017.06.01.10.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 10:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGTcH-0000rK-RJ
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 13:10:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dGTcC-0000q3-V5
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dGTc9-000622-OD
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:10:28 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1dGTc9-00061G-Hk; Thu, 01 Jun 2017 13:10:25 -0400
Received: by mail-wm0-f66.google.com with SMTP id k15so12910236wmh.3;
	Thu, 01 Jun 2017 10:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LhzrsrNDD00BhQlzEmCRba0Km92vKmiK8vnUxWVglkA=;
	b=IeWbHOMvjx/nVNPgy8sMBJsvqOFVRnjGQpunH4Hqenfi7xGL0wh1dpFgUC5UQxbWxz
	soz3GOFbcgdY60Ph5yn/jruXKcNK29LDy4KsTvUbcdrn+dYWx8R6mODku5SZ4rsCj9pz
	YBpRkETRrpKLuYtdjx3nDENekm0H6/jBqAydGFlASPIK0qUwHpIBpg+rjxYhAUfVVK0B
	YSlpTuTs0HFoR9UcoO2JH6MDa9+vnITyWimhjvRM8O4i/srTruOTpYUfh34JhaRY2M+w
	0uz6dgCAKHPvWKQKLintiDP+BOM6kQ8DZzhMBAXAoKfrPnMCplzYvD0jnuc3A31XClgo
	8YjA==
X-Gm-Message-State: AODbwcCyFo4sre5Ie//kcLEAx0d6w6J/UCwaymD0y3f1WH/iDTdcWpwf
	UxiIPrMmTbmQw5muIXg=
X-Received: by 10.80.134.155 with SMTP id r27mr2618062eda.133.1496337022904;
	Thu, 01 Jun 2017 10:10:22 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	e6sm4730379edb.45.2017.06.01.10.10.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Jun 2017 10:10:21 -0700 (PDT)
Date: Thu, 1 Jun 2017 19:10:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170601171019.j7ist5qnuvllvfhi@kozik-lap>
References: <20170521152949.15338-1-krzk@kernel.org>
	<CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
	<CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
	<CAFEAcA8Q8-U9aocQgbUTt2WP4S9Tj_K_iXZuP08x9Ck0LszS3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Q8-U9aocQgbUTt2WP4S9Tj_K_iXZuP08x9Ck0LszS3Q@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
Subject: Re: [Qemu-arm] [PATCH v3 00/11] hw: arm: exynos: Bring up secondary
 CPU, QOM-ify Soc, other improvements
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+T9sySHzXaE

On Thu, Jun 01, 2017 at 05:31:41PM +0100, Peter Maydell wrote:
> On 31 May 2017 at 09:58, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Tue, May 30, 2017 at 2:04 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> So is this a regression compared to our current model? I was
> >> under the impression from the previous thread that it was,
> >> which is why I didn't apply that patchset.
> >
> > It depends how wide understanding of regression you have. :)
> > 1. Before this patch, second CPU could not boot. System was usable but
> > worked on only one CPU.
> > 2. Before this patch, kernel's IRQ work is broken. None of IRQ work
> > are executed which is mostly visible during poweroff - system hangs on
> > syncing IRQ works.
> > 3. With this patch, second CPU boots and IRQ works properly (so
> > poweroff is possible).
> > 4. However with this patch, Linux kernel with cpuidle enabled (which
> > is also included in many kernel defconfigs), the system is very
> > unresponsive.
> >
> > So overall... a lot of things were broken already. This patches fixes
> > them... but breaks different thing.
> 
> It sounds like it breaks a key thing, ie "boot a single cpu kernel
> built from a defconfig", though. That's a regression I'd rather
> not have.

I am not sure if I understand you correctly... the system previously
booted into one CPU mode because second CPU just could not boot. Now by
default, second CPU succeeds and this means that *default* settings are
indeed more broken than before.

On the other hand, after removing a line from hw/arm/exynos4210.c:
	qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
and running qemu with "-accel tcg -smp cpus=1,maxcpus=1,cores=1"
everything is okay. Booting of one CPU is unaffected.

> If there's a subset of these patches which don't break
> that I'm happy to take those. Otherwise we need to investigate
> and fix whatever the problem is that causes that unresponsiveness
> before we can apply them.

Yes, you can take everything except first patch
("hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU")
and it should be fine. Rest of patches are just independent.

Best regards,
Krzysztof

