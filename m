Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004068wru;
        Mon, 1 Jul 2019 12:50:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzckL0j6vflYNN3H9VX7a8bRz7dAbP7ur/xldBrlvJYYuI0WCHf/KGKUftaI3hle+OCmojl
X-Received: by 2002:a37:9506:: with SMTP id x6mr22634846qkd.107.1562010606107;
        Mon, 01 Jul 2019 12:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010606; cv=none;
        d=google.com; s=arc-20160816;
        b=hUcgaw01FBrzV3L/dk62IiH11fI2doxzZ0HJOYJ0Qcv2juEUCcyNRqbchm7CBvqzIo
         6QRQgPn1nq/kDm0fa/U7Heyou/h4bSZdcapUCK5A3NWEOGFl69bANu7sD5xsfdJCn0xn
         ktW3U3UST1Y6t0e9PiwtUardBVDVuJY/uOKfWIOzoHiPJaPBsFIUwfM3hfKjyP+zAvAA
         ul/H7CPcWvW1hHyt5DgGOfojjUZp6qrz1XscfkrSmWGxTLNALMPfB8V8Vuy2ln0PaHLO
         IlkyDeG+Babwzzaw4NPTXlwW06i1YyZI+fJTSLvA+Q89gaY0biKuiEi5WumV/NmkCCWk
         IuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dJCI6lwSz6oKb1SjeN/yk/jijyYdm0lGIVPzbf1z51Y=;
        b=FR7HY1VEpsvthjjWr3CyjlV79uW1fl1scoRJFB4rglynxf5x1GoXo+ClpWB8Rmn3jO
         rmpIOw+tUa7XiFGrxrsvHWXmoHge3hQl235QShMDBL3ZxoYHqq5GttYAw48aSuYwJW/E
         tKQOimQYeKEtxp3zkB1Gn9cmPCMrTSI9PupaU/o9dEKWbgDlAFjKd0r76ZcV4uhwCkw5
         Cb03mLn2zRNoUtbdGOwNqVqb/DbMRBh7slqsWyfy6+d7XdlUTqxUdcqV/XVFIHW4kUid
         P7xcl033pSYAMjMBZ7Jv4wf7fNmwpM2qkU008kLnkg0+lydirkO/iMiYmij4X50PaFEH
         00oA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v26si8297568qtj.280.2019.07.01.12.50.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E399630C3192;
	Mon,  1 Jul 2019 19:49:59 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2ABC87A0;
	Mon,  1 Jul 2019 19:49:55 +0000 (UTC)
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
Subject: [PATCH v4 2/8] target/arm: Restrict semi-hosting to TCG
Date: Mon,  1 Jul 2019 21:49:36 +0200
Message-Id: <20190701194942.10092-3-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 01 Jul 2019 19:50:00 +0000 (UTC)
X-TUID: Re/uzOHKv+3d

Per Peter Maydell:

  Semihosting hooks either SVC or HLT instructions, and inside KVM
  both of those go to EL1, ie to the guest, and can't be trapped to
  KVM.

Let check_for_semihosting() return False when not running on TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: inline call to g_assert_not_reached if !TCG
v4: fixed some ifdef that had moved in the next patch (Peter)
---
 target/arm/Makefile.objs | 2 +-
 target/arm/cpu.h         | 7 +++++++
 target/arm/helper.c      | 8 +++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 294433da88..82bedefc3d 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,4 +1,4 @@
-obj-y += arm-semi.o
+obj-$(CONFIG_TCG) += arm-semi.o
 obj-y += helper.o vfp_helper.o
 obj-y += cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a9be18660f..94c990cddb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -964,7 +964,14 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
 { }
 #endif
 
+#if !defined(CONFIG_TCG)
+static inline target_ulong do_arm_semihosting(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
+#else
 target_ulong do_arm_semihosting(CPUARMState *env);
+#endif
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38b73430cb..6d91e0a1f9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -20,7 +20,6 @@
 #include "qemu/qemu-print.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/semihosting/semihost.h"
 #include "sysemu/cpus.h"
@@ -29,6 +28,9 @@
 #include "qapi/qapi-commands-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#ifdef CONFIG_TCG
+#include "arm_ldst.h"
+#endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -10399,6 +10401,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 
 static inline bool check_for_semihosting(CPUState *cs)
 {
+#ifdef CONFIG_TCG
     /* Check whether this exception is a semihosting call; if so
      * then handle it and return true; otherwise return false.
      */
@@ -10474,6 +10477,9 @@ static inline bool check_for_semihosting(CPUState *cs)
         env->regs[0] = do_arm_semihosting(env);
         return true;
     }
+#else
+    return false;
+#endif
 }
 
 /* Handle a CPU exception for A and R profile CPUs.
-- 
2.20.1
