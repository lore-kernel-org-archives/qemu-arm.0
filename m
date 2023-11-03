Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p12-20020adfe60c000000b0032d886039easm2608287wrm.14.2023.11.03.12.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:00:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5461F65746;
	Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 07/29] tests/avocado: update the tcg_plugins test
Date: Fri,  3 Nov 2023 19:59:34 +0000
Message-Id: <20231103195956.1998255-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S8P+gC6bcxOJ

There are a number of things that are broken on the test currently so
lets fix that up:

  - replace retired Debian kernel for tuxrun_baseline one
  - remove "detected repeat instructions test" since ea185a55
  - log total counted instructions/memory accesses

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tcg_plugins.py | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 642d2e49e3..15fd87b2c1 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -54,13 +54,11 @@ def run_vm(self, kernel_path, kernel_command_line,
 class PluginKernelNormal(PluginKernelBase):
 
     def _grab_aarch64_kernel(self):
-        kernel_url = ('http://security.debian.org/'
-                      'debian-security/pool/updates/main/l/linux-signed-arm64/'
-                      'linux-image-4.19.0-12-arm64_4.19.152-1_arm64.deb')
-        kernel_sha1 = '2036c2792f80ac9c4ccaae742b2e0a28385b6010'
-        kernel_deb = self.fetch_asset(kernel_url, asset_hash=kernel_sha1)
-        kernel_path = self.extract_from_deb(kernel_deb,
-                                            "/boot/vmlinuz-4.19.0-12-arm64")
+        kernel_url = ('https://storage.tuxboot.com/20230331/arm64/Image')
+        kernel_sha256 = 'ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7'
+        kernel_path = self.fetch_asset(kernel_url,
+                                       asset_hash=kernel_sha256,
+                                       algorithm = "sha256")
         return kernel_path
 
     def test_aarch64_virt_insn(self):
@@ -88,6 +86,10 @@ def test_aarch64_virt_insn(self):
             m = re.search(br"insns: (?P<count>\d+)", s)
             if "count" not in m.groupdict():
                 self.fail("Failed to find instruction count")
+            else:
+                count = int(m.group("count"))
+                self.log.info(f"Counted: {count} instructions")
+
 
     def test_aarch64_virt_insn_icount(self):
         """
@@ -111,9 +113,13 @@ def test_aarch64_virt_insn_icount(self):
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
-            m = re.search(br"detected repeat execution @ (?P<addr>0x[0-9A-Fa-f]+)", s)
-            if m is not None and "addr" in m.groupdict():
-                self.fail("detected repeated instructions")
+
+            m = re.search(br"insns: (?P<count>\d+)", s)
+            if "count" not in m.groupdict():
+                self.fail("Failed to find instruction count")
+            else:
+                count = int(m.group("count"))
+                self.log.info(f"Counted: {count} instructions")
 
     def test_aarch64_virt_mem_icount(self):
         """
@@ -145,3 +151,5 @@ def test_aarch64_virt_mem_icount(self):
                 callback = int(m[1])
                 if inline != callback:
                     self.fail("mismatched access counts")
+                else:
+                    self.log.info(f"Counted {inline} memory accesses")
-- 
2.39.2
