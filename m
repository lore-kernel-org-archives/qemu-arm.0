Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p14-20020adfce0e000000b0032f7e2f4457sm3067938wrn.66.2023.10.29.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:56:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D8D456570C;
	Sun, 29 Oct 2023 14:50:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Kyle Evans <kevans@freebsd.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Cong Liu <liucong2@kylinos.cn>
Subject: [PATCH v2 19/19] contrib/plugins: Close file descriptor on error return
Date: Sun, 29 Oct 2023 14:50:33 +0000
Message-Id: <20231029145033.592566-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029145033.592566-1-alex.bennee@linaro.org>
References: <20231029145033.592566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rTu5FE1k9gsM

From: Cong Liu <liucong2@kylinos.cn>

This patch closes the file descriptor fd on error return to avoid
resource leak.

Fixes: ec7ee95db909 ("contrib/plugins: fix coverity warning in lockstep")
Signed-off-by: Cong Liu <liucong2@kylinos.cn>
Message-Id: <20231018025225.1640122-1-liucong2@kylinos.cn>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231028103311.347104-18-alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index f0cb8792c6..237543b43a 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -257,6 +257,7 @@ static bool setup_socket(const char *path)
     sockaddr.sun_family = AF_UNIX;
     if (g_strlcpy(sockaddr.sun_path, path, pathlen) >= pathlen) {
         perror("bad path");
+        close(fd);
         return false;
     }
 
@@ -303,6 +304,7 @@ static bool connect_socket(const char *path)
     sockaddr.sun_family = AF_UNIX;
     if (g_strlcpy(sockaddr.sun_path, path, pathlen) >= pathlen) {
         perror("bad path");
+        close(fd);
         return false;
     }
 
-- 
2.39.2
