Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 98sm746549wrk.52.2020.03.16.10.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:22:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9323E1FF91;
	Mon, 16 Mar 2020 17:21:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v1 05/28] travis.yml: Set G_MESSAGES_DEBUG do report GLib errors
Date: Mon, 16 Mar 2020 17:21:32 +0000
Message-Id: <20200316172155.971-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X0rRtqcydXIp

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit f5852efa293 we can display GLib errors with the QEMU
error reporting API. Set it to the 'error' level, as this helps
understanding failures from QEMU calls to GLib on Travis-CI.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200316101544.22361-1-philmd@redhat.com>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index b92798ac3b9..ccf68aa9abc 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -79,6 +79,7 @@ env:
     - MAIN_SOFTMMU_TARGETS="aarch64-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
     - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
     - CCACHE_MAXSIZE=1G
+    - G_MESSAGES_DEBUG=error
 
 
 git:
-- 
2.20.1
