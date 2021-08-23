Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1914090lfg;
        Mon, 23 Aug 2021 07:20:44 -0700 (PDT)
X-Received: by 2002:a63:e413:: with SMTP id a19mr32223759pgi.408.1629728443984;
        Mon, 23 Aug 2021 07:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629728443; cv=none;
        d=google.com; s=arc-20160816;
        b=jYZXlArVxXqAouBTVT75/43Z5eY2X7RQHoSJEZ2HlWdXViU8kbJTItPlf68OnT6HNx
         X9RPOGhvzBwtY/Ovk0bbCqPN0COCyoRjLy8d5gxMfclKt1bmbtiLag0cNdCcAGz/3QaX
         t8qrrPgSkSd/IslXstBxg1gBEcUe1sYM6r21yxgecQe0NX2qTglSEBp6alwil+lziB2K
         oTHbDcclE7B3lVs5puKbP/zF3Pfk+r6y9zkW+Ne9zUaAOIeYGo6ZMKGc8u/qlOX12dHA
         ncFKoBnYKiBj4LqOMo6sMWe/h3wU2no+5NFa9D9n4HB4ckFqkIBg8tDRtz7qaBaT96gk
         plbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5D9FApNhc2a0k19sWbEd/XosOX9mhbOuJ6xDPXb9jWw=;
        b=jDfJaIHQqAxPt/yytV4NaaQSzCIBdKtuT3oHZuIpIw9RntCI8SymxRFpEPuZkPRLiG
         1NXFvpWilgrIVQJwHmVjn12/9499KTFZU1biksn2B4SVyxCiXBwD/YTNC22WMLwVgu5x
         vpMpiJb0IUZIcrGf+ByH4ZXlQGliXRmOxF1CN1LtCBkYB7muiiVhlY0EWjfpEH2CP2ef
         JSVZzLsXFO7qiTRJzh/AOFs/qBmbn6YQmoHnjGXBmnWc6wtZpruiAKmDi+dp3GyCqbj1
         edKSIupGUVrJvaokNjxhGBDGyQRo+J0HjG27z6OPPPkxLKo8k81iMDYSYZNvpw9XF0vN
         o8Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="lMG/pYLE";
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <changbin.du@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q5sor8369021pls.37.2021.08.23.07.20.43
        (Google Transport Security);
        Mon, 23 Aug 2021 07:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="lMG/pYLE";
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5D9FApNhc2a0k19sWbEd/XosOX9mhbOuJ6xDPXb9jWw=;
        b=lMG/pYLEidi204zCE4WRaDperRI81Mg1LBLXvDPEGLTL41B7oFSVn4V9DTPABZ0m+w
         sOL6fdeV9riAfh/UPaTRA25rlFngsK1rG9SqjFlV1EbaGxgxhisDuvZYIjhy8FsucX7M
         7mLji7W4Oomnl/X71yvY+8I415IOBZlaYBQFJN7dvIlLNwN9nykEUVJLdLA04NxhACG+
         896x/lgULqk4NuD6KnHAIVkOVhA7IBn6ayKORvp2rq4N1C7ckdPouFzPzOWUjVzs7mKQ
         Mui+MWj7VVl4iM2VvRhUrgrt/VrKo4fbxg5e2R/1gZkNThcC9Ton6drvAZJuwYxTUbn+
         6caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5D9FApNhc2a0k19sWbEd/XosOX9mhbOuJ6xDPXb9jWw=;
        b=i+l+nVs/u7MokSVo2P2E5D2RiMp//Zy3zJLXKkEE8z/jZRPkNWk7AfL/xR2TboPBI9
         J503Dy/LS/+e9asr/T1HQI0hG0xJV0Grfq3Cq0Amp5TAmEP+n4y9Kk/C2TwXn68k6tJL
         bHWIjmyoURhVmrV/7/hYFFGf9pRRSLLzdXWpKnt/vxyemA0ogbd0lspIllaBkgBscD5R
         +c/Z6YniLXU70u/gLLStDITe76xd5nDRYlZ/6prW8hOOnphtjv+fh0H5v+K9W/bjRNhN
         XAcMcKEeEUZaCCN9ECiumP+qqy0ASXgobfasjBa+kvxsDPcEMM/BLToiaFftBizuiBmz
         NLCg==
