Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C8BCFD376
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 12:43:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOxoO-0002MX-4I; Fri, 28 Nov 2025 07:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxo7-0002AW-EB
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:40 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxo5-00039d-7B
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:38 -0500
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-55b265f5122so479709e0c.1
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 04:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764333756; x=1764938556; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOnxGpqlMZmxE2gECJcZmS8f1X72UBHCp7cH7nU2V2c=;
 b=hrA5wclT1FVDwtM4aFPLrT491rK9uw76HV3gqCVxRrzdGrAd4kXE+0a0ziXtzrW07D
 mrfSlghsmxKJKaQSKG3JyxSpRNAZV3EuNDprLOrFG5MZJfq9XYgbdycty7A5WzrnV1Ry
 r73GpvL+6aKtuyl6pnzShiHLM2x7PJod/ceXHp6T+nIo/28yyfavk5d0The3ZuDsQDgU
 LBQ/5rxeMmfpLMc3Ovz7Pe8Rn8BXSc4YjOTMpi3kFxpWBz4+YC8KugiJyxYkYqOJg8mh
 oEJaL8MVxAxoL/64g+EiwUdToSf9HS2xn+k1Qzess5DiDfjLQaNAsgWVwNUH1O/Zz7HX
 CZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333756; x=1764938556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOnxGpqlMZmxE2gECJcZmS8f1X72UBHCp7cH7nU2V2c=;
 b=TJTyGwxKQXkdJkxkqLFY8Qe57nM/LJAD8j5kGJAFQMBsSggjcixx51LIAKDXoA0DbP
 FHQnvN2YZW2Z083ifrLHi9tIrVajyqcc0KwO8bLnhhCOGb6i+rER1TMpsGvDabISoYBA
 1ilQa+eGBCY3dxS/QgWNcRusxTqu87iuNaAKDHWgNCU43dcOE5I8FrvON34u4v4mOxpB
 i6/W7kcOw+ycUfIRDFUbSUtslKtRABCaSmMryN4WYLcFu6ckFWb+LQUuw7qo35gtA40T
 rgi9Rs6ajTYsGOfAZYapl+mEgVdA+iWPLeWQrrZZQlcKuAayU1QtRrI9hEQXCeuP3n1P
 4skA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpr8wV6u3b1+hWoT0PqveOeXAYxrWzs9EO9uQtBNx9b6f3LZJe+lyHVwa5FdHbZGo3ghNYzrBqYA==@nongnu.org
X-Gm-Message-State: AOJu0Yy39MnL4U5EBzuBMUajKlUIyiQTvSDbwUW89+auXwJgzOp8Bf7r
 SUel/4woabQ4bu/AU4vtMQ7FLe0dP7UFhwRSjrJCwHiO+xSQAcaJK62fkYWb1G/KQ/c=
X-Gm-Gg: ASbGncunSQV5PnL1evsd37N8Vv42OBXidcELyZq7HVZFqfKd42jUc/+mrQQ0We4GwgU
 oH7uuGnHfb8gkv2uzFGOdelIlKvxuVCsRpGdlmwMYJqnoHFTHB2yyaml39SBUcAw4PEKCKENu/c
 EjN8eKNu+FWnRxYSjwqI+F3mDvJzxmtogMZSOif9Fxw790uR6ONrHH4dVkJX7pTLbmzabtuBWMH
 pILvn0yhLX/4qxTELF7KimD9SIImlauXtj5fOl3VH89GtFzVSDpstgygO/ugiaLL0cCaCft2jrI
 wkuZSCIhCd9ZQrw4sG3TLRnjD3Xs1xLO9aQvVbnJTe59kmfL5enMegY4j5NV5j+1sesls7YXvRM
 GTFj/mc6YMY0H1ONWpnzqD/Z2uXNytYrtlI7RnHAXRY8P6CxDnAqHThtAvUn6Caf42krtzbC6aU
 TYpShAyivo0XC/1o8=
