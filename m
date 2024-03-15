Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989487eju;
        Fri, 15 Mar 2024 06:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoVe/31zw6RWWMz2qPvdeVbeH6VkARPNRQIcCneyi9Wf+cZicbJEbCBZ/ft1DqYpZVElAOTTBwLgy0CfvfWb77TnSeGRTs
X-Received: by 2002:a17:906:f24c:b0:a45:a889:d853 with SMTP id gy12-20020a170906f24c00b00a45a889d853mr1918677ejb.12.1710508215534;
        Fri, 15 Mar 2024 06:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508215; cv=none;
        d=google.com; s=arc-20160816;
        b=SaK/9BnG/9ea6gz/8DiMVZjiU73u7uhOzsL2jj701pDRateTQrTvLLr03gFtZIfeLI
         DGLsMq93W60MLdw3w9PyMh0GHtQrXkKRrKKsgtEqMeZsuOsPwReUsMTwPLq3+UV1QedO
         8dXJFJwHGNjCIa8J1d64LdDyAJ1VsO7SfVqBYHFOJ5ym5X1bDni8YGj8/p5M4Jz3ZSeV
         iIrjHa1xKFBvzCrsWV805l4vAYHrAuUxHp4/XYZ7bBLZfQgYro+Leh+ZjHSGHk0kHMdV
         UdzrgnNJ1FwC6IXvzfH/y7vNoI7dEahixZmztBFsJqHtUWtBKQUhDysYuQMDZmyXd1sO
         egLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=501a0naqlbNKu8avIdgSMPglnIX/rNjXROgIt46X+30=;
        fh=+okKgw62hi9XyKpuWu0sFz7IFNUIYSlfDD+AocoBgP4=;
        b=ntA8NrBlewHKVHiBpqy83ql5lMOIcJhi/WjutjbBcNUzaqVO3QkpclcMJ1DCIHvoV4
         2F8uTCx/gYX/VJiVD9gVTFABZy7Y/ZjEQkVTRlVOxgDBilTS/7E7+wwvwYaRhAP2Rd9D
         mFebe3t3WQGUl2Ey0fLsuOUXIgh7nVBhjq4bZN/lWO2z9KKLEavJ08Kyh98ssc4UTeHZ
         hg8oqDUdP4dfDBCc8WVRjU4FeI53H+pbSak2DI5shMqyeExMVa2jgvLA30YHbHdShy1B
         PvmzOFY8ekaA3fy0n2Da7XEBgF54C/GzRe1Yz3ynSyph1CDv8wpeK/gbZt5fQivbk0DA
         Tocw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M52gsAX6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g12-20020a17090613cc00b00a4634e4ebe9sor1318913ejc.18.2024.03.15.06.10.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M52gsAX6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508215; x=1711113015; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=501a0naqlbNKu8avIdgSMPglnIX/rNjXROgIt46X+30=;
        b=M52gsAX6L+Y1IzGiCNAIIn3qOgEJgtZGrd+avarYEk0ZB3Jj6fjy/MCn8RIJP8qpUy
         OjcyOVKX8+oye9o8BUASS1AA7GUsUJarty1872eJsBKZd0MkZosxZWm0JZfx2sCK4Dvc
         Z5zN9I8V9wnIivNR1I5EomcADp+KF3HAxBdRadDYlxmisky+GydEOaBZyh4QLbhuUYuK
         LPdNRAID52KO6z6cQw19BQdfqxRshQBY6JxuTu+NJhvSk+17ciDZ7FIKu3Wa5ElJai+U
         eLTqXAhogImIr4CkPn8AYvNDU5U67h79saJLV5jN/qJ7UjzJz/k71ELQoo8deMgpH96N
         juBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508215; x=1711113015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=501a0naqlbNKu8avIdgSMPglnIX/rNjXROgIt46X+30=;
        b=TnUrkZVJvhyNwM8e/nQa6SSt7KvaBqcYXYRPja6nRnL3bH5FRuKeKwY+y2PR0TFEtb
         QwQxA7NqzbBblCDTwpGgmz546nFt923y1XkxOtbsW9vJzP0S6mvtjU4y+OcwM5lwHxsU
         pyvG5g/N0qwDNdqC7Yvj/lWstgOBwp/vh3GUxasCUMHY2EPZ+MiMKsV5band9JNNJ6Hv
         dBr/Pc6Ar3JWt3h61lVcWIi0iu45TSOUB1fDXELh8Yvb5JseOZvvYMsF9UVaXA/ac2B5
         2OdUp1vORDdMx6qTJwhLSmqC6G5Ta4pkxJzEjXg2nrex9uCkmiojxpEJUsqhWwLxgDrp
         6B6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpVh7cTPmvFePSeF1u8Ca9dZYUkXCKvYiNCIEmJNaPxdwE/CANjI5mBXGMS7zbvwPqEGXcz4JlSlI0mkqhNsnXyJ1xrSqp
