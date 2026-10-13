Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A362CC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9d-0002MK-SX; Tue, 13 Oct 2026 04:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4Z-0001g0-4u
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4X-0008Hw-5F
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4956869750eso20251445e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880879; x=1792485679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Joy6MjKedRL92Qe+KSl4RhEqFwkrMXSKOsSYWcHJFiQ=;
 b=u3BrQTiiay7WvHPG/SLxxI/BuPqbFvuqxdJyLk4PtqCdJB+AHnefuX3Vc9zKsKKeRa
 cLvxOJ/VXNQ5/nIAgd8f01S04otMyBUogAneXE5r0YgLuYERhSFL6vx9f0vfYiBMhHdS
 xFerADDR3JEgB9QPMSPO3AdZDpt8vCY3GMAeaR+cwmVncd2EQc3egNlEDgHtzybesmN4
 vck+eF7VOT8icKUpPlSUl/CfJ6bsxkq3Iv1L5vZePzzb2GtqxW03kXsISU4MAo1mJktS
 QKsHQk1OSj5Z8bUQf3b7trPHACw4XmDSaeYglUpbsrLkHQ3WmIeTvrqzWU9jG43ZmkM/
 F0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880879; x=1792485679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Joy6MjKedRL92Qe+KSl4RhEqFwkrMXSKOsSYWcHJFiQ=;
 b=oLdt8JDptmV+fWhY4c6PYyvLeEAb5Ds4lAdpSOAMtffouVrx2wulP8TGRj/u7aYAiG
 E99IsbrZ7ftRP+AgdRWDjSbW7gCLqlvuCUe6+PqA1tw/oflhmmrN6HWmyHAZKhkWdHYV
 FfOBYLOUsGNGVtsR+V5xkXeCBtbAd8a8Wu+NbU4HEm5Z2jcU2bHwownuoJso1oN5nUvP
 Oqx8ZUHP7bqq4a5D6uDYlqdF5GAIig7EEolk7QiLF62Tso5Ak4bX4SV1SphB5fMchGYt
 VvrcTMQWAbHGQ+Ee17xH7Skt3jrK81ak4S0LPppujk1lavkHwKVhTdZLMho46CeqNkeq
 KVfg==
X-Gm-Message-State: AFq9FYIzjMl2dLtmQvfj6Zl7NBRhbRpfEu5WL4FTe29a4HAwLjUGPdmy
 vzQIJGciQOSlMetpAdu2ZFCGmGNZJAg5iPjWKjTjEuT8xriqXRMy+V/RwDlgOO0YEMurNYzjNh8
 EnUCumzw=
X-Gm-Gg: AYBFou3nX18qo5GbhmeWc2rgU+RyTKJ1ue6NPVaOt/0DONQnBbrTapo78Vd7b9f5izz
 LLyAvPFiduRHB6KeH99cx+nHG78VW4qsuv4y1WVTaGAinv3vCbG8ZBzyOU0XJ0E/z4QoPHIkLPO
 mMaTvNcC2AAFYwQ3hrGJDBBLaV9Csr+LSNZ+OtJ1aH1PX+Q3/W4j9Kb2vzgg4a6PdfO080csFs2
 zDe2YNdUvdiYbRdyZWPUrpD4IT+6Z8iblw7mvL4UWOjck1/v7dzul75Qs4KBvOvSib6qwR97MFi
 r0UCWd6Y9r0GxUkhPvGPrSB26qxU+tDX5bYKam8aimOQkhPEY3VOwsieZkz0kfvE1qX6KR/1n0s
 sWcSADsYpzwIHKIYbXgUDrz0OpJ6wLh9iSu1KkDRal5xJXPs04eXGrUj3P0I5/n0+h/baEoB98T
 nKkLYmmpl9lyKdSXI7CUoXLWz9a9JrUwm/93sFWY//KKuVpX6YLa9yJ0y8iZ+IvMbeWqL9a8+DX
 e8jm55Pg/z7oKtgntYdTI3RMnQCITFam42Ci5GXw8chmJu/8Tf01mOBnGOu2v2mqFIoxyK/hDBD
 a2g=
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id
 5b1f17b1804b1-4a18e4dce0cmr225675005e9.33.1791880879547; 
 Tue, 13 Oct 2026 01:41:19 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 81/86] hw/intc/arm_gicv5: Implement ringing doorbells for VPEs
Date: Tue, 13 Oct 2026 09:39:28 +0100
Message-ID: <20261013083933.1024405-82-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

For the GICv5, if the IRS has a potential virtual interrupt for a VPE
which is not currently resident on some CPU, then it might need to
"ring the doorbell" by triggering a physical LPI to tell the
hypervisor that it ought to schedule the VPE so it can handle the
virtual interrupt.

The conditions when we need to do this are defined in the spec by
R_CWZMW: the VPE must be non-resident, have valid doorbell settings
that request a doorbell, and the pending virtual interrupt must be
high enough priority to satisfy the doorbell priority mask.  We thus
need to reconsider whether to ring the doorbell when the vHPPI for
the VPE changes, when the VPE transitions between resident and
non-resident, and when the doorbell settings are changed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c  | 62 ++++++++++++++++++++++++++++++++++++--------
 hw/intc/trace-events |  1 +
 2 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index b3ce8a87e81..a1fe6a8a822 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -572,6 +572,53 @@ static hwaddr l1_vmte_addr(GICv5Common *cs, const GICv5VMTConfig *cfg,
     return cfg->base + (l1_index * 8);
 }
 
