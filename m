Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC20FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrE-0005KH-SS; Thu, 30 Apr 2026 05:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr5-0004yN-OL
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqr-0002cA-9v
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-449e96a8a80so37138f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541912; x=1778146712; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrG0vJAnVOwocUICQiyboyR/fgJITJNbTgSVXZ5AWGw=;
 b=qrwM2wYn8II5fGYGPiiMvobF2IJo4Jrf1X2auRs8ErOo6uRu/UxllrHGOTMBIyND68
 dkHa6PgB+DFqt2HvLcHs1DnwA4xlubHyooBp61nMHdLokPqqEqsEsZaE/vwkteTO8MLE
 q6R/L/D+/yjgD/dFqXY3Hyd7uKuFO5VPnFEZaLLuOw5/XzMWL43c209z+GIeawCgfNOa
 tKgeB2SRYiUpLwYeIqltjvIy7JV9PC3L09IqPVZ/c8KziZh79BMVG9QVrhcODQFxXCwN
 hOiObn3TjSCjFT6ncj3n8zBg0+m94bE6h0WRS+G34tJlR1gmPEVX94utN1R7jvE5loVF
 Kk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541912; x=1778146712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PrG0vJAnVOwocUICQiyboyR/fgJITJNbTgSVXZ5AWGw=;
 b=mIv5M8u7wbnymYnW71XUpJuuo3/nMPOP+3BzPznJ4IfKmcpKdC7cJW4F2w5dRI9S8I
 O3PZkRDpSUCN+r9vKiVTWbYEySvSUUde72SO5er7KBhuYDnPxdYHZpxpFf1mLpATMUB2
 TzpuzedZiumVAG9eXT0+V3MCUL+9vl24AMV2ljSsHYCGW7yzN14iiH0XxEqpM/CExyw2
 bcCIHnkM5DkKOzsLxYESxNcL3w+eAu0ofx0cHxtSvGqnpKtVZwxjeacC4nJcY4sQh48G
 ITcjcHpnk68hMtZKqwBYLtHwd1iXLecY8SnkI6FT2HxcjJWrC0BOpJIft1ZCY3UMQNSS
 j9Mw==
X-Gm-Message-State: AOJu0Yzd05/m//s5h6c/ZrmzLTe0v7si8y+Z3NLV8QsVgi8fPt7LzkQc
 fm9kQCWUY2F7bjXEesSdjrReibsyO2wxxGBtiTw0ADZuWN7SeMDvHjEsgHUVvCXa1ZY=
X-Gm-Gg: AeBDieuVLnqSjJCrvN9fdLYXKOLjOufDrmTvtyWwxClbD6yXTirBn9iq4zj+zk8PL7X
 RkN6oLlXcSTO3ybN3nTR9ACcrKEucfdOw4oDxCk/5pK2HlzqU6RV8mvFDH9l00EbXztgFJMH6fi
 db1nR2zjhrie7vqjJ1vgaik2Ch/IHmCxS7SaBZw/7FYmIilIsAr+HawwL71kGLzSol4/aMmAVYf
 MnTvhB5d9vgEhMKaeT6rNnPXt+yhmx8zMLAOZN9yyxXaat4aTsZn3Zwv6c80QNH6tr0xKytMwEU
 ZGXvcwTnMOu5D4MAJwZO7VawQh7HKITUZSaIH5CGQNI/akEMiUWils9wgYdeCekdxxy5czsSFnI
 N3+GA1xFBDP/NAl+Yjnhz+5fApRokl/rttb6cF3n4hIAC3WFid3bCD/i7qsxhLYT7pkxo+mnRfh
 QyTbTTmKlpdAp5WS7SEuSW9A/a94CjFevxZCE/CK1hMyasErUBAcbGDUy5feXWwu/0EBu6UyJ0a
 3NYr53vzQVlgIYP/NxFJskqRXg/l2qTWz5Pl4Q+2A==
X-Received: by 2002:a05:6000:4284:b0:43d:50c:6f33 with SMTP id
 ffacd0b85a97d-4493f426190mr3469419f8f.26.1777541911650; 
 Thu, 30 Apr 2026 02:38:31 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 15/25] hw/core: Implement new cpu_translate_for_debug()
Date: Thu, 30 Apr 2026 10:38:00 +0100
Message-ID: <20260430093810.2762539-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In cpu_memory_rw_debug() we need to do a virtual-to-physical address
translation for debug access.  Currently we assume that the
translation is valid for an entire guest page, but this may not be
true if the target implements some protection regions that have
sub-page granularity. (Currently the only such target is the Arm
CPUs when using an MPU, as in R-profile and M-profile.)

For TCG's emulated accesses, we handle sub-page granularity by the
CPU filling in the lg_page_size field of the CPUTLBEntryFull struct
to tell us how large the region covered by the result is.  But we
didn't extend this to the debug-access code path, with the result
that debug accesses might incorrectly fail because they are looking
at the mapping for the address rounded down to a page boundary.

Provide a cpu_translate_for_debug() function which reports to the
caller not just the physical address and attributes of the
translation but also the lg_page_size for which it is valid.  The
fallback implementation calls cpu_get_phys_addr_attrs_debug() and
assumes target-page-sized validity.

