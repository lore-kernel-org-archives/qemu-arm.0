Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074268njc;
        Mon, 30 Sep 2024 00:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlpnblOuRQfVCrbBs7jjQfX3S871f6mEHIHQSYfhFaonnjmCS82WNSfpQUzscOwAbjn3aSuB/CR5VmVw==@linaro.org
X-Received: by 2002:a05:600c:1e25:b0:42c:bf94:f9ad with SMTP id 5b1f17b1804b1-42f5849cd09mr81830345e9.34.1727681730383;
        Mon, 30 Sep 2024 00:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681730; cv=none;
        d=google.com; s=arc-20240605;
        b=LhAeipCQ4gy6wO2qkgirNWIrvdTkhf0rVJFOto4Fviwv6TNk4u/hPOX+EZciYsjN8q
         QuxmDxYPp8U6yIA/R5JIY7qnLUw+sXVEwYXta/QU4x8bzJGEn5x1AzA16CMvdlxBXpgJ
         WwM03fK5VolvF9N2G4cCcFqSCkAzNt5VjXq1NZidmN1LlejC41sKvOA71Kc2jndGICNd
         okj2eobx/DSYcn2UirflSkAMvZXfMbx/+/tGE8r2Woq+1ZBC6yznJ9ALZy2IH3AM6+wc
         NvWDzq8dI8JnAgd8eKUw1+0/BfQsulTDcEfG8pM1tl6/k4WWlgQwOmFfHVMvmORSFZ/Q
         1wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xlB7TER95AHLu1cUEZk4SLXmuphORdTbB9q557qt3nU=;
        fh=lt7EYCAGV7H5Cz6J8U6dLxA9NIqwGhvMJ22RsIYRF8Q=;
        b=eZ9Z3aA0H6KmLxtqR2kl1VDb9glH90WFRgesecUitZZmdQlHxBQkm3Fg0M4StdtRrP
         7YsIy9b+WwBJMcbjAqViAHxAxI9QZwWkTrSU2zqgSU0cSzsjYJo51q85XxzTuuUq4pzF
         f1GJCLPHjRaANgoXN6u9F3hH4Ab3Kh+jIUaYKP8AirbedhYL4L1+KEh5ecItGeVPH3BH
         5qlTgzf+hkNej8sMhiS0fXYQ/FCk31zw1hOAgHMjM0u17ngh8h9JVfcFTSh/8RKGvJ9Q
         +vKWJWqivWp/4b1qrMFDA5iELICFQ6icvqTX/qZ1rBBmYKQQuphcblr3UCC1JyUxGPFR
         Hojw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLp6JknE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5f239748sor14240085e9.0.2024.09.30.00.35.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLp6JknE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681730; x=1728286530; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlB7TER95AHLu1cUEZk4SLXmuphORdTbB9q557qt3nU=;
        b=rLp6JknEBu43LCZOvqDM3RI7/e7TlmosL8pvXIJdhN2sMd6xZ/Se04WvkY09mXj4w/
         xxT9i/Na3HprCTKABWk5z9AwMElt98u345yAHbdWyQIpgTTu4OEmUtg+fHhE/pctFufO
         be8bHVynKJhu0PkHP1F1WluJ+9i5oaSYMQODIwkoVRzASZ2qWZKtGQwCCJJKmvuHkz3e
         0n2tSgKLQWlp2DaEi3XNjS1gG21j7KoDctFXNTeoElO7kIV4VxZBLYw2clC2gwKFin1W
         1XzWnMC6vlcuyDnGGjaeotDfInaeATN3bGZoiu075567NKkrOTRB9XFla8NFGMEfzqOO
         rNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681730; x=1728286530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlB7TER95AHLu1cUEZk4SLXmuphORdTbB9q557qt3nU=;
        b=NvwV54DKw5afRkXEwHELms4M+CWJseSBl2T9KuQ3Tyh3GS1O/n1UgHkZ0DaE6JhRYn
         3rkVigR5bmu+pITNoGckRBM31Y5cOQvBLghlLHRyC3w65RHEpdsRZnNklpwSFsIt72e0
         yjvYEhV+fZjK832BVZHBG8J/V0PmtB4PxId/yKjXJNSAzN/MY/zfPyImpdcxeNJQkF3g
         GQ/e1i4JgoI42F4k8SMmhn7Eg+RAIIg0Gh/CeJZiIlhT24fnep3e+U9pirJtT0J4FPOf
         4bzda/X0P+yzk2pcUDnXQqpiea64X+RcC3P/t4elgT2pszru+ah2VjKGHCggEh/EG7x6
         Ph0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYsjJ/DdnGuMWCOiHssp7XJ1tGHE8MfoBzjx0oMC++hhROIECaz+Ue/OPDQgwpvG9QVveTDkcrTf4JHg==@linaro.org
