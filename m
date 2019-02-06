Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6070253wrt;
        Wed, 6 Feb 2019 07:29:03 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbhQryQWLT/Zg2D0WqTzjcH2mOIJO69Tx83VmoycH8JubILhzani18T2R95Eh+gDzjgcUCS
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr8307187wrm.143.1549466943049;
        Wed, 06 Feb 2019 07:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549466943; cv=none;
        d=google.com; s=arc-20160816;
        b=SahyhS3Tk2jtPx8SIGviR8tsxOWPjci7518JLOA2ktrgGks3+dYzAf59DEY+v3XqII
         3a4IuC6w7w4KrxEg4MKCMM8OO8k2vx0oKnAKDTGrhE15KJowfBbjEcx2w+sFHyHMJxZ9
         u0bhOjmJrotOuOj6rBBsUigSTctfJPftqBBe6QyibW/wRBI3SoEuCKK3WAMfTqGCGxz2
         F3CgT4ifZNB7JtQGppMywBn0DbrO1Q8Fi2UhhSHyF3BSQyXEYE6Tizewlhwh9Ih8f2lJ
         DQmruFykhufhb0FejxjA4XlUXBjejbeiL1Z5K1i96efoZjMAFTz1qQ3vr659BIeAzcvL
         u2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9gohskn+asvHLOP8a4qnx328JzmAedn/+eSjArRoD+w=;
        b=cWN7Av+bUOe0kZ7eqCAuTJpigf9v95TFzHKs7WBQRfmakhy39rcXYW32RaPbFnA34O
         atRt3K4TO1Liyie0ABT38TQGI44oqzQ1Ai0huqAZyK4kwAiv6omainOpLUhL+CCTDJSK
         ofKTZkWSz28jdZ3RR6RtteOJJdDo5M5lxzq1N4CD/3V7CldFV5KBmJcOr5RR6AUXdm5e
         oPfbCBidfoYO1/2uwC1whN4c0RRv7XTM3WFv84MQH59xZtSC8RqzQD0G5OMUy2fvLvP2
         IP050S1CSNl8bKm/Lel73g6KOknnSbbNfMzN5+XYR5SXp3gFz+qAB9SwOV6Ar3uZW+XU
         jwDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si1002372wrn.381.2019.02.06.07.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grP8I-00008O-1n
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7y-00005M-15
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7u-0004Nf-Mb
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:41 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46235)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7m-0004L6-73; Wed, 06 Feb 2019 10:28:34 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M597s-1gsV3H0ahA-001DZI; Wed, 06 Feb 2019 16:28:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:03 +0100
Message-Id: <20190206152807.31896-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uW5v0R4LE0jQQp6k3QrcZUOwcZLwJKx33bMFRYBnx2o6IyzqUYE
	8mpEJLe/1uJUUd/oRlujIMY1t9Pl39K1dANaWEoutyZoXlO3PbjERXy6DeC/6LT9A36MGsp
	+DfsWUX2iTprsmo/2sI17ISVNeJCfeTFbDxQD/RlUM44AMq62Lj3d6Pl96BWWlJOiULzrqO
	jKVPBZBwvP5h7KatFAMjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yZ1Jw8JO910=:brW/X1OVB/ciRR9cXAuZHd
	c28YCMiUa2Buuc6XAFPRqCMgSqWOrGh4w8uWNLvYtbqqVRJOkwLxoMbzmOSHY6dk9X3STDjyj
	Xy5rizZX4CTckNUAmYZN6lCTeK1VSMGyVVxLlX0xoAIiXwVDHYxLYXCAJIQnN56O+UhneVtob
	KCXbdWAWi5BZpL1jxkvgORdr4aI1XG24xOfG1+5uJWSCORxEDtmMy1noKNKBn/GwrzfiOhHqv
	F0Tlr0otYTfy7E/YhcY0FSHuax3L5hwo0HHNyKRS6Eifd4RCWNu6oK6IQP1dU5d7tTB6ZOIHi
	N+UiBmTfI6VGxnoJVQJKwspHvhIypB/dj1iagMiHMoKZNGETHjtDdARYI+Rr50sT7rScblxsy
	JTbxzZL9N4CMBYIL8PpTJ32x6/c0esjZmvGex7GoVkZQvPkd5ShM/cOg66TMHJHs1McQxz2r0
	wk/3nNe5tUCErvF5ZVp+xzz36glaxl4Ksw0ljsPRd0NzBXLmUNF5wbpTmccaYMVGKrh6T6L0d
	LtJU8bKgGs2FBJfFvgfwcndWao9LyK1FTy+trso0PmEoRla6S3fOH8Odxp5RDAy2zpXyLZCaN
	qWapl5b63qYcYY74StuEpK1jMhMKNaF7HVz8ZdCoaVpncLp/R2D+uG1C6M8JE44vKjAEE7b2o
	aLvbhlwOJMeH0dw9P5PT4OrhQ2JZc/yaLmwYYz8DnDKmtKwICt7zv3Q4VgwZGf50wD/gji5vL
	/GbucCjDAmYtLAbtRV+PqXl2XFsx5hPYfNQDESitGnCy81t56VegNAT/5Sc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-arm] [PULL 3/7] configure: Avoid non-portable 'test -o/-a'
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ye4Fp8p0mkpi

