Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4294637wrv;
        Mon, 15 Jul 2019 08:23:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxL0atNd6i4E8+mLOX95WnFq+EUbvEA5TBueokZQRWz4zJfWTvJJdak+gO/zEDQ5ej0492U
X-Received: by 2002:a37:9c94:: with SMTP id f142mr15365638qke.427.1563204196219;
        Mon, 15 Jul 2019 08:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563204196; cv=none;
        d=google.com; s=arc-20160816;
        b=AshSXDAFIGd84Mp53cgraDiwJe0ZS+IQ72OpCi1K+OiGekI0yL0PgFH1yxK9Ev9Pb5
         FT53L/4Xh4B8oTKf/yG6k7HuApno05hHbwQrnUUlaJ8rbhL60NL/iOUdU5CSNlLg67fG
         MI71MnO/0gYLtZr7HTACJLSZ3O46RwDK5kfmzNh6LfCLAkiR3zwC0Q//2zqbA4D6fnv6
         N2MKPQ8ZiHYLcWzCDV8CmXewBVMwjfB+OomqK4VDXhwTJMJ+0N41E1EsDVAUwu5r7/zh
         ng5fCMkSfjC8VDG8JgHdjBsKY2GSM6Rqvey7V4xtH/QOwTGEEfkMBAVr/NMczaXBamkC
         y67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=C5Qb8Gq7MlRLS8phxCEPQPbw5XthHYxlY1o8BEHHZfs=;
        b=fDSK8wbg+nXVU8DmOW3jszuasa8vxTJKBsanqiIL9q+Ea633OZbj0WAuiOI9rJjh9s
         8Czgr4p2ERmiSY6oDPICLutwHQU5FmfQyQxRjpjEQfEWG05ZMGoZBlZjcDOPy8EyFWOB
         di382VVxlgITYjZGw80jPOaaUp0bayJAbLLrNNRCXL0TrlVa4w4HGJeUXWwGTzkzqsdW
         0OeEYaZIk9+yOdBeFBbUep1MZ62AUTyZ8ztbrphrolQE37035FQxy+1psNKgX15mcAuR
         ZymNMbsO8CSzRj7XeCbtydXzx8/E8sRlE8Mt7mazC6npm29DJQKVVGBHA1C053+e/2L8
         ioJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 48si12127488qvf.103.2019.07.15.08.23.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA401C057F3D;
	Mon, 15 Jul 2019 15:23:14 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEA5A608C6;
	Mon, 15 Jul 2019 15:23:08 +0000 (UTC)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH-for-4.1? v2 5/5] target/mips: Add stubs to build with CONFIG_SEMIHOSTING disabled
Date: Mon, 15 Jul 2019 17:22:25 +0200
Message-Id: <20190715152225.26135-6-philmd@redhat.com>
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
References: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 15 Jul 2019 15:23:14 +0000 (UTC)
X-TUID: QjrDO4DfP+dE

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
 default-configs/mips-softmmu-common.mak |  2 +-
 target/mips/Makefile.objs               |  3 ++-
 target/mips/mips-semi-stubs.c           | 22 ++++++++++++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 target/mips/mips-semi-stubs.c

diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
index da29c6c0b2..08fa16191f 100644
--- a/default-configs/mips-softmmu-common.mak
+++ b/default-configs/mips-softmmu-common.mak
@@ -1,6 +1,6 @@
 # Common mips*-softmmu CONFIG defines
 
-# CONFIG_SEMIHOSTING is always required on this architecture
+# CONFIG_SEMIHOSTING is probably not required on KVM only builds
 CONFIG_SEMIHOSTING=y
 
 CONFIG_ISA_BUS=y
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
index 0000000000..b1d3f88edc
--- /dev/null
+++ b/target/mips/mips-semi-stubs.c
@@ -0,0 +1,22 @@
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
+#include "exec/helper-proto.h"
+
+void helper_do_semihosting(CPUMIPSState *env)
+{
+    g_assert_not_reached();
+}
-- 
2.20.1
