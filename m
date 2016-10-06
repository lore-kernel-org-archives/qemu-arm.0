Received: by 10.80.163.71 with SMTP id 65csp3167278edn;
        Thu, 6 Oct 2016 04:49:06 -0700 (PDT)
X-Received: by 10.200.55.59 with SMTP id o56mr13594325qtb.65.1475754546354;
        Thu, 06 Oct 2016 04:49:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si7553624qkd.105.2016.10.06.04.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 04:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs7Af-0008QR-NF
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 07:49:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs73b-00025C-TL
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 07:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs73a-0001r1-PP
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 07:41:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs73a-0001qv-Ft; Thu, 06 Oct 2016 07:41:46 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5DFBC04B928;
	Thu,  6 Oct 2016 11:41:45 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u96BfVNX005464; Thu, 6 Oct 2016 07:41:43 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 11:41:26 +0000
Message-Id: <1475754090-22681-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
References: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 06 Oct 2016 11:41:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 4/8] memory: Add reserved_iova region type
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPJPzEF1vgfx

Introduce a new reserved_iova region type. This type of iova region
is bound to be used by the kernel to map some host physical addresses
(typically MSI frames).

A new initializer, memory_region_init_reserved_iova is introduced, as
well as a test function, memory_region_is_reserved_iova.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 29 +++++++++++++++++++++++++++++
 memory.c              | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 10d7eac..f97b1f4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -191,6 +191,7 @@ struct MemoryRegion {
     /* The following fields should fit in a cache line */
     bool romd_mode;
     bool ram;
+    bool reserved_iova;
     bool subpage;
     bool readonly; /* For RAM regions */
     bool rom_device;
@@ -385,6 +386,21 @@ void memory_region_init_ram(MemoryRegion *mr,
                             Error **errp);
 
 /**
+ * memory_region_init_reserved_iova:  Initialize reserved iova memory region
+ *
+ * @mr: the #MemoryRegion to be initialized.
+ * @owner: the object that tracks the region's reference count
+ * @name: the name of the region.
+ * @size: size of the region.
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+void memory_region_init_reserved_iova(MemoryRegion *mr,
+                                      struct Object *owner,
+                                      const char *name,
+                                      uint64_t size,
+                                      Error **errp);
+
+/**
  * memory_region_init_resizeable_ram:  Initialize memory region with resizeable
  *                                     RAM.  Accesses into the region will
  *                                     modify memory directly.  Only an initial
@@ -573,6 +589,19 @@ static inline bool memory_region_is_ram(MemoryRegion *mr)
 }
 
 /**
+ * memory_region_is_reserved_iova: check whether a memory region corresponds to
+   reserved iova
+ *
+ * Returns %true is a memory region is reserved iova
+ *
+ * @mr: the memory region being queried
+ */
+static inline bool memory_region_is_reserved_iova(MemoryRegion *mr)
+{
+    return mr->reserved_iova;
+}
+
+/**
  * memory_region_is_skip_dump: check whether a memory region should not be
  *                             dumped
  *
diff --git a/memory.c b/memory.c
index 58f9269..00a0ebe 100644
--- a/memory.c
+++ b/memory.c
@@ -1309,6 +1309,17 @@ void memory_region_init_ram(MemoryRegion *mr,
     mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
 }
 
+void memory_region_init_reserved_iova(MemoryRegion *mr,
+                                      Object *owner,
+                                      const char *name,
+                                      uint64_t size,
+                                      Error **errp)
+{
+    memory_region_init(mr, owner, name, size);
+    mr->reserved_iova = true;
+    mr->terminates = true;
+}
+
 void memory_region_init_resizeable_ram(MemoryRegion *mr,
                                        Object *owner,
                                        const char *name,
-- 
1.9.1

