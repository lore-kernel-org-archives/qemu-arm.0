Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp819603njf;
        Thu, 15 Aug 2024 04:42:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNlxL+O3JUr+XNHmoMaU+57OHoM7Cj42V4yr9AjEXvuBDmu70UmBxsG8q4dAL40jEDHptWZOGFX01ky43ItBkMIh3T6/7I
X-Received: by 2002:a05:6512:124b:b0:52f:c10d:21f0 with SMTP id 2adb3069b0e04-532edbbf21fmr4240688e87.54.1723722176183;
        Thu, 15 Aug 2024 04:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723722176; cv=none;
        d=google.com; s=arc-20160816;
        b=lVPTQhRYwZTf0Ts01NlQFifmbvS6cdFNLRgW0QOqGZ8o/LbQKbx9WNTvJmjt5lrv94
         qYJ+uvf0tFkPUh4K7GWDQoHPtDcVYWRL+BMqyXhgfeyWhoQ7O6A+mNYHSCzsWS1+iQ9q
         wcjE3v3eSfvqN9H181Ud4bmGHwWPxj6Ni+7jQ0bQdblhd9AJI9Kf9xS890jQu8YTk9iA
         DIf1INp8letZuzwGEJiVH9qbYmkklKiGd6eXq3oNqMsCn260d+rF0bxpx71Sdh19M+p8
         gX9nPLVAqFUN2M272nt3ViOgBiSjcwjKIANC5iFNfaDxFXKImkk1ot6rH83crJq1zILE
         6eaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=4Yj9hQIIF1FTjGHS44YcyZPrJjc2WJIemrC3mw1WIUU=;
        fh=+vs+MkoqpzNB4zyQhrPmUHEl+Hyn51Ia1JkGWLgxQI4=;
        b=No3O1zDSk/YWu0k8szqKRWKqAn29xAC7OmlT25FKE7fjzJObQVdWKkSaaF7OjURG+n
         HfxoBy9GumYhLFutM5ULrXeG06IGXdeyqiqBB+ifDYP3WPDW/GLjGRGuo9UxfLUjn8YL
         ymO0IQuCLdLr6wkm3YhM+UULF5GYVWudx72DAqdf+SpOb1vobbZqHQCxxi5oPuDgnUxP
         pXkd1RXCgJ8CrfCViIJfR+Yiz0hklBXM6CEwxgtYTaAgFw67t/wJLYdplywjo1EsBEZJ
         NHXOLxTNg81jWLPte/SSK5Q+69lc5hr/U2qz02cdvY5lZupm4IlcwwGtK2yn7pilPC/v
         BusQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvhkvgSv;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d3dd1f0sor375419e87.13.2024.08.15.04.42.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 04:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvhkvgSv;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723722175; x=1724326975; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Yj9hQIIF1FTjGHS44YcyZPrJjc2WJIemrC3mw1WIUU=;
        b=kvhkvgSvoFBLbLzPBHWOAjsGAy5PVSt8o97VLtbQFBqSh2qlo4hGKRtOn2IW+H0xtF
         vJzbQKFBFxV9PhpCJboeAm46/j/IEzkjCt4EBYa6mQI9Km2KXRXHnQil1exy2kPzKVyj
         pTa09Jd6Gr7hXG+w9eIG8QNHyUhihTiflpV1EE8e6KWFD0w8Vl3Cj27H+i0ZP40njbDP
         sZofVnIEDeR1dTfSSinhGd4AIxWA8WLSQuOg4+6meOEPfA+mzXJpAXjMvmO0ZaZJz6WL
         6aA6aFq0J5Y+VFwi3wkPujy8rTXG3T55QgLkPgbo06ScGash5PPVsd8urL7stSAJyZGC
         dhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722175; x=1724326975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yj9hQIIF1FTjGHS44YcyZPrJjc2WJIemrC3mw1WIUU=;
        b=SQhTVu11UHo36aYjY8MeEwsSFfA5gSoxspt6cvj6zdZpWbC4oPtFZc9ynW0LO3cPIf
         RLIrCDqShOYDTPEEb8jhb1E29w5yUk8/fMtuiQQnK1JrLEuJbvPMjgynJp9nK6M33bSh
         E8JgOjbzy8uQzDd6mBiOW0sUy9oDsx6HRq4o3XwCef+s39SKhRhXIzcpGeVhcqHVc2Jh
         wtQE+zK+Yn4dBCoXcckEac1yVJx09cTfGFQk0+bu3kUXkHB/VLw2gpagPGfGesl9JiOG
         Itk3N75BxgRkD4pfRRm5K7wAt0hAz8187OTxMriDHsGYqwX5ctGUz018ZJ3wHY4WxwT4
         aHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoraKTbnGbR6uwSkIVh39rIrBGczKCVnrhTsXoX+Sykr7kUxrGkmjd10jVVkRQ4tjNVcaCUKDbm8+1qc/olyI0XAacCDaS
