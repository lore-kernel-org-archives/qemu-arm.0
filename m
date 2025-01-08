Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm6642217f8f.87.2025.01.08.04.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:18:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6FD665FBAC;
	Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-riscv@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <lvivier@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 19/32] tests/functional: add zstd support to uncompress utility
Date: Wed,  8 Jan 2025 12:10:41 +0000
Message-Id: <20250108121054.1126164-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Dy0+keZe+uQe

Rather than using the python library (which has a different API
anyway) lets just call the binary. zstdtools is already in out
qemu.yml so all test containers should have it around. Tests should
still use @skipIfMissingCommands('zstd') to gracefully handle when
only minimal dependencies have been installed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - add chmod step to helper
  - also handle .zst extension
---
 tests/functional/qemu_test/uncompress.py | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/functional/qemu_test/uncompress.py b/tests/functional/qemu_test/uncompress.py
index 6d02ded066..911d74ec23 100644
--- a/tests/functional/qemu_test/uncompress.py
+++ b/tests/functional/qemu_test/uncompress.py
@@ -10,8 +10,10 @@
 import gzip
 import lzma
 import os
+import stat
 import shutil
 from urllib.parse import urlparse
+from subprocess import check_call, CalledProcessError
 
 from .asset import Asset
 
@@ -38,6 +40,24 @@ def lzma_uncompress(xz_path, output_path):
             os.remove(output_path)
             raise
 
+
+def zstd_uncompress(zstd_path, output_path):
+    if os.path.exists(output_path):
+        return
+
+    try:
+        check_call(['zstd', "-f", "-d", zstd_path,
+                    "-o", output_path])
+    except CalledProcessError as e:
+        os.remove(output_path)
+        raise Exception(
+            f"Unable to decompress zstd file {zstd_path} with {e}") from e
+
+    # zstd copies source archive permissions for the output
+    # file, so must make this writable for QEMU
+    os.chmod(output_path, stat.S_IRUSR | stat.S_IWUSR)
+
+
 '''
 @params compressed: filename, Asset, or file-like object to uncompress
 @params uncompressed: filename to uncompress into
@@ -59,6 +79,8 @@ def uncompress(compressed, uncompressed, format=None):
         lzma_uncompress(str(compressed), uncompressed)
     elif format == "gz":
         gzip_uncompress(str(compressed), uncompressed)
+    elif format == "zstd":
+        zstd_uncompress(str(compressed), uncompressed)
     else:
         raise Exception(f"Unknown compression format {format}")
 
@@ -79,5 +101,9 @@ def guess_uncompress_format(compressed):
         return "xz"
     elif ext == ".gz":
         return "gz"
+    elif ext == ".zstd":
+        return "zstd"
+    elif ext == ".zst":
+        return "zstd"
     else:
         raise Exception(f"Unknown compression format for {compressed}")
-- 
2.39.5
