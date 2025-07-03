Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp697199dyc;
        Thu, 3 Jul 2025 10:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEA6tz5Wg7/+DoL/EPUIyTjk1isABAMczvK+re7meNDF+6hs2PCw5TZdWJ8kCqfkNdv8esJqgKIrIM7w==@linaro.org
X-Received: by 2002:a05:600c:a31a:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-454a9c9e693mr44857025e9.17.1751564066557;
        Thu, 03 Jul 2025 10:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751564066; cv=none;
        d=google.com; s=arc-20240605;
        b=Fq4L2HJxcypuSUZxvdsuDfBrDCbH7VvmuAAyYujjf1l6ORRklFQuRuD5/76rOIJ9Zz
         WYprgZhoMXaK5hekuH/McNjGXgNfSZeJ5J9D4CkJwR5YBzPDImjGqpCFBnA/uqoFoDlN
         HW40BfOxzwnyQHGOdYWQVLwCqfRyTDomGIEfCvpwbBFJ33LuycqfID28BujwPYUL3I/N
         of/KZEBfKDZYtKPbs6A9MdnKmxb57XwBQHL+YPQgibK0JYDgmmaqrtCLHWQ8GVa1N3dh
         vgCefodlLBlG7eMW4VmKMKQf1Vn4wJNkt2DSC6cZkgpxpF0/DrCoa3jmCddf4SUuZHr/
         T2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L0qV/fhVJIjz1bwc8Z/fAa3vtgS6Ly+7flgKH+q/xGQ=;
        fh=eqB1IvGzQpk82nVUyjjgE7hGpQ/PU44vb3hLeiIV2vw=;
        b=K4OtT1omAzAt3suveNuwYx6FsTxdc1iB2VN12kUFdVB3q6BIrBxeKseUXE/H8kfo4x
         p4B5M3KxLREZ3AF8ywyR1sDkdCfIy0VyF9nMQ13xsXAvkXK82+alLTzr0NEp2rxeZMoW
         ppqPoPMwT8mO30uSmT6ITLZuhCKnqijVJg0BGjeO0SThFZETT2rO+XjwRI7SdZ4Uug7T
         DYwBZQCNKlK2bbeerCB7kYdg4aagKtyfpnMB9jfgQYFqsg8+bZCwRjwjDAf1t4gJVYf0
         SZOGO42OYpx7yoHCf7RU+XISizAJSg6rz1LKLPpTkwPuLeRrmKcV3NN2JZMWWgAv7X+s
         LARw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Un7Upfra;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-454b18a3fd5sor1024015e9.11.2025.07.03.10.34.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 10:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Un7Upfra;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564066; x=1752168866; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0qV/fhVJIjz1bwc8Z/fAa3vtgS6Ly+7flgKH+q/xGQ=;
        b=Un7Upfrab3lanM+0oRcj21jX2stbCmIEL0+OROTeFivDFVscUVw+TLrma2vLb8EdRM
         rua4NGpBWpVxrvYqsmJEYzKwbx5Mem4YEVOSYoSS104voyBBEiwpXZXOgODmSxXj4Qg8
         yBO7lJgnLgQtNN1ic5NhyUcpcE/LfNd4/B3THcR6sNY0ASE1rYtj+PykpoYImcxjTMC4
         3fGMw2Y/etCl4dE9dq3zSpX1DkcpU3e4yoUZh507/KnQzxY/qq8YjRnG10OONiOja/Cl
         ADlU3VlLh26Hoo/wuoM9GQHzysQE82T/JV8MHMOQCgpsSSSEqgu8NwYmk1gT0qKRpXsp
         K4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564066; x=1752168866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0qV/fhVJIjz1bwc8Z/fAa3vtgS6Ly+7flgKH+q/xGQ=;
        b=dnLtI3bbfTTVRw74fbeK9/PqejJenhVJun2Jl5oPGp99lXdO0TPPnIkAHUG5UJnyoR
         FJhAsryaNTF+J88DpH9C3AsaHLJ5BhM95zYnA1jUrTHRPh+06M89fkboxH5EPQ3k0XPB
         xi3oQGHBlDNLgKw6dmK1WBokXqIPw5A29a78BZBMc/IQfnx20ImxxYrg2QFzJOD9oItU
         uNiGjwgG3P8k6Ml8M1vlo0qGodchHsQmqc8N3Q83L81phhLnIIK/39Gx6c/Y/TNAMLGG
         IuAUiKmjO/KH2VGNSF2H7dycE/f5sjZeniEnRpKlCDPGNu/RnilE7QdvjSR5pRROaWO3
         YPcw==
X-Forwarded-Encrypted: i=1; AJvYcCXrYzTxUxcRE35gg4dvQBeoPl27zyyby2j8IshxIUymIgazCmzW4dbKKCOXS8bfn9Zh2EY2ZDPId/opOw==@linaro.org
X-Gm-Message-State: AOJu0YxJj2fggIh5o774DLh5g7443pFM5DtT5MY6mHQuKAat+ikff2qh
	g7pVaCL5T9kF352E7MaG7HJBpSQb6AS6jPj7UgAdPgj4XC/WPTIwwSxtM6+J7igO9yoQRw==
