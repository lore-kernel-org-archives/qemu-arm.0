Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d17e3sm64258435e9.5.2024.11.21.08.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B509B604F0;
	Thu, 21 Nov 2024 16:58:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 36/39] plugins: detect qemu plugin API symbols from header
Date: Thu, 21 Nov 2024 16:58:03 +0000
Message-Id: <20241121165806.476008-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q+Ben+wmCR6D

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Instead of using a static file (error prone and hard to keep in sync),
we generate it using a script.

Note: if a symbol is not exported, we'll now notice it when linking for
Windows/MacOS platforms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20241112212622.3590693-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                    |  1 +
 plugins/meson.build            | 12 ++++++---
 scripts/qemu-plugin-symbols.py | 45 ++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100755 scripts/qemu-plugin-symbols.py

diff --git a/MAINTAINERS b/MAINTAINERS
index eb7149bf1a..2b1c4abed6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3752,6 +3752,7 @@ F: plugins/
 F: tests/tcg/plugins/
 F: tests/functional/test_aarch64_tcg_plugins.py
 F: contrib/plugins/
+F: scripts/qemu-plugin-symbols.py
 
 AArch64 TCG target
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/plugins/meson.build b/plugins/meson.build
index 1cc039d29b..98542e926f 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,17 +2,23 @@ if not get_option('plugins')
   subdir_done()
 endif
 
+qemu_plugin_symbols = configure_file(
+  input: files('../include/qemu/qemu-plugin.h'),
+  output: 'qemu-plugin.symbols',
+  capture: true,
+  command: [files('../scripts/qemu-plugin-symbols.py'), '@INPUT@'])
+
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if host_os == 'darwin'
     configure_file(
-      input: files('qemu-plugins.symbols'),
+      input: qemu_plugin_symbols,
       output: 'qemu-plugins-ld64.symbols',
       capture: true,
       command: ['sed', '-ne', 's/^[[:space:]]*\\(qemu_.*\\);/_\\1/p', '@INPUT@'])
     emulator_link_args += ['-Wl,-exported_symbols_list,plugins/qemu-plugins-ld64.symbols']
   else
-    emulator_link_args += ['-Xlinker', '--dynamic-list=' + (meson.project_source_root() / 'plugins/qemu-plugins.symbols')]
+    emulator_link_args += ['-Xlinker', '--dynamic-list=' + qemu_plugin_symbols.full_path()]
   endif
 endif
 
@@ -23,7 +29,7 @@ if host_os == 'windows'
   # First, create a .def file listing all the symbols a plugin should expect to have
   # available in qemu
   win32_plugin_def = configure_file(
-    input: files('qemu-plugins.symbols'),
+    input: qemu_plugin_symbols,
     output: 'qemu_plugin_api.def',
     capture: true,
     command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
diff --git a/scripts/qemu-plugin-symbols.py b/scripts/qemu-plugin-symbols.py
new file mode 100755
index 0000000000..e285ebb8f9
--- /dev/null
+++ b/scripts/qemu-plugin-symbols.py
@@ -0,0 +1,45 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+#
+# Extract QEMU Plugin API symbols from a header file
+#
+# Copyright 2024 Linaro Ltd
+#
+# Author: Pierrick Bouvier <pierrick.bouvier@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import argparse
+import re
+
+def extract_symbols(plugin_header):
+    with open(plugin_header) as file:
+        content = file.read()
+    # Remove QEMU_PLUGIN_API macro definition.
+    content = content.replace('#define QEMU_PLUGIN_API', '')
+    expected = content.count('QEMU_PLUGIN_API')
+    # Find last word between QEMU_PLUGIN_API and (, matching on several lines.
+    # We use *? non-greedy quantifier.
+    syms = re.findall(r'QEMU_PLUGIN_API.*?(\w+)\s*\(', content, re.DOTALL)
+    syms.sort()
+    # Ensure we found as many symbols as API markers.
+    assert len(syms) == expected
+    return syms
+
+def main() -> None:
+    parser = argparse.ArgumentParser(description='Extract QEMU plugin symbols')
+    parser.add_argument('plugin_header', help='Path to QEMU plugin header.')
+    args = parser.parse_args()
+
+    syms = extract_symbols(args.plugin_header)
+
+    print('{')
+    for s in syms:
+        print("  {};".format(s))
+    print('};')
+
+if __name__ == '__main__':
+    main()
-- 
2.39.5
