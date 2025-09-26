Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A5CAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 05:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v20p4-0004pN-JE; Fri, 26 Sep 2025 01:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20oq-0004jy-VN
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:33 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20oh-00060N-Ly
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:31 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-27d69771e3eso15166075ad.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 22:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758863777; x=1759468577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UmMZ8OavtJPqXFVQhgzCSfktwxUsbE5ixRVmorJ3R6E=;
 b=JVJsKNYs+rb99/2j+xBjBX+BIyrdsm1S//8gaXce3axo6pFjAkarkRHTMKufnecNWH
 4yjIq/HwMYpMdIR0Mtf4aLIKWvb2se2JaQqkYtfHwoPGeoc4kfx/xqfpErVtKaSYlHbM
 QQlkEbdLP/cl2lqGE/5Uty8GFJQxo7B2uVgefifECehbcPP0xAez5iKBxjDCHEmV1YmH
 VBhYloqHM67FjY1/JpBu0J55kybXRFLdoxbokFSovgfVOQf6GzyCR625SU7loE/DWOAg
 I15KP7n4NX63hzJbbJUYvOTr/c++DMaQZzzBdSJ4PVY77tyztruSLwW16v9MqcoAZy0+
 A/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758863777; x=1759468577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UmMZ8OavtJPqXFVQhgzCSfktwxUsbE5ixRVmorJ3R6E=;
 b=b/GN2gMEJ6XwRXpqomOWZ1M/v4moHJ/bUiN5dMkPoqikT4UW+D2w11NML6gyrxjJI1
 FziyS6Ia/uPtEzqjg5R9yVDmV/iN7sgur7Yqp8Dvjp7WOTV3mYceEegwGO0r/RtuI738
 z2P9sEYTtB3Mf5/QJZLI0jWhQOejBNSTyUobYcmA7RIHW3iIbxHnW9SS4JzJgLW18FPe
 FNvDi3gDDqZI0qJ737jwx0W9LfKVNSOPDjlQtsPAu7TxzuuMjwOrcRDWql5nK+JEtsN3
 QjnPugWsZWRzdu1DCVI+yJ5dyOsWz69Nyjw2VhgaCmMgv/c7zqIChVa1HE2lb5kO7a9V
 qPKA==
X-Gm-Message-State: AOJu0YzNlw9Hbin7BvMe99oWuxInmtz6/PhEPPfBrfW3JgoRR/lf8U8w
 6h9CLa7VVySBfvrRd8CrLLzGlu9ZMOP1i3+Z6uW6ZxGuSVfMuE52bUiHhpbkygr3uEI=
X-Gm-Gg: ASbGncv436EDxSLRxo8EUOARRimnyOf18V1E0Vx0Ra4m2WGubCUJvymmu0+qgxZT80W
 sTWHWJDhxIhB6vYwgyjtGPwSXDmhud879kHZsCooOoeB2FMNmbmqGt9BC9OAXreufvAiVxmHk9k
 uTnXpEtf52jqeiIvAcOD+GGmZDpqaLBSpFOwhgwRbwrYpc2pVqIxR80T6OxOD1MDlOAhUiOifyf
 yGZrhfjgRFfg/C6Cqhpem7v7Cv8d8eOrZp6CBDv1RIzEgno4WnOozoM4rz0tMJg8RZfuZ9DQldb
 2gBFEkmX0dDiCKyQF57Ov/99gAriS6iy7ZNn+AVcyB0ZRkPM5PsCfDO9GJFMnNalWtVqTrHV6WN
 SVd8W8JFiARCLmsnwpgerGatNu6nzU1WRRrG4atw3Gdbouu4905Iwr3CTug==
X-Google-Smtp-Source: AGHT+IGz4CBWZEb5vkf9iuGypfPBXgcL/HApohmU/5SkQ2nu/NBWVYVaPmgYZwfxo/lXEN08sDH5tg==
X-Received: by 2002:a17:902:d60d:b0:269:8edf:67f8 with SMTP id
 d9443c01a7336-27ed4ab6084mr65626315ad.52.1758863777412; 
 Thu, 25 Sep 2025 22:16:17 -0700 (PDT)
Received: from gromero0.. (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed672a51fsm42160085ad.63.2025.09.25.22.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 22:16:17 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v4 4/9] tests/functional: Add GDB class
Date: Fri, 26 Sep 2025 05:15:37 +0000
Message-Id: <20250926051542.104432-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926051542.104432-1-gustavo.romero@linaro.org>
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add GDB class, which provides methods to run and capture GDB command
output. The GDB class is a wrapper around the pygdbmi module and
interacts with GDB via GDB's machine interface (MI).

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/qemu_test/__init__.py |  1 +
 tests/functional/qemu_test/gdb.py      | 85 ++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)
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
index 0000000000..15eb5eca18
--- /dev/null
+++ b/tests/functional/qemu_test/gdb.py
@@ -0,0 +1,85 @@
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
+from pygdbmi.gdbcontroller import GdbController
+
+
+class GDB:
+    """Provides methods to run and capture GDB command output."""
+
+
+    def __init__(self, gdb_path, echo=True, suffix='# ', prompt="$ "):
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
+    def cli(self, cmd, timeout=4.0):
+        self.response = self.gdbmi.write(cmd, timeout_sec=timeout)
+        self.cmd_output = self.get_payload(self.response, "console")
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


