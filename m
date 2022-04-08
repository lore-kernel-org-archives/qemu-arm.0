Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp395734lfq;
        Fri, 8 Apr 2022 07:32:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZE18WiTjdWtXCkRQEHv6xefZuZ3jfpgqWD003MwPOMZhDqAG6zxhXdX2geWk9VKOxGU7R
X-Received: by 2002:a25:686:0:b0:636:e163:91fc with SMTP id 128-20020a250686000000b00636e16391fcmr13459924ybg.78.1649428360714;
        Fri, 08 Apr 2022 07:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428360; cv=none;
        d=google.com; s=arc-20160816;
        b=e8fGVQJ0Ud+NLT+PFLlEQKzIXIO8e1yy+RixMs2C8BbPaupkV/uJ6Gao54nfO9L3hg
         ka0hLNCxYd64quWcKqR6vAdc0HEya0UEw5mrp6RIA8dR6SsMvkVoofm5MT+pZihfYjlh
         7jadDTAYnYdbvVTLho2/GjRTTx4zKVoRT6UGBf7tK3PufyTtui1EJnB5H5nElXDUCENM
         YODoyWbkoPtRBq650IIMUIWDWYBDZvtQdiobbV9XngbIoGdZDtlreikP44d+3J8I5kaW
         LsYxQ7d1Gau8u+4ir7ooXQU8ahA5tdveaT/Zp0nEgs09Rk7qm3nAsRJB5MK70bdGeGfh
         rJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kvY7XIDQD5f22XxKR8jUlDNLZTSeCG2ZcDviwiXdLAA=;
        b=zhpB61NRzoz5tQA2FJeF52gnCNr6YzR50hbhk74pEFYHp9hi8WKBOm5FV2SbTS3pgY
         qziNYC1gDV1dmRK1T9rduyQziI0mjU+z1e3mBZErrv2HNolmTLmTqf0Itqd5nuld2S39
         ZsTe66kWBQ6xsguao3c4fbGcKRxxw8gM08ssinScnORe8Q6ktsJkK6YsdMHbqTACe1+X
         +5J9tTEveMHRL4alTW5JwluBOZe4RLOpbqJSxMqDdHP6GGygBz/MIjtUEYb+RuY5vtus
         rTkLzyBLeFE9Mi60ZlEO3R6eGnbrmr3C+6iJV90Ysm2qZnQyjtVKy4ETuM7FjgnNP4XC
         LcHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4eXNSHj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p76-20020a0de64f000000b002e5bb9dcb13si485519ywe.412.2022.04.08.07.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4eXNSHj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpfE-0004X9-2o
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPN-0006yp-16
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPL-0002Ks-5b
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z1so13076355wrg.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvY7XIDQD5f22XxKR8jUlDNLZTSeCG2ZcDviwiXdLAA=;
 b=r4eXNSHjMlCQfaSqVRscv6JKwEWu+anzMMuux6+Pyd4eyctuf68DhdMgtXtYrWBue1
 m5VzQVwZjFaYH6V/egnEqBSUSUecfkyVGU/E4/N850yOAOR3PDnSg1RgJpkMafjYb5lG
 xy1JbnDTWva3e6Z4Ebvt41wPhwiTnw9ED9FqIhCPNi/hUdCWK4j3yIpyl/UhLqkKBtpv
 ay7wiHyy8iZqnn6+lMufOojo5qZ+LDzpJrupHwYQIoxQAzojgp8qvxm0XpH6hSxN7N4R
 tfqQFyxc/sjfMdiNGpOvmol8sJaETONIO6sfhQc85WL6pZTQ1t5qfo+zsWZf8BlYoucC
 WuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvY7XIDQD5f22XxKR8jUlDNLZTSeCG2ZcDviwiXdLAA=;
 b=Y70/W/TvcQlZY/kLORrYWQHoG0LLaj/H24XmB8n2/AyDVBoMhJ4KVbgrOQVYCuFLfS
 ZkXa1BFXqxpD+C69Laly2730XLOcUwffl3j+pRnACCKDNxQTg8RXTb6Vc8RDqCoXVZ0G
 SI/q/E5MsNLk+bdmRFrGBK/Dglqjskssu0XKIYHXD1eM7/2jAQOTNvXK5ZEoSVHXdXyX
 ureJ5PtDur3A4kMcO4PSBbOt92e1i1Gs3kyNk8Lg6vChyfaG1qFKHIBh1NncBhqDdTb8
 rgnPQNUyrqSlXSdIJm/3O2PDWNujnGF8oGGysV84OKdCCaw8E/06y0VFJDYg195QIg+i
 dl4Q==
