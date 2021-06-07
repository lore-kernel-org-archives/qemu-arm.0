Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3694859lfa;
        Mon, 7 Jun 2021 10:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy20bZ2LGW+5Ew9Q67vxP1ECjyE0C8y5Gj+I8Wpdr7UfzbFJXpDGMKNIs8pbe9CkTFHSgPl
X-Received: by 2002:aca:5dc6:: with SMTP id r189mr141464oib.164.1623086700983;
        Mon, 07 Jun 2021 10:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086700; cv=none;
        d=google.com; s=arc-20160816;
        b=YKFRcti8v4i1QKsGiUz9VLNWEW4XwBNVKpk2IxTrpt068GaQDIOuvhdQ5AAZLzee9K
         fbpKdecBher0gDegOkQkqN3pZYsOVYzX7KTX7UjmfkpoMpMeltQA5sSS4GRv0sFzEaFe
         2+I3KdJXLNEIvROAUbf5FpejAn7SuEVJGJFAoh7w8Z/6Syxe5/sZfXsnQElGWc5eFj5t
         bMRie/2D+8W6rO3FXkhXajpntfLoMKXOsenbfDyQdyN6auBHgd4GEJPrbh45HC+wgFaz
         ot2QCtMdfpdAoGGIAkXCcQe8zMKsjBnEgproRcERUAl49McxSSHs4KJ32yIyfyEgH3kx
         NvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M/dbcaZ35VQzjGpYiGimMfbRRlmi/LegWLbSCLBzEsU=;
        b=TmEQJ0YCrnm4xZpAgyVZmszeyilSHZxPttH3+XPD74EUXHT7UxZNrFwkanL9rz+Pln
         91KslIDH42KsA/N8HjtLRYgL5KY9IsQm4na5F1N/e+QPdCqQD5Henh/O3vLTtm+PJZUf
         426i7cffH53U1do4/MNex49nDond6DtmGPBe9l0t3zzpFZqA9/f/JtiNfzT5mgbCTgHD
         f2uqvvauZZIJ3F2QIGOu7Tbf060MNu6Nl/ytq+G1Dmym5dTgxbwyw4vgEtHGUZcH1XMl
         NNp9sP9hAqH6zEoeEphzbtGBSPR3yEfq55CUY/TB7A8hKkQjO7P/DjAPgSqUk9elZM15
         MYOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckDAKhYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si4923395otu.119.2021.06.07.10.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckDAKhYS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIzk-0005YH-79
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbA-00087b-Uk
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaZ-00084e-Th
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso103139wmh.4
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/dbcaZ35VQzjGpYiGimMfbRRlmi/LegWLbSCLBzEsU=;
 b=ckDAKhYSQBLEHp+PgdJs+oTxk/8JahS9RzVq58iiAfEgbafTG/AAu5rVYIP+PM0K3z
 bTIs9RbsMWEzqX3+6XnhD3+1iofwA3p1+sY/NmGFRBhz2i2l6HQZT5vcmBIpYw3lWgb5
 vPjHw3M0tPncaccjx3F70zj60/gWLOhK5xqa3nThJD5bkGito2RUjaR6/DEdR4mWtc4k
 PWwZ9otNlRC8a3NtGQJoi6DOFsBSqflzyp6Tv04MLyqfyG9Cl0yam6kQ5EzDtWc8wspc
 6IpMc5nSDnY4Arg7Rn4kqKfWVdAg059H0ELwSnQQm9PvE8BcLkxRN4/LoHA8uCeTqhs3
 GJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/dbcaZ35VQzjGpYiGimMfbRRlmi/LegWLbSCLBzEsU=;
 b=T3xEVFWXo5wbA8PzNWApbb137Hjbm8auVEEE41v9esXEpMkB63IckrBSTt0BsR2UCt
 eZHtrERsMXPX+CwrJpzBAWvNyEotVd3AESE5ZJqfsz8gokd26CP6a78HuKJ43SIQ/IJY
 tLALZT2OT/Y5KOMlr8cdvOUruyrUj/zf5f3UQb09dQ/wSrBpi3Ez1/5ndpbWyIV6OZib
 T+WoxEoV/gGOLEGXVDmFKuccxuQaAloFguLFLyRPulvB/HjU30GDZMO1EwsxHLlQwa2Z
 pGjYF11OBPvPeLsmqE4NJjqfqD36G4EaJ9vJpZIUwBcBChjUjSh6rsB3dwhOd41JCkDJ
 0Vmg==
