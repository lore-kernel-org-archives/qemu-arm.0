Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929CEC9EC68
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDk-0004xs-3S; Mon, 12 Jan 2026 05:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDi-0004mg-Kw
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:22 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDh-0001sn-4e
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:22 -0500
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so2943512f8f.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213940; x=1768818740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Kh+4Sh/zRQ8CAg3HJCYZrKZcr0kD3MOt1nUSLo1u/c=;
 b=XZm6ohN/EYBPszut/DO8jHneEEIvDFsv020Pcljyb8dQfEcKsP+zG6n6NMvCUrsoDk
 Nm82e2yZ+1RpJh8Hc9rsYLIUz54OQMffW07dlyKO096lwFHRWaZ+AhIyi6p93qtniopA
 Emc9iSSfesY873NpN1hNNmBeGXJoBOJaJKJNbn73iu70rTWl4LlUH1IvGnNWuC/DFLva
 PMjddLtZxygocD8BeoQZba3uk0/lKUwLmTkcN408gqJhqQ+1HAD4TUxsZVTfYJJ6tK9Y
 bGX5n0/o8mXU6hJGAvCAbeDwB0BcUIz2raQX89HjsFwiEEvyBvExzWZL1Uvf3LT6JLAq
 gdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213940; x=1768818740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Kh+4Sh/zRQ8CAg3HJCYZrKZcr0kD3MOt1nUSLo1u/c=;
 b=wVs0738f0kW+QfWKctYwOCdKKozZAbbS6PmSU7qjrCEQ45ajy8VFphb5bk5fihnvcl
 GIb7+Y5iSiZlq8PgcNaoJ7Tuh+IpJxDMgWDf3MMcH/evZilmxfZwtIYQLeIpmU7bBIJp
 28U+bOLUiXyXQnKV4VWtS4XdiqXxXCv2qVwx1I/LG8eZWOGhXVXVx0k664b21oL9OC6Z
 a/OYz+YF/Rj5fe33SP7xyS+LDtf7i8fSnWaTuxmk86zNYf5WRsZE/yDUtPiZ25tH8zag
 czHuaRArPT55lBnSi2my3Lxou4T+Jshmuv9b3dWvJCM24xf68j2e5daTZ1KOFDjI6eK4
 L8ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDkmum2DELfgkD+ZvveLIPsHrkk8bMm1U54seAss9H6O6uS3d/Z+zvaaiHv/tAzpgmX1SBaZWXuQ==@nongnu.org
X-Gm-Message-State: AOJu0YwlT3uBGF/sL1EB6+zGrQPZbCWeEc7sHgpM9s0VB/EHl5zKBS5U
 5n1uwfklcGQBKcEcUECpHFTycxbmTBLOP/OawLWXKHUSvUjyRcdJjQjekwHQOvaNwwQ=
X-Gm-Gg: AY/fxX6ipXwvKTH2xaNnMRaE8KFE2UGfG/bQwqh+EW8oHkPS4IPOD1SRsttphZg2hJS
 8m+b7hqfvlj0nBw+Ir9mn+VkbJmxyR4vh7WZHM2x1ZukYQKQXi1vKD1b+cPcwyn/bRxgy0UKP6L
 QAabPJcIiQrocanFGhGcr/P1jz7RQudl1h4BM5WikiSu6qwYXKyUPrI0gXa0GxFL+EpJXjWtuZm
 7F31iivVXhRAMbG+lJ7c0JlTpEF5lf8ivPl4rcsyuylR2ytJ7Jq7GsmI4JilqKHSgtMr4wJkw1h
 pIpB3rwL6KsCdafcGZtqWpAZplPUWZHymT7cmXTgdV/OwdH1RDiD+OjuzMqAF2OqDM/x/HmYBbS
 EQiUog1hJTrlJmvnqo3T0p1tksmX2MQDtg8vtZ6RUhwP8K+dxwmiqUO2vK4S1A8OqoJaG6J5IeK
 PGS56lwqJICpjFJhyI3NvZ5Rr3OQ5Kk/0MEU7DXhe/5J44XHBQm1f+mCjAXn99
X-Google-Smtp-Source: AGHT+IElMUYyHZPj4L30whtEhJ6TJuZDnl5hgM97hyaM0UUHuFgTAGaAfSYsA2rAnUhiwpZkjvH3hw==
X-Received: by 2002:a05:6000:22c3:b0:431:3a5:d9b8 with SMTP id
 ffacd0b85a97d-432c379f4f3mr21648932f8f.52.1768213939678; 
 Mon, 12 Jan 2026 02:32:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432dfa6dc4esm16087003f8f.23.2026.01.12.02.32.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 15/19] accel: Introduce AccelOpsClass::cpu_target_realize()
 hook
Date: Mon, 12 Jan 2026 11:30:29 +0100
Message-ID: <20260112103034.65310-16-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x443.google.com
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

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/accel/accel-cpu-ops.h | 1 +
 accel/accel-common.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 0674764914f..9c07a903ea0 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 850c5ab4b8e..eecb2a292af 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops
+        && acc->ops->cpu_target_realize
+        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.52.0


