Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1264430lfm;
        Wed, 17 Jun 2020 21:35:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypUSAGH6T8Q7xxf1V19YNjx2rLJRGeozcf+ADc1MqXcnhDD49oJLTPwBV+xyMckL6mFZpk
X-Received: by 2002:a25:e41:: with SMTP id 62mr3883046ybo.234.1592454935433;
        Wed, 17 Jun 2020 21:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454935; cv=none;
        d=google.com; s=arc-20160816;
        b=LOGDjzwr7ENZjkjwl1WENMTxT0nC6ioGnEpGYiwk4CDTyhagpz8uAbKSR7cWW2VHxe
         sBqh43wMe9w48hb8sTFbVgNgmTxzSrAzJcTkaiQEfQDs/GnYj4pOI5B0Mfl1YoICnPn8
         gBlEf92aLj8g6S0ron8nl8bMU9wCSaY3i+DUm3Y5p5vKRIxcqS/z2I/pcY/IJenoJXZb
         yMl/q0REFL0TJ4DMFdPRaeNHm38Fqgxd55oOIFmwXlSyu1eLZzXZyWGM9DziyYeWMlDR
         NiB2SYmtAzSVP4jML1BLRIm0aja1PlbGlCLyfdf+vWjTs7bdDVotgBIUxiTQuzIFpFpe
         RaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=32LkJ6MHPv40E02cIoqvc3kXIdecVHLI1j/yM/VScwM=;
        b=B0ZYR9ZRhsYUACVVzzsW+TvvIgs5dSbk+vnQB6fPRpBXDSUkeSskerLLAWm9AlTDZs
         KtUEgyKEbZw15BsgbBVZbnM0hrijvw+LrajeXHXXMtD2ntUBbdvSdMQvcMO2V2EgHcgY
         J8WbCKXiKtDJ2jgy4/xsxggQ+9sFSNrzVgr+J/sHKNmOffGfZ9RASr9u+c6zqUEkb2YT
         0hKtk62bHzUsE0NvxY4HyExiBuU7hCCJWd9JNndqol27YD3AYALrRrOY9DpOi9WPYbIK
         bgzyCMbJ8JN0dLTZXoHxP43+pvDDOAjVyRD1FVwR24e8PQcIIHzackYn146d1igqOvlE
         kldw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bqtJUztX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si1775183ybe.344.2020.06.17.21.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bqtJUztX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmH0-00029c-OX
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9P-0003Jt-J8
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:43 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9N-0002Te-7q
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id y18so1911938plr.4
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32LkJ6MHPv40E02cIoqvc3kXIdecVHLI1j/yM/VScwM=;
 b=bqtJUztXNRLiMbM5xaGpJfC1f4g/kP7AQGJtQPgedQKW73ShjXwSuO4gexE9CK1YoJ
 TyxIryViJwDRw0JkQ0yw63nZU/xRrnJsFg1R8j+STBruR0V33t3U3HS2JagayIfXUmtN
 vWW10l6d9fIA028Osp0sdPKYt+l5501H+ntz7d6iXU9PvG2N9ssAiVUp1Pjp+PIghHpK
 HjcIRFOJIo3VpvNmJZPCIH0GYWZ2ABsb2jhsiyFWZ+w17kOhnP8I4Ialokun6u9hfIIz
 qa/6VMtSHm4JZKcNK8E3IKPzTLN4xvfhAb3FCLoivLD2vl6jNwmD+uhib3I+Mu5yTiJo
 cHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32LkJ6MHPv40E02cIoqvc3kXIdecVHLI1j/yM/VScwM=;
 b=HtYY9ibMZTSqP8Otw0JcNZNOmKmKDGIy4n3gL0m5LdlTCFhqcjtqq2j2kf+Vo/c73r
 wJtcnPgknOHORK2tcfvszbWBoWVsvz82Hb08/n37rCKh66IJP0vA/qBUWAWfkiqDAKWs
 UAXth7Ml8VnaJfkxLrCwWlj9Rs4fj/f8cuEZusXF0NvjJbM/aiuhZX9dDnbCpW6HQ0ZG
 izJvimcw6EF1sAeKTL9XfyV2QdHjwmmT+EhrAk/NGIm/D/i/1cGu1pNXqyEvNtuBWaln
 bZB+d/zbopkgbpJWnuWTcXPovlTSQo99anFg5m0aszaQmnyxQ3kdpH0RoBm3m0Fcz1ZP
 hsTw==
X-Gm-Message-State: AOAM5300GYgo/UWeOoBq6SFykwZe7dZ5UDiPPQSUtgBVSrU9Jfx+gpyj
 7J9jLOz7q8JLIV7H4wTSScbdJw==
X-Received: by 2002:a17:90b:2042:: with SMTP id
 ji2mr2411848pjb.68.1592454459943; 
 Wed, 17 Jun 2020 21:27:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 017/100] target/arm: Implement SVE2 integer pairwise add
 and accumulate long
Date: Wed, 17 Jun 2020 21:25:21 -0700
Message-Id: <20200618042644.1685561-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: FIDTi9463emR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 39 +++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3ccbdde63d..83840168b9 100644
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
index 31f67e0955..15762f836b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1103,3 +1103,8 @@ MUL_zzz         00000100 .. 1 ..... 0110 00 ..... .....  @rd_rn_rm
 SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
+
+### SVE2 Integer - Predicated
+
+SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
+UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8d7a09e6a4..7fa2e9f67c 100644
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
index 850e2fda15..5eac71d849 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5411,3 +5411,42 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
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

