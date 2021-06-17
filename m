Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp501260lff;
        Thu, 17 Jun 2021 05:41:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGSQ0eoM40c8MoxXD2UjBiv+lq30cyOx1JBK+nYSuTw02HDv2lC97Ut+QqyHmcu9/PTKFq
X-Received: by 2002:ac5:c2d6:: with SMTP id i22mr3734573vkk.16.1623933686004;
        Thu, 17 Jun 2021 05:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933686; cv=none;
        d=google.com; s=arc-20160816;
        b=ksnHqy3Vh4Q1r1UuJojoDJ6Ao8JfPleIriADm0ESrBIMBntznxDhC33V3r/3ENkOAy
         nbugE1t+QYGZ711HOkeUDQHKLCZND8VsgTKJQiBFwll9PVQfkOSHVzvKPTZQkM+GnvIn
         /WxCcDJLyM3GWPa34It3BOJLYGVa6sT0Rv1mVpZobUuyGyIqIhclaQcMA8aMpmH4nb8M
         HExPivV+ZRTwJSC5OTr+W0L7Q0w6eVCcRL3cCwErxrnBJapEnpt6V9pFR1NWzzThd2hW
         8UTC4+ZTn7ML4Po3BaMu/Jk1c36iYqQ5nkiGVrJDbV4joKl3+oQi5VRQja7uC3DbMKj3
         JFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TRCNta/ZGiMUBwTnEcyH9fzFL8nCGVrrWoZdF5wZOhY=;
        b=lhFRAfxlgUsE9ppzv9F9ChXA5sNeaRJaHcei7JXflGodntAokmzSozNOIoZit+HlBx
         1JTeMB5Ay8LHeFID8BJ6l2Bgam8g2anKhEHSlZRbaqmqYNiioPA5e4a17Ybgc5i4sleM
         6rMR+hRq5J88Zofa+jSvK8oa0jnHJ94i2bfyLVGuBjeSPW5JnhAE2/gdyqIQOMu3YZsA
         GdJIoSZ/vIglsRR/c3LgnruAqQWK+vjdO6Z0RqDWX4NeUnHBCzLXT8CYeK+fBt5QpbPz
         LR/fl0BkOCaHOhuiiPLBwFOzp/oe+kNPguWdrgDreFQ82AW27s9Dd8zZ/e1Ca0nOpPgI
         PIdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lm4eQwuz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si3962303vsb.62.2021.06.17.05.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lm4eQwuz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrKn-0007OE-8J
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxI-0002Bn-UE
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx6-0007C6-RD
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f2so6507522wri.11
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRCNta/ZGiMUBwTnEcyH9fzFL8nCGVrrWoZdF5wZOhY=;
 b=Lm4eQwuzPtYdWJ39QzfkMN8i+d1MHAz+11sfHkvD/93oDoirV165tlI7c++tsHbGpw
 R9Hebz25iR5Hv1hJ1cUKvtLVmQm1WqoTo6EwjSljw+2Jv3rieHxiDDPHYq74cDtPsLWO
 JfrqpWp5GjmYKMhgaIB8pWuGAqjzuRqFIngsX7nIzxY7uKxtlkY/1Zpef+gsCfRKDv2z
 HwjTQKj/OZZlZ1TlKXBW6kI1wddaA9N4J8X7o3kJztYzJaj5OtprJbo42UWEv8OTgM7E
 gGuRAu01UVsTy6RTsmLHctvavLxf6IcMntMDh0kjBGrI9NsFXWXz5s/9YN7504VhWZmH
 jvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRCNta/ZGiMUBwTnEcyH9fzFL8nCGVrrWoZdF5wZOhY=;
 b=ejknGRqInGIpZ4uAl7JutAtzqHixZi/2gX+ILPlgQi/KbksWyVdy/DLRjTsReea7pZ
 nm/cyl8OiliSA8Rx/zluucz5vg+ggwjbrvSH1B8Je85f15pqaYvrpLQZd7Zmsw3sIYHA
 VMm7Oe9QAb6Jm3lNRV8uyWdEj4Lc8rnCNIobwbtKpA7p223snUEmnjHgeASGlrgbq/H/
 1usLugO6cREomUsJHVnTBwomsCaAk2MCEF3ner+CQOPdyXTzcvsGulD5/MHAjT3pgpBz
 y5OVBHnvdZ6DwLiJGxr3QULQxvfQlFj4I0x11FyM9isiwlAV0SjBDNit0VZhPEpHkytN
 6X9g==
X-Gm-Message-State: AOAM5327bW4QTAHoJaFAb+5eNB+U0CETMIfINN+TwHDLsn7IEMeq2UVI
 g+ryGPZJ480KNS41bYYX3cJB3k4Tosa/bg==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr5189513wrz.339.1623932215399; 
 Thu, 17 Jun 2021 05:16:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 32/44] target/arm: Implement MVE VQSHL (vector)
Date: Thu, 17 Jun 2021 13:16:16 +0100
Message-Id: <20210617121628.20116-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9UVHCjyLhL0c

Implement the MVE VQSHL insn (encoding T4, which is the
vector-shift-by-vector version).

The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      | 12 ++++++++++++
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 56 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 93847fc04ad..1c5626bb726 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -169,6 +169,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 80fa647c08f..2c37e265765 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -40,6 +40,15 @@
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
+# The _rev suffix indicates that Vn and Vm are reversed. This is
+# the case for shifts. In the Arm ARM these insns are documented
+# with the Vm and Vn fields in their usual places, but in the
+# assembly the operands are listed "backwards", ie in the order
+# Qd, Qm, Qn where other insns use Qd, Qn, Qm. For QEMU we choose
+# to consider Vm and Vn as being in different fields in the insn.
+# This gives us consistency with A64 and Neon.
+@2op_rev .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qn qn=%qm
+
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 @2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
@@ -121,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
+VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bba3c1c1ee3..5175684b232 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -404,6 +404,18 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_SAT_U(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, uint8_t, FN)           \
+    DO_2OP_SAT(OP##h, 2, uint16_t, FN)          \
+    DO_2OP_SAT(OP##w, 4, uint32_t, FN)
+
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_SAT_S(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, int8_t, FN)            \
+    DO_2OP_SAT(OP##h, 2, int16_t, FN)           \
+    DO_2OP_SAT(OP##w, 4, int32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -592,6 +604,28 @@ DO_2OP_SAT(vqsubsb, 1, int8_t, DO_SQSUB_B)
 DO_2OP_SAT(vqsubsh, 2, int16_t, DO_SQSUB_H)
 DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
 
+/*
+ * This wrapper fixes up the impedance mismatch between do_sqrshl_bhs()
+ * and friends wanting a uint32_t* sat and our needing a bool*.
+ */
+#define WRAP_QRSHL_HELPER(FN, N, M, ROUND, satp)                        \
+    ({                                                                  \
+        uint32_t su32 = 0;                                              \
+        typeof(N) r = FN(N, (int8_t)(M), sizeof(N) * 8, ROUND, &su32);  \
+        if (su32) {                                                     \
+            *satp = true;                                               \
+        }                                                               \
+        r;                                                              \
+    })
+
+#define DO_SQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
+#define DO_UQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+
+DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
+DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9f59ed591bc..52fef6cd892 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -402,6 +402,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VQSHL_S, vqshls)
+DO_2OP(VQSHL_U, vqshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

