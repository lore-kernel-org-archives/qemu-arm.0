Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp71506dyc;
        Wed, 2 Jul 2025 11:54:20 -0700 (PDT)
X-Received: by 2002:a05:600c:348e:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-454a36e35f0mr48504985e9.9.1751482460154;
        Wed, 02 Jul 2025 11:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751482460; cv=none;
        d=google.com; s=arc-20240605;
        b=Lh0kiWag/s8hju4c/TA8VgJxnZCWVUIq/OSwLOlVXj+XaLfwpn4OWnFHijcW1eRSmI
         Z8EAs7sPwpPqq91zwnoLqbu/vNG7kG5DVG0SqT6VUNaZNnctLhb24wvW5U1BAb0nFCWI
         zmm1qR9rpYokxug0dWHhicTS5fLry1ai5SVzblp1z1AeDuUBDvH49KEHnhP8v9C34Q1J
         iQlfy6DQncorzY50Hs+z/tmOLKJijxsFhXQBMux08l/ZBo1v6TGkmCUN0RutcVSFMD8q
         V0nR2zOuH/Csxcl5E0HL09GMS/r/b2l+rCQ5LUOXFNFoYZyZJbbzUysTaHQk8/RreKhd
         0ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bOy/hh8CdzW8JKLOeQuyvYboWC5TjWykREm1ryjsqd8=;
        fh=b2XjpJ2+IYlxCMiX9mmXPpc/Ga6KDz5ZuwLYZUnkBzI=;
        b=Uy3/eEoTAbfdJY0+E/jdRAAUVPYQbojDnAk3eeshJMDpUSwOa06N8wgFkHDvf/AvEi
         xkujcZVsefnWylLqZex85x0hBNQZoaJT+mOYH6xD4gCZm/xHziTw0UVLPjUIpp7TqIRk
         oGEnqUqfyxvzB09Q/UFy5Vh0YdFr98owP2FukkYl++x2Da83zPyq+ziDOHhJ1pQjKC+C
         pDIqrlt5Ko1n9QbXI8IJKEgqkGDkWFvHOiy3dDF6EwEaOtGNG/v8LbKRg+vHOLVRKKZo
         nndRAondkhdJmEcM+pZ46SDFmE4fvQ9Q2dPV6B9HT5vQt+FIyeTh1b6KHbiDwpqMdMiQ
         fjXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KtJ/iRmt";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453a0c5b0ccsor29598115e9.1.2025.07.02.11.54.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Jul 2025 11:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KtJ/iRmt";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482459; x=1752087259; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOy/hh8CdzW8JKLOeQuyvYboWC5TjWykREm1ryjsqd8=;
        b=KtJ/iRmt1GiEQH+zIigbgJsHeYW7WFCxwQVfx0nSQb6VT8nguKVU5fw1JhrkxhlafV
         qL0vjetD6dxDOEkytsJKg7A7CGliYFzNSptJdQjJBzb7gFUqVY9r/2yg11lCgoKpSkRe
         0OONdpiOYhDjj0+bNuEgp9nabKv2ulc4W2hqYcKexnR/6Lt2baWXTtCnToeGV/KdsrOY
         ixPiuWAbK9RQadsjtm0VwzZGLwgemRGho85U7l/w1tKFhX/WFFyfFC67jG36e9Qqqwi7
         87MptZAsoVdfGj0lAMxobjZjLovDkA46WPxrYSKp01CnOiu2hTTXf/ghdRekb/5UG5cM
         y87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482459; x=1752087259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOy/hh8CdzW8JKLOeQuyvYboWC5TjWykREm1ryjsqd8=;
        b=g/WOigbAh+ay82vteHogXktKPtfBj6BJ+6Cojs+8LcNRKF43h3CFIzzOhIISebW+Pl
         97PJ3wW/oUnnX+lt5ZsD8VXyb43+VDI26ZRMP42Kd/PGqAB6MIH2sz+/sl0cC4GXLK0B
         GYACBuAMcv10YChga+IQw+jbfQfe98LWZeBkaB7SJxSL4W/ebnqxwTkWHDkJTpFe57V2
         XiqdA4XPoft016F96/TR5EmPv2BW0ndYAF+TtCCoLGpaGy2/B0qpzRb/4soY10nlxqDz
         S+H/DstclYUUFA+WIrmlb21dygPcwVVanVDbA+gPZLyhSubGJyiiIJdLMsR/hBUl1s0n
         0z7w==
X-Gm-Message-State: AOJu0Yyn3LjuTk64XKbeWfx3opVdYRD4QpcWbyFvD9+K1TqGoma0HVOB
	dmxD4imzBCqJPleKkUh2eHvdA4CebySuIJFQmBUZGYMTHRybzF4yWesypE+/PNuPsRgNlQ==
X-Gm-Gg: ASbGncskAJgWyysDY1QBi82db6A5svKaVczOST29BFIsXtDy24TRuBVczqO9R51ZXH4
	ofV8OZv0bw0baQpsuArVcECpkkWW1UUUvO/IWkM3iz+UqPtefSXPlrMJUs/J48RGLd9A2Sje92u
	7dH0Oi5x2zkITRy01PI6qMWTd/++qJI13SZvkfSYBedGrKJNHvsf0Gt+9DWTs9D+T6nUgMkYTIv
	47PwBQmEm7Wi0cTc8giHS/NDsqFKXuYq/pUw74VeJW4Lftn0wq7FP6JIMdN4rkzZN3zRsJnKP/i
	cdeQjenClptd0BdLf0YITKoKthays8jX3iOnOEkP7KMAuM6qb2LQB9ByAZifaWRfyQDxwHmA1Xp
	a9UVgkeyEwZFtVB4mX2gHNrwehnogn181SFwB
X-Google-Smtp-Source: AGHT+IEgLL7L+r+iZgsRNi8i+FxvbIr5PVnGC8TUcln6/EmVy2Fl0Q34xbpV9etgWh6AfecbWbg6LQ==
X-Received: by 2002:a05:600c:348e:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-454a36e35f0mr48504795e9.9.1751482459480;
        Wed, 02 Jul 2025 11:54:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b35309casm35763075e9.1.2025.07.02.11.54.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 11:54:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v4 06/65] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Wed,  2 Jul 2025 20:52:28 +0200
Message-ID: <20250702185332.43650-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: d+rUz+3wzPvM

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
