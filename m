Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp405920ejb;
        Thu, 1 Jun 2023 05:33:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7HeCKyCDJmZ5fiKUZ//uD5PngTvGY0wMem6SIQ8hvDXgcRzZINeeakfKSj/R82JCnMWn8s
X-Received: by 2002:a05:6830:189:b0:6a5:f7a8:3ec7 with SMTP id q9-20020a056830018900b006a5f7a83ec7mr3079034ota.20.1685622822121;
        Thu, 01 Jun 2023 05:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685622822; cv=none;
        d=google.com; s=arc-20160816;
        b=HqEKNgkWRekI9X0i2tzUUs/Dail32urV29tTCE3PCwFxnMp3aPBhvBSwRj2GkYoS10
         crW0+NFCNhIWjOQ7KQCW07qss6P5FH7aQaDBXpi4P+mDERWu6pZziPEEEOuCFjfn62ym
         R/yMmL7B3TFOuO1uG2Evu/yx6Kb023DRsqxa6i+BBW4usEu0x8IfTym+x4HpTCybSyJ1
         caCq0gvoHh6aT/ShEoQKocqDqQp4b5diBHoBxgswGy7cZaj9jL6a65eRZcYEXUyVvq7x
         bQ5Wm7u6Zzf+s3AaJkp6QI92yvqs/DFuWKed9hFL5vAc5vPwj03eXBGxl637SQ6lRP7X
         w3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6vpx5TYtcjQOEO25BXt+lzmn41Cv9OHTZKvB4B82/c4=;
        b=inAbM9R6Eq7NepCr5s0PmrOw/EBZcesOhHwlLYOBe8hiefuIQsLtSIFQFEQaGcPNwd
         CDko5T7Sqe39kww7oSYMjRJAq2v8fCL/m6nVOsEkn8X0WACKrHmsKjl9oYR99Z9smBHH
         EuxuWzhyNOQ8G5cswSx/SnZge7cTkrVaFhfWdZmGwPfFivkyn5ig3GbCC8EOBWNk91nw
         KPRv/MgRVjbqf/9Si5TK//podKOLzgDRKsjl0XQBbaTUmnea8IGoKysq7sHoi3wTA6oV
         hoIzQtzHN5uYGTmsHniloM876Ju1IqCNGNbxi0Ci5tkw6wECCtwKmo28wGYCJDQngCbI
         SBoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=GZOMIycM;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id v21-20020a9d6055000000b006ab0a4b9298si284124otj.206.2023.06.01.05.33.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:33:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=GZOMIycM;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3E1064405;
	Thu,  1 Jun 2023 12:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BDEC433D2;
	Thu,  1 Jun 2023 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685622821;
	bh=Altb9gx/izM5ctcWAjcLXu6Yyml5zlbxuXilVs0UmFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZOMIycMpsrQMgWQub7f7W5KecPa0htilzegtPRZVV7dX86TBWYfO8GC4k+7CVL1K
	 fytcJcC2MRz42POdqP0eYPWYGVIiLyqMPOMR+qHc29odiSWy3gdHQn4oluwz/rvOIn
	 kLeMxPxh4FbuGMYQvsYtoQUejIl+tE8MKuP0JruPTqt43HGA3ICuh9BZ4MNSOrQkeD
	 CwBHBLmvmljrBQhx4bOxVdZQqcwANUtCXluwIThgkzG1BefRDcYgTLZL+zZ/BrIzbh
	 GkU/weYMmjo8zO+dD80E9lFfGj60RALZjYCzRXj1InfI7qsfxCUhbspWhkJPhJ+GIe
	 rW2UdIRZ4dVAA==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] target/i386: Implement PCLMULQDQ using AArch64 PMULL instructions
