Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2408951lfb;
        Tue, 7 Jun 2022 13:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgGVzTl//BkpcQm6CplPI9D1TYIqAsOyiCjbov+8WDtKPrA0PKhmyxIL4MrwAScpFAyuFW
X-Received: by 2002:a05:622a:13c6:b0:304:ef43:e9d6 with SMTP id p6-20020a05622a13c600b00304ef43e9d6mr8544319qtk.252.1654635021763;
        Tue, 07 Jun 2022 13:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635021; cv=none;
        d=google.com; s=arc-20160816;
        b=06FT2dcjmPZD7A5u7v+wIGBlsX4Uv6QrTex4lkex5ypvEaU1bH5FDgwlLAFihGWh1s
         7wl9jBrIDA6suEgzOldTznNTMrYY4ko6siPLsOy0UMTQ0VZmE7L/O1xJ7LkrOsk6uWGV
         j01irms91/1G+2fLz2nL+dmsh4cKSnVpggXMKYioS9xPhTHJk077aFaGAcV9kIcBOPt1
         BJVdOYOdjX/8tsqUps/9eAEh4CReJ6GkTi9uD2RygR2MoCFEMIVHEsJftCWKaMKHUXyU
         qfEJuHo3doJxLhYw7E6J4AuUpT0JzfSn8fyD+/gC86acASqB45CYWqCfrZGbukkLCf/U
         zGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
        b=PY+QobvMevEauiUoivDf10XmPv2R2mtqY+VWrvpEG5wn2EoySrNZjQ3oKiVacMe4ZW
         ysGDfQYBXT+o4OIklec4vjT3y06aoYhjCO8Ej8+EGyVNvwo2/pzqHqwqfDOVw++eggl0
         oDLUNk37x9IThUg+bBKwYvz6sN2o0iZRqNh7e6EbK5uE4jiE68Yk8l4wwAglT/LF3Tyt
         cHjDi2IUpk5VjzDrzRM3Dd8SUfFK3K1ef9EphJMcY+YR8wkHZ0SNlPVofWgpP/GEbytu
         aCvzaS+f8qe3qywx66t6D+e8tJZfk548cPQu3edJ0H02zAA0HKF/7oQ8GvcYgFBIG+QK
         uK8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njsjEDYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05622a054700b00304da67cae9si8341924qtx.550.2022.06.07.13.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njsjEDYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg9d-0006Jz-8t
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftK-0007mX-Ch
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftE-0007Ia-CD
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: by mail-pg1-x532.google.com with SMTP id 123so6587563pgb.5
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
 b=njsjEDYZIdYXaH4KHNwLvVJ4Z/KS7gL8bkgcQrrOlH6KoF9XNgc53hAELH0UbCPLPQ
 wHpXzzogvzyPvZ3S/E/LMNQYWgPV9xyQP0XB8/WWJoUmqMWiLjukp4neXdlqQHbJsmaB
 L6TArS7eGpa2pa2pebjebA+QgANpMEF958Or6OZ/U466ihJJ2vTuZ0o81cLXzB/HUr3N
 eGwcBT/dWXjU2faEX+WudyhnTtWzhmBHRRET5i2w5Nx/LlR5NJtEn+mGUHDi0j5LkX0I
 8+OfmEnL6jCajwaxJrkQkaKHKs4z4yrCAYFlgDdLaiL0dDTtHBHpwrLsSlHMmzaZEI/c
 WUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
 b=XzPfcT5WAxOdWa40gfcPwCBCORpB0gurZaxNpUIV66j66rHuoOnndzToy54LVcqieQ
 bsE8i0Xy+vd/JkQaU5U/dRYb0myc+rLtF4trvfZmiWI4tYF2mqH9GP6HPqXLpEcmtO5x
 /cSbFYXKEDqDMBeGxQT3o5ofTyyWpvqzze/85EmlilhOF1j5RhQu4OmnOSB8Nea2JIYJ
 RcQiBinXueh8exzYorYutVIkIhYc/likq+K/xKxXuDU4Msaj5axITxVWKOvZ7Wz8df1K
 RJFcg2bWtUMA3bF3M+jXUstHkdFc6CLRevqNk6ZfmPPcPJvy1SoiFb+zPZNoCuewbr/y
 1YzA==
X-Gm-Message-State: AOAM5339WKfZvr1BHWk0TtwsMHKcuMOd6+T8/ZRRtcf4/QIwna04i6Mo
 IQgzyewtVEB/PcuTqnOCIcrIxA==
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id
 e1-20020a636901000000b003f9caa5cffcmr27421380pgc.324.1654634003018; 
 Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 17/71] target/arm: Move expand_pred_h to vec_internal.h
Date: Tue,  7 Jun 2022 13:32:12 -0700
Message-Id: <20220607203306.657998-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: iYpX/F6r9Oy1

Move the data to vec_helper.c and the inline to vec_internal.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h |  7 +++++++
 target/arm/sve_helper.c   | 29 -----------------------------
 target/arm/vec_helper.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index d1a1ea4a66..1d527fadac 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -59,6 +59,13 @@ static inline uint64_t expand_pred_b(uint8_t byte)
     return expand_pred_b_data[byte];
 }
 
+/* Similarly for half-word elements. */
+extern const uint64_t expand_pred_h_data[0x55 + 1];
+static inline uint64_t expand_pred_h(uint8_t byte)
+{
+    return expand_pred_h_data[byte & 0x55];
+}
+
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
     uint64_t *d = vd + opr_sz;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e865c12527..1654c0bbf9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -103,35 +103,6 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
-/* Similarly for half-word elements.
- *  for (i = 0; i < 256; ++i) {
- *      unsigned long m = 0;
- *      if (i & 0xaa) {
- *          continue;
- *      }
- *      for (j = 0; j < 8; j += 2) {
- *          if ((i >> j) & 1) {
- *              m |= 0xfffful << (j << 3);
- *          }
- *      }
- *      printf("[0x%x] = 0x%016lx,\n", i, m);
- *  }
- */
-static inline uint64_t expand_pred_h(uint8_t byte)
-{
-    static const uint64_t word[] = {
-        [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
-        [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
-        [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
-        [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
-        [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
-        [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
-        [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
-        [0x55] = 0xffffffffffffffff,
-    };
-    return word[byte & 0x55];
-}
-
 /* Similarly for single word elements.  */
 static inline uint64_t expand_pred_s(uint8_t byte)
 {
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 17fb158362..26c373e522 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -127,6 +127,32 @@ const uint64_t expand_pred_b_data[256] = {
     0xffffffffffffffff,
 };
 
+/*
+ * Similarly for half-word elements.
+ *  for (i = 0; i < 256; ++i) {
+ *      unsigned long m = 0;
+ *      if (i & 0xaa) {
+ *          continue;
+ *      }
+ *      for (j = 0; j < 8; j += 2) {
+ *          if ((i >> j) & 1) {
+ *              m |= 0xfffful << (j << 3);
+ *          }
+ *      }
+ *      printf("[0x%x] = 0x%016lx,\n", i, m);
+ *  }
+ */
+const uint64_t expand_pred_h_data[0x55 + 1] = {
+    [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
+    [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
+    [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
+    [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
+    [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
+    [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
+    [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
+    [0x55] = 0xffffffffffffffff,
+};
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
 int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
                      bool neg, bool round)
-- 
2.34.1

