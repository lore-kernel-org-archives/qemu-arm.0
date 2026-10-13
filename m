Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519F8CC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY8J-0006yA-FH; Tue, 13 Oct 2026 04:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4H-0000Y5-51
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:05 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4D-00089B-Gh
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so32214935e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880860; x=1792485660; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ygpZg/mvzQQKJ/1xoj7eG0F4DZfu+BwkAHYN9lMKm6g=;
 b=pJTnhtmvffTNznFDfwhVZl4V48KTSZhimQECNxhBJbCnVlP1WJkIPLHDbx3nbnIwsp
 nub3VIau2sNsZ0/2Tere0HFCQJTSY7VNl6654yqSaqq+4LkAxi0eS/1IWMCWR/srBNKU
 EN9R0iUXzoKDHAAw3y/Iog6RN9QaSgwiZ9Quzvr2WRGSRrPOolgwjrR7vlh4I5Zi3uwJ
 lfAOMrUEZ6/i+pLfJ/4kkmgEmQXRNlL9VETtbym5ayfvVaDK5mxRVotV0/ts3zmQVtt5
 ZBLaXXk1Jo0ZMJLp7sXb58i/70EeO+ZnfXfF/mNQ6Bv5T48/Po9ZVGJTpJLD2TAIlD+n
 yT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880860; x=1792485660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=ygpZg/mvzQQKJ/1xoj7eG0F4DZfu+BwkAHYN9lMKm6g=;
 b=E5m7EVmkufTxBltAzn1kAGXKHQbONFZf50iTXgZ/8UalCBvCPtbBJ06OTE91F89u+B
 oZ6wa2e214r+bbg8UlcqdC9FoGoZgoPFp4SsXwCxgChDmac05yLjSQ31Kyo/Av1Chpo7
 MV0WdhtgkG0xx2FV8S6LBEE/Wa1DVxni6dryhYA7MheR56c+yjPWC2zqldECG32bDzpV
 btS5jMHySo8jWp8qTFZ8Amtktlup6SAvkfqGOuKsOFyNtz7LTLaSA9rbZGnjS+ZIY+LO
 Ysoz+YB6tYM/ZY72wfAhRVAliPDtpCYwO5nLwCHWFSy2xkJ5qjiRdXxa+bXxcIF9SJSY
 C1Lw==
X-Gm-Message-State: AFq9FYKEsxSQfkWy89OzQTWtzYoa9TzbtfIFfgTipTxAuvznX+0zFk+d
 TDjWENeaG+MeFGvLjoJ9oPPe9SARNVO5oZEx4DM6TTUDpGh/uNYSY7naZ279hMbRGM2xWy3FOhV
 Qye3d7p4=
X-Gm-Gg: AYBFou2NS8QrP2GFvHQjKqhScdNeZnpRC5OQ1q0K5ND+ZcAIjBiEYa1dtQsCKLqTGQl
 CvLNnI+V2XC8nvCLq6S8rXXjVjYE8aLKfuFVER3T++33YQ79RLX2i9EPJx3zY0LZf6KiA26Ocnz
 ZvUtajtetW+z9kB0XIG48T8tgVso/pIV0JRIob2/MGzV/Az+3W1YODBl3APsgIVULCGsmSkmJ9i
 91bL0qYL/RxGH3/ZHKgE+xi1mGvVvPecDJ7dJ8kOrvJKSdpopuFGgSx15Mth6CNYwHz/fyo5cBD
 u7otZzNEdY4piR1GiZ0BBmisvFOwy+AQr/gQ1/wHg778T4+dfGtly6F9k8FO99xdNrBrNNaIpHH
 E4CTldpW1VNrs5iED9Y39rALZaDzUCZOCjzDKyfpP857LrPzEa4q7CGYO5ydvVeseM1DIcMRn57
 tIB5+nMn26Z51qTxYUc1EPfZk/7lNKal6UNhWiELnE6P5dV3iWGDEO11ratR25sg9bFo4CSo7RF
 t9MfEpWAl6D1zChqnyGJ2ZIOp408QVlpFeEOo4uQxDi+720q0rwLEFHim6CWxHMnBkke7lp2YYJ
 J14=
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id
 5b1f17b1804b1-4a18e44885dmr236716145e9.2.1791880859842; 
 Tue, 13 Oct 2026 01:40:59 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 65/86] hw/intc/arm_gicv5: Implement IRS_VPE_SELR and
 IRS_VPE_STATUSR
