Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm11417440wrp.28.2023.11.20.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:42 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2E96A6577A;
	Mon, 20 Nov 2023 15:08:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 13/14] configure: don't try a "native" cross for linux-user
Date: Mon, 20 Nov 2023 15:08:32 +0000
Message-Id: <20231120150833.2552739-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oo9tjy6M7VZ0

As 32 bit x86 become rarer we are starting to run into problems with
search paths. Although we switched to a Debian container we still
favour the native CC on a Bookworm host. As a result we have a broken
cross compile setup which then fails to build with:

    BUILD   i386-linux-user guest-tests
  In file included from /usr/include/linux/stat.h:5,
                   from /usr/include/bits/statx.h:31,
                   from /usr/include/sys/stat.h:465,
                   from /home/alex/lsrc/qemu.git/tests/tcg/multiarch/linux/linux-test.c:28:
  /usr/include/linux/types.h:5:10: fatal error: asm/types.h: No such file or directory
      5 | #include <asm/types.h>
        |          ^~~~~~~~~~~~~
  compilation terminated.
  make[1]: *** [Makefile:119: linux-test] Error 1
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:50: build-tcg-tests-i386-linux-user] Error 2

This is likely to affect more and more linux-user builds so wrap the
whole check in a test for softmmu targets (aka bare metal) which don't
worry about such header niceties. This allows us to keep using the
host compiler for softmmu tests and the roms.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - split fix for tests/docker: replace fedora-i386 with debian-i686
    as still in my tree ;-)
  - didn't apply dpb rb due to change requested by bonzini
---
 configure | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 9ea0bf5698..42fe4d0510 100755
--- a/configure
+++ b/configure
@@ -1391,16 +1391,19 @@ probe_target_compiler() {
   done
 
   try=cross
-  case "$target_arch:$cpu" in
-    aarch64_be:aarch64 | \
-    armeb:arm | \
-    i386:x86_64 | \
-    mips*:mips64 | \
-    ppc*:ppc64 | \
-    sparc:sparc64 | \
-    "$cpu:$cpu")
-      try='native cross' ;;
-  esac
+  # For softmmu/roms we might be able to use the host compiler
+  if [ "${1%softmmu}" != "$1" ]; then
+      case "$target_arch:$cpu" in
+        aarch64_be:aarch64 | \
+        armeb:arm | \
+        i386:x86_64 | \
+        mips*:mips64 | \
+        ppc*:ppc64 | \
+        sparc:sparc64 | \
+        "$cpu:$cpu")
+        try='native cross' ;;
+      esac
+  fi
   eval "target_cflags=\${cross_cc_cflags_$target_arch}"
   for thistry in $try; do
     case $thistry in
-- 
2.39.2
