Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp343937njh;
        Thu, 29 May 2025 02:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPd4dnefiNpu4SBvm39pylxZumKbkffqzZKvKnpOt8YHN7RVuk1RdErEdoWt2wCtXv+wc/tWq5Zsi18A==@linaro.org
X-Google-Smtp-Source: AGHT+IFlUvX/LTlUwoznWGwSm+h2hKgwraziQJF3iWX+AsHrJoG1a22QCU3IMCP/vciXrrO0hh1c
X-Received: by 2002:a05:6214:5c91:b0:6fa:9b06:99e7 with SMTP id 6a1803df08f44-6fac5d653aamr42112826d6.21.1748509764858;
        Thu, 29 May 2025 02:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748509764; cv=none;
        d=google.com; s=arc-20240605;
        b=NoPJMhz4z2I0NASibBCdqVFeBkrS5Fg30801ZeFe8bwzrg+VFLGFTua7U9CaPB6ovg
         RHQ3BW3gR8t1GZHkqapJXEk68wKcnKNxVIuGYgGSYJrWutQ30eig3zo+LATmgosuLYuK
         O7DERmm2KEt62LPXz7Y36QSCENTU0ggvjymPDI3cJgDvLkBg7Y8D8NLaNeGzq3s9Kgqq
         9LU6eHmsWHGfiswNqcHK1XXeah2xkqAqJFQCw3crlxTVZU3zWTs2KvxFvMCgT7sdGc+S
         ahfaDuO9Sw3Lpq766hhIQbQ5BnYH1L53fJYINKO+iUbgAbRUR8nUinaO3+73BLROkGGl
         q1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=ikpFP0kNfu8f+6JvPWtl4VlPyCRYnkeLedPq9gSpVcM=;
        fh=trG48bPpIUh9CMxo/rFkIkh389GNejH1IZHhi8iicSw=;
        b=CfE47N3FUFlqKBKauQ6axNqePUmA1sZOyFhQ37fa/+MIKllGhZ5RyqwB3zRunWYbnk
         iEba+N3cIYSOZWbPShVzqynL/9K4pFHprvWuqPj2LVVF2S8+IiuGM0qd/GT0s0gQt1Nz
         BeyQN6OVC9Fw/MRJVjoL2PR6gteZCBq+rnOcMg679ufwNQ6nU8uCIxta8mCBnd4N3rXq
         E+aBpMRBTffyOE1YQ2tZlzhk+yKJPH5kfujJQX0gOW41Fqk0QhHS2YIvEGL6tHPh1H7M
         qtoviP17UIih6RTJMQO7x7uSv9dRmHjNkbkbsoeisci2ZVriRqlePcOl/CPJu1+yFhbi
         dSIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6ec7e42si11899766d6.401.2025.05.29.02.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 May 2025 02:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKZGD-0000aZ-Da; Thu, 29 May 2025 05:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uKZG9-0000aE-UH; Thu, 29 May 2025 05:09:09 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uKZG5-0008Sp-2V; Thu, 29 May 2025 05:09:09 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7L744C7kz6L5Zt;
 Thu, 29 May 2025 17:05:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id EB21B14022E;
 Thu, 29 May 2025 17:08:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 11:08:54 +0200
Date: Thu, 29 May 2025 10:08:53 +0100
To: Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <mst@redhat.com>, <linuxarm@huawei.com>,
 <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, Yuquan Wang
 <wangyuquan1236@phytium.com.cn>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Alireza Sanaee <alireza.sanaee@huawei.com>, "Zhijian Li
 (Fujitsu)" <lizhijian@fujitsu.com>
Subject: Re: [PATCH v14 0/5] arm/virt: CXL support via pxb_cxl
Message-ID: <20250529100853.00000a0d@huawei.com>
In-Reply-To: <aDeGyRM7qVYkHZrl@vm4>
References: <20250528110726.226389-1-Jonathan.Cameron@huawei.com>
 <aDeGyRM7qVYkHZrl@vm4>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nvAfMB5fKmJc

On Thu, 29 May 2025 06:57:29 +0900
Itaru Kitayama <itaru.kitayama@linux.dev> wrote:

> Hi Jonathan,
> 
> On Wed, May 28, 2025 at 12:07:21PM +0100, Jonathan Cameron wrote:
> > v14: Simplifications suggeseted by Itaru (and some extra simplifications
> >      that became apparent) and gather tags.
> >      See individual patches for more information.  
> 
> I think the suggestion was made by Zhi jian or Fan? who enaged in the
> rewview of your proposed series v13.

Ah. You are absolutely correct!  It was Zhijian Li (with some additional
comments on the comments from Fan)

Sorry about that and thanks for pointing out my mistake.

I also failed to +CC Zhijian. Again my apologies. 

Jonathan


