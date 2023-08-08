Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2220768ejb;
        Tue, 8 Aug 2023 07:19:42 -0700 (PDT)
X-Received: by 2002:a17:903:44f:b0:1bb:b91b:2b3c with SMTP id iw15-20020a170903044f00b001bbb91b2b3cmr10206905plb.34.1691504382381;
        Tue, 08 Aug 2023 07:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691504382; cv=none;
        d=google.com; s=arc-20160816;
        b=vwjHkP1bboYS+1YdQ/pZP41rUdFOluVhSff+4Qr8jHYlQYN+jilmrJhQWtRJO8LIFZ
         tOaL85qbwAePH1gj2ggiD2aoO0//I4dJT3XzU+NWYX7DziJQ2vn7ZA3AFcT0QM2/S9RL
         1cD56n0wkAANTLE1x4DpB9iu3YujE0NeB6K2G1Kc0hCteEWYiEhgN/PnWHK3Y0afaHry
         rOevviIjJITq2Dr6lYgTylRaid/VXNgRo+ecB0R+/Km7HKLIK/4oqjNhZwty24Y/6974
         XGCiATRu/DReYajmIHdr1Sa6nSbjHm1G7xj4CFdWEdxQAIPMU6p/WQSNCTKkW18AXefr
         nDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mf2N6SezX4W3DKkhSHLdtBmZLWd1QdX4LdESVzPnYbo=;
        fh=TnbiiC1OrbFGzN+QyfS9fCWM7WpVW05O2z3CL0h3NOs=;
        b=kxTPJLedJnnSoEvB3A6Oz+7OE3JQ2Sk18LpWAIIkpfqS81tCOmH0crCrK23iNdr/f8
         M++sFXqHWGtKlz4AuVIRdJkDTeEpwOfRF0GcEXorXFz15gUqlkh02X/0V1lGu9bj517u
         G6yPFSQoUoR3zbMsd6eZcwRtp1m3s2vJhDpMT6S5bSRhjKAhgrja8oo26uyMB8mb803Y
         x0ow/ez5ar6a4cTycT+St6b9exzMMSHOGj40ALzThjebZAhfyy/LIJFxc31CsjfOqboE
         O4cNuEosyWQoWVJ9ysWHYEYUHPnYI4jCI+eAgaIcSBVbhtmD8ZhmzXbnquT/WelrDVuf
         o/1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=QIrgOx3Q;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t12-20020a170902d14c00b001bb779f53a3sor3817471plt.13.2023.08.08.07.19.42
        (Google Transport Security);
        Tue, 08 Aug 2023 07:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=QIrgOx3Q;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691504381; x=1692109181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf2N6SezX4W3DKkhSHLdtBmZLWd1QdX4LdESVzPnYbo=;
        b=QIrgOx3QmetwrI/AsEqyVSIGu3U5LKvGC0y/4Ots6XzUyKv6ugBd6jz/IEvP03knRZ
         Yzw9TrXirpQEy0itWF5lleJN9Og+bg1FTD0uxi76mDYY8ccmnsmpTdS5Q6G8bmPEjgzr
         r4LKIYgCuxG3c1eY/bnBLWxWMG1mvALCxK1zwfqU9ZRFp4P96oAHbR+KrR/mBSJcsUCU
         ZJAiEQb7YwPjaXAI4r1P2NYVg8o/uR0j/3yVsqACYR4fEZftpVlqldSgCg0mG+ur7E/9
         6stk47FGwNSVCQ+BeTDYx38FpRcJwvHPQ9S2YYOIQRJNcpO2YZUlE5+ancvWKbjmwSyZ
         EuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691504381; x=1692109181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf2N6SezX4W3DKkhSHLdtBmZLWd1QdX4LdESVzPnYbo=;
        b=cUFLFI8C+rXuQ+FaBt5Cz4W9IrY0iZrgXCkc8pyMeYVmbRIu1S9dbzSaUSJyZlgPG/
         8GQtYWzGV2fXJ3XVAXm9EWYnkuHtSj1hnsAo9EKlFzQn/IEfXCrwkm5P1a8u/kW3Ynb1
         fQcTg+0MSHUyTIDnIYJl4ObY/LPszS8iaorZbaGtz20WvjaYNA9bFbGGk5HhpTZRZheJ
         PLeKOWGBR3CsOzD+zo1IW+x4NIfEaMhc/fxxRatq09wmOdotpDfgWfRUNsLqbRG7G4BF
         BJHCXZLiGruswPewnyq3baAdZFYAvJQKu9OlO0foNn2SRqEP8tapaqvNtORy/0/f3KOc
         hgrQ==
