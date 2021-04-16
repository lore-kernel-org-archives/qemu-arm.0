Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp726325lfr;
        Fri, 16 Apr 2021 14:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztSfIzW8EUkPZgVtDa8lnH5/MbGWtk2zezfgjipDqUn0MyeSseMM3WZETDToRHEynDhvgG
X-Received: by 2002:a4a:d29c:: with SMTP id h28mr4782940oos.14.1618607027005;
        Fri, 16 Apr 2021 14:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607027; cv=none;
        d=google.com; s=arc-20160816;
        b=SMYIQkIMQihal2U19lOh1vBQuXqaRrN00wvR1MhsixUgH4armYvxr5twJwC5vTp7k2
         t1wF55NEpI9m82SsaJQ2XIvUQWlKe+BtDG/VFXIf6UO/UFuJ/ElbSAUzRPJQFXjzlpEH
         Xf311BuwjlQdlUkA6jq/TB/mb1jiIzkaCONy8XoSF83UObR6ktBVS/iVSEoNKzfkvb43
         jkY8MkEZbmwPMD06QXla+ywfE/SSHiEPLFkhH+CtdZQskosaMFpPX95fN3uFKFuZM01Z
         j3Mc1xE+Qx6CxX2RZwi/CoEWGswE5XMnZOI9w4ydjZCuogwcfc+QCMnleSSP+3ANFCvE
         h2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CQ6txFH7Dtop6I+Akap+iOzHMzqCTj0Z29F/hci/3rc=;
        b=uEE0bH/V3+28YmyuITTH8KWpU1BRJfFpXCBK4Ac1nNd5qCISv0zDbwkZ0amtikVUaS
         0HXbylSUMADHs2tvuHXnh0GZgNpBdhyooJ9gaSM1gHhqBEnMx4HfHITm47Xz7jGNtH3Z
         MjfjcoWCU1yuXWawCfjwJgdMLBMBJbjhCkvHmz9i5lVQ2yYDZwdnGwP/8scNFVgfLzfG
         DCULKcbkZcoqS8h0GLyPAW4po3y/R0aMHQOZq5jpZt2eu/6IDoOjj5Tzuq7m1EdRLyeP
         BH3o1My/2JmLicY+TYlrcbefOFCjGT5kE4mLn78dKyMx7+EqXKJlRieQNGZfC17nFtPI
         ZxVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgPh8iLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21si7165379ote.162.2021.04.16.14.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgPh8iLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVcw-0004eA-53
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc1-0003r3-BU
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:49 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVbz-0000yP-JN
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:49 -0400
Received: by mail-pl1-x633.google.com with SMTP id p16so10675642plf.12
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQ6txFH7Dtop6I+Akap+iOzHMzqCTj0Z29F/hci/3rc=;
 b=qgPh8iLVtnRWwesx6ySNQerMYz4pBHPue3TwVKQ5YeWHDRQpnNaHoFDMfISP/vFwcQ
 u7dPfGkoHXOwb+MihXshDKLRISTP90GQLy8ypShUPv1E2uRVdAOdVeuGp2TIPMDsCFrc
 kw3y4aslHnm5fC899Wl9YPcXHWncRGFY8y44+FLIGUos+kNNBxS5A9nvq3hrXbi/aiNB
 aF9ILlseACukR9HL7EVzPCBmFY3yspPrxHzgfvbK9oUg9bw+dCs0vd5j5WU4dEgwShFe
 3l7lDJ9EeJaUnBLcOQzLhHVJcux0YbJOEhndI53pbz2sdyZx/LqxVaYxm47Gw0vSmMEE
 P4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQ6txFH7Dtop6I+Akap+iOzHMzqCTj0Z29F/hci/3rc=;
 b=rPVb5RVWfmk9iymjBruFPZt2rMx9bui7qPflXesFdLxF5/FxgrGsY8U+TiKr2Awk1g
 tJpEIjqWvmw4c/jPUyEhgLAp9VqL0K3fhsaAY8WvTJV5dPREZ+MC91+ZjvSHLS9q2B1L
 fglyvc3Abg8nab7cpsFFLChO2h7+gJC9Z46GX7g+eq1sAKZjYY9Ob8okLRiR2HqPMiQF
 Ac/jGERmwb2tytXYVpwrvLzq5PMZL0n3IeS2bFcxPXUSPerr6lLohOcj3WqP8e1FTySP
 BxNpu8Z3Xaah+wNq8v+0CNAlXSk5uaCQhNC69hJU3rvLznllttTghRtNjkQjEgmrFGpE
 VkGQ==
X-Gm-Message-State: AOAM532Y+jNF+UBpfDl0PpzhZdTfMl3oiURlrBOfLopB6kIkDIHQm23a
 YMLjuLAWhZJTwWlU0qVnzKoZIg==
X-Received: by 2002:a17:90a:6b84:: with SMTP id
 w4mr11570813pjj.134.1618606966319; 
 Fri, 16 Apr 2021 14:02:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/81] target/arm: Implement SVE2 integer pairwise add and
 accumulate long
Date: Fri, 16 Apr 2021 14:01:22 -0700
Message-Id: <20210416210240.1591291-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: Dr0GE7KYi+uo

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

