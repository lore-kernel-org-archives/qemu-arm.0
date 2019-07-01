Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004240wru;
        Mon, 1 Jul 2019 12:50:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqya3VMJmq8MTIujTMNb6rAtJDuWj+ni1slb9KEoTMVLhQu81Q8Z3QRFvvulTLkWDo9wa7pK
X-Received: by 2002:aed:3b94:: with SMTP id r20mr21626091qte.207.1562010617675;
        Mon, 01 Jul 2019 12:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010617; cv=none;
        d=google.com; s=arc-20160816;
        b=JDh/j7vVmtyV5VMKZltdnMXf30ye7LJUeiHkVbTwpb3at7qpMpWNzyakg1JgMz/bkX
         YNtqdj2wPABdkgqd8xC3Zh/Un7blIGbSipYAV3Ubv6FNL5lctfHJWgOWGIVPgCVsAnpc
         TYh+971XGbJkIVwbuI0clnrkEXummfQJMlbnVKNw37vhIgjJKNcWNVwyzVI0AOxctNm/
         wmJxZyPIIgPBHa4LZ5iw1fqp45uCwd3rldLtoYnPQ4RCgtjfJYb9I560klW2EK0rFQgZ
         hG1i+nv6UqS4RX+jmOeHAkhfx7Fvp1PkAxby94NpPjJMFzox8VcsZUH7/Mf+7A6tcgi6
         WADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KJYz4NtNnVZD+DSO7X7CuLWOZuDKTzQWS7n8PfcKlk8=;
        b=vlCfpNZP56VwbYn4kciwyiYHEupYKlzzt9Oylqnx7fAz/567Nrid84aGBW+d/5akdl
         q0em+hRFHcMQRavHvLFAn/Iecuy/xHFisbM1j6vkPBkJ17wVG/v/kukV04LbDaJkZHeO
         E9Jpsry+9Of8ffQJiQPukINFwl2FS8WOZbiCnsVa42P2b4qBdZAKlp+vA3EUZlAUyYyo
         Beo+ke4Nz9LaH0p7kQF7NYMrM3ObQ7SAIejN78CKOdhxwJuGQo8i2PtE9qje08Wk4mzi
         iUc38lXXb6mhjPFlwQeDLjt6LcFVItGqnwwGlXBC+zR0el5kRVhiRm+n10xU0wlFXbu2
         BAAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r188si8211277qkb.263.2019.07.01.12.50.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BFAB3162916;
	Mon,  1 Jul 2019 19:50:14 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 344429089;
	Mon,  1 Jul 2019 19:50:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	qemu-arm@nongnu.org,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 4/8] RFC target/arm: Restrict pre-ARMv7 cpus to TCG
Date: Mon,  1 Jul 2019 21:49:38 +0200
Message-Id: <20190701194942.10092-5-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 01 Jul 2019 19:50:14 +0000 (UTC)
X-TUID: DCAfr/SiKZfJ

KVM requires at least a ARMv7 cpu.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ca718fb38f..290ef16e52 100644
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
