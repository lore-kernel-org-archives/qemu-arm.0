Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t11-20020a5d534b000000b003232380ffd5sm10082444wrv.106.2023.10.09.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ED3E71FFCF;
	Mon,  9 Oct 2023 17:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 24/25] contrib/plugins: fix coverity warning in lockstep
Date: Mon,  9 Oct 2023 17:41:03 +0100
Message-Id: <20231009164104.369749-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NHydK9o9/u6R

Coverity complains that e don't check for a truncation when copying in
the path. Bail if we can't copy the whole path into sockaddr.

Fixes: CID 1519045
Fixes: CID 1519046
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 682b11feb2..f0cb8792c6 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -245,6 +245,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 static bool setup_socket(const char *path)
 {
     struct sockaddr_un sockaddr;
+    const gsize pathlen = sizeof(sockaddr.sun_path) - 1;
     int fd;
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
@@ -254,7 +255,11 @@ static bool setup_socket(const char *path)
     }
 
     sockaddr.sun_family = AF_UNIX;
-    g_strlcpy(sockaddr.sun_path, path, sizeof(sockaddr.sun_path) - 1);
+    if (g_strlcpy(sockaddr.sun_path, path, pathlen) >= pathlen) {
+        perror("bad path");
+        return false;
+    }
+
     if (bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("bind socket");
         close(fd);
@@ -287,6 +292,7 @@ static bool connect_socket(const char *path)
 {
     int fd;
     struct sockaddr_un sockaddr;
+    const gsize pathlen = sizeof(sockaddr.sun_path) - 1;
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (fd < 0) {
@@ -295,7 +301,10 @@ static bool connect_socket(const char *path)
     }
 
     sockaddr.sun_family = AF_UNIX;
-    g_strlcpy(sockaddr.sun_path, path, sizeof(sockaddr.sun_path) - 1);
+    if (g_strlcpy(sockaddr.sun_path, path, pathlen) >= pathlen) {
+        perror("bad path");
+        return false;
+    }
 
     if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("failed to connect");
-- 
2.39.2
