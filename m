Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3712402lfa;
        Mon, 7 Jun 2021 10:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1frh8QmmrXCvuRf3zmT6yz6vBAzVzfdxlK2b96E3DvMqEnDOH1sxQT7hBZ0tDePA4eEWE
X-Received: by 2002:a92:9411:: with SMTP id c17mr16813987ili.264.1623088198200;
        Mon, 07 Jun 2021 10:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623088198; cv=none;
        d=google.com; s=arc-20160816;
        b=CvqWdL8pGKgFjgK+5+xlg+rS21A1Un6db3ix3IE2+GwNpqrp6JUILOvllv4UFkoFbR
         KGoSpDYLPT9gnl4tkkT4LOaeMj42PRFSzADhcYy/lKVMxlpzQzgFJ0sqtfSI/9b+MwbJ
         v4DftcUP9/+qFp9d9TzQJt5PbjVC09x3P3jPe1vCfnOwjpF3/Meb7NureyASC2fIGmyP
         Q+pFHWjcSWozCB6PMc1jV6J1L/hkWXPcG2FfoXjooqTHES+SlAAbrxry1mxExpGVTpRz
         1+VeXxRzwLOC35UBSRiEC+E+/ocaPF8aSct4H6Btd0evRB21ZHNftm3DN3kckYThhxTX
         FkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/0Pzr5dolqTpGYbgOUV73R4nwkTVq7BcD7SErgBnXGg=;
        b=yEhHl0JC0kbX/Us2z+nss0pArzVhXPC7+QiKzWEj2M9ER4a512ez1zrHlg6PQvxpss
         jVo98HdEY951adAfa7Yp7n2iQs+CO8SHTtKYEsog8VMRSfurzJ/K++My5w2IxECOiH7n
         mmGnM0+Yo4adoVbeNgMLfJlAvTJ7VQ7HQlHZt/z0YYS7oZjJXzs93ItUQzoSQ3qKMFV7
         3UITBbwax6HhSUDhRXAI/jYXzXQtcxehb1lZuoKDqBuwAPHDdz831WMl+YaYGUmkVRln
         duoiuM1NvaNMnP1h2X1hTYzQ8y/Ysv2jyNmxp2Rt4jSSpjf+VYxB+bvi/qxVXBHPNs2L
         eDMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sUELHhYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si13717040ilg.11.2021.06.07.10.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sUELHhYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJNt-0001MX-GB
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbX-0000X7-AZ
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 13:00:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIah-00088Z-El
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso103418wmh.4
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0Pzr5dolqTpGYbgOUV73R4nwkTVq7BcD7SErgBnXGg=;
 b=sUELHhYXxxlGEkGj12vzr+h9UhAAxSBmYhjFWjWCoti6RfcJ7CexgMcLtLhiHP2rfQ
 bAWb5KDnfsDJQZ7KADXj+cfnjJrszLj4YpTcaonNTd5eURxc6w1NBt03Erx3zVUAIFlu
 UqziNBArl4D80NKU0mk49jgptJwudBPhVK1vGYQKamivLGs5QiMfnRrsreKlQolToP/c
 UAXSRQfatvfjgKDjEDWikH/j6aWjCpY41pMOjd4mlcfoqfvz+gHLl6BHOFrq+fW4efj1
 PSxVeZhucscfoj8ephq7LWP9+WDxzplEGcYqPHuzPku/qRoPSSocVcXEWgOp28oSTrHJ
 ztPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0Pzr5dolqTpGYbgOUV73R4nwkTVq7BcD7SErgBnXGg=;
 b=hEIP5VGozt6LRdgZd2Y5nUynTF11r2/BGSYXven0yCcF/C2xNnXPhhAFsDYSrfvS6m
 sYngL4bSPBD6TpGqgZlHR1MToMD444SKc+YN+KXDUOMYhfYtt9kHCr/4pJgJ+nyR65sT
 YDwpoQELcsE8CcJVx64QiwbCcSoW2zJYnPY6VYyvH/O9G6gG+CeGEosD1mjfTlhwxA4I
 44UOWELcw6xV1KzDn0edDToOw7sGrCfFit52+HHfoa3o47m47XrECPK7z1NGz9qy4iDm
 o4qKT3lZ6MHJYC4pu6O8zPdsghPAlS/FRhToE7NNg/J6c3Of5vNcCpF7WJdflw0gH4SM
 0QkA==
