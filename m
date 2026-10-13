Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4F3CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6T-0004du-8j; Tue, 13 Oct 2026 04:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4F-0000W1-IF
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4B-00086z-23
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso24202285e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880857; x=1792485657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=JeOIoH2LSOLlBPlR5f+UjDEd3AJlW/SfZVgno9HVm5A=;
 b=CwgpavYes32Q45/mmvtVjk/KPmuv5OdKePMV37DaFYNXY59/wAgMKgpHgiBRYTnowt
 g29liBmVASCri7IyQ0qgvjaQu0RisYSI/JV/Vc+uY4qmOunvj/NXuWUnvAZhnB4PJVkK
 TohtAupg3dK1Fv40/R0recOKgTSRtHjvjGw1rB2gSzYwy4mQz7yjzMJ72RFuDBjJnRv5
 n+wRAg0HFg/905LrEC8G4tupVetPhC+rPdeuDDcs974n6f4Z1YJc/p4L3J8SXIXltjFn
 6k2J3Y/eTiwhOavv6HFgg7/R4x9vTxAj3bcpKRwOD5U2gb2PcNGgPBPgQRm5TDoqdrCb
 +upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880857; x=1792485657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=JeOIoH2LSOLlBPlR5f+UjDEd3AJlW/SfZVgno9HVm5A=;
 b=k/vWjQI9jxxn5IpLdjeVLSyB5kGFUcu2Z8mdRtlqke0roJKtnbJDE5w1hOmmrCzEz8
 2EAmrdMpfNR2JXI2hTIrlFnozSyzJprgKQ4LK8/osR8UW0INlpBgU7CkbautKa92AVVg
 tapdPdpXJAdngJCVt/mxqsBuDDhPjrAJVcB0HHnySEcLKxdT4A/CZNQByDMnutl2iWWY
 RqF5ncBb8oEfqG05Bt+tlv7wLKNYMvpSH/8j9D8HPdlC0myfnLc+hA+91PiR3R9vZOIN
 +4IMhF8kdJPVixxdxwrFhKBreycJS1O5Xk8F6gx/bFgtt7+7aJMXp/95QvzXrmyqTj9p
 AF0Q==
X-Gm-Message-State: AFq9FYIJoD6A+BZn6vphy3JQaCms49PLK/O9MDmenMYDfKgkW0kk4HM1
 RBGurE01WPN720IWngz7r2aJIkNMiRGQWtVbT0qRHoBcnSzSDAuSLhM09nH31DcYC7NGT5egmI6
 Au7WvL5o=
X-Gm-Gg: AYBFou3AYaY+wx/G4WnKEeTvB654DhTLST8ug9tbQY9U7u/c/npGwgZ+xdSMaWdH/Tu
 q4e1KsBQf6X7njnnOfgOC+NHtxAAynLRGBysAfU9OlbvuryXLxsEnj+Jq+RevhkR1VPtbPnSc1b
 6s8vRAW0xqhFWq8bAyetmyVmxT8K3EKy0/vZjqeDH2HyDr1iV8yH3d2Nsul/Ce1I1fDE0p6HInq
 kmNHjeXHqribPoslKP3aUsDXxBRSc3FvAEr4xotw6h9H7ZGMpp389qrS7nFUrXmzBqkRwBB0UDE
 sw/pK6axdgt+6AgI4zXnQonEWZDV/5F8/8vRRdtzT467ucN7bgUzNTJAnjpefWGiOYW4RINzE4x
 inKbjyG5I1yZibM/Pl9KS8QKX9HoXqMzt9Z0gxTjC1gFN+JfAsifW/Vvnt8uF7bUG1VO0pBnCEp
 IHz66h/s9sRxmgn359dJYcgQPOKVa3CxJ0VS+jAhS0qItijMFdR/Ph47JKu18bTU8P9srC14Lss
 HJ0+Jx3fs5m5jpHjNyUIae5Ci/yFfQo2y4nNL/Bh3qYzaAiCbUScQC3mwY9Ih7Lk6DkrIclLMvV
 9rI=
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id
 5b1f17b1804b1-4a18e4ca1dcmr216950045e9.18.1791880856733; 
 Tue, 13 Oct 2026 01:40:56 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 62/86] hw/intc/arm_gicv5: Implement IRS_VMAP_L2_VISTR
Date: Tue, 13 Oct 2026 09:39:09 +0100
Message-ID: <20261013083933.1024405-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

The IRS_VMAP_L2_VISTR allows the guest to make an L2 entry in the
VM's VLPI or VSPI IST valid; it is the equivalent of what
IRS_MAP_L2_ISTR does for the physical LPI IST.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 76 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv5_common.c         |  1 +
 include/hw/intc/arm_gicv5_common.h |  1 +
 3 files changed, 78 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 3fac52012b1..4f74236c62b 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1792,6 +1792,46 @@ txfail:
                   vmid, vmte->vmte_addr);
 }
 