From: Eric Blake <eblake@redhat.com>

POSIX says that it is better to use &&/|| and two separate test
invocations than it is to try and use -a and -o (in fact, there
are some tests that are inherently ambiguous to parse if the
user passes in corner-case input like "(").

Since we cannot guarantee which shell runs configure, we cannot
rely on -o/-a always following bash's parser rules.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190205023937.18245-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 63 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/configure b/configure
index 3d89870d99..61bc70708e 100755
--- a/configure
+++ b/configure
@@ -1834,8 +1834,8 @@ fi
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
 if test -z "$werror" ; then
-    if test -d "$source_path/.git" -a \
-        \( "$linux" = "yes" -o "$mingw32" = "yes" \) ; then
+    if test -d "$source_path/.git" && \
+        { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
         werror="yes"
     else
         werror="no"
@@ -2940,7 +2940,7 @@ EOF
     sdl=yes
 
     # static link with sdl ? (note: sdl.pc's --static --libs is broken)
-    if test "$sdl" = "yes" -a "$static" = "yes" ; then
+    if test "$sdl" = "yes" && test "$static" = "yes" ; then
       if test $? = 0 && echo $sdl_libs | grep -- -laa > /dev/null; then
          sdl_libs="$sdl_libs $(aalib-config --static-libs 2>/dev/null)"
          sdl_cflags="$sdl_cflags $(aalib-config --cflags 2>/dev/null)"
@@ -3082,7 +3082,7 @@ fi
 
 ##########################################
 # VNC SASL detection
-if test "$vnc" = "yes" -a "$vnc_sasl" != "no" ; then
+if test "$vnc" = "yes" && test "$vnc_sasl" != "no" ; then
   cat > $TMPC <<EOF
 #include <sasl/sasl.h>
 #include <stdio.h>
@@ -3105,7 +3105,7 @@ fi
 
 ##########################################
 # VNC JPEG detection
-if test "$vnc" = "yes" -a "$vnc_jpeg" != "no" ; then
+if test "$vnc" = "yes" && test "$vnc_jpeg" != "no" ; then
 cat > $TMPC <<EOF
 #include <stdio.h>
 #include <jpeglib.h>
@@ -3127,7 +3127,7 @@ fi
 
 ##########################################
 # VNC PNG detection
-if test "$vnc" = "yes" -a "$vnc_png" != "no" ; then
+if test "$vnc" = "yes" && test "$vnc_png" != "no" ; then
 cat > $TMPC <<EOF
 //#include <stdio.h>
 #include <png.h>
@@ -3491,7 +3491,7 @@ fi
 # This workaround is required due to a bug in pkg-config file for glib as it
 # doesn't define GLIB_STATIC_COMPILATION for pkg-config --static
 
-if test "$static" = yes -a "$mingw32" = yes; then
+if test "$static" = yes && test "$mingw32" = yes; then
     QEMU_CFLAGS="-DGLIB_STATIC_COMPILATION $QEMU_CFLAGS"
 fi
 
@@ -3584,7 +3584,7 @@ fi
 ##########################################
 # pixman support probe
 
-if test "$want_tools" = "no" -a "$softmmu" = "no"; then
+if test "$want_tools" = "no" && test "$softmmu" = "no"; then
   pixman_cflags=
   pixman_libs=
 elif $pkg_config --atleast-version=0.21.8 pixman-1 > /dev/null 2>&1; then
@@ -3699,7 +3699,7 @@ else
   done
 fi
 
-if test "$mingw32" != yes -a "$pthread" = no; then
+if test "$mingw32" != yes && test "$pthread" = no; then
   error_exit "pthread check failed" \
       "Make sure to have the pthread libs and headers installed."
 fi
@@ -3826,7 +3826,7 @@ fi
 ##########################################
 # TPM passthrough is only on x86 Linux
 
-if test "$targetos" = Linux && test "$cpu" = i386 -o "$cpu" = x86_64; then
+if test "$targetos" = Linux && { test "$cpu" = i386 || test "$cpu" = x86_64; }; then
   tpm_passthrough=$tpm
 else
   tpm_passthrough=no
@@ -3992,7 +3992,7 @@ EOF
   fi
 fi
 
-if test "$opengl" = "yes" -a "$have_x11" = "yes"; then
+if test "$opengl" = "yes" && test "$have_x11" = "yes"; then
   for target in $target_list; do
     case $target in
       lm32-softmmu) # milkymist-tmu2 requires X11 and OpenGL
