Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545245ejb;
        Fri, 2 Jun 2023 19:37:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yFZwEF6JMe3jRjO6T9Ez6m+61hDBqXsyh2mWsgO7pO5n2THiY9GDX+LirV9TQ57GChxVn
X-Received: by 2002:a05:6214:2463:b0:623:464d:462d with SMTP id im3-20020a056214246300b00623464d462dmr696378qvb.20.1685759871555;
        Fri, 02 Jun 2023 19:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759871; cv=none;
        d=google.com; s=arc-20160816;
        b=1CNG8nYPxBrk383ilaRgnnNsUQuoRl6Dbsb/8A90hSIvlIYAkZ4IXm9ayKVavle6a+
         JxFWNOZkvFXQoM5KHTMej47AzXA8BMVFivVC+KcIPCUS0MTjfEWcsaSvbX8Qc/jPDGn0
         +n6oZmrJv7bWf0bYtEZDSD+IVpgXiINQbH3z7xVusN9hUqRm5suZUV27fkx6R5qID1sR
         rM1EVA860UMKSZYPdZnRw1nm0BZt8LmcFKkNOkn8wqhweog5UhlD26l4dj45Il+Mf/0s
         ZaQGbPlA/mVuJaInVHJlY7jP7e7RPNFJLH12wd8yCBFjO1Hv1/6gR04OtO2iyyW8tZWg
         6GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m3OHDG5WK7pMNPAxl55tD/qKqCZQ1l17wihsUptzQ58=;
        b=p8Bx+nmmQchoE6f4rojuLeGylmwq4OgHlxQVCGKMixkPU7yLJgas9q6xWWqnOTbHLA
         ZUJwZLuLGLX8RfSC0+uZEwUNZWYZb3xl64S5zijmDfmlboDW0drYouZqPMgiAWoKHGGw
         /xoKjJwFnEf9XfdRFh44IkE+TnG01RTfwl9b6+AYwOIBmbcHvAsTRVFSN2IhBB8se9ky
         FGgGpYKk/gEg26/sIaQ+ya+EQ6BQfSpRJja6rzlG8BAeibXxiejpzwTH4twll4CwrqQ8
         Gma6L5tcLLNObMTfCa+oc+GB/mEIvQWHBeHmYvkotsjZypFBGo1zTzCHgZwf/K1GpB/S
         mCzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibkNH62K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a00ce00b003ef5b5c0712si1700100qtw.230.2023.06.02.19.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibkNH62K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7p-0004CA-Qw; Fri, 02 Jun 2023 22:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6y-0000su-GC
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:26 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0004wR-HM
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-bacf685150cso3039828276.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759696; x=1688351696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3OHDG5WK7pMNPAxl55tD/qKqCZQ1l17wihsUptzQ58=;
 b=ibkNH62KmMxPoUq17zOh3oLg47my8C4QKa7P7f2qQs2nGPYb8lZWIbGUhGBgOiK4NI
 kAwgvUc5ZTHy61UEzmZ3wRKFZ/w/UMDhLS3DUz8wXtNn8jRruCIHDtQB/i6KuLDEBioZ
 ederaqCUOGp2eFkSNPw503RXhASm67MxlmZwHDFTaMrpaWEl0pmlJLQjxTfGSWSIHDak
 LmkbIXxd6+WgXNEJsazwpXvyMtJdX/BBaQ4fI2MXV6/qYqE/GI4Dg5Ru+onW2tuwX/Qu
 6oDgcMyroooykMxHYKcAfFioaMRJL8O5mLNm7Y6kWGqIg2BDF54uZOrvIXzazrGM8RwJ
 9wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759696; x=1688351696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3OHDG5WK7pMNPAxl55tD/qKqCZQ1l17wihsUptzQ58=;
 b=Ti6mG/8LNSQc3tfFlV9s9THAgyQQpiVRS8BiJoMfRHHf6N3EMRTSW8qCaboPgHWFDR
 sISQx7SptKQ5czWuihL/e5fm+P5gi9nfnht0RGU06BQvwe9R3DanYOy3Tn6LByNQ4d2Q
 2+8oGqyaj9LCx8Le1qLRSEGUh5mm0lJwaRAIQjaDc/WKk1ohQsBPqJoGVOmB6z3vQsIU
 Oj0F9Yvb/q2C8CCBvfPIpiIhlP5tDNfE5VIHgsvMWP7iP/oMKIVfTVnMcYe5+2+fi2Qi
 kyDc1MyjbM5s+3qqazksAQCxVKNOjVJf+iS7Zi8hcibODEwAI0fM93TYgjc/K1ZW0PBN
 KqNA==
X-Gm-Message-State: AC+VfDyYUsHg8ZsE1ObUnVG0INJmVqhFLzhN7aq4fsMCTLcc0TyFxDY4
 40mg4Onapd8Og7Z8VzZ7DFTDcg==
X-Received: by 2002:a25:d846:0:b0:ba8:3b3d:3dc0 with SMTP id
 p67-20020a25d846000000b00ba83b3d3dc0mr5224104ybg.65.1685759696030; 
 Fri, 02 Jun 2023 19:34:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 31/35] host/include/aarch64: Implement aes-round.h
Date: Fri,  2 Jun 2023 19:34:22 -0700
Message-Id: <20230603023426.1064431-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9IIIGw9erJ+4

