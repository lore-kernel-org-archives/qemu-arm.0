Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D92CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:46:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcXY-0005ly-8y; Tue, 28 Oct 2025 01:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcXS-0005fQ-MZ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:46:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcXN-0003Ez-Fs
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:46:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so3368452f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630376; x=1762235176; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgDIx1+WcFxzjLnk5TEpP+lXGB26NdtGHoTw7EUXsBM=;
 b=V3JZxN4+Jch22iaSBnSBXRNP5x/iiG7KC+y9TOt9QLsIsxZHZv97VKVXpexfhmDiqA
 AiHCY7iBIkG6MjLgQoUkmwxO6IRy5Uk/1WteeSfYREIV/fEbIjdkqF9xRvwmnnBcbXcZ
 FcWUdq5f0QSK5JvFThZN35wR0Bs9NYhOPV3IJkL+JaxBQSetVKA7IR1xFYpr685Zbe0T
 1TUrrUYBcuKkqQ45/acQFIu+8QMFS9Z/Ird9oAO7OxdLZv7uA/pRYmz/hnnheZ/qn4HW
 ypAa3v12PArgw8YsjIyTuELCWZtlYhIx7w8liMXKEts1wZWZN78K/VL67VbLvD6h2UKQ
 +POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630376; x=1762235176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgDIx1+WcFxzjLnk5TEpP+lXGB26NdtGHoTw7EUXsBM=;
 b=EKGMOF2MfTpc0E7ne0YjmKhmpBjJM6p7HPLPzdwaZnziPswI5x8tcMJ1NjoFuJUGXC
 eNzdwO+VCbQCHUF6hOtFH/sxVATRKH2Bkjbbge7D9TRpEXKSCe94Ai3KQtak10+8PbxS
 RLEbyER+GaPkUrZ5Drk/7JZVg8OA3KQaGHqdgU5ZhrsGRUOsWhhj4g0OH7WbG7xlMer7
 A7hd8eJLbEqj+NnqPr7TndKcc0O7chTLtjIBfOjTYNryxg2jNORGHj0VpcZCbJB5Bs+y
 d/9gzBdyDVaiqMEd6Qv+wnuX7lh6R5vyDGr3gLl/aStQRFv1mvQHOzvy2BdF5xbyvCxd
 1BZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW8kJkrXSCBYJdEvJ9BBdjg9RVQb6559vach+6+l4gIOWuRVeMXWosr0qbaFpRapb2enEnh8KN9w==@nongnu.org
X-Gm-Message-State: AOJu0YxxlWYUiTjzOrPugZlu1ptChrYNcAXBm0yTB0iPzsejEU+ieIZZ
 AANz/ScUCxWE/HZ5/BIlHPTkUt5om/dUNlcwt9+ZguutTcdMziM+wgLOsN1r4NRcNy8=
X-Gm-Gg: ASbGncvtqonJrNCEtgQH9xPmbb8k4G/mGTNXSRkLrLBnzcXmqQUp2/mIX0sbe+8VeLx
 q8C0smOhEh9r4Jzrbvlk0Fsa1cw8gnvMbuBa0DofRSrYayRl+cEGJ06OyjUhr/JFrQSrAMTNRWJ
 d8b7rVYjI9HmmC+3yMOg1bqW9sMUhYAEHzj9EXncz7ZYqokLqFHLe50ddl4osiWKgZl0EzfrNiF
 KnmKu9zpZFXtFyZc4DhTNvwDByZG30JppJQtd/SCBwTWx2zln5lJ6G+Zd90kTC2O+eVbYV6m9Mr
 Zgk8Y9xK6gi537D2UVWmK7w1wLY92keld83rBJeoqxowaz84kkZh6eFLgHm5yfzYuhymAFI/wJp
 Lq1cMrID8rwsXZaXBrDl6wa1LAtGAN8DY0pEAq4A+w6sEaCy1zu/NE/Q65gXJ+1dNJMgd2WKIw1
 pjxROD3bCVyDkExqt/hluulDaGSUdgy9nCm1S/wD9ibeF4YQCpyGVKsIA=
X-Google-Smtp-Source: AGHT+IF/kxpKAOI+/OPYf7ty0EyRrD08i6Ro7eh/ILW1lgzdmXNZ+rNZg6XeUtj0wXTcBG6y6DSvIA==
X-Received: by 2002:a05:6000:26cf:b0:426:ed9d:4072 with SMTP id
 ffacd0b85a97d-429a7e59dc9mr1424348f8f.21.1761630376044; 
 Mon, 27 Oct 2025 22:46:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de5f9sm18192723f8f.38.2025.10.27.22.46.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:46:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/59] accel/hvf: Rename hvf_vcpu_exec() ->
 hvf_arch_vcpu_exec()
Date: Tue, 28 Oct 2025 06:41:41 +0100
Message-ID: <20251028054238.14949-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

hvf_vcpu_exec() is implemented per target, rename it as
hvf_arch_vcpu_exec(), following the per target pattern.

Since it calls hv_vcpu_run(), mention it must be called
on the vCPU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
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
index 8b794c2d418..005e2bd891a 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -194,7 +194,7 @@ static void *hvf_cpu_thread_fn(void *arg)
     do {
         qemu_process_cpu_events(cpu);
         if (cpu_can_run(cpu)) {
-            r = hvf_vcpu_exec(cpu);
+            r = hvf_arch_vcpu_exec(cpu);
             if (r == EXCP_DEBUG) {
                 cpu_handle_guest_debug(cpu);
             }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bbe0b24b821..9111c1d717b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1788,7 +1788,7 @@ static void hvf_sync_vtimer(CPUState *cpu)
     }
 }
 
-int hvf_vcpu_exec(CPUState *cpu)
+int hvf_arch_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 33f723a76a7..b2bf59cb483 100644
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


