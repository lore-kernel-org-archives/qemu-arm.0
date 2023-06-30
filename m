Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a16-20020adfdd10000000b00313ef2150dcsm15111904wrm.45.2023.06.30.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C88B1FFCC;
	Fri, 30 Jun 2023 19:04:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v4 21/38] plugins: update lockstep to use g_memdup2
Date: Fri, 30 Jun 2023 19:04:06 +0100
Message-Id: <20230630180423.558337-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dqsUj7lFw8/p

The old g_memdup is deprecated, use the replacement.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230627160943.2956928-20-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index e36f0b9562..3614c3564c 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -130,7 +130,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         }
     }
     divergence_log = g_slist_prepend(divergence_log,
-                                     g_memdup(&divrec, sizeof(divrec)));
+                                     g_memdup2(&divrec, sizeof(divrec)));
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
-- 
2.39.2
