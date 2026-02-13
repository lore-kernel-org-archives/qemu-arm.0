Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2887DEDF176
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 15:50:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvPt-0001uG-1x; Fri, 13 Feb 2026 10:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPr-0001sx-FT
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:11 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPn-0007xS-FQ
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:11 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8860d6251bso133663566b.3
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770997746; x=1771602546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LB3EO8/HCKDobdYRYsDO3UWoJBLQiqW2ABZC8e8iL9E=;
 b=k6Y8dEEWn4Fk+VaosuUA0ykpkwxJhSOF0TjdKHCyYAvGwU2Qi6S4ycj84dVn7XakRH
 T9nnQfDlGRrQp7YigxCpEFt65V7T8PDZgIiDHoNH3FjXie+uYUgOAalc6Kgv40HRfkky
 qB/4eMASmZo8gjjg8GIdYtkuujUDAq7itle+iuwdIdCaOaVQTqrg5BjKXNEQWPU2jFS4
 EqRNtjD1X6a9IJNpAGPcwrCXzEO80oAs5hmt7DQ4G0LT+2FObqyHX36Xkif23z9OoyLO
 eK4JVaAOUtK66lPbW0GBivtbvaXxmcLZH17An0LZnuWWk4lKhNrREz0vg80BSW1+cHoE
 UBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770997746; x=1771602546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LB3EO8/HCKDobdYRYsDO3UWoJBLQiqW2ABZC8e8iL9E=;
 b=HIkrflynmsVx3Xza3wZvTkjct0/X/jiJSnSfx7jB7xGGNCqkWFYZW4c7f1cXevbh0g
 8JznyUPaiGU3ByGRbLnGcW5CbG9t6LiKuiEmKKCiT+vZy1VhJzkkiYtmLXX6Nmd1v19o
 J8pHpRYoQViQ0GT2Y8hLdLfQpV5m0IDTKWXm/DBtoNCWheQmZvtChXxabgcIYWAhEL4D
 ZxBg3mzsOSfSCBDmFtjPg162wBqyB+lXDAEKnHFEmQNz8EdTVCeY4K24UBNm9xWoX2Cx
 PbU/TD2FDlcq33/lyYBCR08QGmzOdJsOKE3M26qZqJs7Wn6sDAWe8uBUjcGv2cym4v8M
 e8Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPk+FWcYrcsxlAR+PTZbyLpgncjR5+OS+AlxfN5d4ltA5RoY96WDm1VEktxLPSNh+2gl4nG8lQTQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRos8ZJyivVWCQp0PS7Y0Xmp3XQyUtZ9a0UBRYCYdY1NMj0nsg
 ukiVXP3eQINqdjkBP14RUAgArzbiWDsSePX2bN3mtnL1YIFHrLvWqBwM+sw/ezPMcbg=
X-Gm-Gg: AZuq6aJxg1TIaZOsQl5mN/4I5dKCy5U0q+qCIQpMfcAot4U+USly22pobynJgadGayA
 h+oxJF7M5xk4F9frMx9Vy/b7B2691WR++bIGbAT+F7Kas/BArSNF9lV5QxNlflouBvCGUbSY3UE
 hT2VjLZ2+ZjGakE82Le5wPtcVY9c7rtyNclPuVuGAgxTjzYt2QYVrco2LVGq1VY7KKZop7OLPYI
 5vo2nWNJcYBVXKxNCCAP3rX0vBMDIxw2CwXfmSprV4xcVp0QOWtF7Usoc+2TBHNmn+7IGvYqbAK
 t9/nzY12AGqyBMTpGb1AkItuFYlqVjdG3cx1W9Kr3Bv1oeNDjanL/GiWgQJroKKEKArMmkNHyVs
 eI2auJ6dBO2K1cSE18bJK5Y3ZAUyoDqMDqyvpPnATV/s+9B8RgzN2UTWUOlf4tlMZ8LtOyUEk0k
 /m/xUF/yqWZKs9gLAkTDFa8D1qyI3MzV3RmQ==
X-Received: by 2002:a17:907:6d05:b0:b8f:6f6d:c593 with SMTP id
 a640c23a62f3a-b8fb44767c4mr136253966b.32.1770997745750; 
 Fri, 13 Feb 2026 07:49:05 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f97e2e705sm154000566b.61.2026.02.13.07.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:49:04 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5386E5FC82;
 Fri, 13 Feb 2026 15:49:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 5/6] tests/vm: build openbsd from lcitool data (!567)
