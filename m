Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32BDCEACCB
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:09:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK06V-0002ps-QW; Fri, 14 Nov 2025 15:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK04D-0000G0-11
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:47 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK04B-0005Ah-Du
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so17363495e9.0
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150801; x=1763755601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvXFIS/LP/8nn2LaWPgW13nQ8RvlKKCfqWkyp2+R/Cs=;
 b=XZd8/J9I74tPJ7JXWuXlYC6HK4auQGD4UUcsJz4qjYu6zrUfeE0N4SKz2FUXIenNVa
 p1xMQjE/aUgA3m0A9aO0lH5Os9/JYRy+B158PFlkK6zYuFIu2P8k9OktH3ECkdKfncSB
 EzkffPr6W5vqHr2DSX93QG/W/ryF2aLGseQDxepYSMpVZLwFexVZbohVkN1iDOaxISK/
 v25rvJdpP6ZIpIdWzY5J1QtEcr52H8GpkvdmfBas8Ex4Wu0Qs9CZTjhy7RENqwUUx9r3
 aKUtqUqNS075IPo1Kxx/t+T1V1KwxrLYboqpnCQqZaXA9+JmVKvi60X27924y/TZBwXF
 CQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150801; x=1763755601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UvXFIS/LP/8nn2LaWPgW13nQ8RvlKKCfqWkyp2+R/Cs=;
 b=UznzhIf4TXSwdrrm5/ejYaRwGsYaPMD+4ER0pe9G/+ST6Ufzih/ORqtYMVqGWKE+ON
 CrTJOd5M+nPUNvLHzQ9TwklPFgJaitOCh8AwQt+OXyHa8FWmEw+10V/wnvTdE3skDL6X
 xPvC7ksOVoORm4Xl8rWXdF9TJZq/3WTK9Jz+cSj/9cUMJ2pR1LOuJW+HrOpn+eanhxE4
 tgpjLoj0X/cqmw5ywURD9tQYy4RxZGN7w+rxbkf72CrAXYbwAlMVsTJDq35aP3G9pKQn
 Un1LvxQJmr1kSduOvrcLMigFtuhyubZJEHlL4UzKKNXc2F36p09+Ad8kos0ayC86aRVe
 Uilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5mv8ElEF5xdfIs0MIvchFd39RZQh4Qe6wIUxi2QP+CV5dbm2xOKTP9CtIRjNtxd/Fo4evJVdpxw==@nongnu.org
X-Gm-Message-State: AOJu0YwGRBjrpycgF1Sr7T7+c+3X/1JdoKxikHYCxpw8OD9161YIfD/9
 YlnJOuiUFGzmzBqZoRS49sE9/O6a/LTn8M478DbeSbeiGdw9LD6WP/OfxpspFHua4Hs=
X-Gm-Gg: ASbGnct0sK/f/Pn88W/21vqWCul3WtLgEGssRfbfR8/ajLYYXxvQksuHhehWQmgsfds
 BxT6yOO7nDg6lqRsYPTCz6fZ/Zq+pye31miqFFJcD3ni/WqtUT+RjgzklCxnpfEuoM0br/qjGVr
 Ou1CGTeTHpNHxBBkXuj4qCl4sUOtGbQLKWVv75kcYWs6TtTpVT2FNXcPLjt6fmBn3fWgp6CxjzV
 CdWNPsij4hBN5HegzsqJ+gYxrljAgEbAXAemup5o4D4BajuY7JHqR8MGJd9VhSvjgBcRe6B3d9W
 pwvezwHH0rw9ooW32ofl0pyqEv5KfP5518Nz+EvmEL+IlLKp4EJ7/abxJG+xGvwOAR41Km1Zc4k
 0kL6xcCPTcgd2RvfqcgAce3RwK9FKj2ei7KeXfcsw5DEYei/gUcyyLq35T5hij7WDaDwDWAp9RF
 rX4mcOoDDHO8XFZeDMFeuOWHzQuzBbwKr6iF0/HYHFQVQOZzoPdQ==
X-Google-Smtp-Source: AGHT+IE1x1/y/DyfM5dpDRooQwxZx3pySbIOgh++zsIKbH1Pj5PkFcVqGLIb+7Ef/H7cmMNi2YtXdQ==
X-Received: by 2002:a05:600c:4fd2:b0:471:9da:5232 with SMTP id
 5b1f17b1804b1-4778fe62164mr40389765e9.15.1763150800627; 
 Fri, 14 Nov 2025 12:06:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e8e798sm158847825e9.10.2025.11.14.12.06.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:06:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 18/19] target/arm/hvf: Really set Generic Timer counter
 frequency
Date: Fri, 14 Nov 2025 21:04:20 +0100
Message-ID: <20251114200422.4280-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
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
index 8208d345daa..e1113e3d6ca 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -897,6 +897,13 @@ cleanup:
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
@@ -908,7 +915,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -974,6 +983,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
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