Detect AES in cpuinfo; implement the accel hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/aarch64/host/aes-round.h | 204 ++++++++++++++++++++++++++
 host/include/aarch64/host/cpuinfo.h   |   1 +
 util/cpuinfo-aarch64.c                |   2 +
 3 files changed, 207 insertions(+)
 create mode 100644 host/include/aarch64/host/aes-round.h

diff --git a/host/include/aarch64/host/aes-round.h b/host/include/aarch64/host/aes-round.h
new file mode 100644
index 0000000000..27ca823db6
--- /dev/null
+++ b/host/include/aarch64/host/aes-round.h
@@ -0,0 +1,204 @@
+/*
+ * AArch64 specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HOST_AES_ROUND_H
+#define HOST_AES_ROUND_H
+
+#include "host/cpuinfo.h"
+#include <arm_neon.h>
+
+#ifdef __ARM_FEATURE_AES
+# define HAVE_AES_ACCEL  true
+# define ATTR_AES_ACCEL
+#else
+# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_AES)
+# define ATTR_AES_ACCEL  __attribute__((target("+crypto")))
+#endif
+
+static inline uint8x16_t aes_accel_bswap(uint8x16_t x)
+{
+    /* No arm_neon.h primitive, and the compilers don't share builtins. */
+#ifdef __clang__
+    return __builtin_shufflevector(x, x, 15, 14, 13, 12, 11, 10, 9, 8,
+                                   7, 6, 5, 4, 3, 2, 1, 0);
+#else
+    return __builtin_shuffle(x, (uint8x16_t)
+                             { 15, 14, 13, 12, 11, 10, 9, 8,
+                               7,  6,  5,  4,  3,   2, 1, 0, });
+#endif
+}
+
+/*
+ * Through clang 15, the aes inlines are only defined if __ARM_FEATURE_AES;
+ * one cannot use __attribute__((target)) to make them appear after the fact.
+ * Therefore we must fallback to inline asm.
+ */
+#ifdef __ARM_FEATURE_AES
+# define aes_accel_aesd   vaesdq_u8
+# define aes_accel_aese   vaeseq_u8
+# define aes_accel_aesmc  vaesmcq_u8
+# define aes_accel_aesimc vaesimcq_u8
+#else
+static inline uint8x16_t aes_accel_aesd(uint8x16_t d, uint8x16_t k)
+{
+    asm(".arch_extension aes\n\t"
+        "aesd %0.16b, %1.16b" : "+w"(d) : "w"(k));
+    return d;
+}
+
+static inline uint8x16_t aes_accel_aese(uint8x16_t d, uint8x16_t k)
+{
+    asm(".arch_extension aes\n\t"
+        "aese %0.16b, %1.16b" : "+w"(d) : "w"(k));
+    return d;
+}
+
+static inline uint8x16_t aes_accel_aesmc(uint8x16_t d)
+{
+    asm(".arch_extension aes\n\t"
+        "aesmc %0.16b, %1.16b" : "=w"(d) : "w"(d));
+    return d;
+}
+
+static inline uint8x16_t aes_accel_aesimc(uint8x16_t d)
+{
+    asm(".arch_extension aes\n\t"
+        "aesimc %0.16b, %1.16b" : "=w"(d) : "w"(d));
+    return d;
+}
+#endif /* __ARM_FEATURE_AES */
+
+static inline void ATTR_AES_ACCEL
+aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesmc(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesmc(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_SB_SR_accel(AESState *ret, const AESState *st, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aese(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aese(t, z);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
+                         const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t k = (uint8x16_t)rk->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = aes_accel_aese(t, z);
+        t = aes_accel_aesmc(t);
+        t = veorq_u8(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aese(t, z);
+        t = aes_accel_aesmc(t);
+        t = veorq_u8(t, k);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesimc(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesimc(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_accel(AESState *ret, const AESState *st, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesd(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesd(t, z);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t k = (uint8x16_t)rk->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = aes_accel_aesd(t, z);
+        t = veorq_u8(t, k);
+        t = aes_accel_aesimc(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesd(t, z);
+        t = veorq_u8(t, k);
+        t = aes_accel_aesimc(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t k = (uint8x16_t)rk->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = aes_accel_aesd(t, z);
+        t = aes_accel_aesimc(t);
+        t = veorq_u8(t, k);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesd(t, z);
+        t = aes_accel_aesimc(t);
+        t = veorq_u8(t, k);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+#endif
diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
index 82227890b4..05feeb4f43 100644
--- a/host/include/aarch64/host/cpuinfo.h
+++ b/host/include/aarch64/host/cpuinfo.h
@@ -9,6 +9,7 @@
 #define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
 #define CPUINFO_LSE             (1u << 1)
 #define CPUINFO_LSE2            (1u << 2)
+#define CPUINFO_AES             (1u << 3)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index f99acb7884..ababc39550 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -56,10 +56,12 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
     info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
     info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
+    info |= (hwcap & HWCAP_AES ? CPUINFO_AES: 0);
 #endif
 #ifdef CONFIG_DARWIN
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE2") * CPUINFO_LSE2;
+    info |= sysctl_for_bool("hw.optional.arm.FEAT_AES") * CPUINFO_AES;
 #endif
 
     cpuinfo = info;
-- 
2.34.1

