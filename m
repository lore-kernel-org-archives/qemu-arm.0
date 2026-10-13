Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F64CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:53:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6c-00057q-Lf; Tue, 13 Oct 2026 04:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY44-0000Ds-Lw
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY42-00083r-Ag
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso18554905e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880847; x=1792485647; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Vd0C4AnNkGrpnHjUGTSfRZsJ+SQNaIbir0ZKTaPfGI0=;
 b=w9JQ3lW/uF27R9wlEng8OoK9RODkxHUOIs5blINqINCNTc1x6n38AxEb0ep6koEXyH
 kle8S3O3zVqgbBzjRvVs1zK59lg8R8UtcQi3ibF1hMTfiZM6W4lA6w8/OzihgFKmvDlk
 m41CS9dDtNd8yuyDo/WfbFGBTAyZBfdBS4+fua5zTnH0tD3A16858MV3cWmgllu5dBBh
 v5qTKawRdols2xsEr1C1oW021/V9kRBr4QUc46PMyAX3Qz0JFuWe+nyefwNHyYdBD0yY
 mbsrgZc4Xw5kB0ObJegVlvxC0yB5+2P72YinD2HK7C9x4XUrfGZazGUrFIcNzj8T2UWY
 MnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880847; x=1792485647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Vd0C4AnNkGrpnHjUGTSfRZsJ+SQNaIbir0ZKTaPfGI0=;
 b=XuBHM/VRBHZxDbzbbdfgQ4Cc2N6e2twLnct5vmUlfjUXDrImQOkeUYpshDmtN3zdHH
 ZxtecL2UIxFlApyLmZ35cBTljLP7mLC9NBeAlqC2l2Thc7glfplQ6luWezIXdtLkNIHk
 DbNHf9n+OSy9+L322vOJFNIW6eNYe40CgVVC2yfNuR4NlMA02LoaWD7T54tc2GxIjki5
 6pB55fl0nWmsgqXrUwlIFlJg4LckEY6CuUrzo8sqr9kFhZGpij7NC92U388OGp1nd4Gx
 iXgiBQzS5U0Zy1IIAFGwlqToOqXFEf8UaEHEltiO/myqH0KUCBLaRpfuKHetUBIXQCJJ
 PHSw==
X-Gm-Message-State: AFq9FYJA7IiiQ55uiQhbnWa8hXu835KT4h9mf4yOFyIHeZ8FgWukRvMi
 Q2YYXaqrUN5oQpPYbzre0Czd4q/u+VdQ3kBoLH4lMYdRhgpbNMBvSVP0Z6LfrpFRKhc4YnnU0zA
 wtv//B9U=
X-Gm-Gg: AYBFou0/jGJWwIA+dt0Bk0x1fj0NQVgivmUnmmN3SeTfBLlmjlYaAP3vzwykF7+RnBw
 03G8g+K4NShEcLCAU8nk09JIxkWUsrivI9ny57SgsXBZOX3Oz4T/be68kgwQnCAtQwwLq8Mh2pO
 nwtBrD1uA7BecQp+KpUn7F8hDdxxpNcEmnGySNSzbTnNFaLR+tzpc6cUZ9OT6mPcCgnn+Xm79RW
 e9pkTykNhykGg4myld9yxmmE6CNjWTo2s4yqvjNdAYoOf0++VytsS/znGxmZGogyd5pPkqvjrYo
 H3Duwfym20wkN+EhMC157qWKmFwJYzUXxa9H45Uaqs956hoxmQ1hKKGmokYrXKcWbtfuDSB4cXM
 05c+7JyzLP4vv28pqH1XvnebEAH78LrjjzsEBfFJBuKuNJNBSKJayjF3mSOiz8NNewbN/XxpeMF
 HPDqWNlnP7RectsZCuMqdu8Q27eSfzp0CPOFG2v6Nu7Xs8a8UN+hlQapvE9fxTsWQYj7vZHEJK/
 lDfQPfV9V5/WKA6bMZc8hMudgzYC92oBfLma+HTaJX8Oz550nhtm75ktxFUlbXOeUQrnVOQvz5l
 ORQ=
X-Received: by 2002:a05:600c:3e16:b0:4a1:992f:d0e7 with SMTP id
 5b1f17b1804b1-4a1992fd259mr147432325e9.16.1791880847301; 
 Tue, 13 Oct 2026 01:40:47 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 54/86] hw/intc/arm_gicv5: IMplement IRS_VMT_CFGR
Date: Tue, 13 Oct 2026 09:39:01 +0100
Message-ID: <20261013083933.1024405-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The ISR_VMT_CFGR register is similar to the IRS_IST_CFGR register:
the guest writes to it to specify some details of the VM table before
writing to ISR_VMT_BASER.

