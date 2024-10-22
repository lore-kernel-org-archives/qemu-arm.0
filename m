Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72581sm3010588a12.86.2024.10.22.03.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:56:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 86BD95F9EC;
	Tue, 22 Oct 2024 11:56:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	devel@lists.libvirt.org,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 10/20] gitlab: make check-[dco|patch] a little more verbose
Date: Tue, 22 Oct 2024 11:56:04 +0100
Message-Id: <20241022105614.839199-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022105614.839199-1-alex.bennee@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jqd2PQiI2NYm

When git fails the rather terse backtrace only indicates it failed
without some useful context. Add some to make the log a little more
useful.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/check-dco.py   | 9 +++++----
 .gitlab-ci.d/check-patch.py | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
index 632c8bcce8..d29c580d63 100755
--- a/.gitlab-ci.d/check-dco.py
+++ b/.gitlab-ci.d/check-dco.py
@@ -19,10 +19,11 @@
 reponame = os.path.basename(cwd)
 repourl = "https://gitlab.com/%s/%s.git" % (namespace, reponame)
 
-subprocess.check_call(["git", "remote", "add", "check-dco", repourl])
-subprocess.check_call(["git", "fetch", "check-dco", "master"],
-                      stdout=subprocess.DEVNULL,
-                      stderr=subprocess.DEVNULL)
+print(f"adding upstream git repo @ {repourl}")
+subprocess.run(["git", "remote", "add", "check-dco", repourl],
+               check=True, capture_output=True)
+subprocess.run(["git", "fetch", "check-dco", "master"],
+               check=True, capture_output=True)
 
 ancestor = subprocess.check_output(["git", "merge-base",
                                     "check-dco/master", "HEAD"],
diff --git a/.gitlab-ci.d/check-patch.py b/.gitlab-ci.d/check-patch.py
index 39e2b403c9..94afdce555 100755
--- a/.gitlab-ci.d/check-patch.py
+++ b/.gitlab-ci.d/check-patch.py
@@ -19,13 +19,14 @@
 reponame = os.path.basename(cwd)
 repourl = "https://gitlab.com/%s/%s.git" % (namespace, reponame)
 
+print(f"adding upstream git repo @ {repourl}")
 # GitLab CI environment does not give us any direct info about the
 # base for the user's branch. We thus need to figure out a common
 # ancestor between the user's branch and current git master.
-subprocess.check_call(["git", "remote", "add", "check-patch", repourl])
-subprocess.check_call(["git", "fetch", "check-patch", "master"],
-                      stdout=subprocess.DEVNULL,
-                      stderr=subprocess.DEVNULL)
+subprocess.run(["git", "remote", "add", "check-patch", repourl],
+               check=True, capture_output=True)
+subprocess.run(["git", "fetch", "check-patch", "master"],
+               check=True, capture_output=True)
 
 ancestor = subprocess.check_output(["git", "merge-base",
                                     "check-patch/master", "HEAD"],
-- 
2.39.5
