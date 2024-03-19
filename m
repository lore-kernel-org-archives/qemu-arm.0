Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1383015ejb;
        Tue, 19 Mar 2024 08:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnTtLMjwg6ptXQEl1T1ygo+SHLkLZzufAMCuOoAtCXlpmGD8w+OOOLpliy252zgotcV6It1I11xizmFv4HDG3eQkLZOzLG
X-Google-Smtp-Source: AGHT+IGlfM8ivwt+F30C0SyASBuULqdLkgPL9c69ZAwODCEYVz7Q5Pxl8Xcsx3Jj9C/TBjDdVuGI
X-Received: by 2002:a05:6808:1246:b0:3c3:8a48:32c2 with SMTP id o6-20020a056808124600b003c38a4832c2mr3103817oiv.59.1710863117615;
        Tue, 19 Mar 2024 08:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863117; cv=none;
        d=google.com; s=arc-20160816;
        b=oGW7aHV/aSvogyeYK8Q6PzkcwHl3MaMp4Tm9vvQw3srOJcljYc93tO8wM/8gFUtwmP
         7eqPi6+h+kAb4eDD1smHmNwyxmnbX8SYW5ZazMplgMQJeWaLGQIvRysgoY7VIHwQff4+
         agURuonTBewn2dJv3+1kMeKKgcUXQGIEBnR20yaBkE+0dr6DEGvfjJenxdLXzhM1JSqV
         tMrVsM73/j7stOp/qr3f6+ISfC/+BLBBQJjonSixEGc+TJr6A9E95OPbaLo8YeArJDxT
         qHfz03z4pXm47gNN7dhJRTa0HvGD75c/GQvp7YQVqVJx8uD8YQd487fdPFCYUhNbO9+X
         2FPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DikP2L6ARWdRvFee2b+GuSHD2n5uD5QzEz8674gqbFw=;
        fh=rMROp7HllCADjYk2EEXwMRkICjUS+BGXLgMBfE3FKxE=;
        b=WaRroGx8jBzjn4zDczlIP+ho4k/DfIwbda1GAwujZF2nPj1/t16dcfw9ca/uzcGjh6
         ofttKDDVKh9W4WifTrmlJcy6SovKb7ffGNIzXYH3h1AKgCvbK8lHo8SSWOH3rSRWDO68
         K9BgmAU0RXFyUSG7J4pvfvHntZAaWCX7fLZca7H0F4cjCOfCOMJ2uq/XKfDCv06d8lhz
         Bv0R97zULS4Mbwqw/EeKJJwM2d5RivVRnC5rnPSizcVoj4fZE6LAUTKDpFhQouXJXez5
         2rSNSM4ThNX69ZOOtgPg0zgr1bwmnA9uW2O65sAbSWo1zeBaUlHbxWyc4f2S5eNS44RS
         rWjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXh3ae0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a056214040800b0069006895612si11519248qvx.548.2024.03.19.08.45.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXh3ae0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdq-0007ed-2M; Tue, 19 Mar 2024 11:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdm-0007Oc-N8
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdY-0005B6-F4
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-413f4cb646dso37792375e9.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863062; x=1711467862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DikP2L6ARWdRvFee2b+GuSHD2n5uD5QzEz8674gqbFw=;
 b=zXh3ae0I+/g/ICjQH+F22BreXtfQUlFlBxw9CB5c6raSZYiVC6JPuZ6MNjSwddOPaw
 mMzzCcQ4P5N9omMMZmxhlje91ihdRYgN4yNpt/kN5sPo8GotoFJWI2ZNY0isPkLMYJEO
 yRNyvdzAucfI/rfhoDtBJU4XTJLemHu1BaVauD9WgE1icpVq4p3ZE3pMT+xcQ2ZgydNy
 MrZGBsZmC3SVAqHJhAb7AO211gA9FxjwGhc0jK93+9iDKYtI2NInD/Pqt1LgIMfOXhty
 565CE0LWg/a6/C87pcyznRWWomEmPvtskIwCE1UQPb/xkfWVvsdRsssot69T8YD226u9
 dIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863062; x=1711467862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DikP2L6ARWdRvFee2b+GuSHD2n5uD5QzEz8674gqbFw=;
 b=Koeg2eWXzeEnJWrSYt1MZ5PiXTzqbU3ay6XzxTQox5zM6LzObsIfq9FlkC3FoBbTcA
 vm30zxmuCzZ3MjQK8H33HR0b3PWAye5oDaiw0M+2H6bAlLJZ5GtRAnKNCpGSAcxxmCDk
 TP351tlMH97wTdTEx19jqN5NQ9FQxx0RmSKX7zpdiYpAQWMTW2N5vxNCsHmzBExcbV+b
 P+qOVlA6W4w+Gw1bltyA4yODERZ5FUQMqaKhJdhnDWdOr7b+EtQkrP4FnmwHfXV2kifx
 fVEu7Q52ENhnczbX+8sTgovMkQYqCap6B9nnzyxofBw0mjFUHlhoSC4DMqsHNptvOMCv
 jNmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHH2Qgmo2V7iKkdTkqlXeZPpZqTyOtcpaahFWH48itlICgfFTJnCCVqTPQfg+nGeC8ATY0CdWuVgsVCJHfwd51xpVl
