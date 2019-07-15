Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4294515wrv;
        Mon, 15 Jul 2019 08:23:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHbeHfCjOeIqDCSGoPUkMspepUFcApPYM1UnDOgEG5YO0X/uZafu96BVDD/Ujx2yuvbs1m
X-Received: by 2002:a37:9185:: with SMTP id t127mr17339180qkd.482.1563204188894;
        Mon, 15 Jul 2019 08:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563204188; cv=none;
        d=google.com; s=arc-20160816;
        b=x9eA2llff2oqFuSnM+u+HN5Hn+ndFow9imJrq9GBHEUbDPTKmCngAjwLDTPx7ELGTD
         mP0IVBiE5xrHQOrbwl5QAqUjcvOH4yTsRkddN+6RORLXEFZKMbh1gDWelXoumzWWPIDu
         T2s4V5AOtOAUOYp3RoL2CEkAlIjD6YGSjVxsuLCtIT0ONFh8EDb2tVdQMgnmuI8KNGDm
         vFZ6v1rcqiYfgUf4No5946I/JqhaBr34sdihQN8waBhXZIUUARH13dVchIN4DAm47N0R
         ts+nUrv+7xu/nX0cmU0XhaBynQl6Vg3DO9A8BaUXpFrx79ky27WccE3d5f0ghrU5IgWw
         J8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=qbGqI0EQJ3rZ5AkVdDFgKEzUWNNrqXgFF7qItjOx5r0=;
        b=miArAiJpnS74SzeFqKWLPg/7oBv5AXSVBhrNKJWPKFSl0tY42XHmANpG9P6e3KwLAg
         JGi3cmhc2BMP4QqQkPKy6eL7OTuNAv3uG5yltShYKD95SGGORImfRRDDzXEsD1f8jygG
         14gQiikWmO77IM7gGDTD3tkJEYzNUyMqRVDKIu7HJrmo3pA0PK/aGe0q7dOUZ8LSys3r
         GjZAp9Pq+/QEclibsrmieNSqf1DVPuV4GuMJQuPJj8cbkF5BLOqai1pyVdpNDHCJAjOQ
         uqo0ricKKvlelwrdBg7hTLAmZUefX+hnw1CtdqnOAbD0yUjy1U5iANK2k3U6uRgQsQFd
         a/aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l7si10174584qkg.304.2019.07.15.08.23.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1910307D851;
	Mon, 15 Jul 2019 15:23:07 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53539608E4;
	Mon, 15 Jul 2019 15:22:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	James Hogan <jhogan@kernel.org>,
	qemu-arm@nongnu.org,
	James Hogan <james.hogan@mips.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Miroslav Rezanina <mrezanin@redhat.com>
Subject: [RFC PATCH-for-4.1? v2 4/5] target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled
Date: Mon, 15 Jul 2019 17:22:24 +0200
Message-Id: <20190715152225.26135-5-philmd@redhat.com>
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
References: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 15 Jul 2019 15:23:08 +0000 (UTC)
X-TUID: Bfh77ni5rFMJ

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
 default-configs/arm-softmmu.mak |  2 +-
 target/arm/Makefile.objs        |  3 ++-
 target/arm/arm-semi-stubs.c     | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/arm-semi-stubs.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ad2debf543..bf34bcb137 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,6 +1,6 @@
 # Default configuration for arm-softmmu
 
-# CONFIG_SEMIHOSTING is always required on this architecture
+# CONFIG_SEMIHOSTING is not required on KVM only builds
 CONFIG_SEMIHOSTING=y
 
 # TODO: ARM_V7M is currently always required - make this more flexible!
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 5cafc1eb6c..4afaf82bbe 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,4 +1,5 @@
-obj-$(CONFIG_TCG) += arm-semi.o
+obj-$(CONFIG_SEMIHOSTING) += arm-semi.o
+obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += arm-semi-stubs.o
 obj-y += helper.o vfp_helper.o
 obj-y += cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
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
