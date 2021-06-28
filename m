Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4035015lfg;
        Mon, 28 Jun 2021 07:07:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD4qIiNL3f3EZWO/oXhpJj6PBUeTsJ4etDqQRIdnfO0uFBmz1Qn7nVFlUpwMBrvzwS2jus
X-Received: by 2002:a17:906:9a4f:: with SMTP id aj15mr23818406ejc.197.1624889241205;
        Mon, 28 Jun 2021 07:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624889241; cv=none;
        d=google.com; s=arc-20160816;
        b=Yyd38AwBnOJSNIecE+YWrGtXnnwzWEqfcExry4QPK8XTwBt2H4A8hYBFndfQdd/Yl/
         JTZ/WJneIM7uXO1EPoGy/pQd41VVySfQ1ns+rghXOtKobd+wLiYemsIxc2968BfP1p2i
         Mq4KJ05dYIUg/qHmzGUEeFbVqsn1O5K38ucacCrgtGh3Xpb1oLFBR5xq3Tw9+0pKuJFt
         pb4jJMDXaiHDsJpEtS47GfD2TcFn0kIUxG+gVUc8QausGgQOeZUh7Pm5bTl8v9xWRduA
         lsCTdt4ssnMI1NohqtB50IO2kpNhlI0lkTfq8CKKMrZj/tlOkkkDbtC51iNp/Hwq+xoa
         4C1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zTzbokmlL/a9x5onjGKZxzSxJ4RnGq1fcyb6+lexhNg=;
        b=q2OhqCU1gC9XvVn9t1S+v7VjXdjlqSGO969epjTJFH2ylqmB3htvYKCT6vYrRZ5/dZ
         QuD02xiMngqs94bI+cUbPAw8UZ35LOwvNd58baj8YG/LHBA3ApTKb0FRvy2gojeHKC3y
         ZZN7ki3NBIcF/W4fBeEYcArgmt2ob2tk1+NwmKcVPDfL/tpRQbHx+EihXKr+zPY00pEu
         H5zklUTPrN7JepsOVJrrgfJnzov+4bLnZdOB45pb+QR2UIc3AwPXyTDGroN/uLR6ihzF
         kO4wMxfWEQSmakLpmjsFbh4/U4ksqDCflgI5a6vq+Rw1PD8uTD+QagnKp1WljLPGidYr
         4HGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XTDU7edG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id yd15si13121681ejb.455.2021.06.28.07.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XTDU7edG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxruy-0000S0-3X
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrn1-0003N9-NV
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:59:09 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-00066B-Q8
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:59:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b3so21385368wrm.6
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zTzbokmlL/a9x5onjGKZxzSxJ4RnGq1fcyb6+lexhNg=;
 b=XTDU7edG5eA6nnf3Khym/1mYIwb2d5pRtXIww4hUCWErf67bhT+2u6K7HtangLa6RR
 BLufyOxFjQDMViyf7Ji7zKmSvvgbnLmTAYeyZ2DzmQdvzu3lagvNmjOZwCnIAZlLLEP2
 R9oflcALlObIS4v2aHLjYI9JPZrx+58buezlu0MBZIAa1u1ErUM4m1p+iQyC8dd3Boxd
 HAI0nX1bfq3z79EaodJLD0bIDeItwceTcwIGorwQNEhClnonrvfwR1l98l2rlnIok1C2
 PAFHZJnL9WXTS3tFdaNDvZs5WaerajpWlLRp5ta6PWfjVBHVgQgfooz0DkqpP7/piJwS
 kf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zTzbokmlL/a9x5onjGKZxzSxJ4RnGq1fcyb6+lexhNg=;
 b=oelRonDMuurkiUB0DOpdYp3kU4q2vH0o0VK1tVnhpDTQBmQwYeeNYvG4dGW/Qqhbrg
 wDGoMKAroL6GWwUl3zPM0L3InRIj6SYzUroc3IdbFpFyo7PTeJjqBatuepF78yFwCAda
 YXR8+Ae7C0dDO/CzEl4GB9YZB4x6Rvi7n1g7PWrW9QmofdWsHYkPuqAzyyVkL6FS0n9k
 4ex3xB5q4d8VoBSbsmW2b62RKd0iBVfpFj+AKe4qebbyJ3H5hX4/XMpXykXJfS6/bbJU
 7s/xfmcYrfZ3IhasapowCkmKAF7GBX6IWA+SN3s0jP+cIW5biwDnNwN46Myg6XQXbm0S
 PHDQ==
