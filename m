Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp871685wrm;
        Fri, 11 Oct 2019 06:59:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxK1+aEEBsNGgXmf3JYx/SBYJsonoU9TywiEbaL5qO7ugxVZ3QGTV4IkDD3hfhEmWw1XJS
X-Received: by 2002:a37:aaca:: with SMTP id t193mr15864619qke.66.1570802358088;
        Fri, 11 Oct 2019 06:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802358; cv=none;
        d=google.com; s=arc-20160816;
        b=lrMVm3DkcRJ+2CnnAin32nabE6CgXR8HzD/vVDXPHz76vluUeTObSQrmEbCrWWdhJ9
         CfH5eAg66sfjcSLSVEiYzWN9hZsMyOcDqtKM0I+aG/82t9uE294/08Pl9BpytVGZu2pL
         iTwXVqdqDIV1NzMqtn+KSn+Sy2Uqdvspf0CWpzTK/YItmcGtUwatDQvAcTNzHbRrZHwo
         HYBPJZVfzwDSSQRWNo7ouO1pVjehUVl2zuCSAx/eZVVZjnPcD38NwgLR0GOY40OstnZf
         h4veDoQrsOw57fHS4YPXaL+jh/r4cGEGQjNAgaxgPIaddpVfRv96K2T0sF+kxEIrLKmm
         ArZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=0RZ0xvYp1EHUhrR/jUU3w+01QyCWCYmAXLZX7xD3PR8=;
        b=HCmsYCic31Ua7jYVmKwx8lalpQg2wYDOqjyVUnlIOADoggwc1nivDwYbliZ9LrUidb
         ycMf/LJ04nbo77thNNAF0yJOYo4BwrA34tA5ssN3DNRQXleSIdiFSl5M2ZG3A4oriTFr
         KSNqoW1lrAHf85Ca4kCtpJsgc1ZAMXV4ovtawvflJSaMXWm4VXBYCA/G8Z6tb9llg7XC
         9eNQSkUEgS1S4Ggpc3OllLWtrB2iUAu+Wb951Jcpe7Inu7TW1Kneb2PgPXuMJwtro95M
         d4OFvC7AtRNmAKbBL1HYVXxQgafRjX9SvfgHCWxLOtbPco8jUADO9eUlG81kJOgn/Gvn
         LRNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uCEGC8kN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si8846310qvg.72.2019.10.11.06.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uCEGC8kN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvRt-0000Qr-0G
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJR-0006C9-IM
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJP-0004Gs-LN
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:33 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:43497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJP-0004G7-Gz
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:31 -0400
Received: by mail-yb1-xb44.google.com with SMTP id y204so3107288yby.10
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0RZ0xvYp1EHUhrR/jUU3w+01QyCWCYmAXLZX7xD3PR8=;
 b=uCEGC8kNa6GGYVrOD8nReHdJ3sk8I8nn+XU4yk6RFvoBXP+Pl+D084SCX2vV+BRJCV
 zxigj8xIMWW+5jlDnRAK/TI/2E8izDzFKIZowcLmWzRksk+bCBjWoY+LCq8aipZU22oP
 GsApGuzwZc+roaj2Cuk38hin78oVXv1x1dBfl4dwvNL4/egIBGfVdrwc0ixQcoOoGeeK
 ALsww59uoz73UMybGM+IDI3EQmWL2iqUNkj+ka6pMIMzujzGjvNG+JBKDRFX1pQiZ66J
 2jCcecy2SJVip86fz/t5y+Kw8hHvYN+46a3au5hKKHcLIYQ90ttwCADoGl4B/388yv7t
 XqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0RZ0xvYp1EHUhrR/jUU3w+01QyCWCYmAXLZX7xD3PR8=;
 b=CxP7r5mYZK4IXwLR3zgS02U1rBi2I4dxnW7s9legZvRBs546RjhD6LIc/ktmtBmLhG
 5dQAfw89YNLhp2ODo4sdcWtT0dIfke/wNOx4tuOSElTtFoA0KNdjcaGwE4BXc3YVMwl5
 083fIOBLwVFOBoW/rO36VDWPG2+4fOi3D94gF1IC1+sEubuQ5oLuILBoGWJKz43CxXn1
 c8s30MqB1TLiaxRMrse6fZ1O/G7lT+Z7fg/xFlFRfU91UQc39N0KKH5MFst5TEBeckg6
 V15wV6Vl9y7wx6zHcF1LvKOhjg3HWPI2IKup5UlTCZ9AwYPYmfWNNvxaM112d8qxV1gF
 ICXg==
