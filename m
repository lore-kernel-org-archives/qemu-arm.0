Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad902e2sm520163766b.146.2024.07.29.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC9615FA08;
	Mon, 29 Jul 2024 15:44:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Song Gao <gaosong@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 08/14] tests/avocado: remove tcg_plugins virt_mem_icount test
Date: Mon, 29 Jul 2024 15:44:08 +0100
Message-Id: <20240729144414.830369-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cR5ytRoKhKm0

Since 4f8d886085 (tests/plugin/mem: migrate to new per_vcpu API) this
test was skipping due to not being able to run callback and inline
memory instrumentation at the same time.

However b480f7a621 (tests/plugin: add test plugin for inline
operations) tests for all this matching up so we don't need the
additional complexity in avocado.

Remove the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: 4f8d886085
---
 tests/avocado/tcg_plugins.py | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 15fd87b2c1..a930fca2c0 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -120,36 +120,3 @@ def test_aarch64_virt_insn_icount(self):
             else:
                 count = int(m.group("count"))
                 self.log.info(f"Counted: {count} instructions")
-
-    def test_aarch64_virt_mem_icount(self):
-        """
-        :avocado: tags=accel:tcg
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
-        """
-        kernel_path = self._grab_aarch64_kernel()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0')
-        console_pattern = 'Kernel panic - not syncing: VFS:'
-
-        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", prefix="plugin",
-                                                 suffix=".log")
-
-        self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libmem.so,inline=true,callback=true", plugin_log.name,
-                    console_pattern,
-                    args=('-icount', 'shift=1'))
-
-        with plugin_log as lf, \
-             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
-            m = re.findall(br"mem accesses: (?P<count>\d+)", s)
-            if m is None or len(m) != 2:
-                self.fail("no memory access counts found")
-            else:
-                inline = int(m[0])
-                callback = int(m[1])
-                if inline != callback:
-                    self.fail("mismatched access counts")
-                else:
-                    self.log.info(f"Counted {inline} memory accesses")
-- 
2.39.2
