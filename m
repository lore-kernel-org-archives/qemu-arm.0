Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp466770lfg;
        Fri, 30 Apr 2021 13:26:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQOtxNm0o47WDgwLUKKxCvDhFwpfAJOZ9DMLmKnbuE41dEHP2iECs08nED7M2uoMy9CbOT
X-Received: by 2002:a92:5204:: with SMTP id g4mr5666489ilb.84.1619814405310;
        Fri, 30 Apr 2021 13:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814405; cv=none;
        d=google.com; s=arc-20160816;
        b=xxQeWLlTGcKm/tEw/BcX0PYNXC0e8NFKB5bGmMu3cZg/WDXXIiQ4d8/eGsHn78/dn+
         o1U1BQAz920T/CgeCno1FgznLMTYeQsKy9N3b2KnOj25W2mJo/+Wwx+bmQH/aRjrbjaa
         q0MGjflPXHNRRgrGauZZjqYvuwFcQW4xmjQiNFdEGYy3hpV1gGvCm1CwRzTdmP8lTbLK
         8mQS1gAGdg68lgAhTQQg8ojnLpH5GzQwCkzGRdoIrBDYzm6+H/QX16Gjv2uVI/BSXfYF
         qovvdaOeq9mjH6nj4PLo+ULZFD7FiYwotHipX3nw5R5I8BauEr0vY5mJhOg5LGIVIBDZ
         Z/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CQ6txFH7Dtop6I+Akap+iOzHMzqCTj0Z29F/hci/3rc=;
        b=ETzsqvzL1VF1SSo8q1whTXpiEPusnRAIwZeWxw82ReU3U8wY1L+jzP9ff2mjLFkq8N
         QKyK/Df1hugbHQ5GaNSPVrO/vbJbokY0L5hgA8yLkKEKPAeEZIWWUj30WOE0fMvA0hX4
         qEbo/6r7nmw+V1LcZejapA2twz+4XaIVKnmfV0gWRn6JDGqFbU5WLKyyBmzh9mDRTRUi
         iy/MfaLM7UK5dp2AAtbthLNwaOBxFDsk3m5fa5YCbdB1As+j/V39z0OBy1oNb0uBRyu2
         t/3QhkEdKQKxcyJr4G9fjtNXxlc5w7o1SUvAYWdQs3BTMASYlvzakmEEX9BHJi6n8EZu
         D7mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qClG0qVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si4230952ilu.8.2021.04.30.13.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qClG0qVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZim-00089L-IT
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiM-000855-0U
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiI-0005s4-9M
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:17 -0400
Received: by mail-pj1-x102d.google.com with SMTP id md17so9636546pjb.0
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQ6txFH7Dtop6I+Akap+iOzHMzqCTj0Z29F/hci/3rc=;
 b=qClG0qVS9uY9kIKPeYLlLKbsC/uBNgXpwMK25iC5eaSR7a/ptjyE3LF4Nw/4xH47VE
 wNE4TDA/msd7qosWjiek4rixkgDM8tpG3S0vAcxtxPpyMvWwv/8uLG5kv5yrSSDW4V8C
 0plSGoch41jv9aheM/RBnbpO6hPxSxiQ6SvC6k+5CVl6p4DmUGTXFukYLotmd3N45BLa
 pGLxpGe9hS04nusld+8IN+GOeWxbBkYVcvdyTwYxQbqvl6gbN3S7BMAj9XMi8hneWTqj
 msMtZOkwjmd2ipV8oTssdbnuNcLZj5ldy+ChyLluCn6PpxnxcBMT3WzMgavFh7gnmdh9
 J8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQ6txFH7Dtop6I+Akap+iOzHMzqCTj0Z29F/hci/3rc=;
 b=s8lcM0Z8UVqssISyKccXtNPKfK0cuRpTN0mudh05ErhFEohj95gQ6OuIyqqnXHQENC
 mUcOO4vqEYQiSjzqukZvekIlRLX7u3x9HwhewaJzxherk4sW38ngYixJfUFsi2lcJ6DH
 j/awUkfyMymOlqqcOqTckJ7UGNuTgJVYe/HFUcsIl0+r3xC6WqlazHxHKUP+fsVQk3X2
 GeTYwWfGMq3mZEqmVQyt2e4hMtPzjxfZto9PrRqH4FJlMszq369s9tOriVkoh0LESAvD
 qzZiY65QjKC5Sqr8IwCHxPm0pvhAutA9JlN+kiandA5xw2x8/R1L9I1vhazAdoq4SJ6t
 yGYg==
