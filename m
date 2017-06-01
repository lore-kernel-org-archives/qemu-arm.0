Received: by 10.25.0.6 with SMTP id 6csp901202lfa;
        Thu, 1 Jun 2017 10:30:12 -0700 (PDT)
X-Received: by 10.55.5.135 with SMTP id 129mr3163642qkf.181.1496338212728;
        Thu, 01 Jun 2017 10:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496338212; cv=none;
        d=google.com; s=arc-20160816;
        b=HLOLziPWYpO6vZUyF9KYxqhGnjkHbGrY8cbIVb39k4NM31XfIEoO/xtup778dxbxRe
         vmpEW+PoXAoiKtTVfR6yJyY5ad8/+FjjqsEcZ03rI9eaDjtehL/d6Ughpnblm2MnBQta
         kNJVH3dDDFOVKq1zXKDKnhC+hmeo6WPokHwMxiiWic9fPoLbBzndqJI5Bo839reoKUuG
         C3mQR/zVG1X4IICZx0hUZ8IoJbj5NbE+fZ5zWbdCz0sdb8eEjc+I08HjEemeg1F8fyfn
         NCXoD/fGNGI8J/EGaQocwH2A7napgib3O3tAZoI088Ob+0130zXjacuYxzrq9jRubCkr
         3AbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ilce+214I3Zb9YwQrLuvYRDyekRMPzcJPzPqiEH2Ftg=;
        b=Lm9ekSUuRX+ONX8KtOmv3J9dtlsFvxAY8TDj2QyaKg1YXjV9Fz7c9+pRyaE/+V++gY
         GIuQY68PsJ7KC3raeHu8xTTpT/MWQlJmqiN82gIMY4D2jqfd1jNO+ptBXZWsRNMeRn55
         6t/R3JesrZ9EVKPlgAvZmhLYb1LOvURoEjX2xJNtsCuMLOOOTK5T6I6QNcab7aeD8aD0
         cy0qcbQUpPXNoOjbNRmDkmb1lPj8ijq5o+j0gSINvFr+lc1sOE/lYKCO36DcqkWXjPhW
         /0ClnMiE3S8zyFQtnhmEcO2RN32FNFr+nQ+V1v2oq4EVGeKKtBhPcCcfQh/g9RM/gBRF
         tjMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m96si19765386qte.43.2017.06.01.10.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 10:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGTvG-0002NP-0h
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 13:30:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dGTnV-0002zd-V3
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1dGTnS-00045X-RM
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 13:22:09 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1dGTnS-000456-KH; Thu, 01 Jun 2017 13:22:06 -0400
Received: by mail-wm0-f68.google.com with SMTP id k15so12986827wmh.3;
	Thu, 01 Jun 2017 10:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ilce+214I3Zb9YwQrLuvYRDyekRMPzcJPzPqiEH2Ftg=;
	b=m6Jl5ktw+fmgu5ttRpDn1ZirTTIK/PMx7R/cab4iji4H6OvLcy2dSMGeR0VWHBLA8S
	gfDIatEAQntQjmGPs86MUz1+t4+pziSOAyxR9GbxgAeY02KZRVwO2/ZxxInHDXGnP6Xu
	ME6Ou0H5Gro8mSWbB7rPFTLEUpLOUasqp2H055AzKMQwQnXZkhPczJ2GP1dLdkC646lu
	+r/wRsbPYIbPrblo+weC+AXLw1foQ5JrCBF5p1ExutFS7mpuEpLVB4Qk7YbXns63C8IM
	xQkoeIQs13VyRYM9jn8+0m50wus3AszIYpC4HhVZPcV9gO4p8fFgGSWiEBCpVR83gOra
	PphA==
X-Gm-Message-State: AODbwcAnz4UPJtdP5t6ZbVCRGwxuPWWqvU5tvJ4wwW9mQf8PfIczWAm9
	EliOtXrJ82ogMg==
X-Received: by 10.80.139.162 with SMTP id m31mr2703577edm.121.1496337725590;
	Thu, 01 Jun 2017 10:22:05 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	z34sm7940190edz.57.2017.06.01.10.22.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Jun 2017 10:22:05 -0700 (PDT)
Date: Thu, 1 Jun 2017 19:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170601172203.4mtc4ekasm6mmk4s@kozik-lap>
References: <20170521152949.15338-1-krzk@kernel.org>
	<CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
	<CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
	<CAFEAcA8Q8-U9aocQgbUTt2WP4S9Tj_K_iXZuP08x9Ck0LszS3Q@mail.gmail.com>
	<20170601171019.j7ist5qnuvllvfhi@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170601171019.j7ist5qnuvllvfhi@kozik-lap>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
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
X-TUID: bzSbeaJQ5Lpw

On Thu, Jun 01, 2017 at 07:10:19PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 01, 2017 at 05:31:41PM +0100, Peter Maydell wrote:
> > On 31 May 2017 at 09:58, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > On Tue, May 30, 2017 at 2:04 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >> So is this a regression compared to our current model? I was
> > >> under the impression from the previous thread that it was,
> > >> which is why I didn't apply that patchset.
> > >
> > > It depends how wide understanding of regression you have. :)
> > > 1. Before this patch, second CPU could not boot. System was usable but
> > > worked on only one CPU.
> > > 2. Before this patch, kernel's IRQ work is broken. None of IRQ work
> > > are executed which is mostly visible during poweroff - system hangs on
> > > syncing IRQ works.
> > > 3. With this patch, second CPU boots and IRQ works properly (so
> > > poweroff is possible).
> > > 4. However with this patch, Linux kernel with cpuidle enabled (which
> > > is also included in many kernel defconfigs), the system is very
> > > unresponsive.
> > >
> > > So overall... a lot of things were broken already. This patches fixes
> > > them... but breaks different thing.
> > 
> > It sounds like it breaks a key thing, ie "boot a single cpu kernel
> > built from a defconfig", though. That's a regression I'd rather
> > not have.
> 
> I am not sure if I understand you correctly... the system previously
> booted into one CPU mode because second CPU just could not boot. Now by
> default, second CPU succeeds and this means that *default* settings are
> indeed more broken than before.
> 
> On the other hand, after removing a line from hw/arm/exynos4210.c:
> 	qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
> and running qemu with "-accel tcg -smp cpus=1,maxcpus=1,cores=1"
> everything is okay. Booting of one CPU is unaffected.

Ahh, and one more thing. For forced single CPU mode (mentioned above),
now it actually behaves better. Fixed GIC mappings means that SGIs are
working (execution of IRQ work is fixed) thus the system can properly
power off.

This means we could hard-code one-cpu for now and get better behavior
than previously (one CPU but with SGIs).

Best regards,
Krzysztof

> 
> > If there's a subset of these patches which don't break
> > that I'm happy to take those. Otherwise we need to investigate
> > and fix whatever the problem is that causes that unresponsiveness
> > before we can apply them.
> 
> Yes, you can take everything except first patch
> ("hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU")
> and it should be fine. Rest of patches are just independent.