X-Gm-Message-State: AOJu0YyAhu/o8lvQarWGWh5AcLFL05/EGIdBW3cfLjQRCkleuxLWNJ+g
	R0ictxQCHQueb6ZzNioFiMKb4Ta/KP+A+fCzY1d4bLKLxxh8EwmPjaCJc/J1SwYETQ==
X-Google-Smtp-Source: AGHT+IHsRoL1yab0jqA8VzE+0U2IiriDN0IMhp8jLT25IG/elkyuxB9/A0vQv89XDlPP3XZaoSiORg==
X-Received: by 2002:a05:6512:68b:b0:530:a9fe:7bb6 with SMTP id 2adb3069b0e04-532eda8a8bemr3468229e87.30.1723722175329;
        Thu, 15 Aug 2024 04:42:55 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6bf1sm89547966b.21.2024.08.15.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:42:55 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 14:42:21 +0300
Subject: [PATCH v7 4/7] rust: add bindgen step as a meson dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-rust-pl011-v7-4-975135e98831@linaro.org>
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
In-Reply-To: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Junjie Mao <junjie.mao@intel.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, 
 Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8698;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=5pohEWpxNu7gHtQAi85K36q37MBA+ZAUTSdPnlTjkwQ=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12ZW11MXFsdE9wRGQxQnlJb1dBenNxMy93bStLCnJkUFQ3V1lXSGJoaGZ0a2Yw
 OHFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnIzcHJnQUt
 DUkIzS2Nkd2YzNEowUHAzRC85SkYzN25ab0tKbVJWRWMzRnozblVGN3NKaXVWV1U2NStDSFkrMg
 pzLzhEd1RoT0dDOGtoUFpwVDVSTmRCR1ZZM01ud2xTS1V5NTBxdjAzVUxWVmloRTRlUXJFNUdGd
 GNaeXdzOUJwCkNVenBGTnA4UVZreFR6STlIc25kVzBFUFlVZ0tQbTRyVEFpSFdNSDdpKy9vVllD
 ckRwb0hTaktmQ2M1aFNXbFcKWkc5RUxNMHJ3d2JGMk9DUjMrT1hNZGp1bGpuNXBjT2p6WlhiMTR
 jcDVDVTBGVGs0VlVPQ1NVVyt4QjR1WmdjRApvcGpxOGdRc2g5Rk5WQ1cyYlhNbjhQampSeU9QcX
 FTcVlzQnN0dGJwL1EzRk1uMFBQRXhMSTBubk9wcW1FYnZOClpKKy91UU1sVnNYQVhEY1NRbittS
 0VFekdxbmw0UjUwSXJLUXN4ZEdOdUIwQ3JBNUdSbG5Pay9FNCtocS8zSkwKNXBCRk44UVVMU2Vj
 cFBhdCtIN3hRbjlBTTZNMlRiY3ZtQ1VmcjNBQUhTU0l3Rjk3SGJZY21KRlkvWUlxMXUxSwpnN2d
 Ma203THh2aTdpQzlsbVllejJPbHRUanAxVmdxTjNPMVFQWTZzZzJmSUlZT05aK29VSlR1cUV5aE
 lhaG9VCk1oNzBWN2VlTjJ5OXM3RTI3TnV0ektaUmJOZ3l3bzFsQ1NkNEMyS3ZBTVFESGlsWlpKM
 0JNV0hIbS91SURJOGQKc3pQM0ZpVXlWV1F5RVZMVGdoSEFZSUlOeHEwUVlSK1dadCs1dFh4VTZt
 QnhFUzJJdHJNdGo0dDRIVi95NER6bQowMXRXT1VncStPQ1JzR05EcEJ6bUxYaXVobmllUGpORUF
 0RDhNYjdiMCtKZlh5TW5zODEwL3B5b3BJTWtlZXRUCmk4b2hmdz09Cj0za1VpCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: 2tMkUTcvqRJ+

