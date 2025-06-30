Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458537dye;
        Mon, 30 Jun 2025 06:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURTRd/fJgGuZ7fJU3wjlPIb/e/XwQW8rDhadvOThGR1iZQLdL3E+o6p/uN4XDccF5jBGA5RTaBoFwTVw==@linaro.org
X-Received: by 2002:a05:600c:474a:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-4538ee39fbdmr138760195e9.13.1751288997825;
        Mon, 30 Jun 2025 06:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751288997; cv=none;
        d=google.com; s=arc-20240605;
        b=YW1rvsd1htdx0ic0ZD7S6FP1wSeIikpddlOi5MuVvAYk31n0+IWbYIxHnnyOa0W4E8
         OBcbATSkg+0s6HFKJ0fLm6DVjDiycGE03rxW7/e04cejLKFO8WxELVGhz51+K98fCCSp
         qFjw3+9VCLOm6upaP/RERxhQzXvCTtK+w9f64Ot9Y5L48cFTUjiTyk6HV2FRgkTVSEIb
         XzoDyAs8JqukaezXV2lWa8hBLfZM0spwk1xIGiuNW/VcxVjHX5oY1MTSH32w1y8418Ep
         ZxZJCFYKuFzV9s4d+ORAlWQql7d3GrpKdlHKKbo8ea7bMgAdfzLeZNGHSkk3xau8oFjW
         +5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gVu21VQj8moUvN4y9H9klvBu0KFfflfQTQgSaLVpIq4=;
        fh=4IoRoYglhrAqaZinob0k2r6KREVqqUUjt+675F8aapo=;
        b=PosHCmzWLYwW3QAEqnnBeddmvYnAmwEomiGuemB5+Q7A9dDsQihf35wp/L0uOqOwca
         z7TmYD7XE8yq6vk4iSxy8X+LzOrv7cH+kwNairA73kxk4C0Q2+8D9JCKarDoQxzeukou
         eFkolcPDFNli1aRTGlE2+JLMKTJmOsvWuORi+hJrxiGqw7h/eM+uG/as5iu7uG8s/M8N
         He3elqk2gyZ4QcXC7dUWMH9XqMaSfETpHndIKA9JGpib+iSF1ov8AeZSjvjl+oJA+LQ2
         hTaxhRE5XDZfyF7IzTUJelvA0dSZpow5GZghcPITiEtRXlaIbt+c+zchi9QGzTlKEYR+
         W+gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S95bMyJi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453934acad3sor20627185e9.9.2025.06.30.06.09.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S95bMyJi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288997; x=1751893797; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVu21VQj8moUvN4y9H9klvBu0KFfflfQTQgSaLVpIq4=;
        b=S95bMyJiyz4yL69SEQDFNnVXHcdNPKz5L+SIn80Z9BQhmh8Gmyi98Cy1bfJ6OHWhHK
         GVP7a2gRAj0dTTT3KBge1QMXI5kce0W+AGUQlEYejpeQ4RPClcXZOntdVOs9EMGQ9/dt
         I29K6fe/1yODaMRR2Jhn1HQs7yIxzUKgGuu2qtQYyjFa+OvYb+Tiq05xCJr8gVdHe1y6
         YOqlIE/XNyg/nGpvrMQUlKUvhojuwtrd4Ojrk1RCeqzHy9uvRRObs4pLrQiWWVWNMdb4
         klYpL2zKJaDuSnbNkMGScxO6qZZ5y/8CJAxaTwXu/9Hi1ff/3oN1u1L3XM4xmu5LeiLb
         q2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288997; x=1751893797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVu21VQj8moUvN4y9H9klvBu0KFfflfQTQgSaLVpIq4=;
        b=w0Mm3aS1WgcoHOTbZ70EO83zDpvpcK9uezr0KfwxHATYtCpwYyHZKetzm5oDpvm2Rf
         gXKZ+3hPKKo99QnRdyPG1ox8FPMzvVowTsa7jAH8yAFRxkFW+y7zgsWPYsG7qLq1Jv/A
         P4R41PBuo3tTMJd3pghfoNzoxI6xuUBqMeaMzQcTJStPo91hGSg+2idDl9c+acTBh8nJ
         ATPJK/+jhmzQNIbXm7Jj/gl4nQn4uVeEZtzQfpji6QovUMmjtMmtleRM8VoqhU0Irioo
         2+Cp3sIUUin6oYjJmrI+aSJ+Uk3MtofHrs4YSQDTpzOUPK61wcdYZjwIjGEPXgGXu2p1
         fWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSRMB8WQWC45pJX2JNaN+pSQTOK89iSA0kaBCFtV3pxUjpEdl4cZx3HiHi0P7nuEZp700w9gQv1jXBkQ==@linaro.org