X-Gm-Message-State: AOJu0Yy9BMjROtJqwRliW3OUo/1V/Z/BpluX9jpnvYPwW98Q8LKgovH6
 ZpcaFT9lcBCtDTcupeM0oq5L8VnXUDfrsSB+nX0mEx6VFZqDWsDH+DG/5+Ezda8=
X-Received: by 2002:a5d:5a0e:0:b0:33e:76db:9bf8 with SMTP id
 bq14-20020a5d5a0e000000b0033e76db9bf8mr13665980wrb.68.1710863062221; 
 Tue, 19 Mar 2024 08:44:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adff9ca000000b0033e72e104c5sm12592777wrr.34.2024.03.19.08.44.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH-for-9.1 14/27] target/mips: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:43 +0100
Message-ID: <20240319154258.71206-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: rdG5BGPegShI

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.h              | 11 -----------
 target/mips/tcg/tcg-internal.h |  2 ++
 target/mips/cpu.c              |  1 +
 target/mips/tcg/translate.c    |  9 +++++++++
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index caa12a2dd3..9d2f7e0194 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1362,17 +1362,6 @@ void cpu_mips_clock_init(MIPSCPU *cpu);
 /* helper.c */
 target_ulong exception_resume_pc(CPUMIPSState *env);
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUMIPSState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->active_tc.PC;
-    *cs_base = 0;
-    *flags = env->hflags & (MIPS_HFLAG_TMASK | MIPS_HFLAG_BMASK |
-                            MIPS_HFLAG_HWRENA_ULR);
-}
-
 /**
  * mips_cpu_create_with_clock:
  * @typename: a MIPS CPU type.
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index aef032c48d..c54d5c64b2 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -24,6 +24,8 @@ G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 void mips_restore_state_to_opc(CPUState *cs,
                                const TranslationBlock *tb,
                                const uint64_t *data);
+void mips_get_cpu_state(CPUMIPSState *env, vaddr *pc,
+                        uint64_t *cs_base, uint32_t *flags);
 
 const char *mips_exception_name(int32_t exception);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 8d8f690a53..6cc64b7628 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -551,6 +551,7 @@ static const TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .restore_state_to_opc = mips_restore_state_to_opc,
+    .get_cpu_state = mips_get_cpu_state,
 
 #if !defined(CONFIG_USER_ONLY)
     .tlb_fill = mips_cpu_tlb_fill,
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 06c108cc9c..4ecac13a8f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15581,3 +15581,12 @@ void mips_restore_state_to_opc(CPUState *cs,
         break;
     }
 }
+
+void mips_get_cpu_state(CPUMIPSState *env, vaddr *pc,
+                        uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->active_tc.PC;
+    *cs_base = 0;
+    *flags = env->hflags & (MIPS_HFLAG_TMASK | MIPS_HFLAG_BMASK |
+                            MIPS_HFLAG_HWRENA_ULR);
+}
-- 
2.41.0

