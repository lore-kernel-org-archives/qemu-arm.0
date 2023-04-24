Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d48ca000000b003047dc162f7sm1094226wrs.67.2023.04.24.02.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0CBC91FFBD;
	Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eldon Stegall <eldon-qemu@eldondev.com>
Subject: [PATCH 05/18] scripts/device-crash-test: Add a parameter to run with TCG only
Date: Mon, 24 Apr 2023 10:22:36 +0100
Message-Id: <20230424092249.58552-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g2QYTRgFhk3X

From: Thomas Huth <thuth@redhat.com>

We're currently facing the problem that the device-crash-test script
runs twice as long in the CI when a runner supports KVM - which sometimes
results in a timeout of the CI job. To get a more deterministic runtime
here, add an option to the script that allows to run it with TCG only.

Reported-by: Eldon Stegall <eldon-qemu@eldondev.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230417134321.3627231-6-alex.bennee@linaro.org>
Message-Id: <20230414145845.456145-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 scripts/device-crash-test  | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 333eea9dd3..bb3650a51c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -103,7 +103,7 @@ crash-test-debian:
   script:
     - cd build
     - make NINJA=":" check-venv
-    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
+    - tests/venv/bin/python3 scripts/device-crash-test -q --tcg-only ./qemu-system-i386
 
 build-system-fedora:
   extends:
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 73bcb98693..b74d887331 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -397,7 +397,7 @@ def binariesToTest(args, testcase):
 
 
 def accelsToTest(args, testcase):
-    if getBinaryInfo(args, testcase['binary']).kvm_available:
+    if getBinaryInfo(args, testcase['binary']).kvm_available and not args.tcg_only:
         yield 'kvm'
     yield 'tcg'
 
@@ -510,6 +510,8 @@ def main():
                         help="Full mode: test cases that are expected to fail")
     parser.add_argument('--strict', action='store_true', dest='strict',
                         help="Treat all warnings as fatal")
+    parser.add_argument('--tcg-only', action='store_true', dest='tcg_only',
+                        help="Only test with TCG accelerator")
     parser.add_argument('qemu', nargs='*', metavar='QEMU',
                         help='QEMU binary to run')
     args = parser.parse_args()
-- 
2.39.2