X-Gm-Message-State: AOJu0YwqghhD+hA1jnesEvBzE3f/UHIVWTvAy4nE16SAc3aTXmtkxzjg
	BmlVfgwLOu+7AnWLSxKiZ6USFfM/lhNsMeESr6eUJCOR5tCwiAv1G6GdzMnmB4GpUQ==
X-Google-Smtp-Source: AGHT+IEZ8g5gwHNeatvdEZTutoqFSh6yvDtTZN8q8xHzxZX5itZN8D5DVFr7TZeVgEpeEEf+jqHVXQ==
X-Received: by 2002:adf:fc4d:0:b0:37c:ca11:c08d with SMTP id ffacd0b85a97d-37cd5a833c7mr6070303f8f.24.1727681729610;
        Mon, 30 Sep 2024 00:35:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575dfd2sm8301463f8f.117.2024.09.30.00.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 04/13] hw/mips: Pass BlCpuCfg argument to bootloader API
Date: Mon, 30 Sep 2024 09:34:41 +0200
Message-ID: <20240930073450.33195-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LqiLVYeki5tP

In preparation to pass endianness and target word size to
the bootloader API, introduce an empty BlCpuCfg structure
and propagate it to the MIPS bootloader methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/mips/bootloader.h |  17 +++--
 hw/mips/bootloader.c         | 142 +++++++++++++++++++----------------
 hw/mips/boston.c             |   9 ++-
 hw/mips/fuloong2e.c          |   3 +-
 hw/mips/malta.c              |  21 +++---
 5 files changed, 109 insertions(+), 83 deletions(-)

diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
index c32f6c2835..744eb11d0e 100644
--- a/include/hw/mips/bootloader.h
+++ b/include/hw/mips/bootloader.h
@@ -10,17 +10,24 @@
 #define HW_MIPS_BOOTLOADER_H
 
 #include "exec/cpu-defs.h"
+#include "exec/target_long.h"
 
-void bl_gen_jump_to(void **ptr, target_ulong jump_addr);
-void bl_gen_jump_kernel(void **ptr,
+typedef struct bl_cpu_cfg {
+} BlCpuCfg;
+
+void bl_gen_jump_to(const BlCpuCfg *cfg, void **p, target_ulong jump_addr);
+void bl_gen_jump_kernel(const BlCpuCfg *cfg, void **ptr,
                         bool set_sp, target_ulong sp,
                         bool set_a0, target_ulong a0,
                         bool set_a1, target_ulong a1,
                         bool set_a2, target_ulong a2,
                         bool set_a3, target_ulong a3,
                         target_ulong kernel_addr);
-void bl_gen_write_ulong(void **ptr, target_ulong addr, target_ulong val);
-void bl_gen_write_u32(void **ptr, target_ulong addr, uint32_t val);
-void bl_gen_write_u64(void **ptr, target_ulong addr, uint64_t val);
+void bl_gen_write_ulong(const BlCpuCfg *cfg, void **ptr,
+                        target_ulong addr, target_ulong val);
+void bl_gen_write_u32(const BlCpuCfg *cfg, void **ptr,
+                      target_ulong addr, uint32_t val);
+void bl_gen_write_u64(const BlCpuCfg *cfg, void **ptr,
+                      target_ulong addr, uint64_t val);
 
 #endif
diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 1dd6ef2096..ee1a1c4f20 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -54,7 +54,7 @@ static bool bootcpu_supports_isa(uint64_t isa_mask)
     return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
 }
 
-static void st_nm32_p(void **ptr, uint32_t insn)
+static void st_nm32_p(const BlCpuCfg *cfg, void **ptr, uint32_t insn)
 {
     uint16_t *p = *ptr;
 
@@ -67,10 +67,10 @@ static void st_nm32_p(void **ptr, uint32_t insn)
 }
 
 /* Base types */
