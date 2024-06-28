Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c835adsm982859a12.17.2024.06.28.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:42:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FC425F958;
	Fri, 28 Jun 2024 13:42:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 03/23] testing: restore some testing for i686
Date: Fri, 28 Jun 2024 13:42:38 +0100
Message-Id: <20240628124258.832466-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WtaAyWVHaH68

The commit 4f9a8315e6 (gitlab-ci.d/crossbuilds: Drop the i386 system
emulation job) was a little too aggressive dropping testing for 32 bit
system builds. Partially revert but using the debian-i686 cross build
images this time as fedora has deprecated the 32 bit stuff.

As the SEV breakage gets in the way and its TCG issues we want to
catch I've added --disable-kvm to the build.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - add --disable-kvm
  - currently blocked by https://gitlab.com/qemu-project/qemu/-/issues/2413
---
 .gitlab-ci.d/crossbuilds.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 47bdb99b5b..3de0341afe 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -37,6 +37,17 @@ cross-arm64-kvm-only:
     IMAGE: debian-arm64-cross
     EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
 
+cross-i686-system:
+  extends:
+    - .cross_system_build_job
+    - .cross_test_artifacts
+  needs:
+    job: i686-debian-cross-container
+  variables:
+    IMAGE: debian-i686-cross
+    EXTRA_CONFIGURE_OPTS: --disable-kvm
+    MAKE_CHECK_ARGS: check-qtest
+
 cross-i686-user:
   extends:
     - .cross_user_build_job
-- 
2.39.2
