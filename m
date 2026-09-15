Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AA0C982C7
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6VbH-0007ja-4T; Tue, 15 Sep 2026 12:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbE-0007hh-AL
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:36 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbC-0003RU-AC
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:36 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a9ab2a135dso4817808a12.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789488093; x=1790092893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U8J2Zk/8aJ3Q8e7LSaQ8fkxfDx2J3KURCgeZ1eKioqc=;
 b=UDZnB7hmYw7h2eYNzzMRfMtTYJPNrnsJ0xVD6tTp7H/BrN71tmH0t+4j8VkqTFSPvY
 0J4TV5vlWYsZLM7B4x0lotGvDNS6TJEcSU4LRdia+7vN6hRKD7T9UOZC6yjh9sptI+0q
 X4teNXlt0+bP01CZm7kGFRpi0t7T4ejP2reH7J7l5mb4xeO241qdFoZ8freVNYngeB6F
 iIB9H52OF7+BtAp7vnme3ayoNWV3xyJLEZv/tCDsH64H3kaw02vm4VKl6IHn5cXrtr1Z
 7V4IeHpqtqQuuyfBfngNTY3I9uMYxVPa5K/ZPEFfk7nBZ2GdvuHehjtkMM7q7ISvFhhx
 Bopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789488093; x=1790092893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=U8J2Zk/8aJ3Q8e7LSaQ8fkxfDx2J3KURCgeZ1eKioqc=;
 b=WAngTN72tD4HKmnWV9QSVaDBjCAOZRPH3ynq8jeWQDujakD1D23yxWyJPbHguEmBqz
 P71BRzKuK/RxVT2LCTVcAMIRfc+4EtD+aNzQjFHsMTid2W75m53Pa7tTknUo6WXCOGbO
 o5r9g2n/WrzOirDM2pB9/XUmTyFbFiVsLtbARDAK03SJj1RcCWRQl5Qu6FUnr1zstirp
 4f6Rn/cJu7QF6mctD/85rgszFGEN67taPE/h2o0WfesNP9SCDd3UlrtW4myuD7XnqXtI
 gd8zGrS3xS4q5Q/0+QMQlmCr33eaUT7graIdu1hatEPdCK2OeMQyYs4DTHe++4BHQLzM
 o87Q==
X-Gm-Message-State: AFuF++lJh29iFg9az2BZQGOEZoZVEws/rdz8ITSg6i+Nntta6CyqpYES
 FOHaA5jLTX5pNySTrXzKWs4l5kEn10KXkTptW2SBTKw7uyc9MjqX9A5K
X-Gm-Gg: AYBFou3Pm12gX3sequeMgOs9YLt9bz/LpbrToqgq1wdGJyz2BZen6PpTvl/rEGXsEGY
 kA8pcdww+txOQfH0fsvI41r4tQzXOYZggHA49/kvDIxjj/Ey9o0khHpL1orZdlGY5uj2ug7qm63
 OSYla6SSOsTT6pq3A5wLIxkpPa4GLFwqvZCkRLN4EhAO0FvuwAwjCpecIxSgen8mgItpsQ2ZYH0
 PbcIvteQYI5Bq14LVmjgmumgrthQ8bszQNZaEOp+jOFiz8FKTE+jX6haQ10ASd6w8Xg7n3pQbp5
 7ZfXTNjbYZ+th0feSoV52yFyKOsuJmuQtAzGquEyifpmIAKo7W11My8gJr6i77MLwMdZtVuZ/db
 BmIO6aPDYdkq+8EV8bA6WX+2CiN7K0fY/QUXboUQ4/WbwHsH2AARUdgUiTlA3XVuLH+4N9i80mT
 IEKnariSba6LglmZ3RcLAgkgH3+CJHAv/wB3coxRd01R3lFtBy8Y5LxxbgBk4tnm1j41L6/5qFf
 5s7paAGE6E9unJufJyeDzYIoYp5raeMTUZ7H0FDErwVrQ==
