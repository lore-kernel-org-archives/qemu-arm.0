Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253242njc;
        Thu, 19 Jun 2025 06:14:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU8ec/Ho/jwn8PJZQyktKIqB8HHfTX84xmHY24PJLgdXOHRxpsYQoMowXzrCYZAaBk1tPc0Vj2JZP1Ng==@linaro.org
X-Received: by 2002:a05:600c:1c86:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-45352e1904amr99847765e9.19.1750338882955;
        Thu, 19 Jun 2025 06:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338882; cv=none;
        d=google.com; s=arc-20240605;
        b=TbO7jmSisVJAtSp/pMmf0ONQsTdRj6Bm4yXFYJL1Kj/DkD+vdtUI52CqIwW2G8CC3r
         uB5iwvisfwnH3XIctdLu+elGBcip7wLQ2+Ske4VPH8VlfAIdzTlUtxkMcTY7AFWAal1p
         XXZgcEWa8BBr+GXKfIHge/o3cy+tWxIHatpEEl6Zipj6Cx5Krz+c6Qe/OzcqMu3zTmfv
         FK9mSe+4Ap4YaQQrZGEQmAyy/fMc7m+w2cDTmgnaDXpvEDgPIJraZow8mXH7mvIar6ui
         QoiTjXCJcqrmgAMX7SGJlDI+lHzFqKwagyWYygKYVW0pYkYWo733vWAkkkpjaJjJPUYo
         kgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4TTsVWGK24wAjdPt8HIDq+esVA7ZY3jqwbKqWeNJBVE=;
        fh=oQGFntS8HWW6BLdNsSQCr6Bd1e2LI7FSaxAo64fZFTc=;
        b=aKNROb3DwpnRdI8EZQfEzmjwj7gPYegMezcwoNewnyS3y4ztDN2m2hWC8nD67NhNW1
         p/sdSW3ZAnFtl7RkWPpwyP88IR88t/i5NIS7yIhvaW3moeUHGdycBSm5+n7L5wnf7B4I
         hqtFLNbizPT+kt1G1T2F/KdZ7f374aKMIfG5K35FGrsdKf4uXly3cAlo0tvQwiCxrxnh
         d21+lu0CRybJNNTNG/kfHleE1U/NL8Th1G7CcWNVlJlLY60hSWUFsaOQ4ZNvDrL7E/Ug
         hPhWNmmQ0sg5KFxIcbaOqXpjLnUROLAZMYnAoDx+vlhJY7ZEQauZ4PObxBAftF+5TKTU
         OSJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bUxBeDJ/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4532da1e723sor71672235e9.2.2025.06.19.06.14.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bUxBeDJ/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338882; x=1750943682; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TTsVWGK24wAjdPt8HIDq+esVA7ZY3jqwbKqWeNJBVE=;
        b=bUxBeDJ/0Z7rajh7WqMAUFAydfBWIj/G9QvHfMOOflPSqObTLRVASV5yHyiTwGVhjo
         +tyKqb00g2Xz22cAySsTeDpnKwQBnSZ/oOQyOoiuav0D+zcVAl50xJfEJjNw2A4+CkZP
         HULob3tNEGSgeWMy1nkFs3W1KElVono/CCL7d/gDc6ck8Um8Sdxu+Gjtg33iLQiOJh8J
         OSa7byvdrqTZHxuZqE9AdaK+xC0cg7Llf3OYDWRTUQXmePxf08EuBMO6ukNL1VodvJiN
         LQDFAC5VM+pwNmmb/ghYQBM1/40Vt5MO5olqbOtZ9YpzUyCXEYEtJbeIVbJbk9gUdBRI
         mOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338882; x=1750943682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TTsVWGK24wAjdPt8HIDq+esVA7ZY3jqwbKqWeNJBVE=;
        b=qWkYnOIfQT0DQ822cRUwKddnrXFmvx+XuxSNuQ4SOFJof9lrieyioQreKcnJO5fHZa
         Qn9RbBlUKDjFgKNXDnJg9zggdWNCbRR7hF9cRLo9soZbBLmzx7MOIFxrB+LX+RbXSpFS
         OQAhvoa6OkQvuXzfjUi3DD99OmT3SkZ4eFpYRyXqH9tDlXx5pBUGZjeKriar5MyaTf7V
         dhelqTuir3MvA9jJBec0TWC7O2AJDjuAkZiB9SFo4Vp3UMfUyTjcvxzaUovMIGTkM9li
         LBcAznIwQAi8g2GwuQqQ/qSn0LN8TuXD/cDN4m7j2xN7FoyjOwRyGCXRMZ20K9c/eUXN
         hOoA==
