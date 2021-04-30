Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp472467lfg;
        Fri, 30 Apr 2021 13:35:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjUdV13C6CpsJkLjVUsOfTsOEJoLrn7nOhcgy2b2njqZQmwwrXH/wdc/3CWVI8HrIVI7yO
X-Received: by 2002:a05:6e02:12c9:: with SMTP id i9mr5701616ilm.276.1619814907068;
        Fri, 30 Apr 2021 13:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814907; cv=none;
        d=google.com; s=arc-20160816;
        b=GXFBjsiaj6YGsabJCjPlwGnI4APh4VF94ExZMj5moYkjJ5d2EDIRH4xvyoVMs6vMDV
         uUjdVvZzkL7Gg77KaqGrVsiP8c0YrFXYXTr11+mzTZA1nZp/GukaNwKIKsR2AYG7F9rG
         653V3RX6/33MQdWK8rCSM7JbKg8LnUrbLlVEcHc4SGOe2cIokM26USsDbOHWWmqzRxEQ
         ZhED9nnvIEq3Fs64SplSrkLCiDeXy8DfYgjart7yFlDO9JbqVrEPZ0QdaJW449ycLmqx
         dILZJHQg0dYke4jrO+wSv1KbYxfsoNO85+tqu67TURJR7hY4mwYSYjg6f2zesSweOwrV
         Vd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iA5YdMPlGGiyhjKxfBQbY6+WZzBPtERwoPFsnw8+g+g=;
        b=SXtYW/mX8pnqHGqoo4T26fE/JgiJOSzy1ZVm4HN8agPNhZpBnAPQXPxzISI9fUqbl4
         Ju4kPHJPVrEtuDmYVlBduRFp+gGwUdHXeJf9scyc1XiganLqnJDdf9P2AWgOLc2gSnFg
         EeS6JX7hEN6C8hVBdB75qS1QKnSQmBdJQ6vjhJ6UEWZ1Q0ucYz0VrmqCRDCbY43D2U2B
         cv2HRKR3QvceUZBpKqeEScEqwhr3kv+kSEB5ldpp+SKUofQyMgAznsHTh5gmjxP3VVPF
         spE4hvpecaUUcBWXz+jP/VFYYvPbDdI/qQnRMDIY177O1BJBUD7Zi7fJMOi+N703a6WE
         Gk8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMjG6b4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si2848657jat.119.2021.04.30.13.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMjG6b4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZqs-0000gZ-AZ
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZib-0008Tg-W8
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:34 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiQ-00063B-0p
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:33 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so2368347pja.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iA5YdMPlGGiyhjKxfBQbY6+WZzBPtERwoPFsnw8+g+g=;
 b=TMjG6b4sQK6W7mQoCXgkWZbQsvZwbuGGWibP5ExEzwKih3U7+RbqNXyTRIApAqkBcR
 hNdFSSZntGDPdGfcHGtTCYtaQdtG58dQMwvYaMT9xg9YVhjNjV0jeSS2lGIbiSNcwi9D
 CSDAV8N1WpK4+oGGL1RNzhN0Rjw/gBXu7EFjdW5/6dBSeW2waryCpScpugXHEl8XIXbh
 LaBmmir2ftr/cIbTr2O1v0A/pS/GhaTbQwIe6IV1w2qHArLkq9cKU0ZC1Bz9zSvBR6qA
 o6OHtfwunDeaP4AH1D5jYopPDYcao+XbYaCtLEXeFERRlpaQH28lGfWqqdQpOaxQN2UA
 48ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iA5YdMPlGGiyhjKxfBQbY6+WZzBPtERwoPFsnw8+g+g=;
 b=m6wW+ls0HVeONbaRAH56xNhWQGEkKBp/xx4mv0ytJ81+SMar0LCFaZwC9d0f4ElZyR
 4jrcO5I9n9GoD3WZZnVmUR9VOoOZwuoRTbWLY6jxHtH8cNHKcf0wabTQxrzHZcV2jCZb
 HiVsNDXknkeiHUiiWiL6vmwxz6s//ZGuI7TSPFNC8hoHXFWmEaIwdp10Y52gDFISZVXW
 Fw4k46iSbfqFTCRvoVXFw90HL9DspfaEyJZ/96KfQrJAahPIpsyY0lwZVGooVOxNxabY
 tZEeeL7H+hGRIcAWhHpAexcOTaBP7ZZ/IhqPCurNwbZYhXJyyI4hCbSoUh/GYkMqSh7u
 DRFg==
X-Gm-Message-State: AOAM531JxFgjU9wiN2uYBv6ypNlktDSODEcrThK6M1kK9R6oJXqO9H3v
 iz6DXtepLkoNHFuPpV4N4Q+Z7z+Sw3n5qw==
X-Received: by 2002:a17:903:4104:b029:ed:7bda:412c with SMTP id
 r4-20020a1709034104b02900ed7bda412cmr7239846pld.31.1619814380780; 
 Fri, 30 Apr 2021 13:26:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/82] target/arm: Implement SVE2 bitwise exclusive-or
 interleaved
Date: Fri, 30 Apr 2021 13:25:04 -0700
Message-Id: <20210430202610.1136687-17-richard.henderson@linaro.org>
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
X-TUID: aKDcKdpVobhL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 740939e7a8..f65818da05 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2372,3 +2372,8 @@ DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_eoril_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a3191eba7b..0922a44829 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1215,3 +1215,8 @@ SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
 SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
 USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
 USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 bitwise exclusive-or interleaved
+
+EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
+EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 73aa670a77..1de0a9bdc3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1221,6 +1221,26 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZZ_NTB(NAME, TYPE, H, OP)                                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    intptr_t sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPE); \
+    intptr_t sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPE); \
+    for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {                    \
+        TYPE nn = *(TYPE *)(vn + H(i + sel1));                          \
+        TYPE mm = *(TYPE *)(vm + H(i + sel2));                          \
+        *(TYPE *)(vd + H(i + sel1)) = OP(nn, mm);                       \
+    }                                                                   \
+}
+
+DO_ZZZ_NTB(sve2_eoril_b, uint8_t, H1, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_h, uint16_t, H1_2, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_s, uint32_t, H1_4, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
+
+#undef DO_ZZZ_NTB
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index afd208212b..509b3bc68c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6030,6 +6030,25 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_eor_tb(DisasContext *s, arg_rrr_esz *a, bool sel1)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_eoril_b, gen_helper_sve2_eoril_h,
+        gen_helper_sve2_eoril_s, gen_helper_sve2_eoril_d,
+    };
+    return do_sve2_zzw_ool(s, a, fns[a->esz], (!sel1 << 1) | sel1);
+}
+
+static bool trans_EORBT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, false);
+}
+
+static bool trans_EORTB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, true);
+}
+
 static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
 {
     static gen_helper_gvec_3 * const fns[4] = {
-- 
2.25.1