Date: Thu,  1 Jun 2023 14:33:32 +0200
Message-Id: <20230601123332.3297404-3-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601123332.3297404-1-ardb@kernel.org>
References: <20230601123332.3297404-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517; i=ardb@kernel.org; h=from:subject; bh=Altb9gx/izM5ctcWAjcLXu6Yyml5zlbxuXilVs0UmFo=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaVigvj0tBJulgUChyb9Smtwzz1c0CnMWP7nX2Hjpv+rP uZzKN/pKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNZUM7wh0M5+PSp2EWLTqs+ e/qF3Zs/9/aDTY9adUT3S4oKRE340cbwz2TO9Ak2e9/07FBraGhxmB+j3sbC01HyenqewiWLLsb v7AA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-TUID: plm6c4E0MLoR

Use the AArch64 PMULL{2}.P64 instructions to implement PCLMULQDQ instead
of emulating them in C code if the host supports this. This is used in
the implementation of GCM, which is widely used in IPsec VPN and HTTPS.

Somewhat surprising results: on my ThunderX2, enabling this on top of
the AES acceleration I sent out earlier, the speedup is substantial.

(1420 is a typical IPsec block size - in HTTPS, GCM operates on much
larger block sizes but the kernel mode benchmarks are not the best place
to measure its performance in this mode)

tcrypt: testing speed of rfc4106(gcm(aes)) (rfc4106-gcm-aesni) encryption

No acceleration
tcrypt: test 5 (160 bit key, 1420 byte blocks): 10046 operations in 1 seconds (14265320 bytes)

AES acceleration
tcrypt: test 5 (160 bit key, 1420 byte blocks): 13970 operations in 1 seconds (19837400 bytes)

AES + PMULL acceleration
tcrypt: test 5 (160 bit key, 1420 byte blocks): 24372 operations in 1 seconds (34608240 bytes)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 host/include/aarch64/host/cpuinfo.h |  1 +
 target/i386/ops_sse.h               | 24 ++++++++++++++++++++
 util/cpuinfo-aarch64.c              |  1 +
 3 files changed, 26 insertions(+)

diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
index 05feeb4f4369fc19..da268dce1390cac0 100644
--- a/host/include/aarch64/host/cpuinfo.h
+++ b/host/include/aarch64/host/cpuinfo.h
@@ -10,6 +10,7 @@
 #define CPUINFO_LSE             (1u << 1)
 #define CPUINFO_LSE2            (1u << 2)
 #define CPUINFO_AES             (1u << 3)
+#define CPUINFO_PMULL           (1u << 4)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index db79132778efd211..d7e7bd8b733122a8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2157,6 +2157,30 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
     uint64_t a, b;
     int i;
 
+#ifdef __aarch64__
+    if (cpuinfo & CPUINFO_PMULL) {
+        aes_vec_t vv = *(aes_vec_t *)v, vs = *(aes_vec_t *)s;
+        aes_vec_t *vd = (aes_vec_t *)d;
+
+        switch (ctrl & 0x11) {
+        case 0x1:
+            asm("ext %0.16b, %0.16b, %0.16b, #8":"+w"(vv));
+            /* fallthrough */
+        case 0x0:
+            asm(".arch_extension aes\n"
+                "pmull %0.1q, %1.1d, %2.1d":"=w"(*vd):"w"(vv),"w"(vs));
+            break;
+        case 0x10:
+            asm("ext %0.16b, %0.16b, %0.16b, #8":"+w"(vv));
+            /* fallthrough */
+        case 0x11:
+            asm(".arch_extension aes\n"
+                "pmull2 %0.1q, %1.2d, %2.2d":"=w"(*vd):"w"(vv),"w"(vs));
+        }
+        return;
+    }
+#endif
+
     for (i = 0; i < 1 << SHIFT; i += 2) {
         a = v->Q(((ctrl & 1) != 0) + i);
         b = s->Q(((ctrl & 16) != 0) + i);
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index 769cdfeb2fc32d5e..95ec1f4adfc829b9 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -57,6 +57,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
     info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
     info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
     info |= (hwcap & HWCAP_AES ? CPUINFO_AES : 0);
+    info |= (hwcap & HWCAP_PMULL ? CPUINFO_PMULL : 0);
 #endif
 #ifdef CONFIG_DARWIN
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
-- 
2.39.2
