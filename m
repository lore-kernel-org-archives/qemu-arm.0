Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1282046lfm;
        Wed, 17 Jun 2020 22:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMYN7ltXlRpcWRqoBpca/iJvYkMu47viuAu0cwH48K45gkcx4oBDqq1LWdZqAjYk/5f2TE
X-Received: by 2002:a25:d08c:: with SMTP id h134mr3730725ybg.513.1592456717220;
        Wed, 17 Jun 2020 22:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456717; cv=none;
        d=google.com; s=arc-20160816;
        b=rB1Hn3cDZ5vY5wlcMrt0IL8flQoEBvDugceTlT3rZGare1Ln9T6hsm1nZywctv5AeD
         RSFX53h/bT/jlJpFSt+JAForawSzlGpFSagnsLK0Z/KngAfEuytW9KTW/93WoXb5X+mv
         v5BqIWTmmxHKgAL1uZuWDav42HnKYC3Rd+jjMtplLq7Yd1qzce/HWZabUc0xh0JXQqC+
         jYNmtPP3vC3OgwxGy1o+n4DUSQrcn/mWnFNeWBoA8TZ04Fz6zewjqu1B7V5FxKxmo4Li
         IVJGKwrfhmP23dqyXfBV8UzpIKG7wdz0nCcmacaJ0fD+yr37bfid3fdlgNLfbGGLKhT+
         Y2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2k09KZLKxxubfLx07Dg5rpiql7TmODwkIvovmRwVXYU=;
        b=x402lbXdJijSl4oGuJyWS3WQx2e48CaLecwwJCvRTw6IPnGF/UFJBfcBhxX4c4YxHU
         YtRUOEVlil9rxiSQBuQhLP9y9UYWYTqX0IFGkiaY+r1HxiaeRStkcFgfMNhEBX5H72rL
         G7kN4VtkiDAE2o1GgaF+ZvbZ8A4vuzLBj5Pizy6KOpGZotsTZIWQGXuzQNfIPyJVv/vw
         rSmoiAhQUqym0X9WufcVkxZkQBA1uA57dMhLVIMsq2O9H4A80hRe40fRmonhqiEKQzak
         c9QO5oCg6UqZtK/PWo1aAgwnM903jOw4cKuLOACwEK8I3oSfl6ijSZuxhUp5T2zn3f5o
         A2Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q3GfpA32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si1580611ybn.306.2020.06.17.22.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:05:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q3GfpA32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmjk-0006Vg-Ik
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDr-00053a-32
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:19 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDl-0003RT-Vj
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:18 -0400
Received: by mail-pg1-x534.google.com with SMTP id r18so2324442pgk.11
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2k09KZLKxxubfLx07Dg5rpiql7TmODwkIvovmRwVXYU=;
 b=q3GfpA32hJRG4jPhOvzfXSicOmxiZHOClJ1+BZN2jbwQ0KIuAEbrz7wO0nirsHn4/d
 IPmNHSvXEoSPt6mxeT9/a3Ci6Dnv9slpO+yi4rVTqC3JQ7f8hVEM4dGwjw7PfvAD95w5
 3syWjzzJhGZOhXzz9HkpZWoEv6WpYXSaZ+2lngGqgPO8hav28kZKLKM6zavee5B6K6VB
 MeXf7QlCEvENDMIkgcoGga2fRH8uPKLsZPhzblcQA3F/1lAcZxk238DidL/pcpWhRUyL
 t4ZNTQVuF6btatHjpa2eqk0nIow5g3l8uWxG6wsNZUu3XQjjYL1Vz4Zp5j/wpYg5q1Kf
 pWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2k09KZLKxxubfLx07Dg5rpiql7TmODwkIvovmRwVXYU=;
 b=chfXrw3y84StkgraxQS5PRw92KAwC2DWrHYmnDb+PGtZZkycwc/6elMzrxu16WdDFq
 TeNaHOnhKtytDidSUgnxZl9xEq0Qehr08l3eDe4gsFy6t3StQ6XahDqRSmHrQDrTZZty
 djYEqAydO2NQxLKpvtHmNOlrg4MbGAcdiwqmg0HGfTFVmHqMJ+y6UOALvpIgyWu8mY1m
 be/XB8zzWYi1rQTq7e09w8p/BdeHrypk5Rgx5a1kqV2kdBSZTaV8myi16zfBV4YqoU0N
 W/jfskn8Aan5EKpIYb0819RMzbyPYWZ/nLa95XWuSHbYqiiMIu988jUzQF0h20jJpr2V
 F1lA==
X-Gm-Message-State: AOAM531Wf+Mbb1l4VWmm1LnvRPbU+DT3rO2ArFw7j/Qui5dhPVyftg5m
 EqKEFaktsuWAZDhJ9JFDvQWkMQ==
X-Received: by 2002:a62:7a4a:: with SMTP id v71mr1993648pfc.35.1592454725900; 
 Wed, 17 Jun 2020 21:32:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm1162840pgv.5.2020.06.17.21.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 078/100] target/arm: Implement SVE2 saturating multiply
 (indexed)
Date: Wed, 17 Jun 2020 21:26:22 -0700
Message-Id: <20200618042644.1685561-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: bba1U07KBhto

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 5 +++++
 target/arm/sve.decode      | 6 ++++++
 target/arm/sve_helper.c    | 3 +++
 target/arm/translate-sve.c | 5 +++++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 91cce85f17..e8e616a247 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2205,3 +2205,8 @@ DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f0a4d86428..400940a18d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -835,6 +835,12 @@ UMULLB_zzx_d    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_d
 UMULLT_zzx_s    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_s
 UMULLT_zzx_d    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_d
 
+# SVE2 saturating multiply (indexed)
+SQDMULLB_zzx_s  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_s
+SQDMULLB_zzx_d  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_d
+SQDMULLT_zzx_s  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_s
+SQDMULLT_zzx_d  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4aff792345..52a235826c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1581,6 +1581,9 @@ DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
 DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
 DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
 
+DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZX
 
 #define DO_BITPERM(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d8bb877ba5..4246d721d9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3884,6 +3884,11 @@ DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
 DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
 DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+
 #undef DO_SVE2_RRX_TB
 
 static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
-- 
2.25.1

