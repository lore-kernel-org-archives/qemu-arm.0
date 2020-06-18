Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1274480lfm;
        Wed, 17 Jun 2020 21:52:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZTH2203L8bDzd3IVpQxptRPMlDabrdkEfZhVQFyqUmDGrjRq6FCPFjLb34xgtNrl2I5qY
X-Received: by 2002:a25:6b4a:: with SMTP id o10mr3709774ybm.405.1592455977567;
        Wed, 17 Jun 2020 21:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455977; cv=none;
        d=google.com; s=arc-20160816;
        b=Ex9FnxH9YMQBlKXHPA9w64p8RjtX1QR6tFqnHK0eehMH2JZmcxziIxRYx+9WALppOa
         IA73kmoY8bb6iBzwz1v5a/Q4tKPWsyaNhIzxBNvbwiyjCKUONnQVt9j4JzvWhHgYKQNr
         uWpvxA6Ok5X8JPdN9d5eKuaZPvIKUnpXzrDxg4tKzApwZ2JrN/gb0YkbOk4TLJucAebt
         4nlwYcGIIiua3li2hHaZc0K74mRtPK0P1mSsrv7YKyFPKfhOfMrFiIY6pNIwKT7lx9nk
         9kWuPTSQuNpWgWxeutOsr8tlH3QRupRsHol+PVSTQSfbFirZLmd6ROLUZzdivRCSUeeZ
         XH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+BnZTXdpODaLZrkJCZ0Kk78XEvL6jEYXh84gw/7MXns=;
        b=VSOILqOtuslImfFmia0bXmKFpWPWukxKMJKo31g5v41d8+5aV+KIwzA5RdRcCS47Rl
         GBMYtIpB0BaLTCXTkfAturBSg0fkVwT9Ve0Cs2OyXxgqcDwXmbq84FZ5IL6qCGC6G9r9
         pz3phZWVhAR+fUWF7ZQkBqlp+oERN/mbXt9r50ytusl/ydsDZXRC3bFUjFulkKIrOEZu
         nsdHBg7K7fDf5J8eCgCl4dIeoRttGirpXI1RS8eCajbEmQlFITjr6zAjy2z+e0mRFWwF
         DsfqXyZ9oXyVA1wJC9HyRjjc0xS/LwW4kHK4IjXpajyepdtRnns8OLVqTDyhcI60cGL2
         z0Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zooqHr37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w65si1524472ybg.452.2020.06.17.21.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zooqHr37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmXo-0003wi-US
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBV-00006y-QC
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBU-0002w0-2D
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id d6so2078621pjs.3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BnZTXdpODaLZrkJCZ0Kk78XEvL6jEYXh84gw/7MXns=;
 b=zooqHr37d3dgq72OAAPoLM7+SQOwlYQPFk7LMcRscbWHELI2AE5duwHy8qr5hJsqZv
 8Qa6bAQbalPEUrVEeEc9X+XY520i2YTju1xcb7gjfHLyBgQhNfIiEiUti3kNTTSwY37s
 eJ2ub+1NTjFJZdP5CnpR79Y537JsHKkXiB3VGglEmu4BOAcmzF5fPUulGc/WzHWoCm60
 JhJg22/f1NuPKghSQ5wzF6BHOCP4Uc9S+3+iGR91PBL1Y/89OAjagTe3fq03Z8czTr+D
 G4rnUQUMRM6X5ZpAm6+u9JMUXeBBPWeLHvtKvLpUjZxQUPZ8G2rsnLtwkUzjF4E0sbac
 Uk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+BnZTXdpODaLZrkJCZ0Kk78XEvL6jEYXh84gw/7MXns=;
 b=ER+0YPU8+dbPgETJSV0pqUa7dlUp7REVr21Zbs9z3bDp6EsBoNGeX2E9R7S4q6j6pJ
 RXJrDVtfB32JJ/+u5SprxHThLRa1+7p5JCTL8gRUUVAXt0fWRoU9WPqgG4+J+QXpgB8f
 BwT4Pqp9VzObklnAmsHe9hkzHWNNWjPcyntkUwbvUT6Or9KKX9QREZ5+s1tFxqezu4Qa
 fpVQt0UAnuomrxvF9TTQEhNozrmKFOps1nQ1OD2yaFr5PPleeYTLX7vcK5WAB+39bJr9
 0/3Odqfs0cFZtp5YCvOZQFL88kdqvHWv8BIDFhG2xml6zzh46jJsKzDxGMvp7LOF5RcX
 Drpg==
X-Gm-Message-State: AOAM532VVhemAd9q0peJIbwZjJHhiNhYKjRXmggm5nQalfSxpzgZsR5+
 O67e/QZpNvQM/UcwoKwDRCOP+JlLuX8=
X-Received: by 2002:a17:902:c404:: with SMTP id
 k4mr1954524plk.99.1592454590859; 
 Wed, 17 Jun 2020 21:29:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 046/100] target/arm: Implement SVE2 WHILERW, WHILEWR
Date: Wed, 17 Jun 2020 21:25:50 -0700
Message-Id: <20200618042644.1685561-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z3nBKvYUPT6w

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix decodetree typo
---
 target/arm/sve.decode      |  3 ++
 target/arm/translate-sve.c | 62 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b7038f9f57..19d503e2f4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -702,6 +702,9 @@ CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
+# SVE2 pointer conflict compare
+WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dc6f39b5bb..97e26c8ff5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3227,6 +3227,68 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     return true;
 }
 
+static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
+{
+    TCGv_i64 op0, op1, diff, t1, tmax;
+    TCGv_i32 t2, t3;
+    TCGv_ptr ptr;
+    unsigned desc, vsz = vec_full_reg_size(s);
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    op0 = read_cpu_reg(s, a->rn, 1);
+    op1 = read_cpu_reg(s, a->rm, 1);
+
+    tmax = tcg_const_i64(vsz);
+    diff = tcg_temp_new_i64();
+
+    if (a->rw) {
+        /* WHILERW */
+        /* diff = abs(op1 - op0), noting that op0/1 are unsigned. */
+        t1 = tcg_temp_new_i64();
+        tcg_gen_sub_i64(diff, op0, op1);
+        tcg_gen_sub_i64(t1, op1, op0);
+        tcg_gen_movcond_i64(TCG_COND_LTU, diff, op0, op1, diff, t1);
+        tcg_temp_free_i64(t1);
+        /* If op1 == op0, diff == 0, and the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
+    } else {
+        /* WHILEWR */
+        tcg_gen_sub_i64(diff, op1, op0);
+        /* If op0 >= op1, diff <= 0, the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
+    }
+
+    /* Bound to the maximum.  */
+    tcg_gen_umin_i64(diff, diff, tmax);
+    tcg_temp_free_i64(tmax);
+
+    /* Since we're bounded, pass as a 32-bit type.  */
+    t2 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t2, diff);
+    tcg_temp_free_i64(diff);
+
+    desc = (vsz / 8) - 2;
+    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    t3 = tcg_const_i32(desc);
+
+    ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
+
+    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    do_pred_flags(t2);
+
+    tcg_temp_free_ptr(ptr);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    return true;
+}
+
 /*
  *** SVE Integer Wide Immediate - Unpredicated Group
  */
-- 
2.25.1

