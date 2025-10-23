Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF5BCCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:42:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuXU-0001yh-16; Thu, 23 Oct 2025 08:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUK-0005Ws-Eq
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUI-0008QV-45
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47112a73785so5376925e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222731; x=1761827531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQ2Eh2V7b9Wp5VhIUqDSe6OaTHE71wRbrMgAmX2CIig=;
 b=om0RGH/GFlFkxbAGm1QtrhhvpiL79nFtbVlyBD0pt2M7S3W7LDH9xWl3rPytpgBFCi
 SnMNakYgpmgbA67M3xshUeJr2mktLeG/ZwjCo96aowyRcaK4uF2a52GrEJ+hlh5WgbZZ
 A6oi8USAkAgi8ioCE01v3ybOkukixR5aE8rQMVLL5Sx+r3pfWXG0bzTaw3zxrapLyfRc
 pvAQ7M80TbnNG9XJNK7Bj65O2P7In4nNh/RcEoIqYbCIp6RdZ96AtTtxKvh8EjM7nsjj
 gGhQM6iP0iZs8kX91dZcrY7j7kU9uX8Tu2tBqIhAblX4HHcCi7+/gWsuZoqc6q9vyGf4
 UOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222731; x=1761827531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQ2Eh2V7b9Wp5VhIUqDSe6OaTHE71wRbrMgAmX2CIig=;
 b=sRhbN0vqBBJyWHqKBbi0GTln9GXKUU5T6tDdh0Swcz940dTPsUWlOJwOpOWFGaWtoX
 7JyuUHNTahC7LcvoZpz0ySX3OAESHgwMcgD+uzitkHorWdgn1jkcU/Yj9ApiOLcw/2eq
 mL851NR9QKDfzj6rntF1YAoOZeez+ghHOqMZQh8VPv1tVIaUNc2mapZwI3hraFI+PlL0
 PLwn75j+7KKg0HHgQ8XU53t0gg43hDjvFf12g7k5BBbWS97nhopdpiuIbVedUPWK9KXZ
 q7FjSGL1B2VaE1U5/Vc739OgWAFAakBzeB07I4D7W91oBlwScJfnOroVv7HcUs2hUXLQ
 pXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTlcfchTu6xBNqPHuWNcdrlFXyBCuG4BaR7m3zhz3tWvqHbAYG/jsPNHkrt4aN9k1EA1Gh5fvccg==@nongnu.org
X-Gm-Message-State: AOJu0YxcWuIKIbPyu592mAPfcDYAcL5+dQPUWvXegPwj+4DTDwPAJO7U
 qJxgazulPTTlDH0IraH2ZdfK1B7IEOqKOan+gYw0BMtgbVeWCv1WT17wQtYNvvz8MTM=
X-Gm-Gg: ASbGncsUjTnYJH6+gRXpsqIoSgiSfgSYZkNBKM3g/1+NKiOCcEQ321I5f6B/7ibNng8
 nZnD2GIR+8jgRpPxJAOHpeCW3NBegXddJYkYYhmHS0cNKPOdIAj90QXnuiRnRcqUqyKxgLtbSm6
 btj1Iv8HwZjLPqINjz1yNjEGrRXtGkmy7VRl4wIlcwPTbqzzEj2TdZZa1bQNUde0KZDEfKNUY4l
 BLz/EbfwOTm6iyyA5JRACnLM4tc0lRnc2cb6oAH4aFSZnA03by8CN80XItOErVlBDRztiTCrGze
 Dhu2jqxJw4m0vkA1iN7MOZ9j1g8ZakFpgtoY49ow1g8g7p/9DZjOn4u0NqbTSxy+e0KTHaYLpUC
 /g12Kc4ENOG4RznIDEsWXPnVPfIHD7YVTrSxly3qOMW3H0M7HBi0F/llm6yuK8z4++haU6eGjNZ
 9vbZCtkaYWPA79A7TjWOmNtp923UzcVkqOm65PG8onDSnGH4XqNWSqDNXRKZco
X-Google-Smtp-Source: AGHT+IHdLIabaXeqHr9Ts4VbsGbGYrlcJVb829CWbLCMNsHjme7sJzZscGlOyqbJYpq2gUpVBbCLyw==
X-Received: by 2002:a05:600c:4fc2:b0:471:1765:839c with SMTP id
 5b1f17b1804b1-4711791299amr163823875e9.20.1761222731365; 
 Thu, 23 Oct 2025 05:32:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae924a1sm44072925e9.2.2025.10.23.05.32.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:32:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 55/58] target/arm/hvf: Really set Generic Timer counter
 frequency
Date: Thu, 23 Oct 2025 14:31:39 +0200
Message-ID: <20251023123142.8062-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Setting ARMCPU::gt_cntfrq_hz in hvf_arch_init_vcpu() is
not correct because the timers have already be initialized
with the default frequency.

Set it earlier in the AccelOpsClass::cpu_target_realize()
handler instead, and assert the value is correct when
reaching hvf_arch_init_vcpu().

Fixes: a1477da3dde ("hvf: Add Apple Silicon support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 759fa2e4d7d..f3cf5793ba5 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -904,6 +904,13 @@ cleanup:
     return ret;
 }
 
+static uint64_t get_cntfrq_el0(void)
+{
+    uint64_t freq_hz = 0;
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(freq_hz));
+    return freq_hz;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -915,7 +922,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -981,6 +990,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * We must set the counter frequency HVF will be using
+     * early, before arm_cpu_realizefn initializes the timers
+     * with it.
+     */
+    cpu->gt_cntfrq_hz = get_cntfrq_el0();
+
     return true;
 }
 
-- 
2.51.0


