Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g17sm4841694wru.13.2020.02.13.14.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 14:51:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B5E7B1FF8C;
	Thu, 13 Feb 2020 22:51:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	aaron@os.amperecomputing.com,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	kuhn.chenqun@huawei.com,
	robhenry@microsoft.com,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	stefanb@linux.vnet.ibm.com,
	marcandre.lureau@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 01/19] tests/tcg: include a skip runner for pauth3 with plugins
Date: Thu, 13 Feb 2020 22:50:51 +0000
Message-Id: <20200213225109.13120-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213225109.13120-1-alex.bennee@linaro.org>
References: <20200213225109.13120-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2HlL1IqpFeNB

If we have plugins enabled we still need to have built the test to be
able to run it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index d2299b98b76..71f72cfbe34 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -70,4 +70,6 @@ pauth-3:
 	$(call skip-test, "BUILD of $@", "missing compiler support")
 run-pauth-3:
 	$(call skip-test, "RUN of pauth-3", "not built")
+run-plugin-pauth-3-with-%:
+	$(call skip-test, "RUN of pauth-3 ($*)", "not built")
 endif
-- 
2.20.1
