Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm205273f8f.66.2025.01.16.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3F10C608F5;
	Thu, 16 Jan 2025 16:03:10 +0000 (GMT)
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
Subject: [PATCH v3 37/37] scripts/nsis.py: Run dependency check for each DLL file only once
Date: Thu, 16 Jan 2025 16:03:06 +0000
Message-Id: <20250116160306.1709518-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4Kz8X+/m3FSQ

From: Stefan Weil <sw@weilnetz.de>

Each DLL should only be checked once for dependencies, but
several hundred (781 in my test) unneeded checks were done.

Now the script is significantly faster (16 s in my build).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20250111215244.1680931-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/nsis.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 03ed7608a2..af4e064819 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -37,10 +37,10 @@ def find_deps(exe_or_dll, search_path, analyzed_deps):
 
         analyzed_deps.add(dep)
         # locate the dll dependencies recursively
-        rdeps = find_deps(dll, search_path, analyzed_deps)
+        analyzed_deps, rdeps = find_deps(dll, search_path, analyzed_deps)
         deps.extend(rdeps)
 
-    return deps
+    return analyzed_deps, deps
 
 def main():
     parser = argparse.ArgumentParser(description="QEMU NSIS build helper.")
@@ -92,18 +92,18 @@ def main():
         dlldir = os.path.join(destdir + prefix, "dll")
         os.mkdir(dlldir)
 
+        analyzed_deps = set()
         for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
             signcode(exe)
 
             # find all dll dependencies
-            deps = set(find_deps(exe, search_path, set()))
+            analyzed_deps, deps = find_deps(exe, search_path, analyzed_deps)
+            deps = set(deps)
             deps.remove(exe)
 
             # copy all dlls to the DLLDIR
             for dep in deps:
                 dllfile = os.path.join(dlldir, os.path.basename(dep))
-                if (os.path.exists(dllfile)):
-                    continue
                 print("Copying '%s' to '%s'" % (dep, dllfile))
                 shutil.copy(dep, dllfile)
 
-- 
2.39.5
