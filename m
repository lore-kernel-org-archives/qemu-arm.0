Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp107644njh;
        Wed, 28 May 2025 14:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxJOmTLqwTHdVeK5fzTi4tl9U2+wd3Z7TMN/vI804FgwTdURu8jxKQP33mz3wvrDcsJN1FAzS2iSwmAg==@linaro.org
X-Google-Smtp-Source: AGHT+IF28FNXUGuptCsLpXKy0k4MhADMFA1nkeP74IAhDFfKxEboak9mvv74jQo19m99bsnkNWN+
X-Received: by 2002:a05:620a:40cf:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7ceecc34071mr2763624285a.47.1748469492188;
        Wed, 28 May 2025 14:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748469492; cv=none;
        d=google.com; s=arc-20240605;
        b=G7Jb8mm4OW3hzksqrA7Hev+28BuT2fEzUFPvDh4Il7Q2tBRM+zmo9Todjc1Cld5l3P
         pqUAtXAIqcPcY6GYhnpNs0jfYI1/eRnY6EeBbhwksZIgIorhO2Vz59a55shMtt+m/7sx
         Hy7f0GhqOVbbs717DGmTKYwdqQxPstuQKvZKoUqm56xsuWF+t4gObb2S4oO1BOXGQ2OW
         74g0nln3jUo4LLQmpHKySL3ysta42R2OwpJFqGRxZaxczKE9NzQ9jEQ6eSBLT4PevJm+
         q7zj/jOCh3nJAGX1WVQznXUp0mMabFUBPlz80F6B0ALc1I5qIno9u+CNrVJdA0aRNcir
         X3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=IOgFgxDVW4e8YNF+tF2RPQouWl/LD9fTsDV5T6HR/rY=;
        fh=gjKYH6VT2aKZpX9E8Hgj4XAIOF2XqOq4i9aJzNPnAn8=;
        b=IxHONBZGgo1IApmjAGAjhmvbiIRJ8X+lpEzNAx+Oiyrf+UgtbAhOwzzxYXzFNz5KUv
         Fzrg+j7ql8QswpOYpGaOQBF9QpVxkWh9ePVIVKjRRmvM4BEhJ+iRZwDGEcR1Jxar+9ET
         RJwX/1YtFFJxltf0QbedHL2CHl23oJ5yTPuX/tBTz3NEq/voAnUfylTZ39s6JNPURE6L
         fbusIe6kW94rNbCSTsylQDXWI8e7yWxDqk3kCxM53SazB47U/rMpp85gEnJswFi1M1kp
         +vTrH6fCL26PWHrH6mEQRsBEZV6v1BzrO3PVtCGjwz3Sc3VAS/JqBFFlo1lXFc7Fjy56
         svCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Ttl8rRzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1f94f7si8447285a.333.2025.05.28.14.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 May 2025 14:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Ttl8rRzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKOmV-00070X-7K; Wed, 28 May 2025 17:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1uKOmS-0006ze-A2
 for qemu-arm@nongnu.org; Wed, 28 May 2025 17:57:48 -0400