@@ -4612,8 +4612,8 @@ elif compile_prog "" "$pthread_lib -lrt" ; then
   libs_qga="$libs_qga -lrt"
 fi
 
-if test "$darwin" != "yes" -a "$mingw32" != "yes" -a "$solaris" != yes -a \
-        "$haiku" != "yes" ; then
+if test "$darwin" != "yes" && test "$mingw32" != "yes" && \
+        test "$solaris" != yes && test "$haiku" != "yes" ; then
     libs_softmmu="-lutil $libs_softmmu"
 fi
 
@@ -4688,7 +4688,8 @@ fi
 ##########################################
 # check if we have VSS SDK headers for win
 
-if test "$mingw32" = "yes" -a "$guest_agent" != "no" -a "$vss_win32_sdk" != "no" ; then
+if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
+        test "$vss_win32_sdk" != "no" ; then
   case "$vss_win32_sdk" in
     "")   vss_win32_include="-isystem $source_path" ;;
     *\ *) # The SDK is installed in "Program Files" by default, but we cannot
@@ -4727,7 +4728,8 @@ fi
 # VSS provider from the source. It is usually unnecessary because the
 # pre-compiled .tlb file is included.
 
-if test "$mingw32" = "yes" -a "$guest_agent" != "no" -a "$guest_agent_with_vss" = "yes" ; then
+if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
+        test "$guest_agent_with_vss" = "yes" ; then
   if test -z "$win_sdk"; then
     programfiles="$PROGRAMFILES"
     test -n "$PROGRAMW6432" && programfiles="$PROGRAMW6432"
@@ -4743,7 +4745,7 @@ fi
 
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
-if test "$mingw32" = "yes" -a "$guest_agent" != "no"; then
+if test "$mingw32" = "yes" && test "$guest_agent" != "no"; then
   cat > $TMPC << EOF
 #include <windows.h>
 #include <ntddscsi.h>
@@ -4790,7 +4792,7 @@ case "$capstone" in
   "" | yes)
     if $pkg_config capstone; then
       capstone=system
-    elif test -e "${source_path}/.git" -a $git_update = 'yes' ; then
+    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
       capstone=git
     elif test -e "${source_path}/capstone/Makefile" ; then
       capstone=internal
@@ -5162,7 +5164,7 @@ fi
 # There is no point enabling this if cpuid.h is not usable,
 # since we won't be able to select the new routines.
 
-if test "$cpuid_h" = "yes" -a "$avx2_opt" != "no"; then
+if test "$cpuid_h" = "yes" && test "$avx2_opt" != "no"; then
   cat > $TMPC << EOF
 #pragma GCC push_options
 #pragma GCC target("avx2")
@@ -5220,7 +5222,7 @@ EOF
 fi
 
 cmpxchg128=no
