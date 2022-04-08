Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp392450lfq;
        Fri, 8 Apr 2022 07:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOd8LWmtwymBWJDWXxatf8FEZC2LMyrqUkBufrxbrc8mmesp0D3Ba53hA37zn4+stRItzE
X-Received: by 2002:a81:8b47:0:b0:2e6:57ba:5f84 with SMTP id e7-20020a818b47000000b002e657ba5f84mr16722766ywk.285.1649428014918;
        Fri, 08 Apr 2022 07:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428014; cv=none;
        d=google.com; s=arc-20160816;
        b=rvJ8DTsnG1sNZVvxmhXdq1pU6SRMHb+Wi/hYQvU5VJCHhU1zTFPPyQcWI2MPdGPoZb
         6FU+r1nInfQHT9gfXvE3XtSJ72wZprZRpY8EoIPvD5Qeuis4UssO7cPVe/j9emKlYhDJ
         Al6lMQTDWPQxJi5pEu+0vJJm3tMU1YDWZgw+zmXyNGrFEyJ7UR9+xnAQTNvbGFxOC7ek
         0wD8CC+2gD6gmTec/xjCAzeOCQxCojmDkTddi5cCpnD3//del5qFFHedR6rQAeUK3Iek
         XjvdmttbWLvpYIxnaPeNiqJ+zzGhQTsFqOMICpqOq+kbykHkurs0NwChOLtAW8tJ5ngf
         3g6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r5Os54AuqgX8iDZbxzhpLBt252Rh5bhRamIuRASjQ/I=;
        b=qaMR03y9JgA7u+tfcVhQ4D45wYLEwP3LowE/I7Mnq3jgQ4KPsc5sZHBpXvj2ZFtKeU
         lz1X1xdPbxd7CPmaSmsfp1jO4HPiLa20LilgQDIf68r2WoM2aOAIGo7IFU7NfOBtoF8X
         qOBGGnJigayowOQuWY/qupO3P7qE2nd7XDvi9ozg9yfs8g81H3J+08G4lYAnDMeZ0HN7
         nkFfyzQXKuTHiJx+3hMSOiRo9F75POYLVby0AMvbOZS0QkQaJb0EGw2jQ50saxudei06
         AR5fBia8GQNKXUGj6fGK2vfiQPJgln+MsqQylVDwgRd1VIdHNY+E/Kxu6dKbKItNGgi7
         mJSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0pwI84h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h131-20020a25d089000000b0063d4010a563si616414ybg.293.2022.04.08.07.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0pwI84h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpZe-0002nG-9o
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPH-0006uo-OB
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPE-0002IN-EN
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v2so2198056wrv.13
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5Os54AuqgX8iDZbxzhpLBt252Rh5bhRamIuRASjQ/I=;
 b=u0pwI84h5LdjzBMtFxtxJl2XvicZmPyQWFL6Z4zNkTh3xoIos6Twh7w36lumyWyD/Y
 43oh+TzuNjdhp/6HutL7XMttMxItGoyr1qt1mgle0+jiZ+eo6I7iiKo97xvvcwcjI778
 2HtPZ8Ig0tDQlQHmUBSHOBCUkcj7Hpz/XFT9YHW9MJ4uPivuxrzfPLSdIc87IVnKtt/S
 PKhPA4qGn5eA3SOyLfl/MUv+RDw4o6YMyqRMUkbphKtuCSvHXFiwpYdFRI/JDq1G7Bds
 Ih0F08UGhXZZWdGuXsmXMJf18Lnjt8/xSgl6m5ZtsafuZkvNcDyYUXRrHPO7VJiQQbqx
 r3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5Os54AuqgX8iDZbxzhpLBt252Rh5bhRamIuRASjQ/I=;
 b=ZsmXEQbzaF+amVomH3EGiJxB4sjRqAWk24gXD1QdF4cLVoMxEcC6ZAPtgV+yCU9joS
 3XJlC3YsMw5GimRQ0YkVZk8m6KRJ1zUc3oElv//oMl+Jz+U1Tfz++3ItbCBdaojUcF31
 dOZWQR63zt/QmwqSn+5XjJO7V3gn1dsbrwQeOVfm6gPC8PdMC8IowDYnJJmJHL3u7k97
 wpqNt97ruIAaIyc0r/3xWVBeRKmI1+hf+DCexscLyQYpGFyjdd7tTa/W2OdmqbFgYbov
 d3/3JUCeFZWLVdjWB+ENuZOT0Z7fhcgf6m74QbAITapEspycTl9hH02RhxupL4eHoo5o
 fMhg==
