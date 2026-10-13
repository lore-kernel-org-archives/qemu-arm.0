Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7F4CC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:47:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6C-0003jX-CZ; Tue, 13 Oct 2026 04:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4F-0000WG-LD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4C-00088H-GN
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so24335195e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880859; x=1792485659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Hv2b30aoeb/vVaLxh8kGllfwSe/dat19ne3H7Em9MoA=;
 b=W2hrRBsZpmAyZ2b1z+XPfOqQFt8HdWQt6tu357k6OdNFMXkBa/HFwxYbwVv1v5cu4a
 bdTZt6nH2/wa+o/SR0YhQ90QHSakyF11FTq2td21p9CatRNPfb29dEm1cFOKm5SuwxsD
 30BW7GfEasA51i6B44MSyztwmClAdrL2hAVulqx3Rcc6Gj85uodvcO1Qb8Hh9rs4r84z
 1JREZrRLPzjeDSSNE1ON3o2hDFyWTdx0jKq0/I9eQtaELDzWPHH2PpE4vVWLG4Rhu8Eo
 eD3xjcREnDO7Xj+TmTPvIsD+OZUqA9tuJTSxnNgzzXHpBiyVugLB5nfev4QXZAcnjTuP
 OYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880859; x=1792485659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Hv2b30aoeb/vVaLxh8kGllfwSe/dat19ne3H7Em9MoA=;
 b=tp1L+qSqeeTRBcTUUNlWWMtseg6mvcBEAsX+AKamKUnKHSvuJVIwxJEUNY8SId/q3j
 4aooFLIRULP/6KKz2Uq9a3pwE9UmFNmb5aNz1fXO00mqSXz3vSvfgPqlC5lywZJkm0oJ
 5X+/ZGARQyWMkDCGyXjCqeH5PYEqC1BAQ1ecKGshWPjBKDwvinNl2+Hc6eVO+jJ9hqZj
 i7jtPLb3bhkAJz4rtqcwG5i5gM6v3MRNIOseJceHDtPSDA+QHTww/NElLXfTbZJ9s+yP
 0RRVOo9t1UrGqCyNai/DdwJ7W7qUzq8EitVND6cPJQt6SEq2VfZ97JGC1Jg3Co7zFmLh
 vUCQ==
X-Gm-Message-State: AFq9FYJjs7dGnOkOy14Il74Ctb84p6N3wx8a0XiWcx+kb5dEhDptGcWP
 XeMDSsqSRoyIIYCPDDQ5b0q1NdkAVUwbuF9t+Kj3/p0Qr8wSK96Q31Nh1PbshLXaQH9mFYHBJcM
 MwomWsbU=
X-Gm-Gg: AYBFou12pG98dxiIbP5xPt5ZGO/RBnBhonRI1TLBuKqNRqzCtECs1AWvoh83IJYPxm1
 jduGFxFuVCBkZZZUi7Ur4bKIwsUvPmdUpU7K3yKeOYWf04WNDGK1iqNMqXUR7Mh8q0gFWNZgckg
 O8svwOWhdv5Sto2/R9WyJnmTXtqaeOIKl6NAKSECXCzFMzhUAyod+8+zabFdpT2XDsvWjp/glfB
 ET2KwwYuMqfMsOhtttbB9GAqx1VIh3sqz3ayB2qJYV6wurQ87xX0PZlaaah47lOz0tpeJahrvRe
 WdTIs2N7jPYN7b+qdPzs9vGkoL8+FXI7UZwoKrz2WFFfi/xWHH6y9+T3Q5WKlq4yGycRCv3i0/Z
 62S8fX7p/Skb0D9HdIMmublPg0Sp7eJmjCfTbXIoG4ckL5MWPVlmf/3f7OxWGi50ei0LJ+vz37q
 2+bWBok0wMIffI5/tkjD++Pd+DO/Lk+vkT3L4jX3jJriD6O/IWUKc42H3mmjFVu5BZQTUul7oPe
 l/4psQhI3v45DqVdBrzO0FX2GlvQBHWwcfLXICZh4dkjUYG0kaa+h3mDdFLqEv7UpqaQMHzJwGd
 sps=
X-Received: by 2002:a05:600c:6097:b0:49f:bd3c:bc24 with SMTP id
 5b1f17b1804b1-4a18e4b8885mr219396175e9.31.1791880858916; 
 Tue, 13 Oct 2026 01:40:58 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 64/86] hw/intc/arm_gicv5: Implement IRS_VMAP_VPER
Date: Tue, 13 Oct 2026 09:39:11 +0100
Message-ID: <20261013083933.1024405-65-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The IRS_VMAP_VPER allows software to mark a VPE as valid if
it was not originally valid when the VM was created. For us
this means updating the valid bit in our cached VPE struct
and in the VPE table in guest memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 94 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv5_common.c         |  1 +
 hw/intc/trace-events               |  1 +
 include/hw/intc/arm_gicv5_common.h |  1 +
 4 files changed, 97 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index c3d824f045b..e762c058a98 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1890,6 +1890,65 @@ static void irs_vmap_l2_vistr_write(GICv5 *s, GICv5Domain domain,
     map_l2_istr(cs, vist, intid);
 }
 