NB: the "return true on valid access, false on failure" follows
the same convention as TCGCPUOps::tlb_fill_align() (though it
is the opposite of what we use in some other places, e.g.
in target/arm's get_phys_addr_* functions).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20260417173105.1648172-15-peter.maydell@linaro.org
---
changes in v2: lg_page_size wants TARGET_PAGE_BITS, not TARGET_PAGE_SIZE
---
 hw/core/cpu-system.c             | 32 ++++++++++++++++++++++++++++++++
 include/hw/core/cpu.h            | 32 ++++++++++++++++++++++++++++++++
 include/hw/core/sysemu-cpu-ops.h | 27 +++++++++++++++++++++++++--
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 05c126ecb6..252e90c8fd 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "system/address-spaces.h"
 #include "exec/cputlb.h"
+#include "exec/target_page.h"
 #include "system/memory.h"
 #include "qemu/target-info.h"
 #include "hw/core/qdev.h"
@@ -55,6 +56,37 @@ bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
     return false;
 }
 
+bool cpu_translate_for_debug(CPUState *cpu, vaddr addr,
+                             TranslateForDebugResult *result)
+{
+    if (cpu->cc->sysemu_ops->translate_for_debug) {
+        return cpu->cc->sysemu_ops->translate_for_debug(cpu, addr, result);
+    } else {
+        /* Fallbacks for CPUs which don't implement translate_for_debug */
+        if (cpu->cc->sysemu_ops->get_phys_addr_attrs_debug) {
+            result->physaddr =
+                cpu->cc->sysemu_ops->get_phys_addr_attrs_debug(cpu, addr,
+                                                               &result->attrs);
+        } else {
+            result->physaddr
+                = cpu->cc->sysemu_ops->get_phys_addr_debug(cpu, addr);
+            result->attrs = MEMTXATTRS_UNSPECIFIED;
+        }
+        if (result->physaddr == -1) {
+            return false;
+        }
+        /* Indicate that this is a debug access. */
+        result->attrs.debug = 1;
+        /*
+         * Assume memory access permissions are valid for the whole page.
+         * Targets where this isn't true should implement the
+         * translate_for_debug method.
+         */
+        result->lg_page_size = TARGET_PAGE_BITS;
+        return true;
+    }
+}
+
 hwaddr cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 730876b7b8..6a6b78af31 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -778,6 +778,38 @@ hwaddr cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
  */
 hwaddr cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 
+/**
+ * TranslateForDebugResult: gives result of cpu_translate_for_debug()
+ *
+ * @physaddr: the physical address corresponding to the virtual address
+ * @attrs: the transaction attributes for this access
+ * @lg_page_size: log2 of the size of the aligned block of memory
+ * that this physaddr and attrs are valid for.
+ */
+typedef struct TranslateForDebugResult {
+    hwaddr physaddr;
+    MemTxAttrs attrs;
+    uint8_t lg_page_size;
+} TranslateForDebugResult;
+
+/**
+ * cpu_translate_for_debug:
+ * @cpu: The CPU use for the virtual-to-physical translation
+ * @addr: The virtual address
+ * @result: Struct filled in with results of translation
+ *
+ * Perform a virtual-to-physical address translation for debug accesses.
+ * Use it only for debugging because no protection checks are done.
+ *
+ * The address need not be page-aligned; the returned address in @result
+ * will be the physical address corresponding to that virtual address.
+ *
+ * Returns: false on translation failure; true on successful translation
+ * and fills in the fields of @result.
+ */
+bool cpu_translate_for_debug(CPUState *cpu, vaddr addr,
+                             TranslateForDebugResult *result);
+
 /** cpu_asidx_from_attrs:
  * @cpu: CPU
  * @attrs: memory transaction attributes
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index a87c55d922..8625ebb564 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -33,19 +33,42 @@ typedef struct SysemuCPUOps {
      * @get_phys_addr_debug: Callback for obtaining a physical address.
      * This must be able to handle a non-page-aligned address, and will
      * return the physical address corresponding to that address.
+     *
+     * CPUs should prefer to implement translate_for_debug instead of
+     * this (and must do so if their translations are not always valid
+     * for a complete target page or they use memory attributes).
      */
     hwaddr (*get_phys_addr_debug)(CPUState *cpu, vaddr addr);
     /**
      * @get_phys_addr_attrs_debug: Callback for obtaining a physical address
      *       and the associated memory transaction attributes to use for the
      *       access.
-     * CPUs which use memory transaction attributes should implement this
-     * instead of get_phys_addr_debug.
+     *
      * This must be able to handle a non-page-aligned address, and will
      * return the physical address corresponding to that address.
+     *
+     * CPUs should prefer to implement translate_for_debug instead of
+     * this (and must do so if their translations are not always valid
+     * for a complete target page).
      */
     hwaddr (*get_phys_addr_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
+    /**
+     * @translate_for_debug: Callback for translating a virtual address into
+     * a physical address for debug purposes.
+     * The implementation should fill in @result with the physical address,
+     * transaction attributes, and log2 of the size of the aligned block of
+     * memory that the translation is valid for.
+     * This must be able to handle a non-page-aligned address, and will
+     * return the physical address corresponding to that address.
+     * The attributes must include the debug flag being set.
+     * Returns false on translation failure; on success returns true and
+     * fills in @result.
+     *
+     * This is the preferred method to implement for new CPUs.
+     */
+    bool (*translate_for_debug)(CPUState *cpu, vaddr addr,
+                                TranslateForDebugResult *result);
     /**
      * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
      *       a memory access with the specified memory transaction attributes.
-- 
2.43.0