X-Gm-Message-State: AOAM532Aspa/rKAg996zfM07Qpf59p+x4GszPzV+2ue4fmavrs28BecF
 C1vd9yq8HWTplYOFE5MFCzJ193zSk/2Ksg==
X-Received: by 2002:adf:f212:0:b0:206:35e:8711 with SMTP id
 p18-20020adff212000000b00206035e8711mr14745049wro.78.1649427366983; 
 Fri, 08 Apr 2022 07:16:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/41] hw/intc/arm_gicv3_its: Handle virtual interrupts in
 process_its_cmd()
Date: Fri,  8 Apr 2022 15:15:23 +0100
Message-Id: <20220408141550.1271295-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WNt3m9orYJmo

For GICv4, interrupt table entries read by process_its_cmd() may
indicate virtual LPIs which are to be directly injected into a VM.
Implement the ITS side of the code for handling this.  This is
similar to the existing handling of physical LPIs, but instead of
looking up a collection ID in a collection table, we look up a vPEID
in a vPE table.  As with the physical LPIs, we leave the rest of the
work to code in the redistributor device.

The redistributor half will be implemented in a later commit;
for now we just provide a stub function which does nothing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 17 +++++++
 hw/intc/arm_gicv3_its.c    | 99 +++++++++++++++++++++++++++++++++++++-
 hw/intc/arm_gicv3_redist.c |  9 ++++
 hw/intc/trace-events       |  2 +
 4 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index bbb8a20ce61..6e22c8072e9 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -527,6 +527,23 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
 void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+/**
+ * gicv3_redist_process_vlpi:
+ * @cs: GICv3CPUState
+ * @irq: (virtual) interrupt number
+ * @vptaddr: (guest) address of VLPI table
+ * @doorbell: doorbell (physical) interrupt number (1023 for "no doorbell")
+ * @level: level to set @irq to
+ *
+ * Process a virtual LPI being directly injected by the ITS. This function
+ * will update the VLPI table specified by @vptaddr and @vptsize. If the
+ * vCPU corresponding to that VLPI table is currently running on
+ * the CPU associated with this redistributor, directly inject the VLPI
+ * @irq. If the vCPU is not running on this CPU, raise the doorbell
+ * interrupt instead.
+ */
+void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
+                               int doorbell, int level);
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
 /**
  * gicv3_redist_update_lpi:
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8ea1fc366d3..21bc1a6c18b 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -314,6 +314,42 @@ out:
     return res;
 }
 
+/*
+ * Read the vPE Table entry at index @vpeid. On success (including
+ * successfully determining that there is no valid entry for this index),
+ * we return MEMTX_OK and populate the VTEntry struct accordingly.
+ * If there is an error reading memory then we return the error code.
+ */
+static MemTxResult get_vte(GICv3ITSState *s, uint32_t vpeid, VTEntry *vte)
+{
+    MemTxResult res = MEMTX_OK;
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t entry_addr = table_entry_addr(s, &s->vpet, vpeid, &res);
+    uint64_t vteval;
+
+    if (entry_addr == -1) {
+        /* No L2 table entry, i.e. no valid VTE, or a memory error */
+        vte->valid = false;
+        goto out;
+    }
+    vteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        goto out;
+    }
+    vte->valid = FIELD_EX64(vteval, VTE, VALID);
+    vte->vptsize = FIELD_EX64(vteval, VTE, VPTSIZE);
+    vte->vptaddr = FIELD_EX64(vteval, VTE, VPTADDR);
+    vte->rdbase = FIELD_EX64(vteval, VTE, RDBASE);
+out:
+    if (res != MEMTX_OK) {
+        trace_gicv3_its_vte_read_fault(vpeid);
+    } else {
+        trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsize,
+                                 vte->vptaddr, vte->rdbase);
+    }
+    return res;
+}
+
 /*
  * Given a (DeviceID, EventID), look up the corresponding ITE, including
  * checking for the various invalid-value cases. If we find a valid ITE,
@@ -397,6 +433,38 @@ static ItsCmdResult lookup_cte(GICv3ITSState *s, const char *who,
     return CMD_CONTINUE_OK;
 }
 
+/*
+ * Given a VPEID, look up the corresponding VTE, including checking
+ * for various invalid-value cases. if we find a valid VTE, fill in @vte
+ * and return CMD_CONTINUE_OK; otherwise return CMD_STALL or CMD_CONTINUE
+ * (and the contents of @vte should not be relied on).
+ *
+ * The string @who is purely for the LOG_GUEST_ERROR messages,
+ * and should indicate the name of the calling function or similar.
+ */
+static ItsCmdResult lookup_vte(GICv3ITSState *s, const char *who,
+                               uint32_t vpeid, VTEntry *vte)
+{
+    if (vpeid >= s->vpet.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid VPEID 0x%x\n", who, vpeid);
+        return CMD_CONTINUE;
+    }
+
+    if (get_vte(s, vpeid, vte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!vte->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid VTE for VPEID 0x%x\n", who, vpeid);
+        return CMD_CONTINUE;
+    }
+
+    if (vte->rdbase >= s->gicv3->num_cpu) {
+        return CMD_CONTINUE;
+    }
+    return CMD_CONTINUE_OK;
+}
+
 static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
                                          int irqlevel)
 {
@@ -411,6 +479,33 @@ static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
     return CMD_CONTINUE_OK;
 }
 
