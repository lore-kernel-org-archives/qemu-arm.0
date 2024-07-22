Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1856938njc;
        Mon, 22 Jul 2024 04:44:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeuHc+DiCrnFs9KT18W9yxuqrsrXp3ntjOsqYLnx0wxPmRdTREimQB9PIErKkSEzyPXA/cLLLvmNv4SjNv/VIf6bCWBd5P
X-Received: by 2002:a05:600c:45c9:b0:426:5b51:109d with SMTP id 5b1f17b1804b1-427dc568e7amr34877765e9.36.1721648650652;
        Mon, 22 Jul 2024 04:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721648650; cv=none;
        d=google.com; s=arc-20160816;
        b=W5U8+VFF44AP6YqAn4JjgrJD92SMX4lp8KdbsDJt+zzvZr3nIFWB3hUIG/jO5UDyjw
         9EyCZ8QGnsXKMgW5BG4C28ILLp3Lg4t4urdVrWBHH8SNGqEGwWHJ4Qc+w94f01DqrD3e
         wviB1K86MCpGiwn53G9K6N95Oj4GVe/ulh2cSvqwn3t2O3iPOWlpDDECYPCTEejE8mWE
         1Ml/LbQEVGTIxmCChUfmlwk7PfPULsanc+SkmkIJv745gdY4GyYN583ocadJCxVeT4dx
         OObbFowQaEG6A7JjJ/3kmL9x8CnldwBT6HB8HGLqL2m4dAxKw7aSGflJtWnj4dUMxh0+
         TuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OVLGD6KIEzAVggABsFYZeBPl3B+hTeGtDK8Ro+VkMEw=;
        fh=rW7vb8VBx9ty6h9wXxhgmdUllhlJrKV+E7l7WqU3/TM=;
        b=NdNkpxrQyeUnHxu+rIo1cId0KjVvBKWhgliJ4aoh57Ga+0n1BLNA6cdqRhN8aQZxEv
         QC+W44yj+jJKoCkabF2sEj6bMY8f73JmihMRW/WwKJEtEecWq6lKVBYx0+nElYe0s+aO
         psGy8aYyhM0qyBqARXUR/Z6bygZHxyjoMfhUFTQqmvY7R7JRenDQr6Z4IXuknJSoRG2K
         vkU1rSnQWVGm4mnCUaPdNsXunZpNWT28E4z73jFC2eiswVVN8f5WJEK7t+dqSYTP4bRo
         kQQgt+myQcSYN5QIg2lkwwiOCNkwhCgaPNAr/5SjiE2DqCwN910p7UgqrgKdYJ+R39Pi
         5f1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pmoOZoMo;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6fee886sor19192635e9.10.2024.07.22.04.44.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 04:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pmoOZoMo;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721648650; x=1722253450; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVLGD6KIEzAVggABsFYZeBPl3B+hTeGtDK8Ro+VkMEw=;
        b=pmoOZoMoAmieZcXwWbslKLtVzLRYTmanyigta0DV+QPqCyQD9+3Xogr+T3wa1TzDVU
         8hqe5ldcvQyQs7+LQsUaKZVHLjapKl1YHxaQQHMOgyUUmIt/PjrX2xfpxswOzLn3l66G
         8LPVM928GMm647ajcZ1R47AYnNBNvWxZ9y4Am7btYP7YLRBZ8STnL8HpST7AjozHAfmU
         RFygRVwyIMQiuG7yijpUMUw7YZeDfPQyTGXvix60umkqvnqxBMKDD2mDYugwEE6POwP1
         Uh+w2rDOs5FwCiViQQjSs49xErUt6+hXTf4EJGfcqvbq6U06HjvnfPN0f3AYe+NfkLiS
         0zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648650; x=1722253450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVLGD6KIEzAVggABsFYZeBPl3B+hTeGtDK8Ro+VkMEw=;
        b=lJT5dhYACQ42BsxDlMQ0l2KO+85Fjg+OwUfUKtVY/iv5FG7xlf3ZjLuWIhKFAbU2c3
         OUsVoBQAQU4bx+zXRJC3/YeD2ZhA4h6PE2yoOIdAwtM0CMZtv6Ha6a9wDf1CEfr6A+tI
         Ct1+9cRTD2Koqe2oD1Zktk3X93+M3jnUucxQO2IywCVP2zRG77cdcU/j6Tx3QGuPAFB0
         P7xhdi67p1T++6xGYt6mDKx9LEgMu26luZOq6g0mIh+DjJF/3Gh1YSrOhiLhB0iLNgCx
         ZITRIEMihT0m8gay1EZQTorjrPNg24T9bCR12Nzwg5KsVoaEZlwGQIqtYOKvI4mIxM7Q
         ySjg==
X-Forwarded-Encrypted: i=1; AJvYcCUUsV3zwVh7O2p1gdiTYDt1ZKYTPgtDVyagfwj/kfmxakaRARX7x4hxhid1vPs66kqehpSwaxt7Vu1iCGORvLR0wCHRdCMX
X-Gm-Message-State: AOJu0Yzvhj4Z7dtqjc94crFt/r9BtSgPHzn+naGsz7hKV/DOPS7lKmhX
	hJqd7G+lRy2PZzFTC7/VoOXjaRyqwUbONlHwIciWqI0YXK79oUK4TMVGku7nlqsIpA==
X-Google-Smtp-Source: AGHT+IFOjG96H258P5BGAEOpEnwrH+tHdP4vI7NIc3XHb9cX2gkQUmoT4hURn2SjXhYpaQ/f72dSxw==
X-Received: by 2002:a5d:42c3:0:b0:368:48e6:5056 with SMTP id ffacd0b85a97d-369bbbbf9dfmr3658676f8f.22.1721648649723;
        Mon, 22 Jul 2024 04:44:09 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-231.37.6.1.tellas.gr. [37.6.1.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787eba8csm8323513f8f.91.2024.07.22.04.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:44:09 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	rowan.hart@intel.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v5 7/8] rust: add PL011 device model
Date: Mon, 22 Jul 2024 14:43:37 +0300
Message-ID: <a9edaf0a253b15af1d8270ab17ca20410c4e395d.1721648163.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <rust-pl011-rfc-v5.git.manos.pitsidianakis@linaro.org>
References: <rust-pl011-rfc-v5.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: t2+hBZXPGCXs

This commit adds a re-implementation of hw/char/pl011.c in Rust.

How to build:

1. Configure a QEMU build with:
   --enable-system --target-list=aarch64-softmmu --enable-rust
2. Launching a VM with qemu-system-aarch64 should use the Rust version
   of the pl011 device

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 MAINTAINERS                            |   5 +
 hw/arm/Kconfig                         |  33 +-
 rust/Kconfig                           |   1 +
 rust/hw/Kconfig                        |   2 +
 rust/hw/char/Kconfig                   |   3 +
 rust/hw/char/meson.build               |   1 +
 rust/hw/char/pl011/.gitignore          |   2 +
 rust/hw/char/pl011/Cargo.lock          | 123 ++++++
 rust/hw/char/pl011/Cargo.toml          |  26 ++
 rust/hw/char/pl011/README.md           |  31 ++
 rust/hw/char/pl011/meson.build         |  24 +
 rust/hw/char/pl011/rustfmt.toml        |   1 +
 rust/hw/char/pl011/src/definitions.rs  |  48 ++
 rust/hw/char/pl011/src/device.rs       | 541 +++++++++++++++++++++++
 rust/hw/char/pl011/src/device_class.rs |  58 +++
 rust/hw/char/pl011/src/lib.rs          | 584 +++++++++++++++++++++++++
 rust/hw/char/pl011/src/memory_ops.rs   |  45 ++
 rust/hw/meson.build                    |   1 +
 rust/meson.build                       |   2 +
 19 files changed, 1520 insertions(+), 11 deletions(-)
 create mode 100644 rust/hw/Kconfig
 create mode 100644 rust/hw/char/Kconfig
 create mode 100644 rust/hw/char/meson.build
 create mode 100644 rust/hw/char/pl011/.gitignore
 create mode 100644 rust/hw/char/pl011/Cargo.lock
 create mode 100644 rust/hw/char/pl011/Cargo.toml
 create mode 100644 rust/hw/char/pl011/README.md
 create mode 100644 rust/hw/char/pl011/meson.build
 create mode 120000 rust/hw/char/pl011/rustfmt.toml
 create mode 100644 rust/hw/char/pl011/src/definitions.rs
 create mode 100644 rust/hw/char/pl011/src/device.rs
 create mode 100644 rust/hw/char/pl011/src/device_class.rs
 create mode 100644 rust/hw/char/pl011/src/lib.rs
 create mode 100644 rust/hw/char/pl011/src/memory_ops.rs
 create mode 100644 rust/hw/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 1789bcfd9b..0af4ef58ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1187,6 +1187,11 @@ F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
 F: docs/system/arm/nrf.rst
 
