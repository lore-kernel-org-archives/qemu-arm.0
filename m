Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de379cedc6sm2044986a12.44.2025.02.07.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:31:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7D6705F92A;
	Fri,  7 Feb 2025 15:31:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Kyle Evans <kevans@freebsd.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-rust@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 01/17] tests/docker: replicate the check-rust-tools-nightly CI job
Date: Fri,  7 Feb 2025 15:30:56 +0000
Message-Id: <20250207153112.3939799-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZKXHLZtgdYRa

This allows people to run the test locally:

  make docker-test-rust@fedora-rust-nightly

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update MAINTAINERS
---
 MAINTAINERS                   |  1 +
 tests/docker/Makefile.include |  3 +++
 tests/docker/test-rust        | 21 +++++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100755 tests/docker/test-rust

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf37fce7b..efb7d09dea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3386,6 +3386,7 @@ F: rust/rustfmt.toml
 
 Rust-related patches CC here
 L: qemu-rust@nongnu.org
+F: tests/docker/test-rust
 F: rust/
 
 SLIRP
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fead7d3abe..fa1cbb6726 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -236,3 +236,6 @@ docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
+
+# Overrides
+docker-test-rust%: NETWORK=1
diff --git a/tests/docker/test-rust b/tests/docker/test-rust
new file mode 100755
index 0000000000..e7e3e94a55
--- /dev/null
+++ b/tests/docker/test-rust
@@ -0,0 +1,21 @@
+#!/bin/bash -e
+#
+# Run the rust code checks (a.k.a. check-rust-tools-nightly)
+#
+# Copyright (c) 2025 Linaro Ltd
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+configure_qemu --disable-user --disable-docs --enable-rust
+pyvenv/bin/meson devenv -w $QEMU_SRC/rust ${CARGO-cargo} fmt --check
+make clippy
+make rustdoc
-- 
2.39.5