Received: from out-189.mta1.migadu.com ([95.215.58.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1uKOmP-0006NX-S4
 for qemu-arm@nongnu.org; Wed, 28 May 2025 17:57:48 -0400
Date: Thu, 29 May 2025 06:57:29 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748469461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IOgFgxDVW4e8YNF+tF2RPQouWl/LD9fTsDV5T6HR/rY=;
 b=Ttl8rRzk7C+szOrbcV5t3kUDkIrWyXWkGKUPUgmRKpoi/04YlxlV0kaChi6V7XsFV/R7IJ
 v1OFgM5LZQRKnuJgk6nOZ2pKN/xttAsitb8uucU4boLQWVNZ/aXfdzJjXhJYW5IVu38nwU
 +gEP6smE+q8LhRq1YWpqF+/OzP3gi9A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 linuxarm@huawei.com, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
Subject: Re: [PATCH v14 0/5] arm/virt: CXL support via pxb_cxl
Message-ID: <aDeGyRM7qVYkHZrl@vm4>
References: <20250528110726.226389-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528110726.226389-1-Jonathan.Cameron@huawei.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.189;
 envelope-from=itaru.kitayama@linux.dev; helo=out-189.mta1.migadu.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fW+okawRClCr

Hi Jonathan,

On Wed, May 28, 2025 at 12:07:21PM +0100, Jonathan Cameron wrote:
> v14: Simplifications suggeseted by Itaru (and some extra simplifications
>      that became apparent) and gather tags.
>      See individual patches for more information.

I think the suggestion was made by Zhi jian or Fan? who enaged in the
rewview of your proposed series v13.

Itaru.

> 
> Updated cover letter
> 
> Richard Henderson has posted a pull request with a fix for the TCG TLB
> issue which will hopefully merge shortly (Thanks Richard!).
> 
> Back in 2022, this series stalled on the absence of a solution to device
> tree support for PCI Expander Bridges (PXB) and we ended up only having
> x86 support upstream. I've been carrying the arm64 support out of tree
> since then, with occasional nasty surprises (e.g. UNIMP + DT issue seen
> a few weeks ago) and a fair number of fiddly rebases.
> gitlab.com/jic23/qemu cxl-<latest date>.  Will update shortly with this
> series.
> 
> A recent discussion with Peter Maydell indicated that there are various
> other ACPI only features now, so in general he might be more relaxed
> about DT support being necessary. The upcoming vSMMUv3 support would
> run into this problem as well.
> 
> I presented the background to the PXB issue at Linaro connect 2022. In
> short the issue is that PXBs steal MMIO space from the main PCI root
> bridge. The challenge is knowing how much to steal.
> 
> On ACPI platforms, we can rely on EDK2 to perform an enumeration and
> configuration of the PCI topology and QEMU can update the ACPI tables
> after EDK2 has done this when it can simply read the space used by the
> root ports. On device tree, there is no entity to figure out that
> enumeration so we don't know how to size the stolen region.
> 
> Three approaches were discussed:
> 1) Enumerating in QEMU. Horribly complex and the last thing we want is a
>    3rd enumeration implementation that ends up out of sync with EDK2 and
>    the kernel (there are frequent issues because of how those existing
>    implementations differ.
> 2) Figure out how to enumerate in kernel. I never put a huge amount of work
>    into this, but it seemed likely to involve a nasty dance with similar
>    very specific code to that EDK2 is carrying and would very challenging
>    to upstream (given the lack of clarity on real use cases for PXBs and
>    DT).
> 3) Hack it based on the control we have which is bus numbers.
>    No one liked this but it worked :)
> 
> The other little wrinkle would be the need to define full bindings for CXL
> on DT + implement a fairly complex kernel stack as equivalent in ACPI
> involves a static table, CEDT, new runtime queries via _DSM and a description
> of various components. Doable, but so far there is no interest on physical
> platforms. Worth noting that for now, the QEMU CXL emulation is all about
> testing and developing the OS stack, not about virtualization (performance
> is terrible except in some very contrived situations!)
> 
> There is only a very simple test in here, because my intent is not to
> duplicate what we have on x86, but just to do a smoke test that everything
> is hooked up.  In general we need much more comprehensive end to end CXL
> tests but that requires a reaonsably stable guest software stack. A few
> people have expressed interest in working on that, but we aren't there yet.
> 
> Note that this series has a very different use case to that in the proposed
> SBSA-ref support:
> https://lore.kernel.org/qemu-devel/20250117034343.26356-1-wangyuquan1236@phytium.com.cn/
> 
> SBSA-ref is a good choice if you want a relatively simple mostly fixed
> configuration.  That works well with the limited host system
> discoverability etc as EDK2 can be build against a known configuration.
> 
> My interest with this support in arm/virt is support host software stack
> development (we have a wide range of contributors, most of whom are working
> on emulation + the kernel support). I care about the weird corners. As such
> I need to be able to bring up variable numbers of host bridges, multiple CXL
> Fixed Memory Windows with varying characteristics (interleave etc), complex
> NUMA topologies with wierd performance characteristics etc. We can do that
> on x86 upstream today, or my gitlab tree. Note that we need arm support
> for some arch specific features in the near future (cache flushing).
> Doing kernel development with this need for flexibility on SBSA-ref is not
> currently practical. SBSA-ref CXL support is an excellent thing, just
> not much use to me for this work.
> 
> Also, we are kicking off some work on DCD virtualization, particularly to
> support inter-host shared memory being presented up into a VM. That
> will need upstream support on arm64 as it is built on top of the existing
> CXL emulation to avoid the need for a separate guest software stack.
> 
> Note this is TCG only - it is possible to support limited use with KVM but
> that needs additional patches not yet ready for upstream.  The challenge
> is interleave - and the solution is don't interleave if you want to run
> with KVM.
> 
> Jonathan Cameron (5):
>   hw/cxl-host: Add an index field to CXLFixedMemoryWindow
>   hw/cxl: Make the CXL fixed memory windows devices.
>   hw/cxl-host: Allow split of establishing memory address and mmio
>     setup.
>   hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
>     pxb-cxl
>   qtest/cxl: Add aarch64 virt test for CXL
> 
>  include/hw/arm/virt.h     |   4 +
>  include/hw/cxl/cxl.h      |   4 +
>  include/hw/cxl/cxl_host.h |   6 +-
>  hw/acpi/cxl.c             |  76 +++++++--------
>  hw/arm/virt-acpi-build.c  |  34 +++++++
>  hw/arm/virt.c             |  29 ++++++
>  hw/cxl/cxl-host-stubs.c   |   8 +-
>  hw/cxl/cxl-host.c         | 190 ++++++++++++++++++++++++++++++++------
>  hw/i386/pc.c              |  51 +++++-----
>  tests/qtest/cxl-test.c    |  59 +++++++++---
>  tests/qtest/meson.build   |   1 +
>  11 files changed, 353 insertions(+), 109 deletions(-)
> 
> -- 
> 2.48.1
> 
> 