+static void irs_vmap_vper_write(GICv5 *s, GICv5Domain domain, uint64_t value)
+{
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    GICv5VMTConfig *cfg = &s->vmt_config[domain];
+    bool m = FIELD_EX64(value, IRS_VMAP_VPER, M);
+    uint32_t vmid = FIELD_EX64(value, IRS_VMAP_VPER, VM_ID);
+    uint32_t vpeid = FIELD_EX64(value, IRS_VMAP_VPER, VPE_ID);
+    VMTE *vmte;
+    hwaddr vpete_addr;
+    MemTxResult res;
+    uint64_t vpete;
+
+    if (!gicv5_domain_has_virt(cs, domain) || !cfg->valid) {
+        /* Whole register RAZ/WI if no virt or no VM table */
+        return;
+    }
+
+    /* M bit is WO/UNKNOWN; write the other fields */
+    cs->irs_vmap_vper[domain] = value & ~R_IRS_VMAP_VPER_M_MASK;
+
+    /* M = 0 and bad VMID must be ignored */
+    if (!m || vmid >= (1 << cfg->vm_id_bits)) {
+        return;
+    }
+
+    vmte = g_hash_table_lookup(cfg->vm_cache, GINT_TO_POINTER(vmid));
+    if (!vmte) {
+        /* VM is not valid */
+        return;
+    }
+
+    if (vpeid >= (1 << vmte->vpe_id_bits) || vmte->vpet[vpeid].valid) {
+        /* Invalid VPE ID, VPE already valid */
+        return;
+    }
+
+    vpete_addr = vmte->vpet_addr + vpeid * 8;
+    vpete = address_space_ldq_le(&cs->dma_as, vpete_addr, cfg->txattrs, &res);
+    if (res != MEMTX_OK) {
+        goto txfail;
+    }
+    vpete = FIELD_DP64(vpete, VPETE, VALID, 1);
+    address_space_stq_le(&cs->dma_as, vpete_addr, vpete, cfg->txattrs, &res);
+    if (res != MEMTX_OK) {
+        goto txfail;
+    }
+
+    init_vpe_from_vpete(&vmte->vpet[vpeid], vmte, vpete);
+    trace_gicv5_irs_vmap_vper_write(domain_name[domain], vmte->vmid, vpeid);
+
+    return;
+
+txfail:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "VPETE update failed for VMID 0x%x VPEID 0x%x at "
+                  "physical address 0x" HWADDR_FMT_plx "\n",
+                  vmid, vpeid, vpete_addr);
+}
+
 static void spi_sample(GICv5SPIState *spi)
 {
     /*
@@ -2093,6 +2152,22 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VMAP_VPER:
+        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
+            *data = extract64(cs->irs_vmap_vper[domain], 0, 32);
+        } else {
+            /* RAZ/WI if no virt or no VM table */
+            *data = 0;
+        }
+        return true;
+    case A_IRS_VMAP_VPER + 4:
+        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
+            *data = extract64(cs->irs_vmap_vper[domain], 32, 32);
+        } else {
+            /* RAZ/WI if no virt or no VM table */
+            *data = 0;
+        }
+        return true;
     case A_IRS_SPI_STATUSR:
         /*
          * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
@@ -2251,6 +2326,14 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
                                 deposit64(cs->irs_vmap_vistr[domain],
                                           32, 32, data));
         return true;
+    case A_IRS_VMAP_VPER:
+        irs_vmap_vper_write(s, domain,
+                            deposit64(cs->irs_vmap_vper[domain], 0, 32, data));
+        return true;
+    case A_IRS_VMAP_VPER + 4:
+        irs_vmap_vper_write(s, domain,
+                            deposit64(cs->irs_vmap_vper[domain], 32, 32, data));
+        return true;
     case A_IRS_SPI_SELR:
         cs->irs_spi_selr[domain] = data;
         return true;
@@ -2375,6 +2458,14 @@ static bool config_readll(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VMAP_VPER:
+        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
+            *data = cs->irs_vmap_vper[domain];
+        } else {
+            /* RAZ/WI if no virt or no VM table */
+            *data = 0;
+        }
+        return true;
     }
 
     return false;
@@ -2402,6 +2493,9 @@ static bool config_writell(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_VMAP_L2_VISTR:
         irs_vmap_l2_vistr_write(s, domain, data);
         return true;
+    case A_IRS_VMAP_VPER:
+        irs_vmap_vper_write(s, domain, data);
+        return true;
     }
 
     return false;
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index b52dba3d3b4..6e0e2295fde 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -112,6 +112,7 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
         memset(cs->irs_vmap_vmr, 0, sizeof(cs->irs_vmap_vmr));
         memset(cs->irs_vmap_vistr, 0, sizeof(cs->irs_vmap_vistr));
         memset(cs->irs_vmap_l2_vistr, 0, sizeof(cs->irs_vmap_l2_vistr));
+        memset(cs->irs_vmap_vper, 0, sizeof(cs->irs_vmap_vper));
     }
 }
 
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 9057f83af57..79381c109b7 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -252,6 +252,7 @@ gicv5_vmap_l2_vmtr(const char *domain, uint32_t vmid) "GICv5 IRS %s VM ID %u now
 gicv5_cache_vmte(const char *domain, uint32_t vmid) "GICv5 IRS %s VM ID %u valid and cached"
 gicv5_irs_vmap_vistr_write(const char *domain, uint32_t vmid, const char *type, const char *what) "GICv5 IRS %s VM ID %u %s IST now %s"
 gicv5_initialize_vpet(const char *domain, uint32_t vmid, uint32_t vpeid, bool valid) "GICv5 IRS %s VM ID %u VPE %u starts as valid %d"
+gicv5_irs_vmap_vper_write(const char *domain, uint32_t vmid, uint32_t vpeid) "GICv5 IRS %s VM ID %u VPE %u now made valid"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 8103f14ba44..c8574f66a63 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -95,6 +95,7 @@ struct GICv5Common {
     uint64_t irs_vmap_vmr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmap_vistr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmap_l2_vistr[NUM_GICV5_DOMAINS];
+    uint64_t irs_vmap_vper[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.  Array
-- 
2.43.0


