Received: by 10.25.30.65 with SMTP id e62csp1358913lfe;
        Wed, 25 May 2016 07:51:01 -0700 (PDT)
X-Received: by 10.140.135.207 with SMTP id 198mr3857261qhh.73.1464187860966;
        Wed, 25 May 2016 07:51:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x44si8309131qta.7.2016.05.25.07.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 07:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5a9E-0005E8-3r
	for alex.bennee@linaro.org; Wed, 25 May 2016 10:51:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b5a94-00058H-Q7
	for qemu-arm@nongnu.org; Wed, 25 May 2016 10:50:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b5a8z-0001PF-0V
	for qemu-arm@nongnu.org; Wed, 25 May 2016 10:50:49 -0400
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:36837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b5a8x-0001P8-QM
	for qemu-arm@nongnu.org; Wed, 25 May 2016 10:50:44 -0400
Received: by mail-pa0-x233.google.com with SMTP id eu11so9315098pad.3
	for <qemu-arm@nongnu.org>; Wed, 25 May 2016 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=j+/rqmqDvXnvDLPIsJboBIJG1C3cfKG0nD5dgOQf3LM=;
	b=ezb7ExkVbZjqr2mx6MUWpg6IiueZIsn6N5LdfA3WPRRskQly4p6i5hRbuJiNRJoCyX
	Ae0wb1r9iZK4g79JPjC+RXwebaybMuMpj4HGTG0X8wmW4MOatgbpvhiFb+88P1Xzb0Cv
	8SsLaQDVzLWiKay5iRUCssNvMZnm0WvtGBHFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=j+/rqmqDvXnvDLPIsJboBIJG1C3cfKG0nD5dgOQf3LM=;
	b=KW+wP4YFD5DVMRry8RFGm6trE3AseL8q2Uw+VmMyyBPt77GjD0cFACRS+Az9PQOPCf
	SIqceOoplEiRKhgulwykIANvBEwKWfJ/PorA9Hl8ZZHObSKqeFaoaXaEIt4z96ddEE83
	axcxkOCzU+5+OLdXnVqtekuzQixUGj36QhCinj4AKCBFA52tOCxVBET31TMpft7Dm/Xn
	Qak+41OB+CiFm4lKX2kHciEN/QYTEZXsxcJv0i8en+t6vc5aSFDtqHp2BFDLowHzO57b
	QzSAc3sQwXuVfnCWYRMFCTSS8CgSKu83k+tZVo2U2AEDH87PeHlm3Vo+lzRVNgusl5Qh
	ReTw==
X-Gm-Message-State: ALyK8tJkEKBN7bNyOeU0Jgz96yCi7d42tZRYfQ8zI9jIjGSZfSmgzX+RacilnXiuEkmINwT6
X-Received: by 10.66.77.165 with SMTP id t5mr6371636paw.61.1464187842490;
	Wed, 25 May 2016 07:50:42 -0700 (PDT)
Received: from [10.13.83.218] ([104.237.91.144])
	by smtp.gmail.com with ESMTPSA id
	ey12sm13465803pac.26.2016.05.25.07.50.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2016 07:50:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <5745BBB8.8010507@linaro.org>
Date: Wed, 25 May 2016 22:50:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] GICv3 emulation
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
Cc: Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /8dYS30ISqlk

