Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1284661lfm;
        Wed, 17 Jun 2020 22:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTZNqBCpqJ0B6IoFNuXG9HIz17qwAWAjej0FiSDO/IbONIqmpj0MkzIMsOE1nmBFXaDZLb
X-Received: by 2002:a25:84cf:: with SMTP id x15mr3419099ybm.2.1592456961111;
        Wed, 17 Jun 2020 22:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456961; cv=none;
        d=google.com; s=arc-20160816;
        b=w907I3/eLrUs3pALe5wfseURPO71rYYNEwoqrV26iDxRif9Sj0WN/E6qvtoAJTpUK1
         fWbrg5E9B89B3TY4MxJu8mbwAqNw97iIAisG33mjpLhHX+0lzMGJ7u1TessVae0Ix0hG
         rrI+1RQvJgRJzZy1QECoUnyGCo5vcKc9smf1l1i5OT/I01jrvdQN2UvNP80Nsjbe3XU3
         u6glp4tNGbsnIVM4IYUGw2Q8yW2+8ld4SSGuPY47JxmX6UIDlAURbIIRaWRkZs441SJ5
         ZhnMEaOxbTAMpnMbmgB2s50yexNpB9PbMh5h/I55KjCRFurOCVn/r8T5DpklwimC9R5l
         VwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=29LSW4mYqA6ErNf1LQ5RNlrM7Of+A7XT7VDHBXGT4gE=;
        b=NYOAnHJDDAUPFNN6ERUr+hplvyikhnumxCQEWFJmBWc+yCmR+KnbdiUDtHB/CnbPIO
         yVkY7+Z2jdJF/FfMQAFcflDPAG5tWc7KwRKd+xMGnOt6nNMbcVEU3F+KDDxRlZSor4nk
         rkiEp3ZNMsSPGwJ0JqSk8C3MssYNfR41taGncF2EoHAI3YtiA5IOiqeNW5O9JGUMP8FB
         kIO2ZvLB9G7xjymX8nMPKweCIg0C6REd8afEdHnNxnsg5pOIkAeEDinvhvApgHTvzQK7
         yDFyCp9dmnkOPvzagSuW+a1IyxJ64gWZ0fiLX5t1tLAijDoiZAl9w6sa9cLxdKgZIwJ6
         KdsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x5hQjRRw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si1525519ybf.378.2020.06.17.22.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x5hQjRRw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmng-0000AX-EQ
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEF-00060v-NY
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:44 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmED-0003ZU-OV
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id s23so2194869pfh.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29LSW4mYqA6ErNf1LQ5RNlrM7Of+A7XT7VDHBXGT4gE=;
 b=x5hQjRRwqV2mBxdZ06MX/rp9mSYZYRLCNb6qcc7Y0y/6tRZRYHUFxn799u7ePvMuVo
 2mzIBtstVi3uEIEpm3WQhMntlDBrQ3BLLEkEk3W7/wqn9V6w3uCclX3Fy9n/gMg0Mq8I
 7Fp3i4cSvQJTaMOWUaucaXVxOOo+VOp8UK9lBig4rLdoau57NHhWnxFXo1ZDq7nwwI3m
 RsYJLAQGY1PI88qrs9W7kdfsi4ORYa88xsxVQmWM0ulBzy/Ek2seF+MSNHFUHXURJ0Yq
 Euci6DPXKZ3AogovtC2Qoy00Vdi66iqhAInGvb8KHAXjVBfwvi8cFSRi79YtlTQsxmqR
 DdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29LSW4mYqA6ErNf1LQ5RNlrM7Of+A7XT7VDHBXGT4gE=;
 b=WEzfrBgMTCkRXiDe48MFjlXWki57T3295A4xstr4HTnQ/fy2geLcog2seveSCsf7Qp
 GfQi/TiJcz5+p+tZgZCO7Vjpp7g6JTGnG2Uje+OzUZ0mgiAJvEbSkVkVEgtwuI0N8MzA
 9xDeciwyjgnFBClDjocxVZFlfNd3Z7N6v4ux/6Rbi37+tywuMDq3yUjyNNgABoAEFoUu
 yErOnSl23W+8vi1e6krSBWrBa3jmnFBPd1gEw5ZtgIrxhSZSIyA8L2+FWHFU5H8um9Ms
 Z9527JlI8RfzOsFZ3+1gvwI834HKTrPO6uYoJP+JcdKYLScvWGm06NHFsReBnBotgKdz
 IWIA==