X-Gm-Message-State: AOAM5303ug4GzT5WarChZscEO0H4YEtocJgSG0uY+JXLoWtdhhl5fMQG
 KKUEuknlK+6guWEFWlUwjcpIt5ubMLbLEqnb
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr27759314wrc.6.1624888727819; 
 Mon, 28 Jun 2021 06:58:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
Date: Mon, 28 Jun 2021 14:58:32 +0100
Message-Id: <20210628135835.6690-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8hhYYbhjXSsx

The MVE extension to v8.1M includes some new shift instructions which
sit entirely within the non-coprocessor part of the encoding space
and which operate only on general-purpose registers.  They take up
the space which was previously UNPREDICTABLE MOVS and ORRS encodings
with Rm == 13 or 15.

Implement the long shifts by immediate, which perform shifts on a
pair of general-purpose registers treated as a 64-bit quantity, with
an immediate shift count between 1 and 32.

Awkwardly, because the MOVS and ORRS trans functions do not UNDEF for
the Rm==13,15 case, we need to explicitly emit code to UNDEF for the
cases where v8.1M now requires that.  (Trying to change MOVS and ORRS
is too difficult, because the functions that generate the code are
shared between a dozen different kinds of arithmetic or logical
instruction for all A32, T16 and T32 encodings, and for some insns
and some encodings Rm==13,15 are valid.)

