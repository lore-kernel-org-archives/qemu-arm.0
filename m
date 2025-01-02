Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9641005njk;
        Thu, 2 Jan 2025 08:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVnEFsnjt+p8slsAcG+wJwcT7Nv8U6d7zcf23fsVV0pka7dXbNTXAUj4w+CamH1uZvqzxSRdo2rICRz6A==@linaro.org
X-Received: by 2002:a05:6000:1787:b0:386:3c21:b1ff with SMTP id ffacd0b85a97d-38a2240ffc3mr34246602f8f.58.1735833913439;
        Thu, 02 Jan 2025 08:05:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735833913; cv=none;
        d=google.com; s=arc-20240605;
        b=Wpb78XuByKEujILeBTIsW7AiYfxnJYk6+RUiVtlmceB+UxxKrfh+uDRRtc2G056Vuj
         OZCkcImst7J5JPHrxk8n+bFlX0+SPquXs84czjr9S+C2zJOHJvC2Ot/lfBSMcrEN+tDx
         pEZlWQjkUkdAWTHi31fcPHTRPkez7TpWlqBDq3Oy6TRdy0AeQO+M4Zqf5MoNuBXt2gGV
         M5F/AOW5RQFov7qC7sXvqUUV8zBI+dcdOwxTA3wokfd3blmdMQqul2Z4XMPgS4+IcocK
         A+OkuhJas0ki4+C3YPwSQRcEl4bANSQ+KmF2mIBgfmkAT6iFgu4FyMZcK3nqygx9Vji6
         coaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=PiUug7+4DxBb4pdRj/4Nl+w548jCnQIvB94kNaUutoY=;
        fh=wrnrhmCGWZd0T4+9+RALVTlHzT7XvAdfnSnxKte9fys=;
        b=k0XS2W9c7w8HfrF/DcDSZmgRih/cxmc9tXtC9rnB6cSDFRJlouwUcLx5qwXQl5Gvjd
         EiWbaZH/NygSBtLtloKJ/Q5z/GOHwWqDywZN6kyLjoIkdSKCt3RVOApBGWH+SzF0wbTE
         97FNfIbu0YSLTHbUzAp6C1Bxm24EAX3jt+mcxYuckhBYUgSQtpV2K1WvS+mN8Z5mTk6V
         rtB2zaJUpDjU93sx86PGg8rVZuz/9+GeHawaM+5Of5OcDKnBV/JLahstJkTLk4UbHykK
         sxEeoVlrhOzyaRLMB/vp/VJG6ID0TuP4nLnexjrlXeUUwzR3cGn2CQhXegBS3oqGp1t1
         5k+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hyyy1IGp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c7c67a6sor9209600f8f.0.2025.01.02.08.05.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 08:05:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hyyy1IGp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735833913; x=1736438713; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PiUug7+4DxBb4pdRj/4Nl+w548jCnQIvB94kNaUutoY=;
        b=hyyy1IGpgo8cCnYlgO7ompWosDgadeYxE9KUY9scz7ohY2Y9oXwMWIumyJVO+P4Brm
         zNUyj6rh/xHBE9arXiSML1J/4/QsYRHDuZONmaA7Y2XMTJPUt/vEa+woVmCUNdt2o9Bl
         J8LsVNNUs6l5xfHXtApnjDq+EyrzkD+SypxVoDCwcA3V5kRjn2Q8FJpjTt9vbwP/+0Zn
         mncdlQ/EB7rKRA2qbZ7fQE7qOkIc0gVhtxkfb/MmBtiRvSEc7GxuV/qSQzOt6aglVqTq
         8KA9or7N5SAghRvRtZLBr1CfAF6T2lbADOiqnNuIE4tIuvis8ZMXo3QtgB9O7+Ut9w5l
         gsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735833913; x=1736438713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiUug7+4DxBb4pdRj/4Nl+w548jCnQIvB94kNaUutoY=;
        b=uj/8Vg65FQfEXIvwhcebpglajOfrz8t8XPI2B7txCF2oplH8SkyQCPLTigeLEvMbeK
         ns4rMOYvK9CFQvxk1OunS6X8Xj++IffvG1Lv3fynoz/2jLtHK0bVer5CgJBzGTxF2GSE
         x2fnXlGmc+h1g/w+BP2o/BGo1ADARTrjxu4AZm/ENRC0xTVby4XjBClJALDngIRhfr8G
         zqGFq+ETkDXsdQlfyhSAoFPsQPBzxaA8owncxHF3AZ53mCW5A3gH2rflfaqzuh2dw4YT
         +t1gwWJ26agqnkDEG5XNxEIQXiQSR0kFp8LR0VG4EX8VgvVwu3nNj+SgaYEZgGOLRYvE
         0HLg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Qa3+66xm57SFbHrt9Qjcq4ezPtc8Iw37ow25Q1q9H13Ft3E0+Bl2JTVWmTca61lFEPJTDvuJpv52bQ==@linaro.org