X-Gm-Message-State: AOAM532A0xww2oqcnZvGFEGRusSZxeu0ncA6o8w/iIhG9x7yoc7a74zS
 51GkMga1WwIzliYw4bnLLc3g2A==
X-Received: by 2002:a17:902:9349:b029:ed:2b9:5a02 with SMTP id
 g9-20020a1709029349b02900ed02b95a02mr7246854plp.54.1619814373032; 
 Fri, 30 Apr 2021 13:26:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/82] target/arm: Implement SVE2 integer pairwise add and
 accumulate long
Date: Fri, 30 Apr 2021 13:24:51 -0700
Message-Id: <20210430202610.1136687-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H88xcoZqhltK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 39 +++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index e4cadd2a65..b2a274b40b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -158,6 +158,20 @@ DEF_HELPER_FLAGS_5(sve_umulh_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_umulh_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sadalp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sadalp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sadalp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 557706cacb..0524c01fcf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1100,3 +1100,8 @@ MUL_zzz         00000100 .. 1 ..... 0110 00 ..... .....  @rd_rn_rm
 SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
+
+### SVE2 Integer - Predicated
+
+SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
+UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c068dfa0d5..42fe315485 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -517,6 +517,50 @@ DO_ZPZZ_D(sve_asr_zpzz_d, int64_t, DO_ASR)
 DO_ZPZZ_D(sve_lsr_zpzz_d, uint64_t, DO_LSR)
 DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
 
+static inline uint16_t do_sadalp_h(uint16_t n, uint16_t m)
+{
+    int8_t n1 = n, n2 = n >> 8;
+    return m + n1 + n2;
+}
+
+static inline uint32_t do_sadalp_s(uint32_t n, uint32_t m)
+{
+    int16_t n1 = n, n2 = n >> 16;
+    return m + n1 + n2;
+}
+
+static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
+{
+    int32_t n1 = n, n2 = n >> 32;
+    return m + n1 + n2;
+}
+
+DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
+DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
+DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
+
+static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
+{
+    uint8_t n1 = n, n2 = n >> 8;
+    return m + n1 + n2;
+}
+
+static inline uint32_t do_uadalp_s(uint32_t n, uint32_t m)
+{
+    uint16_t n1 = n, n2 = n >> 16;
+    return m + n1 + n2;
+}
+
+static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
+{
+    uint32_t n1 = n, n2 = n >> 32;
+    return m + n1 + n2;
+}
+
+DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
+DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
+DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f82d7d96f6..208d9ea7e0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5845,3 +5845,42 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
 }
+
+/*
+ * SVE2 Integer - Predicated
+ */
+
+static bool do_sve2_zpzz_ool(DisasContext *s, arg_rprr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzz_ool(s, a, fn);
+}
+
+static bool trans_SADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[3] = {
+        gen_helper_sve2_sadalp_zpzz_h,
+        gen_helper_sve2_sadalp_zpzz_s,
+        gen_helper_sve2_sadalp_zpzz_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
+}
+
+static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[3] = {
+        gen_helper_sve2_uadalp_zpzz_h,
+        gen_helper_sve2_uadalp_zpzz_s,
+        gen_helper_sve2_uadalp_zpzz_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
+}
-- 
2.25.1

