Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w11-20020adff9cb000000b002c54e9f6bc2sm11834697wrr.77.2023.02.15.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:25:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 80A191FFB8;
	Wed, 15 Feb 2023 19:25:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 01/12] gitlab: tweak and filter ninja output to reduce build noise
Date: Wed, 15 Feb 2023 19:25:19 +0000
Message-Id: <20230215192530.299263-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6jtpJCFo0jIk

A significant portion of our CI logs are just enumerating each
successfully built object file. The current widespread versions of
ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
string to the ninja output which we then filter with grep. If there
are any errors in the output we get them from the compiler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 73ecfabb8d..3af51846cd 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -21,7 +21,7 @@
       then
         ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
       fi || exit 1;
-    - make -j"$JOBS"
+    - env NINJA_STATUS="[ninja][%f/%t] " make -j"$JOBS" | grep -v "\[ninja\]\[.*[123456789]/"
     - if test -n "$MAKE_CHECK_ARGS";
       then
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
-- 
2.39.1
