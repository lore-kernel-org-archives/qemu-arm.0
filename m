Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp392807lfq;
        Fri, 8 Apr 2022 07:27:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfu2HPoG62VrhuEk/im65MpAydSrCad0gpB3zcCB2oKpUv9IP+XDVYyiNgTzM3i9IWaJX8
X-Received: by 2002:a0d:dc02:0:b0:2dc:e978:1be with SMTP id f2-20020a0ddc02000000b002dce97801bemr15809296ywe.508.1649428055156;
        Fri, 08 Apr 2022 07:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428055; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqyISM0W8A5R0rX25b2OY5LYVtyAj81Q+ZIk8w2FQIprFjdy49jMy39VuUnGo92LO0
         fzXh647kenN9OQ1GlQzkK+JsV+I6gh8vhkRsApnMcZzji+wXOUrOgK3eGf7moroHk4i8
         YzPg+yKcpX4ziU2Fv2BKTTI4a/1hKK/wYUSEkfhBOiAPr/yuv/CFakAVQjuM3//BYz9L
         DEymWwSSk1A5UJONi/LPp2zl1D1Y+8xqyJ9wPD4vgrgzlYhQ+ukTlGuCcEuKYMeTKDLJ
         Xo8bnfhtkzqp04RDFIlscb18gMt31ePMM0go1MY9c9mHnFFh0z65MZJ8IiOh1C4fZitL
         CcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lAmRCo+P0tpuQq9W7lDg7RirtMlu4mcCLIbEFy1deTM=;
        b=Fh70R1d9PE1vN87t91zr+bko/7eoGdgz5me/IGzEGID/7H7/+bIJbM3sF1cXGLq3BB
         kZflV3vZVlQFPE2ocFa6RrR1zWKkbNHqRpTARZQVT6s1eHx4Zf0g1JtVezVcsFC7pVCc
         Ypk5ysnfuAHXpMyDsZ1XWKcxPEWF07AJLkzG7szweLaWVxP+caJzlz1/7Pon0CjE28xK
         EgSfm1Lgcp/N9sXbfxzBWfhTHm07zLyx7fd2J/WpP6vDq7ZmDECwoMuaZwHQMcibdiX1
         TYq9YHOLzRMlX9vibzEmcwzN9cgqPFMinDOTCReZNS7iHMI8G5SIX5RzP0bTjf37J+U8
         eDzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYIZskyB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19-20020a0dd713000000b002eb59830690si524156ywd.526.2022.04.08.07.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYIZskyB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpaI-0003EO-Gb
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPM-0006y2-A9
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPJ-0002Kf-Q5
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id r64so5567372wmr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAmRCo+P0tpuQq9W7lDg7RirtMlu4mcCLIbEFy1deTM=;
 b=uYIZskyB/3NFE00oRALpOAi6BfNEAYy7VsSYq5wVtLpKdG8y8/4nlnp/4eOoCwtmBp
 ulD7RRu1iqPfJUHRgJpGYSBjYnuLPXbabqqLObU1o1MiJ3UzWRCWwEtgyesTrK1PKIow
 GnBLfAbnjUkcyJizviuHHj7965KPLgn8+d/aGGF0entlSo99VW2DHNwGkYtNJjkZc86Y
 yy9dSNZmV3bRSzr32B4zMctIsuegwfvnx10jPX3hIP70yikZpWi/Iv4/SYixxeay13L3
 M0HIZpKJDKnVkBuLgdHPD1KY+i89fjkX7LixxJVJmFMU3CNuKshxYHJNHOBkot0dXDVB
 AyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAmRCo+P0tpuQq9W7lDg7RirtMlu4mcCLIbEFy1deTM=;
 b=0O/6CncZc4gy1QbnQX76SUGkElsHWh+o4STAerFKnFh4MdUbr0qlWm1BF6tneXqvBj
 ZB7Bw5N2T+BK1j1XE1R6hnHA/FEYGy2wDVos+izfw7bYZIQciI/+xMd4k0iQoL0Zg/fl
 lCbIDQkme46GbyEKdezNcGs38zfoUGjG930W1XvxniGG/bkFQnSYtgTM9HCnCs0AHGEu
 b+WMqpTAU8dyquT+fKb0qG7YDItUmlNnOTlZGDkpHqwd4nyh8WGxTgcTbvTVFwzeguAp
 cfpz6ibTW/ATyvsQmqRuu5gLDAmJt1zrddrGT8k6/0WmUL9FTf1INSO1zPr7eRftVlJT
 CT4A==
X-Gm-Message-State: AOAM532Op5VupAdpMwVz8cJevJazrVTsroIjXG1TfiDQUwa3WmsR/r5W
 zhO9mXO51fSeanBrhUP2OGfxOJaQSLQo3w==
X-Received: by 2002:a1c:7906:0:b0:38e:8d12:2ab9 with SMTP id
 l6-20020a1c7906000000b0038e8d122ab9mr8234318wme.115.1649427372436; 
 Fri, 08 Apr 2022 07:16:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/41] hw/intc/arm_gicv3_its: Implement VMOVI
Date: Fri,  8 Apr 2022 15:15:29 +0100
Message-Id: <20220408141550.1271295-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PDAfSu5u1W/c

