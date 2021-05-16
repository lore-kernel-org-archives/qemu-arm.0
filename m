Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp570864lfm;
        Sun, 16 May 2021 10:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2Azrj2qOdwfFVJ66IDJq1bUkvxxuRPmMMbOadv/3QDJUXxmLEjQskAzcxg1uKqqOocTo5
X-Received: by 2002:a05:6e02:78e:: with SMTP id q14mr13473374ils.21.1621185042498;
        Sun, 16 May 2021 10:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621185042; cv=none;
        d=google.com; s=arc-20160816;
        b=uZ4lb9yd9D3U6dgEmZU+6cxGDYEkkXjEGlGs+dDdgH16P7s5youKNJvNG6mL02lGPv
         HvS7PZHlq2s79B4VJuif1gRtPyJiJvgf3qxQg2K9KltS9u/ctNBmpRgLpGt7qZjIgIXX
         /sUoE1SHiyVdLU4AuvCr0iAu4Sb5OSZe0HkD/e2FdiDilEX5X6x+cYRemZMM425G+Olx
         wu5FUcm8nhh0ZFAwb0nJsvo1Oy4rVUxznV10y7u/u5n2JhMifUTzdGvGpnwyU4YsZa8A
         DLNWX2TqwUfJNgXPajqzLZrJ49rEQnzwDAgF51mI207KYm/FsIo587COkeAxXf33PDxY
         LCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0P5Fx5SuV8faClmAUI+F8RjAJD5UOdXGEqtptqHamIw=;
        b=y+83ixM/SE+7V6AcnY39g1nK5XSNQDygvTBpUvU/dYpWJJDmx3/yrooplHznXxiV7c
         y7XqhrH9HW/CjO6wGwvgxXqE5ekPUP0BwNEP0lVeFYtTk2GfhAm78u3rykcy8mvau1qq
         Ie6H4URW5ISjR3UWhhjEfrg+9x3s7FR2iuFopg5zS1Ed3UUM8Dyf/smC8bj+McAPtKL8
         tjHLkV5ujHjXit0dv1DeLHJZDu4Rv8UPiEmZdBty3EkTzC+8n9CvN9sv5rSRJOHe3tg6
         UkLp/tJzNKyrnj/qy9SdahYzhmQh1ZgcPrQ842WkNxRki1H2iH99gp2W9NZAMDs5n1k6
         3MlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J9wt2IyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si9638169ilg.26.2021.05.16.10.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 10:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J9wt2IyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liKHp-0007US-QW
	for alex.bennee@linaro.org; Sun, 16 May 2021 13:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liKHf-0007Rb-0C; Sun, 16 May 2021 13:10:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liKHd-00008v-2B; Sun, 16 May 2021 13:10:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so4010301wrw.8;
 Sun, 16 May 2021 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0P5Fx5SuV8faClmAUI+F8RjAJD5UOdXGEqtptqHamIw=;
 b=J9wt2IyXWyla1h0HUBd0bhETTyLtNgosjQLJ5QMkYJ7mmrcAYPhLpOaAH8UnKvHI7b
 hhK2TSfgldF3Twlqe+F0Z4EMovF61kcuOED3oTKeAWNxOgCyu5QAlT/PKfWXLGtPteSh
 m4sNY/xlF5qG5fyDjlB1gsFnzemBQEPymBN39E185XdRkERWrOgnJLB7/suVwMJw8rZS
 NJuQDxJJNOVh0A+mCW0PyhxThXlEMVjM1LRjoWMl0/imz2TNno/sdpj9uejcGG8uSD+c
 1wvJGEQLxJSpVHdtDQQ1KwXKvfebMbxZYlpjMpwFV04SscwyQs8YC0vGdvK//dPmW8K2
 eoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0P5Fx5SuV8faClmAUI+F8RjAJD5UOdXGEqtptqHamIw=;
 b=VK84wxgKeiGD6PzZKhzrgaMOvZWEhUhdV6KLGPw23xmC9d7P61KnL82MiWbY9o2G75
 YwVvlt81EqEDA+41j0qmAynPESQns2YMh0qMyJR9Q43oyQfy4DB31dkVXeuVg4HLcce9
 b5xcxio6lMwDq0LicTHXqYjaS85Anvz96LoaaBCLJgwmVhDzhozlau0jV2K9Q0Q/TEGN
 tamNFzgoXonsxGaRKYIyz1ONQAnXMwe8QIBVMAyLdgBztuo5DNpoWo8iFM4H9MWqphBO
 H8aQOvp8FS9GMCyPN+dlfn0gdEfgMwe3ZCkiMkhArBEDGSJedDd1kuCopO0TKenphgIU
 k4sQ==
X-Gm-Message-State: AOAM532R8RRecTi5aOLbnqYOUOsCP7v2GJVa3LFdGEmAF2rLIEwcSRH4
 mV+veiW9Be5oWM4+keS0MNCTjVm89AfnQw==
X-Received: by 2002:a05:6000:1c1:: with SMTP id
 t1mr69077150wrx.421.1621185026510; 
 Sun, 16 May 2021 10:10:26 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b10sm16248370wrr.27.2021.05.16.10.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 10:10:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] disas/libvixl: Protect C system header for C++ compiler
