Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881816ejg;
        Fri, 19 Jan 2024 03:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb/RRMnqGlfsZFLgVxvXmXkBIDWZ9Coc7cnhmexRLHcX0J2x9+hgQ4MGhHMetVavGaJjSU
X-Received: by 2002:a05:6830:1bfc:b0:6dc:1:270 with SMTP id k28-20020a0568301bfc00b006dc00010270mr2461445otb.55.1705664635920;
        Fri, 19 Jan 2024 03:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664635; cv=none;
        d=google.com; s=arc-20160816;
        b=XjeMY7nGsxZX1Zi6b+3HvU46gVp5zUFleH0xP2zpqNxmnTABe/JSkV2H1EDIlIgxSG
         runZmOE86ppXliRA58Jdnd3KLnuMemasyQzKdUofJ8QRXDEwdLfCP5HSa29vlmqPGcgl
         tCTJeeF/tw9pl9UwUu0Kz2d29DuraMCjCZnMK2o5CvTN3vHM1FXsSX8LnaTWVt4kxo8a
         7lJCWVDpI8o3ufmb0/14otCHXm/k2k7Bb9/WUj+o5+vehvO0iSo4oEkn9v5rFn0YmLWV
         ypAIMD54yN1WNo/rmeTZqT67t9ovycbp/gToDOm9nS8svs4o/K+0ypjKSgeMub90rvsu
         7K2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ejw3kKr4hdUsfv2MTceZhktCuWg4EKgMF+epEyFWJEQ=;
        fh=0tTSGURN6LtpKxKAmn7BdU0xqkUybLE7Sw1KoXMDz1E=;
        b=0cYy44uGsNKavTJSilHq7lHQr6co20UYMxFuhQonTZcj6otzccPJguyZoo3rxHIIhN
         doOyHA0hifbTkkHUg4rOFG6krVLI3fH6GH4Mcf1MWz/mfImrVIKiYz64DM/ayH6hU1Kw
         aCeE0QPpbnTDfIM1jjdWQZXNbICnI3Z94YSrJibhWilI8I2Pz7I5snpvVtWbh8w/0LIF
         aF7NFLmxDNv/tLCzQAue2zkN2ooVXHlh+dTEl/G1f0920o9g6qQZTRYIivYxRSVykOi3
         pV8SAbgMuWcMaUcJQZfJkkNJzuTbQQsf3Yof9Sg1iB/hSJTR/Vfmz/+UZGnTI+IwwM0G
         xIxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PiTOekWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020ac85c8e000000b0042a20876b68si2334038qta.599.2024.01.19.03.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:43:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PiTOekWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBY-0005i4-Jt; Fri, 19 Jan 2024 06:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBS-0005C8-Fa
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBP-0002xj-Ku
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-339231c062bso115916f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664230; x=1706269030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejw3kKr4hdUsfv2MTceZhktCuWg4EKgMF+epEyFWJEQ=;
 b=PiTOekWjAhZ/WqAEtNGNMlFgJ0g/TuJY2yEyqfxaSCxPm04jtu4UWiMCIDMypER/Zb
 Pi4V9Q+l5942GpI49sCZ3HQlK2OTbx8cNPGngmZX80wQyNAQBy2V9v5WCv0UB7wNrf0r
 eOW6nRtkKlo1u0ckD1E/ugiG11RmovcBTXY7V5o+RbnzxSzQPdp63LxBoQDgP7RUEMS9
 AYrMnrD6ddKW0RIMs5B2HUzK+EtCX/Lh0yy8/k8QEhkq/M+nYH1+AAnDWYrT6MTps/94
 fQvCx7Pt1y6j7iTyFzXfrDndlXXraCtCHtUas5upY/7/ETu3lWGRsEErmwuuR88n+L+x
 3uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664230; x=1706269030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejw3kKr4hdUsfv2MTceZhktCuWg4EKgMF+epEyFWJEQ=;
 b=sqr8edtogChXEdbXI0Lp68w8FoxgSyk57BDajO8Dqr0JVpuykBVpk62BhPadbjXPyJ
 /FzuU2lhNA6cFlSug9T/JHAR9EDYgx3aH8yoURj6taZG48UYxxgG7hPzUtYzZoK08vJB
 j+Hg1VvF7LdWqO3Ja+DrqdlHOYbWcsJgAwl52gcgVxGjvsWP3nq9JDK/GVv9qRXe767x
 Pgf9tTYge77lZDU+eAikzNpZphcpQUcvObdSlHl0SaZZquNBrP1qg+Fa48V7BVPUgowB
 YGW795DBEg+tJQP1HawfQJVd7TcHWspsCi82JIln1Zv57pX8e4SzGfddQ+tFb85O3sN1
 of6A==