X-Gm-Message-State: AOAM532Gg0hN9IA6/JPvGsZzY23SFWD3ZnA8DItr8X8CCWFVOOl6nmNd
	PvE66qtpE33bz3Gql9+a1nQ9h6CCLAQKAg==
X-Google-Smtp-Source: ABdhPJzbFKefHARHcAaF0HEexqzooh290ZY7h8icByME05bNJ1eV+1520ISNycvqWorUBues6tCBRA==
X-Received: by 2002:a17:902:d504:b029:12d:65dd:6034 with SMTP id b4-20020a170902d504b029012d65dd6034mr28677433plg.85.1629728443251;
        Mon, 23 Aug 2021 07:20:43 -0700 (PDT)
Return-Path: <changbin.du@gmail.com>
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:20:42 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 3/3] riscv: gdbstub: add support for switchable endianness
Date: Mon, 23 Aug 2021 22:20:04 +0800
Message-Id: <20210823142004.17935-4-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kyR4r3rjHBv7

Apply new gdbstub interfaces we added previously to support both little
and big endian guest debugging for RISC-V. And enable the
TARGET_SWICHABLE_ENDIANNESS option.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 configs/targets/riscv32-softmmu.mak |  1 +
 configs/targets/riscv64-softmmu.mak |  1 +
 target/riscv/gdbstub.c              | 12 ++++++------
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/configs/targets/riscv32-softmmu.mak b/configs/targets/riscv32-softmmu.mak
index d8b71cddcd..7f02e67c72 100644
--- a/configs/targets/riscv32-softmmu.mak
+++ b/configs/targets/riscv32-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/configs/targets/riscv64-softmmu.mak b/configs/targets/riscv64-softmmu.mak
index 7c0e7eeb42..c3e812495c 100644
--- a/configs/targets/riscv64-softmmu.mak
+++ b/configs/targets/riscv64-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a7a9c0b1fe..d639cea859 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -42,10 +42,10 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         /* discard writes to x0 */
         return sizeof(target_ulong);
     } else if (n < 32) {
-        env->gpr[n] = ldtul_p(mem_buf);
+        env->gpr[n] = gdb_read_regl(mem_buf);
         return sizeof(target_ulong);
     } else if (n == 32) {
-        env->pc = ldtul_p(mem_buf);
+        env->pc = gdb_read_regl(mem_buf);
         return sizeof(target_ulong);
     }
     return 0;
@@ -81,11 +81,11 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
 static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
-        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
+        env->fpr[n] = gdb_read_reg64(mem_buf); /* always 64-bit */
         return sizeof(uint64_t);
     /* there is hole between ft11 and fflags in fpu.xml */
     } else if (n < 36 && n > 32) {
-        target_ulong val = ldtul_p(mem_buf);
+        target_ulong val = gdb_read_regl(mem_buf);
         int result;
         /*
          * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
@@ -118,7 +118,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
     if (n < CSR_TABLE_SIZE) {
-        target_ulong val = ldtul_p(mem_buf);
+        target_ulong val = gdb_read_regl(mem_buf);
         int result;
 
         result = riscv_csrrw_debug(env, n, NULL, val, -1);
@@ -145,7 +145,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 {
     if (n == 0) {
 #ifndef CONFIG_USER_ONLY
-        cs->priv = ldtul_p(mem_buf) & 0x3;
+        cs->priv = gdb_read_regl(mem_buf) & 0x3;
         if (cs->priv == PRV_H) {
             cs->priv = PRV_S;
         }
-- 
2.32.0
