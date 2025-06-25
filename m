Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp965882dyb;
        Wed, 25 Jun 2025 09:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ4wAAO4elUcxSFMhzMMEZ1nVVxwMug38E56pyWsMJgO+sKZCMv4pYCJ8FqKam0UFKidhGC2s9P/DRVA==@linaro.org
X-Google-Smtp-Source: AGHT+IHn6vPv+j4DbfcVzNWu1XkrwzW70kCA1pwNEQLlx8XfRyKeEb//lHVq72T33n/uobPUr8qe
X-Received: by 2002:a05:6000:389:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3a6ed66466dmr3234992f8f.37.1750868368827;
        Wed, 25 Jun 2025 09:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750868368; cv=none;
        d=google.com; s=arc-20240605;
        b=Sf7nriiCbEMIEifEMP2eIc8gaYH/UlELQwA2NaFzx8T9SGS1gvE8Z7/105sOH5l2bk
         h6yJSbAccoD6uD/Ch+ukEE4QCJcsENAwO2Yw78eoW33oJ7BGQHRA3+BJ+MK4UQK7PosT
         5z4UX2gMuKemflsfP60k/p/VSCiHabn65Tv5OxCtf4dUgvs7NPRmZOIQMO6bxBxncc5Y
         aMV/8lKWfreS1LUlGq+OSeC25e/qo/aXUzHoMiMh7pr+lszJ4D/V9NDGv1xCPIomNYJs
         pVmXwSmpVDbPUaNK6Y8lKiJIrtesc943A9PyHJbhCTAEvkW3fxFKCoBRB9hFLs7xJzTq
         Yjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=LX2/c4xIcBQQA5CxkvJ/nhMcgf3tdjkpaU7bF0ke704=;
        fh=XUvLIQQ+XauERGTJwKbaGPxk6m9WHQ9TdRLiHbw47Bs=;
        b=jl0zgIHILUYidJfXDPEprQt8avr6QlgJNcxNbySBOUQry48uDFG9KxsRmRzCnjDaxR
         zqeCCHWnKxLlshuVf42sXg9O7PmdC4i61BfZsyAnTZ8pJqBNWKjdOms96Ww/KHXr3dk6
         JjYeSiDv2Vfgn/XMxNQJQNLsRPGbuBiKBz6EMWde6eZY9bBw941YwaJESuQHqJfmtmXg
         yYeBbDtLBsNqFbH/WI2Sakn6chgSxMT73/o04gXpcysgdY6ue9VGFxH1/JhyBRgWwy0F
         6ELJ6hqU1ejtKDxXPK+wpVKuKCLOOOzngx2wFR1GIh1vEHMzLSmOyjb1il2VmPsd7zcR
         HQLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80e1c58si3279932f8f.271.2025.06.25.09.19.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jun 2025 09:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bS6TS2qdFz6DKst;
	Thu, 26 Jun 2025 00:19:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 16D891404A9;
	Thu, 26 Jun 2025 00:19:28 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Jun 2025 18:19:27 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, <mst@redhat.com>, Zhijian Li
	<lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH qemu v16 0/5] arm/virt: CXL support via pxb_cxl
Date: Wed, 25 Jun 2025 17:19:21 +0100
Message-ID: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: uaJUUkQ/Yqa8

v16:
- Mostly additional documentation and descriptive text in
  patch titles.
- Update test to reflect changes to other tests.
- Update physmem_max in virt to include the CXL memory.

Updated cover letter

Back in 2022, this series stalled on the absence of a solution to device
tree support for PCI Expander Bridges (PXB) and we ended up only having
x86 support upstream. I've been carrying the arm64 support out of tree
since then, with occasional nasty surprises (e.g. UNIMP + DT issue seen
a few weeks ago) and a fair number of fiddly rebases.
gitlab.com/jic23/qemu cxl-<latest date>.  Will update shortly with this
series.

A recent discussion with Peter Maydell indicated that there are various
other ACPI only features now, so in general he might be more relaxed
about DT support being necessary. The upcoming vSMMUv3 support would
run into this problem as well.

I presented the background to the PXB issue at Linaro connect 2022. In
short the issue is that PXBs steal MMIO space from the main PCI root
bridge. The challenge is knowing how much to steal.

