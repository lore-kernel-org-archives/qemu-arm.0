Received: by 10.25.21.96 with SMTP id l93csp1666430lfi;
        Tue, 28 Jun 2016 07:26:34 -0700 (PDT)
X-Received: by 10.129.116.66 with SMTP id p63mr876912ywc.151.1467123994570;
        Tue, 28 Jun 2016 07:26:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si486144ywf.484.2016.06.28.07.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 07:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHtyD-0002f4-Nd
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 10:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtwF-0000za-04
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 10:24:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtwC-00069J-Rt
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 10:24:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtw7-00066Y-Cn; Tue, 28 Jun 2016 10:24:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtWi-000631-QI; Tue, 28 Jun 2016 14:58:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Jun 2016 14:58:05 +0100
Message-Id: <1467122287-24974-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
References: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH for-2.7 1/3] memory: Provide
 memory_region_init_rom()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hXNilUs06MYS

Provide a new helper function memory_region_init_rom() for memory
regions which are read-only (and unlike those created by
memory_region_init_rom_device() don't have special behaviour
for writes). This has the same behaviour as calling
memory_region_init_ram() and then memory_region_set_readonly()
(which is what we do today in boards with pure ROMs) but is a
more easily discoverable API for the purpose.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/memory.txt       |  9 +++++++--
 include/exec/memory.h | 19 +++++++++++++++++++
 memory.c              | 15 +++++++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 431d9ca..811b1bd 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -41,8 +41,13 @@ MemoryRegion):
   MemoryRegionOps structure describing the callbacks.
 
 - ROM: a ROM memory region works like RAM for reads (directly accessing
-  a region of host memory), but like MMIO for writes (invoking a callback).
-  You initialize these with memory_region_init_rom_device().
+  a region of host memory), and forbids writes. You initialize these with
+  memory_region_init_rom().
+
+- ROM device: a ROM device memory region works like RAM for reads
+  (directly accessing a region of host memory), but like MMIO for
+  writes (invoking a callback).  You initialize these with
+  memory_region_init_rom_device().
 
 - IOMMU region: an IOMMU region translates addresses of accesses made to it
   and forwards them to some other target memory region.  As the name suggests,
diff --git a/include/exec/memory.h b/include/exec/memory.h
index e3829f7..742c52f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -441,6 +441,25 @@ void memory_region_init_alias(MemoryRegion *mr,
                               uint64_t size);
 
 /**
+ * memory_region_init_rom: Initialize a ROM memory region.
+ *
+ * This has the same effect as calling memory_region_init_ram()
+ * and then marking the resulting region read-only with
+ * memory_region_set_readonly().
+ *
+ * @mr: the #MemoryRegion to be initialized.
+ * @owner: the object that tracks the region's reference count
+ * @name: the name of the region.
+ * @size: size of the region.
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+void memory_region_init_rom(MemoryRegion *mr,
+                            struct Object *owner,
+                            const char *name,
+                            uint64_t size,
+                            Error **errp);
+
+/**
  * memory_region_init_rom_device:  Initialize a ROM memory region.  Writes are
  *                                 handled via callbacks.
  *
diff --git a/memory.c b/memory.c
index 8549c79..c18ccc8 100644
--- a/memory.c
+++ b/memory.c
@@ -1376,6 +1376,21 @@ void memory_region_init_alias(MemoryRegion *mr,
     mr->alias_offset = offset;
 }
 
+void memory_region_init_rom(MemoryRegion *mr,
+                            struct Object *owner,
+                            const char *name,
+                            uint64_t size,
+                            Error **errp)
+{
+    memory_region_init(mr, owner, name, size);
+    mr->ram = true;
+    mr->readonly = true;
+    mr->terminates = true;
+    mr->destructor = memory_region_destructor_ram;
+    mr->ram_block = qemu_ram_alloc(size, mr, errp);
+    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
+}
+
 void memory_region_init_rom_device(MemoryRegion *mr,
                                    Object *owner,
                                    const MemoryRegionOps *ops,
-- 
1.9.1

