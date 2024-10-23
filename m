Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370744sm465054866b.131.2024.10.23.04.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:34:10 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E3FA95F9DD;
	Wed, 23 Oct 2024 12:34:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	devel@lists.libvirt.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 10/18] gitlab: make check-[dco|patch] a little more verbose
Date: Wed, 23 Oct 2024 12:33:58 +0100
Message-Id: <20241023113406.1284676-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023113406.1284676-1-alex.bennee@linaro.org>
References: <20241023113406.1284676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pTc7DBS9xXqQ

When git fails the rather terse backtrace only indicates it failed
without some useful context. Add some to make the log a little more
useful.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - keep check_call, just don't redirect stdout/err
---
 .gitlab-ci.d/check-dco.py   | 5 ++---
 .gitlab-ci.d/check-patch.py | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
index 632c8bcce8..d221b16bd5 100755
--- a/.gitlab-ci.d/check-dco.py
+++ b/.gitlab-ci.d/check-dco.py
@@ -19,10 +19,9 @@
 reponame = os.path.basename(cwd)
 repourl = "https://gitlab.com/%s/%s.git" % (namespace, reponame)
 
+print(f"adding upstream git repo @ {repourl}")
 subprocess.check_call(["git", "remote", "add", "check-dco", repourl])
-subprocess.check_call(["git", "fetch", "check-dco", "master"],
-                      stdout=subprocess.DEVNULL,
-                      stderr=subprocess.DEVNULL)
+subprocess.check_call(["git", "fetch", "check-dco", "master"])
 
 ancestor = subprocess.check_output(["git", "merge-base",
                                     "check-dco/master", "HEAD"],
diff --git a/.gitlab-ci.d/check-patch.py b/.gitlab-ci.d/check-patch.py
index 39e2b403c9..68c549a146 100755
--- a/.gitlab-ci.d/check-patch.py
+++ b/.gitlab-ci.d/check-patch.py
@@ -19,13 +19,12 @@
 reponame = os.path.basename(cwd)
 repourl = "https://gitlab.com/%s/%s.git" % (namespace, reponame)
 
+print(f"adding upstream git repo @ {repourl}")
 # GitLab CI environment does not give us any direct info about the
 # base for the user's branch. We thus need to figure out a common
 # ancestor between the user's branch and current git master.
 subprocess.check_call(["git", "remote", "add", "check-patch", repourl])
-subprocess.check_call(["git", "fetch", "check-patch", "master"],
-                      stdout=subprocess.DEVNULL,
-                      stderr=subprocess.DEVNULL)
+subprocess.check_call(["git", "fetch", "check-patch", "master"])
 
 ancestor = subprocess.check_output(["git", "merge-base",
                                     "check-patch/master", "HEAD"],
-- 
2.39.5
