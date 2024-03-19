Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1382959ejb;
        Tue, 19 Mar 2024 08:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgDVeTpP7MLuCDD23b7wGJ7zHpGgEAvLmWU6l1J85Rl87twTF664W7bpL2SO/x+eZnhUBXpkUgz59sxCoPFW869sHCxyoT
X-Google-Smtp-Source: AGHT+IGBCnJSV8IcEhITLWBXeACXi9pcZqXTfkPwKpkyW28PZZLXwZmbmS4Wk3rcNGCPeREeFuZl
X-Received: by 2002:a0d:c242:0:b0:60c:c96d:7e18 with SMTP id e63-20020a0dc242000000b0060cc96d7e18mr2982038ywd.42.1710863112628;
        Tue, 19 Mar 2024 08:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863112; cv=none;
        d=google.com; s=arc-20160816;
        b=KlVTuG75vhIVbR2R78ibv4s6JC3We7jECko+Q0xJTjaGwMbpUOmkmIaTax34e95s/1
         q0jc7CYxidN7rs2vcfW0EjJeKdLr6F+j6RL3iRDagnZlBqFGsSDHTE7EmiXY3CPPQsAj
         PeZPU/UdRuB1f9B/nlc0PwtE4WBy+FkkAH06Kb1OgCNz2mD2iQS7eexQ0J96GWtQ9TUX
         mOfLPL+gezDrD44KsmrrU9IMHHK7+vJjL2mSjtouQ1qzD1Jd87gJhIb4qlN5tHNM9Zk1
         BJjvttDXOv+2hC8WJUtVeuDREDR1ZFRm+I7umhlbjMYlgN+aSMlC0eFotMFjBpev54Lp
         mGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9AmlJlFpu+sjCS8Dqdfk+383y3J9XzQtcfIth5cqVHg=;
        fh=fO4L2BTEwXJ/MqH/AYWhhNeVPrdGOpPm07Kg8QnZR/Y=;
        b=h/8QHdIT91dbPfMjE4cqdaKHT5sKr5mNpFt0EK3gAOokroYxmKn6UMU0CdWC/ky2Ih
         78ttjUXU2tmkNyxGMN872nEnWc19Z1aTLvJMVLt9APKgQBY45/Fmv8iD3KFl0fStEUOB
         CsrBVPFBl0my//TnwFjS2XvCHsxt3PdXsZQiibhfwPZ4dyQhQKQXLPPT2lCkJQqPrW0f
         3a9LG6cfb0K/l3yx/Q3KbqpOLQBCb29EkBqWGWxchR9kN9/+IAnkqlEx0Y1Jj507/5+T
         El43RImBotJyblvIb+Z4pU7Qgtb6ORcZqqWZ/tSNX+1vhYGyuT6EYHEGLMBFtlBH7PP8
         tV8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wsBGyhpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05622a120b00b00430c7694074si6060593qtx.638.2024.03.19.08.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wsBGyhpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbde-0006PR-0k; Tue, 19 Mar 2024 11:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdL-00060D-BT
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdH-00055X-FE
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso2964751f8f.2
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863045; x=1711467845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AmlJlFpu+sjCS8Dqdfk+383y3J9XzQtcfIth5cqVHg=;
 b=wsBGyhpCm7bq6NdO5kPpoQWgxeNQSAu4E9qxGVPeq+A6TmDzlNEh8QltvW6QOYP4Ah
 zahqNvc8QiHeoQ34brlJTGbaCQktcZACK5YTEMpYqg111R85zoX1neDLw8fd+CahKdVU
 Te5TatZAonQR8MOF4xObABTLnt1F+SFF78vZfk+4kO75peM68zwdEW4Hr55pDAS8riJU
 eAm0FlXKVG0sOWSs76bWd++bsF2Sejm4coO7WdJr0hU66aor9rfQ3T/t2Kw3s0un8B5q
 kSlMyrSTghrJLJ0OHB6IIOqi6yQ9JqCPZJFfK3+2y+bZsPV6HFp6XDhO+P8h+HF6Ep81
 Y+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863045; x=1711467845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AmlJlFpu+sjCS8Dqdfk+383y3J9XzQtcfIth5cqVHg=;
 b=rtTMNHm543Zn6WmWFramQFSsldmuDxm9Dh7stAL79WEiruzdL1hwvmLex5+UTuvkMc
 nidhyRfq0/m4rIFrb8hbnM4xVJDHFrpU+WBMHrcRme8ftNq2xApZDqNM5i6jicza5Ms5
 9Vbb3x7/kNgIFzbvnHuwcKoTDUn5yoWrjg4mly5Tz7wMqbc9AsU55VifgDF1B6Nm0CQV
 W8aC/0iCNiOeYX+0AKkmAbFBaYg+UznTgbq4LwIqdQMx7dNHAY5v9XJidaACHI2MI6sQ
 z1B+Ix3JReILElwYhGdhIa4P3Rpcr4m9x6jzCQ/cQZjztAWj8cwAnj9tqKOjpGKeNyYG
 nneA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVkHDTwgUmE5bI+vy/K9TaZguGfL/1lukXm2mwX9m4rQRhjOWztBcChbFcPQ+J43JPaNwveHw7ekQDrFfkGVFodtBS
X-Gm-Message-State: AOJu0YytV++GzUSlhS5Pv701oQkUh8eOgosntrkaTM8OQqo969aziGlR
 TAxdFfbu/Sc1HbdIxaiTlrC62NopJvCLgaSwswfdhChNjStkTwPn1KSBtv3WZfY=
X-Received: by 2002:a5d:4ac4:0:b0:33e:bf11:a007 with SMTP id
 y4-20020a5d4ac4000000b0033ebf11a007mr10698783wrs.31.1710863045475; 
 Tue, 19 Mar 2024 08:44:05 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 dw11-20020a0560000dcb00b0033b66c2d61esm12575894wrb.48.2024.03.19.08.44.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH-for-9.1 11/27] target/loongarch: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:40 +0100
Message-ID: <20240319154258.71206-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: Wau5la75wPEP

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.h | 14 --------------
 target/loongarch/cpu.c | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index d814ba08dd..14f1d37606 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -443,20 +443,6 @@ static inline void set_pc(CPULoongArchState *env, uint64_t value)
 #define HW_FLAGS_VA32       0x20
 #define HW_FLAGS_EUEN_ASXE  0x40
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPULoongArchState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
-    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
-    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, SXE) * HW_FLAGS_EUEN_SXE;
-    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, ASXE) * HW_FLAGS_EUEN_ASXE;
-    *flags |= is_va32(env) * HW_FLAGS_VA32;
-}
-
 #include "exec/cpu-all.h"
 
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f6ffb3aadb..a2d772ca5f 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -340,6 +340,20 @@ static void loongarch_restore_state_to_opc(CPUState *cs,
 {
     set_pc(cpu_env(cs), data[0]);
 }
+
+static void loongarch_get_cpu_state(CPULoongArchState *env, vaddr *pc,
+                                    uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, SXE) * HW_FLAGS_EUEN_SXE;
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, ASXE) * HW_FLAGS_EUEN_ASXE;
+    *flags |= is_va32(env) * HW_FLAGS_VA32;
+}
+
+
 #endif /* CONFIG_TCG */
 
 static bool loongarch_cpu_has_work(CPUState *cs)
@@ -729,6 +743,7 @@ static const TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
     .restore_state_to_opc = loongarch_restore_state_to_opc,
+    .get_cpu_state = loongarch_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = loongarch_cpu_tlb_fill,
-- 
2.41.0

