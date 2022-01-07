Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp208676lfb;
        Fri, 7 Jan 2022 07:54:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8sWDV4pffypmB6Mc5DwZ56ZJV7rkXBVxNZgeGz3b2SKUWt83g2RIBXxkRlm8eVIMetibP
X-Received: by 2002:a05:6402:11c7:: with SMTP id j7mr59980267edw.169.1641570854445;
        Fri, 07 Jan 2022 07:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641570854; cv=none;
        d=google.com; s=arc-20160816;
        b=AHGcm15p9Ud32C9Rl9Ib7PIaNgaQaWDyUuwK4sqb/ISusF/1DjM/TB3THgdBIqr5U9
         enIoycLmZy/mE97e3WBg7nJNTCDbm34XFen7UXnTnpY1jvcoj1ytVd8dKzQagNCDg665
         995iQfNeImz49VXIY6T9kO52SpUjA6quupVCXqfLzsFb+qQWWLd/f7b13dIW49ljViqa
         ErUZfjduF/BF+CoB76pqQE9Ku2qW13MgGn0t/gM/Ba9f0CLC3wT6IUdei8Aa7H+bFxxG
         tiQLnJKUXs846ObSCkjKyO9Xl8asO7k2VgY/fCK0fqWcjA6gtL7nE6eebjxOi6mpMi7p
         taQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=yqYT0uCCrsOW6aULS0w8drkbTPa6tCpJORlpWQ/Sv1I=;
        b=HZU6fC04POjU/hlOfgdlzCiyI5dg75Stn0NiaEPOdlqfQld1TvtgpUhbZy//m228zn
         TQ7LNGBmQ/k8uV+iZN1QqIyrCAz6jpZjHfQNftOsavx27krqaFkhcz+f4aCpBoWB7Pyk
         s85lrcvTJkp1wDS7odhDdaxUZaUwti1kS67BYrC0J46wdWADnkiAi7eLSm42hcgNDbvX
         zAEJyHbLOKLjArX0awWW4dQux5AtAKFu+vqhJtKIbVNgOnO6eQ64ZOPc2RJ7h2+//jfY
         wDImcbl4JGO7R0Xy1hLbTVMEb1wbtusy0CsWfKfnjv786AEQTujaZMYxOLbKbGHViSOI
         z4kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AGErxC5F;
       spf=pass (google.com: domain of ardb@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from ams.source.kernel.org (ams.source.kernel.org. [145.40.68.75])
        by mx.google.com with ESMTPS id eg50si1447106edb.339.2022.01.07.07.54.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jan 2022 07:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 145.40.68.75 as permitted sender) client-ip=145.40.68.75;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AGErxC5F;
       spf=pass (google.com: domain of ardb@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B70FB8265C;
	Fri,  7 Jan 2022 15:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC64C36AEB;
	Fri,  7 Jan 2022 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641570852;
	bh=lcWmzJBWTzN6IZGJco59IDlCHLecdqfcdN120DHVA9c=;
	h=From:To:Cc:Subject:Date:From;
	b=AGErxC5FWsuML0PXbOLrPOgoELhOX653fvjjKh1NZfOfhq4KZ5ZXUv1iJz83lffra
	 rroHTQ/oxDbEAezLphhkcacEBevgCZWGUda1lBBCcplbRnOI13wZJHYajavhGgUCN9
	 Uxs2BPVgaFUSBitkAf4jibj54ky/6hEKPkOmepYBXp0zvBe84k/27BuktvqcZVfPY1
	 aVXyk+iJDAzf6M0j7IR/0ovbO4lmNToBXXzn3NCE+Zbjil6MmrVNP1QKIfeSG4vC80
	 E78fQxMj3FRow4TQPaOHb9PZxiUNB1APscPfAOuXKqLfF/dE+lU/K3D8jpWazz3VT0
	 CxMa/gE3qYRdA==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>
Subject: [PATCH] target/arm/cpu64: Use 32-bit GDBstub when running in 32-bit KVM mode
Date: Fri,  7 Jan 2022 16:54:06 +0100
Message-Id: <20220107155406.344273-1-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eQXtPIpReOWa

When running under KVM, we may decide to run the CPU in 32-bit mode, by
setting the 'aarch64=off' CPU option. In this case, we need to switch to
the 32-bit version of the GDB stub too, so that GDB has the correct view
of the CPU state. Without this, GDB debugging does not work at all, and
errors out upon connecting to the target with a mysterious 'g' packet
length error.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennee <alex.bennee@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/cpu64.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15245a60a8c7..3dede9e2ec31 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -903,9 +903,15 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
     return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
 }
 
+static gchar *arm_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup("arm");
+}
+
 static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    CPUClass *cc = CPU_GET_CLASS(obj);
 
     /* At this time, this property is only allowed if KVM is enabled.  This
      * restriction allows us to avoid fixing up functionality that assumes a
@@ -919,6 +925,12 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
             return;
         }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
+
+        cc->gdb_read_register = arm_cpu_gdb_read_register;
+        cc->gdb_write_register = arm_cpu_gdb_write_register;
+        cc->gdb_num_core_regs = 26;
+        cc->gdb_core_xml_file = "arm-core.xml";
+        cc->gdb_arch_name = arm_gdb_arch_name;
     } else {
         set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     }
-- 
2.30.2
