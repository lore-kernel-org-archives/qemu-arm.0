Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d838csm323114066b.8.2024.10.22.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:56:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D97B25FC0F;
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
Subject: [PATCH v2 14/20] tests/tcg/aarch64: Use raw strings for regexes in test-mte.py
Date: Tue, 22 Oct 2024 11:56:08 +0100
Message-Id: <20241022105614.839199-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022105614.839199-1-alex.bennee@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kQmHWE0wPl/w

From: Gustavo Romero <gustavo.romero@linaro.org>

Use Python's raw string notation instead of string literals for regex so
it's not necessary to double backslashes when regex special forms are
used. Raw notation is preferred for regex and easier to read.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20241015140806.385449-1-gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/gdbstub/test-mte.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/aarch64/gdbstub/test-mte.py b/tests/tcg/aarch64/gdbstub/test-mte.py
index a4cae6caa0..9ad98e7a54 100644
--- a/tests/tcg/aarch64/gdbstub/test-mte.py
+++ b/tests/tcg/aarch64/gdbstub/test-mte.py
@@ -23,8 +23,8 @@
 from test_gdbstub import arg_parser, main, report
 
 
-PATTERN_0 = "Memory tags for address 0x[0-9a-f]+ match \\(0x[0-9a-f]+\\)."
-PATTERN_1 = ".*(0x[0-9a-f]+)"
+PATTERN_0 = r"Memory tags for address 0x[0-9a-f]+ match \(0x[0-9a-f]+\)."
+PATTERN_1 = r".*(0x[0-9a-f]+)"
 
 
 def run_test():
-- 
2.39.5