-static void bl_gen_nop(void **ptr)
+static void bl_gen_nop(const BlCpuCfg *cfg, void **ptr)
 {
     if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
-        st_nm32_p(ptr, 0x8000c000);
+        st_nm32_p(cfg, ptr, 0x8000c000);
     } else {
         uint32_t *p = *ptr;
 
@@ -80,7 +80,8 @@ static void bl_gen_nop(void **ptr)
     }
 }
 
-static void bl_gen_r_type(void **ptr, uint8_t opcode,
+static void bl_gen_r_type(const BlCpuCfg *cfg,
+                          void **ptr, uint8_t opcode,
                           bl_reg rs, bl_reg rt, bl_reg rd,
                           uint8_t shift, uint8_t funct)
 {
@@ -100,7 +101,8 @@ static void bl_gen_r_type(void **ptr, uint8_t opcode,
     *ptr = p;
 }
 
-static void bl_gen_i_type(void **ptr, uint8_t opcode,
+static void bl_gen_i_type(const BlCpuCfg *cfg,
+                          void **ptr, uint8_t opcode,
                           bl_reg rs, bl_reg rt, uint16_t imm)
 {
     uint32_t *p = *ptr;
@@ -118,16 +120,17 @@ static void bl_gen_i_type(void **ptr, uint8_t opcode,
 }
 
 /* Single instructions */
-static void bl_gen_dsll(void **p, bl_reg rd, bl_reg rt, uint8_t sa)
+static void bl_gen_dsll(const BlCpuCfg *cfg, void **p,
+                        bl_reg rd, bl_reg rt, uint8_t sa)
 {
     if (bootcpu_supports_isa(ISA_MIPS3)) {
-        bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
+        bl_gen_r_type(cfg, p, 0, 0, rt, rd, sa, 0x38);
     } else {
         g_assert_not_reached(); /* unsupported */
     }
 }
 
-static void bl_gen_jalr(void **p, bl_reg rs)
+static void bl_gen_jalr(const BlCpuCfg *cfg, void **p, bl_reg rs)
 {
     if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
         uint32_t insn = 0;
@@ -136,13 +139,14 @@ static void bl_gen_jalr(void **p, bl_reg rs)
         insn = deposit32(insn, 21, 5, BL_REG_RA);
         insn = deposit32(insn, 16, 5, rs);
 
-        st_nm32_p(p, insn);
+        st_nm32_p(cfg, p, insn);
     } else {
-        bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
+        bl_gen_r_type(cfg, p, 0, rs, 0, BL_REG_RA, 0, 0x09);
     }
 }
 
-static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
+static void bl_gen_lui_nm(const BlCpuCfg *cfg, void **ptr,
+                          bl_reg rt, uint32_t imm20)
 {
     uint32_t insn = 0;
 
@@ -153,16 +157,18 @@ static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
     insn = deposit32(insn, 2, 10, extract32(imm20, 9, 10));
     insn = deposit32(insn, 0, 1, sextract32(imm20, 19, 1));
 
-    st_nm32_p(ptr, insn);
+    st_nm32_p(cfg, ptr, insn);
 }
 
-static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
+static void bl_gen_lui(const BlCpuCfg *cfg, void **p,
+                       bl_reg rt, uint16_t imm)
 {
     /* R6: It's a alias of AUI with RS = 0 */
-    bl_gen_i_type(p, 0x0f, 0, rt, imm);
+    bl_gen_i_type(cfg, p, 0x0f, 0, rt, imm);
 }
 
-static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm12)
+static void bl_gen_ori_nm(const BlCpuCfg *cfg, void **ptr,
+                          bl_reg rt, bl_reg rs, uint16_t imm12)
 {
     uint32_t insn = 0;
 
@@ -172,15 +178,17 @@ static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm12)
     insn = deposit32(insn, 16, 5, rs);
     insn = deposit32(insn, 0, 12, imm12);
 
-    st_nm32_p(ptr, insn);
+    st_nm32_p(cfg, ptr, insn);
 }
 
-static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
+static void bl_gen_ori(const BlCpuCfg *cfg, void **p,
+                       bl_reg rt, bl_reg rs, uint16_t imm)
 {
-    bl_gen_i_type(p, 0x0d, rs, rt, imm);
+    bl_gen_i_type(cfg, p, 0x0d, rs, rt, imm);
 }
 
-static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t ofs12)
+static void bl_gen_sw_nm(const BlCpuCfg *cfg, void **ptr,
+                         bl_reg rt, uint8_t rs, uint16_t ofs12)
 {
     uint32_t insn = 0;
 
@@ -191,66 +199,71 @@ static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t ofs12)
     insn = deposit32(insn, 12, 4, 0b1001);
     insn = deposit32(insn, 0, 12, ofs12);
 
