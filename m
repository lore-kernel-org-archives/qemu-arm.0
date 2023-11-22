Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533019ejx;
        Wed, 22 Nov 2023 10:31:18 -0800 (PST)
X-Received: by 2002:a05:600c:3555:b0:40b:351b:fcc2 with SMTP id i21-20020a05600c355500b0040b351bfcc2mr122214wmq.19.1700677878277;
        Wed, 22 Nov 2023 10:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677878; cv=none;
        d=google.com; s=arc-20160816;
        b=Hftpec+4NVbc4qgkKQFhhhFDIT5n1h2Dq3qe34fTRPUioAzKjH7n+yDytcbWnypdcT
         +Sf2BYbAYQLhP0ZXLRu2WUPWoDujaswnEk5DICgu8xHMfKjdqG/UakpcHr7xy5YE3cIe
         cglte0qJcybFSakOSS8QyR4VDAbyKHTGoBYrtzhMZZVbtydT58h0skzDJIXRqi/Iwdv6
         ZO8oKInSMAaIJCDviXWhLzRwrRPOqibaDUPvsHabLq7FnNvO8xmaJX+4mpGAGtyjGe9g
         8PwwMCiH2ubprbZtnUhtLEenDrZXJUcuklqd2S0Ci8w2MaL+C2kMQi4/4KAVbaQClLxl
         DM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=emiroLvN4ZFzV0iGKy2RcqyAnliELrYGvZjH5AAzbJU=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=Gv+lR4NOc4bZaXN7eQutSVtViYhuX0F/JI6dZU3KRGELDTv0PaCioTSyGX6eCtTZ9c
         DD/2p8TQNKRo70ur4pFlyYHNhdw8Kd4KvgEJiCyABR1jYVKqYjBrh1ATAHWnvwAIU7jf
         pPWYxUg9NphGMqNRlqpeqfCy6LfIqN03e0s+zLIbvV+D2ClcJO6tmLBNXsd535RkdvYY
         aAvuX7Lmjbn8BtrL+FKrvsEuQ8Z5cj5etqx+sJuAopUT9wiJeZnIet1d2WxJ4oCuenPv
         s5mU9P/JBZxZaYf8SdQmrnHk7+tvzqnoJD/t797b2IyVh4uMTxROAg0I3JPpZNVhzdFx
         O+gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lafbPDlX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 11-20020a05600c028b00b0040788f225e6sor24078wmk.12.2023.11.22.10.31.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lafbPDlX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677878; x=1701282678; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emiroLvN4ZFzV0iGKy2RcqyAnliELrYGvZjH5AAzbJU=;
        b=lafbPDlXhEijQSISX8u91N7hhgVFZtiqt4udOhlwXXQXnnMAt7/tAlsnJrctoBFqoE
         NU/r94kJRsXdlDDYKxHHS5l2WD7xNucaIqlJJV9X/fpZ8G20nY4SYPdzHjVXT8lCdLGx
         LzdIEbYyK1acZZ7qIE2oIwvzI5OMDOFDFc8cYLCYacWuW5CBYlDoXw1A80LoblHco8RG
         QybPUuL9rtO8UGVS0CSmq+/CIawhQK4ne299uMdzOPyLDo5HsVL6ZTwwpmavQLp09rQH
         qeaShFvxrbQ7lWVAgqap6x6T5Y1MKKQEt0RhlJ2Bif/KiwSyzJaDpJhJm1CpzB8HB/l/
         4sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677878; x=1701282678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emiroLvN4ZFzV0iGKy2RcqyAnliELrYGvZjH5AAzbJU=;
        b=OQAD5sgOSqoQhGn6urOi6kHIVoblMd3kg79wBKFmejrAuCUhOQdTt/W7rWnUHUIwWv
         Ik0CAoSRwzlyVesRQfWXk1XsyEGSnBb6BN62839ueYT9xj54ClPbLAQY7RXRfWhXTZlu
         BHkUUpdbwwBG/kM2tHxTW/bpk653ZHfG5KZRUwzwlqupe6XDq+QvlfOtSQMXDAtezHFE
         +Ap+jfFA56GVMZRjK084j8RMARXOqQxFtXOI4e6VYA5tUFKj/4ZAloNqk9ptPrMQsatT
         9rJfp8Ipf1mhkDtmWbza4a69vJkH7ese5hIiwOMR6INZMZ8bBYRJKFvdJJOpA0VeoOXo
         nHQw==
X-Gm-Message-State: AOJu0YyMblKl+VUa4D83aX8aZkr0uQwssZdNV7PjPv399u4DhLVIvzKQ
	NBE/UwkGU+Dwx1n1H447Ikde8tZvXgCMiTcCfm6Zng==
X-Google-Smtp-Source: AGHT+IFNMJbi2etXsf890GglUiuNpOGjNqWpIB4o2PtsfSGyJ5b4d+uqJysxjW5ginkWipADtZqyPw==
X-Received: by 2002:adf:cc82:0:b0:331:6976:c8c7 with SMTP id p2-20020adfcc82000000b003316976c8c7mr2198011wrj.38.1700677877918;
        Wed, 22 Nov 2023 10:31:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d6903000000b0032da49e18fasm66146wru.23.2023.11.22.10.31.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-9.0 05/11] target/arm: Move GTIMER definitions to 'cpu-defs.h'
Date: Wed, 22 Nov 2023 19:30:41 +0100
Message-ID: <20231122183048.17150-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E4lHx8aRWc7M

To allow GTIMER_* definitions to be used by non-ARM specific
hardware models, move them to a new target agnostic "cpu-defs.h"
header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-defs.h | 19 +++++++++++++++++++
 target/arm/cpu.h      |  8 +-------
 hw/arm/bcm2836.c      |  1 +
 3 files changed, 21 insertions(+), 7 deletions(-)
 create mode 100644 target/arm/cpu-defs.h

diff --git a/target/arm/cpu-defs.h b/target/arm/cpu-defs.h
new file mode 100644
index 0000000000..1ad76aff14
--- /dev/null
+++ b/target/arm/cpu-defs.h
@@ -0,0 +1,19 @@
+/*
+ * ARM "target agnostic" CPU definitions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef ARM_CPU_DEFS_H
+#define ARM_CPU_DEFS_H
+
+#define GTIMER_PHYS     0
+#define GTIMER_VIRT     1
+#define GTIMER_HYP      2
+#define GTIMER_SEC      3
+#define GTIMER_HYPVIRT  4
+#define NUM_GTIMERS     5
+
+#endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 124d829742..8107e4d446 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -24,6 +24,7 @@
 #include "qemu/cpu-float.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
+#include "target/arm/cpu-defs.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
 
@@ -154,13 +155,6 @@ typedef struct ARMGenericTimer {
     uint64_t ctl; /* Timer Control register */
 } ARMGenericTimer;
 
-#define GTIMER_PHYS     0
-#define GTIMER_VIRT     1
-#define GTIMER_HYP      2
-#define GTIMER_SEC      3
-#define GTIMER_HYPVIRT  4
-#define NUM_GTIMERS     5
-
 #define VTCR_NSW (1u << 29)
 #define VTCR_NSA (1u << 30)
 #define VSTCR_SW VTCR_NSW
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 166dc896c0..6986b71cb4 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -15,6 +15,7 @@
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
+#include "target/arm/cpu-defs.h"
 
 struct BCM283XClass {
     /*< private >*/
-- 
2.41.0
