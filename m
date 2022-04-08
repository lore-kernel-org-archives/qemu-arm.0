Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp393953lfq;
        Fri, 8 Apr 2022 07:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxOG85FM1FDkYj7EAche/6wuy5fW4C1k6NFT2yv0q67TLsn4iQnv97frnsjvYUvmXllyS1
X-Received: by 2002:a81:2450:0:b0:2d6:aee8:f0d5 with SMTP id k77-20020a812450000000b002d6aee8f0d5mr16782901ywk.81.1649428181245;
        Fri, 08 Apr 2022 07:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428181; cv=none;
        d=google.com; s=arc-20160816;
        b=q+5dq3Glb0JECFf0vux8wujxzkY5cCtWOhVhh5zRAthivM+M+/dOsKvZUiqx8RRem9
         aA8CoJxHlxppPjFDu0zVQ0G+QAR7v7eGPM+UzNrnS3T34R9duVeg/8II+rSr6blnA2kr
         TPJ4SftF+5uBTNJqMCttw2mMTbZyrjtBv3MFqXm6CIUejJTa1FG+s8TIN83KZPVzzYCQ
         gV5wJKH1T2Dz6zUH0uF9x4CeIqWzaZ7wmn8CoWtAQL5YGdNwqyUXJFuIO5f15ThiZKTd
         G+qsrqN1KCTm/LVHPE/kXnt9Nm5MxlPCrI+5y8INW2+/6oCnQ6DUuvIr9OURueFUB6Mx
         4RFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WYbE6n09x98/8r6NZVq0wUWihXF3pXJgeidd4roSBuo=;
        b=j2cKv4YCLfhu+0Vjtn6XSEB1795mghDQilAHDl0B3HxtL50AFvWH+wxi2o/5vBxAkY
         nnFUOIXBR9LGaWHtocJ6je+5JiPczdBDLi89xgxZcXv/L3WA5X919PRk5ejMRq/YFSIs
         SjrA+MV6F3YeooD6ZxqTfmt0XgQI3VoA3VFuMYtTiZaD3pJawgiLdoaTZG1cV7iDwmGT
         YaI8dD5cjDIW3w6p4BxIQ+TUK8cBJoWbvzoMe8DpC/RMeddsuOQTiPJhA1R8hStXv7wf
         7tPrm3DwsG3gk3WnZ+5jMblgCLbIxVzrtr/vErIUiS6J3gpNTA6o5ApT82J4HyD2qrmz
         D5Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z64kQepB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s141-20020a252c93000000b0063dc4216154si600546ybs.177.2022.04.08.07.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z64kQepB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpcK-0000tA-K4
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPF-0006uc-Q0
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:47031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPC-0002Hd-NG
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v2so2197867wrv.13
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYbE6n09x98/8r6NZVq0wUWihXF3pXJgeidd4roSBuo=;
 b=z64kQepBrFBkUSwLDHJCNaUw50Mbv4pTJsOJmdDlxA1lrfDqEQDVgcwUJXNyyqPu4y
 1ZN5ob6Geeff/EfPyQo9YVFbLHmwdg9u7/Y+NnQGTdzF1KKiFg+KjXRfCQoED1nnGx15
 T2diGwPvDUMWyMcrmpdwQXpQ2kMzzMYXJhBb5CNe3WEpkxQtOp4O2KAhTN7VavhEcI+u
 9FBA2kppm9O7C6/u22PJcmc+sf9zqPr1ulO1JpHbN9BEXKWOhskbg1Cztvu8v4Z7KtQi
 aTxEGXXUcrYmXqODO6uFIKzgIbQlJFoakOqaF5xCPKQ773idIcMqPIdFHiff10HZdhjZ
 KXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WYbE6n09x98/8r6NZVq0wUWihXF3pXJgeidd4roSBuo=;
 b=2OYRfs7Gq540VjKqmA6qR2jdzG2SBOaSjBmTClMOPuhWAHLZUuo4xggS63sPaGWswm
 NdSK6mmr84KVvwyBxP2UcqEGFhCKEuPBk+3XI3WS/jY0rbQy0aGWKko4qWBsuk5tx2JR
 H4q2YhzrTfRqAxVLFOZL9/wIpFa6Z0O27QjIdfcxpSz0pTD2T+ZTYfX6d4nzlTGUvbUv
 HXNXdw3SpOUyGVgbbFzewRMELZduohamNIHTdsZZ3OLH1+XHqNEQz6qiFeZEYdNKeq4F
 C0/6hEULtYeeiKmZiZzqakt5rTTjRX16Z2DNUcoYjXojZvM+4M94l1/4TqNqF7pBk8xK
 MoAQ==