Date: Fri, 13 Feb 2026 15:48:58 +0000
Message-ID: <20260213154859.1551283-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213154859.1551283-1-alex.bennee@linaro.org>
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For now only use the minimal decadency set until all the OpenBSD
mappings can be divined.

Currently depends on: https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/567

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/lcitool/libvirt-ci        |  2 +-
 tests/lcitool/refresh           |  5 +++--
 tests/vm/generated/openbsd.json | 27 +++++++++++++++++++++++
 tests/vm/openbsd                | 39 ++-------------------------------
 4 files changed, 33 insertions(+), 40 deletions(-)
 create mode 100644 tests/vm/generated/openbsd.json

diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 750455ce119..dedaa8ebb5d 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 750455ce1199db7e304a6b4feae5f290283dd52a
+Subproject commit dedaa8ebb5d743ba8906a87e623d90f33100aecd
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 8f0aa3fa343..95344277c9a 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -87,9 +87,9 @@ def generate_cirrus(target, trailer=None):
     generate(filename, cmd, trailer)
 
 
-def generate_pkglist(vm, target):
+def generate_pkglist(vm, target, project="qemu"):
     filename = Path(src_dir, "tests", "vm", "generated", vm + ".json")
-    cmd = lcitool_cmd + ["variables", "--format", "json", target, "qemu"]
+    cmd = lcitool_cmd + ["variables", "--format", "json", target, project]
     generate(filename, cmd, None)
 
 
@@ -312,6 +312,7 @@ try:
     # VM packages lists
     #
     generate_pkglist("freebsd", "freebsd-14")
+    generate_pkglist("openbsd", "openbsd-78", project="qemu-minimal")
 
     #
     # Ansible package lists
diff --git a/tests/vm/generated/openbsd.json b/tests/vm/generated/openbsd.json
new file mode 100644
index 00000000000..0886afd0d3d
--- /dev/null
+++ b/tests/vm/generated/openbsd.json
@@ -0,0 +1,27 @@
+{
+  "ccache": "/usr/local/bin/ccache",
+  "cpan_pkgs": [],
+  "cross_pkgs": [],
+  "make": "/usr/local/bin/gmake",
+  "ninja": "/usr/local/bin/ninja",
+  "packaging_command": "pkg_add",
+  "pip3": "/usr/local/bin/pip3",
+  "pkgs": [
+    "bash",
+    "bison",
+    "bzip2",
+    "ccache",
+    "dtc",
+    "git",
+    "glib2",
+    "gmake",
+    "gsed",
+    "libffi",
+    "meson",
+    "ninja",
+    "pkgconf",
+    "python3"
+  ],
+  "pypi_pkgs": [],
+  "python": "/usr/local/bin/python3"
+}
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 52565208965..4f8eeb28e24 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -24,42 +24,6 @@ class OpenBSDVM(basevm.BaseVM):
     link = "https://cdn.openbsd.org/pub/OpenBSD/7.8/amd64/install78.iso"
     csum = "a228d0a1ef558b4d9ec84c698f0d3ffd13cd38c64149487cba0f1ad873be07b2"
     size = "20G"
-    pkgs = [
-        # tools
-        "dtc",
-        "git",
-        "pkgconf",
-        "bzip2", "xz",
-        "ninja",
-
-        # gnu tools
-        "bash",
-        "gmake",
-        "gsed",
-        "gettext-tools",
-
-        # libs: usb
-        "libusb1--",
-
-        # libs: crypto
-        "gnutls",
-
-        # libs: images
-        "jpeg",
-        "png",
-
-        # libs: ui
-        "capstone",
-        "sdl2",
-        "gtk+3",
-        "libxkbcommon",
-
-        # libs: migration
-        "zstd",
-
-        # libs: networking
-        "libslirp",
-    ]
 
     BUILD_SCRIPT = """
         set -e;
@@ -195,8 +159,9 @@ class OpenBSDVM(basevm.BaseVM):
         self.console_wait("login:")
         self.wait_ssh()
 
+        pkgs = self.get_qemu_packages_from_lcitool_json()
         self.print_step("Installing packages")
-        self.ssh_root_check("pkg_add %s\n" % " ".join(self.pkgs))
+        self.ssh_root_check("pkg_add %s\n" % " ".join(pkgs))
 
         # shutdown
         self.ssh_root(self.poweroff)
-- 
2.47.3


