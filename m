Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c5a4sm25056881a12.38.2025.01.08.04.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:11:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 86EC960132;
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
Subject: [PATCH v4 30/32] pc-bios: ensure keymaps dependencies set vnc tests
Date: Wed,  8 Jan 2025 12:10:52 +0000
Message-Id: <20250108121054.1126164-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mJKUGp0Sfsvo

I was seeing failures on vnc-display-test on FreeBSD:

  make vm-build-freebsd V=1 TARGET_LIST=aarch64-softmmu BUILD_TARGET=check-qtest QEMU_LOCAL=1 DEBUG=1

Leads to:

  qemu-system-aarch64: -vnc none: could not read keymap file: 'en-us'
  Broken pipe
  ../src/tests/qtest/libqtest.c:196: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)

which was as far as I could tell because we don't populate the
$BLD/pc-bios/keymaps (although something attempts to symlink
qemu-bundle/usr/local/share/qemu/keymaps/ to that dir).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/keymaps/meson.build | 17 ++++++++---------
 tests/qtest/meson.build     |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 0bd8ce0077..a79a09b276 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -39,19 +39,18 @@ else
   native_qemu_keymap = qemu_keymap
 endif
 
+keymap_targets = []
 if native_qemu_keymap.found()
-  t = []
   foreach km, args: keymaps
     # generate with qemu-kvm
-    t += custom_target(km,
-                       build_by_default: true,
-                       output: km,
-                       command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: have_system,
-                       install_dir: qemu_datadir / 'keymaps')
+    keymap_targets += custom_target(km,
+                                    build_by_default: true,
+                                    output: km,
+                                    command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+                                    install: have_system,
+                                    install_dir: qemu_datadir / 'keymaps')
   endforeach
-
-  alias_target('update-keymaps', t)
+  alias_target('update-keymaps', keymap_targets)
 else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c5a70021c5..f75c1057a4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -383,7 +383,7 @@ qtests = {
 if vnc.found()
   gvnc = dependency('gvnc-1.0', method: 'pkg-config', required: false)
   if gvnc.found()
-    qtests += {'vnc-display-test': [gvnc]}
+    qtests += {'vnc-display-test': [gvnc, keymap_targets]}
     qtests_generic += [ 'vnc-display-test' ]
   endif
 endif
-- 
2.39.5
