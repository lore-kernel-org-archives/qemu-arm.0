Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743461wrq;
        Mon, 4 Jun 2018 08:29:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIR+ExvtnLUdpfFwbll0Nx95A0DkLwkQlnMw77F+pJ7Y5W01j/VlhHAla+L+48+Hv+Yszc2
X-Received: by 2002:a19:c004:: with SMTP id q4-v6mr5687713lff.16.1528126184886;
        Mon, 04 Jun 2018 08:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126184; cv=none;
        d=google.com; s=arc-20160816;
        b=FYFiQkeb7rh8FxE96VvxCcDGy7oSrHg9kJ+BcLSMAIiznGZT34YYWj/gPQZ8LRAxm5
         fiTRiC4XikegDwJhr7CS5xalILXhs4QfBnRth/CrvP4ZOBgoM37MSBHg0hqrvwIybpQD
         4V+Tu8fq+bhpP5Uq1tHF5ayfVf2ZBgoK/5lGVGYyt5ru7kNccipjf/wkdHAtpeJrijG0
         4du3BC7XS4B0DfzmheYX6AmNIqZ+K49NuL0sSW7hTjet2ltrgdJCYf2AfMKVyTM9JU+5
         QY1YEphVhldzKcuOzJNGLYTc+ESclxTEWW6To7ougRwMxPK/AVoICWpKdIjc1yLIZE//
         3kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=O8kwIomHqWoXliOp05PIwKGInP2VgHyvT5wUya7fjJI=;
        b=C6+PK9e8F510fV3vnE8h/cwBYTctrRD3O70VseKgBdp+IuyzceW59xDeLdoarar5BQ
         EEnu6w/F2vTJ7jy4KRSFU62eyPlg4Sd6rpbQ0ApGAj/WpnfOl1YC914xxXFm7cT5SOze
         1T2KjIEXxYxryvep611TijBX0L6ySG4iLhkueHdSDznO+e1piNpWhLpJ7zSoje0XNceg
         rPneio594Vk369Ly1QLTE/g15PXeO0U15dw6Dixc6KNcZPXoVP/30CA7aAuNstw3e3Ga
         QEmtqI+5tNYmqf6BQOWqXWFFIztKqwozM2LNB6YmP5VYy7MEK9HzAq5fBHxL9Fp4Jmrx
         dNZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 38-v6si12507192lfv.341.2018.06.04.08.29.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQU-00070p-Tz; Mon, 04 Jun 2018 16:29:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 01/13] iommu: Add IOMMU index concept to IOMMU API
Date: Mon,  4 Jun 2018 16:29:29 +0100
Message-Id: <20180604152941.20374-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
X-TUID: JtutZ84iUWit

If an IOMMU supports mappings that care about the memory
transaction attributes, then it no longer has a unique
address -> output mapping, but more than one. We can
represent these using an IOMMU index, analogous to TCG's
mmu indexes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory.h | 55 +++++++++++++++++++++++++++++++++++++++++++
 memory.c              | 23 ++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index eb2ba065195..fa6e98ee7be 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -206,6 +206,20 @@ enum IOMMUMemoryRegionAttr {
  * to report whenever mappings are changed, by calling
  * memory_region_notify_iommu() (or, if necessary, by calling
  * memory_region_notify_one() for each registered notifier).
+ *
+ * Conceptually an IOMMU provides a mapping from input address
+ * to an output TLB entry. If the IOMMU is aware of memory transaction
+ * attributes and the output TLB entry depends on the transaction
+ * attributes, we represent this using IOMMU indexes. Each index
+ * selects a particular translation table that the IOMMU has:
+ *   @attrs_to_index returns the IOMMU index for a set of transaction attributes
+ *   @translate takes an input address and an IOMMU index
+ * and the mapping returned can only depend on the input address and the
+ * IOMMU index.
+ *
+ * Most IOMMUs don't care about the transaction attributes and support
+ * only a single IOMMU index. A more complex IOMMU might have one index
+ * for secure transactions and one for non-secure transactions.
  */
 typedef struct IOMMUMemoryRegionClass {
     /* private */
@@ -290,6 +304,29 @@ typedef struct IOMMUMemoryRegionClass {
      */
     int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr attr,
                     void *data);
+
+    /* Return the IOMMU index to use for a given set of transaction attributes.
+     *
+     * Optional method: if an IOMMU only supports a single IOMMU index then
+     * the default implementation of memory_region_iommu_attrs_to_index()
+     * will return 0.
+     *
+     * The indexes supported by an IOMMU must be contiguous, starting at 0.
+     *
+     * @iommu: the IOMMUMemoryRegion
+     * @attrs: memory transaction attributes
+     */
+    int (*attrs_to_index)(IOMMUMemoryRegion *iommu, MemTxAttrs attrs);
+
+    /* Return the number of IOMMU indexes this IOMMU supports.
+     *
+     * Optional method: if this method is not provided, then
+     * memory_region_iommu_num_indexes() will return 1, indicating that
+     * only a single IOMMU index is supported.
+     *
+     * @iommu: the IOMMUMemoryRegion
+     */
+    int (*num_indexes)(IOMMUMemoryRegion *iommu);
 } IOMMUMemoryRegionClass;
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1054,6 +1091,24 @@ int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
                                  enum IOMMUMemoryRegionAttr attr,
                                  void *data);
 
+/**
+ * memory_region_iommu_attrs_to_index: return the IOMMU index to
+ * use for translations with the given memory transaction attributes.
+ *
+ * @iommu_mr: the memory region
+ * @attrs: the memory transaction attributes
+ */
+int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
+                                       MemTxAttrs attrs);
+
+/**
+ * memory_region_iommu_num_indexes: return the total number of IOMMU
+ * indexes that this IOMMU supports.
+ *
+ * @iommu_mr: the memory region
+ */
+int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/memory.c b/memory.c
index 3212acc7f49..64f4a55d546 100644
--- a/memory.c
+++ b/memory.c
@@ -1915,6 +1915,29 @@ int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
     return imrc->get_attr(iommu_mr, attr, data);
 }
 
+int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
+                                       MemTxAttrs attrs)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+
+    if (!imrc->attrs_to_index) {
+        return 0;
+    }
+
+    return imrc->attrs_to_index(iommu_mr, attrs);
+}
+
+int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+
+    if (!imrc->num_indexes) {
+        return 1;
+    }
+
+    return imrc->num_indexes(iommu_mr);
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask = 1 << client;
-- 
2.17.1
