Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311156wme;
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoNhHXLP9EZ1H2/4+JMXYslH9peF+lOUEdFhHpL9QSClufsrvweBowdKPQ62i8ohKiw8LZJ
X-Received: by 2002:a1c:b4e:: with SMTP id 75-v6mr10305946wml.32.1526911448763;
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911448; cv=none;
        d=google.com; s=arc-20160816;
        b=dxNLgxHWJYnRQT+HtzRvxHuVzMMpAROUwjIeD8FS00AdW1rEV4XTjejzy9BxKaDI0X
         QC66h7x3EOxdGAnuEwzJ2NeUqty7k/6BKBeZV0wZMMA42/xLvSpAzicM+Q3fnIOK+lth
         t8j8ItfnvUcr7Y2JtAUqFTj4x5fm50X0lTdGQhS0csG3N3B8XEHx5RAjJaCoDFkl8cqe
         OQai4TUPlWQOW4cQmSzsuqpIiqPoYqwF1QNOf5V++XPGvbSFj2iPx6rXLYtwrXkL/fTn
         dINyJL3lR6RBBPjbINWJWyHxgjmLDXUWWe7bScivcgJahSidN05Diz8TZjDMAGiVY7Yc
         fCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=75FF8kUSPdk7in9rwItOUSEmA+1M51AmgxDJYXHLq40=;
        b=Oaa56MANUq0UgB2yyd4Vqk8a3fqLkVeQpvxOkvoyHqNZTMjoxpPIKPpb0CIIHaGlQw
         ygdKYYETgt5x7DN521LeFAZYMFWK68e8+iYhJ2QebPwBSvYYnO7SWTYh/72afWvTik8l
         5U6gF5EH55tY8DAkke7bFEnizuSm84GvYKKc+XRw9Lbj10PCqBR5o7hAxrycUCheFxY2
         hmekovYKvjG7soLsbMsDqdWql5SCSAnnJj7ib9zLjdHGAIEPFZgF+oZA4fI8pdKajrxh
         dniqdMq3piCTm7X/g+j8UXnMdi7XX/d6iLnTFNclokcUyU+fBEmudv3aB9m/64S1s41K
         KH1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id b25-v6si986835wrc.171.2018.05.21.07.04.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlPw-0007dC-3z; Mon, 21 May 2018 15:04:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 01/27] memory.h: Improve IOMMU related documentation
Date: Mon, 21 May 2018 15:03:36 +0100
Message-Id: <20180521140402.23318-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: bwmgi6TydQ7g

Add more detail to the documentation for memory_region_init_iommu()
and other IOMMU-related functions and data structures.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2->v3 changes:
 * minor wording tweaks per Eric's review
 * moved the bit about requirements to notify out from the translate
   method docs to the top level class doc comment
 * added description of flags argument and in particular that it's
   just an optimization and callers can pass IOMMU_NONE to get the
   full permissions
v1 -> v2 changes:
 * documented replay method
 * added note about wanting RCU or big qemu lock while calling
   translate
---
 include/exec/memory.h | 105 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4fa1227f13..cce355d2d8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -194,29 +194,100 @@ enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD
 };
 
