Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp738533wru;
        Wed, 18 Jul 2018 10:58:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcF+cEUInrAU6j/W3d0FGdIUa0jSuyfKSJzB8gyDKBEnUqTj4252qs9pe0u92K7KCqaDRpJ
X-Received: by 2002:ac8:2cd1:: with SMTP id 17-v6mr6659440qtx.360.1531936735000;
        Wed, 18 Jul 2018 10:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531936734; cv=none;
        d=google.com; s=arc-20160816;
        b=H//Bf41KYtWk6p3c82f6lG7M07jRFA5BUUwWk3sekmBjvpHat0NOHmKqCXu1EZ4kBx
         +8x5I088sEtutCDGnMbwrdeyJyzWCU6tHeCGzuhxPKgqkV+DmCuiD3FVxt+VEWCDRnqy
         O3qnSyBPw0yKJ54jnbXXMaENF/tkpMGCgg8q+MC6LXxEKzoDHM3Z0j86I+vWRa/wyywH
         An0Rr2VwtsQGnET3LLdcHwE8j1of5K50mbPcpA+Xvezafht8Ay+FQMwKAAEvnhvF0XCt
         rargCwIIbEwKYBDU5VkfYBk7MMLwoguU1x0rgpoTQ047DJ/MyB7Yseksga5drhqvgbhz
         gzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2R1jDn8hUC35uWUm+Ql3yrn0mgjoZcmo0p4PP1DGr3M=;
        b=NAfkqHrAwx1pgASps0Vix7Cqx8cIO5+h0foCRhakzR73bewvtP1X7lQas8kqDPKTEb
         2HCWjHBYTrCNcZPcpTPHcbGU3WMqFcCi0w6Kvm7FMveU7IGWLHqG5taVPhBEjOHLDVI4
         GVDPv3ymhjJHAnqGGRWEuYdH9cAMqKJ7iUcVZDyj8fO5FFxyLjUyX4UJUde/VYbSp/R8
         EGZAkSQl70t/Lt/pIxN4MytxMZdwP6ATDuVmhR/5gtsVdF3fKx4/oxgDO94IO6EpF4cX
         qJj8yunUoXBnc/buI1/CQ4ygTUmTGxhvoIBdS7HT0ASIG+XquI69b8Y49lXXlOywNyoV
         Dcpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XoFN/dXz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q32-v6si4080488qvq.271.2018.07.18.10.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 10:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XoFN/dXz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffqj0-00059c-DS
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 13:58:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffqir-00059S-Dr
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 13:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffqiq-00036w-6g
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 13:58:45 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffqiq-00036k-09
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 13:58:44 -0400
Received: by mail-oi0-x242.google.com with SMTP id r16-v6so10467493oie.3
	for <qemu-arm@nongnu.org>; Wed, 18 Jul 2018 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2R1jDn8hUC35uWUm+Ql3yrn0mgjoZcmo0p4PP1DGr3M=;
	b=XoFN/dXzGBq8QTByPg3eelBJseDQoMNss0DiiLfnJHMVqcgosAeJAIA0qRtBAYUHgA
	3a5+wT5VTGlFitFi9zaT5quIRErzgA3EX88pXYJ3kMKNvxUbO3iRg38PupOzuc59m3B6
	4J2ABH4lMdsYDHJbNbCGRKS09u+Ob9k/nCwHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2R1jDn8hUC35uWUm+Ql3yrn0mgjoZcmo0p4PP1DGr3M=;
	b=uScfFdZOCzYYXPjGo2HJazd2+Ya9ctjQrpu/wr2AwWNiv52AoS2rE/YPWpUsR5Z9ex
	NTSGSzw+BDixKMnIVQiQKMVXY7yIbUU89KNsw1ysZ9XuDzo8ULnCFfgVsyXgOo7Ag8zS
	RhrhKZYzDKaHl3aRVF0TArI/8atnZMAK9GYJsokolkfeDCG7JI6L1zwvI3XQ1nuOyW8F
	VHWZr8jq/A5pUYuT4s9THVi3oly3qgUhIKumtMJ7EM4k/XI5NGLtofDzonL5VqKJnOUR
	bE0Sj1KLSORN+tb6D93NzlFxX1CmfLJnku/4a3VPPxTzNiktlreuL2rv6koAn4wgfDxn
	5Y8w==
X-Gm-Message-State: AOUpUlExZ5lSJ6ozNceS39fCkQgYdOs36ehGtgT4UECuUeH+EXWV7f5o
	GPlG11lZRL8zS3xKPYECW3/xsWYYb+ogCtbGTJgIVA==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr7817566oig.13.1531936722926; 
	Wed, 18 Jul 2018 10:58:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 18 Jul 2018 10:58:22
	-0700 (PDT)