Date: Tue, 13 Oct 2026 09:39:12 +0100
Message-ID: <20261013083933.1024405-66-peter.maydell@linaro.org>
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

The IRS provides a set of registers to allow software to read and
write the configuration of a VPE.  IRS_VPE_SELR selects the VPE to
operate on, IRS_VPE_STATUSR indicates whether that selection was
successful, and other registers like IRS_VPE_DBR will then provide
access to the config for the selected VPE.

Implement IRS_VPE_SELR and IRS_VPE_STATUSR, for the "select a VPE"
part of this mechanism.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 111 +++++++++++++++++++++++++++++
 hw/intc/arm_gicv5_common.c         |   6 ++
 hw/intc/trace-events               |   1 +
 include/hw/intc/arm_gicv5_common.h |   2 +
 4 files changed, 120 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index e762c058a98..455242596bc 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -116,6 +116,24 @@ static void VMTE_free(void *data)
     g_free(vmte);
 }
 
+static VPE *vpe_for_vpeid(VMTE *vmte, uint32_t vpeid)
+{
+    /*
+     * Return the VPE struct for the specified VPEID for this VM, or
+     * NULL if there is no such valid VPE.
+     */
+    VPE *vpe;
+
+    if (!vmte || vpeid >= (1 << vmte->vpe_id_bits)) {
+        return NULL;
+    }
+    vpe = &vmte->vpet[vpeid];
+    if (!vpe->valid) {
+        return NULL;
+    }
+    return vpe;
+}
+
 static bool gicv5_domain_has_virt(GICv5Common *cs, GICv5Domain domain)
 {
     /*
@@ -1949,6 +1967,56 @@ txfail:
                   vmid, vpeid, vpete_addr);
 }
 
+static VPE *vpe_from_selr(GICv5 *s, GICv5Domain domain)
+{
+    /*
+     * Return the VPE for the VM/VPE indicated by the current value of
+     * IRS_VPE_SELR, or NULL if none.
+     */
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    GICv5VMTConfig *cfg = &s->vmt_config[domain];
+    uint32_t vmid, vpeid;
+    VMTE *vmte;
+
+    if (FIELD_EX64(cs->irs_vpe_selr[domain], IRS_VPE_SELR, S) == 0) {
+        return NULL;
+    }
+
+    vmid = FIELD_EX64(cs->irs_vpe_selr[domain], IRS_VPE_SELR, VM_ID);
+    vpeid = FIELD_EX64(cs->irs_vpe_selr[domain], IRS_VPE_SELR, VPE_ID);
+
+    if (!cfg->valid || vmid >= (1 << cfg->vm_id_bits)) {
+        return NULL;
+    }
+
+    vmte = g_hash_table_lookup(cfg->vm_cache, GINT_TO_POINTER(vmid));
+    return vpe_for_vpeid(vmte, vpeid);
+}
+
+static void irs_vpe_selr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
+{
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    uint32_t status = R_IRS_VPE_STATUSR_IDLE_MASK;
+    VPE *vpe;
+
+    /* RES0 if we don't have virt */
+    if (!gicv5_domain_has_virt(cs, domain)) {
+        return;
+    }
+
+    cs->irs_vpe_selr[domain] = value;
+
+    vpe = vpe_from_selr(s, domain);
+    if (vpe) {
+        /* We successfully selected a valid VPE */
+        status |= R_IRS_VPE_STATUSR_V_MASK;
+    }
+
+    trace_gicv5_irs_vpe_selr_write(domain_name[domain], value, status);
+
+    cs->irs_vpe_statusr[domain] = status;
+}
+
 static void spi_sample(GICv5SPIState *spi)
 {
     /*
@@ -2168,6 +2236,30 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VPE_SELR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = extract64(cs->irs_vpe_selr[domain], 0, 32);
+        } else {
+            /* RAZ/WI if no virt */
+            *data = 0;
+        }
+        return true;
+    case A_IRS_VPE_SELR + 4:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = extract64(cs->irs_vpe_selr[domain], 32, 32);
+        } else {
+            /* RAZ/WI if no virt */
+            *data = 0;
+        }
+        return true;
+    case A_IRS_VPE_STATUSR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = cs->irs_vpe_statusr[domain];
+        } else {
+            /* RAZ/WI if no virt */
+            *data = 0;
+        }
+        return true;
     case A_IRS_SPI_STATUSR:
         /*
          * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
@@ -2334,6 +2426,14 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
         irs_vmap_vper_write(s, domain,
                             deposit64(cs->irs_vmap_vper[domain], 32, 32, data));
         return true;
+    case A_IRS_VPE_SELR:
+        irs_vpe_selr_write(s, domain,
+                           deposit64(cs->irs_vpe_selr[domain], 0, 32, data));
+        return true;
+    case A_IRS_VPE_SELR + 4:
+        irs_vpe_selr_write(s, domain,
+                           deposit64(cs->irs_vpe_selr[domain], 32, 32, data));
+        return true;
     case A_IRS_SPI_SELR:
         cs->irs_spi_selr[domain] = data;
         return true;
@@ -2466,6 +2566,14 @@ static bool config_readll(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VPE_SELR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = cs->irs_vpe_selr[domain];
+        } else {
+            /* RAZ/WI if no virt */
+            *data = 0;
+        }
+        return true;
     }
 
     return false;
