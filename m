Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3599719wrt;
        Fri, 19 Oct 2018 03:19:04 -0700 (PDT)
X-Received: by 2002:a65:44c6:: with SMTP id g6-v6mr31092180pgs.350.1539944344013;
        Fri, 19 Oct 2018 03:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539944344; cv=none;
        d=google.com; s=arc-20160816;
        b=LTQucXiXuGnez30edKJpZsEnWrnGBmJaTVj5hhV3XpSGjqkLc19HRYezoIzjsbgBTm
         XgwGNl2e406PEyrJAXiycbfwx4LsSvLAcN1n2v0Q83Bb7XN/9FE2p9slQBrWoe0l6waZ
         6tWobfV/p6VTzKbczU5l5Dlc7T3R66efL7nkrL9h0rWUXZRithI9mY8FZX7WqCNjdSke
         Il/fvRm7q0CAtkqCLJxdYb7fsfsmkmef5PA4/KCG78fXdNo2RbkM6ar7PRUSWFHxtlvH
         hkNWAQd7aTQzhM8X08GXOydqALiA0hKgldmS23VOzph9YAynPlfNRWg7b8JIA1XeE63R
         +fyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=CuYZs8sM1oUptLtvGrZa+aFo2PdAiLJso0r/SM01ssw=;
        b=UhBW7Rl2gFRDNSCASsnYkxTWq33DbwkafOnB/wOzuS84veM36p5LgAFuzxuE08EuPD
         hXGvlbwig0GMwX/l4kAw1jsiz/rtnvPoCSWeShM7gi55hBZ1JnRe6kjnfiAT8p7/G3AD
         OKpfGHaa6BxzZ6inrOgayYQZFhlq3KfvTz+ocCot3hjzhjXAbczRZKQPXjknRavRbPwW
         rOLs/p98ibZ+ZeoizzJW+xdMwhKwF5EM+wwpHpE7g3JK4ELolZp2N4ehChkGtEaS2tg1
         CFgHdEKyUL5jGpChQFan1I0y89FMPA6syhnFmjlSxfz+YT0aV7wVTrmQyoygQvXTsct4
         0s0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+q91IGd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s23-v6sor11426301plr.15.2018.10.19.03.19.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Oct 2018 03:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+q91IGd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=CuYZs8sM1oUptLtvGrZa+aFo2PdAiLJso0r/SM01ssw=;
        b=i+q91IGdPUZKiZTuYwrzVpanhgOTq7RE7EtJ17hAkGRXlbTopfZeV+9ErOy5Vb32GC
         N6XZsnC0FQ4k1Pf5T5wHLUumO0pa00AgEbvrHKMX9xLc3iGCZTmLss+NygRmHs2bFY4y
         CG6reSy6URVpYFKLVrkgOaWtKdjLwtNYbkat8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CuYZs8sM1oUptLtvGrZa+aFo2PdAiLJso0r/SM01ssw=;
        b=XL/f2RcOB6b9qr4GJ0n1kDx8q4gcLgsBaPiKxy95igO+jnjiaQKgRThuvI5JVN/nug
         39BMM7aWaZBicdiDSRyKJWT9fb5AIrhVlvGNUeh9EsUtOBeoesG7YuJfEnGKsXUeVkik
         6Sf+V7x0KqmaCe4qdu1ctNjuUXbk8KOSKIl7bxs5fYoCyjpRBD0QgN92S6XA1M9VS4nu
         nqoxoAXVtLF3ZSG4JTQ19QVTO8Zr4DkWfvEPA0G6MVjkM+cpF+mlo4vFZ+fr1ZXBcc3G
         JIDmBcfptG77MBAk5fY8XpgTOhj6r4Y3NT45a6qzPDfe0v2mn2gUPEjlA5T1fPNOpWNR
         38Uw==
X-Gm-Message-State: ABuFfoiClFU4xozHas1Lv5nMiOo/CFa9i9MXpxDHFv0r0PE3aveRauBh
	L2EVHDMGgOFD2/rUA0/ghEMBW9Zac3dBED28
X-Google-Smtp-Source: ACcGV63zzOLKJyLnSGGAQ0mB6Zx2CTYfgjw/jjOkAM5utji2LfyHWF9odE1MhKKwBqZbI+MuHT/zuw==
X-Received: by 2002:a17:902:20c5:: with SMTP id v5-v6mr33260243plg.62.1539944343522;
        Fri, 19 Oct 2018 03:19:03 -0700 (PDT)
Return-Path: <hongbo.zhang@linaro.org>
Received: from localhost.localdomain ([45.56.155.225])
        by smtp.gmail.com with ESMTPSA id f193-v6sm33220731pfc.74.2018.10.19.03.19.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 03:19:02 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>
Subject: [PATCH] hw/arm/virt: remove unused header files
Date: Fri, 19 Oct 2018 18:18:55 +0800
Message-Id: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: O5EH8jj8QhGg

Remove the unused herder files, 'virt' can be compiled and run without
including them.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/virt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f67782..f0066cb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -30,9 +30,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/sysbus.h"
-#include "hw/arm/arm.h"
-#include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
@@ -41,12 +38,9 @@
 #include "net/net.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/compat.h"
 #include "hw/loader.h"
-#include "exec/address-spaces.h"
-#include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/arm/sysbus-fdt.h"
@@ -56,9 +50,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "kvm_arm.h"
 #include "hw/smbios/smbios.h"
-#include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
-#include "hw/arm/smmuv3.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
-- 
2.7.4