X-Google-Smtp-Source: AGHT+IE/GUTosPwJTPVKplxZbX7N85n6XkeIfrYjoX4owl4pUjdsju0IX+w6UxjHEunloqf77eKthA==
X-Received: by 2002:a05:6122:4886:b0:55b:305b:4e48 with SMTP id
 71dfb90a1353d-55b8d7ca793mr9424172e0c.20.1764333756182; 
 Fri, 28 Nov 2025 04:42:36 -0800 (PST)
Received: from gromero0.. ([177.139.2.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55cf4e1d56asm1776930e0c.4.2025.11.28.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:42:35 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v1 6/6] target/i386: Use new CPU address space API
Date: Fri, 28 Nov 2025 12:41:10 +0000
Message-Id: <20251128124110.1272336-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128124110.1272336-1-gustavo.romero@linaro.org>
References: <20251128124110.1272336-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use new cpu_addess_space_init() to initialize the ASes for CPU, instead
of setting cpu->num_ases directly and use cpu_address_space_add() to
add the required ASes dynamically.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/i386/kvm/kvm-cpu.c        | 4 ++--
 target/i386/kvm/kvm.c            | 4 ++--
 target/i386/tcg/system/tcg-cpu.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 9c25b55839..9b7364f1c6 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -98,8 +98,8 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
      * Only initialize address space 0 here, the second one for SMM is
      * initialized at register_smram_listener() after machine init done.
      */
-    cs->num_ases = x86_machine_is_smm_enabled(X86_MACHINE(current_machine)) ? 2 : 1;
-    cpu_address_space_init(cs, X86ASIdx_MEM, "cpu-memory", cs->memory);
+    cpu_address_space_init(cs, X86ASIdx_MAX);
+    cpu_address_space_add(cs, X86ASIdx_MEM, "cpu-memory", cs->memory);
 
     return true;
 }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 60c7981138..dcc7e5eeae 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2744,14 +2744,14 @@ static void register_smram_listener(Notifier *n, void *unused)
                                  &smram_address_space, X86ASIdx_SMM, "kvm-smram");
 
     CPU_FOREACH(cpu) {
-        cpu_address_space_init(cpu, X86ASIdx_SMM, "cpu-smm", &smram_as_root);
+        cpu_address_space_add(cpu, X86ASIdx_SMM, "cpu-smm", &smram_as_root);
     }
 }
 
 /* It should only be called in cpu's hotplug callback */
 void kvm_smm_cpu_address_space_init(X86CPU *cpu)
 {
-    cpu_address_space_init(CPU(cpu), X86ASIdx_SMM, "cpu-smm", &smram_as_root);
+    cpu_address_space_add(CPU(cpu), X86ASIdx_SMM, "cpu-smm", &smram_as_root);
 }
 
 static void *kvm_msr_energy_thread(void *data)
diff --git a/target/i386/tcg/system/tcg-cpu.c b/target/i386/tcg/system/tcg-cpu.c
index 7255862c24..ab72c5ff7b 100644
--- a/target/i386/tcg/system/tcg-cpu.c
+++ b/target/i386/tcg/system/tcg-cpu.c
@@ -73,9 +73,9 @@ bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
     memory_region_set_enabled(cpu->cpu_as_mem, true);
 
-    cs->num_ases = 2;
-    cpu_address_space_init(cs, X86ASIdx_MEM, "cpu-memory", cs->memory);
-    cpu_address_space_init(cs, X86ASIdx_SMM, "cpu-smm", cpu->cpu_as_root);
+    cpu_address_space_init(cs, X86ASIdx_MAX);
+    cpu_address_space_add(cs, X86ASIdx_MEM, "cpu-memory", cs->memory);
+    cpu_address_space_add(cs, X86ASIdx_SMM, "cpu-smm", cpu->cpu_as_root);
 
     /* ... SMRAM with higher priority, linked from /machine/smram.  */
     cpu->machine_done.notify = tcg_cpu_machine_done;
-- 
2.34.1