X-Received: by 2002:a17:907:1b24:b0:c26:1649:47aa with SMTP id
 a640c23a62f3a-c29b86f5e7dmr528260466b.32.1789488092806; 
 Tue, 15 Sep 2026 09:01:32 -0700 (PDT)
Received: from thinkpad-t470s.. (83-131-196-251.adsl.net.t-com.hr.
 [83.131.196.251]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-c29ddd86344sm3235866b.0.2026.09.15.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 09:01:32 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com,
 edgar.iglesias@gmail.com, berrange@redhat.com, eugene@nuvacore.ai,
 Ruslan_Ruslichenko@epam.com, takahiro.nakata.wr@renesas.com,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 12/20] system/physmem: Add ats_do_translate helper
Date: Tue, 15 Sep 2026 18:00:36 +0200
Message-ID: <20260915160044.345788-13-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160044.345788-1-ruslichenko.r@gmail.com>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add 'ats_do_translate' method to enable manual IOMMU address
translation.

This allows the Remote Port subsystem to resolve guest virtual
addresses to physical addresses by querying the QEMU IOMMU
translation pipeline. This is required for the Remote Port
subsystem to support translation  requests from external masters
in a co-simulation environment.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/system/memory.h |  8 +++++++
 system/physmem.c        | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/system/memory.h b/include/system/memory.h
index a7e03fc3e7..2032d3028d 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2583,6 +2583,14 @@ static inline MemoryRegion *address_space_translate(AddressSpace *as,
                               addr, xlat, len, is_write, attrs);
 }
 
+MemoryRegion *ats_do_translate(AddressSpace *as,
+    hwaddr addr,
+    hwaddr *xlat,
+    hwaddr *plen_out,
+    AddressSpace **target_as,
+    int *prot,
+    MemTxAttrs attrs);
+
 /* address_space_access_valid: check for validity of accessing an address
  * space range
  *
diff --git a/system/physmem.c b/system/physmem.c
index a4a6a4710c..1acda22ede 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -525,6 +525,59 @@ static MemoryRegionSection flatview_do_translate(FlatView *fv,
     return *section;
 }
 
+/* This function is called from RCU critical section */
+MemoryRegion *ats_do_translate(AddressSpace *as,
+                               hwaddr addr,
+                               hwaddr *xlat,
+                               hwaddr *plen_out,
+                               AddressSpace **target_as,
+                               int *prot,
+                               MemTxAttrs attrs)
+{
+    MemoryRegionSection *section;
+    IOMMUMemoryRegion *iommu_mr;
+    hwaddr plen = (hwaddr)(-1);
+    FlatView *fv = address_space_to_flatview(as);
+    IOMMUMemoryRegionClass *imrc;
+    IOMMUTLBEntry iotlb;
+    int iommu_idx = 0;
+
+    if (!plen_out) {
+        plen_out = &plen;
+    }
+
+    /* This can be MMIO, so setup MMIO bit. */
+    section = address_space_translate_internal(
+            flatview_to_dispatch(fv), addr, xlat,
+            plen_out, true);
+
+    /* Illegal translation */
+    if (section->mr == &io_mem_unassigned) {
+        return NULL;
+    }
+
+    iommu_mr = memory_region_get_iommu(section->mr);
+    if (!iommu_mr) {
+        return NULL;
+    }
+
+    imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
+
+    if (imrc->attrs_to_index) {
+        iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
+    }
+
+    iotlb = imrc->translate(iommu_mr, addr, IOMMU_RO, iommu_idx);
+
+    *xlat = ((iotlb.translated_addr & ~iotlb.addr_mask)
+            | (addr & iotlb.addr_mask));
+    *plen_out = MIN(*plen_out, (addr | iotlb.addr_mask) - addr + 1);
+    *prot = iotlb.perm;
+    *target_as = iotlb.target_as;
+
+    return section->mr;
+}
+
 /* Called from RCU critical section */
 IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
                                             bool is_write, MemTxAttrs attrs)
-- 
2.43.0


