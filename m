Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp390437lfq;
        Fri, 8 Apr 2022 07:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzifACjRXW4jz+ZdITnuVJLLxsS7gTXGsBwrf4di/PpurN2+MpMxxNSe5WZKDmdMjTTFfeD
X-Received: by 2002:a25:9a43:0:b0:628:672c:e471 with SMTP id r3-20020a259a43000000b00628672ce471mr13279409ybo.73.1649427814634;
        Fri, 08 Apr 2022 07:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427814; cv=none;
        d=google.com; s=arc-20160816;
        b=LDZ5Y2OgV0jEpVpBdzdzurzrZmHD62hd/Dqbgr/mTdviAQAy8GUl55dmPApzFxcbAd
         nkc/Sb2fzEdmD80GMY1+e4WJ8MnHITOFE79UbNqU2JqjvE6zbHEKH3hX+elwxSJQkKYm
         pFHkK0UBhm5rdfIY+sRy5O8ghIfOVTenCLM63z2ONo77svmHptk3Du6CtjH6K8vJ5ajh
         RC2M1WEOeTz4cXbk1V4fuM4Yddryggb4vQRYulGCGPKCquSK1AYNwkBML1e0Rfdbv+NE
         lk2MVbIgiQlWfHbRv4+n8tAjGepoSvrg+MJ4/dIfgxoUGXY7Qp6hrz5TlIrBoWwgpEU+
         XyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=udZXKhjCILW7E0fUX7TNoreN3wUNIEE/HPBGgOlM0/Q=;
        b=aBBsgtE7TFLhiRJ/BqUo/iLFoL10JNONIOT6Xsz4EP3voP+FffXbP8TH3MuoNyYfae
         YD3Nd46/jBdok0N/M4kYdlM4iU2PDhkUbbk86iGfSW4OyKSVQwZPrlngETtfP4xw7jzn
         zGUKMfX7zQeILau1KJjyhlTvjTFdIcu8g+SzPrWguNjpBU6aasqc4KVSKw8x9yNQzrSr
         sF+Q2rP/qgcEnVuKd5FjL0eTKKn8WVHorxAezSjjfNsDpwncxTGYyH/GaZ0dndt+018M
         Q1DHn/CXnkh0gt8+7y8mbxIkAd9qRXeOnZpCKJOmhtPYyEyW/KEITwVZa6h3/yWt0KBp
         JHug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qCzJ0W4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m64-20020a812643000000b002dc3c591dcasi483517ywm.1.2022.04.08.07.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qCzJ0W4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpWQ-0005bh-0r
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPE-0006sY-AC
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPA-0002Ge-UY
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id w21so13099539wra.2
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udZXKhjCILW7E0fUX7TNoreN3wUNIEE/HPBGgOlM0/Q=;
 b=qCzJ0W4GGxmGhN4ESxgCSs1GaRSbaDUjOtPJ5uQl9OyumJ99pEVisZ5XHsunC8G+VK
 9CaQlWldKiUVR8Paz3go3qJZJHwNECuJAqbj3hr7Bn57srWjt20ixm2nt3CW4MFDu4xX
 rnj3zImYHyLme8j45+DLzc7SZNkKg9qoXQarPIp6WpJqpLwodgPiycVgOKBOu7SgEWHk
 thXhSUEmDxksEmGzaMD3kFa3YzxVxW3b2OpwpT4+kRPsJPipC/+XDv6A7P3ZIhbfkG+K
 uYsjS6OKcLmLmq11ZNkLOiTZbuDH+VDU6SGlRn1FqE02eopUXUOt02rTglz+S1kCrCfk
 K51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udZXKhjCILW7E0fUX7TNoreN3wUNIEE/HPBGgOlM0/Q=;
 b=RL+Ee2KO88EuNXsPqbaIArWb335d8oqWKOSjQ5s0rrpRkY1Gs2+ukYUkS5d2U0IJYo
 fRe+v3bkm8VgpraR7fj1yBWlmlzwXBKosrfVJcixNjaKRfUA3AGt3EusQSFFo6RT0w+J
 uM1qnoY0tv50Pnnq2ivAjxt6rkFYLsisrpt0mqf7wuw9b1NU89vLLvXnTAAhs/Q/+vlB
 C5PcIH/iv+rt4d88q6aycvOM0cYkrXHooC35u0yqbZX6rw0znIjGGeRxkLmaBKAYaTC7
 VcDhju+fmCNVYAlaeK79k3V15t5nW7a4mrxzyfXC3qHvhvjxHXIdFcc227+/qg17WVl7
 szJg==
