Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878404njc;
        Fri, 20 Jun 2025 06:08:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIWeTxVj6RsCjD9yUMs7Of1bECDrz1AeZojSS+pq6d95d3wQ0ohLpq/a9RvFLBkjLYA5NmiVAj0sweGw==@linaro.org
X-Received: by 2002:a05:600c:4685:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-453659c61b9mr25950325e9.14.1750424922810;
        Fri, 20 Jun 2025 06:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424922; cv=none;
        d=google.com; s=arc-20240605;
        b=FC2tyCVCSOftXxndq9ACIXhETDR+DbRyvi3QFx1ua0ali73q0nh4Dont5iPdXPj7iQ
         loGK+/YG+fQ4WaORV9kbSgj3WK5nzgb+b7xgNe2DX4ODXlPB7VKVY632UkH7LrdtabxZ
         EfNvEl8WrUI3sPYwfQ2tn5SV4OM6ZEe4Yk+G/extKsV/z0ZQOOaxw0372dfxZhqjLObe
         4mtIiUiewmf2W3FXQD/u7I4yO2sIwWHKiXd6wpscxBacVNBOdQGiKrqXfDFvdK/xCMwt
         sml8gEV56ea5mVw28poTpGdsl/1+Px0tAbu8IBdIJYAMpaE/WdzwE6tltfoIDhkBx0AJ
         YcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2kLq7ybqs3cS0L36YzYXj0nQxUzd1xncr8lPWgttp7A=;
        fh=jblQOn3Vx8O50ODcD3etgjFbKEVC9BJGwEWI+DGDEbs=;
        b=BzuGCb5X1tFZCdPTfK0qaqYvWRXGW6I8tW1h2BqH+KGfyFaV7bVF3b71XUtXV8Sm3D
         g/Xa44wTvvhOFyGNj72rK7NxsdSVXd7tGDUyEqkq2Ys/KdVHreL2RCAs/B+DG3fqEx4G
         AidJnen4fy3pMHR9IUnxt9FeX6IspgisPj+wp+5cyMclwih59a0NcOsRHrL0mBEvsNye
         Ji8kbzWWRuHhdH1kzO8IgpVcEmJjpivSqQAS3aJKS7wNgR/fGaqgvSgVzF69Yq7A33nh
         sfb9kXyDBgAcQ8U4QRZ0xcaSLnD8x4TA/cp/fMTPeN7lFTSLHs8TPXq2PrZ3NWBLqiEW
         Rb/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yno6enJa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364708d26sor6330435e9.10.2025.06.20.06.08.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yno6enJa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424922; x=1751029722; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kLq7ybqs3cS0L36YzYXj0nQxUzd1xncr8lPWgttp7A=;
        b=yno6enJaokz0OCpG6Ih9RVwFniUmLUrHTHz6TL4oleVcz4G2vLtzRHshUDD2Fr0bPH
         Y/qsNantpPqCsrokl1b0UyHbjtCquCcMkWkN1rZ3n9S6fhqmCIddhpqXCmm7IKUFWBUo
         5Y4RBnpSwjJ+mpT4AY+KTj77hpJXvkKHfbioK2qaaq1nrcC+efFJnn/Lyb4fyC/DJniF
         MUxWYPIIEajhlMfWiHo3ytcIIZWAek1GvnTzJvbFcGvO8fmreFTIm4TMtqL3rquNtN0x
         xUFSOw6yzbIAkHgDEWhdiOr9IWTftePtuqhSWymK8wHpLHTG7y+lFI1QmGuLVebeysuv
         kiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424922; x=1751029722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kLq7ybqs3cS0L36YzYXj0nQxUzd1xncr8lPWgttp7A=;
        b=LkYLAqkzejcnKl2AMlZSQ58/+rEaKUTXkPpC6Fp2Vg9QxM/9F8fqH2SnxfargrV2oM
         tov+s+grIV7+7z6JxRrMkyHSailupZjOZm+UkGrXlcwO1epJUnUQbQ0NHk+1OSRPYALa
         +J6AtofjsE4LucNlhohC0BhnK4HZ5H6jQ8j1TQqwCA0LkgNa91FLeEu+VSHEVw7EvU4s
         hc9Dx92Www3+4ZkEZRJ8zyIWjIjB2RpsA/SXW2Ve83gfQV+DDwaKoeOpNCikGzo/7ARF
         r0JFmiPKX4EjDKEiLNkCPL5G/cs7cNVT3+iTTIlQaT/tsnKwgQbf9RzyZuDfsLlC23dS
         uaYA==