-    st_nm32_p(ptr, insn);
+    st_nm32_p(cfg, ptr, insn);
 }
 
-static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
+static void bl_gen_sw(const BlCpuCfg *cfg, void **p,
+                      bl_reg rt, uint8_t base, uint16_t offset)
 {
     if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
-        bl_gen_sw_nm(p, rt, base, offset);
+        bl_gen_sw_nm(cfg, p, rt, base, offset);
     } else {
-        bl_gen_i_type(p, 0x2b, base, rt, offset);
+        bl_gen_i_type(cfg, p, 0x2b, base, rt, offset);
     }
 }
 
-static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
+static void bl_gen_sd(const BlCpuCfg *cfg, void **p,
+                      bl_reg rt, uint8_t base, uint16_t offset)
 {
     if (bootcpu_supports_isa(ISA_MIPS3)) {
-        bl_gen_i_type(p, 0x3f, base, rt, offset);
+        bl_gen_i_type(cfg, p, 0x3f, base, rt, offset);
     } else {
         g_assert_not_reached(); /* unsupported */
     }
 }
 
 /* Pseudo instructions */
-static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
+static void bl_gen_li(const BlCpuCfg *cfg, void **p,
+                      bl_reg rt, uint32_t imm)
 {
     if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
-        bl_gen_lui_nm(p, rt, extract32(imm, 12, 20));
-        bl_gen_ori_nm(p, rt, rt, extract32(imm, 0, 12));
+        bl_gen_lui_nm(cfg, p, rt, extract32(imm, 12, 20));
+        bl_gen_ori_nm(cfg, p, rt, rt, extract32(imm, 0, 12));
     } else {
-        bl_gen_lui(p, rt, extract32(imm, 16, 16));
-        bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+        bl_gen_lui(cfg, p, rt, extract32(imm, 16, 16));
+        bl_gen_ori(cfg, p, rt, rt, extract32(imm, 0, 16));
     }
 }
 
-static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)
+static void bl_gen_dli(const BlCpuCfg *cfg, void **p,
+                       bl_reg rt, uint64_t imm)
 {
-    bl_gen_li(p, rt, extract64(imm, 32, 32));
-    bl_gen_dsll(p, rt, rt, 16);
-    bl_gen_ori(p, rt, rt, extract64(imm, 16, 16));
-    bl_gen_dsll(p, rt, rt, 16);
-    bl_gen_ori(p, rt, rt, extract64(imm, 0, 16));
+    bl_gen_li(cfg, p, rt, extract64(imm, 32, 32));
+    bl_gen_dsll(cfg, p, rt, rt, 16);
+    bl_gen_ori(cfg, p, rt, rt, extract64(imm, 16, 16));
+    bl_gen_dsll(cfg, p, rt, rt, 16);
+    bl_gen_ori(cfg, p, rt, rt, extract64(imm, 0, 16));
 }
 
-static void bl_gen_load_ulong(void **p, bl_reg rt, target_ulong imm)
+static void bl_gen_load_ulong(const BlCpuCfg *cfg, void **p,
+                              bl_reg rt, target_ulong imm)
 {
     if (bootcpu_supports_isa(ISA_MIPS3)) {
-        bl_gen_dli(p, rt, imm); /* 64bit */
+        bl_gen_dli(cfg, p, rt, imm); /* 64bit */
     } else {
-        bl_gen_li(p, rt, imm); /* 32bit */
+        bl_gen_li(cfg, p, rt, imm); /* 32bit */
     }
 }
 
 /* Helpers */
-void bl_gen_jump_to(void **p, target_ulong jump_addr)
+void bl_gen_jump_to(const BlCpuCfg *cfg, void **p, target_ulong jump_addr)
 {
-    bl_gen_load_ulong(p, BL_REG_T9, jump_addr);
-    bl_gen_jalr(p, BL_REG_T9);
-    bl_gen_nop(p); /* delay slot */
+    bl_gen_load_ulong(cfg, p, BL_REG_T9, jump_addr);
+    bl_gen_jalr(cfg, p, BL_REG_T9);
+    bl_gen_nop(cfg, p); /* delay slot */
 }
 
