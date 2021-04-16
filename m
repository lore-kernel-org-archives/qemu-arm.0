Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp746419lfr;
        Fri, 16 Apr 2021 14:39:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi8Mkj/M2I20eS05azP+ClH2gGmclMwWzYXdJAGRIkp/QnTdUVgINvtXo/SF83mTmLegDH
X-Received: by 2002:a05:6e02:dd1:: with SMTP id l17mr9187337ilj.173.1618609168053;
        Fri, 16 Apr 2021 14:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609168; cv=none;
        d=google.com; s=arc-20160816;
        b=PBrLBi4Mj6/S4/7HSivNuIx3VWFQ2KbtBCM4L73cgWHUQ2vEIyAhEHJRROFAXZ96pM
         W2mC71wBjU/JJ1T3aKpV0GeYm3U7umfRgY9Y6Hx825r4cG4CZkFIezBBtQDXmOodL4Z8
         RMn8hTFGU+XYUCzT96KGQwyHPXae4HMXywMRmLg1B16gAyjVva2/kwhYALwxjqZtws01
         Y8IwkAP2kbKjof+JTCTAetA4okpMeRFXfNp/Tx04+fvHbrBH6UFGmKOzGlt2cHDwivEG
         z7nmwToLy8eN+aK6RW4quef2ErT6aUVR9dylQfu0QIznHa4gWtYF8BQdAi2IJbi1Q26E
         nPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AmPoZIIhtmHK3pFU80wMlIIFBV5aGkRIo467G1t+i0Y=;
        b=iZjEwDRgANNQKHqPGD9CY35w3vGzUP3flxODzvK/FJ5+5cszbzdw2QBFow+/p11WLy
         xHzmIq1lS9jF86PBQFITc2VFde4dGLRs7WiGVVYlDeZnz09kdlD4M8mDArRzQ+FULn01
         AcJ5Ag+L3l0pvHX8fuhNBV+c3laMhjwELgY6gL8xejg8kyStI0LHPmvSpG8qRUAy6t1A
         OmY/5ojix6OhjjvpxhFvbn57JEBZCc6qEIPbsKST/yjobjf08omJ5bnw6F00dkwRznme
         9pyVu5gh2VoH/Yl5slmmZvz+P7M3Id7Y/jnE6R1f1B34MAW4cpDaRz4PyjW6Gz8dBIDC
         9uuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DkJkO2Bk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si8343235iow.45.2021.04.16.14.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DkJkO2Bk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWBT-0000HZ-Ab
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdf-000679-8l
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:31 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdO-0001j1-Oz
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:30 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d124so19105904pfa.13
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AmPoZIIhtmHK3pFU80wMlIIFBV5aGkRIo467G1t+i0Y=;
 b=DkJkO2BktbcYypDGMm9yDDSYLUGgLUzLwqkOaGzg4ryWsSDrODChZU24fT475iav9I
 i+2SW+MhgoMIFki5mXeZI5B5clnA2kyBFhj7AjZfbF9/BYrft4IuEduVY0bZXY7udVMs
 XEnArFF0hMQql3PTN78lmjjRhKss8L38m3nsvC9+eRreijlGhvK0ymrooivBaB2H368C
 DzhUacPQv4gX2x9Mp8/IKrdQCnSbFQRA0W71SD0JZE60KenPQFgNXYOFlvc7Q82ABg5K
 W63souu57o/Zv5d9Y995gPlO0vHl+9+ktQxceayPAiTlTkv9rJm3CQn+P7q1aRbCOFNw
 uvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AmPoZIIhtmHK3pFU80wMlIIFBV5aGkRIo467G1t+i0Y=;
 b=az9kMdnSIMx4G0nEliO7ro/NNelmj36C4U4U47iW9hXc8tDPbyJ90/JD073tCrCj68
 GOdz7a542cakPuh1Q2XH1dqOhg1kaPK5cexMhTIiNoqnpUNAuz4MG6rVaepsHIfkMCwu
 yTwjLdcwDZGn/gE7uLqXkoQ6fT8VKGyKcTahoJbrf7cHnl7yP7BkP0NGZUJOI1Au+R7P
 VcAqWKxILlJu7AzAeI8jf1EmjgZmoD7sIahV1gthzkgRtb5auzInjipG9qk/F4jbZx/c
 KgP+klFL6YfmhtjIyBXV0YwgfKWGTjsmzkPHLZbj9Yr+BsB31oneSUVfg/eTYsmLu0ue
 KTUA==
X-Gm-Message-State: AOAM531XN/2RV07j6uEONbk7d1bv/OuB5zLLr5/qFi/cXfr/jxsXexGY
 MobRIjaLir/ccuAJX2/rO/WIhtKF0iDJjg==
X-Received: by 2002:a63:5361:: with SMTP id t33mr817409pgl.439.1618607049221; 
 Fri, 16 Apr 2021 14:04:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 58/81] target/arm: Implement SVE2 saturating multiply high
 (indexed)
Date: Fri, 16 Apr 2021 14:02:17 -0700
Message-Id: <20210416210240.1591291-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: s+eBH25p4rwz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 14 ++++++
 target/arm/sve.decode      |  8 ++++
 target/arm/translate-sve.c |  8 ++++
 target/arm/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index eb94b6b1e6..e7c463fff5 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -967,6 +967,20 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 407d3019d1..35010d755f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -829,6 +829,14 @@ SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
 SQDMULLT_zzx_s  01000100 10 1 ..... 1110.1 ..... .....   @rrx_3a esz=2
 SQDMULLT_zzx_d  01000100 11 1 ..... 1110.1 ..... .....   @rrx_2a esz=3
 
+# SVE2 saturating multiply high (indexed)
+SQDMULH_zzx_h   01000100 0. 1 ..... 111100 ..... .....   @rrx_3 esz=1
+SQDMULH_zzx_s   01000100 10 1 ..... 111100 ..... .....   @rrx_2 esz=2
+SQDMULH_zzx_d   01000100 11 1 ..... 111100 ..... .....   @rrx_1 esz=3
+SQRDMULH_zzx_h  01000100 0. 1 ..... 111101 ..... .....   @rrx_3 esz=1
+SQRDMULH_zzx_s  01000100 10 1 ..... 111101 ..... .....   @rrx_2 esz=2
+SQRDMULH_zzx_d  01000100 11 1 ..... 111101 ..... .....   @rrx_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dd4de9e57f..b43bf939f5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3864,6 +3864,14 @@ DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
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
index 25061c15e1..8b7269d8e1 100644
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
@@ -373,6 +403,36 @@ void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
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
@@ -452,6 +512,34 @@ void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
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