X-Gm-Message-State: AOAM533GdjKr3HERTVPaxEDNHllDBDMD7hs0Ma7E2YKE6tkzZU463Awc
 F8G/hHGCQkcif5VSj1+TwANScQ==
X-Received: by 2002:adf:eb07:0:b0:207:8534:2ef6 with SMTP id
 s7-20020adfeb07000000b0020785342ef6mr7115528wrn.62.1649427373328; 
 Fri, 08 Apr 2022 07:16:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/41] hw/intc/arm_gicv3_its: Implement VINVALL
Date: Fri,  8 Apr 2022 15:15:30 +0100
Message-Id: <20220408141550.1271295-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 07glhiyQfLjX

The VINVALL command should cause any cached information in the
ITS or redistributor for the specified vCPU to be dropped or
otherwise made consistent with the in-memory LPI configuration
tables.

Here we implement the command and table parsing, leaving the
redistributor part as a stub for the moment, as usual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 13 +++++++++++++
 hw/intc/arm_gicv3_its.c    | 26 ++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c |  5 +++++
 hw/intc/trace-events       |  1 +
 4 files changed, 45 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 050e19d133b..8d58d38836f 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -335,6 +335,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
+#define GITS_CMD_VINVALL          0x2D
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
@@ -411,6 +412,9 @@ FIELD(VMOVI_1, VPEID, 32, 16)
 FIELD(VMOVI_2, D, 0, 1)
 FIELD(VMOVI_2, DOORBELL, 32, 32)
 
+/* VINVALL command fields */
+FIELD(VINVALL_1, VPEID, 32, 16)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -637,6 +641,15 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest);
 void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
                            GICv3CPUState *dest, uint64_t dest_vptaddr,
                            int irq, int doorbell);
+/**
+ * gicv3_redist_vinvall:
+ * @cs: GICv3CPUState
+ * @vptaddr: address of VLPI pending table
+ *
+ * On redistributor @cs, invalidate all cached information associated
+ * with the vCPU defined by @vptaddr.
+ */
+void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr);
 
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index aef024009b2..6c44cccd369 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1163,6 +1163,29 @@ static ItsCmdResult process_vmovi(GICv3ITSState *s, const uint64_t *cmdpkt)
     return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
+static ItsCmdResult process_vinvall(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    VTEntry vte;
+    uint32_t vpeid;
+    ItsCmdResult cmdres;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    vpeid = FIELD_EX64(cmdpkt[1], VINVALL_1, VPEID);
+
+    trace_gicv3_its_cmd_vinvall(vpeid);
+
+    cmdres = lookup_vte(s, __func__, vpeid, &vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    gicv3_redist_vinvall(&s->gicv3->cpu[vte.rdbase], vte.vptaddr << 16);
+    return CMD_CONTINUE_OK;
+}
+
 static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
@@ -1364,6 +1387,9 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_VMOVI:
             result = process_vmovi(s, cmdpkt);
             break;
+        case GITS_CMD_VINVALL:
+            result = process_vinvall(s, cmdpkt);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index dc25997d1f9..7c75dd6f072 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -818,6 +818,11 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
      */
 }
 
+void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
+{
+    /* The redistributor handling will be added in a subsequent commit */
+}
+
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
 {
     /*
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 9894756e55a..004a1006fb8 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -194,6 +194,7 @@ gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
 gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
 gicv3_its_cmd_vmovi(uint32_t devid,  uint32_t eventid, uint32_t vpeid, int dbvalid, uint32_t doorbell) "GICv3 ITS: command VMOVI DeviceID 0x%x EventID 0x%x vPEID 0x%x D %d Dbell_pINTID 0x%x"
+gicv3_its_cmd_vinvall(uint32_t vpeid) "GICv3 ITS: command VINVALL vPEID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1

