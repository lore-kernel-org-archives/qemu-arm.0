Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72748sm485424066b.117.2024.09.10.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B972C5FA1C;
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
Subject: [PATCH 11/26] deprecation: don't enable TCG plugins by default on 32 bit hosts
Date: Tue, 10 Sep 2024 15:07:18 +0100
Message-Id: <20240910140733.4007719-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /1kKl2qmzAHX

The existing plugins already liberally use host pointer stuffing for
passing user data which will fail when doing 64 bit guests on 32 bit
hosts. We should discourage this by officially deprecating support and
adding another nail to the 32 bit host coffin.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't manually set based on CPU type, use __SIZEOF_POINTER__
---
 docs/about/deprecated.rst | 11 +++++++++++
 configure                 | 21 ++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 88f0f03786..f7c7c33d39 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -184,6 +184,17 @@ be an effective use of its limited resources, and thus intends to discontinue
 it. Since all recent x86 hardware from the past >10 years is capable of the
 64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
 
+TCG Plugin support not enabled by default on 32-bit hosts (since 9.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+While it is still possible to enable TCG plugin support for 32-bit
+hosts there are a number of potential pitfalls when instrumenting
+64-bit guests. The plugin APIs typically pass most addresses as
+uint64_t but practices like encoding that address in a host pointer
+for passing as user-data will lose data. As most software analysis
+benefits from having plenty of host memory it seems reasonable to
+encourage users to use 64 bit builds of QEMU for analysis work
+whatever targets they are instrumenting.
 
 System emulator CPUs
 --------------------
diff --git a/configure b/configure
index 40186d865e..14581c1b9a 100755
--- a/configure
+++ b/configure
@@ -516,6 +516,25 @@ case "$cpu" in
     ;;
 esac
 
+# Now we have our CPU_CFLAGS we can check if we are targeting a 32 or
+# 64 bit host.
+
+check_64bit_host() {
+cat > $TMPC <<EOF
+#if __SIZEOF_POINTER__ != 8
+#error not 64 bit system
+#endif
+int main(void) { return 0; }
+EOF
+  compile_object "$1"
+}
+
+if check_64bit_host "$CPU_CFLAGS"; then
+    host_bits=64
+else
+    host_bits=32
+fi
+
 if test -n "$host_arch" && {
     ! test -d "$source_path/linux-user/include/host/$host_arch" ||
     ! test -d "$source_path/common-user/host/$host_arch"; }; then
@@ -1028,7 +1047,7 @@ if test "$static" = "yes" ; then
   fi
   plugins="no"
 fi
-if test "$plugins" != "no"; then
+if test "$plugins" != "no" && test $host_bits -eq 64; then
   plugins=yes
   subdirs="$subdirs contrib/plugins"
 fi
-- 
2.39.2
