Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf6a88sm483205466b.182.2024.09.10.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D55C862330;
	Tue, 10 Sep 2024 15:07:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 12/26] deprecation: don't enable TCG plugins by default with TCI
Date: Tue, 10 Sep 2024 15:07:19 +0100
Message-Id: <20240910140733.4007719-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PuZayXjePBXs

The softmmu memory instrumentation test sees so many more accesses
than a normal translated host and its really not worth fixing up. Lets
deprecate this odd configuration and save on the CI cycles.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/deprecated.rst |  8 ++++++++
 configure                 | 11 +++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index f7c7c33d39..5aa2e35314 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,14 @@ benefits from having plenty of host memory it seems reasonable to
 encourage users to use 64 bit builds of QEMU for analysis work
 whatever targets they are instrumenting.
 
+TCG Plugin support not enabled by default with TCI (since 9.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+While the TCG interpreter can interpret the TCG ops used by plugins it
+is going to be so much slower it wouldn't make sense for any serious
+instrumentation. Due to implementation differences there will also be
+anomalies in things like memory instrumentation.
+
 System emulator CPUs
 --------------------
 
diff --git a/configure b/configure
index 14581c1b9a..1bda6b3a3b 100755
--- a/configure
+++ b/configure
@@ -629,6 +629,9 @@ meson_option_parse() {
     exit 1
   fi
 }
+has_meson_option() {
+    test "${meson_options#*"$1"}" != "$meson_options"
+}
 
 meson_add_machine_file() {
   if test "$cross_compile" = "yes"; then
@@ -1048,8 +1051,12 @@ if test "$static" = "yes" ; then
   plugins="no"
 fi
 if test "$plugins" != "no" && test $host_bits -eq 64; then
-  plugins=yes
-  subdirs="$subdirs contrib/plugins"
+    if has_meson_option "-Dtcg_interpreter=true"; then
+        plugins="no"
+    else
+        plugins=yes
+        subdirs="$subdirs contrib/plugins"
+    fi
 fi
 
 cat > $TMPC << EOF
-- 
2.39.2
