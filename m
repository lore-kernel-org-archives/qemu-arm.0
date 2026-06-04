Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D326CD6E6E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:49:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHo7-0006cc-IM; Thu, 04 Jun 2026 19:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo5-0006bO-63
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:01 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo1-0007r5-Om
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:00 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c0c3315c5dso13682155ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616936; x=1781221736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0VjX09XRVlZNssyIpNmPffO8PV2GSj/dcv4OjuMNnI=;
 b=baR8jp9NxM1yXBqdhMu1iSp8AenI3DQsjHf0Xy2ZuSFkoFcb49uxMMw9Eih3aAGaGj
 SJZ355oLvOduf9XiNMnmiBNaaE6ZZSu3gKjG3aWkwUQSUAJdy2S/6PK9oe8XdHPL7tBC
 YbZGO4cqErm7SDH7pyJRKOVn6RQrzxki3EeIRkEIEijpNssTrK53A0fB2tdl80EPMKC9
 e/b4DRnpGrqAX+i3630+oZrU6xJbKXv91XFCCVN/CWGBJEs6sY3/US48sxmTYOMg1f9P
 2GdraEuGy9LmYAHUdvTy2lFJnwvoDybWW+J+XLQd9cymVs8o2ULovgnRLXno+oyTiZXN
 rxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616936; x=1781221736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a0VjX09XRVlZNssyIpNmPffO8PV2GSj/dcv4OjuMNnI=;
 b=AdquByBYqvai6KQmQ+uMfZ/BeZrgJ7ZMLIZYXCBkR0pln7zY3xsqDWoJ1DsAQDoXZu
 tH876uwwSWmq0eG7wjb6ry+4v4UNqghsadBZn8ztAanHx+cThldxpkzFUittCb4Fu8nP
 a7LlGFngoZwKp/cht+SZVjBClCIN3gvT5yvRLtEvMp3GgR4mdeHJ33Ag080exiULBZac
 yBYoM2mPQqn6l4x6tLX/2vAhRKnsJT7q1tHBppsyLIhpcPZPmB+Nku01Pi5jICRWd4W2
 VyTrYFqSsHIAkpYUVry2HM9cQnUQisMInQpOkI3k72opUp1VtSbBHLw1nVAQWHho8ah/
 UfaQ==
X-Gm-Message-State: AOJu0YxokuavJ+8ddiVkWX8LMZyhZgSz90bjTOyYnduk7OJaYO2cL+rW
 PljGbn0dtXG/T1NBQMrTTitteso1ar80dS/o+AdYyZqYwAjIDelGOmKNHh9koPWKJHHDqYqnL7a
 sJY00Yr4=
X-Gm-Gg: Acq92OHzNXPLXMtokMfW8/LSQcbDB8E83Suz6PwK9cir5JLIoLCnF38u9OLRbNZNqxA
 1M1P2pdehdeKbT/1uZ0xHxlMMPb4eH7qjYkrLbD08Ybp3onbv/dWFBb8+HglSq29Sd+4oDMSM1i
 yE3YKFlGk5CT9Q12G4EYybJsI4pH0nWwHuBUZ6gCOPyQZiwyZ5M9LFwdY3uB+Pn8QAehCPpUc7o
 XMxW77J5qjAHHtZXNvNERh/iw8ejCW6EGwMIfEi/ghHEMj1Y1Mmlo3Ue/P3b7/nVbzMAl+qxJ3A
 2Jmwy1egHpk8I1eLDg0H9feBYF1BT52+KrlrZ3fj4PCVMbuTc4roH75gxs1s0blChyIvKLWW7QA
 1JK3a2Q9dqO8iUxqxmu8ZIDoe6YZ60aF2WQtRbuUbIlwPNGO/LZPjPVcnHDxs0NaIdfYfwwemt0
 021XZ2w3Vv0XAXe5IbP2YanIhISRshy32iC3qajBo=
X-Received: by 2002:a17:903:f8b:b0:2c0:cf44:3b3b with SMTP id
 d9443c01a7336-2c1e847d71dmr7768815ad.24.1780616936406; 
 Thu, 04 Jun 2026 16:48:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:48:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/25] target/arm: Enable zeroing in DO_ZPZ macros in
 sve_helper.c
Date: Thu,  4 Jun 2026 16:48:30 -0700
Message-ID: <20260604234852.573178-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use the low bit of simd_data to hold a 'zeroing' bit.
The simd_data field is currently unused and always 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index a002006ea5..59e4bad05f 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -823,18 +823,20 @@ DO_ZPZW(sve_lsl_zpzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
 
 #undef DO_ZPZW
 
-/* Fully general two-operand expander, controlled by a predicate.
- */
+/* Fully general two-operand expander, controlled by a predicate.  */
 #define DO_ZPZ(NAME, TYPE, H, OP)                               \
 void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
 {                                                               \
     intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    bool zeroing = simd_data(desc) & 1;                         \
     for (i = 0; i < opr_sz; ) {                                 \
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
         do {                                                    \
             if (pg & 1) {                                       \
                 TYPE nn = *(TYPE *)(vn + H(i));                 \
                 *(TYPE *)(vd + H(i)) = OP(nn);                  \
+            } else if (zeroing) {                               \
+                *(TYPE *)(vd + H(i)) = 0;                       \
             }                                                   \
             i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
         } while (i & 15);                                       \
@@ -846,12 +848,15 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
 void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
 {                                                               \
     intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    bool zeroing = simd_data(desc) & 1;                         \
     TYPE *d = vd, *n = vn;                                      \
     uint8_t *pg = vg;                                           \
     for (i = 0; i < opr_sz; i += 1) {                           \
         if (pg[H1(i)] & 1) {                                    \
             TYPE nn = n[i];                                     \
             d[i] = OP(nn);                                      \
+        } else if (zeroing) {                                   \
+            d[i] = 0;                                           \
         }                                                       \
     }                                                           \
 }
@@ -4831,7 +4836,8 @@ DO_ZPZS_FP(sve_ah_fmins_h, float16, H1_2, helper_vfp_ah_minh)
 DO_ZPZS_FP(sve_ah_fmins_s, float32, H1_4, helper_vfp_ah_mins)
 DO_ZPZS_FP(sve_ah_fmins_d, float64, H1_8, helper_vfp_ah_mind)
 
-/* Fully general two-operand expander, controlled by a predicate,
+/*
+ * Fully general two-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
 #define DO_ZPZ_FP(NAME, TYPE, H, OP)                                  \
@@ -4839,6 +4845,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                       \
                   float_status *status, uint32_t desc)                \
 {                                                                     \
     intptr_t i = simd_oprsz(desc);                                    \
+    bool zeroing = simd_data(desc) & 1;                               \
     uint64_t *g = vg;                                                 \
     do {                                                              \
         uint64_t pg = g[(i - 1) >> 6];                                \
@@ -4847,6 +4854,8 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                       \
             if (likely((pg >> (i & 63)) & 1)) {                       \
                 TYPE nn = *(TYPE *)(vn + H(i));                       \
                 *(TYPE *)(vd + H(i)) = OP(nn, status);                \
+            } else if (zeroing) {                                     \
+                *(TYPE *)(vd + H(i)) = 0;                             \
             }                                                         \
         } while (i & 63);                                             \
     } while (i != 0);                                                 \
-- 
2.43.0


