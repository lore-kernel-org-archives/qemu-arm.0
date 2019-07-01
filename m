Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653897wru;
        Mon, 1 Jul 2019 06:26:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/ARYN+Y5Mz7orK3a7vtxxtIvT3r/UD3dR6WbKwR50g7o7e/WxsYSTUnPSkcJUgkLG4HeU
X-Received: by 2002:a37:a7d2:: with SMTP id q201mr20432673qke.403.1561987604415;
        Mon, 01 Jul 2019 06:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987604; cv=none;
        d=google.com; s=arc-20160816;
        b=knF0CZYujpQreZOThc/V+T+FneN3iH+ZEeU4gl4pnyadZ55dsM3on3KBanaGfCRKZq
         Z2nfQfX4TjWhAFWsiKzCdJDNn7ksbDYafLvhw+35qv/Y2G7OZKCZze9dhsjlH+JSqoa7
         bge6vwMe+WaCx2OXXjqO0nS0y5TUJPEPkxAWrNEzU4UtkCoIL3YmKg/Z/PHzsWPqo/Yd
         SP2+r6dIbQI9YIMHkRUYUBo6WYiu25t2eajQPPDAZdtY3Qg5hjke4tt24k0k6+6MLs9r
         exIrMmcXNChNAsC5HvkpprfLqbZfvLbW4AL9/7pnMcluUbI/U12uUQwsCG9gYHu/YyTH
         A1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=a897KpbddWgTORFMoNR/AIMA0DNiT3KwSFNGW6R+CJs=;
        b=xWlEUzU7AodkKchOWbUKW7FEb+da+8/7clU2OLB/tf5e78qJdkjHQOnkmvZBH7bDCJ
         Vpz0f9hP5StGegKGIuekEd7RqAunokF4aX5UcuU72pE4NISuZohkeeMsQFDsfwyEXGCH
         Ut3u79qw88Rl1M8AQ7j02R5metxUYICU0ltSWPiSdMKiF0RAwTjkWfV3L/eAfSPnhb3E
         fPIgQqD03LSZOROIfY8OKFNnDxHkDJyGvDzEFRGL9gR0WlBU2Hph81gnLSha0acJveZZ
         kRlIBh4A0Ry1t84QqJbzNC+jgwOJ5T7LtX7Qsk6af1bvs5rI45PlAGsdXZX+fGJr+kRj
         V4aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k51si7670722qtf.356.2019.07.01.06.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BDCC308624A;
	Mon,  1 Jul 2019 13:26:35 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3CA06085B;
	Mon,  1 Jul 2019 13:26:32 +0000 (UTC)
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
Subject: [PATCH v3 17/27] target/arm/vfp_helper: Restrict the SoftFloat use to TCG
Date: Mon,  1 Jul 2019 15:25:06 +0200
Message-Id: <20190701132516.26392-18-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 01 Jul 2019 13:26:35 +0000 (UTC)
X-TUID: RTGbddLcDtEK

This code is specific to the SoftFloat floating-point
implementation, which is only used by TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/vfp_helper.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 838f7d25fd..46041e3294 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -18,17 +18,20 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "fpu/softfloat.h"
 #include "internals.h"
-
+#ifdef CONFIG_TCG
+#include "qemu/log.h"
+#include "fpu/softfloat.h"
+#endif
 
 /* VFP support.  We follow the convention used for VFP instructions:
    Single precision routines have a "s" suffix, double precision a
    "d" suffix.  */
 
+#ifdef CONFIG_TCG
+
 /* Convert host exception flags to vfp form.  */
 static inline int vfp_exceptbits_from_host(int host_bits)
 {
@@ -145,6 +148,19 @@ static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
 }
 
+#else
+
+static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
+{
+    return 0;
+}
+
+static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
+{
+}
+
+#endif
+
 uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
 {
     uint32_t i, fpscr;
@@ -210,6 +226,8 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val)
     HELPER(vfp_set_fpscr)(env, val);
 }
 
+#ifdef CONFIG_TCG
+
 #define VFP_HELPER(name, p) HELPER(glue(glue(vfp_,name),p))
 
 #define VFP_BINOP(name) \
@@ -1303,3 +1321,5 @@ float64 HELPER(frint64_d)(float64 f, void *fpst)
 {
     return frint_d(f, fpst, 64);
 }
+
+#endif
-- 
2.20.1
