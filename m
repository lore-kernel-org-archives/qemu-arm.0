Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544492ejb;
        Fri, 2 Jun 2023 19:35:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NV1SgsfWL+Kjmtt6avIbdPVDGC9gUneQhI4d6fXFDU4Ysn1GsCTk2VD1mJzAeyrWl6ptz
X-Received: by 2002:a05:620a:4895:b0:75b:2b21:63b9 with SMTP id ea21-20020a05620a489500b0075b2b2163b9mr15094091qkb.54.1685759735134;
        Fri, 02 Jun 2023 19:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759735; cv=none;
        d=google.com; s=arc-20160816;
        b=K+2Vni11Npewci+RvyYUi3XkJJr+7BTBtJeeymnFfZUSGcG3Rw8uZopgoV46e7HIlL
         /u7By+xv656CdFaNrEreQJkTrDS534GrO9fD3b7ojywOMF1b7phyvGpIN00XOo6nsZ8S
         vHOZatY8DI2yj0sYM8GRR8g11X7MI/Rj97E0VW5+kGw0bVL/TjzukVej69tDCrx5dZSb
         fQvM8xXX04ZW7LWWwcMeqxJ/GEsmJm4YPWvcN6HX0P0i1LQsM9AYudO7njIfZ6J9mDjc
         zfnCqFUnHcvPj+boPlNM/J0pU7DVhd4/YCJgVWvx+Z/C4/BGG78Z/BioqgKQHTDjs95d
         +Zaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XCCJzw+rwFcyJFSIAMn2E7LGE9pt/wVOH2bIPCZG1D0=;
        b=gHo+tFSv6wul36EfWq3dPHrmU7YIdXKJyRLoiNJIvjdUvDFl7O/xURt/cvx98T4vsy
         hcilHl6oHCLd9JCCIXAW0ZNEvnNS7OahFQomvSLiesYIROu6gd7I+nZhQuV9TGU8e6JH
         M5eIAwMboHVQcqRmkZTj8xKgoVbiBEqgwfqVaGsyV+0feu8prnBzBKJCm9qLRC7F5j8Q
         uEpARAvCwgPRK4usxO4mhY6jBAWSbBYsQwO+uMRqbM4vYzqxtIe9/LqQ4KhtwtGHqKyR
         f/fT89S6q2eOeoHSgu6N3CIXXANZ5PKzmsh6ALyTPhg2nXSY0ZkPtv+dPQND2jDwmYzO
         6Z5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h87KHV6/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05622a11cd00b003e96dcde986si1740943qtk.692.2023.06.02.19.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h87KHV6/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H6N-0000QZ-RG; Fri, 02 Jun 2023 22:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6G-0000KW-9b
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H68-0004hw-HS
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2565a9107d2so2322256a91.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759671; x=1688351671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCCJzw+rwFcyJFSIAMn2E7LGE9pt/wVOH2bIPCZG1D0=;
 b=h87KHV6/FBRlIIQ2hK8YT35Hr7dATRYaOnko6G1wAO2rPl6yvv7pQY6hbxZbhAbZnL
 ySF/eZgUnve3QWjIO8VFnGVAKGoa4Jf7GGnwzgXY1P/HG4OavBkto9NlMEo8+NL579GY
 o1ESXSwwAJjaxFQtNw2KE+l4w6AZcwvdcQzfxpkMEEogA8dgYOdC4qVBiGJ0ITzLlhhL
 XQIOfpkwcaZwxkDjgfRbtx//0rNkp6ieFSH2GMM5oqq9iH5y8ST90j0iMCaGEpgSaOSG
 +kmJNFRvszYuokkegxXo6yCBW+QmlldY7/i4JOLFEUNWAi/82BxBEWg4ZzsawCNaEZIE
 40LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759671; x=1688351671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCCJzw+rwFcyJFSIAMn2E7LGE9pt/wVOH2bIPCZG1D0=;
 b=IMepYdv7fud/v0sfiYKVzkT/Lolf+DVlinnQ2YnEOWod+40bqzKz5k1g4OtN5KEM9I
 tD9/Jk9oRrqz0Zfx06acmRhzPLRLxUnryuKC47ym8t405Y/pQOkHukZ0uR3jioF1uRfV
 3ho5NghJXgJDg2CPFlG1WA6Osaqz51Jwfu4O8fdwEYiXQRlmKHeNBL1niVXMiL4Gtujv
 V6Dc9tNYuttCMbmDq0S9Ic1VNpLpYw6qccVheWB//Bemgij19do4ZOAEMLDr7iuGKdmc
 l2LJkBBSQiSzAnq8wXYULcFlCn/xKYtwdeAwcNLs5sIvlH35FeKBCC56SYhYAVsesXce
 g6lA==
X-Gm-Message-State: AC+VfDwhP/RdM+oGT2foICWk7a3dcVNeYpfBcUOioL0bYec/1gF3irCY
 3iRJoZGcmgjMO/8QVLD1wozMpg==
