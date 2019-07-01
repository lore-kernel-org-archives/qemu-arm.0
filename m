Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004323wru;
        Mon, 1 Jul 2019 12:50:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwveihJbGSBOSjZ/biNVAlBMdd2metmyVl9ANaD97DfO8eW1VaVD0nHk6nCSQSPi/Qq43eu
X-Received: by 2002:a0c:ba2c:: with SMTP id w44mr22970264qvf.62.1562010621907;
        Mon, 01 Jul 2019 12:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010621; cv=none;
        d=google.com; s=arc-20160816;
        b=gpgnPFAsZw6UW8ChFR3GnlWxJPCYAT/f5zWgE73DwB8nfcvI3Oqv4HcivuFsAo/3u1
         /7lbwrVXVUxxWJ65OCbsCdbRuYZOpvehulE4YrNIDW9N1oJcJPPO7oEcFVfrXEk5+Ab+
         oQP1lMKwJ9m9ve0grAMoYuTbuJuSEhN9vdAC+BCHGLVBeB0lW7t5fSrsEq7LDoF5df6L
         0q/vo5lM54carzrhFJRH9isJ6pwgzvNSQ3HnlkkZrpl3wI9sc3bZf8CSgT7ZAA7VXrrj
         /zs71XFUCzGbo11X1gKUyiPeidvd0lG0Vz/fRz5OdYAHyMMDJZMWSnH+PICTBob6Oty0
         GAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=yPxhy3475N3a9pgS829/W3UHzOMEMxnlqtA9fAkI7tM=;
        b=CK19Pc5Od/he0hG+HcS5SII+FkUrVC7CNLwgw8PxFWR1cz4dWMLlgYVGEAsjYWx+v9
         09jUPpF6MrDbUyhtKx+HI+4fhkJo4k05hRIv9NreLp3Dhvkt1uHbe9RgPbYm537/dtSk
         5xYhBgT4ArOPwBsR8r9KBNK/IyBKoEe6yOHYEULuKztV38oHeGGw1b5wXiecSSE3L+gL
         J9ZJh//ffinSHh2Rl6k0yIB1dqpHwah+WnBNao0w67iKPPOWc1MKQX1h7j4V29FZ5rbn
         qqC3VuQ/+VT4d9e5NBCr2nUA+wS4GNR7GD1PdhMfUKIoFhkUVWLUTR4bnjiyiRSLjLrR
         9UaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 52si8112778qto.14.2019.07.01.12.50.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F18630BBE98;
	Mon,  1 Jul 2019 19:50:21 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B6CF379F;
	Mon,  1 Jul 2019 19:50:17 +0000 (UTC)
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
Subject: [PATCH v4 6/8] RFC target/arm: Restrict R and M profiles to TCG
Date: Mon,  1 Jul 2019 21:49:40 +0200
Message-Id: <20190701194942.10092-7-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 01 Jul 2019 19:50:21 +0000 (UTC)
X-TUID: 2ZDI50evIagw

KVM is only able to run A profile cpus.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 290ef16e52..a0934a47ee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -453,7 +453,9 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return ret;
 }
 
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+/* CPU models. These are not needed for the AArch64 linux-user build. */
+#if (!defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)) \
+    && defined(CONFIG_TCG)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -1855,8 +1857,6 @@ static void cortex_m0_initfn(Object *obj)
     cpu->midr = 0x410cc200;
 }
 
-#endif
-
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -2010,6 +2010,8 @@ static void cortex_r5f_initfn(Object *obj)
     cpu->isar.mvfr1 = 0x00000011;
 }
 
+#endif
+
 static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
     { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -2491,7 +2493,6 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
-#endif
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
                              .class_init = arm_v7m_class_init },
@@ -2501,6 +2502,7 @@ static const ARMCPUInfo arm_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
+#endif
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-- 
2.20.1
