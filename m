Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb5ad8sm8715799a12.34.2025.03.04.14.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:51 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 32B946082D;
	Tue,  4 Mar 2025 22:24:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 18/32] gitlab: add a new build_unit job to track build size
Date: Tue,  4 Mar 2025 22:24:25 +0000
Message-Id: <20250304222439.2035603-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PF9yZp5Hc6/j

We want to reduce the total number of build units in the system to get
on our way to a single binary. It will help to have some numbers so
lets add a job to gitlab to track our progress.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - do all json in python
---
 .gitlab-ci.d/check-units.py    | 66 ++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/static_checks.yml | 22 ++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100755 .gitlab-ci.d/check-units.py

diff --git a/.gitlab-ci.d/check-units.py b/.gitlab-ci.d/check-units.py
new file mode 100755
index 0000000000..268a4118d5
--- /dev/null
+++ b/.gitlab-ci.d/check-units.py
@@ -0,0 +1,66 @@
+#!/usr/bin/env python3
+#
+# check-units.py: check the number of compilation units and identify
+#                 those that are rebuilt multiple times
+#
+# Copyright (C) 2025 Linaro Ltd.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from os import access, R_OK, path
+from sys import argv, exit
+import json
+from collections import Counter
+
+
+def extract_build_units(cc_path):
+    """
+    Extract the build units and their counds from compile_commands.json file.
+
+    Returns:
+        Hash table of ["unit"] = count
+    """
+
+    j = json.load(open(cc_path, 'r'))
+    files = [f['file'] for f in j]
+    build_units = Counter(files)
+
+    return build_units
+
+
+def analyse_units(build_units):
+    """
+    Analyse the build units and report stats and the top 10 rebuilds
+    """
+
+    print(f"Total source files: {len(build_units.keys())}")
+    print(f"Total build units: {sum(units.values())}")
+
+    # Create a sorted list by number of rebuilds
+    sorted_build_units = sorted(build_units.items(),
+                                key=lambda item: item[1],
+                                reverse=True)
+
+    print("Most rebuilt units:")
+    for unit, count in sorted_build_units[:20]:
+        print(f"  {unit} built {count} times")
+
+    print("Least rebuilt units:")
+    for unit, count in sorted_build_units[-10:]:
+        print(f"  {unit} built {count} times")
+
+
+if __name__ == "__main__":
+    if len(argv) != 2:
+        script_name = path.basename(argv[0])
+        print(f"Usage: {script_name} <path_to_compile_commands.json>")
+        exit(1)
+
+    cc_path = argv[1]
+    if path.isfile(cc_path) and access(cc_path, R_OK):
+        units = extract_build_units(cc_path)
+        analyse_units(units)
+        exit(0)
+    else:
+        print(f"{cc_path} doesn't exist or isn't readable")
+        exit(1)
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index c0ba453382..c3ed6de453 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -70,3 +70,25 @@ check-rust-tools-nightly:
     expire_in: 2 days
     paths:
       - rust/target/doc
+
+check-build-units:
+  extends: .base_job_template
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/debian:$QEMU_CI_CONTAINER_TAG
+  needs:
+    job: amd64-debian-container
+  before_script:
+    - source scripts/ci/gitlab-ci-section
+    - section_start setup "Install Tools"
+    - apt install --assume-yes --no-install-recommends jq
+    - section_end setup
+  script:
+    - mkdir build
+    - cd build
+    - section_start configure "Running configure"
+    - ../configure
+    - cd ..
+    - section_end configure
+    - section_start analyse "Analyse"
+    - .gitlab-ci.d/check-units.py build/compile_commands.json
+    - section_end analyse
-- 
2.39.5