> 
> Itaru.
> 
> > 
> > Updated cover letter
> > 
> > Richard Henderson has posted a pull request with a fix for the TCG TLB
> > issue which will hopefully merge shortly (Thanks Richard!).
> > 
> > Back in 2022, this series stalled on the absence of a solution to device
> > tree support for PCI Expander Bridges (PXB) and we ended up only having
> > x86 support upstream. I've been carrying the arm64 support out of tree
> > since then, with occasional nasty surprises (e.g. UNIMP + DT issue seen
> > a few weeks ago) and a fair number of fiddly rebases.
> > gitlab.com/jic23/qemu cxl-<latest date>.  Will update shortly with this
> > series.
> > 
> > A recent discussion with Peter Maydell indicated that there are various
> > other ACPI only features now, so in general he might be more relaxed
> > about DT support being necessary. The upcoming vSMMUv3 support would
> > run into this problem as well.
> > 
> > I presented the background to the PXB issue at Linaro connect 2022. In
> > short the issue is that PXBs steal MMIO space from the main PCI root
> > bridge. The challenge is knowing how much to steal.
> > 
> > On ACPI platforms, we can rely on EDK2 to perform an enumeration and
> > configuration of the PCI topology and QEMU can update the ACPI tables
> > after EDK2 has done this when it can simply read the space used by the
> > root ports. On device tree, there is no entity to figure out that
> > enumeration so we don't know how to size the stolen region.
> > 
> > Three approaches were discussed:
> > 1) Enumerating in QEMU. Horribly complex and the last thing we want is a
> >    3rd enumeration implementation that ends up out of sync with EDK2 and
> >    the kernel (there are frequent issues because of how those existing
> >    implementations differ.
> > 2) Figure out how to enumerate in kernel. I never put a huge amount of work
> >    into this, but it seemed likely to involve a nasty dance with similar
> >    very specific code to that EDK2 is carrying and would very challenging
> >    to upstream (given the lack of clarity on real use cases for PXBs and
> >    DT).
> > 3) Hack it based on the control we have which is bus numbers.
> >    No one liked this but it worked :)
> > 
> > The other little wrinkle would be the need to define full bindings for CXL
> > on DT + implement a fairly complex kernel stack as equivalent in ACPI
> > involves a static table, CEDT, new runtime queries via _DSM and a description
> > of various components. Doable, but so far there is no interest on physical
> > platforms. Worth noting that for now, the QEMU CXL emulation is all about
> > testing and developing the OS stack, not about virtualization (performance
> > is terrible except in some very contrived situations!)
> > 
> > There is only a very simple test in here, because my intent is not to
> > duplicate what we have on x86, but just to do a smoke test that everything
> > is hooked up.  In general we need much more comprehensive end to end CXL
> > tests but that requires a reaonsably stable guest software stack. A few
> > people have expressed interest in working on that, but we aren't there yet.
> > 
> > Note that this series has a very different use case to that in the proposed
> > SBSA-ref support:
> > https://lore.kernel.org/qemu-devel/20250117034343.26356-1-wangyuquan1236@phytium.com.cn/
> > 
> > SBSA-ref is a good choice if you want a relatively simple mostly fixed
> > configuration.  That works well with the limited host system
> > discoverability etc as EDK2 can be build against a known configuration.
> > 
> > My interest with this support in arm/virt is support host software stack
> > development (we have a wide range of contributors, most of whom are working
> > on emulation + the kernel support). I care about the weird corners. As such
> > I need to be able to bring up variable numbers of host bridges, multiple CXL
> > Fixed Memory Windows with varying characteristics (interleave etc), complex
> > NUMA topologies with wierd performance characteristics etc. We can do that
> > on x86 upstream today, or my gitlab tree. Note that we need arm support
> > for some arch specific features in the near future (cache flushing).
> > Doing kernel development with this need for flexibility on SBSA-ref is not
> > currently practical. SBSA-ref CXL support is an excellent thing, just
> > not much use to me for this work.
> > 
> > Also, we are kicking off some work on DCD virtualization, particularly to
> > support inter-host shared memory being presented up into a VM. That
> > will need upstream support on arm64 as it is built on top of the existing
> > CXL emulation to avoid the need for a separate guest software stack.
> > 
> > Note this is TCG only - it is possible to support limited use with KVM but
> > that needs additional patches not yet ready for upstream.  The challenge
> > is interleave - and the solution is don't interleave if you want to run
> > with KVM.
> > 
> > Jonathan Cameron (5):
> >   hw/cxl-host: Add an index field to CXLFixedMemoryWindow
> >   hw/cxl: Make the CXL fixed memory windows devices.
> >   hw/cxl-host: Allow split of establishing memory address and mmio
> >     setup.
> >   hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
> >     pxb-cxl
> >   qtest/cxl: Add aarch64 virt test for CXL
> > 
> >  include/hw/arm/virt.h     |   4 +
> >  include/hw/cxl/cxl.h      |   4 +
> >  include/hw/cxl/cxl_host.h |   6 +-
> >  hw/acpi/cxl.c             |  76 +++++++--------
> >  hw/arm/virt-acpi-build.c  |  34 +++++++
> >  hw/arm/virt.c             |  29 ++++++
> >  hw/cxl/cxl-host-stubs.c   |   8 +-
> >  hw/cxl/cxl-host.c         | 190 ++++++++++++++++++++++++++++++++------
> >  hw/i386/pc.c              |  51 +++++-----
> >  tests/qtest/cxl-test.c    |  59 +++++++++---
> >  tests/qtest/meson.build   |   1 +
> >  11 files changed, 353 insertions(+), 109 deletions(-)
> > 
> > -- 
> > 2.48.1
> > 
> >   

