Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384280ejb;
        Tue, 19 Mar 2024 08:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUB0MUAtBRNXLlTGd54AUDZQvQujdhRpTRs16nBEDMno4VwFbDgPKXWM5ve04EH/Je9ulZam9SL8v+Pobk99EsQNew52INV
X-Google-Smtp-Source: AGHT+IHojvGU716/a5UTuEuWGxydFkP6urgPHiCQvIxKmhfT85TPfdCzKqG5E2X9G0X/3V0FdvXc
X-Received: by 2002:a0c:ea88:0:b0:696:1ef9:4375 with SMTP id d8-20020a0cea88000000b006961ef94375mr6489853qvp.9.1710863245784;
        Tue, 19 Mar 2024 08:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863245; cv=none;
        d=google.com; s=arc-20160816;
        b=FS5Blpv4kik2SlqrGb93nAbsnaYmME4c1gPKzLBPFikAqWmjLOMxg3ggyancxcSrjh
         piBDm63I65qEjJk1h8g/7sKMiLq+gFRfeBqIbAmrc+akqqGsEoTniC3mkuN/9ARzhqMt
         DEKBfwVvz9s/Xr3iMSX/EN1tiUriQzxPvfkIs6HWVTriztzVhFEJp5X3HLlh4JmTcle2
         x5tnKSseuQ+yIQPY2qbFpEGUPvxm2Lp198Sl6kpmThmlLLZ443RkjFglM7MYyh7pVM7T
         /CT+YD430S6cvDTzzyok+7lsm9TML1woMyhT7vhKJ6q3pTUQ+r+wd+b+PIEykEAp5uMm
         K61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cuDVEU6xu2/Is+40NdFmTs6boTjeWsn71DRjetsl+yM=;
        fh=JobGjGQsXUzF+ematwumTGoE98H4WiwE00A2dUrJAs8=;
        b=kKSMSc1OQrDp0W7x1aA7r/mxjazX5HT3F1vBIrz4I4MlrgLCzeXs/NaQzBaEcZupa9
         ODwRPnSO5wTpQ3/8EOkBRqVw9SVmigxOy2M02jv53kiDuJR3KeqduZlvOC4DAroceoef
         +DSjTFUNF7loCo9rOYxjhPB7NTw+7Pfwtng2mWWxa9ITDSmpuHIYsofCA88qZ7sWGgK7
         OOSHAEmzy0GIDodO5NMszGXQ2ThNZG47DHwzTK38KDgUkyv0gSGV+MZnhqOPVuC1MG7v
         SjyUl8al3axls/5NtPFN+Z4f99lcrlt10JOwQKapSanbECzDZxRUkTAvUGchFQbGu6Gt
         WmdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4dAN8yZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05622a118600b00430ed9a4f09si1022391qtk.164.2024.03.19.08.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4dAN8yZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbez-0002Lt-Tm; Tue, 19 Mar 2024 11:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeb-0001lD-Fr
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeZ-0005q0-Nt
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:29 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4146178270dso8472805e9.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863124; x=1711467924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cuDVEU6xu2/Is+40NdFmTs6boTjeWsn71DRjetsl+yM=;
 b=w4dAN8yZnbe9OQi8Q5jpt9VuXwPdpincDvfrUkJG2ny8jJnZ2CkyG7Mgfr0rf8rrMC
 ZwZlO2SIR8xwkf0EYV6k1/ZE36N4MyZiFmFeeKigce+rNyYaLok+1hReEuyukCNmTEjl
 YY2QYAdaRPwbQKjvnJuGm3RIQkZxkuPophsayJ787RA0HvNamuSE/piBxbSvIZ28MOaF
 0sHm4mcMTYViEVWlgWjARkffUMSah01nqL9TLElfaPy1zzV+18R5WieJc18nq+ITuMuL
 rMVNePWAT0XUOqvhHvRH3LHnD0N5bTW6t6hKBHVNaSdz0HDZyAQ1gdG8+K2TmNLFvAsM
 3ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863124; x=1711467924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuDVEU6xu2/Is+40NdFmTs6boTjeWsn71DRjetsl+yM=;
 b=IMpLUnTg94Lw5hqu+6B5vK0Q735GrCV+jyuKp5Q2sXve4OlAQ01AMauq21r4yakwaN
 Fp0utWAiT8DZ57vMHq2pypb2fL/ST8p54cXTBO0W4dmJVkXjwrt6U660SqaXB1iPwCbl
 fB7h/WD97hyTRGe3Fpctau/NFHRjiKAQuibIqt9fwcJ4FWF2ngahNDa7pp3ltFulSFKW
 t/RUe+1AobVql57adJ8szh+ZPOI1zAZWw1Cvu/XPb8orKZwrenmDh6ok1DbHoVmcpF7i
 aHnoCEakhAgv0Aa7R5Vpq8seRvDFOOL5OkN7XbsfMtcRv3fZGWSjGRLyOFS7qUJpanGp
 HwrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz+TPwoY0hbOoNIuT0DFBKXQZv9hoNLzvEYrc5oK+io0ak7rFcqqhKJIO3VC7WeKwnrzhy2vzoaL6zIJltkDaWe1qx
