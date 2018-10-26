Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881184wro;
        Fri, 26 Oct 2018 08:32:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dYFqrrFPQPnjwNWrLZhM7+i/t1vltrCVCE5n7Ba+c9C6Mk49CGYKJaWaZHlJBiPQAOVwRB
X-Received: by 2002:a5d:45c6:: with SMTP id b6-v6mr6015405wrs.296.1540567931854;
        Fri, 26 Oct 2018 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567931; cv=none;
        d=google.com; s=arc-20160816;
        b=xmAdXSBkah4jdTXHb+XNu/z3iuE8GC6Xftgp4zLeZgA2mZX4fUJitMUk6l8TGhnBPc
         /TIP/5bSNNuIjo62LKwdCTR+dzLVCR5OREIkpM9HjbfIdgCicKwaj+30/8jPBQc88dQ6
         Up5cSYlvLYpHH7XktBTFd0A0TsVGMYvSXoEFR/YGzEooHRInCKN1sr1Fx0KgUmU9Al7l
         7MxHhugupOG/NviN6sEzBRajsCNeVvCjCEzVFsAmS8PM/RlOSNC0ueE/ek+eYRBZ0rtm
         fAq2rOxoZq+DEw/w7+o2kLFtkiVf2TlfWAfO2ufGr2JFtOW62wPYx9KmtiGENOLxmGlL
         GvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=dGC2iS4BTQHfV89I4wd9yr9IBuMVfGd7t2Ic2sT3f+o=;
        b=JueAmL8cpUJLRJ2qW/sg5WbmBa5GfNOUBO+qAL+KeYWqlE6c7bVqGmSOwTgkH5cXWX
         O/SK0RJohla0xMBmCMGrdPA1pz5fx9Pw2y/EFjPIT8s0cRx0hMUTc5DX5mV9KcBNvnwV
         za1UhBHkxL8VCR8iFKfj1nHOuyrimqUkzO1NDGwIRgU/XnzNTDPbRE1lxrb8m0VoFVk7
         tqFCl1pRdwQXS5JpThJZ84QirZ4ohtobywV1JhIyRNRabG49dNcBMn41hk5drAkhaTil
         nKc/aPi9emUDU/9nE8kkk3CfsY4U2ayZwNzGYH6JvwAlL0/Puu0wJfsO521vIvG2Fql5
         wlzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id x18-v6si2740933wrv.22.2018.10.26.08.32.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:11 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2SXX-1faiyG0v0B-013yG4; Fri, 26 Oct 2018 17:32:07 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2SXX-1faiyG0v0B-013yG4; Fri, 26 Oct 2018 17:32:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [PULL 13/20] configure: Support pkg-config for zlib
Date: Fri, 26 Oct 2018 17:31:18 +0200
Message-Id: <20181026153125.24738-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:nHwqIfD7U1p4B2yoxOg3RbD7c0Q74lJnwOwV3+memYJKXd3VPHe
 ukJt7WzZgTFF8QfTFWEH8S+Kf/pXvB56SNq79YrtKkct5Bc1bE62Zqold5ehue7Ngj6gXZh
 ic4RlJ9ug1N1xqIQLYFSHfDHmWQrNQNJII4YgJ9s/ruhmlhI0LVhrIjrNYsS161Z4ZQTuKq
 dKIkAR8/79m8hupRwCipQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:u0w10T44iq4=:9aPSRBKTLB6nG1raNJUVAo
 IYRblKzQ+KTyDtQ5cT/QxcnxjdO49BCoiVJHMAEjzye5s+4S9kjyXuoCI8Tkkt21yBPP0OWdv
 Dr3qGNEEGXw9IUyGQm5/aMVxIsq5CG83Y5pyS+ovvttzW0MYl/ELBNfDUSxt44VEDbVSo4ned
 MsvIrXR3OOy+uNW+p3BzEOnaVRUCGJMzqShk8XdgN3G1ERVd6pjFmBwTP9/8C6CcGyrAodSof
 uqd6KajrBc9i1pyszFjLIC9pgSXPsLsrcw6jYMGnQ/Gzm2kXzrmLR8D/1Vyq7dKkJSCbaLH1T
 gBvSfUd0l+7fhqn+bOcRYtMVFL3Kwj7YMDHNMwbZL9h2hF9U3I3M/EK0MyZq5YV8cds8xYDzf
 GDGrKjUpEZglB82W3MmQLxOhh/t2gSfUW0PHmM1ngibCUXy9AdubtpOIU548idKOEOTjvxpVT
 /NDq2RzWYsW7/iUHPZFC7ocJR++HqEV8ITNdJoispY6ycRT/yH10zJZoefv9yTb9/t1lvEau6
 FyvbdlPtubEFjF/OexQiSoq+t24OgmoPIz7VxoNiNcLpyfRCHUUf3Vpq6GRpPk9B6q00P/k1V
 E4EcwT9Wy7fM3v/5XallPkxURFRxwoEPCJgAAdX2UGeRjsyml4M5iPua4zPeCAfOyYU9trVH3
 Ul9Ee0TcZx1paAZ66Su+q25L2H952IEeRu1bLXrcs5HoVDGyMnznCjR1P6FGpMk+MGrE=
X-TUID: 3unxPTFpS33I

From: Stefan Weil <sw@weilnetz.de>

This is needed for builds with the mingw64-* packages from Cygwin,
but also works for Linux.

Move the zlib test also more to the end because users should
get information on the really important missing packages
(which also require zlib) first.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20180712192603.11599-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 1ee09bd112..a02df30dde 100755
--- a/configure
+++ b/configure
@@ -2151,23 +2151,6 @@ EOF
   fi
 fi
 
-#########################################
-# zlib check
-
-if test "$zlib" != "no" ; then
-    cat > $TMPC << EOF
-#include <zlib.h>
-int main(void) { zlibVersion(); return 0; }
-EOF
-    if compile_prog "" "-lz" ; then
-        :
-    else
-        error_exit "zlib check failed" \
-            "Make sure to have the zlib libs and headers installed."
-    fi
-fi
-LIBS="$LIBS -lz"
-
 ##########################################
 # lzo check
 
@@ -3479,6 +3462,29 @@ if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
     fi
 fi
 
+#########################################
+# zlib check
+
+if test "$zlib" != "no" ; then
+    if $pkg_config --exists zlib; then
+        zlib_cflags=$($pkg_config --cflags zlib)
+        zlib_libs=$($pkg_config --libs zlib)
+        QEMU_CFLAGS="$zlib_cflags $QEMU_CFLAGS"
+        LIBS="$zlib_libs $LIBS"
+    else
+        cat > $TMPC << EOF
+#include <zlib.h>
+int main(void) { zlibVersion(); return 0; }
+EOF
+        if compile_prog "" "-lz" ; then
+            LIBS="$LIBS -lz"
+        else
+            error_exit "zlib check failed" \
+                "Make sure to have the zlib libs and headers installed."
+        fi
+    fi
+fi
+
 ##########################################
 # SHA command probe for modules
 if test "$modules" = yes; then
-- 
2.17.2
