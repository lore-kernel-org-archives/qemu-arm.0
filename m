Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CD0C531C9
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Jul 2026 14:52:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wo0Ct-0005vS-Dx; Sun, 26 Jul 2026 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wo0Co-0005tg-La
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:51:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wo0Cl-00060K-4q
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 10:51:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cad8076b01so21788025ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Jul 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785077510; x=1785682310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FCW4PvYCh0nfjidNnYDFUOliq890MpmlX0B+4xSIUTs=;
 b=K+kjkcvyA495BUndzLI0vlEwUq9yLIDzRq/ELzy+35wVYXeXaAM4lYYIAsU9Yb4ngJ
 Ryd6JKwwAh2sA9iBBBOqwtSUbBM3Wj0ifotw+a4lChaync7Wka6/bIDlMTSJEZxeDfSI
 PYJcVjwEh1cMdxL4ColYotQ2L+X7+x4KPArSG8Llv9AMekuZHhYV5EUbYyHS3LtmlgWw
 s/fWT3hkfWw2UeRV8aFtwDZ3KPY+rclt/ggcckw7CPIh8xYZkZnIhMEvxnlidq3I0wuy
 AijolQWdoKyljFMh6f8xMTH6vYdg7N4RJQUXoGJ5hffIIi8PzusOLai9yKbFb0+i5J3o
 hqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785077510; x=1785682310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FCW4PvYCh0nfjidNnYDFUOliq890MpmlX0B+4xSIUTs=;
 b=c1PFlcIVsRfAnpxy3cuZ51nImZlUTUv5t6aaQU4YtsvPBbzoem1vkNL1AeTYmdf2Yh
 +2A0TT8+Jifpv1jgITIS47IKdZnFqFftIGUhyvyuyDEWPSVb3JgLDxzc0Eo5W7QQ0cyY
 wYtGe0OIBNI9tQpxcRldFaOAR3T5cefx+IU4Wlx5Ety+PGSbleEhczi+NbHZlpaN928s
 7RD6sp6gNjegXdBh92/ftBpyAFRnEt/F81y+knOXtT8XUBWVoV4/brWT1Fnb6X2uOBon
 dAkikbnbnccWpl7WGM4xujeg7wpc8SAyHbgpBzsvtZRPQc+49VAEMcQXrhq08dLNYXm/
 ibFQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrz4woBeO2UulHAteDh+Zko+CTg3u4W4Rk01Kc0JUDXq0K+xoKiRTVT4j2eSUHSvWDnUHEC52oSTA==@nongnu.org
X-Gm-Message-State: AOJu0Yz0Sm4Ow79OVq5c0MbPmKfgzVG0fwDLd4wFk0i26gH3YqpGB/rJ
 tHLqhFq68iSrf4Cm+qpS+ZpJzOzygMMT692cqKg2koslHQQPCxeoHEyx
X-Gm-Gg: AR+sD13zbzH5TzfUWqZpuTdgSKERJ63ixDnX6Dv76j6f7nqeg/Bfe0+t7DAAPy77AAc
 m7QVWramtYI21zUclUXmr8HWxp4ttINZinjuQ42+unTqaOmotZe10Ld8Hg91kXm17k8Et55RwYL
 v3h5U7bN5FvL6i91F0cWpOh5Fp8iTrRDMrgczhhFMo7SfOzVqeIWURK0l257HAGQHMTiIUXOAfc
 VWQcc6DfDM64MqWuhz5SBrLzNA2lS09+gpfhPAAQdLG4qYYho/m/PJucwhNnPbkfvjjmiAz49W2
 NP6ylE5S/HUS00b3xnVHiWfCLhIn9sDCDbw5zXlWRjVCANBCuVBuLwXLSdexPrRoRSLlnfk0cZ6
 aL0CP9MzGHlRj6rw1N9ttIhJl4C5N07WO7Q+45/nYhEZoI5DtDyZFM6mrakwwu9XPmY+x1zmmV0
 3DpLHvTahosGEjld8/MLtmP/DL
X-Received: by 2002:a17:902:cec3:b0:2cf:4339:aaa with SMTP id
 d9443c01a7336-2cfde7aa806mr51642055ad.12.1785077509760; 
 Sun, 26 Jul 2026 07:51:49 -0700 (PDT)
Received: from localhost.localdomain ([82.40.42.115])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde81d7f5sm20934195ad.83.2026.07.26.07.51.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jul 2026 07:51:48 -0700 (PDT)
From: Jack Wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-rust@nongnu.org, caojunze424@gmail.com,
 Jack Wang <163wangjack@gmail.com>
Subject: [RFC PATCH v1 2/5] rust: add hw/gpio crate to the workspace
Date: Sun, 26 Jul 2026 22:51:16 +0800
Message-ID: <20260726145119.19881-3-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726145119.19881-1-163wangjack@gmail.com>
References: <20260726145119.19881-1-163wangjack@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Register the new stm32f1xx_gpio crate in the Rust workspace and hook its
meson build and Kconfig into rust/hw so it is compiled into the softmmu
build when Rust is enabled.

Signed-off-by: Jack Wang <163wangjack@gmail.com>
---
 rust/Cargo.lock          | 17 ++++++++++++-
 rust/Cargo.toml          | 18 ++++++++++++++
 rust/hw/Kconfig          |  1 +
 rust/hw/gpio/Cargo.toml  | 28 +++++++++++++++++++++
 rust/hw/gpio/meson.build | 54 ++++++++++++++++++++++++++++++++++++++++
 rust/hw/meson.build      |  1 +
 6 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 rust/hw/gpio/Cargo.toml
 create mode 100644 rust/hw/gpio/meson.build

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index cbb3ca15f7..2daadaaf15 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -184,7 +184,6 @@ dependencies = [
  "glib-sys",
  "migration-sys",
  "qom-sys",
- "system-sys",
  "util-sys",
 ]
 
