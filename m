Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s13sm1647623wmc.28.2019.09.17.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 11:41:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ACACA1FF90;
	Tue, 17 Sep 2019 19:41:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 3/9] podman: fix command invocation
Date: Tue, 17 Sep 2019 19:41:03 +0100
Message-Id: <20190917184109.12564-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917184109.12564-1-alex.bennee@linaro.org>
References: <20190917184109.12564-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uxF+vDO9Os/+

From: John Snow <jsnow@redhat.com>

Oops; there's no argv here.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20190913193821.17756-1-jsnow@redhat.com>
---
 tests/docker/docker.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 29613afd489..bc7a470ca2a 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -334,7 +334,7 @@ class Docker(object):
             cmd = [ "-u", str(uid) ] + cmd
             # podman requires a bit more fiddling
             if self._command[0] == "podman":
-                argv.insert(0, '--userns=keep-id')
+                cmd.insert(0, '--userns=keep-id')
 
         ret = self._do_check(["run", "--label",
                              "com.qemu.instance.uuid=" + label] + cmd,
-- 
2.20.1
