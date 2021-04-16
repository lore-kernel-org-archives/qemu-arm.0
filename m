Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp729230lfr;
        Fri, 16 Apr 2021 14:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/mlMgLhQuQkPZBNNUYI5/WUuIa/ZxrtpPD6S/Bt4h1tKfJrie0KQ5gK9QJk9UMMgdg/zi
X-Received: by 2002:a67:804e:: with SMTP id b75mr8778665vsd.47.1618607305622;
        Fri, 16 Apr 2021 14:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607305; cv=none;
        d=google.com; s=arc-20160816;
        b=Ts9l5AFGchrCJRnO05g58lNsNglCtFNZQXHlWcX9PS0HhwapSMchFQ2qKTTlDgDY/2
         G1TxRyaYUEAom+uMISjnlfZBZdbZs672nBaDSbYIug1k3MR+zPgIykcCRlHQl6GSByL+
         i31MtGPSiiq13K/t3EMPU+zCUqbyKqVpfyTfZPdk8rALazdxkC3J4n8PnROFmKqAp8/b
         qkmJNUgISYfrKpW5uU+q3nbyZKpvn5b0DVs6Ydt/f9p+RRF3UpHVO9fw0BMNLegHE4VG
         owWGN+JDQBxXds7aZfy+2dZnhCXZTTc9J7hPumOdH8qHDyfxlZIlvxxYOdIpuLY96Txe
         +j3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lt6mYuE55+/GmyazdMW6oFsb1RA74ewEaDqJsdcvUwc=;
        b=UfddTFdrZU0aVUKvEqsEYwMynNnom8DBYXs019ortPOvI9ci4pbYmWPp3kq817rs9P
         i7YP0+aI+enDZV7FqrqI7MmyBERHzy4WQmBuLfaKFF4HBYFEgYEw4OfQZG7ZyJ3Tekz8
         MB9S5H90zYgKTao5n5mB9+M+RzP2wlBLfpFF3UB6wYmlvxluGOhdqOd145b2ZSQby0zv
         8vJ6zx02ThUsEBBMdeQG/yIBQPeBs+Tcrl8e5HucS5s9e/OyDrfWSYUjJaa1RCFzyqQv
         GvNudmpj6nUSZcyt35Ujf85NlZOgxZVzm56IrImqO+Jj0B3L4s4K73DEPbD9QulIRJgq
         NRxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iA9OgqXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si3165220uaq.126.2021.04.16.14.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iA9OgqXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVhQ-0002hk-TD
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcA-0004A5-Pb
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc6-00013r-H7
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:58 -0400
Received: by mail-pf1-x435.google.com with SMTP id c17so19145608pfn.6
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lt6mYuE55+/GmyazdMW6oFsb1RA74ewEaDqJsdcvUwc=;
 b=iA9OgqXzJNeqB9IA3uAalVc7jIFHY9dbjHuYUQKfTfvONMiwvO2ls442gqr7pS/pRa
 crmzeLI0PLaKLAffxEcqwVQqyoWkSAnnIbBpxkTtwnUC9e4raeebPM8Ly6ongtWH36Aq
 SAvJC/lHZ5Sw0WAdJlUuTaxClbQPDczibZVtGXmANHnCw9TKRtIpwCOugKplWWmBhkkS
 AP+VgP4yUZLGc0cDrkGHb+6rHA5H4vJERklJGJPyQXUw5uCLotb+kTfBiQ3mHEEIojVV
 z+IIQri12b0BKyJ/YsN6amPfgDRqqNdQnE7T9VEPp7KhcQG1lX3PYN2YDBmdm5nSFVSA
 zi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lt6mYuE55+/GmyazdMW6oFsb1RA74ewEaDqJsdcvUwc=;
 b=iH/KCP9USXUu6izr+PxS/fGTlMgrXFW0Zbx9V9noj3NzwIU5dpA6IFpSFsaZWD6hva
 M0Ku5W2mTAsO8ybbyT5n1tpU+VCfNbOr77AwYbYN5wr8dNxCPeCthuZGqnMnqLHzf2Se
 LsZoiFG0yOzqW0MucQ74nrUos3Ql6rd+IQF4xG7ef4qbI9stLvZQrjQYH8RCn+jaFClN
 78pC2zd+v4C0uoZolYjf7emVpzz29SGR5b0Po9WOa1xGx1g0oBZVOsw/ts+snmuW2GAo
 A3JgDpJpHYqWFEkVB/KwSJHyLwT39w7+5LLUNf5qVPm18mI/eI8HNyUzQAUkI54eVqhN
 N5FQ==
X-Gm-Message-State: AOAM531sc99azFDNSKaDRe/91erAimG76QAt0yGbnzFjAPq/3N8jubc7
 u5hoGeVFJUhDVq+UiSNmhTzlzA==
X-Received: by 2002:aa7:80c9:0:b029:249:cac5:e368 with SMTP id
 a9-20020aa780c90000b0290249cac5e368mr9611291pfn.12.1618606973121; 
 Fri, 16 Apr 2021 14:02:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/81] target/arm: Implement SVE2 integer add/subtract long
