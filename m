Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D96DCCA470
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:05:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hC-0006oE-IX; Wed, 01 Oct 2025 22:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48hA-0006nr-DX
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:25 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48gu-0004pN-8c
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:23 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b5d80f5a23eso1368276a12.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370703; x=1759975503; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5uAT3E/Kg+tLMQ6sh6TKZYgCxOSeXpVcn46MFwOuYCs=;
 b=MJJmEkHI0cUF5OBDK9x4x20vyf+5AuJDMIZnHWCjUBrFW/uysVbpbfVyj/EYRa11Uc
 8fvHha6WWtK7w4wUv66tAGHgh7vvAaHu89Nx3eMAF6Jy3QhTt2zTLyw05E63Bf9eBAwj
 9UruV6piEYgPxXI4MDjf7dUxLQ8wi9OcMiyaXhz0rVCYmiICJr/ldItGaMKuGS6b90zj
 h3ijyBR5p3vKG0AmNoXl3M1gxRyyyXjaEM+UfalEqmK2iVo2seb+2GpRvbTLfjEZulPE
 YCPRhX5eg9GHOap1ijNnnM0uaXvR6RVXMrjc0LLY8UUoSVomE7kWUhuEq4dT5+jjs71d
 Z1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370703; x=1759975503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5uAT3E/Kg+tLMQ6sh6TKZYgCxOSeXpVcn46MFwOuYCs=;
 b=gHaioZj5Sh2O5JkDQ0CA/HhahvwKpLppQu3Uaol3hwO0kv7nFhJIx+Kl98gcBnGvQ7
 0O7IKflKEAr13XcROeGuPVyhHOiTXvawyYSkDigBatNPIHhIcpzHzpDDppn1YvLN/wYs
 RVy8mkijcxnz2gJSrhU94lrtqRhRleCVF2P1ksoCPwY9r7JFG4RdX6///XI7SaaBvM4C
 6364A0T3iblwMk0RTr8D3WiKsLes+FRkRvZVGFTZlrB5dIqHpRvyKKvyIvnwf5uOoBHL
 RJhiRWqCxZ5TIq2gPe4vlWsSKgKFjCieKLRR3y+bg3/aeqSjIr0GjHc1XeZIA2z4gyVd
 kYXw==
X-Gm-Message-State: AOJu0YyZfyU1zbWESw0z0AltNtQcg9FIJE8nkxuxeOUcINgc1S02PsEA
 mVDZO5s3put3hrVDsKZNpWgaoGnybof7jfWH5OvXu0VRXZf4dEUbSKvtmpnvAfZ2EAY=
X-Gm-Gg: ASbGncsFYpqqizjPCyM5rst10SP5kCZy6urG/Rh1Gm6WnbAkx+eXcaow01sefMS1HiP
 fMmrNNXY0oK7KD2WIdYBtFXOmYtyPWf/k4MuSxvOKj669rtXa9HZfo5cLYOg5IiU483ejCrmiHB
 lsB3LoowJk68b9M19vR0K2CKT/kwfVA3kVga2CWcSuTJhCCmQ7a2vddVCUseU5Hwi4Bk7ZWtCOS
 InbKPHesXAORqypdzLmHruJsA3L0mV76zIki7KnA1tf02bX8ubOatL+JTHk1JvNwP/3kY5rzkcg
 zKIhXrBAp5E0Mk106nKdcsH5URO5JfV9YEwycRNPUDHRldtpaanbmmhNYRLkT7c4uyMeuKgD26p
 2MPCGycDAXZHOxgCRXnf8PSOWbEisUZrwojj+U3z6krtJMzGb4deRBdiCXTKYyz64LYA=
X-Google-Smtp-Source: AGHT+IEKosOT0oxwORek+RzgMxvBeBwXw7xTc63LUvRgecNlDLdEXpxVa9SLa1xiQO6IYkGfw/CQxg==
X-Received: by 2002:a17:903:3d05:b0:262:f975:fcba with SMTP id
 d9443c01a7336-28e8d040b78mr15780655ad.9.1759370703536; 
 Wed, 01 Oct 2025 19:05:03 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:05:03 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 4/9] tests/functional: Add GDB class
Date: Thu,  2 Oct 2025 02:04:27 +0000
Message-Id: <20251002020432.54443-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add GDB class, which provides methods to run GDB commands and capture
their output. The GDB class is a wrapper around the pygdbmi module and
interacts with GDB via GDB's machine interface (MI).

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/qemu_test/__init__.py |  1 +
 tests/functional/qemu_test/gdb.py      | 88 ++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 tests/functional/qemu_test/gdb.py

diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
index 6e666a059f..60d19891bf 100644
--- a/tests/functional/qemu_test/__init__.py
+++ b/tests/functional/qemu_test/__init__.py
@@ -18,3 +18,4 @@
     skipIfMissingImports, skipIfOperatingSystem, skipLockedMemoryTest
 from .archive import archive_extract
 from .uncompress import uncompress
+from .gdb import GDB
diff --git a/tests/functional/qemu_test/gdb.py b/tests/functional/qemu_test/gdb.py
new file mode 100644
index 0000000000..05e4c29c2a
--- /dev/null
+++ b/tests/functional/qemu_test/gdb.py
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# A simple interface module built around pygdbmi for handling GDB commands.
+#
+# Copyright (c) 2025 Linaro Limited
+#
+# Author:
+#  Gustavo Romero <gustavo.romero@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import re
+
+
+class GDB:
+    """Provides methods to run and capture GDB command output."""
+
+
+    def __init__(self, gdb_path, echo=True, suffix='# ', prompt="$ "):
+        from pygdbmi.gdbcontroller import GdbController
+        from pygdbmi.constants import GdbTimeoutError
+        type(self).TimeoutError = GdbTimeoutError
+
+        gdb_cmd = [gdb_path, "-q", "--interpreter=mi2"]
+        self.gdbmi = GdbController(gdb_cmd)
+        self.echo = echo
+        self.suffix = suffix
+        self.prompt = prompt
+        self.response = None
+        self.cmd_output = None
+
+
+    def get_payload(self, response, kind):
+        output = []
+        for o in response:
+            # Unpack payloads of the same type.
+            _type, _, payload, *_ = o.values()
+            if _type == kind:
+                output += [payload]
+
+        # Some output lines do not end with \n but begin with it,
+        # so remove the leading \n and merge them with the next line
+        # that ends with \n.
+        lines = [line.lstrip('\n') for line in output]
+        lines = "".join(lines)
+        lines = lines.splitlines(keepends=True)
+
+        return lines
+
+
+    def cli(self, cmd, timeout=32.0):
+        self.response = self.gdbmi.write(cmd, timeout_sec=timeout)
+        self.cmd_output = self.get_payload(self.response, kind="console")
+        if self.echo:
+            print(self.suffix + self.prompt + cmd)
+
+            if len(self.cmd_output) > 0:
+                cmd_output = self.suffix.join(self.cmd_output)
+                print(self.suffix + cmd_output, end="")
+
+        return self
+
+
+    def get_addr(self):
+        address_pattern = r"0x[0-9A-Fa-f]+"
+        cmd_output = "".join(self.cmd_output) # Concat output lines.
+
+        match = re.search(address_pattern, cmd_output)
+
+        return int(match[0], 16) if match else None
+
+
+    def get_log(self):
+        r = self.get_payload(self.response, kind="log")
+        r = "".join(r)
+
+        return r
+
+
+    def get_console(self):
+        r = "".join(self.cmd_output)
+
+        return r
+
+
+    def exit(self):
+        self.gdbmi.exit()
-- 
2.34.1