X-Gm-Message-State: AOAM531qq4ziv2EVMkIQbRJWLaIzOj4GejX23Ev+WUkJv1osD77MXANd
 JTvivMOneNzPiPZl3WX6xi/JeYJ21LU3UHpU
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr18271551wmq.42.1623085137502; 
 Mon, 07 Jun 2021 09:58:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/55] target/arm: Implement MVE VQSHL (vector)
Date: Mon,  7 Jun 2021 17:58:09 +0100
Message-Id: <20210607165821.9892-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: SCyUe5iXoZA/

Implement the MVE VQSHL insn (encoding T4, which is the
vector-shift-by-vector version).

The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 +++++
 target/arm/mve.decode      | 12 +++++++
 target/arm/mve_helper.c    | 73 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 95 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9801a39a984..352b6a46a5e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -171,6 +171,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index d3562f80026..7ac41cb1460 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -376,6 +376,18 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_SAT_U(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, uint8_t, H1, FN)       \
+    DO_2OP_SAT(OP##h, 2, uint16_t, H2, FN)      \
+    DO_2OP_SAT(OP##w, 4, uint32_t, H4, FN)
+
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_SAT_S(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, int8_t, H1, FN)        \
+    DO_2OP_SAT(OP##h, 2, int16_t, H2, FN)       \
+    DO_2OP_SAT(OP##w, 4, int32_t, H4, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -564,6 +576,67 @@ DO_2OP_SAT(vqsubsb, 1, int8_t, H1, DO_SQSUB_B)
 DO_2OP_SAT(vqsubsh, 2, int16_t, H2, DO_SQSUB_H)
 DO_2OP_SAT(vqsubsw, 4, int32_t, H4, DO_SQSUB_W)
 
+#define DO_SQSHL_OP(src1, src2, satp)                           \
+    ({                                                          \
+        int8_t tmp;                                             \
+        typeof(src1) dest;                                      \
+        tmp = (int8_t)src2;                                     \
+        if (tmp >= (ssize_t)sizeof(src1) * 8) {                 \
+            if (src1) {                                         \
+                *satp = true;                                   \
+                dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
+                if (src1 > 0) {                                 \
+                    dest--;                                     \
+                }                                               \
+            } else {                                            \
+                dest = src1;                                    \
+            }                                                   \
+        } else if (tmp <= -(ssize_t)sizeof(src1) * 8) {         \
+            dest = src1 >> 31;                                  \
+        } else if (tmp < 0) {                                   \
+            dest = src1 >> -tmp;                                \
+        } else {                                                \
+            dest = src1 << tmp;                                 \
+            if ((dest >> tmp) != src1) {                        \
+                *satp = true;                                   \
+                dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
+                if (src1 > 0) {                                 \
+                    dest--;                                     \
+                }                                               \
+            }                                                   \
+        }                                                       \
+        dest;                                                   \
+    })
+
+#define DO_UQSHL_OP(src1, src2, satp)                   \
+    ({                                                  \
+        int8_t tmp;                                     \
+        typeof(src1) dest;                              \
+        tmp = (int8_t)src2;                             \
+        if (tmp >= (ssize_t)sizeof(src1) * 8) {         \
+            if (src1) {                                 \
+                *satp = true;                           \
+                dest = ~0;                              \
+            } else {                                    \
+                dest = 0;                               \
+            }                                           \
+        } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
+            dest = 0;                                   \
+        } else if (tmp < 0) {                           \
+            dest = src1 >> -tmp;                        \
+        } else {                                        \
+            dest = src1 << tmp;                         \
+            if ((dest >> tmp) != src1) {                \
+                *satp = true;                           \
+                dest = ~0;                              \
+            }                                           \
+        }                                               \
+        dest;                                           \
+    })
+
+DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
+DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 957e7e48fab..998f47fb94e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -421,6 +421,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VQSHL_S, vqshls)
+DO_2OP(VQSHL_U, vqshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