X-Received: by 2002:a17:90a:e006:b0:255:2dde:17cc with SMTP id
 u6-20020a17090ae00600b002552dde17ccmr1501795pjy.47.1685759671275; 
 Fri, 02 Jun 2023 19:34:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 04/35] crypto: Add aesenc_SB_SR
Date: Fri,  2 Jun 2023 19:33:55 -0700
Message-Id: <20230603023426.1064431-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g36PAuFSFrrt

Start adding infrastructure for accelerating guest AES.
Begin with a SubBytes + ShiftRows primitive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h | 15 +++++++++
 include/crypto/aes-round.h            | 41 +++++++++++++++++++++++
 crypto/aes.c                          | 47 +++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 host/include/generic/host/aes-round.h
 create mode 100644 include/crypto/aes-round.h

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
new file mode 100644
index 0000000000..598242c603
--- /dev/null
+++ b/host/include/generic/host/aes-round.h
@@ -0,0 +1,15 @@
+/*
+ * No host specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HOST_AES_ROUND_H
+#define HOST_AES_ROUND_H
+
+#define HAVE_AES_ACCEL  false
+#define ATTR_AES_ACCEL
+
+void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
+#endif
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
new file mode 100644
index 0000000000..784e1daee6
--- /dev/null
+++ b/include/crypto/aes-round.h
@@ -0,0 +1,41 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * AES round fragments, generic version
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ */
+
+#ifndef CRYPTO_AES_ROUND_H
+#define CRYPTO_AES_ROUND_H
+
+/* Hosts with acceleration will usually need a 16-byte vector type. */
+typedef uint8_t AESStateVec __attribute__((vector_size(16)));
+
+typedef union {
+    uint8_t b[16];
+    uint32_t w[4];
+    uint64_t d[4];
+    AESStateVec v;
+} AESState;
+
+#include "host/aes-round.h"
+
+/*
+ * Perform SubBytes + ShiftRows.
+ */
+
+void aesenc_SB_SR_gen(AESState *ret, const AESState *st);
+void aesenc_SB_SR_genrev(AESState *ret, const AESState *st);
+
+static inline void aesenc_SB_SR(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_SB_SR_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_SB_SR_gen(r, st);
+    } else {
+        aesenc_SB_SR_genrev(r, st);
+    }
+}
+
+#endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index 1309a13e91..708838315a 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -29,6 +29,7 @@
  */
 #include "qemu/osdep.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 typedef uint32_t u32;
 typedef uint8_t u8;
@@ -1251,6 +1252,52 @@ static const u32 rcon[] = {
         0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
 
+/* Perform SubBytes + ShiftRows. */
+static inline void
+aesenc_SB_SR_swap(AESState *r, const AESState *st, bool swap)
+{
+    const int swap_b = swap ? 15 : 0;
+    uint8_t t;
+
+    /* These four indexes are not swizzled. */
+    r->b[swap_b ^ 0x0] = AES_sbox[st->b[swap_b ^ AES_SH_0]];
+    r->b[swap_b ^ 0x4] = AES_sbox[st->b[swap_b ^ AES_SH_4]];
+    r->b[swap_b ^ 0x8] = AES_sbox[st->b[swap_b ^ AES_SH_8]];
+    r->b[swap_b ^ 0xc] = AES_sbox[st->b[swap_b ^ AES_SH_C]];
+
+    /* Otherwise, break cycles. */
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_D]];
+    r->b[swap_b ^ 0x1] = AES_sbox[st->b[swap_b ^ AES_SH_1]];
+    r->b[swap_b ^ 0x5] = AES_sbox[st->b[swap_b ^ AES_SH_5]];
+    r->b[swap_b ^ 0x9] = AES_sbox[st->b[swap_b ^ AES_SH_9]];
+    r->b[swap_b ^ 0xd] = t;
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_A]];
+    r->b[swap_b ^ 0x2] = AES_sbox[st->b[swap_b ^ AES_SH_2]];
+    r->b[swap_b ^ 0xa] = t;
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_E]];
+    r->b[swap_b ^ 0x6] = AES_sbox[st->b[swap_b ^ AES_SH_6]];
+    r->b[swap_b ^ 0xe] = t;
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_7]];
+    r->b[swap_b ^ 0x3] = AES_sbox[st->b[swap_b ^ AES_SH_3]];
+    r->b[swap_b ^ 0xf] = AES_sbox[st->b[swap_b ^ AES_SH_F]];
+    r->b[swap_b ^ 0xb] = AES_sbox[st->b[swap_b ^ AES_SH_B]];
+    r->b[swap_b ^ 0x7] = t;
+}
+
+void aesenc_SB_SR_gen(AESState *r, const AESState *st)
+{
+    aesenc_SB_SR_swap(r, st, false);
+}
+
+void aesenc_SB_SR_genrev(AESState *r, const AESState *st)
+{
+    aesenc_SB_SR_swap(r, st, true);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1

