Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e22c6dsm18890045e9.41.2025.01.08.04.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:18:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6CC5060030;
	Wed,  8 Jan 2025 12:10:57 +0000 (GMT)
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
Subject: [PATCH v4 29/32] tests/vm: allow interactive login as root
Date: Wed,  8 Jan 2025 12:10:51 +0000
Message-Id: <20250108121054.1126164-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CSPK/V/hZtcr

This is useful when debugging and you want to add packages to an
image.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 3 ++-
 tests/vm/basevm.py        | 9 +++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index d80ca79a28..14188bba1c 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -66,6 +66,7 @@ endif
 	@echo "Special variables:"
 	@echo "    BUILD_TARGET=foo              - Override the build target"
 	@echo "    DEBUG=1                       - Enable verbose output on host and interactive debugging"
+	@echo "    ROOT_USER=1                   - Login as root user for interactive shell"
 	@echo '    EXTRA_CONFIGURE_OPTS="..."    - Pass to configure step'
 	@echo "    J=[0..9]*                     - Override the -jN parameter for make commands"
 	@echo "    LOG_CONSOLE=1                 - Log console to file in: ~/.cache/qemu-vm "
@@ -141,6 +142,6 @@ vm-boot-ssh-%: $(IMAGES_DIR)/%.img $(VM_VENV)
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
 		$(if $(LOG_CONSOLE),--log-console) \
 		--image "$<" \
-		--interactive \
+		$(if $(ROOT_USER),--interactive-root,-interactive) \
 		false, \
 		"  VM-BOOT-SSH $*") || true
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 6f3f2e76df..6d41ac7574 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -612,8 +612,11 @@ def get_default_jobs():
     parser.add_argument("--source-path", default=None,
                         help="Path of source directory, "\
                         "for finding additional files. ")
-    parser.add_argument("--interactive", "-I", action="store_true",
-                        help="Interactively run command")
+    int_ops = parser.add_mutually_exclusive_group()
+    int_ops.add_argument("--interactive", "-I", action="store_true",
+                         help="Interactively run command")
+    int_ops.add_argument("--interactive-root", action="store_true",
+                         help="Interactively run command as root")
     parser.add_argument("--snapshot", "-s", action="store_true",
                         help="run tests with a snapshot")
     parser.add_argument("--genisoimage", default="genisoimage",
@@ -675,6 +678,8 @@ def main(vmcls, config=None):
         exitcode = 3
     if args.interactive:
         vm.ssh()
+    elif args.interactive_root:
+        vm.ssh_root()
 
     if not args.snapshot:
         vm.graceful_shutdown()
-- 
2.39.5