X-Forwarded-Encrypted: i=1; AJvYcCU3mKvG/dIsODBV3Msl4UsDo2dE7f6aJQsSmtKDTQI62IWthaU6DDbLZ5tfxOquMdjyUaCJy5ZHDtw7ig==@linaro.org
X-Gm-Message-State: AOJu0Yw4qhnv1cie6FG48d/gDUUXestHs5pdj+YHS0+W2X7/ko/nKJn2
	x/ULJ53YbZPDgaL4NM+gNX1N9SaR9YeBMauiwusCV7gM6NZMq0UDpohKExjbDsf9OPJeHA==
X-Gm-Gg: ASbGncuJ3XP78jjvelKRWtKsvMQSa5tEo0YuPv9Ywl//wPEPUlqPsu9ave+OZuPH4KK
	Zaj715eMRftO7ltm6WaD2JHleu1WnkB/K9/PIc9+0KkhRjcAf3ar10D12IxmKZ8h9rDTgVnPzt3
	Q8N9xOExu7KioBuXsmgdvAJDqw87G3dsRysU7G9jFz/U4O4uWHyJ8RSGBKJmH9NhCn/tCqTBaW4
	DDGc9wGHH1q4gozBotNx8xjpyJn1NXFg8H5pYfY/lPrRv6cCrXVbYRvHORaDScbK9bYRveYAJ9A
	dytO2tlQoYjw7ftQ1ompi0i/0yTRxfwVyZigxdQAO6xPpZICcoxomKIpZZJfU0ElpMYhDB6PaWk
	wzwpb8ZKkCAyGMZAF7Y7d4WTzy9kn94xEHhri
X-Google-Smtp-Source: AGHT+IHx17Q3o0n4ExJMDEX9nhiRFuD9m/DDwUW/YxBilyeTC3sNUKgmjYDttzl1RvFGqYhxbO7bhQ==
X-Received: by 2002:a05:600c:c4ac:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-453659be428mr24945485e9.5.1750424922099;
        Fri, 20 Jun 2025 06:08:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm24979395e9.22.2025.06.20.06.08.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:41 -0700 (PDT)
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
Subject: [PATCH v2 16/26] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Fri, 20 Jun 2025 15:06:59 +0200
Message-ID: <20250620130709.31073-17-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nQiZ9+F5xRDJ

Implement HVF AccelOpsClass::cpu_target_realize() hook as
empty stubs. Target implementations will come separately.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf.h      | 3 +++
 accel/hvf/hvf-accel-ops.c | 2 ++
 target/arm/hvf/hvf.c      | 5 +++++
 target/i386/hvf/hvf.c     | 5 +++++
 4 files changed, 15 insertions(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index a9a502f0c8f..8c4409a13f1 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -72,6 +72,9 @@ void hvf_arch_update_guest_debug(CPUState *cpu);
  * Return whether the guest supports debugging.
  */
 bool hvf_arch_supports_guest_debug(void);
+
+bool hvf_arch_cpu_realize(CPUState *cpu, Error **errp);
+
 #endif /* COMPILING_PER_TARGET */
 
 #endif
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b38977207d2..b9511103a75 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -588,6 +588,8 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->cpu_target_realize = hvf_arch_cpu_realize;
+
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b932134a833..fd493f45af1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1082,6 +1082,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
     cpus_kick_thread(cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 99e37a33e50..28484496710 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -367,6 +367,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.49.0