Implement the GICv4 VMOVI command, which moves the pending state
of a virtual interrupt from one redistributor to another. As with
MOVI, we handle the "parse and validate command arguments and
table lookups" part in the ITS source file, and pass the final
results to a function in the redistributor which will do the
actual operation. As with the "make a VLPI pending" change,
for the moment we leave that redistributor function as a stub,
to be implemented in a later commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 23 +++++++++++
 hw/intc/arm_gicv3_its.c    | 82 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c | 10 +++++
 hw/intc/trace-events       |  1 +
 4 files changed, 116 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 2f653a9b917..050e19d133b 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -329,6 +329,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_INVALL           0x0D
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_VMOVI            0x21
 #define GITS_CMD_VMOVP            0x22
 #define GITS_CMD_VSYNC            0x25
 #define GITS_CMD_VMAPP            0x29
@@ -403,6 +404,13 @@ FIELD(VMOVP_2, RDBASE, 16, 36)
 FIELD(VMOVP_2, DB, 63, 1) /* GICv4.1 only */
 FIELD(VMOVP_3, DEFAULT_DOORBELL, 0, 32) /* GICv4.1 only */
 
+/* VMOVI command fields */
+FIELD(VMOVI_0, DEVICEID, 32, 32)
+FIELD(VMOVI_1, EVENTID, 0, 32)
+FIELD(VMOVI_1, VPEID, 32, 16)
+FIELD(VMOVI_2, D, 0, 1)
+FIELD(VMOVI_2, DOORBELL, 32, 32)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -614,6 +622,21 @@ void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq);
  * by the ITS MOVALL command.
  */
 void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest);
+/**
+ * gicv3_redist_mov_vlpi:
+ * @src: source redistributor
+ * @src_vptaddr: (guest) address of source VLPI table
+ * @dest: destination redistributor
+ * @dest_vptaddr: (guest) address of destination VLPI table
+ * @irq: VLPI to update
+ * @doorbell: doorbell for destination (1023 for "no doorbell")
+ *
+ * Move the pending state of the specified VLPI from @src to @dest,
+ * as required by the ITS VMOVI command.
+ */
+void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
+                           GICv3CPUState *dest, uint64_t dest_vptaddr,
+                           int irq, int doorbell);
 
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c8b90e6b0d9..aef024009b2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1084,6 +1084,85 @@ static ItsCmdResult process_vmovp(GICv3ITSState *s, const uint64_t *cmdpkt)
     return cbdata.result;
 }
 
+static ItsCmdResult process_vmovi(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    uint32_t devid, eventid, vpeid, doorbell;
+    bool doorbell_valid;
+    DTEntry dte;
+    ITEntry ite;
+    VTEntry old_vte, new_vte;
+    ItsCmdResult cmdres;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    devid = FIELD_EX64(cmdpkt[0], VMOVI_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], VMOVI_1, EVENTID);
+    vpeid = FIELD_EX64(cmdpkt[1], VMOVI_1, VPEID);
+    doorbell_valid = FIELD_EX64(cmdpkt[2], VMOVI_2, D);
+    doorbell = FIELD_EX64(cmdpkt[2], VMOVI_2, DOORBELL);
+
+    trace_gicv3_its_cmd_vmovi(devid, eventid, vpeid, doorbell_valid, doorbell);
+
+    if (doorbell_valid && !valid_doorbell(doorbell)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid doorbell 0x%x\n", __func__, doorbell);
+        return CMD_CONTINUE;
+    }
+
+    cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    if (ite.inttype != ITE_INTTYPE_VIRTUAL) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: ITE is not for virtual interrupt\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    cmdres = lookup_vte(s, __func__, ite.vpeid, &old_vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+    cmdres = lookup_vte(s, __func__, vpeid, &new_vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    if (!intid_in_lpi_range(ite.intid) ||
+        ite.intid >= (1ULL << (old_vte.vptsize + 1)) ||
+        ite.intid >= (1ULL << (new_vte.vptsize + 1))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: ITE intid 0x%x out of range\n",
+                      __func__, ite.intid);
+        return CMD_CONTINUE;
+    }
+
+    ite.vpeid = vpeid;
+    if (doorbell_valid) {
+        ite.doorbell = doorbell;
+    }
+
+    /*
+     * Move the LPI from the old redistributor to the new one. We don't
+     * need to do anything if the guest somehow specified the
+     * same pending table for source and destination.
+     */
+    if (old_vte.vptaddr != new_vte.vptaddr) {
+        gicv3_redist_mov_vlpi(&s->gicv3->cpu[old_vte.rdbase],
+                              old_vte.vptaddr << 16,
+                              &s->gicv3->cpu[new_vte.rdbase],
+                              new_vte.vptaddr << 16,
+                              ite.intid,
+                              ite.doorbell);
+    }
+
+    /* Update the ITE to the new VPEID and possibly doorbell values */
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
+}
+
 static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
@@ -1282,6 +1361,9 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_VMOVP:
             result = process_vmovp(s, cmdpkt);
             break;
+        case GITS_CMD_VMOVI:
+            result = process_vmovi(s, cmdpkt);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 856494b4e8f..dc25997d1f9 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -808,6 +808,16 @@ void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
      */
 }
 
+void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
+                           GICv3CPUState *dest, uint64_t dest_vptaddr,
+                           int irq, int doorbell)
+{
+    /*
+     * The redistributor handling for moving a VLPI will be added
+     * in a subsequent commit.
+     */
+}
+
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
 {
     /*
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index ae4a3cfb004..9894756e55a 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -193,6 +193,7 @@ gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t
 gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
 gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
+gicv3_its_cmd_vmovi(uint32_t devid,  uint32_t eventid, uint32_t vpeid, int dbvalid, uint32_t doorbell) "GICv3 ITS: command VMOVI DeviceID 0x%x EventID 0x%x vPEID 0x%x D %d Dbell_pINTID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1

