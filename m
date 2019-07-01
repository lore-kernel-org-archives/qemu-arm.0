Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653967wru;
        Mon, 1 Jul 2019 06:26:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG+V7XaRx+agr6BMQ22LgbV+FANYGQZ4lKMwGFqcw47wwydTKZLuqly0mTmCWUOcKmCpbX
X-Received: by 2002:a0c:b012:: with SMTP id k18mr21820854qvc.74.1561987608329;
        Mon, 01 Jul 2019 06:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987608; cv=none;
        d=google.com; s=arc-20160816;
        b=Mq6qUaUAgw3fNCy0aqUY7Kv1sfcDBeSNgcezAXpMwFqaPTi/WoFf+kbvNpK+2ScXGP
         cwWTgRBnvaitvJCViZZfuxIbgQ8/UzrrpPswA8m0ZmLjjC2O4AJftP9C8R7+CqZ4d1db
         Ec20xav2KvMfugiQPKJOrfQBCmrDKMaRVV90pVRGsgNZcYg0Ev9yXUS3wiE6kp3lJfeB
         /nzTMO7q3RTDK0eB1AT/cZ6Mh2Y8qrnqC+NYV+xMSSijiVXTVFv8ZdbkH8o8/a4cs/6W
         h89D/LKbuwkGKGl/h4wAiweqjqdz+opvt9OKuaQXkTYiiDscqyf4o7q1uDN98W6j22Kc
         uVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=K9h3Hf1IL/5IHgkdCPcexiB4PDGAnx2ubjnrEiCdi4I=;
        b=oIE58wsmCPlXkosdfsCsU6kaT+YW612/6Bit/lgTARj1dc5mSxMJKvO8ZKWIUYK7IK
         6vHgFzu0VhLC2zDkhgY7CLSdxtQE6HwqjFdF87ztHQtraQI/q7oTNNxJ310ECkZ0qOLP
         CpB2QpiLO41R1SPWMFynuRWOUzitvaLSBFDvwBF7zVq+JpIwB8Ts51mCM40pyxJRHmHA
         CvVv+GnGjgui9RChsLZkUNrekiPXKd10sO3p3BvfcovOMhPLpND4ffm/NUVwUxEp3DfA
         TaF+R/ah73sTyoWaerfgmBfKkiuEowjT9h+al0jSVdqt6uGS6ITHMxhDRn0AQeA/aScy
         TThg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o6si6985498qkf.49.2019.07.01.06.26.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AF6787620;
	Mon,  1 Jul 2019 13:26:47 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFBFA6085B;
	Mon,  1 Jul 2019 13:26:44 +0000 (UTC)
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
Subject: [PATCH v3 20/27] target/arm: Declare arm_log_exception() function publicly
Date: Mon,  1 Jul 2019 15:25:09 +0200
Message-Id: <20190701132516.26392-21-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 01 Jul 2019 13:26:47 +0000 (UTC)
X-TUID: 4bIq9QMT/6Ll

In few commits we will split the M-profile functions from this
file, and this function will also be called in the new file.
Declare it in the "internals.h" header.
Since it is in the middle of a block of M profile functions,
move it previous to this block to ease the later refactor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c    | 76 +++++++++++++++++++++---------------------
 target/arm/internals.h |  2 ++
 2 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1b4da7aa45..515a82af57 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7697,6 +7697,44 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
+void arm_log_exception(int idx)
+{
+    if (qemu_loglevel_mask(CPU_LOG_INT)) {
+        const char *exc = NULL;
+        static const char * const excnames[] = {
+            [EXCP_UDEF] = "Undefined Instruction",
+            [EXCP_SWI] = "SVC",
+            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
+            [EXCP_DATA_ABORT] = "Data Abort",
+            [EXCP_IRQ] = "IRQ",
+            [EXCP_FIQ] = "FIQ",
+            [EXCP_BKPT] = "Breakpoint",
+            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
+            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
+            [EXCP_HVC] = "Hypervisor Call",
+            [EXCP_HYP_TRAP] = "Hypervisor Trap",
+            [EXCP_SMC] = "Secure Monitor Call",
+            [EXCP_VIRQ] = "Virtual IRQ",
+            [EXCP_VFIQ] = "Virtual FIQ",
+            [EXCP_SEMIHOST] = "Semihosting call",
+            [EXCP_NOCP] = "v7M NOCP UsageFault",
+            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
+            [EXCP_STKOF] = "v8M STKOF UsageFault",
+            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
+            [EXCP_LSERR] = "v8M LSERR UsageFault",
+            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
+        };
+
+        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
+            exc = excnames[idx];
+        }
+        if (!exc) {
+            exc = "unknown";
+        }
+        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
+    }
+}
+
 /*
  * Return true if the v7M CPACR permits access to the FPU for the specified
  * security state and privilege level.
@@ -9436,44 +9474,6 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     return true;
 }
 
-static void arm_log_exception(int idx)
-{
-    if (qemu_loglevel_mask(CPU_LOG_INT)) {
-        const char *exc = NULL;
-        static const char * const excnames[] = {
-            [EXCP_UDEF] = "Undefined Instruction",
-            [EXCP_SWI] = "SVC",
-            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
-            [EXCP_DATA_ABORT] = "Data Abort",
-            [EXCP_IRQ] = "IRQ",
-            [EXCP_FIQ] = "FIQ",
-            [EXCP_BKPT] = "Breakpoint",
-            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
-            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
-            [EXCP_HVC] = "Hypervisor Call",
-            [EXCP_HYP_TRAP] = "Hypervisor Trap",
-            [EXCP_SMC] = "Secure Monitor Call",
-            [EXCP_VIRQ] = "Virtual IRQ",
-            [EXCP_VFIQ] = "Virtual FIQ",
-            [EXCP_SEMIHOST] = "Semihosting call",
-            [EXCP_NOCP] = "v7M NOCP UsageFault",
-            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
-            [EXCP_STKOF] = "v8M STKOF UsageFault",
-            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
-            [EXCP_LSERR] = "v8M LSERR UsageFault",
-            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
-        };
-
-        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
-            exc = excnames[idx];
-        }
-        if (!exc) {
-            exc = "unknown";
-        }
-        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
-    }
-}
-
 static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
                                uint32_t addr, uint16_t *insn)
 {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 57e0253ef4..11bfdba512 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1000,6 +1000,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    target_ulong *page_size,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
+void arm_log_exception(int idx);
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif
-- 
2.20.1