+static void irs_vmap_l2_vistr_write(GICv5 *s, GICv5Domain domain,
+                                    uint64_t value)
+{
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    GICv5VMTConfig *cfg = &s->vmt_config[domain];
+    uint32_t vmid = FIELD_EX64(value, IRS_VMAP_L2_VISTR, VM_ID);
+    bool m = FIELD_EX64(value,  IRS_VMAP_L2_VISTR, M);
+    uint32_t intid = FIELD_EX64(value,  IRS_VMAP_L2_VISTR, ID);
+    GICv5IntType type = FIELD_EX64(value, IRS_VMAP_VISTR, TYPE);
+    VMTE *vmte;
+    GICv5ISTConfig *vist;
+
+    if (!gicv5_domain_has_virt(cs, domain) || !cfg->valid) {
+        /* Whole register RAZ/WI if no virt or no VM table */
+        return;
+    }
+
+    /* M bit is WO/UNKNOWN; write the other fields */
+    cs->irs_vmap_l2_vistr[domain] = value & ~R_IRS_VMAP_L2_VISTR_M_MASK;
+
+    /*
+     * M = 0 and bad VMID must be ignored; invalid TYPE is
+     * UNPREDICTABLE, and we choose to ignore
+     */
+    if (!m || vmid >= (1 << cfg->vm_id_bits) ||
+        (type != GICV5_LPI && type != GICV5_SPI)) {
+        return;
+    }
+
+    vmte = g_hash_table_lookup(cfg->vm_cache, GINT_TO_POINTER(vmid));
+    if (!vmte) {
+        /* VM is not valid */
+        return;
+    }
+
+    vist = type == GICV5_LPI ? &vmte->lpi_ist : &vmte->spi_ist;
+
+    map_l2_istr(cs, vist, intid);
+}
+
 static void spi_sample(GICv5SPIState *spi)
 {
     /*
@@ -1979,6 +2019,22 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VMAP_L2_VISTR:
+        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
+            *data = extract64(cs->irs_vmap_l2_vistr[domain], 0, 32);
+        } else {
+            /* RAZ/WI if no virt or no VM table */
+            *data = 0;
+        }
+        return true;
+    case A_IRS_VMAP_L2_VISTR + 4:
+        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
+            *data = extract64(cs->irs_vmap_l2_vistr[domain], 32, 32);
+        } else {
+            /* RAZ/WI if no virt or no VM table */
+            *data = 0;
+        }
+        return true;
     case A_IRS_SPI_STATUSR:
         /*
          * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
@@ -2128,6 +2184,15 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
                              deposit64(cs->irs_vmap_vistr[domain],
                                        32, 32, data));
         return true;
+    case A_IRS_VMAP_L2_VISTR:
+        irs_vmap_l2_vistr_write(s, domain,
+                                deposit64(cs->irs_vmap_vistr[domain], 0, 32, data));
+        return true;
+    case A_IRS_VMAP_L2_VISTR + 4:
+        irs_vmap_l2_vistr_write(s, domain,
+                                deposit64(cs->irs_vmap_vistr[domain],
+                                          32, 32, data));
+        return true;
     case A_IRS_SPI_SELR:
         cs->irs_spi_selr[domain] = data;
         return true;
@@ -2244,6 +2309,14 @@ static bool config_readll(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VMAP_L2_VISTR:
+        if (gicv5_domain_has_virt(cs, domain) && s->vmt_config[domain].valid) {
+            *data = cs->irs_vmap_l2_vistr[domain];
+        } else {
+            /* RAZ/WI if no virt or no VM table */
+            *data = 0;
+        }
+        return true;
     }
 
     return false;
@@ -2268,6 +2341,9 @@ static bool config_writell(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_VMAP_VISTR:
         irs_vmap_vistr_write(s, domain, data);
         return true;
+    case A_IRS_VMAP_L2_VISTR:
+        irs_vmap_l2_vistr_write(s, domain, data);
+        return true;
     }
 
     return false;
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 181171e000b..b52dba3d3b4 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -111,6 +111,7 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
         memset(cs->irs_vmap_l2_vmtr, 0, sizeof(cs->irs_vmap_l2_vmtr));
         memset(cs->irs_vmap_vmr, 0, sizeof(cs->irs_vmap_vmr));
         memset(cs->irs_vmap_vistr, 0, sizeof(cs->irs_vmap_vistr));
+        memset(cs->irs_vmap_l2_vistr, 0, sizeof(cs->irs_vmap_l2_vistr));
     }
 }
 
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 19e13693de9..8103f14ba44 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -94,6 +94,7 @@ struct GICv5Common {
     uint64_t irs_vmap_l2_vmtr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmap_vmr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmap_vistr[NUM_GICV5_DOMAINS];
+    uint64_t irs_vmap_l2_vistr[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.  Array
-- 
2.43.0