In-Reply-To: <CAB30WPfKKesSfvyEx9ZpSUQShnXJnH1YCXgZgp0OoY888r0K4w@mail.gmail.com>
References: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
	<CAFEAcA8v762p3JSQ=9Vu68-evYS5MMH467pAo8=XZWsw+x6s7Q@mail.gmail.com>
	<CAB30WPfKKesSfvyEx9ZpSUQShnXJnH1YCXgZgp0OoY888r0K4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Jul 2018 18:58:22 +0100
Message-ID: <CAFEAcA-_ZiPNz7tyQy2otZ6z9rT8wszhRxBZrmNXTr9AFaBzqg@mail.gmail.com>
To: Kevin Loughlin <kevlough@umich.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] Native Memory Virtualization in
 qemu-system-aarch64
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"Mickens, James" <mickens@g.harvard.edu>,
	qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vqfadHr9uKJg

On 18 July 2018 at 02:34, Kevin Loughlin <kevlough@umich.edu> wrote:
> Under my setup, the CPU's MMU translates from VAs to IPAs, and an external
> memory controller then intercepts all memory transactions and translates
> these IPAs to true PAs. This allows the memory controller to enforce
> physical isolation of environments, and does not expose true PAs to the
> CPU/system software.

Ah, right, "external custom memory controller" makes sense.

> My question is how best to emulate the memory controller given this desired
> setup. I have three primary ideas, and I would love to get feedback on their
> feasibility.
>
> Implement the controller as an IOMMU region. I would be responsible for
> writing the controller's operations to shift and forward the target address
> to the appropriate subregion. Would it be possible to trigger the IOMMU
> region on every access to system_memory? For example, even during QEMU's
> loading process? Or would I only be able to trigger the IOMMU operations on
> access to the subregions that represent my environments? My understanding of
> the IOMMU regions is shaky. Nonetheless, this sounds like the most promising
> approach, assuming I can provide the shifting and forwarding operations and
> hide the PAs from the CPU's TLB as desired.

I would probably go with implementing it as an IOMMU region. We recently
added code to QEMU that allows you to put IOMMUs in the CPU's
memory-access path, so this works now. The example we have of
that at the moment is hw/misc/tz-mpc.c (which is a simple device
which configurably controls access to the thing "downstream" of it
based on a lookup table and whether the access is S or NS).

As you've guessed, the way the IOMMU stuff works is that it gates
access to the things sat behind it: the device has a MemoryRegion
"upstream" which it exposes to the code which creates it, and a
MemoryRegion property "downstream". The creating code (ie the board)
passes in whatever the "downstream" is (likely a container MemoryRegion
with RAM and so on), and maps the "upstream" end into the address
space that the CPU sees. (You would probably have one downstream
for each separate subregion). You could either have the IOMMU
only "in front" of one part of the overall address space, or
in front of the whole of the address space, as you liked.
(Assuming you have some kind of "control register" memory mapped
interface for programming it, it can't be behind itself; that
would be "an interesting topological exercise", to quote nethack.)

What the CPU sees is whatever is in the MemoryRegion passed to it
via
        object_property_set_link(cpuobj, ..., "memory",
                                 &error_abort);

The virt board happens to currently use get_system_memory()
for that, but you can use a custom container MemoryRegion if you
like.

> Go into the target/arm code, find every instance of accesses to address
> spaces, and shift the target physical address accordingly. This seems ugly
> and unlikely to work.

That's very fragile, and I don't recommend it.

> Use overlapping subregions with differing priorities, as in done in QEMU's
> TrustZone implementation. However, these priorities would have to change on
> an environment context switch, and I don't know if that would lead to chaos.

You can model things this way too, yes (both by changing priorities, and by
simply enabling/disabling/mapping/unmapping memory regions). The main
advantage that using IOMMU regions gets you are:
 * you can do things at a finer granularity, say changing
   permissions at a page-by-page level, without creating a
   ton of MemoryRegion objects. Swapping MRs in and out would
   work if you only wanted to do it for big chunks of space at once
 * you can make the choice of what to do based on the memory
   transaction attributes (eg secure/nonsecure, user/privileged)
   rather than having to provide a single mapping only
If you really do only want to map 4G of RAM in and out at once,
this might be simpler.

Note that for both the IOMMU approach and the MemoryRegion map/unmap
approach, changing the mapping will blow away the emulated CPU's
cached TLB entirely. So if you do it very often you'll see a
performance hit. (In the IOMMU case it might in theory be possible
to get some of that performance back by being cleverer in the core
memory subsystem code so as to only drop the bits of the TLB that
are affected; but if you're remapping all-of-RAM then that probably
covers all the interesting cached TLB entries anyhow.)

thanks
-- PMM
