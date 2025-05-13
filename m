Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp440093njb;
        Tue, 13 May 2025 04:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfrOS5QuCjdGOxygbWCrvBDDbBECroMW56/sdJtDA+Y2miIkVoEdFgaM+miLnyYMe3JY718EAAN/0dbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFSbu+3ki2s94xdbLCg1M18L770o1vZ3l5nGwg4QbcLk0j2gIaEDlND2oYJP/DMov+C32IC
X-Received: by 2002:ac8:5d0d:0:b0:494:48b1:a046 with SMTP id d75a77b69052e-4945271499bmr269790181cf.11.1747134930791;
        Tue, 13 May 2025 04:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747134930; cv=none;
        d=google.com; s=arc-20240605;
        b=LOngwGlV2EorPoig9mPiBbml6+wbnkqAn/pU8fiBhrkhY9o9J+ZAvuKmZPSmStW6yT
         ZgYYK/2hALH/BIenR5sZsJE02KSPpJ3Ryd701GR9BZUn0L6xrH2kQCmu50DfGZq9f3bL
         21qYatEJEsDgPRWXCtMLFma2euTRqbU+dqQI8aYF8qX2U46uDgtWMIatDYt/uS+SXCaS
         wGPTG0NWU8I8T40DEgKko1qKPJlEqu6qX+WBYmBJ+VxZeMiWBzlJ9OlEIEl7rTHiDZcL
         BtAqjer5onmec/jvadlNqYL5Ehx6R0pFLXMdCyzXcgOuZJofbWEO3hWIVf9DhQW4OHSO
         ohqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=EdZWGCTfHAv4Rt4pgfT5uyM5omJoF3xIHNbIX10ORVc=;
        fh=X5nH5YuFPf4WKqGf6XsKhoyhnk+YS/0SzZ/7HifbnvI=;
        b=QkYvch+usJvaHrYT0EWurqrfoGxX14HgMf9Lk3CvSKav/zMaAZYnSkHnhxFgRA2Kk2
         pqTxOYJx0YE0Xn5yMruGkwEti9IHVx1GD1pXLDMQWseJU011FSxtx0z60HqE8CZDQq+I
         NwIYwrh56qdn2J27ywGm13j9fgTEHFCB+V2ano1U3BHfqfKF+FBnRncv9RqaOmuuuGu7
         mqHC+P/PhydIbsQy86ZBC8ga/NUHg9ueSKlhNeSJ8Vlw3/eAQeg1edHmZmrGTHs5O/m9
         Y8KrcMg7trz6/Zl/C4+vmQGB1pheJwzNm3+yMVT83nJx1eAxzt2UGiM6Xrjj7EKJ8A7D
         3/8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b359dsi104568531cf.669.2025.05.13.04.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 04:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEnbX-0005qO-7y; Tue, 13 May 2025 07:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uEnbP-0005kr-92
 for qemu-devel@nongnu.org; Tue, 13 May 2025 07:15:17 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uEnbM-0006UH-EV
 for qemu-devel@nongnu.org; Tue, 13 May 2025 07:15:14 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZxYfc4GSHz6M4Wr;
 Tue, 13 May 2025 19:10:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id D54D61402F4;
 Tue, 13 May 2025 19:14:56 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 May 2025 13:14:56 +0200
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <mst@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, 
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, Itaru Kitayama
 <itaru.kitayama@linux.dev>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v13 0/5] arm/virt: CXL support via pxb_cxl
Date: Tue, 13 May 2025 12:14:50 +0100
Message-ID: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9CT8XttYPCTt

V13:
- Make CXL fixed memory windows sysbus devices.
  IIRC this was requested by Peter in one of the reviews a long time back
  but at the time the motivation was less strong than it becomes with some
  WiP patches for hotness monitoring and high performance direct connect
  where we need a machine type independent way to iterate all the CXL
  fixed memory windows. This is a convenient place to do it so drag that
  work forward into this series.

  This allows us to drop separate list and necessary machine specific
  access code in favour of
  object_child_foreach_recursive(object_get_root(),...)
  One snag is that the ordering of multiple fixed memory windows in that
  walk depends on the underlying g_hash_table iterations rather than the
  order of creation. In the memory map layout and ACPI table creation we
  need both stable and predictable ordering. Resolve this in a similar
  fashion to object_class_get_list_sorted() be throwing them in a GSList
  and sorting that. Only use this when a sorted list is needed.

  Dropped RFC as now I'm happy with this code and would like to get it
  upstream!  Particularly as it broken even today due to enscripten
  related changes that stop us using g_slist_sort(). Easy fix though.

Note that we have an issue for CXL emulation in general and TCG which
is being discussed in:
https://lore.kernel.org/all/20250425183524.00000b28@huawei.com/
(also affects some other platforms)

Until that is resolved, either rebase this back on 10.0 or just
don't let code run out of it (don't use KMEM to expose it as normal
memory, use DAX instead).

Previous cover letter.

Back in 2022, this series stalled on the absence of a solution to device
tree support for PCI Expander Bridges (PXB) and we ended up only having
x86 support upstream. I've been carrying the arm64 support out of tree
since then, with occasional nasty surprises (e.g. UNIMP + DT issue seen
a few weeks ago) and a fair number of fiddly rebases.
gitlab.com/jic23/qemu cxl-<latest date>

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

Back to posting as an RFC because there was some discussion of approach to
modelling the devices that may need a bit of redesign.
The discussion kind of died out on the back of DT issue and I doubt anyone
can remember the details.

https://lore.kernel.org/qemu-devel/20220616141950.23374-1-Jonathan.Cameron@huawei.com/

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

Jonathan Cameron (5):
  hw/cxl-host: Add an index field to CXLFixedMemoryWindow
  hw/cxl: Make the CXL fixed memory windows devices.
  hw/cxl-host: Allow split of establishing memory address and mmio
    setup.
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  qtest/cxl: Add aarch64 virt test for CXL

 include/hw/arm/virt.h     |   4 +
 include/hw/cxl/cxl.h      |   4 +
 include/hw/cxl/cxl_host.h |   6 +-
 hw/acpi/cxl.c             |  83 +++++++++------
 hw/arm/virt-acpi-build.c  |  34 ++++++
 hw/arm/virt.c             |  29 +++++
 hw/cxl/cxl-host-stubs.c   |   8 +-
 hw/cxl/cxl-host.c         | 218 ++++++++++++++++++++++++++++++++------
 hw/i386/pc.c              |  51 ++++-----
 tests/qtest/cxl-test.c    |  59 ++++++++---
 tests/qtest/meson.build   |   1 +
 11 files changed, 389 insertions(+), 108 deletions(-)

-- 
2.43.0