Implement this register, including capturing the config info in it
and the ISR_VMT_BASER register into a GICv5VMTConfig struct when the
VM table becomes valid (following the same pattern we have for
IRS_IST_BASER and IRS_IST_CFGR).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 83 ++++++++++++++++++++++++++++--
 hw/intc/arm_gicv5_common.c         |  1 +
 hw/intc/trace-events               |  2 +-
 include/hw/intc/arm_gicv5.h        | 10 ++++
 include/hw/intc/arm_gicv5_common.h |  1 +
 5 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 05c6b9c57fc..e12b73dcefe 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1174,7 +1174,7 @@ static void irs_vmt_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
         return;
     }
 
-    if (FIELD_EX64(cs->irs_vmt_baser[domain], IRS_VMT_BASER, VALID)) {
+    if (s->vmt_config[domain].valid) {
         /* If VALID is set, ADDR is RO and we can only update VALID */
         bool valid = FIELD_EX64(value, IRS_VMT_BASER, VALID);
 
@@ -1184,6 +1184,7 @@ static void irs_vmt_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
         }
         cs->irs_vmt_baser[domain] = FIELD_DP64(cs->irs_vmt_baser[domain],
                                                IRS_VMT_BASER, VALID, valid);
+        s->vmt_config[domain].valid = false;
         trace_gicv5_vmt_invalid(domain_name[domain]);
         return;
     }
@@ -1191,8 +1192,60 @@ static void irs_vmt_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     cs->irs_vmt_baser[domain] = value;
 
     if (FIELD_EX64(cs->irs_vmt_baser[domain], IRS_VMT_BASER, VALID)) {
-        trace_gicv5_vmt_valid(domain_name[domain],
-                              cs->irs_vmt_baser[domain] & R_IRS_VMT_BASER_ADDR_MASK);
+        /*
+         * If the guest just set VALID then capture data into config
+         * struct and sanitize.
+         */
+        GICv5VMTConfig *cfg = &s->vmt_config[domain];
+        uint8_t vm_id_bits = FIELD_EX64(cs->irs_vmt_cfgr[domain],
+                                        IRS_VMT_CFGR, VM_ID_BITS);
+        int tableszbits;
+
+        vm_id_bits = MIN(vm_id_bits, QEMU_GICV5_VM_ID_BITS);
+
+        cfg->structure = FIELD_EX64(cs->irs_vmt_cfgr[domain],
+                                    IRS_VMT_CFGR, STRUCTURE);
+        cfg->vm_id_bits = vm_id_bits;
+        /*
+         * L2 VMTEs are always 32 bytes, and the L2 VM table is always 4KB,
+         * so 7 bits in a VM ID index the L2 table. As the L2 VMTE size
+         * and l2 index bits are constant, we don't need to precalculate
+         * them the way we do for GICv5ISTConfig.
+         */
+        cfg->base = cs->irs_vmt_baser[domain] & R_IRS_VMT_BASER_ADDR_MASK;
+        cfg->txattrs = irs_txattrs(cs, domain);
+
+        /*
+         * Enforce aligment of VM table, ignoring bits [N:0] of the address.
+         * When STRUCTURE = 0, N = VM_ID_BITS + 4
+         * When STRUCTURE = 1, N = VM_ID_BITS - 5
+         * For us, tableszbits = N + 1.
+         */
+        if (cfg->structure) {
+            /*
+             * L1 table indexed by (vm_id_bits - 7) bits, and each entry
+             * is 2^3 == 8 bytes.
+             */
+            tableszbits = vm_id_bits - 4;
+        } else {
+            /* table has 2^vm_id_bits entries of 2^5 == 32 bytes each */
+            tableszbits = vm_id_bits + 5;
+        }
+        /*
+         * tableszbits is <= 0 for the silly but valid config where
+         * STRUCTURE = 1 but VM_ID_BITS is so small that there is only
+         * one L1 table entry pointing to a single L2 table with all
+         * the VMTEs in it. In this case the R_IRS_VMT_BASER_ADDR_MASK
+         * already aligned cfg->base sufficiently.
+         */
+        if (tableszbits > 0) {
+            cfg->base &= ~MAKE_64BIT_MASK(0, tableszbits);
+        }
+
+        cfg->valid = true;
+
+        trace_gicv5_vmt_valid(domain_name[domain], cfg->base,
+                              cfg->vm_id_bits, cfg->structure);
     }
 }
 