On ACPI platforms, we can rely on EDK2 to perform an enumeration and
configuration of the PCI topology and QEMU can update the ACPI tables
after EDK2 has done this when it can simply read the space used by the
root ports. On device tree, there is no entity to figure out that
enumeration so we don't know how to size the stolen region.

Three approaches were discussed:
1) Enumerating in QEMU. Horribly complex and the last thing we want is a
   3rd enumeration implementation that ends up out of sync with EDK2 and
   the kernel (there are frequent issues because of how those existing
   implementations differ.
2) Figure out how to enumerate in kernel. I never put a huge amount of work
   into this, but it seemed likely to involve a nasty dance with similar
   very specific code to that EDK2 is carrying and would very challenging
   to upstream (given the lack of clarity on real use cases for PXBs and
   DT).
3) Hack it based on the control we have which is bus numbers.
   No one liked this but it worked :)

The other little wrinkle would be the need to define full bindings for CXL
on DT + implement a fairly complex kernel stack as equivalent in ACPI
involves a static table, CEDT, new runtime queries via _DSM and a description
of various components. Doable, but so far there is no interest on physical
platforms. Worth noting that for now, the QEMU CXL emulation is all about
testing and developing the OS stack, not about virtualization (performance
is terrible except in some very contrived situations!)

There is only a very simple test in here, because my intent is not to
duplicate what we have on x86, but just to do a smoke test that everything
is hooked up.  In general we need much more comprehensive end to end CXL
tests but that requires a reaonsably stable guest software stack. A few
people have expressed interest in working on that, but we aren't there yet.

Note that this series has a very different use case to that in the proposed
SBSA-ref support:
https://lore.kernel.org/qemu-devel/20250117034343.26356-1-wangyuquan1236@phytium.com.cn/

SBSA-ref is a good choice if you want a relatively simple mostly fixed
configuration.  That works well with the limited host system
discoverability etc as EDK2 can be build against a known configuration.

My interest with this support in arm/virt is support host software stack
development (we have a wide range of contributors, most of whom are working
on emulation + the kernel support). I care about the weird corners. As such
I need to be able to bring up variable numbers of host bridges, multiple CXL
Fixed Memory Windows with varying characteristics (interleave etc), complex
NUMA topologies with wierd performance characteristics etc. We can do that
on x86 upstream today, or my gitlab tree. Note that we need arm support
for some arch specific features in the near future (cache flushing).
Doing kernel development with this need for flexibility on SBSA-ref is not
currently practical. SBSA-ref CXL support is an excellent thing, just
not much use to me for this work.

Also, we are kicking off some work on DCD virtualization, particularly to
support inter-host shared memory being presented up into a VM. That
will need upstream support on arm64 as it is built on top of the existing
CXL emulation to avoid the need for a separate guest software stack.

Note this is TCG only - it is possible to support limited use with KVM but
that needs additional patches not yet ready for upstream.  The challenge
is interleave - and the solution is don't interleave if you want to run
with KVM.

Jonathan Cameron (5):
  hw/cxl-host: Add an index field to CXLFixedMemoryWindow
  hw/cxl: Make the CXL fixed memory windows devices.
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  docs/cxl: Add an arm/virt example.
  qtest/cxl: Add aarch64 virt test for CXL

 docs/system/arm/virt.rst    |   9 ++
 docs/system/devices/cxl.rst |  10 +++
 include/hw/arm/virt.h       |   4 +
 include/hw/cxl/cxl.h        |   5 +-
 include/hw/cxl/cxl_host.h   |   5 +-
 hw/acpi/cxl.c               |  76 ++++++++--------
 hw/arm/virt-acpi-build.c    |  34 +++++++
 hw/arm/virt.c               |  29 ++++++
 hw/cxl/cxl-host-stubs.c     |   7 +-
 hw/cxl/cxl-host.c           | 174 +++++++++++++++++++++++++++++-------
 hw/i386/pc.c                |  50 +++++------
 tests/qtest/cxl-test.c      |  58 +++++++++---
 tests/qtest/meson.build     |   1 +
 13 files changed, 352 insertions(+), 110 deletions(-)

-- 
2.48.1