On 2016年05月10日 01:29, Peter Maydell wrote:
> This series implements emulation of the GICv3 interrupt controller.
> It is based to some extent on previous patches from Shlomo and
> Pavel, but the bulk of it has turned out to be new code. (The
> combination of changing the underlying data structures, adding
> support for TrustZone and implementing proper GICv3 behaviour rather
> than borrowing fragments of GICv2 emulation code meant there wasn't
> much left to reuse.) I've tried to reflect this in the various
> authorship credits on the patches, but please let me know if you
> feel I got anything miscredited one way or the other.
> 
> Key points about the GICv3 emulated here:
>  * "non-legacy" only, ie system registers and affinity routing
>  * TrustZone is implemented
>  * no virtualization support
>  * only the "core" GICv3, so no LPI support (via ITS or otherwise)
> 
> I have included the "support KVM save/restore" patches from Pavel,
> reworked to use the new data structures, but they are only RFC
> status because the kernel API is not yet final (there are a couple
> of loose threads there to be followed up). Those patches are at the
> end of the series; I think everything else is in a commitable state
> (give or take code review).
> 
> Testing: I have confirmed that we can boot a Linux guest kernel,
> but not tried any other GIC-using guest code. I've done some light
> stress-testing using 'stress', and checked an SMP (2-cpu) boot.
> 
> Design: all the code here is in hw/intc/, split into several
> files to avoid them being huge. The interface between the CPU
> proper and the CPU interface is a bit ad-hoc (you can see the
> awkward seams that result from the choice to think of the cpu
> i/f as part of the GIC device rather than part of the CPU itself),
> but I think that if you put the cpu i/f in the CPU you'd end up
> with an ad-hoc interface and awkward seams in the other direction.
> The GICv3 device currently assumes it is always connected to all
> CPUs; we can change that later to allow some kind of QOM link
> property to specify the CPUs explicitly, but I think this is OK
> for now (and it's already a pretty huge set of code changes to
> have to review).
> 
> I include a workaround for a Linux kernel bug which otherwise
> prevents booting on the virt board. I've reported the bug to
> Marc Zyngier and he should post a kernel patch to fix it shortly,
> but I think we'll need to retain the workaround for the benefit
> of older kernels (an ugly but pragmatic choice).
> 
> 
> Code review, testing, attempts to run guests other than Linux
> welcome (UEFI, anybody?)
> 
> thanks
> -- PMM
> 
> Pavel Fedin (5):
>   target-arm: Add mp-affinity property for ARM CPU class
>   hw/intc/arm_gicv3: Add state information
>   hw/intc/arm_gicv3: Add vmstate descriptors
>   NOT-FOR-UPSTREAM: kernel: Add definitions for GICv3 attributes
>   RFC: hw/intc/arm_gicv3_kvm: Implement get/put functions
> 
> Peter Maydell (15):
>   migration: Define VMSTATE_UINT64_2DARRAY
>   bitops.h: Implement half-shuffle and half-unshuffle ops
>   target-arm: Define new arm_is_el3_or_mon() function
>   target-arm: Provide hook to tell GICv3 about changes of security state
>   hw/intc/arm_gicv3: Move irq lines into GICv3CPUState structure
>   hw/intc/arm_gicv3: Implement functions to identify next pending irq
>   hw/intc/arm_gicv3: Wire up distributor and redistributor MMIO regions
>   hw/intc/arm_gicv3: Implement gicv3_set_irq()
>   hw/intc/arm_gicv3: Implement GICv3 CPU interface registers
>   hw/intc/arm_gicv3: Implement gicv3_cpuif_update()
>   hw/intc/arm_gicv3: Implement CPU i/f SGI generation registers
>   hw/intc/arm_gicv3: Add IRQ handling CPU interface registers
>   target-arm/machine.c: Allow user to request GICv3 emulation
>   target-arm/monitor.c: Advertise emulated GICv3 in capabilities
>   hw/intc/arm_gicv3: Work around Linux assuming interrupts are group 1
> 
> Shlomo Pongratz (3):
>   hw/intc/arm_gicv3: ARM GICv3 device framework
>   hw/intc/arm_gicv3: Implement GICv3 distributor registers
>   hw/intc/arm_gicv3: Implement GICv3 redistributor registers
> 
Hi Peter, I have gone through these patches. I think I don't have
further comments. Sorry that I just reviewed the patches while studying
the SPEC, so there are only few problems I found(on the hand your
patches are good:) ). I hope I'll give effective comments on the next
version.

Thanks,
-- 
Shannon
