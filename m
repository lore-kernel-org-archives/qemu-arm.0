Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b003db0b0cc2afsm15523598wmq.30.2023.01.24.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CA5F81FFBA;
	Tue, 24 Jan 2023 18:01:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 02/35] gitlab: add FF_SCRIPT_SECTIONS for timings
Date: Tue, 24 Jan 2023 18:00:54 +0000
Message-Id: <20230124180127.1881110-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7j3lTmR9O9j7

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/base.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 69b36c148a..50fb59e147 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -6,6 +6,11 @@
 # most restrictive to least restrictive
 #
 .base_job_template:
+  variables:
+    # Each script line from will be in a collapsible section in the job output
+    # and show the duration of each line.
+    FF_SCRIPT_SECTIONS: 1
+
   rules:
     #############################################################
     # Stage 1: exclude scenarios where we definitely don't
-- 
2.34.1
