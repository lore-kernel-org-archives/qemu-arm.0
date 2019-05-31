Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp818837pjq;
        Fri, 31 May 2019 08:48:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsMdXPcbpVde1vAGNkstlex4MSTlq1BLRp8amSOvjsx/WiMqV+AMBUBVSf/0/N2F3Uplwz
X-Received: by 2002:a9d:5781:: with SMTP id q1mr2403898oth.86.1559317687876;
        Fri, 31 May 2019 08:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559317687; cv=none;
        d=google.com; s=arc-20160816;
        b=GQ2ec5HLliNO9vS+M+660Q7jErhD1IyiSWGYyCvvouHyPplHIOAMXh+qpoLcYzZ87J
         J9R8NaArLxZjgvVNJ0tFNy3ADStt521fVhzN+52C0qxv1E1zbh8zyeEZQgvE2Hi/uuU6
         qXDoC2LKHOLVOn8DKE01Q0GcNHFo6f16izdp8FnafaHo0J4ReAZhIVrn+5PTEs04Ckz7
         SRjvMl2wYEgPkaTmWebhCr6pBpPRMTpASB/F5zOI8XdBBoHo7YZjQ0hhwvvdKnRZjBgh
         QNKHSXSvnGDt0neyCACpeyL2V2qV02k4+z4MQg1wLTDu5LaRFiuA0BnPJ204zxmbEj7w
         /GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PwfAiJLGoD1gubWwUXUC9YayoF9Si3j4268OjDIsg20=;
        b=ZfEiC0aVWqeCbo+Qv11NXvfVZ5Ak4r3VHVOGNsD+ZH3bXgN9G4c6WNm5AG0KRZ/rdP
         hFhscKSRrYz5BeqEU5kvHWbI36kdsahaodIE95nbt6hqkvjsy4PN6YnnE/HAXKICTWNc
         z51iMQDDxc6AN3hVQqbWgH3kgb7/0u9QC9KOn6Ww0URXKTrUIJqhhFdZ617l9CvkD8U9
         rlQuqKp0/XmgMr4LxBuQFDb21qnLuKGReCW4i8/R3Jvyulf8fewZ5VFnQS2un5owxR7H
         nafdRbKVymUcslzy8MY8mEia6fobRX379iJk8VjDn9q7SWy4VHw1/ZP/pvS7qxBl//Ra
         Knbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c10si3312003otp.319.2019.05.31.08.48.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 08:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F5467E43D;
	Fri, 31 May 2019 15:48:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-73.brq.redhat.com [10.40.204.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDB151001E6F;
	Fri, 31 May 2019 15:47:58 +0000 (UTC)
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
Subject: [RFC PATCH 2/2] target/mips: Add stubs to build with CONFIG_SEMIHOSTING disabled
Date: Fri, 31 May 2019 17:47:35 +0200
Message-Id: <20190531154735.20809-3-philmd@redhat.com>
In-Reply-To: <20190531154735.20809-1-philmd@redhat.com>
References: <20190531154735.20809-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 31 May 2019 15:48:07 +0000 (UTC)
X-TUID: oNhJY4fi4gYN

If a distribution wants to build QEMU without semihosting support,
it currently gets this build failure:

  $ ./configure --target-list=mips64el-softmmu --without-default-devices
  $ sed -i s/CONFIG_SEMIHOSTING=y/CONFIG_SEMIHOSTING=n/ default-configs/mips-softmmu-common.mak
  $ make subdir-mips64el-softmmu
  [...]
    LINK    mips64el-softmmu/qemu-system-mips64el
  /usr/bin/ld: target/mips/mips-semi.o: in function `helper_do_semihosting':
  ./target/mips/mips-semi.c:335: undefined reference to `qemu_semihosting_log_out'
  /usr/bin/ld: ./target/mips/mips-semi.c:338: undefined reference to `qemu_semihosting_log_out'
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:204: qemu-system-mips64el] Error 1
  make: *** [Makefile:472: subdir-mips64el-softmmu] Error 2

Fix it by providing a stub when semihosting is disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
checkpatch ERROR: externs should be avoided in .c files
---
 target/mips/Makefile.objs     |  3 ++-
 target/mips/mips-semi-stubs.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 target/mips/mips-semi-stubs.c

diff --git a/target/mips/Makefile.objs b/target/mips/Makefile.objs
index 3448ad5e19..3f4d566a35 100644
--- a/target/mips/Makefile.objs
+++ b/target/mips/Makefile.objs
@@ -1,5 +1,6 @@
 obj-y += translate.o dsp_helper.o op_helper.o lmi_helper.o helper.o cpu.o
 obj-y += gdbstub.o msa_helper.o
-obj-$(CONFIG_SOFTMMU) += mips-semi.o
+obj-$(CONFIG_SEMIHOSTING) += mips-semi.o
+obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += mips-semi-stubs.o
 obj-$(CONFIG_SOFTMMU) += machine.o cp0_timer.o
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/target/mips/mips-semi-stubs.c b/target/mips/mips-semi-stubs.c
new file mode 100644
index 0000000000..f5b13b9153
--- /dev/null
+++ b/target/mips/mips-semi-stubs.c
@@ -0,0 +1,23 @@
+/*
+ * Unified Hosting Interface syscalls stubs
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
+extern void helper_do_semihosting(CPUMIPSState *env);
+
+void helper_do_semihosting(CPUMIPSState *env)
+{
+    g_assert_not_reached();
+}
-- 
2.20.1
