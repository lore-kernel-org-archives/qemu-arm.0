Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b184sm10000262wmg.47.2019.09.19.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:10:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1F88B1FF92;
	Thu, 19 Sep 2019 18:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 05/16] podman: fix command invocation
Date: Thu, 19 Sep 2019 18:10:04 +0100
Message-Id: <20190919171015.12681-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tywkRXg40F5Y

From: John Snow <jsnow@redhat.com>

Oops; there's no argv here.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20190913193821.17756-1-jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 4dca6006d2f..890e874ba93 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -338,7 +338,7 @@ class Docker(object):
             cmd = [ "-u", str(uid) ] + cmd
             # podman requires a bit more fiddling
             if self._command[0] == "podman":
-                argv.insert(0, '--userns=keep-id')
+                cmd.insert(0, '--userns=keep-id')
 
         ret = self._do_check(["run", "--label",
                              "com.qemu.instance.uuid=" + label] + cmd,
-- 
2.20.1