@@ -2496,6 +2604,9 @@ static bool config_writell(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_VMAP_VPER:
         irs_vmap_vper_write(s, domain, data);
         return true;
+    case A_IRS_VPE_SELR:
+        irs_vpe_selr_write(s, domain, data);
+        return true;
     }
 
     return false;
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 6e0e2295fde..553598e3178 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/intc/arm_gicv5_common.h"
 #include "hw/intc/arm_gicv5_stream.h"
+#include "hw/intc/arm_gicv5_regs.h"
 #include "hw/core/qdev-properties.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -113,6 +114,11 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
         memset(cs->irs_vmap_vistr, 0, sizeof(cs->irs_vmap_vistr));
         memset(cs->irs_vmap_l2_vistr, 0, sizeof(cs->irs_vmap_l2_vistr));
         memset(cs->irs_vmap_vper, 0, sizeof(cs->irs_vmap_vper));
+        memset(cs->irs_vpe_selr, 0, sizeof(cs->irs_vpe_selr));
+
+        for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
+            cs->irs_vpe_statusr[i] = R_IRS_VPE_STATUSR_IDLE_MASK;
+        }
     }
 }
 
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 79381c109b7..edfbf7d7157 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -253,6 +253,7 @@ gicv5_cache_vmte(const char *domain, uint32_t vmid) "GICv5 IRS %s VM ID %u valid
 gicv5_irs_vmap_vistr_write(const char *domain, uint32_t vmid, const char *type, const char *what) "GICv5 IRS %s VM ID %u %s IST now %s"
 gicv5_initialize_vpet(const char *domain, uint32_t vmid, uint32_t vpeid, bool valid) "GICv5 IRS %s VM ID %u VPE %u starts as valid %d"
 gicv5_irs_vmap_vper_write(const char *domain, uint32_t vmid, uint32_t vpeid) "GICv5 IRS %s VM ID %u VPE %u now made valid"
+gicv5_irs_vpe_selr_write(const char *domain, uint64_t selr, uint32_t status) "GICv5 IRS %s IRS_VPE_SELR written 0x%" PRIx64 " IRS_VPE_STATUSR now 0x%x"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index c8574f66a63..5823a7f78a0 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -96,6 +96,8 @@ struct GICv5Common {
     uint64_t irs_vmap_vistr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmap_l2_vistr[NUM_GICV5_DOMAINS];
     uint64_t irs_vmap_vper[NUM_GICV5_DOMAINS];
+    uint64_t irs_vpe_selr[NUM_GICV5_DOMAINS];
+    uint32_t irs_vpe_statusr[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.  Array
-- 
2.43.0


