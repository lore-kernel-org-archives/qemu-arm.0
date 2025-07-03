Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp449010dyc;
        Thu, 3 Jul 2025 03:56:20 -0700 (PDT)
X-Received: by 2002:a05:600c:c4ab:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-454a3728b01mr57950145e9.26.1751540179905;
        Thu, 03 Jul 2025 03:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751540179; cv=none;
        d=google.com; s=arc-20240605;
        b=E30RD8QFU31LeTJIpQNqlo4kAn2/Y/Dj3ThzqtGM1BOV1qWydNMiqKCzT9gWIlzGFG
         Q04Xy1rLbQSiZdK6ci97MYNSOLrHKVhlrAxMj7bEc4uGJikbaLBAo1CY6N9vEeHZzyRZ
         965xQe0NacgxCyfkXDEr7ilwy9iuAFFffSzaPWQgHC2KkkDCZrwaBgpbuQw2bJX9VYvg
         kSxKokE+0lyN6RTCffgU07wa7gOMmjJ3xSt2FbdHEggLqlKGGxG9p0JmbQ0QTOWREpxy
         X5qKPfnzUjmplPGcw4w97RpHH2q2vrfLE/1OJbOcuhgFm4sMU+Q7yjQQQnUTZcZpQFdh
         XE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bOy/hh8CdzW8JKLOeQuyvYboWC5TjWykREm1ryjsqd8=;
        fh=uJ3dFTbL6U4oY1jR+3e9dBFvfZBH369kHbvQi/mdha8=;
        b=Zen84r1HAbdDEmDGxkBOyXGMkmPWt3DzZ3KtrFkVWyUbppU/5Y3K2g4Lb/0rhP0b9r
         8Uu3eV27rGmD5Yx5WSjs545RtB5xftY44aBQpzQ3zH+NdiaSBhToJbdfHzfjVI4FWIQd
         cpSRhjbEOf11r1P7ImFgMAygYx4PspZIjH+ISOFEhzlOJlR5dcE8sfmeOOYlZmUzeZqN
         F8p7NMX6xpdVZvQIWQwU0BQT2lP0jAr+QUeiHqlJzVd0mf1cObz2IXh73ufwOwoDW94P
         /qC0w4w5ruv+AfpPU7fkY9uWsOKzfnzG0VRTOIVLAvtq8FfzCAQVGHDE9FbDgKrheYiW
         MAMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PkLp3K5s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a428c9fsor58300495e9.11.2025.07.03.03.56.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 03:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PkLp3K5s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540179; x=1752144979; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOy/hh8CdzW8JKLOeQuyvYboWC5TjWykREm1ryjsqd8=;
        b=PkLp3K5sCggdAZPO66HtXHb1BUe0mdKJxhwtqGxhTTTtisKmw4kt7SNcAp91KSCo89
         SWWIFqAbbEy5EWvtz7+ZWxAM5ibIfE3Ki5P5jzaPI9kT7NFeggYzBn83Y5w6Dqz4wJhv
         A/qTOTmpgg7MULo2trtlNCc5DToc4+sSv7HtmPp4ifJuOOOBFuE0jsVz9F8GiJ8PGbRP
         oAIh494kZAjRvpRu2mBeQxX1nTB4B5l6snZn2eodcv7dzXI0C2gd0GVHpSKaNjAUBGer
         LTmB5ukxwgOdAs2BnBfmiyurbQATDZnvdczFSFdbugGgiaKPARiPxKZF8RLVRX71bU+4
         PiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540179; x=1752144979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOy/hh8CdzW8JKLOeQuyvYboWC5TjWykREm1ryjsqd8=;
        b=Z01UpqFAI9fpWYjds2pyoRV5DzR1xOVg7yrMrX9AohEY6yC3rPXaHic7qwGli0usKb
         xE0pMPeTwd6L1qYvvNrWPo6B21kP1lBLp8rbZIHfY/UCsqoNAilZeKvbIXM9LFYcVUKg
         prs8VqURFADggtTPopVAvjEdbBIQFi7sRF/ZqNzEuSdrzbq66K8l2hiF/W5+cGKbiM17
         gLTA+PyYLt30zIJkWQYGuydEkXlegPdMG0eKeEyuQ756H8IoByRZFJbTr0q+9VQGYQMt
         meJyCXukBJX3f1e58UlV1I2YfUhQ+Uuq8vA2GVkuD5cCfvHjqiH/zyV+7ljZ7Lw1gZfy
         386A==
X-Gm-Message-State: AOJu0YzWtMurx7AiVqnEWEFSBc7D2Y3911v9GxTkYZ9TluehPrN3pKHO
	UnyiHKfI9kKPk+KA0sAs48muMgYbU9l+gU9IQxlI44ibwKNu00wV05NP24mfVK+ra/pZEg==
X-Gm-Gg: ASbGncs/wBVKbzzON/alKttyv5OGs4Su8K8Qj8O7m1XCD+s4gX1xtqOnlEV1ur45bI4
	26A45Jkyfjpa+jqdlc4AQfQZQ3PxMhaCi943QBUi506qDPVyQlOpf3Z30UnigOtJP1tysFXuXZK
	J/KP38PeCJbHiJ/lkVWOCJE0FmsAnabwwwi962LkblPK4PwxhUN4Ml8RQF0V3kIcNBIJn2QNidR
	tkRyUgzIyAU7BolCwupkdfMjPEQdr2qt77G9qZGLPI5/hVgUcg6uc6TtwV1Dnf08bUdlRSvQNdJ
	ZjxyVQLyhQOjkjqg1N33Mvc2eHq8qlr1KeiCwzmmt4ynWrjlH7Ojzz8J7hpy0Vn6MdsziHP3npo
	3F3oNrhg4ZrA=
X-Google-Smtp-Source: AGHT+IG7ipjun04dtTdCOm6oy7eUWWjsKtRV5HObOuItyYoks+uXkUq2AKmszEHPvw4ntsxZJLkEbg==
X-Received: by 2002:a05:6000:2c0b:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3b1fe5bf382mr5188202f8f.4.1751540179252;
        Thu, 03 Jul 2025 03:56:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([83.247.137.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e595d1sm18529515f8f.71.2025.07.03.03.56.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 03:56:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 07/69] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Thu,  3 Jul 2025 12:54:33 +0200
Message-ID: <20250703105540.67664-8-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: G55O/QcuNucf

Implement HVF AccelOpsClass::cpu_target_realize() hook as
empty stubs. Target implementations will come separately.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 7b6d291e79c..4c4d21e38cd 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1081,6 +1081,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
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