X-Forwarded-Encrypted: i=1; AJvYcCWQJMZT8b72UV+orsN6+I+srrLuUf9kyUhfrK6fMCMbkB8mxy3kEP5M6eR2QFNzWCQ/6e/DYs83mkzgPg==@linaro.org
X-Gm-Message-State: AOJu0Ywh43bOF+C2sSB0fY3AWKHQ/7OoUQeFHmRsm4sxaQYBuwJvt3KU
	OARFcR+T+XrP08ODdjSvcP6phbil5GTp0IUhgYLEJUNn5JKMKq9KmTGrgEh2o7fWm7iPdA==
X-Gm-Gg: ASbGnctTLDCarqPLfun1Mi6JldRG07USVKV5zdPK+lu8KPaaFxLwnFK5kZs92vTCE2J
	qg3z3dgBMHOSF1RCHldGs2uqlwCJWI83zu6Pz5VTD46wuokwfRzFGqon/VduW6nLCA7EvlsR8wB
	1xIYK6zcbINXOPAzdURvu323EQfdG8glZJbloTAzkEiaLVBVH8pHny9Vsi1UdVErTA9UWy55xXF
	cNYGhpIW0U2PbR08lTrMbGfON3ezqCFhFeFHIO/R+TrsuxJY5OUp63MERVRlaCcPXGWjAsGOG3u
	0J7SZM3s2tVyGdYw28ZjtWBqlwk3PeHaqS5FGkCsAEgVlZ0L78qQCtlCy579QsED7AV+4tB+E3A
	E5dviazvv8TX0wEaWt7UwNwFZOmMVTXGeTsFoDrCSa9yGhEM=
X-Google-Smtp-Source: AGHT+IE0UJ/OKRN13EAAVAiGqkOfuQ3hywjomt6DtP+BfeCmZE/SGHvtR8ilW3FX7DRO6yFsM24vUQ==
X-Received: by 2002:a05:600c:1c28:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-4533caa35c3mr199299745e9.11.1750338882244;
        Thu, 19 Jun 2025 06:14:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ef6edbesm26382285e9.20.2025.06.19.06.14.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 15/20] target/arm/hvf: Really set Generic Timer counter frequency
Date: Thu, 19 Jun 2025 15:13:14 +0200
Message-ID: <20250619131319.47301-16-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EAxWJp+JHTOk

Setting ARMCPU::gt_cntfrq_hz in hvf_arch_init_vcpu() is
not correct because the timers have already be initialized
with the default frequency.

Set it earlier in the AccelOpsClass::cpu_target_realize()
handler instead, and assert the value is correct when
reaching hvf_arch_init_vcpu().

Fixes: a1477da3dde ("hvf: Add Apple Silicon support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 632751d1eab..fce02d22ef9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1008,12 +1008,16 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     CPUARMState *env = &arm_cpu->env;
     uint32_t sregs_match_len = ARRAY_SIZE(hvf_sreg_match);
     uint32_t sregs_cnt = 0;
+    uint64_t freq_hz = 0;
     uint64_t pfr;
     hv_return_t ret;
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(freq_hz));
+    assert(arm_cpu->gt_cntfrq_hz == freq_hz);
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -1080,6 +1084,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(cpu->gt_cntfrq_hz));
+
     return true;
 }
 
-- 
2.49.0