X-Gm-Message-State: AOJu0Yzxu2T8w6Xkza0TO0rgyaYKVMZO/rW8yUyXn+zs1hJBynxCae4j
	IBNzcqALBLfG/KXJK1HSNeRzRC5A7XdwrSt4UROQgUpKh725dNqpZMYPFPMl6kZ9yA==
X-Gm-Gg: ASbGncv6Zot1GcOCHnNP2RABM+5HgA76XPxzGxbq/AuxeYtTyzDHuocNOTh/DakTRhr
	zPLFf6O6uEXgJPTTM8TPdWsUjUXqQ/QbQ7uOaWvsnWTizor16g/MJ8osMVanWfi6V4B5pta8GF8
	E1L6K2Et/22hGzy0Mw2Upxw2fa5hzoevAjRNMRSpckdD04x0u7ThlSw+RU+RTfU01csXRJPeh7X
	LApzE6usrCl9027Y1s9x0UJubHQzcofPbj/NI+u07Fcs8y8y7NrIDMP98cPxOH4E+5OhCy/Xwui
	zq5fXuz9toVD0jWa0dwT3KARstI/W1g=
X-Google-Smtp-Source: AGHT+IEDrpBjhuHk7vjn+GbtnxTgRx3zhNgCzxzKnUjWtLS57lurCPZsIhhQShgu6pTmTIFYRAN0SQ==
X-Received: by 2002:a5d:64cf:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38a221f6746mr41758718f8f.16.1735833912737;
        Thu, 02 Jan 2025 08:05:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b053e91sm518395495e9.1.2025.01.02.08.05.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jan 2025 08:05:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Cleber Rosa <crosa@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	mzamazal@redhat.com,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	John Snow <jsnow@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] licenses: Remove SPDX tags not being license identifier for Linaro
Date: Thu,  2 Jan 2025 17:05:10 +0100
Message-ID: <20250102160510.61894-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nlkEAEl9/Shy

Per [*]:

  "we're only interested in adopting SPDX for recording the
  licensing info, [not] any other SPDX metadata."

Replace the 'SPDX-FileCopyrightText' and 'SPDX-FileContributor'
tags added by Linaro by 'Copyright (c)' and 'Authors' words
respectively.

[*] https://lore.kernel.org/qemu-devel/20241007154548.1144961-4-berrange@redhat.com/

Inspired-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/vcpu-state.h                           | 9 +++++++--
 include/hw/misc/ivshmem-flat.h                   | 5 +++--
 hw/misc/ivshmem-flat.c                           | 5 +++--
 target/m68k/semihosting-stub.c                   | 7 +++++--
 target/mips/tcg/system/semihosting-stub.c        | 5 +++--
 tests/qtest/libqos/virtio-scmi.c                 | 2 +-
 scripts/qom-cast-macro-clean-cocci-gen.py        | 7 +++++--
 tests/functional/test_aarch64_sbsaref.py         | 8 +++++---
 tests/functional/test_aarch64_sbsaref_alpine.py  | 8 +++++---
 tests/functional/test_aarch64_sbsaref_freebsd.py | 8 +++++---
 10 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/accel/tcg/vcpu-state.h b/accel/tcg/vcpu-state.h
index e407d914dfd..2e3464b5eef 100644
--- a/accel/tcg/vcpu-state.h
+++ b/accel/tcg/vcpu-state.h
@@ -1,6 +1,11 @@
 /*
- * SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
- * SPDX-FileCopyrightText: 2023 Linaro Ltd.
+ * TaskState helpers for QEMU
+ *
+ * Copyright (c) 2023 Linaro Ltd.
+ *
+ * Authors:
+ *   Philippe Mathieu-Daudé
+ *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #ifndef ACCEL_TCG_VCPU_STATE_H
diff --git a/include/hw/misc/ivshmem-flat.h b/include/hw/misc/ivshmem-flat.h
index 97ca0ddce61..0c2b0157812 100644
--- a/include/hw/misc/ivshmem-flat.h
+++ b/include/hw/misc/ivshmem-flat.h
@@ -1,9 +1,10 @@
 /*
  * Inter-VM Shared Memory Flat Device
  *
- * SPDX-FileCopyrightText: 2023 Linaro Ltd.
- * SPDX-FileContributor: Gustavo Romero <gustavo.romero@linaro.org>
  * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2023 Linaro Ltd.
+ * Authors:
+ *   Gustavo Romero
  *
  */
 