X-Gm-Message-State: AOJu0YxaTUcWLZIluwpCp8giNwBeKpJqGsr0w4RPN2OJ8dZNNLtUqKYT
	aV4mQu85KtNmBqihYoiLKv+onh3k1aTLAEFtzU0DbASdHuJX2kk3itF/83ZdC8CLDyQdEg==
X-Gm-Gg: ASbGnctMNhVhISVfwDBCgmrni/HzoCpueGDJ9/kWus3tM87PGxL9ex+Sc9yqPHHLryC
	wi0CPH3YLqpESyPqNytUvnpxvxIlAesbXjb2IktHbKJ7iWmYtq3iB0g1M+TakiE5egNwOSWwEMx
	FGqLgwj+qQBtDGxlMWPveGUzTDWj5JI1ccD8/N3PY3bcMlf7aBBU6kXzAbT0NPDh5aC5bOiMaba
	k0iN1fSzHaQv8Aec7/D++S43ewVq9IsSFVWtnvL7njhnkYfbd+vspNZjcYJvN36tBcciWzwan5Y
	mWePtA0/Kg5f6gmDwkjkraiQccUygfIvfS+Fmi8Jaz5bp3i/EgkBDkhT31lWSMc14BZKcEwk7Is
	cWGGqPndMBgh+KPF1SWlAb7KPd2CMyBssCRSN
X-Google-Smtp-Source: AGHT+IHQZWVRv7COfUKTcPVWGcRltskCqmNyt9doYt3xOLyzJlaw8sjSpsZQE/IQWqL04mhJpyU42Q==
X-Received: by 2002:a05:600c:1e12:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-4538ee39aabmr120625305e9.11.1751288996757;
        Mon, 30 Jun 2025 06:09:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c4acsm162585205e9.1.2025.06.30.06.09.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:09:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] target/arm: Better describe PMU depends on TCG or HVF
Date: Mon, 30 Jun 2025 15:09:34 +0200
Message-ID: <20250630130937.3487-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130937.3487-1-philmd@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CGPUT4+j44ps

Simplify PMU logic by rewriting '!KVM' as 'TCG || HVF'
(ignoring QTest, because vCPUs are not available there).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c     |  2 +-
 target/arm/machine.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b6a8ba83a46..0311ff315fe 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2352,7 +2352,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (arm_feature(env, ARM_FEATURE_PMU)) {
         pmu_init(cpu);
 
-        if (!kvm_enabled()) {
+        if (tcg_enabled() || hvf_enabled()) {
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
         }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index e442d485241..baa7ad25ca9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/error-report.h"
-#include "system/kvm.h"
+#include "system/hvf.h"
 #include "system/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
@@ -853,7 +853,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled() || hvf_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -888,7 +888,7 @@ static int cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled() || hvf_enabled()) {
         pmu_op_finish(&cpu->env);
     }
 
@@ -921,7 +921,7 @@ static int cpu_pre_load(void *opaque)
      */
     env->irq_line_state = UINT32_MAX;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled() || hvf_enabled()) {
         pmu_op_start(env);
     }
 
@@ -1013,7 +1013,7 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled() || hvf_enabled()) {
         pmu_op_finish(env);
     }
 
-- 
2.49.0
