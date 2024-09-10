Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1254553njb;
        Tue, 10 Sep 2024 05:35:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHpId8V7HvV60vdjHqZ6dniZQHLgF4qJagEgmEGU6YM3nsOaC5O80iIrabxQlkvlbHjApFmxgeBYgNOA==@linaro.org
X-Received: by 2002:a05:6512:691:b0:533:483f:957b with SMTP id 2adb3069b0e04-5365881586fmr8390612e87.61.1725971746651;
        Tue, 10 Sep 2024 05:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725971746; cv=none;
        d=google.com; s=arc-20160816;
        b=C6jzF6juoWM7TseNQ2V6LHgjyBV22n19nSs9AIVf7ec9YTWY/WZy75cAb/OLLGrrp0
         OhBG35Aiyzt7tnvITUtw9YdH1H6LId5KWeVZfWkcpaYI4puuWhVUKmOeG4fk5UB7c71b
         Wex7q4Sy7NeJmTJRzfDUjcEFQJr1xfeWIz1dnkwiGdHPPs+QKw/XFAyrx/nP7yBap56b
         lQ1lYeB0uifXGKwNaMwKSgub7vOvkUKPA8yPPvPiQ53U4vrWJhe+imRmjo/YeKx+EScK
         39xg7eRmikPaOClC27kwfH5XhXMbKThSIX/xw8pAcsPU0Tg0GOlgfSfxpKEuwKwKiiVl
         MJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=oozWDzxRa3OFTvSBR+kskwMo7ZoeyND1wnQiqMMn+jw=;
        fh=1nu96vEdpQrPNSjPTj7d4Nhhh7Lk1AWy4jrkDoSjQ+o=;
        b=OxUwQpjYBdh7auXKFi9xBXatPL+1u9pZOe3wppvCvYrlY/kcn3Kq4dh8GFGcmsEK6a
         sjeQv5Ivm97xNA3aCx417Hbbp5rQaN7l/qP830zuru92s3hhXKrTA/MaQGTPGJ2MiiU6
         1ynEOiBh2VJU70bKaN2XXDrD1yrb9dNDP538Ctxtx1+CKSdxloB7DX9bZJJNHsJflzm1
         lG4NvRX43FDsbWv5BYmTCTsDj7F8+QOKUbh4ByuxeOEd2KSdBr7B0WYAhdJtoTC1UWPN
         CxBCfDzPnX+qzzzzUhIhlyot55zf0qId/qbX3akVhpjuUpI2MKGTmKymO0OA8qp5AHTi
         3U0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGj1tfV0;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d257f3c1fsor210876066b.2.2024.09.10.05.35.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 05:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGj1tfV0;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725971746; x=1726576546; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oozWDzxRa3OFTvSBR+kskwMo7ZoeyND1wnQiqMMn+jw=;
        b=JGj1tfV0seRTpzF/sWwhYMdhs8HmVQele0aUEq0GvGfE3evH/+yidFM9GOa5xJYmgg
         yN1NmR7eKZ1Ltcze/hn90b1mx3J2TRstcUrGmXGUUI4doHMlwiNEyVdekEjicL32FWte
         FKCKn+MAoKrOvKqGXPaofzG5dK7Ol190LUW2DscIpnIGKAnOjnGvKMjyP8x8L7g0XVZQ
         AOT3VphRD9lPZNjx0q5LEA5NFVMrewHRWQHajqLkdL2b4BnNwuuO+hLuLVaQITfm3Ovu
         bwGiKVwg4aEMKEphX9pDLxaC6wRpexoAk7kDIQIYCvY+sh3gdaV+ZJuGq6bIY3uNwQUl
         wd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971746; x=1726576546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oozWDzxRa3OFTvSBR+kskwMo7ZoeyND1wnQiqMMn+jw=;
        b=kOBITPHALbAfTS95WaeCW+8stadiDekpzE8ZKPY3DyBb2SRj5Z4xhQO1GpJDJgoezB
         Ez+YZ6tt9vo57OpkbhCADHb6gSk7XOaiG4A78sQNbH5A10b2c0muRicFS3S5tgOWxJN4
         Gb/aDpSwjrLP02m7XCZzhbhcJGgNwnEzpA6LMNO09HUh00vfcR7Ea2paGLVEU/Wl8LJx
         DBpOBs/PMz2CZuLJVeQjsGlunSjouBgQxh/GpXhWeDWQbjtnzJwAGd2bMn0BWXwoSjvR
         wC8Uv8d1COVs8fl6Sg6DRY2SnpBwf3cU4xuNp+xdQdPn8gXvlA5T7GYW0kF0vcLwpbXH
         DgKA==
