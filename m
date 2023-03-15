Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x2-20020a05600c21c200b003e1f2e43a1csm2478386wmj.48.2023.03.15.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AC4E31FFCA;
	Wed, 15 Mar 2023 17:43:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-riscv@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Igor Mammedov <imammedo@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Hao Wu <wuhaotsh@google.com>,
	Cleber Rosa <crosa@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Song Gao <gaosong@loongson.cn>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-block@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-s390x@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Kevin Wolf <kwolf@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 18/32] iotests: explicitly pass source/build dir to 'check' command
Date: Wed, 15 Mar 2023 17:43:17 +0000
Message-Id: <20230315174331.2959-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YNCySPdGnl4s

From: Daniel P. Berrangé <berrange@redhat.com>

The 'check' script has some rather dubious logic whereby it assumes
that if invoked as a symlink, then it is running from a separate
source tree and build tree, otherwise it assumes the current working
directory is a combined source and build tree.

This doesn't work if you want to invoke the 'check' script using
its full source tree path while still using a split source and build
tree layout. This would be a typical situation with meson if you ask
it to find the 'check' script path using files('check').

Rather than trying to make the logic more magical, add support for
explicitly passing the dirs using --source-dir and --build-dir. If
either is omitted the current logic is maintained.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/check      | 25 +++++++++++++++++++++++--
 tests/qemu-iotests/testenv.py | 13 ++++---------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 9bdda1394e..da7e8a87fe 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -26,9 +26,23 @@ from findtests import TestFinder
 from testenv import TestEnv
 from testrunner import TestRunner
 
+def get_default_path(follow_link=False):
+    """
+    Try to automagically figure out the path we are running from.
+    """
+    # called from the build tree?
+    if os.path.islink(sys.argv[0]):
+        if follow_link:
+            return os.path.dirname(os.readlink(sys.argv[0]))
+        else:
+            return os.path.dirname(os.path.abspath(sys.argv[0]))
+    else:  # or source tree?
+        return os.getcwd()
 
 def make_argparser() -> argparse.ArgumentParser:
-    p = argparse.ArgumentParser(description="Test run options")
+    p = argparse.ArgumentParser(
+        description="Test run options",
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
@@ -113,6 +127,11 @@ def make_argparser() -> argparse.ArgumentParser:
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
                        help='tests to run, or "--" followed by a command')
+    g_sel.add_argument('--build-dir', default=get_default_path(),
+                       help='Path to iotests build directory')
+    g_sel.add_argument('--source-dir',
+                       default=get_default_path(follow_link=True),
+                       help='Path to iotests build directory')
 
     return p
 
@@ -120,7 +139,9 @@ def make_argparser() -> argparse.ArgumentParser:
 if __name__ == '__main__':
     args = make_argparser().parse_args()
 
-    env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
+    env = TestEnv(source_dir=args.source_dir,
+                  build_dir=args.build_dir,
+                  imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b12..aa9d735414 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -170,7 +170,8 @@ def root(*names: str) -> str:
             if not isxfile(b):
                 sys.exit('Not executable: ' + b)
 
-    def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
+    def __init__(self, source_dir: str, build_dir: str,
+                 imgfmt: str, imgproto: str, aiomode: str,
                  cachemode: Optional[str] = None,
                  imgopts: Optional[str] = None,
                  misalign: bool = False,
@@ -211,14 +212,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         # which are needed to initialize some environment variables. They are
         # used by init_*() functions as well.
 
-        if os.path.islink(sys.argv[0]):
-            # called from the build tree
-            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
-            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
-        else:
-            # called from the source tree
-            self.source_iotests = os.getcwd()
-            self.build_iotests = self.source_iotests
+        self.source_iotests = source_dir
+        self.build_iotests = build_dir
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
-- 
2.39.2
