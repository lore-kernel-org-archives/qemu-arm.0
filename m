Received: by 10.80.163.71 with SMTP id 65csp3118527edn;
        Thu, 6 Oct 2016 02:53:01 -0700 (PDT)
X-Received: by 10.237.38.132 with SMTP id q4mr12983221qtd.98.1475747581918;
        Thu, 06 Oct 2016 02:53:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si328317qkb.310.2016.10.06.02.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 02:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs5ML-0008Bt-BX
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 05:53:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KW-0006zv-CL
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 05:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KV-0007Fk-Cu
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 05:51:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs5KT-0007EJ-0e; Thu, 06 Oct 2016 05:51:05 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61A5A12B48;
	Thu,  6 Oct 2016 09:51:04 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u969okS4016130; Thu, 6 Oct 2016 05:51:01 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 09:50:41 +0000
Message-Id: <1475747444-12552-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
References: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 06 Oct 2016 09:51:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 5/8] memory: memory_region_find_by_name
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W3298NFxI+vc

This new helper makes possible to search for a MemoryRegion matching
a given name within a root MemoryRegion.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 11 +++++++++++
 memory.c              | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f97b1f4..f62e5b5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1217,6 +1217,17 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
                                        hwaddr addr, uint64_t size);
 
 /**
+ * memory_region_find_by_name: Locates the first #MemoryRegion within @mr
+ * whose name matches @name
+ *
+ * @mr: the root MemoryRegion
+ * @name: name of the target MemoryRegion
+ *
+ * Returns the matched memory region or NULL
+ */
+MemoryRegion *memory_region_find_by_name(MemoryRegion *mr, const char *name);
+
+/**
  * memory_global_dirty_log_sync: synchronize the dirty log for all memory
  *
  * Synchronizes the dirty page log for all address spaces.
diff --git a/memory.c b/memory.c
index 00a0ebe..3701b4f 100644
--- a/memory.c
+++ b/memory.c
@@ -2166,6 +2166,22 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
     return ret;
 }
 
+MemoryRegion *memory_region_find_by_name(MemoryRegion *root,
+                                         const char *name)
+{
+    MemoryRegion *other;
+
+    QTAILQ_FOREACH(other, &root->subregions, subregions_link) {
+        if (!strcmp(other->name, name)) {
+            memory_region_ref(other);
+            return other;
+        } else {
+            memory_region_find_by_name(other, name);
+        }
+    }
+    return NULL;
+}
+
 bool memory_region_present(MemoryRegion *container, hwaddr addr)
 {
     MemoryRegion *mr;
-- 
1.9.1