@@ -387,6 +386,21 @@ version = "1.15.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 
+[[package]]
+name = "stm32f1xx_gpio"
+version = "0.1.0"
+dependencies = [
+ "bql",
+ "common",
+ "glib-sys",
+ "hwcore",
+ "migration",
+ "qom",
+ "system",
+ "trace",
+ "util",
+]
+
 [[package]]
 name = "syn"
 version = "2.0.104"
@@ -431,6 +445,7 @@ version = "0.1.0"
 dependencies = [
  "common",
  "glib-sys",
+ "hwcore-sys",
  "migration-sys",
  "qom-sys",
  "util-sys",
diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 0d24eb84e1..7661205d3c 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -1,9 +1,27 @@
 [workspace]
 resolver = "2"
 members = [
+    "bindings/chardev-sys",
+    "bindings/hwcore-sys",
+    "bindings/migration-sys",
+    "bindings/qom-sys",
+    "bindings/system-sys",
+    "bindings/util-sys",
+    "bits",
+    "bql",
+    "chardev",
+    "common",
     "hw/char/pl011",
+    "hw/core",
+    "hw/gpio",
     "hw/timer/hpet",
+    "migration",
+    "qemu-macros",
+    "qom",
+    "system",
     "tests",
+    "trace",
+    "util",
 ]
 
 [workspace.package]
diff --git a/rust/hw/Kconfig b/rust/hw/Kconfig
index 36f92ec028..ba1297ca2d 100644
--- a/rust/hw/Kconfig
+++ b/rust/hw/Kconfig
@@ -1,3 +1,4 @@
 # devices Kconfig
 source char/Kconfig
+source gpio/Kconfig
 source timer/Kconfig
diff --git a/rust/hw/gpio/Cargo.toml b/rust/hw/gpio/Cargo.toml
new file mode 100644
index 0000000000..5c6eade306
--- /dev/null
+++ b/rust/hw/gpio/Cargo.toml
@@ -0,0 +1,28 @@
+[package]
+name = "stm32f1xx_gpio"
+version = "0.1.0"
+description = "STM32F1xx GPIO device model for QEMU"
+resolver = "2"
+publish = false
+
+edition.workspace = true
+homepage.workspace = true
+license.workspace = true
+repository.workspace = true
+rust-version.workspace = true
+
+[dependencies]
+glib-sys.workspace = true
+
+# QEMU Rust foundations crate
+common = { path = "../../common" }
+util = { path = "../../util" }
+bql = { path = "../../bql" }
+migration = { path = "../../migration" }
+qom = { path = "../../qom" }
+system = { path = "../../system" }
+hwcore = { path = "../../hw/core" }
+trace = { path = "../../trace" }
+
+[lints]
+workspace = true
diff --git a/rust/hw/gpio/meson.build b/rust/hw/gpio/meson.build
new file mode 100644
index 0000000000..35da59991f
--- /dev/null
+++ b/rust/hw/gpio/meson.build
@@ -0,0 +1,54 @@
+_libstm32f1xx_gpio_rs = static_library(
+  'stm32f1xx_gpio',
+  files(
+    'src/lib.rs',
+    'src/gpio.rs',
+    'src/bindings.rs',
+  ),
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  link_with: [
+    _util_rs,
+    _migration_rs,
+    _bql_rs,
+    _qom_rs,
+    _system_rs,
+    _hwcore_rs,
+    _trace_rs,
+  ],
+  dependencies: [
+    common_rs,
+    glib_sys_rs,
+  ],
+)
+
+rust_devices_ss.add(when: 'CONFIG_X_STM32F1XX_GPIO_RUST', if_true: [declare_dependency(
+  link_whole: [_libstm32f1xx_gpio_rs],
+  variables: {'crate': 'stm32f1xx_gpio'},
+)])
+
+# Dependency usable by the in-crate integration test below.
+stm32f1xx_gpio_rs = declare_dependency(link_with: [_libstm32f1xx_gpio_rs],
+  dependencies: [common_rs, qom_rs, hwcore_rs, bql_rs, migration_rs,
+                 system_rs, util_rs])
+
+# Native Rust unit tests for the pure register logic (GpioRegisters). These
+# need no qtest and no machine boot: they construct GpioRegisters directly and
+# only require the BQL mock (bql::start_test). Run with:
+#   meson test --suite rust rust-stm32f1xx-gpio-integration
+test('rust-stm32f1xx-gpio-integration',
+    executable(
+        'rust-stm32f1xx-gpio-integration',
+        files('tests/tests.rs'),
+        override_options: ['rust_std=2021', 'build.rust_std=2021'],
+        rust_args: ['--test'],
+        install: false,
+        dependencies: [stm32f1xx_gpio_rs, common_rs, qom_rs, hwcore_rs,
+                       bql_rs, migration_rs, system_rs, util_rs]),
+    args: [
+        '--test', '--test-threads', '1',
+        '--format', 'pretty',
+    ],
+    protocol: 'rust',
+    suite: ['unit', 'rust'])
+
diff --git a/rust/hw/meson.build b/rust/hw/meson.build
index 9749d4adfc..d6b273170e 100644
--- a/rust/hw/meson.build
+++ b/rust/hw/meson.build
@@ -1,2 +1,3 @@
 subdir('char')
+subdir('gpio')
 subdir('timer')
-- 
2.53.0


