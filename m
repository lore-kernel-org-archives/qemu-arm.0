Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b0033307ffb193sm3716885wrw.29.2023.12.01.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:36:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7BB945FB6B;
	Fri,  1 Dec 2023 09:36:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Auger <eric.auger@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/7] gitlab: build the correct microblaze target
Date: Fri,  1 Dec 2023 09:36:32 +0000
Message-Id: <20231201093633.2551497-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201093633.2551497-1-alex.bennee@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A4pUkoaMxiRM

We inadvertently built the LE target for BE tests.

Fixes: 78ebc00b06 (gitlab: shuffle some targets and reduce avocado noise)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 7f9af83b10..62b5379a5e 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -41,7 +41,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-docs
-    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
+    TARGETS: alpha-softmmu microblaze-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
 
 check-system-ubuntu:
-- 
2.39.2