X-Gm-Message-State: AOJu0YwytsxS+CyZL1OVvNfTfZyakRjEug1+YfzNpS/5IXM19sR5lBtZ
 hz1WEObRxHtQRzEZeQZs0Mfjt9Ba7OSIaj60QsecsWEdtXj38IN6mF6X6aYGrhA=
X-Received: by 2002:adf:fe09:0:b0:337:c28d:ec06 with SMTP id
 n9-20020adffe09000000b00337c28dec06mr1471702wrr.25.1705664230321; 
 Fri, 19 Jan 2024 03:37:10 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 d16-20020adff2d0000000b0033668b27f8fsm6337529wrp.4.2024.01.19.03.37.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 27/36] target/i386: Rename tcg_cpu_FOO() to include 'x86'
Date: Fri, 19 Jan 2024 12:34:56 +0100
Message-ID: <20240119113507.31951-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: PFT9PV6pPTkI

The tcg_cpu_FOO() names are x86 specific, so rename
them as x86_tcg_cpu_FOO() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20240111120221.35072-5-philmd@linaro.org>
---
 target/i386/tcg/tcg-cpu.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6e881e9e27..e56489caea 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -114,18 +114,18 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
+static void x86_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /* for x86, all cpus use the same set of operations */
     cc->tcg_ops = &x86_tcg_ops;
 }
 
-static void tcg_cpu_class_init(CPUClass *cc)
+static void x86_tcg_cpu_class_init(CPUClass *cc)
 {
-    cc->init_accel_cpu = tcg_cpu_init_ops;
+    cc->init_accel_cpu = x86_tcg_cpu_init_ops;
 }
 
-static void tcg_cpu_xsave_init(void)
+static void x86_tcg_cpu_xsave_init(void)
 {
 #define XO(bit, field) \
     x86_ext_save_areas[bit].offset = offsetof(X86XSaveArea, field);
@@ -147,25 +147,25 @@ static void tcg_cpu_xsave_init(void)
  * TCG-specific defaults that override cpudef models when using TCG.
  * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
-static PropValue tcg_default_props[] = {
+static PropValue x86_tcg_default_props[] = {
     { "vme", "off" },
     { NULL, NULL },
 };
 
-static void tcg_cpu_instance_init(CPUState *cs)
+static void x86_tcg_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
 
     if (xcc->model) {
         /* Special cases not set in the X86CPUDefinition structs: */
-        x86_cpu_apply_props(cpu, tcg_default_props);
+        x86_cpu_apply_props(cpu, x86_tcg_default_props);
     }
 
-    tcg_cpu_xsave_init();
+    x86_tcg_cpu_xsave_init();
 }
 
-static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+static void x86_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
@@ -173,18 +173,18 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
     acc->cpu_target_realize = tcg_cpu_realizefn;
 #endif /* CONFIG_USER_ONLY */
 
-    acc->cpu_class_init = tcg_cpu_class_init;
-    acc->cpu_instance_init = tcg_cpu_instance_init;
+    acc->cpu_class_init = x86_tcg_cpu_class_init;
+    acc->cpu_instance_init = x86_tcg_cpu_instance_init;
 }
-static const TypeInfo tcg_cpu_accel_type_info = {
+static const TypeInfo x86_tcg_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("tcg"),
 
     .parent = TYPE_ACCEL_CPU,
-    .class_init = tcg_cpu_accel_class_init,
+    .class_init = x86_tcg_cpu_accel_class_init,
     .abstract = true,
 };
-static void tcg_cpu_accel_register_types(void)
+static void x86_tcg_cpu_accel_register_types(void)
 {
-    type_register_static(&tcg_cpu_accel_type_info);
+    type_register_static(&x86_tcg_cpu_accel_type_info);
 }
-type_init(tcg_cpu_accel_register_types);
+type_init(x86_tcg_cpu_accel_register_types);
-- 
2.41.0