diff --git a/hw/misc/ivshmem-flat.c b/hw/misc/ivshmem-flat.c
index 33fc9425d20..40309a8ff38 100644
--- a/hw/misc/ivshmem-flat.c
+++ b/hw/misc/ivshmem-flat.c
@@ -1,9 +1,10 @@
 /*
  * Inter-VM Shared Memory Flat Device
  *
- * SPDX-FileCopyrightText: 2023 Linaro Ltd.
- * SPDX-FileContributor: Gustavo Romero <gustavo.romero@linaro.org>
  * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2023 Linaro Ltd.
+ * Authors:
+ *   Gustavo Romero
  *
  */
 
diff --git a/target/m68k/semihosting-stub.c b/target/m68k/semihosting-stub.c
index d6a5965e29c..dbe669cc5f6 100644
--- a/target/m68k/semihosting-stub.c
+++ b/target/m68k/semihosting-stub.c
@@ -1,8 +1,11 @@
 /*
  *  m68k/ColdFire semihosting stub
  *
- * SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
- * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ * Copyright (c) 2024 Linaro Ltd.
+ *
+ * Authors:
+ *   Philippe Mathieu-Daudé
+ *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
diff --git a/target/mips/tcg/system/semihosting-stub.c b/target/mips/tcg/system/semihosting-stub.c
index 7ae27d746f8..bb1f7aae624 100644
--- a/target/mips/tcg/system/semihosting-stub.c
+++ b/target/mips/tcg/system/semihosting-stub.c
@@ -1,9 +1,10 @@
 /*
  *  MIPS semihosting stub
  *
- * SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
- * SPDX-FileCopyrightText: 2024 Linaro Ltd.
  * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) 2024 Linaro Ltd.
+ * Authors:
+ *   Philippe Mathieu-Daudé
  */
 
 #include "qemu/osdep.h"
diff --git a/tests/qtest/libqos/virtio-scmi.c b/tests/qtest/libqos/virtio-scmi.c
index ce8f4d5c06e..6b5bd4db42f 100644
--- a/tests/qtest/libqos/virtio-scmi.c
+++ b/tests/qtest/libqos/virtio-scmi.c
@@ -1,7 +1,7 @@
 /*
  * virtio-scmi nodes for testing
  *
- * SPDX-FileCopyrightText: Linaro Ltd
+ * Copyright (c) Linaro Ltd.
  * SPDX-FileCopyrightText: Red Hat, Inc.
  * SPDX-License-Identifier: GPL-2.0-or-later
  *
diff --git a/scripts/qom-cast-macro-clean-cocci-gen.py b/scripts/qom-cast-macro-clean-cocci-gen.py
index 2fa8438a146..5aa51d0c18e 100644
--- a/scripts/qom-cast-macro-clean-cocci-gen.py
+++ b/scripts/qom-cast-macro-clean-cocci-gen.py
@@ -13,8 +13,11 @@
 #           --in-place \
 #           --dir .
 #
-# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
-# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Authors:
+#   Philippe Mathieu-Daudé
+#
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import re
diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
index 99cfb6f29a4..e6a55aecfac 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -2,9 +2,11 @@
 #
 # Functional test that boots a kernel and checks the console
 #
-# SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
-# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
-# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+# Copyright (c) 2023-2024 Linaro Ltd.
+#
+# Authors:
+#   Philippe Mathieu-Daudé
+#   Marcin Juszkiewicz
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
diff --git a/tests/functional/test_aarch64_sbsaref_alpine.py b/tests/functional/test_aarch64_sbsaref_alpine.py
index 6dbc90f30ee..9faf066d183 100755
--- a/tests/functional/test_aarch64_sbsaref_alpine.py
+++ b/tests/functional/test_aarch64_sbsaref_alpine.py
@@ -2,9 +2,11 @@
 #
 # Functional test that boots a kernel and checks the console
 #
-# SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
-# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
-# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+# Copyright (c) 2023-2024 Linaro Ltd.
+#
+# Authors:
+#   Philippe Mathieu-Daudé
+#   Marcin Juszkiewicz
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
diff --git a/tests/functional/test_aarch64_sbsaref_freebsd.py b/tests/functional/test_aarch64_sbsaref_freebsd.py
index 77ba2ba1daf..8dcb4991c31 100755
--- a/tests/functional/test_aarch64_sbsaref_freebsd.py
+++ b/tests/functional/test_aarch64_sbsaref_freebsd.py
@@ -2,9 +2,11 @@
 #
 # Functional test that boots a kernel and checks the console
 #
-# SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
-# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
-# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+# Copyright (c) 2023-2024 Linaro Ltd.
+#
+# Authors:
+#   Philippe Mathieu-Daudé
+#   Marcin Juszkiewicz
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-- 
2.47.1
