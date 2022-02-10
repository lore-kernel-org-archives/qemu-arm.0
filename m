Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287725lfk;
        Wed, 9 Feb 2022 20:04:47 -0800 (PST)
X-Received: by 2002:a17:902:e948:: with SMTP id b8mr5735483pll.134.1644465887432;
        Wed, 09 Feb 2022 20:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465887; cv=none;
        d=google.com; s=arc-20160816;
        b=irPTGFQW5n/xFLdw/qrViqDQ/nR9XhfIKH8Wm1dgpx5E+y7CC0eWcRlnZZn1bNRfhY
         d9bJEUjjndOKe0rRFBuwadM4qY3Dy+pRDBYWpaI37jjjfn5/dXRBdlkXDbgyApHLvx1Z
         7XDzkWDa7xo3tErSZwifHHt7jiHLHOgf8qwigxstGvW29ud3ELduO4k+cNFMn+sKTshp
         ysaieY2/El719Q4/jPn2ewsjSEW49k5JoxZKUPh7w6FplfA5ZT3znpZ1U2Nz+Rw8rwOV
         srqtwQf22dwlsbRJ4lgAt/cdEB9E+mvf0lEtJyH6UNkIhvwqTjeDbbLXOfXfvARUjjah
         qGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kEVSOi5UkE1IrF02F4h1WkWrzoUBduclFFK91bx08AU=;
        b=D9i7AsPupgFfo5XfL9JnemAM3tsQMTvkhITYvUrqlWstKzMx+AkurhHAQ9ghSO1mEb
         fj+aTylZ6vUIZHGjg7q0Gy3g2I5sqszQjdIFqs5SUdexkLgN4BNkj4zDFFvfTsjee6Ak
         2dgSWZizi2+AqExkQMOzcVpAOLMjD1Izk6KpW5RLvHlYyyCXtExUoF6kEcBXursfYR+Z
         HnQdWDdjyB1uR5Pd8x4uPqQAfEY8MSbLnX+gv3zpa76MgOdxVG2ISTGYL99TlXcLt8dh
         O0hAcyMb2IMdr+jVe9ocbyfrAgYq686KoTbkaTQ+fjWJvwqh7EwlYTfwN1wyy5Qhckjb
         89/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YX6jH+v1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10sor385052plr.23.2022.02.09.20.04.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YX6jH+v1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kEVSOi5UkE1IrF02F4h1WkWrzoUBduclFFK91bx08AU=;
        b=YX6jH+v1OiS9An+7cc4yPISzo8OqdUTatWfsi9E9wwTMXef/fjm6nqNYZMeOKO5u1R
         nps0he/dQbeJ+DUKL6yHNrsHtfs4BdBHcsvwWB8XPuAjHBA0SVnBbdhOkiB/9Ecgz/RL
         fHt1NnRd8TgosGqW7I1tDM4xwbqcncO4iB9lXzaib9XIf7YDAjnM9f2G4NDkd1ixRheq
         YDUAgAu74laFveDoy3Mcsmghw0Rkqg4R6NPBchPocQzcHQHqHONUkG5gsJtIUB1g2tv9
         okmKN6c31101m+W7T7WQaRyS1wsp+M8z64Ym4TFdJIzMudGEC9D+kQ7PzJzLmJ1UnkGl
         3k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kEVSOi5UkE1IrF02F4h1WkWrzoUBduclFFK91bx08AU=;
        b=RrYcMxXYli7vsp2guwum55hLrshsOdsEMaaYXXH5c6nlCqJ2S4er5NSn7M/qpDIZZS
         7OZ2SLixjO40MIfuGUNnnBvFLvo/8U4ZxGsAneHdpxLTvHg+atqEb5DpO3oG/VKYMWtX
         KywE6eXLX1Mb8oq1yuWvx4Be6YKE0OxrOQQZzybYxeImLZRaajhJYA923UcCKnjsPGCX
         OiH5usnEV1MURBzkPu6nuzAiev5q06ep36jAKiObzh8EyxJA56lyiVeKqrKWNkW3jFVn
         NEDLFLyAT59VfLzwAzJOwEXUhOMuRdAnkUABhWF+Qekge9ySKjEIJdO1LmDCRBKCATAg
         kQ9g==
X-Gm-Message-State: AOAM5322EQ60TtuT1XwWa02RryZieZqX3KPDRmhdib39jKsNTQZXA+BK
	ZP5iS6tKqdB7ByEeFK2c1HmGeM8o
X-Google-Smtp-Source: ABdhPJz8Jn0JRUw6x62G0VbPLQZI80t/slSfi1HWgl0CHrOexz6N1gsWz3uVpYOUn8yWWJ9Dx3i75A==
X-Received: by 2002:a17:902:e74d:: with SMTP id p13mr5566798plf.42.1644465886866;
        Wed, 09 Feb 2022 20:04:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 05/15] target/arm: Pass outputsize down to check_s2_mmu_setup
Date: Thu, 10 Feb 2022 15:04:13 +1100
Message-Id: <20220210040423.95120-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eukD8e+l1wZX

Pass down the width of the output address from translation.
For now this is still just PAMax, but a subsequent patch will
compute the correct value from TCR_ELx.{I}PS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa0824e12c..cf38ebd816 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11063,7 +11063,7 @@ do_fault:
  * false otherwise.
  */
 static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride)
+                               int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -11079,22 +11079,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        CPUARMState *env = &cpu->env;
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 42)) {
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
                 return false;
             }
             break;
         case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 40)) {
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
                 return false;
             }
             break;
         case 9: /* 4KB Pages.  */
-            if (level == 0 && pamax <= 42) {
+            if (level == 0 && outputsize <= 42) {
                 return false;
             }
             break;
@@ -11103,8 +11100,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -11390,7 +11387,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride;
-    int addrsize, inputsize;
+    int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11420,11 +11417,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
+        outputsize = arm_pamax(cpu);
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
         inputsize = addrsize - param.tsz;
+        outputsize = 40;
     }
 
     /*
@@ -11509,7 +11508,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride);
+                                inputsize, stride, outputsize);
         if (!ok) {
             fault_type = ARMFault_Translation;
             goto do_fault;
-- 
2.25.1
