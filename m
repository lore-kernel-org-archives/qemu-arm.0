Received: by 10.25.21.96 with SMTP id l93csp2054065lfi;
        Tue, 21 Jun 2016 10:11:20 -0700 (PDT)
X-Received: by 10.237.40.99 with SMTP id r90mr31467003qtd.0.1466529080841;
        Tue, 21 Jun 2016 10:11:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si618381qkc.229.2016.06.21.10.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPCq-0005QQ-8R
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBL-00047U-K0
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBJ-00045r-NF
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBJ-00044f-G1; Tue, 21 Jun 2016 13:09:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBA-00024i-8Q; Tue, 21 Jun 2016 18:09:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:30 +0100
Message-Id: <1466528974-12183-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 2/6] exec.c: Remove static allocation of
 sub_section of sub_page
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+pTvOA6oIKd

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Allocate sub_section dynamically. Remove dependency
on TARGET_PAGE_SIZE to make run-time page size detection
for arm platforms.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
Message-id: 1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com
[PMM: use flexible array member rather than separate malloc
 so we don't need an extra pointer deref when using it]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/exec.c b/exec.c
index 0122ef7..8eaeb0c 100644
--- a/exec.c
+++ b/exec.c
@@ -153,7 +153,7 @@ typedef struct subpage_t {
     MemoryRegion iomem;
     AddressSpace *as;
     hwaddr base;
-    uint16_t sub_section[TARGET_PAGE_SIZE];
+    uint16_t sub_section[];
 } subpage_t;
 
 #define PHYS_SECTION_UNASSIGNED 0
@@ -2270,8 +2270,7 @@ static subpage_t *subpage_init(AddressSpace *as, hwaddr base)
 {
     subpage_t *mmio;
 
-    mmio = g_malloc0(sizeof(subpage_t));
-
+    mmio = g_malloc0(sizeof(subpage_t) + TARGET_PAGE_SIZE * sizeof(uint16_t));
     mmio->as = as;
     mmio->base = base;
     memory_region_init_io(&mmio->iomem, NULL, &subpage_ops, mmio,
-- 
1.9.1

