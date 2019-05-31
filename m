Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp818747pjq;
        Fri, 31 May 2019 08:48:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2qANwrxV4qwQ64ycffIHHgNfg/6M0M9L8r6VzFT3yNIQUcF+pKXcjICtSFstocRtcKVm6
X-Received: by 2002:aca:a889:: with SMTP id r131mr650944oie.152.1559317683785;
        Fri, 31 May 2019 08:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559317683; cv=none;
        d=google.com; s=arc-20160816;
        b=yiM3c5mAcFPa50BBx3lmsQIsdLDCtNLUhmHOFLCLvx4sU0GpJb4dhRB+/rPMb06z62
         F/43GfiSlvdekphSxgHb4uyqko105AZiIyJHi6w27/GnskiwFULKHv2xrvBTGo8zfxhd
         CVmXyTptFPLHhUGvelN1NJhMfh/OG/asDyb+W9MUGpmE96Vnjka6m3qNHBK6rviY4cgm
         bNURosm70GyczibTx2dQ1XqePcB78QDY6fb+P+WvvmpICDhX02yEfONoViEx73ZZ3wIb
         3iGKMg9K7ceSZf/L5wYaPAfA0NfoPOfenHg/xWanEz00sBUGnKFXEAggUg+fpak96WHI
         b+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=BvuHKeR6OJ5Fn+kMoqTOdEB0qGxD5qG0HoXPO/u4czc=;
        b=0Jt587wTwrBkrvtg+y2Iymrf9CdxQMBMLn8bFh8PmeJfo5bXp7ExulN0lbyzaAuliJ
         gEHjZCefu6grtG+OhutkVksFmoYDMduDgbj7KeFwUNhfKumX1aKclwLRc4jxdfhCRU1X
         BDh86B6na3M2tR6Tiejh6N7D5zI8tpNc+ueWYYNu5nIZ+iV0eDXqZwXg3lNECByhLNwo
         NCBlPE1DLeV+Bd7cGJtIpboD/PdRAYQV2xVg8gvP4mvHBv5GsXCm/ZF2s7ek3LWlHgAY
         Qq+L+p1EKD+WZ5G6pyAZVrA9M5NdxRUtuGoDHf0VTBa3yiSxugSEeT57KWUBjw6L+MuY
         +OuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a6si3493728otr.160.2019.05.31.08.48.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 08:48:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0619B80B3F;
	Fri, 31 May 2019 15:47:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-73.brq.redhat.com [10.40.204.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5DC310027B8;
	Fri, 31 May 2019 15:47:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Miroslav Rezanina <mrezanin@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 1/2] target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled
Date: Fri, 31 May 2019 17:47:34 +0200
Message-Id: <20190531154735.20809-2-philmd@redhat.com>
In-Reply-To: <20190531154735.20809-1-philmd@redhat.com>
References: <20190531154735.20809-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 31 May 2019 15:47:59 +0000 (UTC)
X-TUID: /bbO98Fbmd3E

If a distribution wants to build QEMU without semihosting support,
it currently gets this build failure:

  $ ./configure --target-list=aarch64-softmmu --without-default-devices
  $ sed -i s/CONFIG_SEMIHOSTING=y/CONFIG_SEMIHOSTING=n/ default-configs/arm-softmmu.mak
  $ make subdir-aarch64-softmmu
  [...]
    LINK    aarch64-softmmu/qemu-system-aarch64
  /usr/bin/ld: target/arm/arm-semi.o: in function `do_arm_semihosting':
  ./target/arm/arm-semi.c:321: undefined reference to `qemu_semihosting_console_out'
  /usr/bin/ld: ./target/arm/arm-semi.c:318: undefined reference to `qemu_semihosting_console_out'
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:204: qemu-system-aarch64] Error 1
  make: *** [Makefile:472: subdir-aarch64-softmmu] Error 2

Fix it by providing a stub when semihosting is disabled.

Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/Makefile.objs    |  3 ++-
 target/arm/arm-semi-stubs.c | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/arm-semi-stubs.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 6bdcc65c2c..39b02b1fa4 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,4 +1,5 @@
-obj-y += arm-semi.o
+obj-$(CONFIG_SEMIHOSTING) += arm-semi.o
+obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += arm-semi-stubs.o
 obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
diff --git a/target/arm/arm-semi-stubs.c b/target/arm/arm-semi-stubs.c
new file mode 100644
index 0000000000..a91ecbd9d5
--- /dev/null
+++ b/target/arm/arm-semi-stubs.c
@@ -0,0 +1,21 @@
+/*
+ *  Arm "Angel" semihosting stubs
+ *
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+target_ulong do_arm_semihosting(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
-- 
2.20.1
