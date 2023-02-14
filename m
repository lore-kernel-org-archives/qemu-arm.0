Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1425247ejb;
        Tue, 14 Feb 2023 08:32:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9NZOvCUlYQqV2I1u8UfT5uOJSIJL6RKB1xi2xaophoRa1X8apAVg+QDD3bpMDdl3KW+eeR
X-Received: by 2002:a05:6214:76b:b0:4c7:595c:9940 with SMTP id f11-20020a056214076b00b004c7595c9940mr5590683qvz.51.1676392334328;
        Tue, 14 Feb 2023 08:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392334; cv=none;
        d=google.com; s=arc-20160816;
        b=bhC58aDrvDDiM/WgfXGPTr/tR4o9WQ2VZKuwcgl4xDGBqHhyc6SO9OQ5qzfpk+hmu9
         Kykhyakaw5fJd5UcKlXXxBT1+coPw2GaiEESVDpE8l8AiO6M562m39Df7dx4857j2eSm
         4R5VVehd+JM4HhrGJq0N7j5YBSnrqNbRcmpRF0Qg9vI1uLSO2VsVx4R/M/xuCEEWH8R5
         4XO/uqmyGUEHtMzvkn+IBr9PQIDkP8Ie23IRoKnGHRFHk6CVJrigy4qw83gNUw9D4t1E
         APV/9D5BKun179yr/e+nM58DB8BNYFLOJBn76eAKHMUVHgt/kJ3mJ+hpf0uwbrYihW/6
         z4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+cwR0yAMMRzTUue9qCnfgeow6XLhgPQr5IbzzpWxGQY=;
        b=eZKU6XZ+GdTcBHvk7uFNpZkgR4if8tfGiGuNXn5/fWV/2soY5U1jFJnOuLJXHd8qFE
         KK/V/r+xNzqQXk0Uil5ipxyLOh77jZT9c9yBvcx7tWN2fPzMcaci6cYDVXof2CCd+U/x
         Xymk84JGBjtvBjsC79omf0rTsos4Hx8SpOmzeCUuZItqGQTVFOd549pRy7oR4cHZ1PbH
         OJlnPezI/VOCK2IxkfrdW3NpLXrIPZ4MnbtycP7PKSZDEiVTQ0xYqkQy1Ewrb9z5H9xR
         j2ftz5JfKubXCuv7v1Elh0rZ8cYad3q66A3GEF4htJWsjyoZU7huN24Ok4dc8L2y6rLT
         a/0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fS+2Lj3f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t65-20020a37aa44000000b00706741aa9a8si11747940qke.202.2023.02.14.08.32.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:32:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fS+2Lj3f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyCz-0006Ws-CA; Tue, 14 Feb 2023 11:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCn-0006Pb-3k
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:30:59 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCl-00024z-90
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:30:56 -0500
Received: by mail-pg1-x534.google.com with SMTP id r18so10559430pgr.12
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cwR0yAMMRzTUue9qCnfgeow6XLhgPQr5IbzzpWxGQY=;
 b=fS+2Lj3fMAR52noQmc91ZY538L3E379e7GChUR+AVk8SP2QGJvmcLGPiUbrGIuloWj
 iq0kZjeHo8hZzZYowRF0GxvzLqIsk3K12Ijvflk8EVhQ8u/Fn7Kkp1fSyZjA1lgV+LHU
 hhNjqAiKo7zaR2oUATBeatOug1ul7sBzN20j9+LNUQvKOsmWTO9omHdwdrFoJ58MhXSf
 CG4Vc6mXAcQJmA6AE7RcpS9W16h3y/WeqasFNMVyEZbUZ3x8dy21DEHyspB6i3R6UxMd
 3cQbeFBBhja7ve8YcTvcuiuF+GULVqiAfzVMGhpvsZzJ39a3gJy/FPgExctG8j6MHtyU
 iTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cwR0yAMMRzTUue9qCnfgeow6XLhgPQr5IbzzpWxGQY=;
 b=tkQ6peYg2sgfW8M3zrgPkjGJlxRTo3+MMyUrE+DlWXoA4qs/E/qfA0r2YOYeWzqRIB
 7QlBkx9G3dJbRcJhQ+DCkyTEF77GuvGlmSHA7RQu8OyNdvfp8fXiDDX0gkvwSW/flCVc
 mJ7hKs33o3ka/Hb0EaQSXbGNVytpTnjFFZnfseDhws7IY0v5BSAwGKwR4OuYWncUAiH6
 Y9/X9ShSDtddaQOcySZQkW9GdEHYz3LqYJtjhZuKsDWbP1ebycHkf3YwfuCpCnW0hTt1
 C89684tks9264soO1LidtAfI8nPB+bLT25V8ol6uGo1jWuuhJk9b4g0PTNp+9Xjvk9Jf
 VONg==
X-Gm-Message-State: AO0yUKXOixUwMkvqSN/oMMVJJ8lfP6/SZNtKJ91WmofOYvkmQztdJR/q
 dPqUAPl2XhiV4AXgHxbQNePxkPCkYo5Y8AoHeRc=
X-Received: by 2002:a62:2902:0:b0:5a8:b958:e348 with SMTP id
 p2-20020a622902000000b005a8b958e348mr2142311pfp.28.1676392253019; 
 Tue, 14 Feb 2023 08:30:53 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/14] target/arm: Normalize aarch64 gdbstub get/set function
 names
Date: Tue, 14 Feb 2023 06:30:35 -1000
Message-Id: <20230214163048.903964-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hkk7VVkRRNeE

Make the form of the function names between fp and sve the same:
  - arm_gdb_*_svereg -> aarch64_gdb_*_sve_reg.
  - aarch64_fpu_gdb_*_reg -> aarch64_gdb_*_fpu_reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 8 ++++----
 target/arm/gdbstub.c   | 9 +++++----
 target/arm/gdbstub64.c | 8 ++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e1e018da46..69b5e7ba73 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1340,10 +1340,10 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
-int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
-int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
-int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
-int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2f806512d0..cf1c01e3cf 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -466,12 +466,13 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          */
 #ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
-            gdb_register_coprocessor(cs, arm_gdb_get_svereg, arm_gdb_set_svereg,
-                                     arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs),
+            int nreg = arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs);
+            gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
+                                     aarch64_gdb_set_sve_reg, nreg,
                                      "sve-registers.xml", 0);
         } else {
-            gdb_register_coprocessor(cs, aarch64_fpu_gdb_get_reg,
-                                     aarch64_fpu_gdb_set_reg,
+            gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
+                                     aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
 #endif
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 07a6746944..c598cb0375 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -72,7 +72,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     switch (reg) {
     case 0 ... 31:
@@ -92,7 +92,7 @@ int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
     }
 }
 
-int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     switch (reg) {
     case 0 ... 31:
@@ -116,7 +116,7 @@ int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
     }
 }
 
-int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
+int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
 
@@ -164,7 +164,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
     return 0;
 }
 
-int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
+int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-- 
2.34.1

