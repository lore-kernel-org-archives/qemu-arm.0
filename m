Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653936wru;
        Mon, 1 Jul 2019 06:26:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxr/FkyAZvzIAzJ9U93kq//9NOQP0zavNweq8XNFnNA3o4USZnraMS+5l7T1gYdQacZcoFl
X-Received: by 2002:a0c:d01b:: with SMTP id u27mr21821975qvg.88.1561987606338;
        Mon, 01 Jul 2019 06:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987606; cv=none;
        d=google.com; s=arc-20160816;
        b=yZohOvQcI8Sawt3Vj/x9V1ZRlYJUJ3C0du2zmVs9LbkVuGAGfKw7r6kQfnDtrfR0UX
         prsIWoSDMJMITugnUxfMroMDTolSY8R0Lyh0akmxE1L+pxQI8go8rolY0vmhlSrUzSIL
         0Z1ceOaAXl8z4AKgyhCFbfacgeye6X09MIDzqvP0nGY+yUO560d5kZdOzVj2Jbo1LIG0
         say0VbinuOmZkKO3ldpEU/engn3VYFMJH6VWbpx7WxRE9iBjNZ94nwYfI1OgJLo/s4KR
         yUBLUYIBFbVWOgspmOBB2l0CL/Le51Zg0CtKPCtJ8Gg01UNZVfVzqI5b5AENYFOfzEMV
         pqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=aAuLTjvKWDi7q4IExY/YvHyXrZKF2xDS6ICG+sjIVXM=;
        b=uea3/vMgIHAGlQYybOEDjCHkUAP87a3Bf17/3AghJOX/rwtQGYC5Nz0+frNKPOVpQY
         wxdNLEVxrizUN6FvM0cwxztlINsmNRMub6CP2/R5J/q57+S6gwsp6Zhx4JivkGytMJEu
         TA+OxXteMzyvpUc1RsNKe4SXJESbHCQARcc3BePaqvD8D2sUKak4TvRqTlJiqonVeTZV
         5zY2oPQqNfLWacKIovug68Hv6y264MY1R2coh8wYHzraaidL/f7Y+4O9x9oSN0zPpNx7
         SscCrAfSKEs6UGifzkdXCaitgAs5r5B+s1ZLS1dYFHv6ipX7gbRr3iJbRB4AGuJqSXL5
         wPnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c27si7707580qtc.68.2019.07.01.06.26.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 088543091786;
	Mon,  1 Jul 2019 13:26:41 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D9306085B;
	Mon,  1 Jul 2019 13:26:35 +0000 (UTC)
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
Subject: [PATCH v3 18/27] target/arm: Restrict semi-hosting to TCG
Date: Mon,  1 Jul 2019 15:25:07 +0200
Message-Id: <20190701132516.26392-19-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 01 Jul 2019 13:26:41 +0000 (UTC)
X-TUID: HfYFcmiME7IZ

Per Peter Maydell:

  Semihosting hooks either SVC or HLT instructions, and inside KVM
  both of those go to EL1, ie to the guest, and can't be trapped to
  KVM.

Let check_for_semihosting() return False when not running on TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: inline call to g_assert_not_reached if !TCG
---
 target/arm/Makefile.objs | 2 +-
 target/arm/cpu.h         | 7 +++++++
 target/arm/helper.c      | 4 +++-
 3 files changed, 11 insertions(+), 2 deletions(-)

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
index 49a0f05cd1..1b4da7aa45 100644
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
 
-- 
2.20.1
