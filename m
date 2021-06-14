Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2082752lff;
        Mon, 14 Jun 2021 08:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYbEh/KjHVntVqM2UkwcatzmH4nDBsKipCn8ryrqmii3OkAIaIyYd9p9AgV0ZZpTcXcFQq
X-Received: by 2002:a9f:204e:: with SMTP id 72mr2000955uam.110.1623685183998;
        Mon, 14 Jun 2021 08:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685183; cv=none;
        d=google.com; s=arc-20160816;
        b=Weuz7vE9aHgV0W7cKCL4e7N+TQh9erjrZcwda5IJzsCMgQ52dT2H/Ku3tP0+2O59VV
         86s/TQOtQWk1wYP1THlnYhMSgbj1+8nDJHZST/IcxdroJvNdfqV97cXPjJeaJwjSX8F0
         +XHRM9lJjvsi7FYTUMH1BBRsTtDX5jFzOoATuyBL9Dke8Pdme85qRox8bTAv6/DyM4I9
         5oIHgOxdUyVQh8zTZSQlq0drV3JOfZ38GC6d0njxGot4PyTGhuVlVehZJK2FRPZcQWAV
         A87hpbRyWBd7yHVf6ldypDOAw/pADJ2YeCU+apWlsQCIi8WZscQX8ShfiAaMHLU6ZFWA
         zFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6RXbJA8xT9tL9/5lO79mPbtL37lFzAFJJ4cma6UlHcs=;
        b=O7hnBHI4RgbfERWCHW3yxF5Tr0PypKgeVJSWca1rgbJErYMvdW5Sn2YBA/KJ1TjwbS
         3gUvZjmAQ6xGjPGRYw62EoqujeORJoayH5vycotK4nFth0hROYD/oGSjCKAcxijU7FsZ
         6N40y1BodC4JbK1IpBJnAIuzxoblz6FhumjmLQZyvPtABHA3TTUMMpk7hjOnAxCqwHa7
         ERswZfC+6yfxPHdn36j7sL7QuGlKQATiGLlmeDvCd0Lb+pmgfP68Htd3IBXfZRnATfwR
         hHtvKl7b98NU6+ul4dBTfAa4au/bV66w8xomyZTco/0CeTLq280WkqCSVvXBQT20VbVH
         Yo3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLKC2rrl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22si7262858ual.93.2021.06.14.08.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLKC2rrl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsogh-0003xz-8W
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFE-0002kc-DA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEq-0000el-0u
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id n7so8775903wri.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RXbJA8xT9tL9/5lO79mPbtL37lFzAFJJ4cma6UlHcs=;
 b=XLKC2rrlgwRnJc0pbKH1wqPpITewOAYik6f3rp6naln1tCmf4BKjQRrjuQtfJstnDM
 eHCbAIHw2CT/pgKGl4XhpzZQwdWd04lb5526P1+rLv8SvnY09Xg/KYn/xZHqUrByCEMR
 9/Q2n08Zm9xP/St23gFaVh7roc2Om6AhpprEv9eowiv0vvy7JG4lbIQ/5xbjW0AgnpPa
 EsfU+92XMEXKROuLt3RMUrV81YQjsY/jhMuRrGXRURCKIouD/s3vRoNEGWqxYltLharS
 YNJmjy5Hrd5trxKTHGjs8y2NEjnFsHssfe3CX+uLXdKWAB6G9oRDe2+RjJFLFPrOQmyF
 nmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RXbJA8xT9tL9/5lO79mPbtL37lFzAFJJ4cma6UlHcs=;
 b=s9UTorDQiHVDmsAB93PqBCNwYSQtJFwlD0eh0bpmq4thw/G/TwKMAIAUOaPux8UlYD
 L4DyOMOL4zLVYn+JwRULsaxizRZXQIchhv8vqs+cVpxEBK7vfNkqMTa9bew2rNTqx9J6
 w1TalZSvq/0+llNsNHqlAfH//h7Z9brrn8IfIBB2o4ydQIqRICOZJU1iXPJrMvRe/rlF
 6gdBY6y84Zsnb98ULCM+5/vTbYFmCTDN0RpVr+yDtmVsUXimOc+xXqMp7IeAn96l8GMr
 XmJczgt6cwepaDD1w2gIOFDwAgX69zT3eNUtL6OBAag0y6Lt2SHONgDhp1gDcaKiqWSs
 m/Mw==
X-Gm-Message-State: AOAM530BRmFGNnExUPcVUxdtVBBPnzUXcKv3monb33qeS3rs5j7G+jkI
 m8lyWFzYxy34tXiFuZhLoQgRWg==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr18682599wrm.279.1623683454591; 
 Mon, 14 Jun 2021 08:10:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 54/57] target/arm: Implement MVE VCADD
Date: Mon, 14 Jun 2021 16:10:04 +0100
Message-Id: <20210614151007.4545-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajADJFT8bjb5

Implement the MVE VCADD insn, which performs a complex add with
rotate.  Note that the size=0b11 encoding is VSBC.

The architecture grants some leeway for the "destination and Vm
source overlap" case for the size MO_32 case, but we choose not to
make use of it, instead always calculating all 16 bytes worth of
results before setting the destination register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  9 +++++++--
 target/arm/mve_helper.c    | 29 +++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  7 +++++++
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 459c8eebdd6..b8ad3df9cc8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -251,6 +251,14 @@ DEF_HELPER_FLAGS_4(mve_vadci, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vsbc, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vsbci, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vcadd90b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd90w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 79915f45d71..afe60078649 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -161,9 +161,14 @@ VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
 VADC             1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
-VSBC             1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
 VADCI            1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
-VSBCI            1111 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+
+{
+  VSBC           1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
+  VSBCI          1111 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+  VCADD90        1111 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VCADD270       1111 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+}
 
 # Vector miscellaneous
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4b941f73f05..e2daf34f38e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -604,6 +604,35 @@ void HELPER(mve_vsbci)(CPUARMState *env, void *vd, void *vn, void *vm)
     do_vadc(env, vd, vn, vm, -1, 1, true);
 }
 
+#define DO_VCADD(OP, ESIZE, TYPE, FN0, FN1)                             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE r[16 / ESIZE];                                             \
+        /* Calculate all results first to avoid overwriting inputs */   \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            if (!(e & 1)) {                                             \
+                r[e] = FN0(n[H##ESIZE(e)], m[H##ESIZE(e + 1)]);         \
+            } else {                                                    \
+                r[e] = FN1(n[H##ESIZE(e)], m[H##ESIZE(e - 1)]);         \
+            }                                                           \
+        }                                                               \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], r[e], mask);                     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCADD_ALL(OP, FN0, FN1)              \
+    DO_VCADD(OP##b, 1, int8_t, FN0, FN1)        \
+    DO_VCADD(OP##h, 2, int16_t, FN0, FN1)       \
+    DO_VCADD(OP##w, 4, int32_t, FN0, FN1)
+
+DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
+DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c21f5afe230..c9f5ef73955 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -420,6 +420,13 @@ DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 DO_2OP(VRHADD_S, vrhadds)
 DO_2OP(VRHADD_U, vrhaddu)
+/*
+ * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
+ * so we can reuse the DO_2OP macro. (Our implementation calculates the
+ * "expected" results in this case.)
+ */
+DO_2OP(VCADD90, vcadd90)
+DO_2OP(VCADD270, vcadd270)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1

