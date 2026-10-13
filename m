Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4D5CC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY81-0006LZ-5t; Tue, 13 Oct 2026 04:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY49-0000LB-VH
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY47-000865-9p
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1ad2e2391so2928985e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880854; x=1792485654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=77m1KUCe87mNvexEH9gGkpi1V3Hg5U+1YnpivtmqzJw=;
 b=XV40wo7hIv41XRB+1x4Bgm5NyAiTdnoaOYt0UjZHZbXY4MvbPGwKMCLN9zAjaR/mlr
 PsS0OUdhOMZCxs7HmPc74hl5vCJYIuZWMyZ4/7Q0ZzwS+C369ChuXi+UVT+lJ0GZwxsL
 KAQDOLYXjLRgfz86vXoiI1YLhihV7vvDLQfsPz1FGYFMo1lc/nxjHoxy0KLvqB6fP3qJ
 ZUGiJhXjYzdBYAAreVnMoRS7OljV5Hx/4FLw1Mlf2c74Tn1uLMQC9qIThBsPBfapkNZc
 9ICdKM34jQ6hN+Ks9nxvGkYXA3F5qsqk2+7vyD1hoUlsg9y24jBGtRAU0VZFYP18t9Xu
 KYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880854; x=1792485654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=77m1KUCe87mNvexEH9gGkpi1V3Hg5U+1YnpivtmqzJw=;
 b=Nrv67satF9UG7gnWaL/nUz6K9rhOVWHsyfXZyUR9LwMHGnuoTkbWXY5t6AuqIEhfay
 fej90t3J8LC7Cy/LAArs7TRn3UABUus3epX0stJEHINZAvOEFnWcR0gNsGe0Jp/0d+lO
 c9vPwimqOUXccVceEA9ycUnQmh8A5rS4e91uFqpG9dgkFiiyoiG1VtI2c98lJ3mrQcNP
 F2TLuhHBbvaERSDzpvt47V2Ub1w887WNEKWO9m382xhz4mtfGxKVB6XCeYWAvBGlUeP7
 XWhx+UxV7oKQNx4CetA6esJ7aqgyh2AKX4SuMY+WCT536k6lJJvU19EbB+E+h8+A7P0S
 B93Q==
X-Gm-Message-State: AFq9FYJNboIJv5E0Nbj1Eo0ySEXHUWHVP3g12mjVE/NL6SCW0i8UM/V4
 QPO7Nq4VD+oVvgbxg7p9GbK4BJEBQ0yy/nob3+jAswtEgQLZC4p7NOpK1VWWuR+bvKNfJTHWcyQ
 TVrPYUAU=
X-Gm-Gg: AYBFou2qucDZ9Ts/aFGNuc5XJesBX+J4RYZGZK4NgbryhOr9NH3OQhViDEUldUWZqCV
 +jPD9shJzVRI+BpiUbFo/+5Nd1ddpF5nRhAJWKZ3i0h5UDT2f13rcJvR+/ePNfAbGL9787OsXvg
 eUTbEmnOJQLb5MdBeMzzd+3xvDOkEB9q3T+H0A2kMg8lGJazptTB+AeA0eDEGrMMwDam6lfyeiz
 0RzhBy8ztMgp/OzRGUuWSBln+WUREDZQorGERdopUTmwWF8pRbWy35WpdV4LR1O6aMlKhRszzXu
 G9WHCKtDV39s/CjdaebXOhT6I7F5H0xxnYtabr0ilg1NDjSP+I+2W734lZuOpWVRJwk2NvcCvmK
 QmuaveAbx2ATlLJYQ2boq/vI/0tOpHYzTk9szoLUtiLDLJ20bqAscidXS+/FwYVw8/tpVqKVLmX
 SAm3XNCU82/rCC7zeOArmJTlBqjjv6XK79LX1N6nS/HolGTij0BEhlUftWIn9AtEBs0yO0mU5yk
 0Eltrc20P+Kl161us2685p03v8LHjVVT0h10Z9PDExVXBufQ3MLtcQpq2Q4avyiMjGT40OWbjSQ
 P35Rcy5hqTprQA==
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id
 5b1f17b1804b1-4a18e4f56bcmr239711095e9.33.1791880853808; 
 Tue, 13 Oct 2026 01:40:53 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 59/86] hw/intc/arm_gicv5: Populate VM cache when VM table
 becomes valid
Date: Tue, 13 Oct 2026 09:39:06 +0100
Message-ID: <20261013083933.1024405-60-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Unlike the IST data structure, the VM table entries are allowed to be
set up in guest memory with the VALID bit set, so that the VM becomes
valid when whe VM table is made valid (e.g.  by setting up the L1 VM
table in IRS_VMT_BASER, or by making an L2 VM table valid through
IRS_VMAP_L2_VMTR).  So we need to scan through the VM table in memory
to populate the hash table when these things happen.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c              | 80 +++++++++++++++++++++++++++++++-
 include/hw/intc/arm_gicv5_regs.h |  3 ++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index b66bc5b95df..3e8b20b6e9a 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1257,6 +1257,72 @@ static void cache_vmte(GICv5Common *cs, GICv5Domain domain,
     trace_gicv5_cache_vmte(domain_name[domain], vmid);
 }
 
