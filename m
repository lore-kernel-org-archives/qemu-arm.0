Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4038818lfm;
        Mon, 24 May 2021 18:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2/T749W5djLsEOhBn5BzuApQsB9OwfqcCD5IWNVI4nO0q6qdF4nHreSOzXFSrdp5PsEYq
X-Received: by 2002:a05:6e02:1302:: with SMTP id g2mr17788046ilr.259.1621907164187;
        Mon, 24 May 2021 18:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907164; cv=none;
        d=google.com; s=arc-20160816;
        b=y+sTTNHjAtzVYeHCZR4vmUybWLV97dx20ZTihNyh4sDL03DHjwthgpYyQVFMKDTkbB
         x/a6BapcEPAdq+gw8ODP1uF/roqz1WvNRRYxBVs+Vv7pAEAA8hPUZPDlbABIY8jXQh5A
         3w0vJbmdi3phC0WE919S3rhuWYXPIHvVp9szjpPCbwlJFNLoGDzM+u+laPtXJCk6jMIv
         K1QOXzXJKkW5WrwG2dhmpt/b9wkj4EtDFry/6d3E8+WBHpvUMwAqKHbG42K1fHegx0Ud
         qvkpZ7qL4bGN/w3j9aoJ2Kf3ud2NX2vMBAYDjII6wB1ygukNAai9osgS2KWeYqh5hDc4
         iP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b3dj9ONkMwSM4D3dV9NQFfT4vbk+6eB3o1NU5yiO8yU=;
        b=tVnHRyqHzmiWB6J7glf9lZZORQKfBkC7Z+V8EMiEzp5LYGJEZYIdCvSxFd/3c3kIkH
         QAPb88FvCNOspzJdPnFwrV2ZLsnCEQx/pM7HxR6h9RhjbhYkeWeVJhRCdVqt7MsUvdPY
         xiJgNNUq3hpVbwlmVeOT79KP1k+vygPrA6igOdblxBPb4zqNv5fWD86oX5vgw2Zw7Xce
         oOLqHNHaiFfTpRRMAsK6qMxjf/ynLz3Nrf5pVtJiSsZQY6EzSsIRJ0SxzcTmJ7npauMf
         aeprixdAzlTi1D10K/5LGLL7dUd1rARuCbBdS/byhRtxwu34gCigfuxmHuouMyZkV7xH
         LCjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tfNdaPR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si18408221ilg.25.2021.05.24.18.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tfNdaPR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llM8x-0004xq-GV
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYB-0008Lb-NR
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXp-00044K-8d
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id k5so15869259pjj.1
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3dj9ONkMwSM4D3dV9NQFfT4vbk+6eB3o1NU5yiO8yU=;
 b=tfNdaPR1hA9dvjf4feWwtzwtebdGB4nIXgU8LjykMIFyzS9c9cHtW+NR7GgmKzsIxL
 Uz3T5+tWiBZKnQcRa/6hzn5LEDeaeqyjeKjDRX22bhxy6oS5j5f08tISHEjjyQe2qTaD
 77iXaHJMTIhm6NItUMmKEK3U/JaO32UByW9lQeLXXJZ790FiCdEKSOIWMb6ZZJsZoHsD
 /tvkJoQ3toZbRw7YyESY9pSDelEg3nIhlaCHRzOfMLKOMbqF6sptI1oQlk0mDaYUJpCc
 11Sp+4ZnKLi2H9lbLpRl6WHx5hiH869vN5MgN06IvavBeT7MjGI2uk5aohpOH+fUGmkx
 VZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3dj9ONkMwSM4D3dV9NQFfT4vbk+6eB3o1NU5yiO8yU=;
 b=CPqhT60SXzEiUcoE7xwfyb/811wOtXcCWs9rG9BcAch73QLXgtET+TGv161nTtg7b8
 R0RCXuPQ/tgogHrx2PFgEoTA9MLE9Rg/b1XbmKefZyGa5rbyoQuf18PwpC+tw0eJEEG9
 ZfrJWk+er/rpDfpWqgw14IEswJ2GQIj0wEUe4LRHxVsIPL5Wj0ZTY2+rSbyYjpoOnobz
 32Vj0LeKeLlnGeDZSTSQ1Mwuva6UqtL0+w8QsaPdEVD3mPE+a1A5mDuYmn9mOnhKot4I
 AKzajTxfWNTgxwoUiW1vfV1+r/TSqqcHPUFaB/gtCR4fqyfB68wsF8GSMHgep0vlvsig
 jw0A==
X-Gm-Message-State: AOAM532DsBwehGDZE75FqZkmIucSWChnunIBDaDH9tPE40vsH/eQKUVo
 0nCO5npDfRkrSEk4GV05K6Voww==
X-Received: by 2002:a17:902:bd42:b029:ee:2ada:b6fc with SMTP id
 b2-20020a170902bd42b02900ee2adab6fcmr28155792plx.59.1621904854762; 
 Mon, 24 May 2021 18:07:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 57/92] target/arm: Implement SVE2 saturating multiply
 (indexed)
Date: Mon, 24 May 2021 18:03:23 -0700
Message-Id: <20210525010358.152808-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fQQZk8x8f+x2

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 08398800bd..0be0d90bee 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2688,3 +2688,8 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8d2709d3cc..a3b9fb95f9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -255,6 +255,12 @@
 @rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
 @rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
 
+# Two registers and a scalar by N-bit index, alternate
+@rrx_3a         ........ .. . .. rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_19_11
+@rrx_2a         ........ .. . .  rm:4 ...... rn:5 rd:5 \
+                &rrx_esz index=%index2_20_11
+
 # Three registers and a scalar by N-bit index
 @rrxr_3         ........ .. . ..      rm:3 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx index=%index3_22_19
@@ -817,6 +823,12 @@ SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
 SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
 SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 saturating multiply (indexed)
+SQDMULLB_zzx_s  01000100 10 1 ..... 1110.0 ..... .....   @rrx_3a esz=2
+SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
+SQDMULLT_zzx_s  01000100 10 1 ..... 1110.1 ..... .....   @rrx_3a esz=2
+SQDMULLT_zzx_d  01000100 11 1 ..... 1110.1 ..... .....   @rrx_2a esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b80bd15085..3953e2f502 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1565,6 +1565,26 @@ DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
 #undef DO_ZZXW
 
+#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + idx));                          \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm);                      \
+        }                                                                 \
+    }                                                                     \
+}
+
+DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
+#undef DO_ZZX
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3e7f310d59..c009ec54ff 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,20 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+#define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)           \
+    {                                                           \
+        return do_sve2_zzz_data(s, a->rd, a->rn, a->rm,         \
+                                (a->index << 1) | TOP, FUNC);   \
+    }
+
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+
+#undef DO_SVE2_RRX_TB
+
 static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
                               int data, gen_helper_gvec_4 *fn)
 {
-- 
2.25.1

