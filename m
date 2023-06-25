Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp621896ejx;
        Sun, 25 Jun 2023 14:27:42 -0700 (PDT)
X-Received: by 2002:a17:903:280d:b0:1ae:3991:e4f9 with SMTP id kp13-20020a170903280d00b001ae3991e4f9mr5003481plb.61.1687728462326;
        Sun, 25 Jun 2023 14:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687728462; cv=none;
        d=google.com; s=arc-20160816;
        b=TIPfDJzCqyatLtfEbvWmXY75W7Usk8gKPRI/wcOgMqWWP0C+MSEf/HSn9+iRUJ7KKZ
         +9eUURvq/rl636KLQbGQYqHVelauNqLugA8wwX4UvxWoNhc06WwXakp0Btak4MwaDaOU
         40E8ByyxgEX6v1f/+teqU6w7G9rOCa7Z9QEJDtquCFk+P3tN5wiaTN5xgPcpCHvMDJSk
         Ju/UCKQ/RBHG0vJ+AjdI8HdcWEf4c1JHOfK/0RWrh5Oa+mLOYurejJ2BEhXJjB+gzRpP
         dvkGEmEMpMpqRO/ZntFfLXPoaqlp9E7pE3kv+DaeuNs/ZNU362ulgbTrF9gX13WTy4zX
         cvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ELXa0RrQCUVaZ33o/5bUxq4k9BhayvG3Y38hDK3c1b8=;
        fh=a7Zw3srtQZNHPLSLf2lw1+UBvCrtWRaYMAIR3zEeLeI=;
        b=hANm8k5Q6lbEv53XLivVSb68unZVxB+ip0aMAyiSL4jkMc5tp4ZJX6K1VvnlBm1xNb
         gF1EQRAp8J6pgCcjGVoaPC1aZc/U4lIo4zYRqqT4yxgy2eYslBP6vjbs25LPnTYppm0U
         0vBf5KoNx9+69DVWTtqno0XvyKIRbujFuyY+O/SJ6NxNfL1lIlH+91DU4BdcY+98Reqy
         DUsmJRegG/qTTzBTZ23dBVi9xF4NgL9dX6OxXiT1jg9eFT8ZeY+UpHZe5rJpFd0uZLE0
         LefAUfxJzkAy7Uu6tGr2YszBiQTdeg1OD8AFL1++KUYpyM9MDQlzNXiZJ/HabdATbYf3
         Abbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=YvlJBQjg;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t20-20020a170902d29400b001b7eddd4d92sor1009846plc.3.2023.06.25.14.27.42
        (Google Transport Security);
        Sun, 25 Jun 2023 14:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=YvlJBQjg;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728461; x=1690320461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELXa0RrQCUVaZ33o/5bUxq4k9BhayvG3Y38hDK3c1b8=;
        b=YvlJBQjgiPMeFSRavw8zMmmxwPjaDMpCr2Q8vcJvpEJt/SNfeA8Nj3c/Mx7lfKerM8
         wCXtStzjjG2qaoQrNaTWw8PK/DadHoExFpqRAac/MP1fCp9qyDv0sYy9h8eodqU8ISE6
         adzKOin38TAy2wcXbMtkV465M0mRbG44B4DAX1NnY5PQeBfCfNkHhoAIJ9w9Q9dJBNyH
         FngiRbjArx6ArU+QSJc/JIeD8i0D1Q4jaYuoGyijOA7CbgT7DBJcP1aYjPWWAq0+Kk2h
         oN+LQhaB5JgoqR1YMPmHE7fkUFe2K+CInWefFfvmwT+v7mIZv1EDnC9NYFdjQrlMhAPY
         aPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728461; x=1690320461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELXa0RrQCUVaZ33o/5bUxq4k9BhayvG3Y38hDK3c1b8=;
        b=hvmVjnTP/ZoyfHT7OCO3tWCr4S6pXE0KShYxUyhEW1/NDJhLdqbH99sv+LZftsomM7
         +dlWG8sFjS57q4g84r+hTzd7jTnWUxkwNmnwO91hgQUCbQENtOnuRwB2nQCZzYJ8xQcv
         iSwTtAOY3sRsGzEJpqBpTKNxBETkixyo3yoCN6Yh4vx7PmFWEQtQ4jMM9mZ8X3H+C0Ha
         7ravH9j4epfSo5DzP0loXff+w9TxpMppOAmNKWrH/obrpxVArmJhqWQfI9SI2r3FB8Qd
         Gvh1Q2GZwDXWOJvRgvM4NE9bOn7HNveSnPP5YN5DiMSuo8E14XcFWXk1+/A1YN+xf8a8
         oTmg==
X-Gm-Message-State: AC+VfDzLX9Fxl7Nc2I5QVb5sAvk05bCFXPLo5HYHDc2roGe7nGGhDooY
	Qt4+u1QdfQECDQNfGoZyf0gTpskLBLFcWXXBlec=