X-Gm-Gg: ASbGnctO77paWwXE7pl+t/SFtmLrXCDFwUkeJ4DxlV+dWbGFvugWvyuxe4+3dsL8xeE
	HZ8CqIwjnoih+MAPrbioM5jm7urHg2jxsCwYdbonYrE0/atOdTSUWAxMR/WlnHAkeVAZWGyR4t9
	6KFa/BKkUpVef7P4yBfNujvGNw1DeWjnS2TghIz2Yzp7+uA+4O+B4ePOtgQ2Owe6Fvu1YX60z6y
	X1hD8vm609QIPV4zcvjc2a9jGv4LblbAxj2HCd96QYIBo5Ql5LzTBlgmp4wVXVRpo5OLZgzgCFi
	hiMr6cFriH+PfLgkG7EshUDEaDV/7mEGPCOXRrxg2/lNT6C6TZi11P+40S9SVMiSRXOBW/sXQxR
	Lwb9RinEayxZAhotwIcOLE26dGdvq9NSwmLlb
X-Google-Smtp-Source: AGHT+IHcIHY9lMMNmkvv5V+f3SofuDuAff/K4Ge3x+w//CdiWmivy2xE9xv/5wuK0iKf5DJ+gBSq/A==
X-Received: by 2002:a05:600c:3509:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-454a9c6fe94mr55040495e9.12.1751564065841;
        Thu, 03 Jul 2025 10:34:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997b1ecsm32801235e9.11.2025.07.03.10.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 10:34:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v6 18/39] accel/hvf: Replace @dirty field by generic CPUState::vcpu_dirty field
Date: Thu,  3 Jul 2025 19:32:24 +0200
Message-ID: <20250703173248.44995-19-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Sfh7ktJKHzq3

No need for accel-specific @dirty field when we have
a generic one in CPUState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/hvf_int.h  |  1 -
 accel/hvf/hvf-accel-ops.c | 10 +++++-----
 target/arm/hvf/hvf.c      |  4 ++--
 target/i386/hvf/hvf.c     |  4 ++--
 target/i386/hvf/x86hvf.c  |  2 +-
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index dcf06f53d97..ecc49a309cf 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -62,7 +62,6 @@ struct AccelCPUState {
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
     bool guest_debug_enabled;
-    bool dirty;
 };
 
 void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 6b1a256deb5..2944e350ca9 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -79,15 +79,15 @@ hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 
 static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
-    if (!cpu->accel->dirty) {
+    if (!cpu->vcpu_dirty) {
         hvf_get_registers(cpu);
-        cpu->accel->dirty = true;
+        cpu->vcpu_dirty = true;
     }
 }
 
 static void hvf_cpu_synchronize_state(CPUState *cpu)
 {
-    if (!cpu->accel->dirty) {
+    if (!cpu->vcpu_dirty) {
         run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
     }
 }
@@ -96,7 +96,7 @@ static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
                                              run_on_cpu_data arg)
 {
     /* QEMU state is the reference, push it to HVF now and on next entry */
-    cpu->accel->dirty = true;
+    cpu->vcpu_dirty = true;
 }
 
 static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
@@ -150,8 +150,8 @@ static int hvf_init_vcpu(CPUState *cpu)
 #else
     r = hv_vcpu_create(&cpu->accel->fd, HV_VCPU_DEFAULT);
 #endif
-    cpu->accel->dirty = true;
     assert_hvf_ok(r);
+    cpu->vcpu_dirty = true;
 
     cpu->accel->guest_debug_enabled = false;
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 995a6a74b06..ac0d6ef8187 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -813,9 +813,9 @@ int hvf_put_registers(CPUState *cpu)
 
 static void flush_cpu_state(CPUState *cpu)
 {
-    if (cpu->accel->dirty) {
+    if (cpu->vcpu_dirty) {
         hvf_put_registers(cpu);
-        cpu->accel->dirty = false;
+        cpu->vcpu_dirty = false;
     }
 }
 
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index b25bff0df41..9b8acd5a946 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -733,9 +733,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     }
 
     do {
-        if (cpu->accel->dirty) {
+        if (cpu->vcpu_dirty) {
             hvf_put_registers(cpu);
-            cpu->accel->dirty = false;
+            cpu->vcpu_dirty = false;
         }
 
         if (hvf_inject_interrupts(cpu)) {
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 2057314892a..17fce1d3cdd 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -427,7 +427,7 @@ int hvf_process_events(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-    if (!cs->accel->dirty) {
+    if (!cs->vcpu_dirty) {
         /* light weight sync for CPU_INTERRUPT_HARD and IF_MASK */
         env->eflags = rreg(cs->accel->fd, HV_X86_RFLAGS);
     }
-- 
2.49.0
