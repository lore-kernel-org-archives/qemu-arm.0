Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp8603563lfk;
        Tue, 23 Nov 2021 04:29:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVIvyxfOJGv49XyRJmQGi1/pgQGvQIHk1o2Ycxtqj+Z+Wwjrl3KdOXb5Qi068E1tZFkio1
X-Received: by 2002:adf:ec90:: with SMTP id z16mr7094915wrn.247.1637670541888;
        Tue, 23 Nov 2021 04:29:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637670541; cv=none;
        d=google.com; s=arc-20160816;
        b=LQH3sDUkVrcHV7lXoVDp33aajiYL7cYiGWwpwHwbPagZ6r9wAWjw3j9WbI+Jus/7vl
         uchL+1jE8Gc5HcMYabso7Rh8WeAOAfZHqaw6D/shW0XVufUgkaFytcjFTFTl2xm8UTd8
         qvoOCy1ZDO+ty2kZQQC84I6u5G/YPqFqnVmQipA24amkh3y6aMiFKXayZ92SRfMoRFN0
         2HVXPosfaFI2Mym1pqLnOH9+/T+3blj6UAmIhQ6h6smh199JgUgZgW6uuPuwo3B35qHY
         b5wt+aSbpxDCXAdGT5VmlOTJXMeevOpKBzf5uuYH/HjJWgE/CYSgr16q0yTTRMKLi0/a
         XFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=8l5weneZXT+TkhDYJrBPp2eBy8SUGRcQ9fRr6zlbX5k=;
        b=Kgc2252arkji7efjFoRNdTSOcDsLvML3OYLumwdOkl9ZVzxkt9WQfk+5kIGfiL/QJJ
         fqhBQPuqzczbkjLJHmiAlGRROZPMPr4NP+iU2SzKFJoAcyQ2Edy0jCamnq8vzpFOBAZb
         b00jm+b5Ocp1csJItG5xWyWVL8ImBwiOdtC8xWfBwGefAc2HZ5ekM4vzNPqJRTRg+s2l
         3TBmUzZXEF/+RGbjsV1po57ZOG/szIVXngmK92lIfRmF9omSbfGhp88u4AZAEJKMK2V5
         SwREXX2LYeguIYs1VtV7AcSCX7kHZVEB6BiJqcPSik7YaVLjNYbw90NglMPe7RG/oQsB
         2iNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id b4si45109038wrd.256.2021.11.23.04.29.01;
        Tue, 23 Nov 2021 04:29:01 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from localhost.localdomain (dynamic-077-002-101-238.77.2.pool.telefonica.de [77.2.101.238])
	by csgraf.de (Postfix) with ESMTPSA id 966D86080235;
	Tue, 23 Nov 2021 13:29:00 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	saar amar <saaramar5@gmail.com>
Subject: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
Date: Tue, 23 Nov 2021 13:28:59 +0100
Message-Id: <20211123122859.22452-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9EQ++bJk7bD7

The virt machine has properties to enable MTE and Nested Virtualization
support. However, its check to ensure the backing accel implementation
supports it today only looks for KVM and bails out if it finds it.

Extend the checks to HVF as well as it does not support either today.

Reported-by: saar amar <saaramar5@gmail.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/arm/virt.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 369552ad45..30da05dfe0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -49,6 +49,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/tpm.h"
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "hw/loader.h"
 #include "qapi/error.h"
 #include "qemu/bitops.h"
@@ -1969,15 +1970,17 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
+    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "Virtualization extensions to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
         exit(1);
     }
 
-    if (vms->mte && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "MTE to the guest CPU");
+    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "MTE to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
         exit(1);
     }
 
-- 
2.30.1 (Apple Git-130)