+static void irs_maybe_ring_doorbell(GICv5 *s, VPE *vpe)
+{
+    /*
+     * Ring the doorbell for the VPE if required by the conditions
+     * defined in R_CWZMW: the VPE must be non-resident, and have
+     * valid doorbell settings that actually request a doorbell, and
+     * a doorbell priority mask that allows it.
+     */
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    GICv5ISTConfig *cfg;
+    L2_ISTE_Handle h;
+    uint32_t *l2_iste_p;
+    uint32_t iaffid;
+
+    if (!vpe->valid || vpe->resident || !vpe->db_valid || !vpe->db_req) {
+        return;
+    }
+    if (vpe->vhppi.prio > vpe->dbpm) {
+        return;
+    }
+    trace_gicv5_irs_ring_doorbell(domain_name[vpe->vmte->domain],
+                                  vpe->vmte->vmid, vpe->db_intid);
+    /*
+     * Generate the doorbell event, and clear db_req so we only do it once.
+     * This is a SET_EDGE event for an LPI, so (R_HHKMN) it forces the
+     * LPI's handling mode to Edge ond its Pending state to Pending.
+     * If the LPI is unreachable (no LPI table, etc) then we would
+     * report it in IRS_SWERR_STATUSR if we implemented error reporting;
+     * the doorbell is marked as no-longer-requested regardless.
+     */
+    vpe->db_req = false;
+
+    cfg = &s->phys_lpi_config[vpe->vmte->domain];
+    if (!cfg) {
+        return;
+    }
+    l2_iste_p = get_l2_iste(cs, cfg, vpe->db_intid, &h);
+    if (!l2_iste_p) {
+        return;
+    }
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PENDING, true);
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, HM, GICV5_EDGE);
+    iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
+    put_l2_iste(cs, cfg, &h);
+    irs_recalc_hppi(s, vpe->vmte->domain, iaffid);
+}
+
 static void irs_recalc_vhppi(GICv5 *s, VMTE *vmte, uint32_t iaffid)
 {
     /*
@@ -612,7 +659,7 @@ static void irs_recalc_vhppi(GICv5 *s, VMTE *vmte, uint32_t iaffid)
         gicv5_forward_interrupt(cs->cpus[vpe->cpuidx], vmte->domain, true);
     }
 
-    /* TODO: we may need to generate a doorbell interrupt. */
+    irs_maybe_ring_doorbell(s, vpe);
 }
 
 static void irs_recalc_all_vhppi_for_vm(GICv5 *s, VMTE *vmte)
@@ -1428,11 +1475,7 @@ bool gicv5_set_resident(GICv5Common *cs, GICv5Domain domain, bool valid,
 
         trace_gicv5_set_non_resident(domain_name[domain], cpuidx, db, dbpm);
 
-        /*
-         * TODO: when we implement VPE doorbells, we should check whether
-         * we should immediately generate a doorbell for a VPE that has
-         * just been made non-resident.
-         */
+        irs_maybe_ring_doorbell(s, vpe);
     }
 
     /*
@@ -2369,11 +2412,8 @@ static void irs_vpe_dbr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
                                                  IRS_VPE_SELR, VPE_ID),
                                       vpe->dbpm, vpe->db_intid, vpe->db_req);
 
-        /*
-         * TODO: when we implement VPE doorbells, check here whether
-         * this config change means we should now generate a VPE
-         * doorbell event for this VPE.
-         */
+        /* This config change might mean we now need to ring the doorbell */
+        irs_maybe_ring_doorbell(s, vpe);
     } else {
         trace_gicv5_irs_vpe_dbr_write_nv(domain_name[domain], vpe->vmte->vmid,
                                          FIELD_EX64(cs->irs_vpe_selr[domain],
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 963fd75c13e..ddb7ab06207 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -260,6 +260,7 @@ gicv5_irs_vpe_dbr_write(const char *domain, uint32_t vmid, uint32_t vpeid, uint8
 gicv5_irs_vpe_dbr_write_nv(const char *domain, uint32_t vmid, uint32_t vpeid) "GICv5 IRS %s VM ID %u VPE %u IRS_VPE_DBR doorbell info no longer valid"
 gicv5_set_resident(const char *domain, uint32_t vmid, uint32_t vpeid, uint32_t cpuidx) "GICv5 IRS %s VM ID %u VPE %u set_resident phys CPU idx %u: now resident"
 gicv5_set_non_resident(const char *domain, uint32_t cpuidx, bool db, uint8_t dbpm) "GICv5 IRS %s set_resident phys CPU idx %u: now no resident VPE; db_req %d dbpm %u"
+gicv5_irs_ring_doorbell(const char *domain, uint32_t vmid, uint32_t db_intid) "GICv5 IRS %s VM ID %u: ringing doorbell LPI %u"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
-- 
2.43.0