+ARM PL011 Rust device
+M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+S: Maintained
+F: rust/hw/char/pl011/
+
 AVR Machines
 -------------
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1ad60da7aa..45438c1bc4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -20,7 +20,8 @@ config ARM_VIRT
     select PCI_EXPRESS
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL031 # RTC
     select PL061 # GPIO
     select GPIO_PWR
@@ -80,7 +81,8 @@ config HIGHBANK
     select AHCI
     select ARM_TIMER # sp804
     select ARM_V7M
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL022 # SPI
     select PL031 # RTC
     select PL061 # GPIO
@@ -93,7 +95,8 @@ config INTEGRATOR
     depends on TCG && ARM
     select ARM_TIMER
     select INTEGRATOR_DEBUG
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL031 # RTC
     select PL041 # audio
     select PL050 # keyboard/mouse
@@ -119,7 +122,8 @@ config MUSCA
     default y
     depends on TCG && ARM
     select ARMSSE
-    select PL011
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL031
     select SPLIT_IRQ
     select UNIMP
@@ -228,7 +232,8 @@ config Z2
     depends on TCG && ARM
     select PFLASH_CFI01
     select WM8750
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PXA2XX
 
 config REALVIEW
@@ -248,7 +253,8 @@ config REALVIEW
     select WM8750 # audio codec
     select LSI_SCSI_PCI
     select PCI
-    select PL011  # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL031  # RTC
     select PL041  # audio codec
     select PL050  # keyboard/mouse
@@ -273,7 +279,8 @@ config SBSA_REF
     select PCI_EXPRESS
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL031 # RTC
     select PL061 # GPIO
     select USB_XHCI_SYSBUS
@@ -297,7 +304,8 @@ config STELLARIS
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
     select I2C
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL022 # SPI
     select PL061 # GPIO
     select SSD0303 # OLED display
@@ -356,7 +364,8 @@ config VEXPRESS
     select ARM_TIMER # sp804
     select LAN9118
     select PFLASH_CFI01
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select PL041 # audio codec
     select PL181  # display
     select REALVIEW
@@ -440,7 +449,8 @@ config RASPI
     default y
     depends on TCG && ARM
     select FRAMEBUFFER
-    select PL011 # UART
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select SDHCI
     select USB_DWC2
     select BCM2835_SPI
@@ -515,7 +525,8 @@ config XLNX_VERSAL
     select ARM_GIC
     select CPU_CLUSTER
     select DEVICE_TREE
-    select PL011
+    select PL011 if !HAVE_RUST # UART
+    select X_PL011_RUST if HAVE_RUST # UART
     select CADENCE
     select VIRTIO_MMIO
     select UNIMP
