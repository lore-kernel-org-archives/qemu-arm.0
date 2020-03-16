Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o5sm483071wmb.8.2020.03.16.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:21:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7E7B01FF90;
	Mon, 16 Mar 2020 17:21:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v1 04/28] tests/docker: Update VirGL to v0.8.0
Date: Mon, 16 Mar 2020 17:21:31 +0000
Message-Id: <20200316172155.971-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ferYQXDkm05r

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Building the qemu:debian-amd64 fails when building VirGL:

  make[2]: Entering directory '/usr/src/virglrenderer/src/gallium/auxiliary'
    CC       cso_cache/cso_cache.lo
    CC       cso_cache/cso_hash.lo
    CC       os/os_misc.lo
    CC       util/u_debug.lo
    CC       util/u_debug_describe.lo
    CC       util/u_format.lo
    GEN      util/u_format_table.c
  Traceback (most recent call last):
    File "./util/u_format_table.py", line 168, in <module>
      main()
    File "./util/u_format_table.py", line 164, in main
      write_format_table(formats)
    File "./util/u_format_table.py", line 132, in write_format_table
      print("   %s,\t/* is_array */" % (bool_map(format.is_array()),))
    File "/usr/src/virglrenderer/src/gallium/auxiliary/util/u_format_parse.py", line 164, in is_array
      return self.array_element() != None
    File "/usr/src/virglrenderer/src/gallium/auxiliary/util/u_format_parse.py", line 73, in __eq__
      return self.type == other.type and self.norm == other.norm and self.pure == other.pure and self.size == other.size
  AttributeError: 'NoneType' object has no attribute 'type'
  make[2]: Leaving directory '/usr/src/virglrenderer/src/gallium/auxiliary'
  make[2]: *** [Makefile:906: util/u_format_table.c] Error 1
  make[1]: *** [Makefile:631: install-recursive] Error 1

VirGL commits a8962eda1..a613dcc82 fix this problem.
Update to VirGL 0.8.0 which contains them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200212202709.12665-4-philmd@redhat.com>
---
 tests/docker/dockerfiles/debian-amd64.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index a1d40a56fa1..c70c916343e 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -28,7 +28,7 @@ RUN apt update && \
         libepoxy-dev \
         libgbm-dev
 RUN git clone https://gitlab.freedesktop.org/virgl/virglrenderer.git /usr/src/virglrenderer && \
-    cd /usr/src/virglrenderer && git checkout virglrenderer-0.7.0
+    cd /usr/src/virglrenderer && git checkout virglrenderer-0.8.0
 RUN cd /usr/src/virglrenderer && ./autogen.sh && ./configure --disable-tests && make install
 
 # netmap
-- 
2.20.1