X-Gm-Message-State: APjAAAUuqfepu3TtuEDurAAe6kehJWvJ2303yUo3FAsQsqNGIv+zAO0f
 oAz1qs/CIpAkClyftM7wr8u/qp2Youk=
X-Received: by 2002:a25:acc7:: with SMTP id x7mr10338104ybd.305.1570801830716; 
 Fri, 11 Oct 2019 06:50:30 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/22] target/arm: Add allocation tag storage for system
 mode
Date: Fri, 11 Oct 2019 09:47:44 -0400
Message-Id: <20191011134744.2477-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vhWhZ4hdLkzB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index e8d8a6bedb..657383ba0e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -28,8 +28,69 @@
 static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
                                    bool write, uintptr_t ra)
 {
+#ifdef CONFIG_USER_ONLY
     /* Tag storage not implemented.  */
     return NULL;
+#else
+    CPUState *cs = env_cpu(env);
+    uintptr_t index;
+    int mmu_idx;
+    CPUTLBEntry *entry;
+    CPUIOTLBEntry *iotlbentry;
+    MemoryRegionSection *section;
+    hwaddr physaddr, tag_physaddr;
+
+    /*
+     * Find the TLB entry for this access.
+     * As a side effect, this also raises an exception for invalid access.
+     *
+     * TODO: Perhaps there should be a cputlb helper that returns a
+     * matching tlb entry + iotlb entry.  That would also be able to
+     * make use of the victim tlb cache, which is currently private.
+     */
+    mmu_idx = cpu_mmu_index(env, false);
+    index = tlb_index(env, mmu_idx, ptr);
+    entry = tlb_entry(env, mmu_idx, ptr);
+    if (!tlb_hit(write ? tlb_addr_write(entry) : entry->addr_read, ptr)) {
+        bool ok = arm_cpu_tlb_fill(cs, ptr, 16,
+                                   write ? MMU_DATA_STORE : MMU_DATA_LOAD,
+                                   mmu_idx, false, ra);
+        assert(ok);
+        index = tlb_index(env, mmu_idx, ptr);
+        entry = tlb_entry(env, mmu_idx, ptr);
+    }
+
+    /* If the virtual page MemAttr != Tagged, nothing to do.  */
+    iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
+    if (!iotlbentry->attrs.target_tlb_bit1) {
+        return NULL;
+    }
+
+    /*
+     * Find the physical address for the virtual access.
+     *
+     * TODO: It should be possible to have the tag mmu_idx map
+     * from main memory ram_addr to tag memory host address.
+     * that would allow this lookup step to be cached as well.
+     */
+    section = iotlb_to_section(cs, iotlbentry->addr, iotlbentry->attrs);
+    physaddr = ((iotlbentry->addr & TARGET_PAGE_MASK) + ptr
+                + section->offset_within_address_space
+                - section->offset_within_region);
+
+    /* Convert to the physical address in tag space.  */
+    tag_physaddr = physaddr >> (LOG2_TAG_GRANULE + 1);
+
+    /* Choose the tlb index to use for the tag physical access.  */
+    mmu_idx = iotlbentry->attrs.secure ? ARMMMUIdx_TagS : ARMMMUIdx_TagNS;
+    mmu_idx = arm_to_core_mmu_idx(mmu_idx);
+
+    /*
+     * FIXME: Get access length and type so that we can use
+     * probe_access, so that pages are marked dirty for migration.
+     */
+    return tlb_vaddr_to_host(env, tag_physaddr, MMU_DATA_LOAD, mmu_idx);
+#endif
 }
 
 static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
-- 
2.17.1

