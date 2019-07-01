Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2654135wru;
        Mon, 1 Jul 2019 06:27:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrqyHE/31vD7/KbZtI/GDEXjuGGHxSOycZwCd0bIj5mKp+iSigoLsxbhUmIYNY3icBSei7
X-Received: by 2002:a37:8ac3:: with SMTP id m186mr20647064qkd.476.1561987621388;
        Mon, 01 Jul 2019 06:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987621; cv=none;
        d=google.com; s=arc-20160816;
        b=s2K/xVBNsjRTq2kw4GAqI2WUHCc1wAZ9SrDoS8u3FXZhGXeyjpH7zWT7eS6OjK9EW7
         qgqZd1WSu8ifzpvlgWIM1ILHy8kZ+RwPW98yTx+QdKxLbalNHDXYjpMfyZV8Z+DFRxaY
         IT86LXAOo70z8u9yn15ZWib1xNv0MJY9cWlTTziOHeLg5f+NcCrnfrLzpWyp+2z/Fs/n
         /anhMTZqCw2o6Xbo1S0lIu7bCMcSMufOoMiPqX43cLpeIDzg/zwPrGnhegnZLyRJfBeA
         ZpbkTEywQ6Eup+17EFAt070kR0t2+uMGC37guooS+A/cwv20vBrVb3/SXBpq5xRelu4i
         SDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=k/h7XGVbxu/crNXysu88UQhYyVJUNg08JH++hiGfSvI=;
        b=STil1oK4uNftKjpdeRF9c4lyadi9LL5snlswmOfd6LaEH8kYSk0Vm68IOSXp/2JzAS
         cKPbkH7/NzjjvUF67Iqo0rR8tHWJuS/YZ7YHSEc/SP4dlDjp61dBDbsFAaqavP40pkZp
         ZGaeKTpzfc/NagqnNd2TcQZtpr+wdRgR653MkhyxHBU6xwKqBcsbrXsXp/W+FdTbdDCJ
         N/yGNWRJAFnU+liL51lyJxQH6FRzoudTgzAUVgeTDYkxZe3Kd3WtZ5YqOk3hlx6OSviC
         Eat59E3aPnS0Amo9L/hPsQzTR7QjSPR9uZHubusiUyFbEJ9AIDGAwAF0Ai54gpbWjNY6
         l7Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r21si7530406qte.212.2019.07.01.06.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75E7A13A98;
	Mon,  1 Jul 2019 13:27:00 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87F5B6085B;
	Mon,  1 Jul 2019 13:26:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v3 23/27] target/arm: Restrict pre-ARMv7 cpus to TCG
Date: Mon,  1 Jul 2019 15:25:12 +0200
Message-Id: <20190701132516.26392-24-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 01 Jul 2019 13:27:00 +0000 (UTC)
X-TUID: XHTPn1ztW6aG

KVM requires at least a ARMv7 cpu.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 37afb12b2d..d0376f46f7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1643,6 +1643,8 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
+#ifdef CONFIG_TCG
+
 static void arm926_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1853,6 +1855,8 @@ static void cortex_m0_initfn(Object *obj)
     cpu->midr = 0x410cc200;
 }
 
+#endif
+
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -2234,6 +2238,8 @@ static void cortex_a15_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
 
+#ifdef CONFIG_TCG
+
 static void ti925t_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -2402,6 +2408,8 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
+#endif
+
 #ifndef TARGET_AARCH64
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
@@ -2470,6 +2478,7 @@ struct ARMCPUInfo {
 
 static const ARMCPUInfo arm_cpus[] = {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+#ifdef CONFIG_TCG
     { .name = "arm926",      .initfn = arm926_initfn },
     { .name = "arm946",      .initfn = arm946_initfn },
     { .name = "arm1026",     .initfn = arm1026_initfn },
@@ -2482,6 +2491,7 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
+#endif
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
                              .class_init = arm_v7m_class_init },
@@ -2495,6 +2505,7 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
     { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
+#ifdef CONFIG_TCG
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
@@ -2511,6 +2522,7 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
     { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
+#endif
 #ifndef TARGET_AARCH64
     { .name = "max",         .initfn = arm_max_initfn },
 #endif
-- 
2.20.1