X-Gm-Message-State: AOAM533Z4zGnBQM3uQ2PsfhpVi+gmbXstDcY93sSc7pgJJUfXkQB/ruC
 bBLSfDLYQNq+sQ2uB3zTujaE8f/8jzacDg==
X-Received: by 2002:a5d:5009:0:b0:206:f24:b659 with SMTP id
 e9-20020a5d5009000000b002060f24b659mr15034996wrt.476.1649427365095; 
 Fri, 08 Apr 2022 07:16:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/41] hw/intc/arm_gicv3_its: Factor out CTE lookup sequence
Date: Fri,  8 Apr 2022 15:15:21 +0100
Message-Id: <20220408141550.1271295-13-peter.maydell@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 47dBaishaXN6

Factor out the sequence of looking up a CTE from an ICID including
the validity and error checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think process_movi() in particular is now a lot cleaner
to read with all the error-checking factored out.
---
 hw/intc/arm_gicv3_its.c | 109 ++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 70 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fe1bea2dd81..2cbac76256d 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -368,6 +368,36 @@ static ItsCmdResult lookup_ite(GICv3ITSState *s, const char *who,
     return CMD_CONTINUE_OK;
 }
 
+/*
+ * Given an ICID, look up the corresponding CTE, including checking for various
+ * invalid-value cases. If we find a valid CTE, fill in @cte and return
+ * CMD_CONTINUE_OK; otherwise return CMD_STALL or CMD_CONTINUE (and the
+ * contents of @cte should not be relied on).
+ *
+ * The string @who is purely for the LOG_GUEST_ERROR messages,
+ * and should indicate the name of the calling function or similar.
+ */
+static ItsCmdResult lookup_cte(GICv3ITSState *s, const char *who,
+                               uint32_t icid, CTEntry *cte)
+{
+    if (icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid ICID 0x%x\n", who, icid);
+        return CMD_CONTINUE;
+    }
+    if (get_cte(s, icid, cte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid CTE\n", who);
+        return CMD_CONTINUE;
+    }
+    if (cte->rdbase >= s->gicv3->num_cpu) {
+        return CMD_CONTINUE;
+    }
+    return CMD_CONTINUE_OK;
+}
+
+
 /*
  * This function handles the processing of following commands based on
  * the ItsCmdType parameter passed:-
@@ -396,29 +426,9 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    if (ite.icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, ite.icid);
-        return CMD_CONTINUE;
-    }
-
-    if (get_cte(s, ite.icid, &cte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!cte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: invalid CTE\n",
-                      __func__);
-        return CMD_CONTINUE;
-    }
-
-    /*
-     * Current implementation only supports rdbase == procnum
-     * Hence rdbase physical address is ignored
-     */
-    if (cte.rdbase >= s->gicv3->num_cpu) {
-        return CMD_CONTINUE;
+    cmdres = lookup_cte(s, __func__, ite.icid, &cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
     if ((cmd == CLEAR) || (cmd == DISCARD)) {
@@ -792,54 +802,13 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    if (old_ite.icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, old_ite.icid);
-        return CMD_CONTINUE;
+    cmdres = lookup_cte(s, __func__, old_ite.icid, &old_cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
-
-    if (new_icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: ICID 0x%x\n",
-                      __func__, new_icid);
-        return CMD_CONTINUE;
-    }
-
-    if (get_cte(s, old_ite.icid, &old_cte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!old_cte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid CTE for old ICID 0x%x\n",
-                      __func__, old_ite.icid);
-        return CMD_CONTINUE;
-    }
-
-    if (get_cte(s, new_icid, &new_cte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!new_cte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid CTE for new ICID 0x%x\n",
-                      __func__, new_icid);
-        return CMD_CONTINUE;
-    }
-
-    if (old_cte.rdbase >= s->gicv3->num_cpu) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%x\n",
-                      __func__, old_cte.rdbase);
-        return CMD_CONTINUE;
-    }
-
-    if (new_cte.rdbase >= s->gicv3->num_cpu) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%x\n",
-                      __func__, new_cte.rdbase);
-        return CMD_CONTINUE;
+    cmdres = lookup_cte(s, __func__, new_icid, &new_cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
     if (old_cte.rdbase != new_cte.rdbase) {
-- 
2.25.1