+static ItsCmdResult process_its_cmd_virt(GICv3ITSState *s, const ITEntry *ite,
+                                         int irqlevel)
+{
+    VTEntry vte;
+    ItsCmdResult cmdres;
+
+    cmdres = lookup_vte(s, __func__, ite->vpeid, &vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    if (!intid_in_lpi_range(ite->intid) ||
+        ite->intid >= (1ULL << (vte.vptsize + 1))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: intid 0x%x out of range\n",
+                      __func__, ite->intid);
+        return CMD_CONTINUE;
+    }
+
+    /*
+     * For QEMU the actual pending of the vLPI is handled in the
+     * redistributor code
+     */
+    gicv3_redist_process_vlpi(&s->gicv3->cpu[vte.rdbase], ite->intid,
+                              vte.vptaddr << 16, ite->doorbell, irqlevel);
+    return CMD_CONTINUE_OK;
+}
+
 /*
  * This function handles the processing of following commands based on
  * the ItsCmdType parameter passed:-
@@ -446,8 +541,8 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                           __func__, ite.inttype);
             return CMD_CONTINUE;
         }
-        /* The GICv4 virtual interrupt handling will go here */
-        g_assert_not_reached();
+        cmdres = process_its_cmd_virt(s, &ite, irqlevel);
+        break;
     default:
         g_assert_not_reached();
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index dc9729e8395..b08b599c887 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -788,6 +788,15 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
     gicv3_redist_update_lpi(dest);
 }
 
+void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
+                               int doorbell, int level)
+{
+    /*
+     * The redistributor handling for being handed a VLPI by the ITS
+     * will be added in a subsequent commit.
+     */
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 2fcc9e40e55..d529914eca2 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -200,6 +200,8 @@ gicv3_its_ite_write(uint64_t ittaddr, uint32_t eventid, int valid, int inttype,
 gicv3_its_dte_read(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table read for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
 gicv3_its_dte_write(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table write for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
 gicv3_its_dte_read_fault(uint32_t devid) "GICv3 ITS: Device Table read for DeviceID 0x%x: faulted"
+gicv3_its_vte_read(uint32_t vpeid, int valid, uint32_t vptsize, uint64_t vptaddr, uint32_t rdbase) "GICv3 ITS: vPE Table read for vPEID 0x%x: valid %d VPTsize 0x%x VPTaddr 0x%" PRIx64 " RDbase 0x%x"
+gicv3_its_vte_read_fault(uint32_t vpeid) "GICv3 ITS: vPE Table read for vPEID 0x%x: faulted"
 gicv3_its_vte_write(uint32_t vpeid, int valid, uint32_t vptsize, uint64_t vptaddr, uint32_t rdbase) "GICv3 ITS: vPE Table write for vPEID 0x%x: valid %d VPTsize 0x%x VPTaddr 0x%" PRIx64 " RDbase 0x%x"
 
 # armv7m_nvic.c
-- 
2.25.1