X-Gm-Message-State: AOJu0YxW42RrSKz9VwI+dJ/B1VVp8yJP3IzFetbEoMTLQf7Yo1KXswxI
	9gZx0pvF06WcXxhOK2XcHte6Bp0TSVmRtYftZYG6+69IC7BEfjoxV2A3v+FpZsl17Q==
X-Google-Smtp-Source: AGHT+IFXUOZ0DXU9TFe7eErBIR0hjw1JRtYP9W4z0ySb0FEWd+FLxscB84jJYmFd0YaJKmhT8vL6Mw==
X-Received: by 2002:a17:906:2655:b0:a46:2a47:6f4c with SMTP id i21-20020a170906265500b00a462a476f4cmr1311867ejc.60.1710508215147;
        Fri, 15 Mar 2024 06:10:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id gq25-20020a170906e25900b00a453123b111sm1698649ejb.120.2024.03.15.06.10.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eric Blake <eblake@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH-for-9.1 09/21] qapi: Merge machine-common.json with qapi/machine.json
Date: Fri, 15 Mar 2024 14:08:57 +0100
Message-ID: <20240315130910.15750-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +15jnoEKNmOH

machine-common.json declares a single type, which isn't
restricted to a particular target. Move this type in
machine.json.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS              |  1 -
 qapi/machine-common.json | 21 ---------------------
 qapi/machine-target.json |  2 +-
 qapi/machine.json        | 13 ++++++++++++-
 qapi/qapi-schema.json    |  1 -
 target/s390x/cpu.h       |  2 +-
 qapi/meson.build         |  1 -
 7 files changed, 14 insertions(+), 27 deletions(-)
 delete mode 100644 qapi/machine-common.json

diff --git a/MAINTAINERS b/MAINTAINERS
index a3130f64fd..ed98814398 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1889,7 +1889,6 @@ F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
 F: qapi/machine.json
-F: qapi/machine-common.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
diff --git a/qapi/machine-common.json b/qapi/machine-common.json
deleted file mode 100644
index fa6bd71d12..0000000000
--- a/qapi/machine-common.json
+++ /dev/null
@@ -1,21 +0,0 @@
-# -*- Mode: Python -*-
-# vim: filetype=python
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or later.
-# See the COPYING file in the top-level directory.
-
-##
-# = Machines S390 data types
-##
-
-##
-# @CpuS390Entitlement:
-#
-# An enumeration of CPU entitlements that can be assumed by a virtual
-# S390 CPU
-#
-# Since: 8.2
-##
-{ 'enum': 'CpuS390Entitlement',
-  'prefix': 'S390_CPU_ENTITLEMENT',
-  'data': [ 'auto', 'low', 'medium', 'high' ] }
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 519adf3220..5f17b25d50 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -4,7 +4,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
-{ 'include': 'machine-common.json' }
+{ 'include': 'machine.json' }
 
 ##
 # @CpuModelInfo:
diff --git a/qapi/machine.json b/qapi/machine.json
index bb5a178909..4bc38e86fd 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -9,7 +9,6 @@
 ##
 
 { 'include': 'common.json' }
-{ 'include': 'machine-common.json' }
 
 ##
 # @SysEmuTarget:
@@ -50,6 +49,18 @@
   'prefix': 'S390_CPU_STATE',
   'data': [ 'uninitialized', 'stopped', 'check-stop', 'operating', 'load' ] }
 
+##
+# @CpuS390Entitlement:
+#
+# An enumeration of CPU entitlements that can be assumed by a virtual
+# S390 CPU
+#
+# Since: 8.2
+##
+{ 'enum': 'CpuS390Entitlement',
+  'prefix': 'S390_CPU_ENTITLEMENT',
+  'data': [ 'auto', 'low', 'medium', 'high' ] }
+
 ##
 # @CpuInfoS390:
 #
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 8304d45625..2c82a49bae 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -67,7 +67,6 @@
 { 'include': 'introspect.json' }
 { 'include': 'qom.json' }
 { 'include': 'qdev.json' }
-{ 'include': 'machine-common.json' }
 { 'include': 'machine.json' }
 { 'include': 'machine-target.json' }
 { 'include': 'replay.json' }
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 43a46a5a06..b46339bd7c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -29,7 +29,7 @@
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
-#include "qapi/qapi-types-machine-common.h"
+#include "qapi/qapi-types-machine.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
diff --git a/qapi/meson.build b/qapi/meson.build
index 375d564277..90047dae1c 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -37,7 +37,6 @@ qapi_all_modules = [
   'error',
   'introspect',
   'job',
-  'machine-common',
   'machine',
   'machine-target',
   'migration',
-- 
2.41.0