X-Gm-Message-State: AOAM530NslVHrEr/YJHgPSNWVf71vnMTg/UTsektfFGOsVndlYLh2NpJ
 hkgCPWsT2Eu8RMjtsLFc3Wfc9w==
X-Received: by 2002:aa7:8490:: with SMTP id u16mr1836775pfn.259.1592454760356; 
 Wed, 17 Jun 2020 21:32:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 081/100] target/arm: Implement SVE2 saturating multiply
 high (indexed)
Date: Wed, 17 Jun 2020 21:26:25 -0700
Message-Id: <20200618042644.1685561-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: d2M5CQRWHV0C

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 14 ++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/translate-sve.c |  8 ++++
 target/arm/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e1cac31e95..e9d7ab97da 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -827,6 +827,20 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6879870cc1..80d76982e8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -841,6 +841,14 @@ SQDMULLB_zzx_d  01000100 .. 1 ..... 1110.0 ..... .....          @rrxl_d
 SQDMULLT_zzx_s  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_s
 SQDMULLT_zzx_d  01000100 .. 1 ..... 1110.1 ..... .....          @rrxl_d
 
+# SVE2 saturating multiply high (indexed)
+SQDMULH_zzx_h   01000100 .. 1 ..... 111100 ..... .....          @rrx_h
+SQDMULH_zzx_s   01000100 .. 1 ..... 111100 ..... .....          @rrx_s
+SQDMULH_zzx_d   01000100 .. 1 ..... 111100 ..... .....          @rrx_d
+SQRDMULH_zzx_h  01000100 .. 1 ..... 111101 ..... .....          @rrx_h
+SQRDMULH_zzx_s  01000100 .. 1 ..... 111101 ..... .....          @rrx_s
+SQRDMULH_zzx_d  01000100 .. 1 ..... 111101 ..... .....          @rrx_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a13d2f5711..fa28f011b6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3868,6 +3868,14 @@ DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
 DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
 DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
+DO_SVE2_RRX(trans_SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
+DO_SVE2_RRX(trans_SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
+DO_SVE2_RRX(trans_SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
+
+DO_SVE2_RRX(trans_SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
+DO_SVE2_RRX(trans_SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
+DO_SVE2_RRX(trans_SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
+
 #undef DO_SVE2_RRX
 
 #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index d73c1afe30..8e85a16e7e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -240,6 +240,36 @@ void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+        int16_t mm = m[i];
+        for (j = 0; j < 16 / 2; ++j) {
+            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, false, &discard);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
+        int16_t mm = m[i];
+        for (j = 0; j < 16 / 2; ++j) {
+            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, true, &discard);
+        }
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -374,6 +404,36 @@ void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+        int32_t mm = m[i];
+        for (j = 0; j < 16 / 4; ++j) {
+            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, false, &discard);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
+        int32_t mm = m[i];
+        for (j = 0; j < 16 / 4; ++j) {
+            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, &discard);
+        }
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -453,6 +513,34 @@ void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
 }
 
+void HELPER(sve2_sqdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int64_t *d = vd, *n = vn, *m = (int64_t *)vm + idx;
+
+    for (i = 0; i < opr_sz / 8; i += 16 / 8) {
+        int64_t mm = m[i];
+        for (j = 0; j < 16 / 8; ++j) {
+            d[i + j] = do_sqrdmlah_d(n[i + j], mm, 0, false, false);
+        }
+    }
+}
+
+void HELPER(sve2_sqrdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    int idx = simd_data(desc);
+    int64_t *d = vd, *n = vn, *m = (int64_t *)vm + idx;
+
+    for (i = 0; i < opr_sz / 8; i += 16 / 8) {
+        int64_t mm = m[i];
+        for (j = 0; j < 16 / 8; ++j) {
+            d[i + j] = do_sqrdmlah_d(n[i + j], mm, 0, false, true);
+        }
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1

