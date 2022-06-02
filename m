Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5201422lfh;
        Thu, 2 Jun 2022 15:02:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNcROYTNWNegpxu5n4I6ioevpuSkb+XU2xtFl8m3CfvSaOjJqnDtIWnN9kqRV7pY4JykiK
X-Received: by 2002:a05:620a:4042:b0:6a5:aded:fe52 with SMTP id i2-20020a05620a404200b006a5adedfe52mr4602353qko.365.1654207324137;
        Thu, 02 Jun 2022 15:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207324; cv=none;
        d=google.com; s=arc-20160816;
        b=nMv8dBmH/vd/wRCbUKRcOkqcjWKEMil0I91RMZJWkwZtzD4uALQ3OouG8wOR4bdTQq
         gsnwZVXsPUfut6KcUp6Oc1lrxgfsG7unlMe4o/UzkgE0JUyMFHN4o+SPmqBmstn9gqLR
         ClfjcRc2rNB+SHHf0jSE5eWPY1qT/zIwmLAaALrG9tEDdr6wU3NUDxLy2hJM7maePH5y
         BDM9kuMwtp3qxJuCooRS7JWP86Zx1IGjSaugK+PUn8hGigf1mCeyRi3oLpOoCWPyGEqo
         U9Zc+kj161vXST8slM6LCqyxh1/c7Ouw908fn8tM1Yp+7jqcMmLOXX/+zzeZFWvmEySX
         JKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
        b=gFJnIJXiDDFPFSWyg8lDKvziie9DH4wtbjAmqoARI6zE2qjIxP6gx0tYoSJfL1cQnc
         MNXET/0d2ACxfbGDaBkPmfqmgUao9WumkjQJqID8gG6l2+2q/N5XHONxD/Zoca3gWBHe
         EXiXEXV0EEpRv5PeUUjwTYtJyff/ifiQbsm52Lm3jXmjcan8CN9030dI3Jm7GgjrFfl4
         Ur0sZkdIeD9kSwTk7qsIFykyReUyKaDA8QYMUMAfh0NoHVdYhR0E5Z58/qs0A5iV0J8H
         570BfEa68cXVDrD5IbIlC9MyEdveDOqo/5gZ4hm/7tNo7IbI+yrnHqbA1rQzWuL/pH2J
         evUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXrwu39I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85908000000b002f9261a0de6si2768022qty.190.2022.06.02.15.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXrwu39I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwstH-0004XE-GU
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgr-0004kc-Tv
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:14 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgo-00007x-Mu
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:13 -0400
Received: by mail-pg1-x532.google.com with SMTP id d129so5786572pgc.9
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
 b=lXrwu39I4hZ8xZuBJ/xJTwzvbO4UwmhjQ9vsm3hMeSTwAjq+EqmXjZ8a63nkBt5tfC
 mdDrxLu4tYeH0tG+95j9ouedL7BAbzEmJw37MzLS4bwPlF7JtQsUApCGkDq+akCzpJOD
 JnzMoT51DP1J+zWt7gIHeKo+h2hxd0Ly3dnKltfs6KA7P+xe0d5DxCRsOpJZzhvlR65V
 r6Uz9MA7eHKI/rsIbfzSrsN3Y09oYcx4M8/QtVueg9VYILC0Tk8wgNkboR1oHjKSE6JQ
 ZiVc/w2L3eOPBEfbmv4qVoTKnVv/4MX5eCN1lJ2GyKWIktrzaQXCL7+MWdONQdpPDhvl
 tuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
 b=aGuneOsmD9ar1ILvI9MQBQ/rNK8AcY8PStm3E2prjAO/5gEAiIVgWAw2Zi4Syo0hqb
 BuuaFI8RhZIiBxb8h76fcsDP3h4v6kwc5J91ic656D10z8m8muVpouPmZsxZJ9AcAAVk
 3HbrWnZ2Bcsd97pMMf4Pfdxtx+7oe3E1rKuDFOyM+W7q0Bevmt1zYaD4OBUBumbK50h+
 425vrM32Msl2UW4yrS+EcDG9e80STNBUPnHh5S0kSCVhKL7ofaoF3K1mF2hh1bY1FYmf
 mYiSRq0xs7m4LQK4ZVHCLgbwsDTvS9/I1mIsQA4X1sbf/nheTlaJTfb677WK3tHMbL2B
 bCHg==
X-Gm-Message-State: AOAM530Ys9hr2MQrKKd/7c906skWGb20yxCYeSo/5T0dyNkJaHDWnUil
 inWH3aiVwIOhEiy1wj0uMqe5JA==
X-Received: by 2002:a65:44c2:0:b0:3fa:8a91:1ae9 with SMTP id
 g2-20020a6544c2000000b003fa8a911ae9mr5966968pgs.412.1654206549415; 
 Thu, 02 Jun 2022 14:49:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 17/71] target/arm: Move expand_pred_h to vec_internal.h
Date: Thu,  2 Jun 2022 14:47:59 -0700
Message-Id: <20220602214853.496211-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
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
X-TUID: y3UKPOIv6yyT

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

