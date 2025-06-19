Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253163njc;
        Thu, 19 Jun 2025 06:14:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX52/RZI0FqvxVkLxwRa/7Dw83xKpzXHYJiTgnc2YDPcCzeyFEJWe8jkQUHzBjwFFo4K5JR7QeisbJ8/A==@linaro.org
X-Received: by 2002:a05:6000:26cc:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3a57237d963mr16638306f8f.24.1750338877573;
        Thu, 19 Jun 2025 06:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338877; cv=none;
        d=google.com; s=arc-20240605;
        b=hT+IQEv0bz6L++nbu83r6+i5FOL2U3jBuBvo1ovjyOY+xsw4uW2kESwEDhsb6YZ5w/
         rwDdWkzRZLtHA2QjhSyxbJuqCjqBHKNDpQfyD1TUxQGKe2e4zFLqXVif1Qdxp6K/CMk7
         czrT6YZZGapCkzzaWaAfgyn7iHIfZFb1gC64Qc8xS3a2AKqWAUbZjeoBZexM9vQuPcfq
         ntBUcYa1BuRp29QZwNodO/OXClHHHhMShgAwRlcMFwHZjkELI+B5XnwXzx9ysZO8n3ou
         ad2RRoN8oeWGWxzsZNEAOpNwkOvFZP4mHLfi2188yYnONEGUDbt+yIr/cy9lReOz1ANz
         4aSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vBwegXGmW2xI9QNEHAmJjIKzsQveZBksCJkfDcZvi14=;
        fh=4gyyHNaW5QdDInz+5ykGICePb39pfMlG0klt+SugyOQ=;
        b=PXgDx90VIf0eSc2FN4qpPAcMqLTy8UOkiL7dMOJql+fvzAsMsiNVhL2+l1Sxkzo/Vn
         sUkDuxF+MQTNpcnQEZjxY5ZcDM7Jzs+wFZggaMFaTrB+BIVs5KBFjVfVVpglOTnYzQm+
         wtz1ON3pjWRNVMgI1RAVW9elED93chumSB4goNV/vD84Wv4RPrx+oUukkKDFpF1fPfn/
         if3mNor7UvagU4toQhRLI6SFWfC0k3uASZt2rLn51lhxSWeX0hC1GLdhYvZre+IeIRGD
         zEdhCb2HXqLk4DpzuMK0QW3hPAw5yB8B6ARdMba7JLYU+xG0gUzpqYneiXvV3L7y0dU1
         YqqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CoCPgCIS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5618d51e0sor4840961f8f.0.2025.06.19.06.14.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CoCPgCIS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338877; x=1750943677; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBwegXGmW2xI9QNEHAmJjIKzsQveZBksCJkfDcZvi14=;
        b=CoCPgCIS6+8P8j33r8F0Ev0Tem/Htz6G7kXOpRBZAvK8XVk2jIXCgSTUnF02wsZebN
         kP/DE/h+QCIT6fqNW4yun4aM2Qzslb+luqUOxmhMtnZakQoW+XaD8R09yOcNnnAN1rAw
         REcv7j5DII9818o0FntYeHyLjdyMDnT4Ddj/A57AkNZ3ApEdwU2gN0KRJFDG+dqXFHLF
         nxa/pwz4D/tG7h6pXe7NPzXVNnoXXtmgYfVG0Aj29wIMCkManIFdvyoeI2zIa+HNJNoL
         7PhEONyg2SMe5XjW2GFH3HikBTRgTRSkP4AuynRMy/q3K0W/T7tTj1ctRDLISTh5SXzO
         OgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338877; x=1750943677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBwegXGmW2xI9QNEHAmJjIKzsQveZBksCJkfDcZvi14=;
        b=Ktcy0XC7qYl9ytAQqYigzOgfOTgAU2jrJd5ciB5Ew5y11FTdP5lJUfSVG2d0kZmKiV
         aFzkQjpKO3h6qjQ3UgWroXbiMVHLZJNryHeMiR51wHCG9gqyHeea4CYaTyl2T84u31gl
         Yr+gPFuc4oNAKrvDViqXxJnV3sR4JmoJSm1QU9mesj5ulSJbWqRArsjj0Q2xCP9hhYmn
         pc0F21z4i4U2P9rLHSlKBnffR5r0dJLYkLFpzUxUYGKWeigGFSxwpq7M6Em9tNKyO3OJ
         oru1WNa92LNglGmuYT0xzGG8GYmYA60cQ2kFfQnOvx9uync7+vwNXCqJkfwG7uVB2T+5
         cvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9n063oT+U3iCslabQRckjuq0ymojz0RpGBmqZGwp2DVIkUvVauxoqlpBFW2B7DGUWgE3shsS+ZQZwTw==@linaro.org
X-Gm-Message-State: AOJu0YxErBaeUG4dE1ef136ZlPGci6TxHWLa0ckKjBKRdYFEAWysWglX
	QCoKswuMrdr4PkHGlNBcA5A0iWZ7FyWtLm4WYR9dkADxghzuSvmMSToOVrkAYqWbFGrfMQ==
X-Gm-Gg: ASbGncvndhmpx45Uy6efov9JwrUnS6QKs1H/PmKm8Rz1d7kMITA2SrnmY0LtLQBTT6D
	LSnzoc4RddDCL8JYt+ich5E4Iw37oKYZIkDUvt8OZ76aBnMWQFpyRrergrzuIWfeF7NFTbXfpjQ
	7wx4wxPm9/kgQEX9QMJDqV9OlsNt3LNW/oLmReqmS6D0XN+yoyBNptiw2kOnBwJeDGfVo4O9/KA
	NR/nEeTvE6H6WKtHHVirV0Z49WZGHM/emyqqxXYY5yMDDuzihNOoPF5UrABELqYie8idZbOe251
	SgutLI5RewGzjwR9jQLPiL2MPKcKd6GsqvGldI15Ihiz+sNsjgI5X22LYSlpTRzpH2kOYzrmiIf
	KBy9PX0NiUICtvoqWMqaRJFAY/ld6NS9ZTxv5
X-Google-Smtp-Source: AGHT+IGphVnwIkNy8mgxx1bMSCUP1PYKYP3HE8EUL+SUsHxrYE2Vhs26H5k6O4fJy9ktfqkBuAu1MA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a5723a2dafmr16025163f8f.29.1750338876992;
        Thu, 19 Jun 2025 06:14:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b7741bsm19777232f8f.98.2025.06.19.06.14.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:36 -0700 (PDT)
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
Subject: [PATCH 14/20] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Thu, 19 Jun 2025 15:13:13 +0200
Message-ID: <20250619131319.47301-15-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7WMp0A/KiuEz

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
index 1fbfdaed59f..632751d1eab 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1078,6 +1078,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
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
