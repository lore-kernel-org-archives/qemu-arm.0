Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2778464ejb;
        Wed, 31 May 2023 04:22:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pZ6fxlfQ9Z1NW8QLWmpTdBssq5Bm76ArH2HOrD6lBVgNUfyqZSdNukSP4J4NSBK3gvvU+
X-Received: by 2002:a05:6870:e294:b0:19a:49d4:6d05 with SMTP id v20-20020a056870e29400b0019a49d46d05mr2691193oad.54.1685532169459;
        Wed, 31 May 2023 04:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685532169; cv=none;
        d=google.com; s=arc-20160816;
        b=rr91IifJL5kP+EHAZni+l1RO1j07wqkYvCeQTVKrtihPHTMo+MFsXoO09G8xt0XiTw
         ZaNxmEgb45rmtTueeN2Ue+iMdWxNFrqvBbVEIj+S1gtriMjQA8cCxjV+sqfd/9wUejfG
         HrIGwSf/GJlJSFdepnYeHjXElu53b2S11fiRlmbIVtPnym83AGHMhGA8QQa17pKl63Sr
         JOv/I378mU4EosXXvYFpBkOKI3awyZWi0/sfIibbLi9TPJwNfOXiK4jGvkN9thqjRNRe
         L0jjzU/zfUtBeOmCf4W02YrG8ku5h2QXzdFl7BRabmxdNWldJDdk1nnrp5aG1YVQrAHv
         LvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=moVL1bm9jceB7r43RJe9w1WLq89E8qW7B8eZERn8Ra0=;
        b=lVPFCAErifEyM5gVYXbwSeeRdTiEk7kBsGM2CUX33EufkusKfyb8oBIhPxRIfZyJ52
         RmW07qTKoKtTMKOGidNz+nxVgkp+a0LTsE2osJ/9wck50OtR8JR60SJgjMSNrvEHWSfT
         XeOznG/ZGbihlzeRgHojAug+b4fPSTc4Mi/NoEkIje8bcwCm7kAWkSHJsl7+k4kRTJDF
         DCNIRn9fbIXAu6oeEtSLvkBL6w8vCZf4DHGiffIWcnpekAEKqPRgrEgQkG8+Vjzr6ujL
         07atm+5Ig1dVVfFGcO0ZL6MqKdPRyRTnvUR+q4SsfsF8EE49Zv6IPgD6LnqGmaVN5Voo
         C0ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mDccMu92;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id r21-20020a056870415500b00192bfc3c26csi523753oad.24.2023.05.31.04.22.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 May 2023 04:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mDccMu92;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26BDD632BA;
	Wed, 31 May 2023 11:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FD5C433EF;
	Wed, 31 May 2023 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685532168;
	bh=8xiqqVg7tiHXOk5GpmDCi/SEGuHbChkOD4tRdQxDAVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDccMu92PiRP89OacNslpfsJo8P5d8KeklD+n+730OcCoNufGY081JLC9dTGsUxd3
	 OHWAdBfCxiOUDeWq0D3zBzgZL8k5SevPup0awbJp1M0Mv2nDHBsG/JC8nGfsX/Ksda
	 WJT5ZmfJzkVv1SIoDS+0XQgeIc6YVlEbkuYOmLdjK5eYo0mGukA8OVCMqmENGMNHZe
	 2e1d5qV9JzFLuvSG0aFIII/iS2VHy2B6yOHHmf9zu8pNVcjA4KIJkhgL3UTmcDOYPg
	 SYZvLky9KYZjpqSyAW5Ooi0hm/Hi9QqSWvungIdmt9cRO48lArgvyxn/fZeXPx95ow
	 0vRtgxF7LcDiA==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/2] target/i386: Implement AES instructions using AArch64 counterparts
Date: Wed, 31 May 2023 13:22:39 +0200
Message-Id: <20230531112239.3164777-3-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531112239.3164777-1-ardb@kernel.org>
References: <20230531112239.3164777-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5479; i=ardb@kernel.org; h=from:subject; bh=8xiqqVg7tiHXOk5GpmDCi/SEGuHbChkOD4tRdQxDAVM=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaVc94+dwX+2p6lmybXLFGTly/dwtKW47zGex8qadis1w 4W1SbejlIVBjINBVkyRRWD233c7T0+UqnWeJQszh5UJZAgDF6cATCR/JSPDdovAS+dWTtarydm7 eanSiYyyfxfiNOdoRa694Mx4favvc4b/eWfsj/qd05x9eeF9kZR5jZ+OCUqz2/4XDHzNE7j7CEM uPwA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-TUID: 1Li9mSZmrey6

When available, use the AArch64 AES instructions to implement the x86
ones. These are not a 1:1 fit, but considerably more efficient, and
without data dependent timing.