Date: Fri, 16 Apr 2021 14:01:29 -0700
Message-Id: <20210416210240.1591291-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZN2Os+Geu5Vg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix select offsets (laurent desnogues).
---
 target/arm/helper-sve.h    | 24 ++++++++++++++++++++
 target/arm/sve.decode      | 19 ++++++++++++++++
 target/arm/sve_helper.c    | 43 +++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 46 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 37461c9927..a81297b387 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1367,6 +1367,30 @@ DEF_HELPER_FLAGS_5(sve_ftmad_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_ftmad_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_saddl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_ssubl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uaddl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_usubl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cd4f73265f..fbfd57b23a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1159,3 +1159,22 @@ SUQADD          01000100 .. 011 100 100 ... ..... .....  @rdn_pg_rm
 USQADD          01000100 .. 011 101 100 ... ..... .....  @rdn_pg_rm
 SQSUB_zpzz      01000100 .. 011 110 100 ... ..... .....  @rdm_pg_rn # SQSUBR
 UQSUB_zpzz      01000100 .. 011 111 100 ... ..... .....  @rdm_pg_rn # UQSUBR
+
+#### SVE2 Widening Integer Arithmetic
+
+## SVE2 integer add/subtract long
+
+SADDLB          01000101 .. 0 ..... 00 0000 ..... .....  @rd_rn_rm
+SADDLT          01000101 .. 0 ..... 00 0001 ..... .....  @rd_rn_rm
+UADDLB          01000101 .. 0 ..... 00 0010 ..... .....  @rd_rn_rm
+UADDLT          01000101 .. 0 ..... 00 0011 ..... .....  @rd_rn_rm
+
+SSUBLB          01000101 .. 0 ..... 00 0100 ..... .....  @rd_rn_rm
+SSUBLT          01000101 .. 0 ..... 00 0101 ..... .....  @rd_rn_rm
+USUBLB          01000101 .. 0 ..... 00 0110 ..... .....  @rd_rn_rm
+USUBLT          01000101 .. 0 ..... 00 0111 ..... .....  @rd_rn_rm
+
+SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
+SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
+UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
+UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 12a2078edb..3d0ee76411 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1113,6 +1113,49 @@ DO_ZZW(sve_lsl_zzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
 #undef DO_ZPZ
 #undef DO_ZPZ_D
 
+/*
+ * Three-operand expander, unpredicated, in which the two inputs are
+ * selected from the top or bottom half of the wide column.
+ */
+#define DO_ZZZ_TB(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    int sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                       \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));                       \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));                       \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm);                            \
+    }                                                                   \
+}
+
+DO_ZZZ_TB(sve2_saddl_h, int16_t, int8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_TB(sve2_saddl_s, int32_t, int16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_TB(sve2_saddl_d, int64_t, int32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_TB(sve2_ssubl_h, int16_t, int8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_TB(sve2_ssubl_s, int32_t, int16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_TB(sve2_ssubl_d, int64_t, int32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_TB(sve2_sabdl_h, int16_t, int8_t, H1_2, H1, DO_ABD)
+DO_ZZZ_TB(sve2_sabdl_s, int32_t, int16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZ_TB(sve2_sabdl_d, int64_t, int32_t,     , H1_4, DO_ABD)
+
+DO_ZZZ_TB(sve2_uaddl_h, uint16_t, uint8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_TB(sve2_uaddl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_TB(sve2_uaddl_d, uint64_t, uint32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_TB(sve2_usubl_h, uint16_t, uint8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_TB(sve2_usubl_s, uint32_t, uint16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_TB(sve2_usubl_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
+DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
+
+#undef DO_ZZZ_TB
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 609d5ae7b7..22983b3b85 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5970,3 +5970,49 @@ DO_SVE2_ZPZZ(SQSUB_zpzz, sqsub)
 DO_SVE2_ZPZZ(UQSUB_zpzz, uqsub)
 DO_SVE2_ZPZZ(SUQADD, suqadd)
 DO_SVE2_ZPZZ(USQADD, usqadd)
+
+/*
+ * SVE2 Widening Integer Arithmetic
+ */
+
+static bool do_sve2_zzw_ool(DisasContext *s, arg_rrr_esz *a,
+                            gen_helper_gvec_3 *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_ZZZ_TB(NAME, name, SEL1, SEL2) \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)               \
+{                                                                       \
+    static gen_helper_gvec_3 * const fns[4] = {                         \
+        NULL,                       gen_helper_sve2_##name##_h,         \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,         \
+    };                                                                  \
+    return do_sve2_zzw_ool(s, a, fns[a->esz], (SEL2 << 1) | SEL1);      \
+}
+
+DO_SVE2_ZZZ_TB(SADDLB, saddl, false, false)
+DO_SVE2_ZZZ_TB(SSUBLB, ssubl, false, false)
+DO_SVE2_ZZZ_TB(SABDLB, sabdl, false, false)
+
+DO_SVE2_ZZZ_TB(UADDLB, uaddl, false, false)
+DO_SVE2_ZZZ_TB(USUBLB, usubl, false, false)
+DO_SVE2_ZZZ_TB(UABDLB, uabdl, false, false)
+
+DO_SVE2_ZZZ_TB(SADDLT, saddl, true, true)
+DO_SVE2_ZZZ_TB(SSUBLT, ssubl, true, true)
+DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
+
+DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
+DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
+DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
-- 
2.25.1

