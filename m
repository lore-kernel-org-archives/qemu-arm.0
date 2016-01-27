Received: by 10.25.159.19 with SMTP id i19csp29886lfe;
        Wed, 27 Jan 2016 14:16:57 -0800 (PST)
X-Received: by 10.66.141.11 with SMTP id rk11mr44430539pab.156.1453933017588;
        Wed, 27 Jan 2016 14:16:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com. [2607:f8b0:400e:c03::242])
        by mx.google.com with ESMTPS id f79si12052656pff.71.2016.01.27.14.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2016 14:16:57 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::242 as permitted sender) client-ip=2607:f8b0:400e:c03::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x242.google.com with SMTP id pv5so973823pac.0;
        Wed, 27 Jan 2016 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Doe2NGNYFcN1Qoqb466EaCltjfjvKL9a08EFtGY9V80=;
        b=Jp4Mw5qvVYaVsxtK7QMnfACaQ2/OhPJ73ZF7LmB5R2PLEHECSOfknB+RwGCVI9udRx
         xno+lU3UAbj6Vwi0L6XzOMOjG41Mk1RpyFQilgnQxsO2Z0I4I3stH7KDOQU/cm3V92Eo
         q+AV1uW3KJNJ/kalYcfBCyFDGoPZ3GA4oJldDO2xHcEne3p6pb43c91JiO/f63DlJUwR
         kGGhbgnSbvK6mq/m1hJfhmvZNvYzvKrIJWFu3b0oAiv5wQH/a0AZu3niv5yIlgwopZqs
         MVu+TgnyLGW9CqjT3eJXKaG6kH91FiF6nH/SfvzwnkvXIu96GdeTKzymX1kpOeTOFp9y
         cc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Doe2NGNYFcN1Qoqb466EaCltjfjvKL9a08EFtGY9V80=;
        b=cX97jPavpAvQZobdKlyf2jxGUqEV+1IEg4pONzYw/XgARq8xh+4OL2Egf2uxBnyvfZ
         hWdoTnj7wzbV91HQvo83X8gOeSam6Ij4yWz41XyFb4tTUuGbAn9rHxI8K570d+laf7/E
         G0Xu6BR7Vlz1SvF2pbFDM1q048cXwjI4cm9UgeqPZzMNQ9XgIXuY8xNy/kKkG96E9yRb
         vBarz8TaoghS/F6HaGrErkuycFx52zNaux6N1gwFOYVanONsj75KaLVQ/Qq5CXxoe6iO
         lxN0ZSjBJFVgCTnrd4pmwVLTLQUe9cXoF1lZHOcutfsunTImIgaERCeOml0HyKZI1qSJ
         EPvA==
X-Gm-Message-State: AG10YOSLTaA8SGTWOOhikOOYTmkwTYoffI+kE/07IfazkyY62GVRFFNZdooaZxMzC4vD1g==
X-Received: by 10.66.90.166 with SMTP id bx6mr46595299pab.75.1453933017279;
        Wed, 27 Jan 2016 14:16:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id lq10sm11249096pab.36.2016.01.27.14.16.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 14:16:56 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v4 2/3] target-arm: Rename check_s2_startlevel to check_s2_mmu_setup
Date: Wed, 27 Jan 2016 23:16:09 +0100
Message-Id: <1453932970-14576-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: 13fGjjRxtxiC

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Rename check_s2_startlevel to check_s2_mmu_setup in preparation
for additional checks.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 5d6f297..13e9933 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6763,17 +6763,18 @@ typedef enum {
 } MMUFaultType;
 
 /*
- * check_s2_startlevel
+ * check_s2_mmu_setup
  * @cpu:        ARMCPU
  * @is_aa64:    True if the translation regime is in AArch64 state
  * @startlevel: Suggested starting level
  * @inputsize:  Bitsize of IPAs
  * @stride:     Page-table stride (See the ARM ARM)
  *
- * Returns true if the suggested starting level is OK and false otherwise.
+ * Returns true if the suggested S2 translation parameters are OK and
+ * false otherwise.
  */
-static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
-                                int inputsize, int stride)
+static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+                               int inputsize, int stride)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -7013,8 +7014,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         }
 
         /* Check that the starting level is valid. */
-        ok = check_s2_startlevel(cpu, va_size == 64, level,
-                                 inputsize, stride);
+        ok = check_s2_mmu_setup(cpu, va_size == 64, level, inputsize, stride);
         if (!ok) {
             /* AArch64 reports these as level 0 faults.
              * AArch32 reports these as level 1 faults.
-- 
1.9.1