X-Gm-Message-State: AOAM530QFQJn0lU/n844EtuZlJJzF8YF3zT6jacWDu5DNCh1VvlbhJJb
 JeuzvOmmpVqbQ+BuR+QAMpBDqkWFN2oomy50
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr13195257wmk.41.1623085146173; 
 Mon, 07 Jun 2021 09:59:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 54/55] target/arm: Implement MVE VADDV
Date: Mon,  7 Jun 2021 17:58:20 +0100
Message-Id: <20210607165821.9892-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yMHu3hBcg4oJ

Implement the MVE VADDV insn, which performs an addition
across vector lanes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  7 ++++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 24 +++++++++++++++++++
 target/arm/translate-mve.c | 48 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 3f056e67871..c1ef44d5927 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -348,3 +348,10 @@ DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_3(mve_vaddvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvuh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvsw, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 23ae12b7a38..bfbf8cf4252 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -253,6 +253,8 @@ VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+# Vector add across vector
+VADDV            111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
 
 # Predicate operations
 %mask_22_13      22:1 13:3
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3477d2bb191..191eb3f58aa 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1317,3 +1317,27 @@ DO_LDAVH(vrmlaldavhuw, 4, uint32_t, H4, false, int128_add, int128_add, int128_ma
 
 DO_LDAVH(vrmlsldavhsw, 4, int32_t, H4, false, int128_add, int128_sub, int128_makes64)
 DO_LDAVH(vrmlsldavhxsw, 4, int32_t, H4, true, int128_add, int128_sub, int128_makes64)
+
+/* Vector add across vector */
+#define DO_VADDV(OP, ESIZE, TYPE, H)                            \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint32_t ra)                \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                ra += m[H(e)];                                  \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+DO_VADDV(vaddvsb, 1, uint8_t, H1)
+DO_VADDV(vaddvsh, 2, uint16_t, H2)
+DO_VADDV(vaddvsw, 4, uint32_t, H4)
+DO_VADDV(vaddvub, 1, uint8_t, H1)
+DO_VADDV(vaddvuh, 2, uint16_t, H2)
+DO_VADDV(vaddvuw, 4, uint32_t, H4)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b2020bd90b1..1794c50d0e8 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -34,6 +34,7 @@ typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenADCFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -815,3 +816,50 @@ static bool trans_VSBC(DisasContext *s, arg_vadc *a)
 {
     return do_vadc(s, a, gen_helper_mve_vsbc, FPCR_C);
 }
+
+static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
+{
+    /* VADDV: vector add across vector */
+    MVEGenVADDVFn *fns[4][2] = {
+        { gen_helper_mve_vaddvsb, gen_helper_mve_vaddvub },
+        { gen_helper_mve_vaddvsh, gen_helper_mve_vaddvuh },
+        { gen_helper_mve_vaddvsw, gen_helper_mve_vaddvuw },
+        { NULL, NULL }
+    };
+    TCGv_ptr qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (a->size == 3) {
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * This insn is subject to beat-wise execution. Partial execution
+     * of an A=0 (no-accumulate) insn which does not execute the first
+     * beat must start with the current value of Rda, not zero.
+     */
+    if (a->a || mve_skip_first_beat(s)) {
+        /* Accumulate input from Rda */
+        rda = load_reg(s, a->rda);
+    } else {
+        /* Accumulate starting at zero */
+        rda = tcg_const_i32(0);
+    }
+
+    qm = mve_qreg_ptr(a->qm);
+    fns[a->size][a->u](rda, cpu_env, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qm);
+
+    mve_update_eci(s);
+    return true;
+}
-- 
2.20.1