diff --git a/rust/Kconfig b/rust/Kconfig
index e69de29bb2..f9f5c39098 100644
--- a/rust/Kconfig
+++ b/rust/Kconfig
@@ -0,0 +1 @@
+source hw/Kconfig
diff --git a/rust/hw/Kconfig b/rust/hw/Kconfig
new file mode 100644
index 0000000000..4d934f30af
--- /dev/null
+++ b/rust/hw/Kconfig
@@ -0,0 +1,2 @@
+# devices Kconfig
+source char/Kconfig
diff --git a/rust/hw/char/Kconfig b/rust/hw/char/Kconfig
new file mode 100644
index 0000000000..a1732a9e97
--- /dev/null
+++ b/rust/hw/char/Kconfig
@@ -0,0 +1,3 @@
+config X_PL011_RUST
+    bool
+    default y if HAVE_RUST
diff --git a/rust/hw/char/meson.build b/rust/hw/char/meson.build
new file mode 100644
index 0000000000..5716dc43ef
--- /dev/null
+++ b/rust/hw/char/meson.build
@@ -0,0 +1 @@
+subdir('pl011')
diff --git a/rust/hw/char/pl011/.gitignore b/rust/hw/char/pl011/.gitignore
new file mode 100644
index 0000000000..71eaff2035
--- /dev/null
+++ b/rust/hw/char/pl011/.gitignore
@@ -0,0 +1,2 @@
+# Ignore generated bindings file overrides.
+src/bindings.rs.inc
diff --git a/rust/hw/char/pl011/Cargo.lock b/rust/hw/char/pl011/Cargo.lock
new file mode 100644
index 0000000000..1af92fb16b
--- /dev/null
+++ b/rust/hw/char/pl011/Cargo.lock
@@ -0,0 +1,123 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 3
+
+[[package]]
+name = "arbitrary-int"
+version = "1.2.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c84fc003e338a6f69fbd4f7fe9f92b535ff13e9af8997f3b14b6ddff8b1df46d"
+
+[[package]]
+name = "bilge"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "dc707ed8ebf81de5cd6c7f48f54b4c8621760926cdf35a57000747c512e67b57"
+dependencies = [
+ "arbitrary-int",
+ "bilge-impl",
+]
+
+[[package]]
+name = "bilge-impl"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "feb11e002038ad243af39c2068c8a72bcf147acf05025dcdb916fcc000adb2d8"
+dependencies = [
+ "itertools",
+ "proc-macro-error",
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "either"
+version = "1.12.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b"
+
+[[package]]
+name = "itertools"
+version = "0.11.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
+dependencies = [
+ "either",
+]
+
+[[package]]
+name = "pl011"
+version = "0.1.0"
+dependencies = [
+ "bilge",
+ "qemu_api",
+]
+
+[[package]]
+name = "proc-macro-error"
+version = "1.0.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+dependencies = [
+ "proc-macro-error-attr",
+ "proc-macro2",
+ "quote",
+ "version_check",
+]
+
+[[package]]
+name = "proc-macro-error-attr"
+version = "1.0.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "version_check",
+]
+
+[[package]]
+name = "proc-macro2"
+version = "1.0.84"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ec96c6a92621310b51366f1e28d05ef11489516e93be030060e5fc12024a49d6"
+dependencies = [
+ "unicode-ident",
+]
+
+[[package]]
+name = "qemu_api"
+version = "0.1.0"
+
+[[package]]
+name = "quote"
+version = "1.0.36"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+dependencies = [
+ "proc-macro2",
+]
+
+[[package]]
+name = "syn"
+version = "2.0.66"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c42f3f41a2de00b01c0aaad383c5a45241efc8b2d1eda5661812fda5f3cdcff5"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "unicode-ident",
+]
+
+[[package]]
+name = "unicode-ident"
+version = "1.0.12"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+
+[[package]]
+name = "version_check"
+version = "0.9.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
new file mode 100644
index 0000000000..67a6973da6
--- /dev/null
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -0,0 +1,26 @@
+[package]
+name = "pl011"
+version = "0.1.0"
+edition = "2021"
+authors = ["Manos Pitsidianakis <manos.pitsidianakis@linaro.org>"]
+license = "GPL-2.0 OR GPL-3.0-or-later"
+readme = "README.md"
+homepage = "https://www.qemu.org"
+description = "pl011 device model for QEMU"
+repository = "https://gitlab.com/epilys/rust-for-qemu"
+resolver = "2"
+publish = false
+keywords = []
+categories = []
+
+[lib]
+crate-type = ["staticlib"]
+
+[dependencies]
+arbitrary-int = { version = "1.2.7" }
+bilge = { version = "0.2.0" }
+bilge-impl = { version = "0.2.0" }
+qemu_api = { path = "../../../qemu-api" }
+
+# Do not include in any global workspace
+[workspace]
diff --git a/rust/hw/char/pl011/README.md b/rust/hw/char/pl011/README.md
new file mode 100644
index 0000000000..cd7dea3163
--- /dev/null
+++ b/rust/hw/char/pl011/README.md
@@ -0,0 +1,31 @@
+# PL011 QEMU Device Model
+
+This library implements a device model for the PrimeCell® UART (PL011)
+device in QEMU.
+
+## Build static lib
+
+Host build target must be explicitly specified:
+
+```sh
+cargo build --target x86_64-unknown-linux-gnu
+```
+
+Replace host target triplet if necessary.
+
+## Generate Rust documentation
+
+To generate docs for this crate, including private items:
+
+```sh
+cargo doc --no-deps --document-private-items --target x86_64-unknown-linux-gnu
+```
+
+To include direct dependencies like `bilge` (bitmaps for register types):
+
+```sh
+cargo tree --depth 1 -e normal --prefix none \
+ | cut -d' ' -f1 \
+ | xargs printf -- '-p %s\n' \
+ | xargs cargo doc --no-deps --document-private-items --target x86_64-unknown-linux-gnu
+```
diff --git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build
new file mode 100644
index 0000000000..427788da6e
--- /dev/null
+++ b/rust/hw/char/pl011/meson.build
@@ -0,0 +1,24 @@
+if not config_host_data.get('CONFIG_HAVE_RUST')
+  subdir_done()
+endif
+
+add_languages('rust', required: true)
+subdir('vendor')
+
+_libpl011_rs = static_library(
+  'pl011',
+  files('src/lib.rs'),
+  rust_abi: 'c',
+  rust_args: rust_args + [
+    '--edition', '2021',
+  ],
+  dependencies: [
+    dep_bilge,
+    dep_bilge_impl,
+    qemu_api,
+  ],
+)
+
+specific_ss.add(when: 'CONFIG_X_PL011_RUST', if_true: [declare_dependency(
+  link_whole: [_libpl011_rs],
+)])
diff --git a/rust/hw/char/pl011/rustfmt.toml b/rust/hw/char/pl011/rustfmt.toml
new file mode 120000
index 0000000000..39f97b043b
--- /dev/null
+++ b/rust/hw/char/pl011/rustfmt.toml
@@ -0,0 +1 @@
+../rustfmt.toml
\ No newline at end of file
diff --git a/rust/hw/char/pl011/src/definitions.rs b/rust/hw/char/pl011/src/definitions.rs
new file mode 100644
index 0000000000..d7958baa83
--- /dev/null
+++ b/rust/hw/char/pl011/src/definitions.rs
@@ -0,0 +1,48 @@
+// Copyright 2024 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0 OR GPL-3.0-or-later
+
+//! Definitions required by QEMU when registering the device.
+
+use core::{mem::MaybeUninit, ptr::NonNull};
+
+use qemu_api::bindings::*;
+
+use crate::{device::PL011State, device_class::pl011_class_init};
+
+#[used]
+#[no_mangle]
+pub static TYPE_PL011: &std::ffi::CStr = c"pl011";
+
+qemu_api::type_info! {
+    PL011_ARM_INFO: PL011State,
+    name: c"pl011",
+    parent: TYPE_SYS_BUS_DEVICE,
+    instance_init: Some(pl011_init),
+    abstract_: false,
+    class_init: Some(pl011_class_init),
+}
+
+#[used]
+pub static VMSTATE_PL011: VMStateDescription = VMStateDescription {
+    name: PL011_ARM_INFO.name,
+    unmigratable: true,
+    ..unsafe { MaybeUninit::<VMStateDescription>::zeroed().assume_init() }
+};
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer, that has
+/// the same size as [`PL011State`]. We also expect the device is
+/// readable/writeable from one thread at any time.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_init(obj: *mut Object) {
+    assert!(!obj.is_null());
+    let mut state = NonNull::new_unchecked(obj.cast::<PL011State>());
+    state.as_mut().init();
+}
+
+qemu_api::module_init! {
+    qom: register_type => {
+        type_register_static(&PL011_ARM_INFO);
+    }
+}
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
new file mode 100644
index 0000000000..3643b7bdee
--- /dev/null
+++ b/rust/hw/char/pl011/src/device.rs
@@ -0,0 +1,541 @@
+// Copyright 2024 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0 OR GPL-3.0-or-later
+
+use core::{
+    ffi::{c_int, c_uchar, c_uint, c_void, CStr},
+    ptr::{addr_of, addr_of_mut, NonNull},
+};
+
+use qemu_api::bindings::{self, *};
+
+use crate::{
+    definitions::PL011_ARM_INFO,
+    memory_ops::PL011_OPS,
+    registers::{self, Interrupt},
+    RegisterOffset,
+};
+
+static PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
+
+const DATA_BREAK: u32 = 1 << 10;
+
+/// QEMU sourced constant.
+pub const PL011_FIFO_DEPTH: usize = 16_usize;
+
+#[repr(C)]
+#[derive(Debug)]
+/// PL011 Device Model in QEMU
+pub struct PL011State {
+    pub parent_obj: SysBusDevice,
+    pub iomem: MemoryRegion,
+    pub readbuff: u32,
+    #[doc(alias = "fr")]
+    pub flags: registers::Flags,
+    #[doc(alias = "lcr")]
+    pub line_control: registers::LineControl,
+    #[doc(alias = "rsr")]
+    pub receive_status_error_clear: registers::ReceiveStatusErrorClear,
+    #[doc(alias = "cr")]
+    pub control: registers::Control,
+    pub dmacr: u32,
+    pub int_enabled: u32,
+    pub int_level: u32,
+    pub read_fifo: [u32; PL011_FIFO_DEPTH],
+    pub ilpr: u32,
+    pub ibrd: u32,
+    pub fbrd: u32,
+    pub ifl: u32,
+    pub read_pos: usize,
+    pub read_count: usize,
+    pub read_trigger: usize,
+    #[doc(alias = "chr")]
+    pub char_backend: CharBackend,
+    /// QEMU interrupts
+    ///
+    /// ```text
+    ///  * sysbus MMIO region 0: device registers
+    ///  * sysbus IRQ 0: `UARTINTR` (combined interrupt line)
+    ///  * sysbus IRQ 1: `UARTRXINTR` (receive FIFO interrupt line)
+    ///  * sysbus IRQ 2: `UARTTXINTR` (transmit FIFO interrupt line)
+    ///  * sysbus IRQ 3: `UARTRTINTR` (receive timeout interrupt line)
+    ///  * sysbus IRQ 4: `UARTMSINTR` (momem status interrupt line)
+    ///  * sysbus IRQ 5: `UARTEINTR` (error interrupt line)
+    /// ```
+    #[doc(alias = "irq")]
+    pub interrupts: [qemu_irq; 6usize],
+    #[doc(alias = "clk")]
+    pub clock: NonNull<Clock>,
+    #[doc(alias = "migrate_clk")]
+    pub migrate_clock: bool,
+}
+
+#[used]
+pub static CLK_NAME: &CStr = c"clk";
+
+impl PL011State {
+    pub fn init(&mut self) {
+        // SAFETY:
+        //
+        // self and self.iomem are guaranteed to be valid at this point since callers
+        // must make sure the `self` reference is valid.
+        unsafe {
+            memory_region_init_io(
+                addr_of_mut!(self.iomem),
+                addr_of_mut!(*self).cast::<Object>(),
+                &PL011_OPS,
+                addr_of_mut!(*self).cast::<c_void>(),
+                PL011_ARM_INFO.name,
+                0x1000,
+            );
+            let sbd = addr_of_mut!(*self).cast::<SysBusDevice>();
+            let dev = addr_of_mut!(*self).cast::<DeviceState>();
+            sysbus_init_mmio(sbd, addr_of_mut!(self.iomem));
+            for irq in self.interrupts.iter_mut() {
+                sysbus_init_irq(sbd, irq);
+            }
+            self.clock = NonNull::new(qdev_init_clock_in(
+                dev,
+                CLK_NAME.as_ptr(),
+                None, /* pl011_clock_update */
+                addr_of_mut!(*self).cast::<c_void>(),
+                ClockEvent_ClockUpdate,
+            ))
+            .unwrap();
+        }
+    }
+
+    pub fn read(&mut self, offset: hwaddr, _size: core::ffi::c_uint) -> u64 {
+        use RegisterOffset::*;
+
+        match RegisterOffset::try_from(offset) {
+            Err(v) if (0x3f8..0x400).contains(&v) => {
+                u64::from(PL011_ID_ARM[((offset - 0xfe0) >> 2) as usize])
+            }
+            Err(_) => {
+                // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
+                0
+            }
+            Ok(DR) => {
+                // s->flags &= ~PL011_FLAG_RXFF;
+                self.flags.set_receive_fifo_full(false);
+                let c = self.read_fifo[self.read_pos];
+                if self.read_count > 0 {
+                    self.read_count -= 1;
+                    self.read_pos = (self.read_pos + 1) & (self.fifo_depth() - 1);
+                }
+                if self.read_count == 0 {
+                    // self.flags |= PL011_FLAG_RXFE;
+                    self.flags.set_receive_fifo_empty(true);
+                }
+                if self.read_count + 1 == self.read_trigger {
+                    //self.int_level &= ~ INT_RX;
+                    self.int_level &= !registers::INT_RX;
+                }
+                // Update error bits.
+                self.receive_status_error_clear = c.to_be_bytes()[3].into();
+                self.update();
+                // SAFETY: self.char_backend is a valid CharBackend instance after it's been
+                // initialized in realize().
+                unsafe { qemu_chr_fe_accept_input(&mut self.char_backend) };
+                c.into()
+            }
+            Ok(RSR) => u8::from(self.receive_status_error_clear).into(),
+            Ok(FR) => u16::from(self.flags).into(),
+            Ok(FBRD) => self.fbrd.into(),
+            Ok(ILPR) => self.ilpr.into(),
+            Ok(IBRD) => self.ibrd.into(),
+            Ok(LCR_H) => u16::from(self.line_control).into(),
+            Ok(CR) => {
+                // We exercise our self-control.
+                u16::from(self.control).into()
+            }
+            Ok(FLS) => self.ifl.into(),
+            Ok(IMSC) => self.int_enabled.into(),
+            Ok(RIS) => self.int_level.into(),
+            Ok(MIS) => u64::from(self.int_level & self.int_enabled),
+            Ok(ICR) => {
+                // "The UARTICR Register is the interrupt clear register and is write-only"
+                // Source: ARM DDI 0183G 3.3.13 Interrupt Clear Register, UARTICR
+                0
+            }
+            Ok(DMACR) => self.dmacr.into(),
+        }
+    }
+
+    pub fn write(&mut self, offset: hwaddr, value: u64) {
+        // eprintln!("write offset {offset} value {value}");
+        use RegisterOffset::*;
+        let value: u32 = value as u32;
+        match RegisterOffset::try_from(offset) {
+            Err(_bad_offset) => {
+                eprintln!("write bad offset {offset} value {value}");
+            }
+            Ok(DR) => {
+                // ??? Check if transmitter is enabled.
+                let ch: u8 = value as u8;
+                // XXX this blocks entire thread. Rewrite to use
+                // qemu_chr_fe_write and background I/O callbacks
+
+                // SAFETY: self.char_backend is a valid CharBackend instance after it's been
+                // initialized in realize().
+                unsafe {
+                    qemu_chr_fe_write_all(addr_of_mut!(self.char_backend), &ch, 1);
+                }
+                self.loopback_tx(value);
+                self.int_level |= registers::INT_TX;
+                self.update();
+            }
+            Ok(RSR) => {
+                self.receive_status_error_clear = 0.into();
+            }
+            Ok(FR) => {
+                // flag writes are ignored
+            }
+            Ok(ILPR) => {
+                self.ilpr = value;
+            }
+            Ok(IBRD) => {
+                self.ibrd = value;
+            }
+            Ok(FBRD) => {
+                self.fbrd = value;
+            }
+            Ok(LCR_H) => {
+                let value = value as u16;
+                let new_val: registers::LineControl = value.into();
+                // Reset the FIFO state on FIFO enable or disable
+                if bool::from(self.line_control.fifos_enabled())
+                    ^ bool::from(new_val.fifos_enabled())
+                {
+                    self.reset_fifo();
+                }
+                if self.line_control.send_break() ^ new_val.send_break() {
+                    let mut break_enable: c_int = new_val.send_break().into();
+                    // SAFETY: self.char_backend is a valid CharBackend instance after it's been
+                    // initialized in realize().
+                    unsafe {
+                        qemu_chr_fe_ioctl(
+                            addr_of_mut!(self.char_backend),
+                            CHR_IOCTL_SERIAL_SET_BREAK as i32,
+                            addr_of_mut!(break_enable).cast::<c_void>(),
+                        );
+                    }
+                    self.loopback_break(break_enable > 0);
+                }
+                self.line_control = new_val;
+                self.set_read_trigger();
+            }
+            Ok(CR) => {
+                // ??? Need to implement the enable bit.
+                let value = value as u16;
+                self.control = value.into();
+                self.loopback_mdmctrl();
+            }
+            Ok(FLS) => {
+                self.ifl = value;
+                self.set_read_trigger();
+            }
+            Ok(IMSC) => {
+                self.int_enabled = value;
+                self.update();
+            }
+            Ok(RIS) => {}
+            Ok(MIS) => {}
+            Ok(ICR) => {
+                self.int_level &= !value;
+                self.update();
+            }
+            Ok(DMACR) => {
+                self.dmacr = value;
+                if value & 3 > 0 {
+                    // qemu_log_mask(LOG_UNIMP, "pl011: DMA not implemented\n");
+                    eprintln!("pl011: DMA not implemented");
+                }
+            }
+        }
+    }
+
+    #[inline]
+    fn loopback_tx(&mut self, value: u32) {
+        if !self.loopback_enabled() {
+            return;
+        }
+
+        // Caveat:
+        //
+        // In real hardware, TX loopback happens at the serial-bit level
+        // and then reassembled by the RX logics back into bytes and placed
+        // into the RX fifo. That is, loopback happens after TX fifo.
+        //
+        // Because the real hardware TX fifo is time-drained at the frame
+        // rate governed by the configured serial format, some loopback
+        // bytes in TX fifo may still be able to get into the RX fifo
+        // that could be full at times while being drained at software
+        // pace.
+        //
+        // In such scenario, the RX draining pace is the major factor
+        // deciding which loopback bytes get into the RX fifo, unless
+        // hardware flow-control is enabled.
+        //
+        // For simplicity, the above described is not emulated.
+        self.put_fifo(value);
+    }
+
+    fn loopback_mdmctrl(&mut self) {
+        if !self.loopback_enabled() {
+            return;
+        }
+
+        /*
+         * Loopback software-driven modem control outputs to modem status inputs:
+         *   FR.RI  <= CR.Out2
+         *   FR.DCD <= CR.Out1
+         *   FR.CTS <= CR.RTS
+         *   FR.DSR <= CR.DTR
+         *
+         * The loopback happens immediately even if this call is triggered
+         * by setting only CR.LBE.
+         *
+         * CTS/RTS updates due to enabled hardware flow controls are not
+         * dealt with here.
+         */
+
+        //fr = s->flags & ~(PL011_FLAG_RI | PL011_FLAG_DCD |
+        //                  PL011_FLAG_DSR | PL011_FLAG_CTS);
+        //fr |= (cr & CR_OUT2) ? PL011_FLAG_RI  : 0;
+        //fr |= (cr & CR_OUT1) ? PL011_FLAG_DCD : 0;
+        //fr |= (cr & CR_RTS)  ? PL011_FLAG_CTS : 0;
+        //fr |= (cr & CR_DTR)  ? PL011_FLAG_DSR : 0;
+        //
+        self.flags.set_ring_indicator(self.control.out_2());
+        self.flags.set_data_carrier_detect(self.control.out_1());
+        self.flags.set_clear_to_send(self.control.request_to_send());
+        self.flags
+            .set_data_set_ready(self.control.data_transmit_ready());
+
+        // Change interrupts based on updated FR
+        let mut il = self.int_level;
+
+        il &= !Interrupt::MS;
+        //il |= (fr & PL011_FLAG_DSR) ? INT_DSR : 0;
+        //il |= (fr & PL011_FLAG_DCD) ? INT_DCD : 0;
+        //il |= (fr & PL011_FLAG_CTS) ? INT_CTS : 0;
+        //il |= (fr & PL011_FLAG_RI)  ? INT_RI  : 0;
+
+        if self.flags.data_set_ready() {
+            il |= Interrupt::DSR as u32;
+        }
+        if self.flags.data_carrier_detect() {
+            il |= Interrupt::DCD as u32;
+        }
+        if self.flags.clear_to_send() {
+            il |= Interrupt::CTS as u32;
+        }
+        if self.flags.ring_indicator() {
+            il |= Interrupt::RI as u32;
+        }
+        self.int_level = il;
+        self.update();
+    }
+
+    fn loopback_break(&mut self, enable: bool) {
+        if enable {
+            self.loopback_tx(DATA_BREAK);
+        }
+    }
+
+    fn set_read_trigger(&mut self) {
+        //#if 0
+        //    /* The docs say the RX interrupt is triggered when the FIFO exceeds
+        //       the threshold.  However linux only reads the FIFO in response to an
+        //       interrupt.  Triggering the interrupt when the FIFO is non-empty seems
+        //       to make things work.  */
+        //    if (s->lcr & LCR_FEN)
+        //        s->read_trigger = (s->ifl >> 1) & 0x1c;
+        //    else
+        //#endif
+        self.read_trigger = 1;
+    }
+
+    pub fn realize(&mut self) {
+        // SAFETY: self.char_backend has the correct size and alignment for a
+        // CharBackend object, and its callbacks are of the correct types.
+        unsafe {
+            qemu_chr_fe_set_handlers(
+                addr_of_mut!(self.char_backend),
+                Some(pl011_can_receive),
+                Some(pl011_receive),
+                Some(pl011_event),
+                None,
+                addr_of_mut!(*self).cast::<c_void>(),
+                core::ptr::null_mut(),
+                true,
+            );
+        }
+    }
+
+    pub fn reset(&mut self) {
+        self.line_control.reset();
+        self.receive_status_error_clear.reset();
+        self.dmacr = 0;
+        self.int_enabled = 0;
+        self.int_level = 0;
+        self.ilpr = 0;
+        self.ibrd = 0;
+        self.fbrd = 0;
+        self.read_trigger = 1;
+        self.ifl = 0x12;
+        self.control.reset();
+        self.flags = 0.into();
+        self.reset_fifo();
+    }
+
+    pub fn reset_fifo(&mut self) {
+        self.read_count = 0;
+        self.read_pos = 0;
+
+        /* Reset FIFO flags */
+        self.flags.reset();
+    }
+
+    pub fn can_receive(&self) -> bool {
+        // trace_pl011_can_receive(s->lcr, s->read_count, r);
+        self.read_count < self.fifo_depth()
+    }
+
+    pub fn event(&mut self, event: QEMUChrEvent) {
+        if event == bindings::QEMUChrEvent_CHR_EVENT_BREAK && !self.fifo_enabled() {
+            self.put_fifo(DATA_BREAK);
+            self.receive_status_error_clear.set_break_error(true);
+        }
+    }
+
+    #[inline]
+    pub fn fifo_enabled(&self) -> bool {
+        matches!(self.line_control.fifos_enabled(), registers::Mode::FIFO)
+    }
+
+    #[inline]
+    pub fn loopback_enabled(&self) -> bool {
+        self.control.enable_loopback()
+    }
+
+    #[inline]
+    pub fn fifo_depth(&self) -> usize {
+        // Note: FIFO depth is expected to be power-of-2
+        if self.fifo_enabled() {
+            return PL011_FIFO_DEPTH;
+        }
+        1
+    }
+
+    pub fn put_fifo(&mut self, value: c_uint) {
+        let depth = self.fifo_depth();
+        assert!(depth > 0);
+        let slot = (self.read_pos + self.read_count) & (depth - 1);
+        self.read_fifo[slot] = value;
+        self.read_count += 1;
+        // s->flags &= ~PL011_FLAG_RXFE;
+        self.flags.set_receive_fifo_empty(false);
+        if self.read_count == depth {
+            //s->flags |= PL011_FLAG_RXFF;
+            self.flags.set_receive_fifo_full(true);
+        }
+
+        if self.read_count == self.read_trigger {
+            self.int_level |= registers::INT_RX;
+            self.update();
+        }
+    }
+
+    pub fn update(&mut self) {
+        let flags = self.int_level & self.int_enabled;
+        for (irq, i) in self.interrupts.iter().zip(IRQMASK) {
+            // SAFETY: self.interrupts have been initialized in init().
+            unsafe { qemu_set_irq(*irq, i32::from(flags & i != 0)) };
+        }
+    }
+}
+
+/// Which bits in the interrupt status matter for each outbound IRQ line ?
+pub const IRQMASK: [u32; 6] = [
+    /* combined IRQ */
+    Interrupt::E
+        | Interrupt::MS
+        | Interrupt::RT as u32
+        | Interrupt::TX as u32
+        | Interrupt::RX as u32,
+    Interrupt::RX as u32,
+    Interrupt::TX as u32,
+    Interrupt::RT as u32,
+    Interrupt::MS,
+    Interrupt::E,
+];
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer, that has
+/// the same size as [`PL011State`]. We also expect the device is
+/// readable/writeable from one thread at any time.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_can_receive(opaque: *mut c_void) -> c_int {
+    assert!(!opaque.is_null());
+    let state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+    state.as_ref().can_receive().into()
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer, that has
+/// the same size as [`PL011State`]. We also expect the device is
+/// readable/writeable from one thread at any time.
+///
+/// The buffer and size arguments must also be valid.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_receive(
+    opaque: *mut core::ffi::c_void,
+    buf: *const u8,
+    size: core::ffi::c_int,
+) {
+    assert!(!opaque.is_null());
+    let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+    if state.as_ref().loopback_enabled() {
+        return;
+    }
+    if size > 0 {
+        assert!(!buf.is_null());
+        state.as_mut().put_fifo(*buf.cast::<c_uint>())
+    }
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer, that has
+/// the same size as [`PL011State`]. We also expect the device is
+/// readable/writeable from one thread at any time.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_event(opaque: *mut core::ffi::c_void, event: QEMUChrEvent) {
+    assert!(!opaque.is_null());
+    let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+    state.as_mut().event(event)
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer for `chr`.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_create(
+    addr: u64,
+    irq: qemu_irq,
+    chr: *mut Chardev,
+) -> *mut DeviceState {
+    let dev: *mut DeviceState = unsafe { qdev_new(PL011_ARM_INFO.name) };
+    assert!(!dev.is_null());
+    let sysbus: *mut SysBusDevice = dev as *mut SysBusDevice;
+
+    qdev_prop_set_chr(dev, bindings::TYPE_CHARDEV.as_ptr(), chr);
+    sysbus_realize_and_unref(sysbus, addr_of!(error_fatal) as *mut *mut Error);
+    sysbus_mmio_map(sysbus, 0, addr);
+    sysbus_connect_irq(sysbus, 0, irq);
+    dev
+}
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
new file mode 100644
index 0000000000..6b99239133
--- /dev/null
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -0,0 +1,58 @@
+// Copyright 2024 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0 OR GPL-3.0-or-later
+
+use core::ptr::NonNull;
+
+use qemu_api::bindings::*;
+
+use crate::{definitions::VMSTATE_PL011, device::PL011State};
+
+qemu_api::declare_properties! {
+    PL011_PROPERTIES,
+    qemu_api::define_property!(
+        c"chardev",
+        PL011State,
+        char_backend,
+        unsafe { &qdev_prop_chr },
+        CharBackend
+    ),
+    qemu_api::define_property!(
+        c"migrate-clk",
+        PL011State,
+        migrate_clock,
+        unsafe { &qdev_prop_bool },
+        bool
+    ),
+}
+
+qemu_api::device_class_init! {
+    pl011_class_init,
+    props => PL011_PROPERTIES,
+    realize_fn => Some(pl011_realize),
+    reset_fn => Some(pl011_reset),
+    vmsd => VMSTATE_PL011,
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer, that has
+/// the same size as [`PL011State`]. We also expect the device is
+/// readable/writeable from one thread at any time.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_realize(dev: *mut DeviceState, _errp: *mut *mut Error) {
+    assert!(!dev.is_null());
+    let mut state = NonNull::new_unchecked(dev.cast::<PL011State>());
+    state.as_mut().realize();
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer, that has
+/// the same size as [`PL011State`]. We also expect the device is
+/// readable/writeable from one thread at any time.
+#[no_mangle]
+pub unsafe extern "C" fn pl011_reset(dev: *mut DeviceState) {
+    assert!(!dev.is_null());
+    let mut state = NonNull::new_unchecked(dev.cast::<PL011State>());
+    state.as_mut().reset();
+}
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
new file mode 100644
index 0000000000..697d2ef5a6
--- /dev/null
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -0,0 +1,584 @@
+// Copyright 2024 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0 OR GPL-3.0-or-later
+//
+// PL011 QEMU Device Model
+//
+// This library implements a device model for the PrimeCell® UART (PL011)
+// device in QEMU.
+//
+#![doc = include_str!("../README.md")]
+//! # Library crate
+//!
+//! See [`PL011State`](crate::device::PL011State) for the device model type and
+//! the [`registers`] module for register types.
+
+#![deny(
+    rustdoc::broken_intra_doc_links,
+    rustdoc::redundant_explicit_links,
+    clippy::correctness,
+    clippy::suspicious,
+    clippy::complexity,
+    clippy::perf,
+    clippy::cargo,
+    clippy::nursery,
+    clippy::style,
+    // restriction group
+    clippy::dbg_macro,
+    clippy::as_underscore,
+    clippy::assertions_on_result_states,
+    // pedantic group
+    clippy::doc_markdown,
+    clippy::borrow_as_ptr,
+    clippy::cast_lossless,
+    clippy::option_if_let_else,
+    clippy::missing_const_for_fn,
+    clippy::cognitive_complexity,
+    clippy::missing_safety_doc,
+    )]
+
+extern crate bilge;
+extern crate bilge_impl;
+extern crate qemu_api;
+
+pub mod definitions;
+pub mod device;
+pub mod device_class;
+pub mod memory_ops;
+
+/// Offset of each register from the base memory address of the device.
+///
+/// # Source
+/// ARM DDI 0183G, Table 3-1 p.3-3
+#[doc(alias = "offset")]
+#[allow(non_camel_case_types)]
+#[repr(u64)]
+#[derive(Debug)]
+pub enum RegisterOffset {
+    /// Data Register
+    ///
+    /// A write to this register initiates the actual data transmission
+    #[doc(alias = "UARTDR")]
+    DR = 0x000,
+    /// Receive Status Register or Error Clear Register
+    #[doc(alias = "UARTRSR")]
+    #[doc(alias = "UARTECR")]
+    RSR = 0x004,
+    /// Flag Register
+    ///
+    /// A read of this register shows if transmission is complete
+    #[doc(alias = "UARTFR")]
+    FR = 0x018,
+    /// Fractional Baud Rate Register
+    ///
+    /// responsible for baud rate speed
+    #[doc(alias = "UARTFBRD")]
+    FBRD = 0x028,
+    /// `IrDA` Low-Power Counter Register
+    #[doc(alias = "UARTILPR")]
+    ILPR = 0x020,
+    /// Integer Baud Rate Register
+    ///
+    /// Responsible for baud rate speed
+    #[doc(alias = "UARTIBRD")]
+    IBRD = 0x024,
+    /// line control register (data frame format)
+    #[doc(alias = "UARTLCR_H")]
+    LCR_H = 0x02C,
+    /// Toggle UART, transmission or reception
+    #[doc(alias = "UARTCR")]
+    CR = 0x030,
+    /// Interrupt FIFO Level Select Register
+    #[doc(alias = "UARTIFLS")]
+    FLS = 0x034,
+    /// Interrupt Mask Set/Clear Register
+    #[doc(alias = "UARTIMSC")]
+    IMSC = 0x038,
+    /// Raw Interrupt Status Register
+    #[doc(alias = "UARTRIS")]
+    RIS = 0x03C,
+    /// Masked Interrupt Status Register
+    #[doc(alias = "UARTMIS")]
+    MIS = 0x040,
+    /// Interrupt Clear Register
+    #[doc(alias = "UARTICR")]
+    ICR = 0x044,
+    /// DMA control Register
+    #[doc(alias = "UARTDMACR")]
+    DMACR = 0x048,
+    ///// Reserved, offsets `0x04C` to `0x07C`.
+    //Reserved = 0x04C,
+}
+
+impl core::convert::TryFrom<u64> for RegisterOffset {
+    type Error = u64;
+
+    fn try_from(value: u64) -> Result<Self, Self::Error> {
+        macro_rules! case {
+            ($($discriminant:ident),*$(,)*) => {
+                /* check that matching on all macro arguments compiles, which means we are not
+                 * missing any enum value; if the type definition ever changes this will stop
+                 * compiling.
+                 */
+                const fn _assert_exhaustive(val: RegisterOffset) {
+                    match val {
+                        $(RegisterOffset::$discriminant => (),)*
+                    }
+                }
+
+                match value {
+                    $(x if x == Self::$discriminant as u64 => Ok(Self::$discriminant),)*
+                     _ => Err(value),
+                }
+            }
+        }
+        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR }
+    }
+}
+
+pub mod registers {
+    //! Device registers exposed as typed structs which are backed by arbitrary
+    //! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
+    //!
+    //! All PL011 registers are essentially 32-bit wide, but are typed here as
+    //! bitmaps with only the necessary width. That is, if a struct bitmap
+    //! in this module is for example 16 bits long, it should be conceived
+    //! as a 32-bit register where the unmentioned higher bits are always
+    //! unused thus treated as zero when read or written.
+    use bilge::prelude::*;
+
+    // TODO: FIFO Mode has different semantics
+    /// Data Register, `UARTDR`
+    ///
+    /// The `UARTDR` register is the data register.
+    ///
+    /// For words to be transmitted:
+    ///
+    /// - if the FIFOs are enabled, data written to this location is pushed onto
+    ///   the transmit
+    /// FIFO
+    /// - if the FIFOs are not enabled, data is stored in the transmitter
+    ///   holding register (the
+    /// bottom word of the transmit FIFO).
+    ///
+    /// The write operation initiates transmission from the UART. The data is
+    /// prefixed with a start bit, appended with the appropriate parity bit
+    /// (if parity is enabled), and a stop bit. The resultant word is then
+    /// transmitted.
+    ///
+    /// For received words:
+    ///
+    /// - if the FIFOs are enabled, the data byte and the 4-bit status (break,
+    ///   frame, parity,
+    /// and overrun) is pushed onto the 12-bit wide receive FIFO
+    /// - if the FIFOs are not enabled, the data byte and status are stored in
+    ///   the receiving
+    /// holding register (the bottom word of the receive FIFO).
+    ///
+    /// The received data byte is read by performing reads from the `UARTDR`
+    /// register along with the corresponding status information. The status
+    /// information can also be read by a read of the `UARTRSR/UARTECR`
+    /// register.
+    ///
+    /// # Note
+    ///
+    /// You must disable the UART before any of the control registers are
+    /// reprogrammed. When the UART is disabled in the middle of
+    /// transmission or reception, it completes the current character before
+    /// stopping.
+    ///
+    /// # Source
+    /// ARM DDI 0183G 3.3.1 Data Register, UARTDR
+    #[bitsize(16)]
+    #[derive(Clone, Copy, DebugBits, FromBits)]
+    #[doc(alias = "UARTDR")]
+    pub struct Data {
+        _reserved: u4,
+        pub data: u8,
+        pub framing_error: bool,
+        pub parity_error: bool,
+        pub break_error: bool,
+        pub overrun_error: bool,
+    }
+
+    // TODO: FIFO Mode has different semantics
+    /// Receive Status Register / Error Clear Register, `UARTRSR/UARTECR`
+    ///
+    /// The UARTRSR/UARTECR register is the receive status register/error clear
+    /// register. Receive status can also be read from the `UARTRSR`
+    /// register. If the status is read from this register, then the status
+    /// information for break, framing and parity corresponds to the
+    /// data character read from the [Data register](Data), `UARTDR` prior to
+    /// reading the UARTRSR register. The status information for overrun is
+    /// set immediately when an overrun condition occurs.
+    ///
+    ///
+    /// # Note
+    /// The received data character must be read first from the [Data
+    /// Register](Data), `UARTDR` before reading the error status associated
+    /// with that data character from the `UARTRSR` register. This read
+    /// sequence cannot be reversed, because the `UARTRSR` register is
+    /// updated only when a read occurs from the `UARTDR` register. However,
+    /// the status information can also be obtained by reading the `UARTDR`
+    /// register
+    ///
+    /// # Source
+    /// ARM DDI 0183G 3.3.2 Receive Status Register/Error Clear Register,
+    /// UARTRSR/UARTECR
+    #[bitsize(8)]
+    #[derive(Clone, Copy, DebugBits, FromBits)]
+    pub struct ReceiveStatusErrorClear {
+        pub framing_error: bool,
+        pub parity_error: bool,
+        pub break_error: bool,
+        pub overrun_error: bool,
+        _reserved_unpredictable: u4,
+    }
+
+    impl ReceiveStatusErrorClear {
+        pub fn reset(&mut self) {
+            // All the bits are cleared to 0 on reset.
+            *self = 0.into();
+        }
+    }
+
+    impl Default for ReceiveStatusErrorClear {
+        fn default() -> Self {
+            0.into()
+        }
+    }
+
+    #[bitsize(16)]
+    #[derive(Clone, Copy, DebugBits, FromBits)]
+    /// Flag Register, `UARTFR`
+    #[doc(alias = "UARTFR")]
+    pub struct Flags {
+        /// CTS Clear to send. This bit is the complement of the UART clear to
+        /// send, `nUARTCTS`, modem status input. That is, the bit is 1
+        /// when `nUARTCTS` is LOW.
+        pub clear_to_send: bool,
+        /// DSR Data set ready. This bit is the complement of the UART data set
+        /// ready, `nUARTDSR`, modem status input. That is, the bit is 1 when
+        /// `nUARTDSR` is LOW.
+        pub data_set_ready: bool,
+        /// DCD Data carrier detect. This bit is the complement of the UART data
+        /// carrier detect, `nUARTDCD`, modem status input. That is, the bit is
+        /// 1 when `nUARTDCD` is LOW.
+        pub data_carrier_detect: bool,
+        /// BUSY UART busy. If this bit is set to 1, the UART is busy
+        /// transmitting data. This bit remains set until the complete
+        /// byte, including all the stop bits, has been sent from the
+        /// shift register. This bit is set as soon as the transmit FIFO
+        /// becomes non-empty, regardless of whether the UART is enabled
+        /// or not.
+        pub busy: bool,
+        /// RXFE Receive FIFO empty. The meaning of this bit depends on the
+        /// state of the FEN bit in the UARTLCR_H register. If the FIFO
+        /// is disabled, this bit is set when the receive holding
+        /// register is empty. If the FIFO is enabled, the RXFE bit is
+        /// set when the receive FIFO is empty.
+        pub receive_fifo_empty: bool,
+        /// TXFF Transmit FIFO full. The meaning of this bit depends on the
+        /// state of the FEN bit in the UARTLCR_H register. If the FIFO
+        /// is disabled, this bit is set when the transmit holding
+        /// register is full. If the FIFO is enabled, the TXFF bit is
+        /// set when the transmit FIFO is full.
+        pub transmit_fifo_full: bool,
+        /// RXFF Receive FIFO full. The meaning of this bit depends on the state
+        /// of the FEN bit in the UARTLCR_H register. If the FIFO is
+        /// disabled, this bit is set when the receive holding register
+        /// is full. If the FIFO is enabled, the RXFF bit is set when
+        /// the receive FIFO is full.
+        pub receive_fifo_full: bool,
+        /// Transmit FIFO empty. The meaning of this bit depends on the state of
+        /// the FEN bit in the [Line Control register](LineControl),
+        /// `UARTLCR_H`. If the FIFO is disabled, this bit is set when the
+        /// transmit holding register is empty. If the FIFO is enabled,
+        /// the TXFE bit is set when the transmit FIFO is empty. This
+        /// bit does not indicate if there is data in the transmit shift
+        /// register.
+        pub transmit_fifo_empty: bool,
+        /// `RI`, is `true` when `nUARTRI` is `LOW`.
+        pub ring_indicator: bool,
+        _reserved_zero_no_modify: u7,
+    }
+
+    impl Flags {
+        pub fn reset(&mut self) {
+            // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE are 1
+            self.set_receive_fifo_full(false);
+            self.set_transmit_fifo_full(false);
+            self.set_busy(false);
+            self.set_receive_fifo_empty(true);
+            self.set_transmit_fifo_empty(true);
+        }
+    }
+
+    impl Default for Flags {
+        fn default() -> Self {
+            let mut ret: Self = 0.into();
+            ret.reset();
+            ret
+        }
+    }
+
+    #[bitsize(16)]
+    #[derive(Clone, Copy, DebugBits, FromBits)]
+    /// Line Control Register, `UARTLCR_H`
+    #[doc(alias = "UARTLCR_H")]
+    pub struct LineControl {
+        /// 15:8 - Reserved, do not modify, read as zero.
+        _reserved_zero_no_modify: u8,
+        /// 7 SPS Stick parity select.
+        /// 0 = stick parity is disabled
+        /// 1 = either:
+        /// • if the EPS bit is 0 then the parity bit is transmitted and checked
+        /// as a 1 • if the EPS bit is 1 then the parity bit is
+        /// transmitted and checked as a 0. This bit has no effect when
+        /// the PEN bit disables parity checking and generation. See Table 3-11
+        /// on page 3-14 for the parity truth table.
+        pub sticky_parity: bool,
+        /// WLEN Word length. These bits indicate the number of data bits
+        /// transmitted or received in a frame as follows: b11 = 8 bits
+        /// b10 = 7 bits
+        /// b01 = 6 bits
+        /// b00 = 5 bits.
+        pub word_length: WordLength,
+        /// FEN Enable FIFOs:
+        /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
+        /// 1-byte-deep holding registers 1 = transmit and receive FIFO
+        /// buffers are enabled (FIFO mode).
+        pub fifos_enabled: Mode,
+        /// 3 STP2 Two stop bits select. If this bit is set to 1, two stop bits
+        /// are transmitted at the end of the frame. The receive
+        /// logic does not check for two stop bits being received.
+        pub two_stops_bits: bool,
+        /// EPS Even parity select. Controls the type of parity the UART uses
+        /// during transmission and reception:
+        /// - 0 = odd parity. The UART generates or checks for an odd number of
+        ///   1s in the data and parity bits.
+        /// - 1 = even parity. The UART generates or checks for an even number
+        ///   of 1s in the data and parity bits.
+        /// This bit has no effect when the `PEN` bit disables parity checking
+        /// and generation. See Table 3-11 on page 3-14 for the parity
+        /// truth table.
+        pub parity: Parity,
+        /// 1 PEN Parity enable:
+        ///
+        /// - 0 = parity is disabled and no parity bit added to the data frame
+        /// - 1 = parity checking and generation is enabled.
+        ///
+        /// See Table 3-11 on page 3-14 for the parity truth table.
+        pub parity_enabled: bool,
+        /// BRK Send break.
+        ///
+        /// If this bit is set to `1`, a low-level is continually output on the
+        /// `UARTTXD` output, after completing transmission of the
+        /// current character. For the proper execution of the break command,
+        /// the software must set this bit for at least two complete
+        /// frames. For normal use, this bit must be cleared to `0`.
+        pub send_break: bool,
+    }
+
+    impl LineControl {
+        pub fn reset(&mut self) {
+            // All the bits are cleared to 0 when reset.
+            *self = 0.into();
+        }
+    }
+
+    impl Default for LineControl {
+        fn default() -> Self {
+            0.into()
+        }
+    }
+
+    #[bitsize(1)]
+    #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+    /// `EPS` "Even parity select", field of [Line Control
+    /// register](LineControl).
+    pub enum Parity {
+        /// - 0 = odd parity. The UART generates or checks for an odd number of
+        ///   1s in the data and parity bits.
+        Odd = 0,
+        /// - 1 = even parity. The UART generates or checks for an even number
+        ///   of 1s in the data and parity bits.
+        Even = 1,
+    }
+
+    #[bitsize(1)]
+    #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+    /// `FEN` "Enable FIFOs" or Device mode, field of [Line Control
+    /// register](LineControl).
+    pub enum Mode {
+        /// 0 = FIFOs are disabled (character mode) that is, the FIFOs become
+        /// 1-byte-deep holding registers
+        Character = 0,
+        /// 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
+        FIFO = 1,
+    }
+
+    impl From<Mode> for bool {
+        fn from(val: Mode) -> Self {
+            matches!(val, Mode::FIFO)
+        }
+    }
+
+    #[bitsize(2)]
+    #[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+    /// `WLEN` Word length, field of [Line Control register](LineControl).
+    ///
+    /// These bits indicate the number of data bits transmitted or received in a
+    /// frame as follows:
+    pub enum WordLength {
+        /// b11 = 8 bits
+        _8Bits = 0b11,
+        /// b10 = 7 bits
+        _7Bits = 0b10,
+        /// b01 = 6 bits
+        _6Bits = 0b01,
+        /// b00 = 5 bits.
+        _5Bits = 0b00,
+    }
+
+    /// Control Register, `UARTCR`
+    ///
+    /// The `UARTCR` register is the control register. All the bits are cleared
+    /// to `0` on reset except for bits `9` and `8` that are set to `1`.
+    ///
+    /// # Source
+    /// ARM DDI 0183G, 3.3.8 Control Register, `UARTCR`, Table 3-12
+    #[bitsize(16)]
+    #[doc(alias = "UARTCR")]
+    #[derive(Clone, Copy, DebugBits, FromBits)]
+    pub struct Control {
+        /// `UARTEN` UART enable: 0 = UART is disabled. If the UART is disabled
+        /// in the middle of transmission or reception, it completes the current
+        /// character before stopping. 1 = the UART is enabled. Data
+        /// transmission and reception occurs for either UART signals or SIR
+        /// signals depending on the setting of the SIREN bit.
+        pub enable_uart: bool,
+        /// `SIREN` `SIR` enable: 0 = IrDA SIR ENDEC is disabled. `nSIROUT`
+        /// remains LOW (no light pulse generated), and signal transitions on
+        /// SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is
+        /// transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH,
+        /// in the marking state. Signal transitions on UARTRXD or modem status
+        /// inputs have no effect. This bit has no effect if the UARTEN bit
+        /// disables the UART.
+        pub enable_sir: bool,
+        /// `SIRLP` SIR low-power IrDA mode. This bit selects the IrDA encoding
+        /// mode. If this bit is cleared to 0, low-level bits are transmitted as
+        /// an active high pulse with a width of 3/ 16th of the bit period. If
+        /// this bit is set to 1, low-level bits are transmitted with a pulse
+        /// width that is 3 times the period of the IrLPBaud16 input signal,
+        /// regardless of the selected bit rate. Setting this bit uses less
+        /// power, but might reduce transmission distances.
+        pub sir_lowpower_irda_mode: u1,
+        /// Reserved, do not modify, read as zero.
+        _reserved_zero_no_modify: u4,
+        /// `LBE` Loopback enable. If this bit is set to 1 and the SIREN bit is
+        /// set to 1 and the SIRTEST bit in the Test Control register, UARTTCR
+        /// on page 4-5 is set to 1, then the nSIROUT path is inverted, and fed
+        /// through to the SIRIN path. The SIRTEST bit in the test register must
+        /// be set to 1 to override the normal half-duplex SIR operation. This
+        /// must be the requirement for accessing the test registers during
+        /// normal operation, and SIRTEST must be cleared to 0 when loopback
+        /// testing is finished. This feature reduces the amount of external
+        /// coupling required during system test. If this bit is set to 1, and
+        /// the SIRTEST bit is set to 0, the UARTTXD path is fed through to the
+        /// UARTRXD path. In either SIR mode or UART mode, when this bit is set,
+        /// the modem outputs are also fed through to the modem inputs. This bit
+        /// is cleared to 0 on reset, to disable loopback.
+        pub enable_loopback: bool,
+        /// `TXE` Transmit enable. If this bit is set to 1, the transmit section
+        /// of the UART is enabled. Data transmission occurs for either UART
+        /// signals, or SIR signals depending on the setting of the SIREN bit.
+        /// When the UART is disabled in the middle of transmission, it
+        /// completes the current character before stopping.
+        pub enable_transmit: bool,
+        /// `RXE` Receive enable. If this bit is set to 1, the receive section
+        /// of the UART is enabled. Data reception occurs for either UART
+        /// signals or SIR signals depending on the setting of the SIREN bit.
+        /// When the UART is disabled in the middle of reception, it completes
+        /// the current character before stopping.
+        pub enable_receive: bool,
+        /// `DTR` Data transmit ready. This bit is the complement of the UART
+        /// data transmit ready, `nUARTDTR`, modem status output. That is, when
+        /// the bit is programmed to a 1 then `nUARTDTR` is LOW.
+        pub data_transmit_ready: bool,
+        /// `RTS` Request to send. This bit is the complement of the UART
+        /// request to send, `nUARTRTS`, modem status output. That is, when the
+        /// bit is programmed to a 1 then `nUARTRTS` is LOW.
+        pub request_to_send: bool,
+        /// `Out1` This bit is the complement of the UART Out1 (`nUARTOut1`)
+        /// modem status output. That is, when the bit is programmed to a 1 the
+        /// output is 0. For DTE this can be used as Data Carrier Detect (DCD).
+        pub out_1: bool,
+        /// `Out2` This bit is the complement of the UART Out2 (`nUARTOut2`)
+        /// modem status output. That is, when the bit is programmed to a 1, the
+        /// output is 0. For DTE this can be used as Ring Indicator (RI).
+        pub out_2: bool,
+        /// `RTSEn` RTS hardware flow control enable. If this bit is set to 1,
+        /// RTS hardware flow control is enabled. Data is only requested when
+        /// there is space in the receive FIFO for it to be received.
+        pub rts_hardware_flow_control_enable: bool,
+        /// `CTSEn` CTS hardware flow control enable. If this bit is set to 1,
+        /// CTS hardware flow control is enabled. Data is only transmitted when
+        /// the `nUARTCTS` signal is asserted.
+        pub cts_hardware_flow_control_enable: bool,
+    }
+
+    impl Control {
+        pub fn reset(&mut self) {
+            *self = 0.into();
+            self.set_enable_receive(true);
+            self.set_enable_transmit(true);
+        }
+    }
+
+    impl Default for Control {
+        fn default() -> Self {
+            let mut ret: Self = 0.into();
+            ret.reset();
+            ret
+        }
+    }
+
+    /// Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC
+    pub const INT_OE: u32 = 1 << 10;
+    pub const INT_BE: u32 = 1 << 9;
+    pub const INT_PE: u32 = 1 << 8;
+    pub const INT_FE: u32 = 1 << 7;
+    pub const INT_RT: u32 = 1 << 6;
+    pub const INT_TX: u32 = 1 << 5;
+    pub const INT_RX: u32 = 1 << 4;
+    pub const INT_DSR: u32 = 1 << 3;
+    pub const INT_DCD: u32 = 1 << 2;
+    pub const INT_CTS: u32 = 1 << 1;
+    pub const INT_RI: u32 = 1 << 0;
+    pub const INT_E: u32 = INT_OE | INT_BE | INT_PE | INT_FE;
+    pub const INT_MS: u32 = INT_RI | INT_DSR | INT_DCD | INT_CTS;
+
+    #[repr(u32)]
+    pub enum Interrupt {
+        OE = 1 << 10,
+        BE = 1 << 9,
+        PE = 1 << 8,
+        FE = 1 << 7,
+        RT = 1 << 6,
+        TX = 1 << 5,
+        RX = 1 << 4,
+        DSR = 1 << 3,
+        DCD = 1 << 2,
+        CTS = 1 << 1,
+        RI = 1 << 0,
+    }
+
+    impl Interrupt {
+        pub const E: u32 = INT_OE | INT_BE | INT_PE | INT_FE;
+        pub const MS: u32 = INT_RI | INT_DSR | INT_DCD | INT_CTS;
+    }
+}
+
+// TODO: You must disable the UART before any of the control registers are
+// reprogrammed. When the UART is disabled in the middle of transmission or
+// reception, it completes the current character before stopping
diff --git a/rust/hw/char/pl011/src/memory_ops.rs b/rust/hw/char/pl011/src/memory_ops.rs
new file mode 100644
index 0000000000..6144d28586
--- /dev/null
+++ b/rust/hw/char/pl011/src/memory_ops.rs
@@ -0,0 +1,45 @@
+// Copyright 2024 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0 OR GPL-3.0-or-later
+
+use core::{mem::MaybeUninit, ptr::NonNull};
+
+use qemu_api::bindings::*;
+
+use crate::device::PL011State;
+
+pub static PL011_OPS: MemoryRegionOps = MemoryRegionOps {
+    read: Some(pl011_read),
+    write: Some(pl011_write),
+    read_with_attrs: None,
+    write_with_attrs: None,
+    endianness: device_endian_DEVICE_NATIVE_ENDIAN,
+    valid: unsafe { MaybeUninit::<MemoryRegionOps__bindgen_ty_1>::zeroed().assume_init() },
+    impl_: MemoryRegionOps__bindgen_ty_2 {
+        min_access_size: 4,
+        max_access_size: 4,
+        ..unsafe { MaybeUninit::<MemoryRegionOps__bindgen_ty_2>::zeroed().assume_init() }
+    },
+};
+
+#[no_mangle]
+unsafe extern "C" fn pl011_read(
+    opaque: *mut core::ffi::c_void,
+    addr: hwaddr,
+    size: core::ffi::c_uint,
+) -> u64 {
+    assert!(!opaque.is_null());
+    let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+    state.as_mut().read(addr, size)
+}
+
+#[no_mangle]
+unsafe extern "C" fn pl011_write(
+    opaque: *mut core::ffi::c_void,
+    addr: hwaddr,
+    data: u64,
+    _size: core::ffi::c_uint,
+) {
+    assert!(!opaque.is_null());
+    let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
+    state.as_mut().write(addr, data)
+}
diff --git a/rust/hw/meson.build b/rust/hw/meson.build
new file mode 100644
index 0000000000..860196645e
--- /dev/null
+++ b/rust/hw/meson.build
@@ -0,0 +1 @@
+subdir('char')
diff --git a/rust/meson.build b/rust/meson.build
index a903c7c602..4c858e9d1f 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -11,3 +11,5 @@ _lib_bindings_rs = static_library(
 )
 
 subdir('qemu-api')
+
+subdir('hw')
-- 
γαῖα πυρί μιχθήτω