+static void fill_vmt_cache_from_l2_vmt(GICv5Common *cs, GICv5Domain domain,
+                                       GICv5VMTConfig *cfg, hwaddr l2_addr,
+                                       hwaddr l2_limit, uint32_t vmid)
+{
+    /*
+     * Scan an L2 VM table in guest memory, and populate our VMT
+     * cache for each entry that is marked as valid.
+     */
+    for (; l2_addr < l2_limit; l2_addr += 32, vmid += 1) {
+        uint64_t l2_vmte[L2_VMTE_WORDS];
+
+        if (!read_first_vmte_word(cs, cfg, l2_addr, l2_vmte)) {
+            goto txfail;
+        }
+        if (FIELD_EX64(l2_vmte[0], L2_VMTE_0, VALID) == 0) {
+            continue;
+        }
+        if (!read_other_vmte_words(cs, cfg, l2_addr, l2_vmte)) {
+            goto txfail;
+        }
+        cache_vmte(cs, domain, cfg, vmid, l2_vmte, l2_addr);
+    }
+
+txfail:
+    /* Reportable with EC=0x0 if sw error reporting implemented */
+    qemu_log_mask(LOG_GUEST_ERROR, "L2 VMTE read failed for VMID 0x%x at "
+                  "physical address 0x" HWADDR_FMT_plx "\n", vmid, l2_addr);
+}
+
+static void fill_vmt_cache_from_l1_vmt(GICv5Common *cs, GICv5Domain domain,
+                                       GICv5VMTConfig *cfg)
+{
+    /*
+     * Scan the whole VM table in guest memory, and populate our VMT
+     * cache for each entry that is marked as valid.
+     */
+    if (!cfg->structure) {
+        hwaddr l2_limit = cfg->base + (1ULL << cfg->vm_id_bits) * L2_VMTE_BYTES;
+
+        fill_vmt_cache_from_l2_vmt(cs, domain, cfg, cfg->base, l2_limit, 0);
+    } else {
+        uint32_t vmid = 0;
+        hwaddr l1_limit = l1_vmte_addr(cs, cfg, (1ULL << cfg->vm_id_bits));
+
+        for (hwaddr l1_addr = cfg->base;
+             l1_addr < l1_limit;
+             l1_addr += 8, vmid += VMT_L2_TABLE_SIZE / L2_VMTE_BYTES) {
+            MemTxResult res;
+            uint64_t l1_vmte;
+            hwaddr l2_addr;
+
+            l1_vmte = address_space_ldq_le(&cs->dma_as, l1_addr,
+                                           cfg->txattrs, &res);
+            if (res != MEMTX_OK) {
+                continue;
+            }
+            if (FIELD_EX64(l1_vmte, L1_VMTE, VALID) == 0) {
+                continue;
+            }
+            l2_addr = l1_vmte & R_L1_VMTE_L2_ADDR_MASK;
+            fill_vmt_cache_from_l2_vmt(cs, domain, cfg, l2_addr,
+                                       l2_addr + VMT_L2_TABLE_SIZE, vmid);
+        }
+    }
+}
+
 /* Data we need to pass through to irs_clean_lpi_cache_entry() */
 typedef struct CleanLPICacheUserData {
     GICv5Common *cs;
@@ -1461,6 +1527,9 @@ static void irs_vmt_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 
         cfg->valid = true;
 
+        /* The VMT may already have some VMTEs with VALID=1 */
+        fill_vmt_cache_from_l1_vmt(cs, domain, cfg);
+
         trace_gicv5_vmt_valid(domain_name[domain], cfg->base,
                               cfg->vm_id_bits, cfg->structure);
     }
@@ -1472,7 +1541,7 @@ static void irs_vmap_l2_vmtr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     GICv5VMTConfig *cfg = &s->vmt_config[domain];
     uint32_t vmid = FIELD_EX64(value, IRS_VMAP_L2_VMTR, VM_ID);
     bool m = FIELD_EX64(value, IRS_VMAP_L2_VMTR, M);
-    hwaddr l1_addr;
+    hwaddr l1_addr, l2_addr;
     uint64_t l1_vmte;
     MemTxResult res;
 
@@ -1514,6 +1583,15 @@ static void irs_vmap_l2_vmtr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
         goto txfail;
     }
 
+    /*
+     * The L2 VM table we just made valid can have VMTEs which
+     * already have VALID=1 set: read them into the VM cache.
+     */
+    l2_addr = l1_vmte & R_L1_VMTE_L2_ADDR_MASK;
+    fill_vmt_cache_from_l2_vmt(cs, domain, cfg, l2_addr,
+                               l2_addr + VMT_L2_TABLE_SIZE,
+                               vmid & ~MAKE_64BIT_MASK(0, VMT_L2_IDX_BITS));
+
     trace_gicv5_vmap_l2_vmtr(domain_name[domain], vmid);
 
     return;
diff --git a/include/hw/intc/arm_gicv5_regs.h b/include/hw/intc/arm_gicv5_regs.h
index 51ea451b6b6..f1ebbb6aaf8 100644
--- a/include/hw/intc/arm_gicv5_regs.h
+++ b/include/hw/intc/arm_gicv5_regs.h
@@ -296,12 +296,15 @@ FIELD(L2_VMTE_3, SPI_ID_BITS, 59, 5)
 
 /* Size of L2 VMTE in 64-bit words */
 #define L2_VMTE_WORDS 4
+/* ...and in bytes */
+#define L2_VMTE_BYTES (L2_VMTE_WORDS * sizeof(uint64_t))
 
 /*
  * L2 VMTEs are always 32 bytes, and the L2 table is always 4KB,
  * so the lower 7 bits in a VM ID index the L2 table.
  */
 #define VMT_L2_IDX_BITS 7
+#define VMT_L2_TABLE_SIZE 4096
 
 /*
  * Format used for gicv5_request_config() return value, which matches
-- 
2.43.0