Add bindings_rs target for generating rust bindings to target-independent
qemu C APIs.

The bindings need be created before any rust crate that uses them is
compiled.

The bindings.rs file will end up in BUILDDIR/bindings.rs and have the
same name as a target:

  ninja bindings.rs

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 MAINTAINERS           |  4 +++
 meson.build           | 52 +++++++++++++++++++++++++++++++
 rust/wrapper.h        | 39 ++++++++++++++++++++++++
 rust/.gitignore       |  3 ++
 rust/meson.build      |  0
 scripts/rustc_args.py | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 182 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0bc8e515da..5464cb2b03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4246,7 +4246,11 @@ F: docs/devel/docs.rst
 Rust build system integration
 M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 S: Maintained
+F: scripts/rustc_args.py
+F: rust/.gitignore
 F: rust/Kconfig
+F: rust/meson.build
+F: rust/wrapper.h
 
 Miscellaneous
 -------------
diff --git a/meson.build b/meson.build
index 065739ccb7..10a8f25068 100644
--- a/meson.build
+++ b/meson.build
@@ -303,6 +303,15 @@ foreach lang : all_languages
   endif
 endforeach
 
+if have_rust
+  rust_args = []
+  if get_option('debug')
+    rust_args += ['-g']
+  endif
+  if get_option('optimization') not in ['0', '1', 'g']
+    rust_args += ['-O']
+  endif
+endif
 # default flags for all hosts
 # We use -fwrapv to tell the compiler that we require a C dialect where
 # left shift of signed integers is well defined and has the expected
@@ -3871,6 +3880,49 @@ common_all = static_library('common',
                             implicit_include_directories: false,
                             dependencies: common_ss.all_dependencies())
 
+if have_rust and have_system
+  rust_args += run_command(
+    meson.global_source_root() / 'scripts/rustc_args.py',
+    '--config-headers', meson.project_build_root() / 'config-host.h',
+    capture : true,
+    check: true).stdout().strip().split()
+
+  bindings_rs = import('rust').bindgen(
+    input: 'rust/wrapper.h',
+    dependencies: common_ss.all_dependencies(),
+    output: 'bindings.rs',
+    include_directories: include_directories('.', 'include'),
+    bindgen_version: ['>=0.69.4'],
+    args: [
+      '--raw-line', '// @generated',
+      '--raw-line', '#![allow(dead_code)]',
+      '--raw-line', '#![allow(non_camel_case_types)]',
+      '--raw-line', '#![allow(non_snake_case)]',
+      '--raw-line', '#![allow(non_upper_case_globals)]',
+      '--raw-line', '#![allow(improper_ctypes_definitions)]',
+      '--raw-line', '#![allow(improper_ctypes)]',
+      '--raw-line', 'unsafe impl Send for Property {}',
+      '--raw-line', 'unsafe impl Sync for Property {}',
+      '--raw-line', 'unsafe impl Sync for TypeInfo {}',
+      '--raw-line', 'unsafe impl Sync for VMStateDescription {}',
+      '--ctypes-prefix', 'core::ffi',
+      '--formatter', 'rustfmt',
+      '--generate-block',
+      '--generate-cstr',
+      '--impl-debug',
+      '--merge-extern-blocks',
+      '--no-doc-comments',
+      '--use-core',
+      '--with-derive-default',
+      '--allowlist-file', meson.project_source_root() + '/include/.*',
+      '--allowlist-file', meson.project_source_root() + '/.*',
+      '--allowlist-file', meson.project_build_root() + '/.*'
+      ],
+    )
+  subdir('rust')
+endif
+
+
 feature_to_c = find_program('scripts/feature_to_c.py')
 
 if host_os == 'darwin'