@@ -1326,6 +1379,13 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VMT_CFGR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = cs->irs_vmt_cfgr[domain];
+        } else {
+            *data = 0;
+        }
+        return true;
     case A_IRS_SPI_STATUSR:
         /*
          * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
@@ -1436,6 +1496,18 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
         irs_vmt_baser_write(s, domain,
                             deposit64(cs->irs_vmt_baser[domain], 32, 32, data));
         return true;
+    case A_IRS_VMT_CFGR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            if (s->vmt_config[domain].valid) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "guest tried to write IRS_VMT_CFGR for %s "
+                              "config frame while IRS_VMT_BASER.VALID set\n",
+                              domain_name[domain]);
+            } else {
+                cs->irs_vmt_cfgr[domain] = data;
+            }
+        }
+        return true;
     case A_IRS_SPI_SELR:
         cs->irs_spi_selr[domain] = data;
         return true;
@@ -1702,6 +1774,11 @@ static void gicv5_reset_hold(Object *obj, ResetType type)
             g_hash_table_remove_all(s->phys_lpi_config[i].lpi_cache);
         }
     }
+
+    /* IRS_VMT_BASER and IRS_VMT_CFGR reset to 0, clear cached info */
+    for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
+        s->vmt_config[i].valid = false;
+    }
 }
 
 static void gicv5_set_idregs(GICv5Common *cs)
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 89669493b83..6a9d727bb65 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -107,6 +107,7 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
 
     if (cs->has_virt) {
         memset(cs->irs_vmt_baser, 0, sizeof(cs->irs_vmt_baser));
+        memset(cs->irs_vmt_cfgr, 0, sizeof(cs->irs_vmt_cfgr));
     }
 }
 
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 3c7619cf3cd..30e2fc42471 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -246,7 +246,7 @@ gicv5_deactivate(const char *domain, const char *type, bool virtual, uint32_t id
 gicv5_spi_state(uint32_t spi_id, bool level, bool pending, bool active) "GICv5 IRS SPI ID %u now level %d pending %d active %d"
 gicv5_irs_recalc_hppi_fail(const char *domain, uint32_t iaffid, const char *reason) "GICv5 IRS %s IAFFID %u: no HPPI: %s"
 gicv5_irs_recalc_hppi(const char *domain, uint32_t iaffid, uint32_t id, uint8_t prio) "GICv5 IRS %s IAFFID %u: new HPPI ID 0x%x prio %u"
-gicv5_vmt_valid(const char *domain, uint64_t base) "GICv5 IRS %s VM table now valid: base 0x%" PRIx64
+gicv5_vmt_valid(const char *domain, uint64_t base, uint8_t vm_id_bits, bool structure) "GICv5 IRS %s VM table now valid: base 0x%" PRIx64 " vm_id_bits %u 2-level %d"
 gicv5_vmt_invalid(const char *domain) "GICv5 IRS %s VM table no longer valid"
 
 # arm_gicv5_common.c
diff --git a/include/hw/intc/arm_gicv5.h b/include/hw/intc/arm_gicv5.h
index d763a7939c7..785c7112fd9 100644
--- a/include/hw/intc/arm_gicv5.h
+++ b/include/hw/intc/arm_gicv5.h
@@ -30,6 +30,14 @@ typedef struct GICv5ISTConfig {
     GHashTable *lpi_cache;
 } GICv5ISTConfig;
 
+typedef struct GICv5VMTConfig {
+    hwaddr base; /* Base address */
+    MemTxAttrs txattrs; /* TX attrs to use for this table */
+    uint8_t vm_id_bits; /* number of VM ID bits for the domain */
+    bool structure; /* true if using 2-level table */
+    bool valid; /* true if this table is valid and usable */
+} GICv5VMTConfig;
+
 /*
  * This class is for TCG-specific state for the GICv5.
  */
@@ -38,6 +46,8 @@ struct GICv5 {
 
     /* This is the info from IRS_IST_BASER and IRS_IST_CFGR */
     GICv5ISTConfig phys_lpi_config[NUM_GICV5_DOMAINS];
+    /* This is the info from IRS_VMT_BASER and IRS_VMT_CFGR */
+    GICv5VMTConfig vmt_config[NUM_GICV5_DOMAINS];
 
     /* We cache the HPPI for each CPU for each domain here */
     GICv5PendingIrq *hppi[NUM_GICV5_DOMAINS];
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index f134602d66e..fb88c39e8b4 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -90,6 +90,7 @@ struct GICv5Common {
     uint32_t irs_cr1[NUM_GICV5_DOMAINS];
     uint32_t irs_pe_selr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmt_baser[NUM_GICV5_DOMAINS];
+    uint32_t irs_vmt_cfgr[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.  Array
-- 
2.43.0


