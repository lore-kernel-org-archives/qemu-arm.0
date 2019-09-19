Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a13sm19762180wrf.73.2019.09.19.10.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:10:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 090F31FF91;
	Thu, 19 Sep 2019 18:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 04/16] tests/docker: reduce scary warnings from failed inspect
Date: Thu, 19 Sep 2019 18:10:03 +0100
Message-Id: <20190919171015.12681-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rnTZR/lE0QYE

There is a race here in the clean-up code so lets just accept that
sometimes the active task we just looked up might have finished before
we got to inspect it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 29613afd489..4dca6006d2f 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -235,20 +235,24 @@ class Docker(object):
         if not only_active:
             cmd.append("-a")
         for i in self._output(cmd).split():
-            resp = self._output(["inspect", i])
-            labels = json.loads(resp)[0]["Config"]["Labels"]
-            active = json.loads(resp)[0]["State"]["Running"]
-            if not labels:
-                continue
-            instance_uuid = labels.get("com.qemu.instance.uuid", None)
-            if not instance_uuid:
-                continue
-            if only_known and instance_uuid not in self._instances:
-                continue
-            print("Terminating", i)
-            if active:
-                self._do(["kill", i])
-            self._do(["rm", i])
+            try:
+                resp = self._output(["inspect", i])
+                labels = json.loads(resp)[0]["Config"]["Labels"]
+                active = json.loads(resp)[0]["State"]["Running"]
+                if not labels:
+                    continue
+                instance_uuid = labels.get("com.qemu.instance.uuid", None)
+                if not instance_uuid:
+                    continue
+                if only_known and instance_uuid not in self._instances:
+                    continue
+                print("Terminating", i)
+                if active:
+                    self._do(["kill", i])
+                    self._do(["rm", i])
+            except subprocess.CalledProcessError:
+                # i likely finished running before we got here
+                pass
 
     def clean(self):
         self._do_kill_instances(False, False)
-- 
2.20.1
