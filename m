Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485379njk;
        Thu, 23 Jan 2025 15:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1etQlQBZHWV+DRxbJErNYAiTOFYTVOQrvvdwGkNaeGvvIU+ewjItTjR7C5SMIsXXEJLSRsQxg0ACHSg==@linaro.org
X-Received: by 2002:a05:600c:a45:b0:436:faeb:2a0b with SMTP id 5b1f17b1804b1-438913e32bemr276242825e9.15.1737675930690;
        Thu, 23 Jan 2025 15:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675930; cv=none;
        d=google.com; s=arc-20240605;
        b=UZ1wxSuKmESk8yWTSnI8r6L3fAWtLAwEcjnWfbP/VsRfudgWV4iyqNS3LMbA8Ypw0S
         AK1n9Z7quqlP3RFJNz/DJUC6k+VVgM+0ClJe2tm/pLKygGx9kqi2KXNq3ZIErCaC1N3n
         sbomVxd03iLAcwXOqcl48u/peHIZQgb9mbiA9uO6nytCiSB3dmPNxDFWNb97HVehtxoS
         neNwWsBjOO9HeOZo7/00NoxYxahM51zj4AC5vOfGM973x5FA0f9vgUJS2rA/5l5uqMO5
         dT5pVDGc6kdayOGevBM4xkvVLN7B71OJv2AYGAfKS1Ezr3YJgSTuHIsa0g9yDkwqqE1f
         kidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
        fh=3cdGtByvjca4xAcTYV7j4xRSL+HZTQ7PfiY1YY5tpDw=;
        b=T8s1x5bcHpBeTQqzVhWlhkjXTR7gfHtsiS8UANV53N4jwdDPlDdzA7y1q/gTHYP1wW
         5bNSFLb+i0oPzvome484cOcDq2wsOg2nTrSNv+jev2ldXNUa1pjIxBo/s9oSXT5+/p9W
         I9vCD7VgFSm4H6VFKqmtf1qIumIO6MKiZFQnoekjGL0m3fgjC5rxgHLIx59buIMRA4eO
         3bxRYuZ+n37pLXTLHJrZ0RNTzeK1PuiqvAHzD7a0upMUmx30GjeF+UOq2tsUwYozVDss
         1AJ/c5FYrkMMD53dn1CVBi3zhdW4sc+uhq36Rksggibusam723PJfs+wdCeEiaKWHd3P
         e+JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T+/dgeu9";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4cbfaasor2345355e9.2.2025.01.23.15.45.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T+/dgeu9";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675930; x=1738280730; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
        b=T+/dgeu9S71FK+hqKgZD4ensD7DWHORp+hBZHmPk16whASNOZKo1gdZ449jT3Js+7n
         wuibIrAnsMkpcKkgIa5PWYz6aBcPJRh72i+W5Q7Go47IaBPME+ywY49YzuoNlJTaYLPm
         dWE/NIVG02z03bwEjkzQkMvhEnE4/KX6qJDG1vEy7t7uJPFar/w/7SmoCZ24291bmZOl
         qmAsunUOpxPeh1GSAwTXySVUvr91isP+xu06g3s7PD79hJypFh1C8uv8IOKrCbDgZ96x
         lYiyPUc4QY3XbW1v+Q2ZyzlaFJ0GqfOUhWN0YtCct9X7uMBLjYhxa6seOX2W6Ie+Jiim
         nueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675930; x=1738280730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
        b=XByLzMPSPEZ2sew1xPNDO4Ei8XI2g8Zpb8uAqalxkXrVF39s1pOxr/WD54UzgXeMZY
         YCBOdqhSU2RLMWTTRF5SposzRqVL/LbfpbRdri4IbrjRoBh2S4IbJhwqP4wQdOYcQkw0
         EwhDiFr1mMoF+hgezmQkLGxHMt7cnrm6HYyOrkeV9mD94YM+LSezP0I857UV9KKO+AJV
         hCwVvglvwnPkyxq5RnbxHTkQN0GzbdOno0BJFR+ErbxTYVYW0nO6jjIsnI8oGMNF1IP+
         HOdX5TWUn2NHc/xteKCCmafk/BfebxbVPVnLlMF8fU9dK00WCsIY7c1n+tEDYvjDvMyb
         /6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2GQO8lIKZIMC6tb2IhIVFVC1NE6aUJF8CQlnjKPf6CEFCoyuktHeEm81PvHpP12/xvRBWeFfoVDwLow==@linaro.org
X-Gm-Message-State: AOJu0YxzTa3VI8B6ohDn+cVfvsBr+WGRvK3Egq3YFrQ+O/z2rPwWHILQ
	fJX6sPD0nmSvN+7w/hA/A/9b00aKTUefE+GCAsI97INB3ZllCdJKGpghiLXt/J80kw==
X-Gm-Gg: ASbGncs7/+0jcSWj9udOBzpu35MackOCUxFzOrkFwFulkm3LHIaoHSQO1o53m0PnkJg
	u014cjwHhy9/uIzMmplZC6j5S1BflUJYyWmaXt+YK/RAVHMubqZAIOCWvIft0XcWkAqZ51CeNIU
	vLQ8NAGlA/SGLGaXa1ruVlOSZb6uFBrFrdo/9/UVdZJ0CT3Nzb7T5rUpoGh9+lQD+0wzM8UjJqq
	Xyo8xmI6jn2xW+Y9NjH51gaSrYfhpTV2Vn8dThOwky5qrigKffTkvISctUCpWCHfuOA0eU52eXn
	swswq3s1XpiS04ZBCqovbt+OGb1a5QZtk0ONawnX1pJWPtH+VEFTtr4=
