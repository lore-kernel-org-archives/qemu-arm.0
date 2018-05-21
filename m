Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311311wme;
        Mon, 21 May 2018 07:04:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrKHbMLh6wulaXra3Czhe810FZIdN8x7/X8C+0FApysw3ovQ8/9QZekBtLZQdajVskQVnJc
X-Received: by 2002:adf:dd03:: with SMTP id a3-v6mr17292787wrm.0.1526911453838;
        Mon, 21 May 2018 07:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911453; cv=none;
        d=google.com; s=arc-20160816;
        b=Qfa4LTgARSSX8gZdoeFCqYXSh2TsCQ6anlx4vvTCXsjZ+SgL2c6tJvspt3rzvlu0Nf
         1qx0tiOuqnZ6WGINidDXTUyoN83Q5y83rTPI1gZ08ASVEYBfCsP2nn7UVpbxbnikfVa2
         /a+5SpwKBWxQCWjSAU86U6lkTfUkaMGZ8lhbgvsvSpIMz01R78fvGaky7FYbpViD5ySq
         co7TQb8j61oozEn1423w7dWKVhCP1dUeqCxZjtCMhHtCVb6QTo5t9SBc2zZUGPTgLAXm
         8/345eKu2EnUrhwwmqBzwynGgcRzUaYukyuJGwh+M4cU07MwBsakx/tQUNuELv2kAByR
         NwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=RDuOLuW+bw/W+Z36lEaYTXjQjWuXOhatX2OGI+6mwgI=;
        b=QG2xrvKUeQu7coNZkv1cMcMF9Z8uDDga/W17mI9DFDzZGc8tQ4PgQBx25I5UW90Y2X
         xiKiDlOHn11dkAKR/P9niZWILn9uy6HDl2p+JZhzuSPpC+AXxjfD9KjDB1DrohGKKt/H
         3yepbmanXqEvGnWQngcI4y/Zi4eN0QC23a5dx/xLN0aEQbv1I8+Muji0sLIfL3Y1tinS
         7wX6e1fShkqBsvdZaNu590m8F6uUzn6q+hHYDzE0Tkp97FMZH1PZqzK+aZUrtSnhrp6A
         mBkMW5rZ/D0jyI/RcYEy0OJoqtg6s+H5dR0zNV0mcTwN/3DXHjq4Rr6ABrGj3GWDolY3
         fqZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id g43-v6si11919506wrd.88.2018.05.21.07.04.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ5-0007iy-BZ; Mon, 21 May 2018 15:04:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 14/27] iommu: Add IOMMU index concept to IOMMU API
Date: Mon, 21 May 2018 15:03:49 +0100
Message-Id: <20180521140402.23318-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: LdFWEkS05m9Y

If an IOMMU supports mappings that care about the memory
transaction attributes, then it no longer has a unique
address -> output mapping, but more than one. We can
represent these using an IOMMU index, analogous to TCG's
mmu indexes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++++
 memory.c              | 23 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 309fdfb89b..f6226fb263 100644
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
@@ -290,6 +304,26 @@ typedef struct IOMMUMemoryRegionClass {
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
+     */
 } IOMMUMemoryRegionClass;
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1077,6 +1111,24 @@ int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
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
index 10fa2ddd31..07d5fa7862 100644
--- a/memory.c
+++ b/memory.c
@@ -1918,6 +1918,29 @@ int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
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
2.17.0
