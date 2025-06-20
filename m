Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878485njc;
        Fri, 20 Jun 2025 06:08:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUL1aM6MYd+yId7+geH10mX0uce37N45buatZrqOPf0Ce8Zyl66vItNKLgMDv1RUdKAH5NXcQv8ZkOU1A==@linaro.org
X-Received: by 2002:a05:600c:8b2a:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-453659f580fmr21427765e9.28.1750424928882;
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424928; cv=none;
        d=google.com; s=arc-20240605;
        b=A9RCIn0hV9FbHfjzlqsmQM2islPjXbvHxgKdUGbLyFvPmSvroUYdmXUWSTnV8fbh9f
         oghp6dGKfjAh8FB+/uDf3hfPpV2dLpGuF9vpqhfcZHcDP0njvp1x7V03xyEJ7nHHPN+Y
         49df+KW2/AQfOIf+5+KGd+c0m7tfKjh+o9eX+6OrVYvnyMit4VCrI5ylzuZsbHBZ5L+s
         RpZPE21ay/q6OD8KVO8EIRAUQ7ag29pWANZXq5JRex+MmR2CKHwvfYen7OO+TlbNfjTA
         8FQ3S/wSCF+Krtd7PXMxg0AVqC3rL1irRB3ginhgQu/jYACmVVzSCnkLs8SjlU11AHp/
         60HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NW0Hu04oFurHIvjEpsNrwT15qBihdHLv3c5t8qKFRhE=;
        fh=ICNjZCjrCQe4ckRRZQqrFcXw0sN5u4TK+UTJe2E4ENQ=;
        b=NDRK74UiDTI5vK96hjTs4g+JCwh9ZMLjkkyNRpJbnjMaIvntzlbLhqR1OJvhvRtlQ1
         qIweHowu4xNDVj/JJnL6oXZDjCnCWQx4EJJ6nqvNOAd8Dv39/kFT+Oiy2FZpO43uMU3V
         e8WSmQwxUCzaxSs7LTad7H+0xP35F6SnEqMR/z/SJFkD6MvX+r6axu56PHyHzbGeQnLm
         U166C26O4pEq/1wMmT4+caQDr1Ship/DNBF/UBqsD8v4/HgTpVCMKPWFh9GUtRGXAiex
         ADIQW+zCe6hrS0vT0fM7FEoIAQ1yNsTzhaNH+vREIJVvu+iQTmgUQ9sE2881KVW5FeOa
         M02w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T55/yzdg";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45365a53083sor6658815e9.10.2025.06.20.06.08.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T55/yzdg";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424928; x=1751029728; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW0Hu04oFurHIvjEpsNrwT15qBihdHLv3c5t8qKFRhE=;
        b=T55/yzdg6kZS+j5uv37VJ51VLUZ/kyDNsAjiBKdNa4swdbOyC/nKNwLFyVaWQu07Ev
         sB5yoWRv+Z+1c6pkQv1ms8r+J/uabNU+gUy6gkt5vnvnvXbpZaX7b3HZsN7jpWZQEjZX
         bf1IY2KPDIM/u4cKSGJ5Ps3DjTPzTQJyQw5pfdhoT6d0xHMZX7UXsWWNseSgVyOEkvIm
         OTqxey7Pb6WMs2uU7b2BjfQsG8yvLRATM8VeJEXkBpAW38eEIhqP2E7ozYFA3FIAwiI4
         N+HagJHrFVaI7waHZVakQ9K8r497cOdYHCBuMVNNeZO0dRf1IHOynez1FsuSer6OEKz5
         kgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424928; x=1751029728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW0Hu04oFurHIvjEpsNrwT15qBihdHLv3c5t8qKFRhE=;
        b=LF9AU0wQfSc8WA/Guqgsyk/NyOhIEzgX4ERb4Q8qqnC1YOsTs3CQmJJxrKcPKKUUo0
         HQawZVgoLTm7qcgNcu+toJrr5gUaU8EpH06EXtUsG4AjU68WoImJ+JnXvMlIVjeikZQM
         J03XYhe0xuIJxbVGkDhagIwS1SKFTQjm7elhhxTA++gPGn0Em7z67prxWKSitFKFn31F
         cHnz8tNS+O1PWGuWuvHHroMcRDMdFzjBoutGTeOfp1Q4/SF7FgJeTIyujaaiL069zDOC
         evHMYC6hfttftflx5ZFvyS2sgHPGlAnnzQZvmSuEqR585C6I+lk8+Pb99a/Zw9pQjdos
         TRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrr4TIH0TvA+yOluusINNeie9gRZHqOzHz9O4RGy9R2gvuSjuCfKIukRWi0e28niKwZN1W6unT8vyBXQ==@linaro.org
X-Gm-Message-State: AOJu0YzOywbORqhgXYHqWfNOr9nwTAxpT9o3Dzrkdvi2VprARHRf3nmX
	chjCHhfVVfuWS8sz7l3ZzWBamu6e+naiujz7cLdZK1fegsdaV48BzrKAhA8FDuYC7cT8Nw==
X-Gm-Gg: ASbGncsNJhfxR+/h2ImwPH23Wo40XcpFZjFLKUqzxjxbw6jX5nQfgJN/zV5+SA6m2JY
	w1afjmoovBZ4WumhTj+TKg8Gjn+DLuTRQ9l94DaFM8fPhvQSicU8GlyWq2xvb6xHgqmLBbJptrC
	qqvWZckRaUbvKtqgbp/CVWrjX+V8AcQDjDH/nw4ndaAkUMPNw7sw+oqfC7lYUxzu3uysItMdBCu
	Q5UrT5BSTFFfn7YVFfWmN+6OmkF8dacUrfK0jVMX6F4JkXV9ZrNLKWPpJUFcI8ZkNZ0JNdBrLNk
	LXEsN9/IEIce80B9029EdVcS2r8BPAEw/gjLJtJN0L+7P3hUodmm9ATJpjYeQXF+PEMe3zlqlgH
	qE/IytcVRjW7HaoAPZCPbgdRDUhe5urLUGWOL
X-Google-Smtp-Source: AGHT+IGUxGQ9nSF7X2qks3F5L0LQ6lJ+WfpvhuThp4HFmarf7Jsr/FvLwKNQzlPqKQDhSjDBkrHhqg==
X-Received: by 2002:a05:600c:1991:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-453659f5888mr23208755e9.27.1750424928234;
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18152sm2006529f8f.27.2025.06.20.06.08.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 17/26] target/arm/hvf: Really set Generic Timer counter frequency
Date: Fri, 20 Jun 2025 15:07:00 +0200
Message-ID: <20250620130709.31073-18-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: doOA4Mwqt+aL

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
 target/arm/hvf/hvf.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index fd493f45af1..52199c4ff9d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1004,6 +1004,13 @@ cleanup:
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
@@ -1015,7 +1022,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -1084,6 +1093,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    cpu->gt_cntfrq_hz = get_cntfrq_el0();
+
     return true;
 }
 
-- 
2.49.0