X-Forwarded-Encrypted: i=1; AJvYcCUiiVcGEl/x3j/7SwCL2UZ6KNw5xjbZey9DuOhZZeqCU34vZDvyejIbQftv1DUdonkaqCrlJI0fTzWCCA==@linaro.org
X-Gm-Message-State: AOJu0YwjQZDQ81CNJJg276fbUKDNOJMYz/b9czhnZy8yyVVZnkoCBhNe
	YboYu/CTkv9ROlI+ZqkHXGG4pJbMvFeobPzopIxBYbfgtKBv+2CkfEKEUoyh+E/JWUXjtbRaH+Z
	13IWoKw==
X-Google-Smtp-Source: AGHT+IHLM1DTt4mK71Hvn4+i+1gvcryIY0/d8pCVcHUP8arHQVDaY3BOk7UfAVfyHuyYPITeqEJ/Xw==
X-Received: by 2002:a05:6402:3549:b0:5c2:62e8:2d5e with SMTP id 4fb4d7f45d1cf-5c3dc779d5amr10596400a12.1.1725971745477;
        Tue, 10 Sep 2024 05:35:45 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-234.109.242.225.tellas.gr. [109.242.225.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41cd7sm4242994a12.3.2024.09.10.05.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:35:45 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 10 Sep 2024 15:35:13 +0300
Subject: [PATCH v10 7/9] rust: add crate to expose bindings and interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rust-pl011-v10-7-85a89ee33c40@linaro.org>
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
In-Reply-To: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Junjie Mao <junjie.mao@intel.com>, 
 Zhao Liu <zhao1.liu@intel.com>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
X-Mailer: b4 0.15-dev-c2c95
X-Developer-Signature: v=1; a=openpgp-sha256; l=22233;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=l6kuC21pI31i8JUJMf1uYt7rclqeHXqcoKEBypHVNOc=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm00RDBNcVFTcXRaM0tUdzdUNEM1WHlkVlB2TDc5Ck5VUGN4L0pVYjYvN09uNlU5
 dEtKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnVBOURBQUt
 DUkIzS2Nkd2YzNEowR3FERC80Z3F6R0lZVWhncmRDZ1lSQUhvVEsyK1dVemxVRU54dXdxVWkrVA
 prdVhLL2FIQkhjUUFEaW9SMTJZVlgzeVF0VlRzdlFWYUlVdXBQV1BPVzJ1d2tXYm9iejEyMTA1U
 nNVVmRNYnhlCkpKYkFBNWJFVkpHV3JnVVppN0JBQjMvMXo0L2xsVFN3QjZxWHBRbkYwb24yMFFR
 OEJqV2JaaFhpcjN3KzVHVy8KbWd2NlRlSVg4TU0xdDRLYm5rQWtlTFlIbHdPQUg1ZHBxSUE0UVd
 5WUFOd21nU1JTcTZmQ0NYVUZUeFhmU0h0UApFWFBVaTNjN09mSnptdmxrV05nMEE1ckVKNXhJWm
 dQY2drMEY0dWNoU0FnVGJ6cDFVR2lYTkZ2ckdFMmNGWlU2Ckw4R001cW0vRmFPaTlVR1hGQjVua
 TR4dGxyRWNyL28zeXpaSlRwRmNYVGttMlZOMEd2ekhBNEk5MjNNeE04MTMKV3hXQmRlcnhUbXNa
 R1ZtVitLYzhyQXpCK2FTZytzaGdpMndlSjl0K3d6bzZ4RDdZaTNYOFNvSEZCZUU1YTNqcwpHWDJ
 nTGdCeTZQYTlqK0F4dzVjUXBILzMyVEEwdmQ0Qkk0dFpRZC9lRU9uREFaRmtodkhVN1RRK01qc3
 lXTEdaCnRLaWxwbUJZVTZ6SDZ5ZDhiaks1Zkp4RlJaeG4vU09ObDB6a3FKQUxvSUljL1JFU3cvN
 WtqdDRtdWhFbTZLcXYKNTNFMFE1eUsyUmlYcDM4bUM2OHpmRHBqNFh1RHBZN21KeHBjcThOamhX
 U29UTlErdCtaRnh5aURhWFBYYzREVgpxK3c4VEFWaXdaVG5tVWhHdDd1RGtSK2ROUFc0Ry96VkJ
 2YTIxZmQ4d3o5OTVNM2hWV2NwMnNCZnkxRVUvLzdLCkhOcWhmZz09Cj1kOXJKCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: V9jv0jKdl8bC

Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings and
provides some declaration macros for symbols visible to the rest of
QEMU.

Co-authored-by: Junjie Mao <junjie.mao@intel.com>
Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Junjie Mao <junjie.mao@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 MAINTAINERS                       |   6 ++
 rust/meson.build                  |   1 +
 rust/qemu-api/.gitignore          |   2 +
 rust/qemu-api/Cargo.lock          |   7 ++
 rust/qemu-api/Cargo.toml          |  26 +++++++
 rust/qemu-api/README.md           |  17 +++++
 rust/qemu-api/build.rs            |  14 ++++
 rust/qemu-api/meson.build         |  21 ++++++
 rust/qemu-api/src/definitions.rs  | 109 +++++++++++++++++++++++++++
 rust/qemu-api/src/device_class.rs | 128 +++++++++++++++++++++++++++++++
 rust/qemu-api/src/lib.rs          | 154 ++++++++++++++++++++++++++++++++++++++
 rust/qemu-api/src/tests.rs        |  49 ++++++++++++
 rust/rustfmt.toml                 |   7 ++
 13 files changed, 541 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 642c07a9ff2ed2422ac50d1419751f92f81690bd..d35e9f6b20bb23c7580de488ebaabc6c031343d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3348,6 +3348,12 @@ F: hw/core/register.c
 F: include/hw/register.h
 F: include/hw/registerfields.h
 
+Rust
+M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+S: Maintained
+F: rust/qemu-api
+F: rust/rustfmt.toml
+
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
 S: Maintained
diff --git a/rust/meson.build b/rust/meson.build
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4a58d106b1dd1d7bee39dd129f57ddb5a95bd9b7 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -0,0 +1 @@
+subdir('qemu-api')
diff --git a/rust/qemu-api/.gitignore b/rust/qemu-api/.gitignore
new file mode 100644
index 0000000000000000000000000000000000000000..b9e7e004c867bd1b5d44e69634d78fdafbfc1306
--- /dev/null
+++ b/rust/qemu-api/.gitignore
@@ -0,0 +1,2 @@
+# Ignore generated bindings file overrides.
+src/bindings.rs
diff --git a/rust/qemu-api/Cargo.lock b/rust/qemu-api/Cargo.lock
new file mode 100644
index 0000000000000000000000000000000000000000..e9c51a243a85499cfa3ce2f9da225184ddf05d24
--- /dev/null
+++ b/rust/qemu-api/Cargo.lock
@@ -0,0 +1,7 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 3
+
+[[package]]
+name = "qemu_api"
+version = "0.1.0"
diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
new file mode 100644
index 0000000000000000000000000000000000000000..3677def3fe2b28398e3b013340a5f3d18f554004
--- /dev/null
+++ b/rust/qemu-api/Cargo.toml
@@ -0,0 +1,26 @@
+[package]
+name = "qemu_api"
+version = "0.1.0"
+edition = "2021"
+authors = ["Manos Pitsidianakis <manos.pitsidianakis@linaro.org>"]
+license = "GPL-2.0-or-later"
+readme = "README.md"
+homepage = "https://www.qemu.org"
+description = "Rust bindings for QEMU"
+repository = "https://gitlab.com/qemu-project/qemu/"
+resolver = "2"
+publish = false
+keywords = []
+categories = []
+
+[dependencies]
+
+[features]
+default = []
+allocator = []
+
+# Do not include in any global workspace
+[workspace]
+
+[lints.rust]
+unexpected_cfgs = { level = "warn", check-cfg = ['cfg(MESON)', 'cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)'] }
diff --git a/rust/qemu-api/README.md b/rust/qemu-api/README.md
new file mode 100644
index 0000000000000000000000000000000000000000..7588fa29ef37e29d424fc7c333ea1c9c6139181b
--- /dev/null
+++ b/rust/qemu-api/README.md
@@ -0,0 +1,17 @@
+# QEMU bindings and API wrappers
+
+This library exports helper Rust types, Rust macros and C FFI bindings for internal QEMU APIs.
+
+The C bindings can be generated with `bindgen`, using this build target:
+
+```console
+$ ninja bindings.rs
+```
+
+## Generate Rust documentation
+
+To generate docs for this crate, including private items:
+
+```sh
+cargo doc --no-deps --document-private-items
+```
diff --git a/rust/qemu-api/build.rs b/rust/qemu-api/build.rs
new file mode 100644
index 0000000000000000000000000000000000000000..419b154c2d267a4b067b66f17b882bed0e65493a
--- /dev/null
+++ b/rust/qemu-api/build.rs
@@ -0,0 +1,14 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+use std::path::Path;
+
+fn main() {
+    if !Path::new("src/bindings.rs").exists() {
+        panic!(
+            "No generated C bindings found! Either build them manually with bindgen or with meson \
+             (`ninja bindings.rs`) and copy them to src/bindings.rs, or build through meson."
+        );
+    }
+}
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..1609f2dbb3933a8460ed0c95e7008be3969a11bd
--- /dev/null
+++ b/rust/qemu-api/meson.build
@@ -0,0 +1,21 @@
+_qemu_api_rs = static_library(
+  'qemu_api',
+  structured_sources(
+    [
+      'src/lib.rs',
+      'src/definitions.rs',
+      'src/device_class.rs',
+    ],
+    {'.' : bindings_rs},
+  ),
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  rust_args: rustc_config_args + [
+    '--cfg', 'MESON',
+    # '--cfg', 'feature="allocator"',
+  ],
+)
+
+qemu_api = declare_dependency(
+  link_with: _qemu_api_rs,
+)
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4abd0253bd1ff4f3f2e11528329709ef54a43c24
--- /dev/null
+++ b/rust/qemu-api/src/definitions.rs
@@ -0,0 +1,109 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Definitions required by QEMU when registering a device.
+
+/// Trait a type must implement to be registered with QEMU.
+pub trait ObjectImpl {
+    type Class;
+    const TYPE_INFO: crate::bindings::TypeInfo;
+    const TYPE_NAME: &'static ::core::ffi::CStr;
+    const PARENT_TYPE_NAME: Option<&'static ::core::ffi::CStr>;
+    const INSTANCE_INIT: ::core::option::Option<
+        unsafe extern "C" fn(obj: *mut crate::bindings::Object),
+    >;
+    const INSTANCE_POST_INIT: ::core::option::Option<
+        unsafe extern "C" fn(obj: *mut crate::bindings::Object),
+    >;
+    const INSTANCE_FINALIZE: ::core::option::Option<
+        unsafe extern "C" fn(obj: *mut crate::bindings::Object),
+    >;
+    const ABSTRACT: bool;
+}
+
+pub trait Class {
+    const CLASS_INIT: ::core::option::Option<
+        unsafe extern "C" fn(
+            klass: *mut crate::bindings::ObjectClass,
+            data: *mut core::ffi::c_void,
+        ),
+    >;
+    const CLASS_BASE_INIT: ::core::option::Option<
+        unsafe extern "C" fn(
+            klass: *mut crate::bindings::ObjectClass,
+            data: *mut core::ffi::c_void,
+        ),
+    >;
+}
+
+#[macro_export]
+macro_rules! module_init {
+    ($func:expr, $type:expr) => {
+        #[used]
+        #[cfg_attr(target_os = "linux", link_section = ".ctors")]
+        #[cfg_attr(target_os = "macos", link_section = "__DATA,__mod_init_func")]
+        #[cfg_attr(target_os = "windows", link_section = ".CRT$XCU")]
+        pub static LOAD_MODULE: extern "C" fn() = {
+            assert!($type < $crate::bindings::module_init_type_MODULE_INIT_MAX);
+
+            extern "C" fn __load() {
+                unsafe {
+                    $crate::bindings::register_module_init(Some($func), $type);
+                }
+            }
+
+            __load
+        };
+    };
+    (qom: $func:ident => $body:block) => {
+        // NOTE: To have custom identifiers for the ctor func we need to either supply
+        // them directly as a macro argument or create them with a proc macro.
+        #[used]
+        #[cfg_attr(target_os = "linux", link_section = ".ctors")]
+        #[cfg_attr(target_os = "macos", link_section = "__DATA,__mod_init_func")]
+        #[cfg_attr(target_os = "windows", link_section = ".CRT$XCU")]
+        pub static LOAD_MODULE: extern "C" fn() = {
+            extern "C" fn __load() {
+                #[no_mangle]
+                unsafe extern "C" fn $func() {
+                    $body
+                }
+
+                unsafe {
+                    $crate::bindings::register_module_init(
+                        Some($func),
+                        $crate::bindings::module_init_type_MODULE_INIT_QOM,
+                    );
+                }
+            }
+
+            __load
+        };
+    };
+}
+
+#[macro_export]
+macro_rules! type_info {
+    ($t:ty) => {
+        $crate::bindings::TypeInfo {
+            name: <$t as $crate::definitions::ObjectImpl>::TYPE_NAME.as_ptr(),
+            parent: if let Some(pname) = <$t as $crate::definitions::ObjectImpl>::PARENT_TYPE_NAME {
+                pname.as_ptr()
+            } else {
+                ::core::ptr::null_mut()
+            },
+            instance_size: ::core::mem::size_of::<$t>(),
+            instance_align: ::core::mem::align_of::<$t>(),
+            instance_init: <$t as $crate::definitions::ObjectImpl>::INSTANCE_INIT,
+            instance_post_init: <$t as $crate::definitions::ObjectImpl>::INSTANCE_POST_INIT,
+            instance_finalize: <$t as $crate::definitions::ObjectImpl>::INSTANCE_FINALIZE,
+            abstract_: <$t as $crate::definitions::ObjectImpl>::ABSTRACT,
+            class_size:  ::core::mem::size_of::<<$t as $crate::definitions::ObjectImpl>::Class>(),
+            class_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::Class>::CLASS_INIT,
+            class_base_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::Class>::CLASS_BASE_INIT,
+            class_data: ::core::ptr::null_mut(),
+            interfaces: ::core::ptr::null_mut(),
+        };
+    }
+}
diff --git a/rust/qemu-api/src/device_class.rs b/rust/qemu-api/src/device_class.rs
new file mode 100644
index 0000000000000000000000000000000000000000..69ee912c333c3dce8bc127a286acaadd57ca20b3
--- /dev/null
+++ b/rust/qemu-api/src/device_class.rs
@@ -0,0 +1,128 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+use std::sync::OnceLock;
+
+use crate::bindings::Property;
+
+#[macro_export]
+macro_rules! device_class_init {
+    ($func:ident, props => $props:ident, realize_fn => $realize_fn:expr, reset_fn => $reset_fn:expr, vmsd => $vmsd:ident$(,)*) => {
+        #[no_mangle]
+        pub unsafe extern "C" fn $func(
+            klass: *mut $crate::bindings::ObjectClass,
+            _: *mut ::core::ffi::c_void,
+        ) {
+            let mut dc =
+                ::core::ptr::NonNull::new(klass.cast::<$crate::bindings::DeviceClass>()).unwrap();
+            dc.as_mut().realize = $realize_fn;
+            dc.as_mut().reset = $reset_fn;
+            dc.as_mut().vmsd = &$vmsd;
+            $crate::bindings::device_class_set_props(dc.as_mut(), $props.as_mut_ptr());
+        }
+    };
+}
+
+#[macro_export]
+macro_rules! define_property {
+    ($name:expr, $state:ty, $field:expr, $prop:expr, $type:expr, default = $defval:expr$(,)*) => {
+        $crate::bindings::Property {
+            name: {
+                #[used]
+                static _TEMP: &::core::ffi::CStr = $name;
+                _TEMP.as_ptr()
+            },
+            info: $prop,
+            offset: ::core::mem::offset_of!($state, $field)
+                .try_into()
+                .expect("Could not fit offset value to type"),
+            bitnr: 0,
+            bitmask: 0,
+            set_default: true,
+            defval: $crate::bindings::Property__bindgen_ty_1 { u: $defval.into() },
+            arrayoffset: 0,
+            arrayinfo: ::core::ptr::null(),
+            arrayfieldsize: 0,
+            link_type: ::core::ptr::null(),
+        }
+    };
+    ($name:expr, $state:ty, $field:expr, $prop:expr, $type:expr$(,)*) => {
+        $crate::bindings::Property {
+            name: {
+                #[used]
+                static _TEMP: &::core::ffi::CStr = $name;
+                _TEMP.as_ptr()
+            },
+            info: $prop,
+            offset: ::core::mem::offset_of!($state, $field)
+                .try_into()
+                .expect("Could not fit offset value to type"),
+            bitnr: 0,
+            bitmask: 0,
+            set_default: false,
+            defval: $crate::bindings::Property__bindgen_ty_1 { i: 0 },
+            arrayoffset: 0,
+            arrayinfo: ::core::ptr::null(),
+            arrayfieldsize: 0,
+            link_type: ::core::ptr::null(),
+        }
+    };
+}
+
+#[repr(C)]
+pub struct Properties<const N: usize>(pub OnceLock<[Property; N]>, pub fn() -> [Property; N]);
+
+impl<const N: usize> Properties<N> {
+    pub fn as_mut_ptr(&mut self) -> *mut Property {
+        _ = self.0.get_or_init(self.1);
+        self.0.get_mut().unwrap().as_mut_ptr()
+    }
+}
+
+#[macro_export]
+macro_rules! declare_properties {
+    ($ident:ident, $($prop:expr),*$(,)*) => {
+
+        const fn _calc_prop_len() -> usize {
+            let mut len = 1;
+            $({
+                _ = stringify!($prop);
+                len += 1;
+            })*
+            len
+        }
+        const PROP_LEN: usize = _calc_prop_len();
+
+        fn _make_properties() -> [$crate::bindings::Property; PROP_LEN] {
+            [
+                $($prop),*,
+                    unsafe { ::core::mem::MaybeUninit::<$crate::bindings::Property>::zeroed().assume_init() },
+            ]
+        }
+
+        #[no_mangle]
+        pub static mut $ident: $crate::device_class::Properties<PROP_LEN> = $crate::device_class::Properties(::std::sync::OnceLock::new(), _make_properties);
+    };
+}
+
+#[macro_export]
+macro_rules! vm_state_description {
+    ($(#[$outer:meta])*
+     $name:ident,
+     $(name: $vname:expr,)*
+     $(unmigratable: $um_val:expr,)*
+    ) => {
+        #[used]
+        $(#[$outer])*
+        pub static $name: $crate::bindings::VMStateDescription = $crate::bindings::VMStateDescription {
+            $(name: {
+                #[used]
+                static VMSTATE_NAME: &::core::ffi::CStr = $vname;
+                $vname.as_ptr()
+            },)*
+            unmigratable: true,
+            ..unsafe { ::core::mem::MaybeUninit::<$crate::bindings::VMStateDescription>::zeroed().assume_init() }
+        };
+    }
+}
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
new file mode 100644
index 0000000000000000000000000000000000000000..26637024907dc23d5ca81a8ce21cd9c307c022ea
--- /dev/null
+++ b/rust/qemu-api/src/lib.rs
@@ -0,0 +1,154 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#![cfg_attr(not(MESON), doc = include_str!("../README.md"))]
+
+#[allow(
+    dead_code,
+    improper_ctypes_definitions,
+    improper_ctypes,
+    non_camel_case_types,
+    non_snake_case,
+    non_upper_case_globals,
+    clippy::missing_const_for_fn,
+    clippy::too_many_arguments,
+    clippy::approx_constant,
+    clippy::use_self,
+    clippy::useless_transmute,
+    clippy::missing_safety_doc,
+)]
+#[rustfmt::skip]
+pub mod bindings;
+
+unsafe impl Send for bindings::Property {}
+unsafe impl Sync for bindings::Property {}
+unsafe impl Sync for bindings::TypeInfo {}
+unsafe impl Sync for bindings::VMStateDescription {}
+
+pub mod definitions;
+pub mod device_class;
+
+#[cfg(test)]
+mod tests;
+
+use std::alloc::{GlobalAlloc, Layout};
+
+#[cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)]
+extern "C" {
+    fn g_aligned_alloc0(
+        n_blocks: bindings::gsize,
+        n_block_bytes: bindings::gsize,
+        alignment: bindings::gsize,
+    ) -> bindings::gpointer;
+    fn g_aligned_free(mem: bindings::gpointer);
+}
+
+#[cfg(not(HAVE_GLIB_WITH_ALIGNED_ALLOC))]
+extern "C" {
+    fn qemu_memalign(alignment: usize, size: usize) -> *mut ::core::ffi::c_void;
+    fn qemu_vfree(ptr: *mut ::core::ffi::c_void);
+}
+
+extern "C" {
+    fn g_malloc0(n_bytes: bindings::gsize) -> bindings::gpointer;
+    fn g_free(mem: bindings::gpointer);
+}
+
+/// An allocator that uses the same allocator as QEMU in C.
+///
+/// It is enabled by default with the `allocator` feature.
+///
+/// To set it up manually as a global allocator in your crate:
+///
+/// ```ignore
+/// use qemu_api::QemuAllocator;
+///
+/// #[global_allocator]
+/// static GLOBAL: QemuAllocator = QemuAllocator::new();
+/// ```
+#[derive(Clone, Copy, Debug)]
+#[repr(C)]
+pub struct QemuAllocator {
+    _unused: [u8; 0],
+}
+
+#[cfg_attr(all(feature = "allocator", not(test)), global_allocator)]
+pub static GLOBAL: QemuAllocator = QemuAllocator::new();
+
+impl QemuAllocator {
+    // From the glibc documentation, on GNU systems, malloc guarantees 16-byte
+    // alignment on 64-bit systems and 8-byte alignment on 32-bit systems. See
+    // https://www.gnu.org/software/libc/manual/html_node/Malloc-Examples.html.
+    // This alignment guarantee also applies to Windows and Android. On Darwin
+    // and OpenBSD, the alignment is 16 bytes on both 64-bit and 32-bit systems.
+    #[cfg(all(
+        target_pointer_width = "32",
+        not(any(target_os = "macos", target_os = "openbsd"))
+    ))]
+    pub const DEFAULT_ALIGNMENT_BYTES: Option<usize> = Some(8);
+    #[cfg(all(
+        target_pointer_width = "64",
+        not(any(target_os = "macos", target_os = "openbsd"))
+    ))]
+    pub const DEFAULT_ALIGNMENT_BYTES: Option<usize> = Some(16);
+    #[cfg(all(
+        any(target_pointer_width = "32", target_pointer_width = "64"),
+        any(target_os = "macos", target_os = "openbsd")
+    ))]
+    pub const DEFAULT_ALIGNMENT_BYTES: Option<usize> = Some(16);
+    #[cfg(not(any(target_pointer_width = "32", target_pointer_width = "64")))]
+    pub const DEFAULT_ALIGNMENT_BYTES: Option<usize> = None;
+
+    pub const fn new() -> Self {
+        Self { _unused: [] }
+    }
+}
+
+impl Default for QemuAllocator {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+// Sanity check.
+const _: [(); 8] = [(); ::core::mem::size_of::<*mut ::core::ffi::c_void>()];
+
+unsafe impl GlobalAlloc for QemuAllocator {
+    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
+        if matches!(Self::DEFAULT_ALIGNMENT_BYTES, Some(default) if default.checked_rem(layout.align()) == Some(0))
+        {
+            g_malloc0(layout.size().try_into().unwrap()).cast::<u8>()
+        } else {
+            #[cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)]
+            {
+                g_aligned_alloc0(
+                    layout.size().try_into().unwrap(),
+                    1,
+                    (8 * layout.align()).try_into().unwrap(),
+                )
+                .cast::<u8>()
+            }
+            #[cfg(not(HAVE_GLIB_WITH_ALIGNED_ALLOC))]
+            {
+                qemu_memalign(8 * layout.align(), layout.size()).cast::<u8>()
+            }
+        }
+    }
+
+    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
+        if matches!(Self::DEFAULT_ALIGNMENT_BYTES, Some(default) if default.checked_rem(layout.align()) == Some(0))
+        {
+            g_free(ptr.cast::<_>())
+        } else {
+            #[cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)]
+            {
+                g_aligned_free(ptr.cast::<_>())
+            }
+            #[cfg(not(HAVE_GLIB_WITH_ALIGNED_ALLOC))]
+            {
+                qemu_vfree(ptr.cast::<_>())
+            }
+        }
+    }
+}
diff --git a/rust/qemu-api/src/tests.rs b/rust/qemu-api/src/tests.rs
new file mode 100644
index 0000000000000000000000000000000000000000..df54edbd4e27e7d2aafc243355d1826d52497c21
--- /dev/null
+++ b/rust/qemu-api/src/tests.rs
@@ -0,0 +1,49 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+use crate::{
+    bindings::*, declare_properties, define_property, device_class_init, vm_state_description,
+};
+
+#[test]
+fn test_device_decl_macros() {
+    // Test that macros can compile.
+    vm_state_description! {
+        VMSTATE,
+        name: c"name",
+        unmigratable: true,
+    }
+
+    #[repr(C)]
+    pub struct DummyState {
+        pub char_backend: CharBackend,
+        pub migrate_clock: bool,
+    }
+
+    declare_properties! {
+        DUMMY_PROPERTIES,
+            define_property!(
+                c"chardev",
+                DummyState,
+                char_backend,
+                unsafe { &qdev_prop_chr },
+                CharBackend
+            ),
+            define_property!(
+                c"migrate-clk",
+                DummyState,
+                migrate_clock,
+                unsafe { &qdev_prop_bool },
+                bool
+            ),
+    }
+
+    device_class_init! {
+        dummy_class_init,
+        props => DUMMY_PROPERTIES,
+        realize_fn => None,
+        reset_fn => None,
+        vmsd => VMSTATE,
+    }
+}
diff --git a/rust/rustfmt.toml b/rust/rustfmt.toml
new file mode 100644
index 0000000000000000000000000000000000000000..ebecb99fe09e010d66c06b324f43d77b8ee00ea9
--- /dev/null
+++ b/rust/rustfmt.toml
@@ -0,0 +1,7 @@
+edition = "2021"
+format_generated_files = false
+format_code_in_doc_comments = true
+format_strings = true
+imports_granularity = "Crate"
+group_imports = "StdExternalCrate"
+wrap_comments = true

-- 
2.45.2