diff --git a/rust/wrapper.h b/rust/wrapper.h
new file mode 100644
index 0000000000..51985f0ef1
--- /dev/null
+++ b/rust/wrapper.h
@@ -0,0 +1,39 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright 2024 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu-io.h"
+#include "sysemu/sysemu.h"
+#include "hw/sysbus.h"
+#include "exec/memory.h"
+#include "chardev/char-fe.h"
+#include "hw/clock.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/irq.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "chardev/char-serial.h"
diff --git a/rust/.gitignore b/rust/.gitignore
new file mode 100644
index 0000000000..1bf71b1f68
--- /dev/null
+++ b/rust/.gitignore
@@ -0,0 +1,3 @@
+# Ignore any cargo development build artifacts; for qemu-wide builds, all build
+# artifacts will go to the meson build directory.
+target
diff --git a/rust/meson.build b/rust/meson.build
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/scripts/rustc_args.py b/scripts/rustc_args.py
new file mode 100644
index 0000000000..e4cc9720e1
--- /dev/null
+++ b/scripts/rustc_args.py
@@ -0,0 +1,84 @@
+#!/usr/bin/env python3
+
+"""Generate rustc arguments for meson rust builds.
+
+This program generates --cfg compile flags for the configuration headers passed
+as arguments.
+
+Copyright (c) 2024 Linaro Ltd.
+
+Authors:
+ Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+
+This program is free software; you can redistribute it and/or modify
+it under the terms of the GNU General Public License as published by
+the Free Software Foundation; either version 2 of the License, or
+(at your option) any later version.
+
+This program is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY; without even the implied warranty of
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License
+along with this program.  If not, see <http://www.gnu.org/licenses/>.
+"""
+
+import argparse
+import logging
+
+from typing import List
+
+
+def generate_cfg_flags(header: str) -> List[str]:
+    """Converts defines from config[..].h headers to rustc --cfg flags."""
+
+    def cfg_name(name: str) -> str:
+        """Filter function for C #defines"""
+        if (
+            name.startswith("CONFIG_")
+            or name.startswith("TARGET_")
+            or name.startswith("HAVE_")
+        ):
+            return name
+        return ""
+
+    with open(header, encoding="utf-8") as cfg:
+        config = [l.split()[1:] for l in cfg if l.startswith("#define")]
+
+    cfg_list = []
+    for cfg in config:
+        name = cfg_name(cfg[0])
+        if not name:
+            continue
+        if len(cfg) >= 2 and cfg[1] != "1":
+            continue
+        cfg_list.append("--cfg")
+        cfg_list.append(name)
+    return cfg_list
+
+
+def main() -> None:
+    # pylint: disable=missing-function-docstring
+    parser = argparse.ArgumentParser()
+    parser.add_argument("-v", "--verbose", action="store_true")
+    parser.add_argument(
+        "--config-headers",
+        metavar="CONFIG_HEADER",
+        action="append",
+        dest="config_headers",
+        help="paths to any configuration C headers (*.h files), if any",
+        required=False,
+        default=[],
+    )
+    args = parser.parse_args()
+    if args.verbose:
+        logging.basicConfig(level=logging.DEBUG)
+    logging.debug("args: %s", args)
+    for header in args.config_headers:
+        for tok in generate_cfg_flags(header):
+            print(tok)
+
+
+if __name__ == "__main__":
+    main()

-- 
2.44.0
