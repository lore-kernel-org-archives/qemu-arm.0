Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6355sm324467166b.37.2024.10.22.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:56:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ECA855FC11;
	Tue, 22 Oct 2024 11:56:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	devel@lists.libvirt.org,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH v2 15/20] testing: Enhance gdb probe script
Date: Tue, 22 Oct 2024 11:56:09 +0100
Message-Id: <20241022105614.839199-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022105614.839199-1-alex.bennee@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HaI5Bi1IwDA8

From: Gustavo Romero <gustavo.romero@linaro.org>

Use list and set comprehension to simplify code. Also, gently handle
invalid gdb filenames.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Message-Id: <20241015145848.387281-1-gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/probe-gdb-support.py | 75 +++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 36 deletions(-)

diff --git a/scripts/probe-gdb-support.py b/scripts/probe-gdb-support.py
index 6dc58d06c7..6bcadce150 100644
--- a/scripts/probe-gdb-support.py
+++ b/scripts/probe-gdb-support.py
@@ -19,58 +19,61 @@
 
 import argparse
 import re
-from subprocess import check_output, STDOUT
+from subprocess import check_output, STDOUT, CalledProcessError
+import sys
 
-# mappings from gdb arch to QEMU target
-mappings = {
-    "alpha" : "alpha",
+# Mappings from gdb arch to QEMU target
+MAP = {
+    "alpha" : ["alpha"],
     "aarch64" : ["aarch64", "aarch64_be"],
-    "armv7": "arm",
+    "armv7": ["arm"],
     "armv8-a" : ["aarch64", "aarch64_be"],
-    "avr" : "avr",
+    "avr" : ["avr"],
     # no hexagon in upstream gdb
-    "hppa1.0" : "hppa",
-    "i386" : "i386",
-    "i386:x86-64" : "x86_64",
-    "Loongarch64" : "loongarch64",
-    "m68k" : "m68k",
-    "MicroBlaze" : "microblaze",
+    "hppa1.0" : ["hppa"],
+    "i386" : ["i386"],
+    "i386:x86-64" : ["x86_64"],
+    "Loongarch64" : ["loongarch64"],
+    "m68k" : ["m68k"],
+    "MicroBlaze" : ["microblaze"],
     "mips:isa64" : ["mips64", "mips64el"],
-    "or1k" : "or1k",
-    "powerpc:common" : "ppc",
+    "or1k" : ["or1k"],
+    "powerpc:common" : ["ppc"],
     "powerpc:common64" : ["ppc64", "ppc64le"],
-    "riscv:rv32" : "riscv32",
-    "riscv:rv64" : "riscv64",
-    "s390:64-bit" : "s390x",
+    "riscv:rv32" : ["riscv32"],
+    "riscv:rv64" : ["riscv64"],
+    "s390:64-bit" : ["s390x"],
     "sh4" : ["sh4", "sh4eb"],
-    "sparc": "sparc",
-    "sparc:v8plus": "sparc32plus",
-    "sparc:v9a" : "sparc64",
+    "sparc": ["sparc"],
+    "sparc:v8plus": ["sparc32plus"],
+    "sparc:v9a" : ["sparc64"],
     # no tricore in upstream gdb
     "xtensa" : ["xtensa", "xtensaeb"]
 }
 
+
 def do_probe(gdb):
-    gdb_out = check_output([gdb,
-                            "-ex", "set architecture",
-                            "-ex", "quit"], stderr=STDOUT)
+    try:
+        gdb_out = check_output([gdb,
+                               "-ex", "set architecture",
+                               "-ex", "quit"], stderr=STDOUT, encoding="utf-8")
+    except (OSError) as e:
+        sys.exit(e)
+    except CalledProcessError as e:
+        sys.exit(f'{e}. Output:\n\n{e.output}')
+
+    found_gdb_archs = re.search(r'Valid arguments are (.*)', gdb_out)
 
-    m = re.search(r"Valid arguments are (.*)",
-                  gdb_out.decode("utf-8"))
+    targets = set()
+    if found_gdb_archs:
+        gdb_archs = found_gdb_archs.group(1).split(", ")
+        mapped_gdb_archs = [arch for arch in gdb_archs if arch in MAP]
 
-    valid_arches = set()
+        targets = {target for arch in mapped_gdb_archs for target in MAP[arch]}
 
-    if m.group(1):
-        for arch in m.group(1).split(", "):
-            if arch in mappings:
-                mapping = mappings[arch]
-                if isinstance(mapping, str):
-                    valid_arches.add(mapping)
-                else:
-                    for entry in mapping:
-                        valid_arches.add(entry)
+    # QEMU targets
+    return targets
 
-    return valid_arches
 
 def main() -> None:
     parser = argparse.ArgumentParser(description='Probe GDB Architectures')
-- 
2.39.5
