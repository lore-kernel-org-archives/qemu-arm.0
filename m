Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u4-20020adfed44000000b002c563b124basm10673883wro.103.2023.02.28.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 399FC1FFC6;
	Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 17/24] configure: expose the direct container command
Date: Tue, 28 Feb 2023 19:06:46 +0000
Message-Id: <20230228190653.1602033-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Yc9+DFYuW4Ov

In the process of migrating away from using docker.py to build our
containers we need to expose the command to the build environment. The
script is still a useful way to probe which command works though.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index dccb5d4f96..1e36e05c37 100755
--- a/configure
+++ b/configure
@@ -1748,6 +1748,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
+runc=""
 if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
@@ -1756,6 +1757,7 @@ if test $use_containers = "yes" && (has "docker" || has "podman"); then
     esac
     if test "$container" != "no"; then
         docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+        runc=$($python "$source_path"/tests/docker/docker.py probe)
     fi
 fi
 
@@ -2355,6 +2357,7 @@ fi
 
 if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
+    echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
-- 
2.39.2
