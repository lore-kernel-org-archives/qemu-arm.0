Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D872CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:14:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkVh-00076O-3i; Wed, 03 Sep 2025 06:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkVU-0006u9-Nb
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:14:26 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkVS-0001KO-4U
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:14:23 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61cb4374d2fso9215989a12.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894460; x=1757499260; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkpDb8z8YS7VtUJswa/sv69zASL37yWTBrDRHNqbvzc=;
 b=zMgKVC9gqmuiXO/olgw4ivOPrsJkRO1i6AGD5YRkxDhtGOMe+90NfwCT91f5PUVYUV
 nOGKznV0g9/76OWQIt4eSeIDfUc9bgn4UJRzq1F90I5wpM1fns3e/oN4mliyZ/g4xxhu
 01wQEQpzaixT+0xIxtwROTVKovLWEgJ3D/AaKO1EKnk0FYnpXiYlcT0+vLhyVIaTVmp3
 IqlKBkIp6U5hefn8500w2KJycOMFpEFX7pQJEOP5UiN8mrW8zbH4R9yg5+3NnM/ULG4c
 0f5Z8g9pqGBADn4clsALG1YpV0SquNC7vIwpm0nDrVD5mIvAm4LZ53pmXYbv/KbDMndD
 xa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894460; x=1757499260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkpDb8z8YS7VtUJswa/sv69zASL37yWTBrDRHNqbvzc=;
 b=PVgMaNNGOE6C9YfSf6qO0nNQx7Ni7uvibDzANbKBRlu6jYuCIlKdYpxowtsftQUiDi
 1AgfWL3Y8z0+sbYMSZJPkpLLYpEkq5e5dZA+horZFepMvT1sCSb/IrJi1JqoB+Z9DRiN
 e0SSKgXyicXmnW9eHVETS005Jr3FuJQZELEodRkZrhdNQdhe4dW75RVwO00syW5mKJn+
 AIJYH9lR3UJhXFchI1dzPRWRBTBynsZrgJ0WgBEurG+6A2IO4JcA8N23QeDcWU8WqkiN
 3r9tRMaoF45pAL8kWaTbyv8MUR1bOXgPiTjKa+TqSXO7XDasZQV1/5iJgYpucjyvMm+6
 te3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJZZUQKZBbdxczqDDMhL2Fv+Xqz7DY22pUnHQG5BZLZOcWSx5UQegdrFqN3k0+K4lfCJc9sPDl0g==@nongnu.org
X-Gm-Message-State: AOJu0Yycc1m9UeasTCpjG8tQ8aKfmzIsfhOG9AWzgZe+w/REaGYAqKob
 LQuQ+/a4EM2QdadCv9vL+jxpxB2QQnYk1JRjh3ki0iMyv+skEgYahULp+GwOJKdAntDAkchpVwu
 LJCP6jho=
X-Gm-Gg: ASbGncsbKs3ViT5/bjBGPnmKFdsl+5t5bc7USV2Viq2+TAizXwu9vk5pv2HbngSfBkY
 dsmAcBu7GIcKgIghAenfgZRPzz3b19QnkqAqiP5MNnX19qcFOuuTWsz6MbXTTwow2oGc74Ny7Qj
 dY9+3RL/m0TlLOwQ0PKfhf9bTL5Jsy2eoMHjShK4eyMlqEvpFlmQRlif306+D6OpnRh5a22W4pr
 mHHC0DdIVAbvbB3hlCZ4jNPWaJbEamoaktTxEq2Vv75DDzbhciqvN33S3dpzBFHMEiYpD/uGoM4
 YYw/eDr9Cng8uEYJeTyT3qwMCLSnlcmIuDoj6r7ArxpZkaMForbwfrc3nFiEOGPB0o6PnwpTF9j
 CqTkvrXSraoahBgavE3dNct3JJpIMdPHVKxxGoTGUAnJapXCRhRI+B8x/mNfUl64TPF50O1/gaV
 mZdQ+Mkg==
X-Google-Smtp-Source: AGHT+IFDmwPiwtIRc5G1keApTzjVKIsiVyva+mkkT9xFeKv4sZ2rdC3Loce/B+ZR5Add9rqIVnfM5w==
X-Received: by 2002:a05:600c:1d24:b0:45b:81ef:c5d3 with SMTP id
 5b1f17b1804b1-45b8554e2f4mr124133135e9.9.1756894087797; 
 Wed, 03 Sep 2025 03:08:07 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b98e77231sm61696815e9.12.2025.09.03.03.08.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 04/24] accel/hvf: Rename hvf_vcpu_exec() ->
 hvf_arch_vcpu_exec()
Date: Wed,  3 Sep 2025 12:06:40 +0200
Message-ID: <20250903100702.16726-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

hvf_vcpu_exec() is implemented per target, rename it as
hvf_arch_vcpu_exec(), following the per target pattern.

Since it calls hv_vcpu_run(), mention it must be called
on the vCPU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h  | 4 +++-
 accel/hvf/hvf-accel-ops.c | 2 +-
 target/arm/hvf/hvf.c      | 2 +-
 target/i386/hvf/hvf.c     | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index a3b06a3e75b..32b32e1d024 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -73,12 +73,14 @@ int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
-int hvf_vcpu_exec(CPUState *);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
+/* Must be called by the owning thread */
+int hvf_arch_vcpu_exec(CPUState *);
+
 struct hvf_sw_breakpoint {
     vaddr pc;
     vaddr saved_insn;
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 4ba3e40831f..c1415b0949a 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -194,7 +194,7 @@ static void *hvf_cpu_thread_fn(void *arg)
     do {
         qemu_wait_io_event(cpu);
         if (cpu_can_run(cpu)) {
-            r = hvf_vcpu_exec(cpu);
+            r = hvf_arch_vcpu_exec(cpu);
             if (r == EXCP_DEBUG) {
                 cpu_handle_guest_debug(cpu);
             }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 1b59cc0eb04..7427ac240fb 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1912,7 +1912,7 @@ static void hvf_sync_vtimer(CPUState *cpu)
     }
 }
 
-int hvf_vcpu_exec(CPUState *cpu)
+int hvf_arch_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 8445cadecec..15f79e523e6 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -721,7 +721,7 @@ void hvf_simulate_wrmsr(CPUState *cs)
     printf("write msr %llx\n", RCX(cs));*/
 }
 
-int hvf_vcpu_exec(CPUState *cpu)
+int hvf_arch_vcpu_exec(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
-- 
2.51.0