-if test "$int128" = yes -a "$atomic128" = no; then
+if test "$int128" = yes && test "$atomic128" = no; then
   cat > $TMPC << EOF
 int main(void)
 {
@@ -5893,9 +5895,9 @@ fi
 
 # Mac OS X ships with a broken assembler
 roms=
-if test \( "$cpu" = "i386" -o "$cpu" = "x86_64" \) -a \
-        "$targetos" != "Darwin" -a "$targetos" != "SunOS" -a \
-        "$softmmu" = yes ; then
+if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
+        test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
+        test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
@@ -5907,7 +5909,7 @@ if test \( "$cpu" = "i386" -o "$cpu" = "x86_64" \) -a \
         fi
     done
 fi
-if test "$cpu" = "ppc64" -a "$targetos" != "Darwin" ; then
+if test "$cpu" = "ppc64" && test "$targetos" != "Darwin" ; then
   roms="$roms spapr-rtas"
 fi
 
@@ -6373,7 +6375,7 @@ if test "$modules" = "yes"; then
   echo "CONFIG_STAMP=_$( (echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ )" >> $config_host_mak
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
-if test "$have_x11" = "yes" -a "$need_x11" = "yes"; then
+if test "$have_x11" = "yes" && test "$need_x11" = "yes"; then
   echo "CONFIG_X11=y" >> $config_host_mak
   echo "X11_CFLAGS=$x11_cflags" >> $config_host_mak
   echo "X11_LIBS=$x11_libs" >> $config_host_mak
@@ -6568,7 +6570,7 @@ fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
-if test "$vhost_net" = "yes" -a "$vhost_user" = "yes"; then
+if test "$vhost_net" = "yes" && test "$vhost_user" = "yes"; then
   echo "CONFIG_VHOST_NET_USED=y" >> $config_host_mak
 fi
 if test "$vhost_crypto" = "yes" ; then
@@ -6963,11 +6965,11 @@ elif test "$ARCH" = "sparc64" ; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/sparc $QEMU_INCLUDES"
 elif test "$ARCH" = "s390x" ; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/s390 $QEMU_INCLUDES"
-elif test "$ARCH" = "x86_64" -o "$ARCH" = "x32" ; then
+elif test "$ARCH" = "x86_64" || test "$ARCH" = "x32" ; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/i386 $QEMU_INCLUDES"
 elif test "$ARCH" = "ppc64" ; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/ppc $QEMU_INCLUDES"
-elif test "$ARCH" = "riscv32" -o "$ARCH" = "riscv64" ; then
+elif test "$ARCH" = "riscv32" || test "$ARCH" = "riscv64" ; then
   QEMU_INCLUDES="-I\$(SRC_PATH)/tcg/riscv $QEMU_INCLUDES"
 else
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
@@ -7384,7 +7386,7 @@ if test ! -z "$gdb_xml_files" ; then
   echo "TARGET_XML_FILES=$list" >> $config_target_mak
 fi
 
-if test "$target_user_only" = "yes" -a "$bflt" = "yes"; then
+if test "$target_user_only" = "yes" && test "$bflt" = "yes"; then
   echo "TARGET_HAS_BFLT=y" >> $config_target_mak
 fi
 if test "$target_bsd_user" = "yes" ; then
@@ -7506,7 +7508,7 @@ if test "$gprof" = "yes" ; then
   fi
 fi
 
-if test "$target_linux_user" = "yes" -o "$target_bsd_user" = "yes" ; then
+if test "$target_linux_user" = "yes" || test "$target_bsd_user" = "yes" ; then
   ldflags="$ldflags $textseg_ldflags"
 fi
 
@@ -7518,7 +7520,8 @@ fi
 #  - we build the system emulation for s390x (qemu-system-s390x)
 #  - KVM is enabled
 #  - the linker supports --s390-pgste
-if test "$TARGET_ARCH" = "s390x" -a "$target_softmmu" = "yes"  -a "$ARCH" = "s390x" -a "$kvm" = "yes"; then
+if test "$TARGET_ARCH" = "s390x" && test "$target_softmmu" = "yes" && \
+        test "$ARCH" = "s390x" && test "$kvm" = "yes"; then
     if ld_has --s390-pgste ; then
         ldflags="-Wl,--s390-pgste $ldflags"
     fi
-- 
2.20.1