For a typical benchmark (linux tcrypt mode=500), this gives a 2-3x
speedup when running on ThunderX2.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 host/include/aarch64/host/cpuinfo.h |  1 +
 target/i386/ops_sse.h               | 69 ++++++++++++++++++++
 util/cpuinfo-aarch64.c              |  1 +
 3 files changed, 71 insertions(+)

diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
index 82227890b4b4db03..05feeb4f4369fc19 100644
--- a/host/include/aarch64/host/cpuinfo.h
+++ b/host/include/aarch64/host/cpuinfo.h
@@ -9,6 +9,7 @@
 #define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
 #define CPUINFO_LSE             (1u << 1)
 #define CPUINFO_LSE2            (1u << 2)
+#define CPUINFO_AES             (1u << 3)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb63af7afa21588d..db79132778efd211 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -20,6 +20,11 @@
 
 #include "crypto/aes.h"
 
+#ifdef __aarch64__
+#include "host/cpuinfo.h"
+typedef uint8_t aes_vec_t __attribute__((vector_size(16)));
+#endif
+
 #if SHIFT == 0
 #define Reg MMXReg
 #define XMM_ONLY(...)
@@ -2165,6 +2170,20 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     Reg st = *v;
     Reg rk = *s;
 
+#ifdef __aarch64__
+    if (cpuinfo & CPUINFO_AES) {
+        asm("   .arch_extension aes             \n"
+            "   aesd    %0.16b, %1.16b          \n"
+            "   aesimc  %0.16b, %0.16b          \n"
+            "   eor     %0.16b, %0.16b, %2.16b  \n"
+            :   "=w"(*(aes_vec_t *)d)
+            :   "w"((aes_vec_t){}),
+                "w"(*(aes_vec_t *)s),
+                "0"(*(aes_vec_t *)v));
+        return;
+    }
+#endif
+
     for (i = 0 ; i < 2 << SHIFT ; i++) {
         int j = i & 3;
         d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
@@ -2180,6 +2199,19 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     Reg st = *v;
     Reg rk = *s;
 
+#ifdef __aarch64__
+    if (cpuinfo & CPUINFO_AES) {
+        asm("   .arch_extension aes             \n"
+            "   aesd    %0.16b, %1.16b          \n"
+            "   eor     %0.16b, %0.16b, %2.16b  \n"
+            :   "=w"(*(aes_vec_t *)d)
+            :   "w"((aes_vec_t){}),
+                "w"(*(aes_vec_t *)s),
+                "0"(*(aes_vec_t *)v));
+        return;
+    }
+#endif
+
     for (i = 0; i < 8 << SHIFT; i++) {
         d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
     }
@@ -2191,6 +2223,20 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     Reg st = *v;
     Reg rk = *s;
 
+#ifdef __aarch64__
+    if (cpuinfo & CPUINFO_AES) {
+        asm("   .arch_extension aes             \n"
+            "   aese    %0.16b, %1.16b          \n"
+            "   aesmc   %0.16b, %0.16b          \n"
+            "   eor     %0.16b, %0.16b, %2.16b  \n"
+            :   "=w"(*(aes_vec_t *)d)
+            :   "w"((aes_vec_t){}),
+                "w"(*(aes_vec_t *)s),
+                "0"(*(aes_vec_t *)v));
+        return;
+    }
+#endif
+
     for (i = 0 ; i < 2 << SHIFT ; i++) {
         int j = i & 3;
         d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * j + 0])] ^
@@ -2206,6 +2252,19 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     Reg st = *v;
     Reg rk = *s;
 
+#ifdef __aarch64__
+    if (cpuinfo & CPUINFO_AES) {
+        asm("   .arch_extension aes             \n"
+            "   aese    %0.16b, %1.16b          \n"
+            "   eor     %0.16b, %0.16b, %2.16b  \n"
+            :   "=w"(*(aes_vec_t *)d)
+            :   "w"((aes_vec_t){}),
+                "w"(*(aes_vec_t *)s),
+                "0"(*(aes_vec_t *)v));
+        return;
+    }
+#endif
+
     for (i = 0; i < 8 << SHIFT; i++) {
         d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
     }
@@ -2217,6 +2276,16 @@ void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     int i;
     Reg tmp = *s;
 
+#ifdef __aarch64__
+    if (cpuinfo & CPUINFO_AES) {
+        asm("   .arch_extension aes             \n"
+            "   aesimc  %0.16b, %1.16b          \n"
+            :   "=w"(*(aes_vec_t *)d)
+            :   "w"(*(aes_vec_t *)s));
+        return;
+    }
+#endif
+
     for (i = 0 ; i < 4 ; i++) {
         d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
                           AES_imc[tmp.B(4 * i + 1)][1] ^
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index f99acb788454e5ab..769cdfeb2fc32d5e 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -56,6 +56,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
     info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
     info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
+    info |= (hwcap & HWCAP_AES ? CPUINFO_AES : 0);
 #endif
 #ifdef CONFIG_DARWIN
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
-- 
2.39.2