We make the helper functions we need for UQSHLL and SQSHLL take
a 32-bit value which the helper casts to int8_t because we'll need
these helpers also for the shift-by-register insns, where the shift
count might be < 0 or > 32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h |  3 ++
 target/arm/translate.h  |  1 +
 target/arm/t32.decode   | 26 ++++++++++++
 target/arm/mve_helper.c | 10 +++++
 target/arm/translate.c  | 90 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index cf5ba860f2f..d3ad7411eb8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -449,3 +449,6 @@ DEF_HELPER_FLAGS_4(mve_vqrshruntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqrshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vshlc, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_sqshll, TCG_CALL_NO_RWG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(mve_uqshll, TCG_CALL_NO_RWG, i64, env, i64, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4b5db937ef3..8e64ee508c8 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -464,6 +464,7 @@ typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);
 typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
+typedef void WideShiftImmFn(TCGv_i64, TCGv_i64, int64_t shift);
 
 /**
  * arm_tbflags_from_tb:
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 0f9326c724b..014725d6ea8 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -48,6 +48,13 @@
 &mcr             !extern cp opc1 crn crm opc2 rt
 &mcrr            !extern cp opc1 crm rt rt2
 
+&mve_shl_ri      rdalo rdahi shim
+
+# rdahi: bits [3:1] from insn, bit 0 is 1
+# rdalo: bits [3:1] from insn, bit 0 is 0
+%rdahi_9 9:3 !function=times_2_plus_1
+%rdalo_17 17:3 !function=times_2
+
 # Data-processing (register)
 
 %imm5_12_6       12:3 6:2
@@ -59,12 +66,31 @@
 @S_xrr_shi       ....... .... .   rn:4 .... .... .. shty:2 rm:4 \
                  &s_rrr_shi shim=%imm5_12_6 s=1 rd=0
 
+@mve_shl_ri      ....... .... . ... . . ... ... . .. .. .... \
+                 &mve_shl_ri shim=%imm5_12_6 rdalo=%rdalo_17 rdahi=%rdahi_9
+
 {
   TST_xrri       1110101 0000 1 .... 0 ... 1111 .... ....     @S_xrr_shi
   AND_rrri       1110101 0000 . .... 0 ... .... .... ....     @s_rrr_shi
 }
 BIC_rrri         1110101 0001 . .... 0 ... .... .... ....     @s_rrr_shi
 {
+  # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
+  # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
+  # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
+  # they explicitly call unallocated_encoding() for cases that must UNDEF
+  # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
+  # the rest fall through (where ORR_rrri and MOV_rxri will end up
+  # handling them as r13 and r15 accesses with the same semantics as A32).
+  LSLL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
+  LSRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
+  ASRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
+
+  UQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
+  URSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
+  SRSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
+  SQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
+
   MOV_rxri       1110101 0010 . 1111 0 ... .... .... ....     @s_rxr_shi
   ORR_rrri       1110101 0010 . .... 0 ... .... .... ....     @s_rrr_shi
 }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 37af94bd9ea..7cd359ec9c2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1525,3 +1525,13 @@ uint32_t HELPER(mve_vshlc)(CPUARMState *env, void *vd, uint32_t rdm,
     mve_advance_vpt(env);
     return rdm;
 }
+
+uint64_t HELPER(mve_sqshll)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_sqrshl_d(n, (int8_t)shift, false, &env->QF);
+}
+
+uint64_t HELPER(mve_uqshll)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_uqrshl_d(n, (int8_t)shift, false, &env->QF);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3cb9996a509..47a151a4ea7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5704,6 +5704,96 @@ static bool trans_MOVT(DisasContext *s, arg_MOVW *a)
     return true;
 }
 
+/*
+ * v8.1M MVE wide-shifts
+ */
+static bool do_mve_shl_ri(DisasContext *s, arg_mve_shl_ri *a,
+                          WideShiftImmFn *fn)
+{
+    TCGv_i64 rda;
+    TCGv_i32 rdalo, rdahi;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        /* Decode falls through to ORR/MOV UNPREDICTABLE handling */
+        return false;
+    }
+    if (a->rdahi == 15) {
+        /* These are a different encoding (SQSHL/SRSHR/UQSHL/URSHR) */
+        return false;
+    }
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !arm_dc_feature(s, ARM_FEATURE_M_MAIN) ||
+        a->rdahi == 13) {
+        /* RdaHi == 13 is UNPREDICTABLE; we choose to UNDEF */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    if (a->shim == 0) {
+        a->shim = 32;
+    }
+
+    rda = tcg_temp_new_i64();
+    rdalo = load_reg(s, a->rdalo);
+    rdahi = load_reg(s, a->rdahi);
+    tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+
+    fn(rda, rda, a->shim);
+
+    tcg_gen_extrl_i64_i32(rdalo, rda);
+    tcg_gen_extrh_i64_i32(rdahi, rda);
+    store_reg(s, a->rdalo, rdalo);
+    store_reg(s, a->rdahi, rdahi);
+    tcg_temp_free_i64(rda);
+
+    return true;
+}
+
+static bool trans_ASRL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, tcg_gen_sari_i64);
+}
+
+static bool trans_LSLL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, tcg_gen_shli_i64);
+}
+
+static bool trans_LSRL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, tcg_gen_shri_i64);
+}
+
+static void gen_mve_sqshll(TCGv_i64 r, TCGv_i64 n, int64_t shift)
+{
+    gen_helper_mve_sqshll(r, cpu_env, n, tcg_constant_i32(shift));
+}
+
+static bool trans_SQSHLL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, gen_mve_sqshll);
+}
+
+static void gen_mve_uqshll(TCGv_i64 r, TCGv_i64 n, int64_t shift)
+{
+    gen_helper_mve_uqshll(r, cpu_env, n, tcg_constant_i32(shift));
+}
+
+static bool trans_UQSHLL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, gen_mve_uqshll);
+}
+
+static bool trans_SRSHRL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, gen_srshr64_i64);
+}
+
+static bool trans_URSHRL_ri(DisasContext *s, arg_mve_shl_ri *a)
+{
+    return do_mve_shl_ri(s, a, gen_urshr64_i64);
+}
+
 /*
  * Multiply and multiply accumulate
  */
-- 
2.20.1