Date: Sun, 16 May 2021 19:10:23 +0200
Message-Id: <20210516171023.510778-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DcijiUulRxE7

When selecting an ARM target on Debian unstable, we get:

  Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  c++ -Ilibcommon.fa.p -I. -I.. [...] -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/vixl/utils.cc
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:36:43: error: missing binary operator before token "("
     36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
        |                                           ^
  /usr/include/string.h:53:62: error: missing binary operator before token "("
     53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2X)
        |                                                              ^
  /usr/include/string.h:165:21: error: missing binary operator before token "("
    165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
        |                     ^
  /usr/include/string.h:174:43: error: missing binary operator before token "("
    174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X)
        |                                           ^
  /usr/include/string.h:492:19: error: missing binary operator before token "("
    492 | #if __GNUC_PREREQ (3,4)
        |                   ^

Relevant information from the host:

  $ lsb_release -d
  Description:    Debian GNU/Linux 11 (bullseye)
  $ gcc --version
  gcc (Debian 10.2.1-6) 10.2.1 20210110
  $ dpkg -S /usr/include/string.h
  libc6-dev: /usr/include/string.h
  $ apt-cache show libc6-dev
  Package: libc6-dev
  Version: 2.31-11

Partially cherry-pick vixl commit 78973f258039f6e96 [*]:

  Refactor VIXL to use `extern` block when including C header
  that do not have a C++ counterpart.

which is similar to commit 875df03b221 ('osdep: protect qemu/osdep.h
with extern "C"').

[*] https://git.linaro.org/arm/vixl.git/commit/?id=78973f258039f6e96

Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 disas/libvixl/vixl/code-buffer.h |  2 +-
 disas/libvixl/vixl/globals.h     | 16 +++++++++-------
 disas/libvixl/vixl/invalset.h    |  2 +-
 disas/libvixl/vixl/platform.h    |  2 ++
 disas/libvixl/vixl/utils.h       |  2 +-
 disas/libvixl/vixl/utils.cc      |  2 +-
 6 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/disas/libvixl/vixl/code-buffer.h b/disas/libvixl/vixl/code-buffer.h
index f93ebb6b822..b95babbdee2 100644
--- a/disas/libvixl/vixl/code-buffer.h
+++ b/disas/libvixl/vixl/code-buffer.h
@@ -27,7 +27,7 @@
 #ifndef VIXL_CODE_BUFFER_H
 #define VIXL_CODE_BUFFER_H
 
-#include <string.h>
+#include <cstring>
 #include "vixl/globals.h"
 
 namespace vixl {
diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
index 7099aa599fb..3a71942f1e5 100644
--- a/disas/libvixl/vixl/globals.h
+++ b/disas/libvixl/vixl/globals.h
@@ -40,15 +40,17 @@
 #define __STDC_FORMAT_MACROS
 #endif
 
-#include <stdint.h>
+extern "C" {
 #include <inttypes.h>
-
-#include <assert.h>
-#include <stdarg.h>
-#include <stdio.h>
 #include <stdint.h>
-#include <stdlib.h>
-#include <stddef.h>
+}
+
+#include <cassert>
+#include <cstdarg>
+#include <cstddef>
+#include <cstdio>
+#include <cstdlib>
+
 #include "vixl/platform.h"
 
 
diff --git a/disas/libvixl/vixl/invalset.h b/disas/libvixl/vixl/invalset.h
index ffdc0237b47..2e0871f8c3f 100644
--- a/disas/libvixl/vixl/invalset.h
+++ b/disas/libvixl/vixl/invalset.h
@@ -27,7 +27,7 @@
 #ifndef VIXL_INVALSET_H_
 #define VIXL_INVALSET_H_
 
-#include <string.h>
+#include <cstring>
 
 #include <algorithm>
 #include <vector>
diff --git a/disas/libvixl/vixl/platform.h b/disas/libvixl/vixl/platform.h
index ab588f07f54..26a74de81bb 100644
--- a/disas/libvixl/vixl/platform.h
+++ b/disas/libvixl/vixl/platform.h
@@ -28,7 +28,9 @@
 #define PLATFORM_H
 
 // Define platform specific functionalities.
+extern "C" {
 #include <signal.h>
+}
 
 namespace vixl {
 inline void HostBreakpoint() { raise(SIGINT); }
diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
index 5ab134e240a..ecb0f1014ab 100644
--- a/disas/libvixl/vixl/utils.h
+++ b/disas/libvixl/vixl/utils.h
@@ -27,8 +27,8 @@
 #ifndef VIXL_UTILS_H
 #define VIXL_UTILS_H
 
-#include <string.h>
 #include <cmath>
+#include <cstring>
 #include "vixl/globals.h"
 #include "vixl/compiler-intrinsics.h"
 
diff --git a/disas/libvixl/vixl/utils.cc b/disas/libvixl/vixl/utils.cc
index 3b8bd75fba1..69304d266d7 100644
--- a/disas/libvixl/vixl/utils.cc
+++ b/disas/libvixl/vixl/utils.cc
@@ -25,7 +25,7 @@
 // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 #include "vixl/utils.h"
-#include <stdio.h>
+#include <cstdio>
 
 namespace vixl {
 
-- 
2.26.3