X-Google-Smtp-Source: AGHT+IGTWWuqfdRG1OdMv1JrJhUNbIyiZqrhlB9MFbw+o6IkF6P0PGvSwNrik0HZ18U5C5r24zY0/A==
X-Received: by 2002:a05:600c:1e0e:b0:438:a20b:6a2a with SMTP id 5b1f17b1804b1-438a20b6b71mr242006995e9.14.1737675930187;
        Thu, 23 Jan 2025 15:45:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9990sm7076685e9.29.2025.01.23.15.45.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/20] accel: Forward-declare AccelOpsClass in 'qemu/typedefs.h'
Date: Fri, 24 Jan 2025 00:44:07 +0100
Message-ID: <20250123234415.59850-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SAm9kpGO2tmR

The heavily imported "system/cpus.h" header includes "accel-ops.h"
to get AccelOpsClass type declaration. Reduce headers pressure by
forward declaring it in "qemu/typedefs.h", where we already
declare the AccelCPUState type.

Reduce "system/cpus.h" inclusions by only including
"system/accel-ops.h" when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/typedefs.h           | 1 +
 include/system/accel-ops.h        | 1 -
 include/system/cpus.h             | 2 --
 accel/accel-system.c              | 1 +
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/qtest/qtest.c               | 1 +
 accel/tcg/cpu-exec-common.c       | 1 -
 accel/tcg/cpu-exec.c              | 1 -
 accel/tcg/monitor.c               | 1 -
 accel/tcg/tcg-accel-ops.c         | 1 +
 accel/tcg/translate-all.c         | 1 -
 accel/xen/xen-all.c               | 1 +
 cpu-common.c                      | 1 -
 cpu-target.c                      | 1 +
 gdbstub/system.c                  | 1 +
 system/cpus.c                     | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 19 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3d84efcac47..465cc501773 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -22,6 +22,7 @@
  * Please keep this list in case-insensitive alphabetical order.
  */
 typedef struct AccelCPUState AccelCPUState;
+typedef struct AccelOpsClass AccelOpsClass;
 typedef struct AccelState AccelState;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 137fb96d444..4c99d25aeff 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -17,7 +17,6 @@
 #define TYPE_ACCEL_OPS "accel" ACCEL_OPS_SUFFIX
 #define ACCEL_OPS_NAME(name) (name "-" TYPE_ACCEL_OPS)
 
-typedef struct AccelOpsClass AccelOpsClass;
 DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
 
 /**
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 1cffeaaf5c4..3226c765d01 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -1,8 +1,6 @@
 #ifndef QEMU_CPUS_H
 #define QEMU_CPUS_H
 
-#include "system/accel-ops.h"
-
 /* register accel-specific operations */
 void cpus_register_accel(const AccelOpsClass *i);
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index a7596aef59d..5df49fbe831 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "hw/boards.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/error-report.h"
 #include "accel-system.h"
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 945ba720513..12fc30c2761 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -54,6 +54,7 @@
 #include "exec/exec-all.h"
 #include "gdbstub/enums.h"
 #include "hw/boards.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/hvf.h"
 #include "system/hvf_int.h"
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index a81e8f3b03b..54ea60909e2 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "system/runstate.h"
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index ad7e3441a5a..7fae80f6a1b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -18,6 +18,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/accel.h"
+#include "system/accel-ops.h"
 #include "system/qtest.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 100746d555a..c5c513f1e4a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "exec/log.h"
-#include "system/cpus.h"
 #include "system/tcg.h"
 #include "qemu/plugin.h"
 #include "internal-common.h"
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8ee76e14b0d..4070d532bf1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -33,7 +33,6 @@
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
-#include "system/cpus.h"
 #include "exec/cpu-all.h"
 #include "system/cpu-timers.h"
 #include "exec/replay-core.h"
diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index ae1dbeb79f8..eeb38a4d9ce 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -13,7 +13,6 @@
 #include "qapi/type-helpers.h"
 #include "qapi/qapi-commands-machine.h"
 #include "monitor/monitor.h"
-#include "system/cpus.h"
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6e3f1fa92b2..132c5d14613 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "system/accel-ops.h"
 #include "system/tcg.h"
 #include "system/replay.h"
 #include "system/cpu-timers.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 786e2f6f1a7..0914d6e98b2 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -54,7 +54,6 @@
 #include "qemu/cacheinfo.h"
 #include "qemu/timer.h"
 #include "exec/log.h"
-#include "system/cpus.h"
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "qapi/error.h"
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 852e9fbe5fe..7aa28b9ab93 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -18,6 +18,7 @@
 #include "hw/xen/xen_igd.h"
 #include "chardev/char.h"
 #include "qemu/accel.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/xen.h"
 #include "system/runstate.h"
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..f5dcc2d136b 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -21,7 +21,6 @@
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
 #include "hw/core/cpu.h"
-#include "system/cpus.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
 
diff --git a/cpu-target.c b/cpu-target.c
index f97f3a14751..20933bde7d4 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -35,6 +35,7 @@
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #endif
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
 #include "exec/tswap.h"
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 7f047a285c8..416c1dbe1e9 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -19,6 +19,7 @@
 #include "gdbstub/commands.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
diff --git a/system/cpus.c b/system/cpus.c
index 37e5892c240..2cc5f887ab5 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
+#include "system/accel-ops.h"
 #include "system/hw_accel.h"
 #include "exec/cpu-common.h"
 #include "qemu/thread.h"
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index e7b56662fee..4e4e63de78e 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index ab2e014c9ea..81fdd06e487 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
-- 
2.47.1
