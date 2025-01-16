Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7527fc4sm63651915e9.27.2025.01.16.08.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8066D60853;
	Thu, 16 Jan 2025 16:03:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 21/37] configure: reenable plugins by default for 32-bit hosts
Date: Thu, 16 Jan 2025 16:02:50 +0000
Message-Id: <20250116160306.1709518-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BbNfNARMYCmS

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20241217224306.2900490-12-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/configure b/configure
index 18336376bf..02f1dd2311 100755
--- a/configure
+++ b/configure
@@ -528,25 +528,6 @@ case "$cpu" in
     ;;
 esac
 
-# Now we have our CPU_CFLAGS we can check if we are targeting a 32 or
-# 64 bit host.
-
-check_64bit_host() {
-cat > $TMPC <<EOF
-#if __SIZEOF_POINTER__ != 8
-#error not 64 bit system
-#endif
-int main(void) { return 0; }
-EOF
-  compile_object "$1"
-}
-
-if check_64bit_host "$CPU_CFLAGS"; then
-    host_bits=64
-else
-    host_bits=32
-fi
-
 if test -n "$host_arch" && {
     ! test -d "$source_path/linux-user/include/host/$host_arch" ||
     ! test -d "$source_path/common-user/host/$host_arch"; }; then
@@ -1072,7 +1053,7 @@ if test "$static" = "yes" ; then
   fi
   plugins="no"
 fi
-if test "$plugins" != "no" && test $host_bits -eq 64; then
+if test "$plugins" != "no"; then
     if has_meson_option "-Dtcg_interpreter=true"; then
         plugins="no"
     else
-- 
2.39.5