X-Gm-Message-State: AOJu0Yww6X5GbUoSVCkWBFXrTBfc7/GLeOS+K5K0yretmbWYlWcr4xY1
 87PK+PBUSVzHDqfNRUGTYZL6Tpztu+HUVkGraNUh4k2wZCXM5kpO5Y6+rzGUbIlBuBooJt3lNVb
 R
X-Received: by 2002:a05:600c:35ce:b0:414:5e9d:ad31 with SMTP id
 r14-20020a05600c35ce00b004145e9dad31mr2871529wmq.13.1710863124688; 
 Tue, 19 Mar 2024 08:45:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 dw11-20020a0560000dcb00b0033b66c2d61esm12578388wrb.48.2024.03.19.08.45.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:45:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH-for-9.1 25/27] target/tricore: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:54 +0100
Message-ID: <20240319154258.71206-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: b22X/970QspL

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.h | 12 ------------
 target/tricore/cpu.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 220af69fc2..9537fef2b9 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -253,18 +253,6 @@ FIELD(TB_FLAGS, PRIV, 0, 2)
 void cpu_state_reset(CPUTriCoreState *s);
 void tricore_tcg_init(void);
 
-static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    uint32_t new_flags = 0;
-    *pc = env->PC;
-    *cs_base = 0;
-
-    new_flags |= FIELD_DP32(new_flags, TB_FLAGS, PRIV,
-            extract32(env->PSW, 10, 2));
-    *flags = new_flags;
-}
-
 #define CPU_RESOLVING_TYPE TYPE_TRICORE_CPU
 
 /* helpers.c */
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index a9af73aeb5..d6ac07a488 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -58,6 +58,18 @@ static void tricore_restore_state_to_opc(CPUState *cs,
     cpu_env(cs)->PC = data[0];
 }
 
+static void tricore_get_cpu_state(CPUTriCoreState *env, vaddr *pc,
+                                  uint64_t *cs_base, uint32_t *flags)
+{
+    uint32_t new_flags = 0;
+    *pc = env->PC;
+    *cs_base = 0;
+
+    new_flags |= FIELD_DP32(new_flags, TB_FLAGS, PRIV,
+                            extract32(env->PSW, 10, 2));
+    *flags = new_flags;
+}
+
 static void tricore_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
@@ -168,6 +180,7 @@ static const TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .restore_state_to_opc = tricore_restore_state_to_opc,
+    .get_cpu_state = tricore_get_cpu_state,
     .tlb_fill = tricore_cpu_tlb_fill,
 };
 
-- 
2.41.0

