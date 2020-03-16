Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f187sm457188wme.31.2020.03.16.10.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:22:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5295E1FF8C;
	Mon, 16 Mar 2020 17:21:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v1 02/28] tests/docker: Update VirGL git repository URL
Date: Mon, 16 Mar 2020 17:21:29 +0000
Message-Id: <20200316172155.971-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kx7wxrHDjY56

From: Philippe Mathieu-Daudé <philmd@redhat.com>

freedesktop.org is moving to a GitLab instance,
use the new url.

- https://www.fooishbar.org/blog/gitlab-fdo-introduction/
- https://gitlab.freedesktop.org/freedesktop/freedesktop/-/wikis/home

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200212202709.12665-2-philmd@redhat.com>
---
 tests/docker/dockerfiles/debian-amd64.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 3b860af1068..b67fad54cb7 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -27,7 +27,7 @@ RUN apt update && \
         libegl1-mesa-dev \
         libepoxy-dev \
         libgbm-dev
-RUN git clone https://anongit.freedesktop.org/git/virglrenderer.git /usr/src/virglrenderer && \
+RUN git clone https://gitlab.freedesktop.org/virgl/virglrenderer.git /usr/src/virglrenderer && \
     cd /usr/src/virglrenderer && git checkout virglrenderer-0.7.0
 RUN cd /usr/src/virglrenderer && ./autogen.sh && ./configure --with-glx --disable-tests && make install
 
-- 
2.20.1