X-Google-Smtp-Source: ACHHUZ5G+4116E4lEa2fPxs4JiYcOfRCMbSV6YGVwuMCwjqIBlQ20w9cguGffZrloJ1m3Z7WhBbYIw==
X-Received: by 2002:a17:902:ab95:b0:1b0:378e:2768 with SMTP id f21-20020a170902ab9500b001b0378e2768mr5641810plr.7.1687728461528;
        Sun, 25 Jun 2023 14:27:41 -0700 (PDT)
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from q1iq-virtual-machine.localdomain ([111.201.135.80])
        by smtp.gmail.com with ESMTPSA id je5-20020a170903264500b001b8004ff609sm761343plb.270.2023.06.25.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:27:41 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: alex.bennee@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-devel@nongnu.org,
	Yeqi Fu <fufuyqqqqqq@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC v3 09/10] target/arm: Add support for native library calls
Date: Mon, 26 Jun 2023 05:27:06 +0800
Message-Id: <20230625212707.1078951-10-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625212707.1078951-1-fufuyqqqqqq@gmail.com>
References: <20230625212707.1078951-1-fufuyqqqqqq@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BaFUyO6GrhBM

Upon encountering specialized instructions reserved for native calls,
store the function id and argument types, then invoke helper.

Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 target/arm/tcg/translate-a64.c | 27 ++++++++++++++++++++++++++-
 target/arm/tcg/translate.c     | 25 +++++++++++++++++++++++--
 target/arm/tcg/translate.h     |  6 ++++++
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 741a608739..24a664b928 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -35,6 +35,7 @@
 #include "cpregs.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
+#include "native/native-defs.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
@@ -2331,11 +2332,35 @@ static void disas_exc(DisasContext *s, uint32_t insn)
         /* BRK */
         gen_exception_bkpt_insn(s, syn_aa64_bkpt(imm16));
         break;
-    case 2:
+    case 2: /* HLT */
         if (op2_ll != 0) {
             unallocated_encoding(s);
             break;
         }
+        if (native_call_enabled() && (!s->native_call_status)) {
+            s->native_call_status = true;
+            s->native_call_id = imm16;
+            break;
+        } else if (native_call_enabled() && (s->native_call_status)) {
+            TCGv_i64 arg1 = tcg_temp_new_i64();
+            TCGv_i64 arg2 = tcg_temp_new_i64();
+            TCGv_i64 arg3 = tcg_temp_new_i64();
+
+            tcg_gen_mov_i64(arg1, cpu_reg(s, 0));
+            tcg_gen_mov_i64(arg2, cpu_reg(s, 1));
+            tcg_gen_mov_i64(arg3, cpu_reg(s, 2));
+
+            TCGv_i32 abi_map = tcg_constant_i32(imm16);
+            TCGv_i32 func_id = tcg_constant_i32(s->native_call_id);
+            TCGv_i64 res = tcg_temp_new_i64();
+            TCGv_i32 mmu_idx = tcg_constant_i32(MMU_USER_IDX);
+            gen_helper_native_call(res, cpu_env, arg1, arg2, arg3,
+                                    abi_map, func_id, mmu_idx);
+            tcg_gen_mov_i64(cpu_reg(s, 0), res);
+            s->native_call_status = false;
+            s->native_call_id = 0;
+            break;
+        }
         /* HLT. This has two purposes.
          * Architecturally, it is an external halting debug instruction.
          * Since QEMU doesn't implement external debug, we treat this as
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7468476724..7b90ce50d0 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -34,7 +34,7 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "cpregs.h"
-
+#include "native/native-defs.h"
 
 #define ENABLE_ARCH_4T    arm_dc_feature(s, ARM_FEATURE_V4T)
 #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
@@ -58,6 +58,7 @@ TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
 
+
 #include "exec/gen-icount.h"
 
 static const char * const regnames[] =
@@ -1147,12 +1148,32 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
+    if (native_call_enabled() && (!s->native_call_status)) {
+        s->native_call_status = true;
+        s->native_call_id = imm;
+        return;
+    } else if (native_call_enabled() && (s->native_call_status)) {
+        TCGv_i32 arg1 = load_reg(s, 0);
+        TCGv_i32 arg2 = load_reg(s, 1);
+        TCGv_i32 arg3 = load_reg(s, 2);
+
+        TCGv_i32 abi_map = tcg_constant_i32(imm);
+        TCGv_i32 func_id = tcg_constant_i32(s->native_call_id);
+        TCGv_i32 res = tcg_temp_new_i32();
+        TCGv_i32 mmu_idx = tcg_constant_i32(MMU_USER_IDX);
+        gen_helper_native_call_i32(res, cpu_env, arg1, arg2, arg3,
+                                    abi_map, func_id, mmu_idx);
+
+        store_reg(s, 0, res);
+        s->native_call_status = false;
+        s->native_call_id = 0;
+        return;
+    }
     if (semihosting_enabled(s->current_el == 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
-
     unallocated_encoding(s);
 }
 
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a9d1f4adc2..280f8ba215 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -149,6 +149,12 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
+    /*
+     * Indicate whether the next instruction is a native function call (true)
+     * or not (false).
+     */
+    bool native_call_status;
+    int native_call_id;
 } DisasContext;
 
 typedef struct DisasCompare {
-- 
2.34.1