-void bl_gen_jump_kernel(void **p,
+void bl_gen_jump_kernel(const BlCpuCfg *cfg, void **p,
                         bool set_sp, target_ulong sp,
                         bool set_a0, target_ulong a0,
                         bool set_a1, target_ulong a1,
@@ -259,45 +272,48 @@ void bl_gen_jump_kernel(void **p,
                         target_ulong kernel_addr)
 {
     if (set_sp) {
-        bl_gen_load_ulong(p, BL_REG_SP, sp);
+        bl_gen_load_ulong(cfg, p, BL_REG_SP, sp);
     }
     if (set_a0) {
-        bl_gen_load_ulong(p, BL_REG_A0, a0);
+        bl_gen_load_ulong(cfg, p, BL_REG_A0, a0);
     }
     if (set_a1) {
-        bl_gen_load_ulong(p, BL_REG_A1, a1);
+        bl_gen_load_ulong(cfg, p, BL_REG_A1, a1);
     }
     if (set_a2) {
-        bl_gen_load_ulong(p, BL_REG_A2, a2);
+        bl_gen_load_ulong(cfg, p, BL_REG_A2, a2);
     }
     if (set_a3) {
-        bl_gen_load_ulong(p, BL_REG_A3, a3);
+        bl_gen_load_ulong(cfg, p, BL_REG_A3, a3);
     }
 
-    bl_gen_jump_to(p, kernel_addr);
+    bl_gen_jump_to(cfg, p, kernel_addr);
 }
 
-void bl_gen_write_ulong(void **p, target_ulong addr, target_ulong val)
+void bl_gen_write_ulong(const BlCpuCfg *cfg, void **p,
+                        target_ulong addr, target_ulong val)
 {
-    bl_gen_load_ulong(p, BL_REG_K0, val);
-    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_load_ulong(cfg, p, BL_REG_K0, val);
+    bl_gen_load_ulong(cfg, p, BL_REG_K1, addr);
     if (bootcpu_supports_isa(ISA_MIPS3)) {
-        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+        bl_gen_sd(cfg, p, BL_REG_K0, BL_REG_K1, 0x0);
     } else {
-        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+        bl_gen_sw(cfg, p, BL_REG_K0, BL_REG_K1, 0x0);
     }
 }
 
-void bl_gen_write_u32(void **p, target_ulong addr, uint32_t val)
+void bl_gen_write_u32(const BlCpuCfg *cfg, void **p,
+                      target_ulong addr, uint32_t val)
 {
-    bl_gen_li(p, BL_REG_K0, val);
-    bl_gen_load_ulong(p, BL_REG_K1, addr);
-    bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+    bl_gen_li(cfg, p, BL_REG_K0, val);
+    bl_gen_load_ulong(cfg, p, BL_REG_K1, addr);
+    bl_gen_sw(cfg, p, BL_REG_K0, BL_REG_K1, 0x0);
 }
 
-void bl_gen_write_u64(void **p, target_ulong addr, uint64_t val)
+void bl_gen_write_u64(const BlCpuCfg *cfg, void **p,
+                      target_ulong addr, uint64_t val)
 {
-    bl_gen_dli(p, BL_REG_K0, val);
-    bl_gen_load_ulong(p, BL_REG_K1, addr);
-    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+    bl_gen_dli(cfg, p, BL_REG_K0, val);
+    bl_gen_load_ulong(cfg, p, BL_REG_K1, addr);
+    bl_gen_sd(cfg, p, BL_REG_K0, BL_REG_K1, 0x0);
 }
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1b44fb354c..8e210876e1 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -325,23 +325,24 @@ type_init(boston_register_types)
 
 static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
 {
+    const BlCpuCfg bl_cfg = { };
     uint64_t regaddr;
 
     /* Move CM GCRs */
     regaddr = cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
-    bl_gen_write_ulong(&p, regaddr,
+    bl_gen_write_ulong(&bl_cfg, &p, regaddr,
                        boston_memmap[BOSTON_CM].base);
 
     /* Move & enable GIC GCRs */
     regaddr = cpu_mips_phys_to_kseg1(NULL, boston_memmap[BOSTON_CM].base
                                            + GCR_GIC_BASE_OFS),
-    bl_gen_write_ulong(&p, regaddr,
+    bl_gen_write_ulong(&bl_cfg, &p, regaddr,
                        boston_memmap[BOSTON_GIC].base | GCR_GIC_BASE_GICEN_MSK);
 
     /* Move & enable CPC GCRs */
     regaddr = cpu_mips_phys_to_kseg1(NULL, boston_memmap[BOSTON_CM].base
                                            + GCR_CPC_BASE_OFS),
-    bl_gen_write_ulong(&p, regaddr,
+    bl_gen_write_ulong(&bl_cfg, &p, regaddr,
                        boston_memmap[BOSTON_CPC].base | GCR_CPC_BASE_CPCEN_MSK);
 
     /*
@@ -352,7 +353,7 @@ static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
      * a2/$6 = 0
      * a3/$7 = 0
      */
-    bl_gen_jump_kernel(&p,
+    bl_gen_jump_kernel(&bl_cfg, &p,
                        true, 0, true, (int32_t)-2,
                        true, fdt_addr, true, 0, true, 0,
                        kernel_entry);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 6e4303ba47..a989637d3b 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -165,6 +165,7 @@ static uint64_t load_kernel(MIPSCPU *cpu)
 static void write_bootloader(CPUMIPSState *env, uint8_t *base,
                              uint64_t kernel_addr)
 {
+    const BlCpuCfg bl_cfg = { };
     uint32_t *p;
 
     /* Small bootloader */
@@ -178,7 +179,7 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     /* Second part of the bootloader */
     p = (uint32_t *)(base + 0x040);
 
-    bl_gen_jump_kernel((void **)&p,
+    bl_gen_jump_kernel(&bl_cfg, (void **)&p,
                        true, ENVP_VADDR - 64,
                        true, 2, true, ENVP_VADDR,
                        true, ENVP_VADDR + 8,
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 664a2ae0a9..fc485cc884 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -624,6 +624,7 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
     static const char pci_pins_cfg[PCI_NUM_PINS] = {
         10, 10, 11, 11 /* PIIX IRQRC[A:D] */
     };
+    const BlCpuCfg bl_cfg = { };
 
     /* Bus endianness is always reversed */
 #if TARGET_BIG_ENDIAN
@@ -635,29 +636,29 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
     /* setup MEM-to-PCI0 mapping as done by YAMON */
 
     /* move GT64120 registers from 0x14000000 to 0x1be00000 */
-    bl_gen_write_u32(p, /* GT_ISD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_ISD */
                      cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
                      cpu_to_gt32(0x1be00000 << 3));
 
     /* setup PCI0 io window to 0x18000000-0x181fffff */
-    bl_gen_write_u32(p, /* GT_PCI0IOLD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0IOLD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
                      cpu_to_gt32(0x18000000 << 3));
-    bl_gen_write_u32(p, /* GT_PCI0IOHD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0IOHD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
                      cpu_to_gt32(0x08000000 << 3));
 
     /* setup PCI0 mem windows */
-    bl_gen_write_u32(p, /* GT_PCI0M0LD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0M0LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
                      cpu_to_gt32(0x10000000 << 3));
-    bl_gen_write_u32(p, /* GT_PCI0M0HD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0M0HD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
                      cpu_to_gt32(0x07e00000 << 3));
-    bl_gen_write_u32(p, /* GT_PCI0M1LD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0M1LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
                      cpu_to_gt32(0x18200000 << 3));
-    bl_gen_write_u32(p, /* GT_PCI0M1HD */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0M1HD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
                      cpu_to_gt32(0x0bc00000 << 3));
 
@@ -668,16 +669,16 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
      * Load the PIIX IRQC[A:D] routing config address, then
      * write routing configuration to the config data register.
      */
-    bl_gen_write_u32(p, /* GT_PCI0_CFGADDR */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0_CFGADDR */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcf8),
                      tswap32((1 << 31) /* ConfigEn */
                              | PCI_BUILD_BDF(0, PIIX4_PCI_DEVFN) << 8
                              | PIIX_PIRQCA));
-    bl_gen_write_u32(p, /* GT_PCI0_CFGDATA */
+    bl_gen_write_u32(&bl_cfg, p, /* GT_PCI0_CFGDATA */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0xcfc),
                      tswap32(ldl_be_p(pci_pins_cfg)));
 
-    bl_gen_jump_kernel(p,
+    bl_gen_jump_kernel(&bl_cfg, p,
                        true, ENVP_VADDR - 64,
                        /*
                         * If semihosting is used, arguments have already
-- 
2.45.2
