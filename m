Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35365sm5747835a12.80.2024.12.18.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:21:17 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BE41B60C08;
	Wed, 18 Dec 2024 16:21:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 27/27] pc-bios: ensure keymaps dependencies set vnc tests
Date: Wed, 18 Dec 2024 16:21:03 +0000
Message-Id: <20241218162104.3493551-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +N8pgYoQMQK+

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
