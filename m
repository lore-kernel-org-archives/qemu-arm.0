Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653262wru;
        Mon, 1 Jul 2019 06:26:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxALjO1j3mTDAJ89eZtCZyH+jqwhhk9X5ajlPYsLFgWxSwMatUXeyhhrlxfL5cQUmIyh27o
X-Received: by 2002:ac8:6a17:: with SMTP id t23mr2810511qtr.183.1561987567806;
        Mon, 01 Jul 2019 06:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987567; cv=none;
        d=google.com; s=arc-20160816;
        b=gsGEzGp8hZcF+op7TYK9VgcOk34poMA8TJ/La+Qm/bhMOXkfgWI6hW0sbv+/FNovzF
         M3A28S+3S6GD2UsvxIoKgSvdxdABydXeJWffeNRnIDeiedrftVaNHl8/6Opbmc7gPwRx
         LDHrHZ/lQ/A0bVr3KJ+bnTh2XnW296ARZ7aL9i1OS2wLTsg2zUr7a7zhpdEbWz1eqCOl
         r9GZYfl40eB2YeXWDhyCscbZ8ZAarVv1WKZ4nyYLjuuaELe/WgoYJ/JmFiNHkadvIa3X
         X9O3RSEwJU2DnLEHLDX//UpHN01MalSPUIlTvNgmKDJTpClfL0OpJcMnVxEvEUtZIsTB
         2FWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LxIVcTp8UvCdidJdPsts745lB60g4GuyRB+Pjg9gaSk=;
        b=j4Kh5tP4TJo1prmJTZ0tT+aznaFxZSe9/TTZg6bi2plZSgKng7wlHhqLdDUGzXQWoQ
         vzM0psXm49M6J1KFFtN1kifPtZII5oGTm88QO1z8YR2DVTYVL8ZGsKtC1CDl7SmbnEUS
         Cqv5M1K0r0eCVaW/wMvLrPApxsdGMWg3EwnF1wxbKerYrISCDTgHO/7iOujU4o7qhQ7w
         arJlCpe+TKMMcCjrGFhK0gzkA2QaykMmJI0YU4pmSIlfz7Odaz/PePJvunqgLLE4MMj2
         7Bx9ZtPllKeRy+pLu157EzL0T+e8kRecoemyWxk8qsFblMlw9B4leqo5WhMHA8KKHf43
         vnHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x41si7714157qth.346.2019.07.01.06.26.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8BF4A705;
	Mon,  1 Jul 2019 13:26:01 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04E6217AC2;
	Mon,  1 Jul 2019 13:25:56 +0000 (UTC)
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
Subject: [PATCH v3 08/27] target/arm: Fix coding style issues
Date: Mon,  1 Jul 2019 15:24:57 +0200
Message-Id: <20190701132516.26392-9-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 01 Jul 2019 13:26:02 +0000 (UTC)
X-TUID: 6+ceBXrMYXLS

Since we'll move this code around, fix its style first.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: added vfp_helper.c
---
 target/arm/translate.c  | 11 ++++++-----
 target/arm/vfp_helper.c | 36 ++++++++++++++++++++++++------------
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4750b9fa1b..c6bdf026b4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9109,7 +9109,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 loaded_base = 0;
                 loaded_var = NULL;
                 n = 0;
-                for(i=0;i<16;i++) {
+                for (i = 0; i < 16; i++) {
                     if (insn & (1 << i))
                         n++;
                 }
@@ -9132,7 +9132,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                     }
                 }
                 j = 0;
-                for(i=0;i<16;i++) {
+                for (i = 0; i < 16; i++) {
                     if (insn & (1 << i)) {
                         if (is_load) {
                             /* load */
@@ -12353,12 +12353,13 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         return;
     }
 
-    for(i=0;i<16;i++) {
+    for (i = 0; i < 16; i++) {
         qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
-        if ((i % 4) == 3)
+        if ((i % 4) == 3) {
             qemu_fprintf(f, "\n");
-        else
+        } else {
             qemu_fprintf(f, " ");
+        }
     }
 
     if (arm_feature(env, ARM_FEATURE_M)) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 7ece78e987..121bdbd3af 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -34,18 +34,24 @@ static inline int vfp_exceptbits_from_host(int host_bits)
 {
     int target_bits = 0;
 
-    if (host_bits & float_flag_invalid)
+    if (host_bits & float_flag_invalid) {
         target_bits |= 1;
-    if (host_bits & float_flag_divbyzero)
+    }
+    if (host_bits & float_flag_divbyzero) {
         target_bits |= 2;
-    if (host_bits & float_flag_overflow)
+    }
+    if (host_bits & float_flag_overflow) {
         target_bits |= 4;
-    if (host_bits & (float_flag_underflow | float_flag_output_denormal))
+    }
+    if (host_bits & (float_flag_underflow | float_flag_output_denormal)) {
         target_bits |= 8;
-    if (host_bits & float_flag_inexact)
+    }
+    if (host_bits & float_flag_inexact) {
         target_bits |= 0x10;
-    if (host_bits & float_flag_input_denormal)
+    }
+    if (host_bits & float_flag_input_denormal) {
         target_bits |= 0x80;
+    }
     return target_bits;
 }
 
@@ -80,18 +86,24 @@ static inline int vfp_exceptbits_to_host(int target_bits)
 {
     int host_bits = 0;
 
-    if (target_bits & 1)
+    if (target_bits & 1) {
         host_bits |= float_flag_invalid;
-    if (target_bits & 2)
+    }
+    if (target_bits & 2) {
         host_bits |= float_flag_divbyzero;
-    if (target_bits & 4)
+    }
+    if (target_bits & 4) {
         host_bits |= float_flag_overflow;
-    if (target_bits & 8)
+    }
+    if (target_bits & 8) {
         host_bits |= float_flag_underflow;
-    if (target_bits & 0x10)
+    }
+    if (target_bits & 0x10) {
         host_bits |= float_flag_inexact;
-    if (target_bits & 0x80)
+    }
+    if (target_bits & 0x80) {
         host_bits |= float_flag_input_denormal;
+    }
     return host_bits;
 }
 
-- 
2.20.1
