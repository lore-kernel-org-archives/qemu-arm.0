Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a2c441sm487354166b.90.2024.09.10.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A0FFB5FA18;
	Tue, 10 Sep 2024 15:07:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 10/26] contrib/plugins/Makefile: Add a 'distclean' target
Date: Tue, 10 Sep 2024 15:07:17 +0100
Message-Id: <20240910140733.4007719-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NgPjUI9nX0uH

From: Thomas Huth <thuth@redhat.com>

Running "make distclean" in the build tree currently fails since this
tries to run the "distclean" target in the contrib/plugins/ folder, too,
but the Makefile there is missing this target. Thus add 'distclean' there
to fix this issue.

And to avoid regressions with "make distclean", add this command to one
of the build jobs, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240902154749.73876-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 ++
 contrib/plugins/Makefile   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 1d2afae996..8bc67ef7e9 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -345,6 +345,8 @@ build-tcg-disabled:
             124 132 139 142 144 145 151 152 155 157 165 194 196 200 202
             208 209 216 218 227 234 246 247 248 250 254 255 257 258
             260 261 262 263 264 270 272 273 277 279 image-fleecing
+    - cd ../..
+    - make distclean
 
 build-user:
   extends: .native_build_job_template
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index edf256cd9d..05a2a45c5c 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -77,7 +77,7 @@ lib%$(SO_SUFFIX): %.o
 endif
 
 
-clean:
+clean distclean:
 	rm -f *.o *$(SO_SUFFIX) *.d
 	rm -Rf .libs
 
-- 
2.39.2