X-Gm-Message-State: AOAM533mFw52uJimUTR24liBkb3221gnmWHFt+I2155+8yB93Ke71jFt
 SJ9BNuR9neHW9iP+XBp9SjMOg7aiUvVyYQ==
X-Received: by 2002:a05:6000:12c6:b0:206:100e:16f2 with SMTP id
 l6-20020a05600012c600b00206100e16f2mr14732131wrx.644.1649427363409; 
 Fri, 08 Apr 2022 07:16:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/41] hw/intc/arm_gicv3_its: Distinguish success and error
 cases of CMD_CONTINUE
Date: Fri,  8 Apr 2022 15:15:19 +0100
Message-Id: <20220408141550.1271295-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: RyDNC3AL4VXE

In the ItsCmdResult enum, we currently distinguish only CMD_STALL
(failure, stall processing of the command queue) and CMD_CONTINUE
(keep processing the queue), and we use the latter both for "there
was a parameter error, go on to the next command" and "the command
succeeded, go on to the next command".  Sometimes we would like to
distinguish those two cases, so add CMD_CONTINUE_OK to the enum to
represent the success situation, and use it in the relevant places.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ea2b4b9e5a7..ba1893c072b 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -78,11 +78,13 @@ typedef struct VTEntry {
  * and continue processing.
  * The process_* functions which handle individual ITS commands all
  * return an ItsCmdResult which tells process_cmdq() whether it should
- * stall or keep going.
+ * stall, keep going because of an error, or keep going because the
+ * command was a success.
  */
 typedef enum ItsCmdResult {
     CMD_STALL = 0,
     CMD_CONTINUE = 1,
+    CMD_CONTINUE_OK = 2,
 } ItsCmdResult;
 
 /* True if the ITS supports the GICv4 virtual LPI feature */
@@ -400,9 +402,9 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         ITEntry ite = {};
         /* remove mapping from interrupt translation table */
         ite.valid = false;
-        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
     }
-    return CMD_CONTINUE;
+    return CMD_CONTINUE_OK;
 }
 
 static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
@@ -495,7 +497,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.icid = icid;
     ite.doorbell = INTID_SPURIOUS;
     ite.vpeid = 0;
-    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
@@ -574,7 +576,7 @@ static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.icid = 0;
     ite.doorbell = doorbell;
     ite.vpeid = vpeid;
-    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -635,7 +637,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_cte(s, icid, &cte) ? CMD_CONTINUE : CMD_STALL;
+    return update_cte(s, icid, &cte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -696,7 +698,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_dte(s, devid, &dte) ? CMD_CONTINUE : CMD_STALL;
+    return update_dte(s, devid, &dte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
@@ -725,13 +727,13 @@ static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     if (rd1 == rd2) {
         /* Move to same target must succeed as a no-op */
-        return CMD_CONTINUE;
+        return CMD_CONTINUE_OK;
     }
 
     /* Move all pending LPIs from redistributor 1 to redistributor 2 */
     gicv3_redist_movall_lpis(&s->gicv3->cpu[rd1], &s->gicv3->cpu[rd2]);
 
-    return CMD_CONTINUE;
+    return CMD_CONTINUE_OK;
 }
 
 static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
@@ -845,7 +847,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     /* Update the ICID field in the interrupt translation table entry */
     old_ite.icid = new_icid;
-    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -924,7 +926,7 @@ static ItsCmdResult process_vmapp(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE : CMD_STALL;
+    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -963,7 +965,7 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
-        ItsCmdResult result = CMD_CONTINUE;
+        ItsCmdResult result = CMD_CONTINUE_OK;
         void *hostmem;
         hwaddr buflen;
         uint64_t cmdpkt[GITS_CMDQ_ENTRY_WORDS];
@@ -1055,7 +1057,8 @@ static void process_cmdq(GICv3ITSState *s)
             trace_gicv3_its_cmd_unknown(cmd);
             break;
         }
-        if (result == CMD_CONTINUE) {
+        if (result != CMD_STALL) {
+            /* CMD_CONTINUE or CMD_CONTINUE_OK */
             rd_offset++;
             rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
-- 
2.25.1