X-Gm-Message-State: AOJu0YxO4OrniPrcpYeUMV4Wam09xdaPTnjWhkhmK8v+sAVYhfZJgaec
	FYCq9ERRAIZvbSstKvLjgcToII+Sadbti9mI
X-Google-Smtp-Source: AGHT+IF5r0w7UHfokoRrcnZ3Ohll5jr5lhOigingkY1h78bNSaGTyYwKqJR/OaVGyhPqycbUaI4dmQ==
X-Received: by 2002:a17:903:22c6:b0:1bc:6707:f451 with SMTP id y6-20020a17090322c600b001bc6707f451mr6712771plg.42.1691504381474;
        Tue, 08 Aug 2023 07:19:41 -0700 (PDT)
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from localhost.localdomain ([223.104.41.22])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902b68300b001bb1f0605b2sm9043985pls.214.2023.08.08.07.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 07:19:41 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: alex.bennee@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-devel@nongnu.org,
	Yeqi Fu <fufuyqqqqqq@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC v4 09/11] target/arm: Add support for native library calls
Date: Tue,  8 Aug 2023 22:17:37 +0800
Message-Id: <20230808141739.3110740-10-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808141739.3110740-1-fufuyqqqqqq@gmail.com>
References: <20230808141739.3110740-1-fufuyqqqqqq@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6ANPRhJZOQ9u

This commit introduces support for native library calls on the
arm target. When special instructions reserved for native calls
are encountered, the code now performs address translation and
generates the corresponding native call.

Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 configs/targets/aarch64-linux-user.mak |  1 +
 configs/targets/arm-linux-user.mak     |  1 +
 target/arm/tcg/translate-a64.c         | 14 ++++++++++++++
 target/arm/tcg/translate.c             | 11 +++++++++++
 4 files changed, 27 insertions(+)

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index ba8bc5fe3f..5a8fd98cd9 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -4,3 +4,4 @@ TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+CONFIG_NATIVE_CALL=y
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index 7f5d65794c..f934fb82da 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -5,3 +5,4 @@ TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+CONFIG_NATIVE_CALL=y
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3baab6aa60..422d943f92 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -25,6 +25,7 @@
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
+#include "native/native.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
@@ -2400,6 +2401,19 @@ static bool trans_HLT(DisasContext *s, arg_i *a)
      * it is required for halting debug disabled: it will UNDEF.
      * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
      */
+    if (native_bypass_enabled() && (a->imm == 0xffff)) {
+        TCGv_i64 arg1 = tcg_temp_new_i64();
+        TCGv_i64 arg2 = tcg_temp_new_i64();
+        TCGv_i64 arg3 = tcg_temp_new_i64();
+        TCGv_i64 ret = tcg_temp_new_i64();
+        const char *fun_name = lookup_symbol((s->base.pc_next) & 0xfff);
+        tcg_gen_mov_i64(arg1, cpu_reg(s, 0));
+        tcg_gen_mov_i64(arg2, cpu_reg(s, 1));
+        tcg_gen_mov_i64(arg3, cpu_reg(s, 2));
+        gen_native_call_i64(fun_name, ret, arg1, arg2, arg3);
+        tcg_gen_mov_i64(cpu_reg(s, 0), ret);
+        return true;
+    }
     if (semihosting_enabled(s->current_el == 0) && a->imm == 0xf000) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 13c88ba1b9..a095ebcea6 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -27,6 +27,7 @@
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
+#include "native/native.h"
 #include "exec/helper-proto.h"
 
 #define HELPER_H "helper.h"
@@ -1139,6 +1140,16 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
+    if (native_bypass_enabled() && (imm == 0xffff)) {
+        TCGv_i32 arg1 = load_reg(s, 0);
+        TCGv_i32 arg2 = load_reg(s, 1);
+        TCGv_i32 arg3 = load_reg(s, 2);
+        TCGv_i32 ret = tcg_temp_new_i32();
+        const char *fun_name = lookup_symbol((s->base.pc_next) & 0xfff);
+        gen_native_call_i32(fun_name, ret, arg1, arg2, arg3);
+        store_reg(s, 0, ret);
+        return;
+    }
     if (semihosting_enabled(s->current_el == 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
-- 
2.34.1