+/**
+ * IOMMUMemoryRegionClass:
+ *
+ * All IOMMU implementations need to subclass TYPE_IOMMU_MEMORY_REGION
+ * and provide an implementation of at least the @translate method here
+ * to handle requests to the memory region. Other methods are optional.
+ *
+ * The IOMMU implementation must use the IOMMU notifier infrastructure
+ * to report whenever mappings are changed, by calling
+ * memory_region_notify_iommu() (or, if necessary, by calling
+ * memory_region_notify_one() for each registered notifier).
+ */
 typedef struct IOMMUMemoryRegionClass {
     /* private */
     struct DeviceClass parent_class;
 
     /*
-     * Return a TLB entry that contains a given address. Flag should
-     * be the access permission of this translation operation. We can
-     * set flag to IOMMU_NONE to mean that we don't need any
-     * read/write permission checks, like, when for region replay.
+     * Return a TLB entry that contains a given address.
+     *
+     * The IOMMUAccessFlags indicated via @flag are optional and may
+     * be specified as IOMMU_NONE to indicate that the caller needs
+     * the full translation information for both reads and writes. If
+     * the access flags are specified then the IOMMU implementation
+     * may use this as an optimization, to stop doing a page table
+     * walk as soon as it knows that the requested permissions are not
+     * allowed. If IOMMU_NONE is passed then the IOMMU must do the
+     * full page table walk and report the permissions in the returned
+     * IOMMUTLBEntry. (Note that this implies that an IOMMU may not
+     * return different mappings for reads and writes.)
+     *
+     * The returned information remains valid while the caller is
+     * holding the big QEMU lock or is inside an RCU critical section;
+     * if the caller wishes to cache the mapping beyond that it must
+     * register an IOMMU notifier so it can invalidate its cached
+     * information when the IOMMU mapping changes.
+     *
+     * @iommu: the IOMMUMemoryRegion
+     * @hwaddr: address to be translated within the memory region
+     * @flag: requested access permissions
      */
     IOMMUTLBEntry (*translate)(IOMMUMemoryRegion *iommu, hwaddr addr,
                                IOMMUAccessFlags flag);
-    /* Returns minimum supported page size */
+    /* Returns minimum supported page size in bytes.
+     * If this method is not provided then the minimum is assumed to
+     * be TARGET_PAGE_SIZE.
+     *
+     * @iommu: the IOMMUMemoryRegion
+     */
     uint64_t (*get_min_page_size)(IOMMUMemoryRegion *iommu);
-    /* Called when IOMMU Notifier flag changed */
+    /* Called when IOMMU Notifier flag changes (ie when the set of
+     * events which IOMMU users are requesting notification for changes).
+     * Optional method -- need not be provided if the IOMMU does not
+     * need to know exactly which events must be notified.
+     *
+     * @iommu: the IOMMUMemoryRegion
+     * @old_flags: events which previously needed to be notified
+     * @new_flags: events which now need to be notified
+     */
     void (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
                                 IOMMUNotifierFlag old_flags,
                                 IOMMUNotifierFlag new_flags);
-    /* Set this up to provide customized IOMMU replay function */
+    /* Called to handle memory_region_iommu_replay().
+     *
+     * The default implementation of memory_region_iommu_replay() is to
+     * call the IOMMU translate method for every page in the address space
+     * with flag == IOMMU_NONE and then call the notifier if translate
+     * returns a valid mapping. If this method is implemented then it
+     * overrides the default behaviour, and must provide the full semantics
+     * of memory_region_iommu_replay(), by calling @notifier for every
+     * translation present in the IOMMU.
+     *
+     * Optional method -- an IOMMU only needs to provide this method
+     * if the default is inefficient or produces undesirable side effects.
+     *
+     * Note: this is not related to record-and-replay functionality.
+     */
     void (*replay)(IOMMUMemoryRegion *iommu, IOMMUNotifier *notifier);
 
-    /* Get IOMMU misc attributes */
-    int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr,
+    /* Get IOMMU misc attributes. This is an optional method that
+     * can be used to allow users of the IOMMU to get implementation-specific
+     * information. The IOMMU implements this method to handle calls
+     * by IOMMU users to memory_region_iommu_get_attr() by filling in
+     * the arbitrary data pointer for any IOMMUMemoryRegionAttr values that
+     * the IOMMU supports. If the method is unimplemented then
+     * memory_region_iommu_get_attr() will always return -EINVAL.
+     *
+     * @iommu: the IOMMUMemoryRegion
+     * @attr: attribute being queried
+     * @data: memory to fill in with the attribute data
+     *
+     * Returns 0 on success, or a negative errno; in particular
+     * returns -EINVAL for unrecognized or unimplemented attribute types.
+     */
+    int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr attr,
                     void *data);
 } IOMMUMemoryRegionClass;
 
@@ -705,6 +776,14 @@ static inline void memory_region_init_reservation(MemoryRegion *mr,
  * An IOMMU region translates addresses and forwards accesses to a target
  * memory region.
  *
+ * The IOMMU implementation must define a subclass of TYPE_IOMMU_MEMORY_REGION.
+ * @_iommu_mr should be a pointer to enough memory for an instance of
+ * that subclass, @instance_size is the size of that subclass, and
+ * @mrtypename is its name. This function will initialize @_iommu_mr as an
+ * instance of the subclass, and its methods will then be called to handle
+ * accesses to the memory region. See the documentation of
+ * #IOMMUMemoryRegionClass for further details.
+ *
  * @_iommu_mr: the #IOMMUMemoryRegion to be initialized
  * @instance_size: the IOMMUMemoryRegion subclass instance size
  * @mrtypename: the type name of the #IOMMUMemoryRegion
@@ -953,6 +1032,8 @@ void memory_region_register_iommu_notifier(MemoryRegion *mr,
  * a notifier with the minimum page granularity returned by
  * mr->iommu_ops->get_page_size().
  *
+ * Note: this is not related to record-and-replay functionality.
+ *
  * @iommu_mr: the memory region to observe
  * @n: the notifier to which to replay iommu mappings
  */
@@ -962,6 +1043,8 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
  * memory_region_iommu_replay_all: replay existing IOMMU translations
  * to all the notifiers registered.
  *
+ * Note: this is not related to record-and-replay functionality.
+ *
  * @iommu_mr: the memory region to observe
  */
 void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr);
@@ -981,7 +1064,9 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
  * memory_region_iommu_get_attr: return an IOMMU attr if get_attr() is
  * defined on the IOMMU.
  *
- * Returns 0 if succeded, error code otherwise.
+ * Returns 0 on success, or a negative errno otherwise. In particular,
+ * -EINVAL indicates that the IOMMU does not support the requested
+ * attribute.
  *
  * @iommu_mr: the memory region
  * @attr: the requested attribute
-- 
2.17.0
