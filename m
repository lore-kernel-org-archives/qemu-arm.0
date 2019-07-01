Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2654211wru;
        Mon, 1 Jul 2019 06:27:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyPzp0CUPbnUQ2a81ynpXCK/g4IoAvKWs59Ltqc9IdFGyTIDknKx1ORtZ/UZsmJRpAEXjw
X-Received: by 2002:a05:620a:142:: with SMTP id e2mr20295881qkn.191.1561987627668;
        Mon, 01 Jul 2019 06:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987627; cv=none;
        d=google.com; s=arc-20160816;
        b=a53lDHp/zIRzm8z3R3SgmaNfnneXmBOb2NlLlDYRAo2KvbANEgEgtf/7a3ufvl0qLk
         7K4kpKzBH2qBDEvfaXbQPneVGra6dvRJqI18Edq7bARQSoPUTMeOFNVYz22/nJ08Z6WZ
         l6oAKbhZ18JpdhyOvOclVpPSTwZYB9JhG3+K3lsUxMGegoItVPzE+ClyjvBl2g+tEU/J
         BOohXmrGWLbwFJoccRWpdx3vlXyThrhO2fMPohzQ+n1xXUl9w3W1m3Y5ln4nbkod/vcW
         V/o0kTVJasAailVOqEmKxYnD/0+0byOrrz3gE0j+Uz9LiHRGSbyxKKdeotehuNtBB3+r
         HDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DzRjZhK4j32J7EO0cdxsaT47hdRkLP0ADl7BestTqlY=;
        b=bpBXtkMvEmJUIy3uJ6VWZZIesvgZTNMbUxXm7foCNzQMnRf3YFejimfZwQ68ev3Jni
         ljAr+V7+Jr+DfYGJSMU/aeDVdfuIZrSOvbfeV0ItZmGNf84gW+gjGA6FDhMZ7QpTtcL4
         KfnBfUlUdganRJeSXjrG3f8ohoarxUlcd38R5gX0PsHTrbwehyQa+L7uaiON3Glg/ZsV
         UoPyHmVrtVSS/+oG5/YnFekwv5w6V5RYCV4o05b0070+JPpzA+VP0SL/oB0w4i+h5Sze
         yD4bNPq/IvYDj2ocljv03XOgOLA715BtfgRrNcCLpilTTt17ZnB3Yt9NdYfwAnhaIuMz
         BySA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j16si7686042qkg.311.2019.07.01.06.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4CC630C5827;
	Mon,  1 Jul 2019 13:27:06 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B1F46085B;
	Mon,  1 Jul 2019 13:27:03 +0000 (UTC)
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
Subject: [RFC PATCH v3 25/27] target/arm: Restrict R and M profiles to TCG
Date: Mon,  1 Jul 2019 15:25:14 +0200
Message-Id: <20190701132516.26392-26-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 01 Jul 2019 13:27:06 +0000 (UTC)
X-TUID: c+RyIXSNqTGt

KVM is only able to run A profile cpus.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d0376f46f7..b21d0fb891 100644
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
