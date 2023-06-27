Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d4c83000000b0030497b3224bsm10775476wrs.64.2023.06.27.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:07:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 28B171FFBE;
	Tue, 27 Jun 2023 17:07:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Leonardo Bras <leobras@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Juan Quintela <quintela@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v3 03/36] gitlab: reduce testing scope of check-gcov
Date: Tue, 27 Jun 2023 17:06:27 +0100
Message-Id: <20230627160700.2955547-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160700.2955547-1-alex.bennee@linaro.org>
References: <20230627160700.2955547-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 327nokZIRYUh

This keeps timing out on gitlab due to some qtests taking a long time.
As this is just ensuring the gcov machinery is working and not
attempting to be comprehensive lets skip qtest in this run.

Message-Id: <20230623122100.1640995-4-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index a8fd9a0c1f..77dc83a6be 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -454,7 +454,7 @@ gcov:
     IMAGE: ubuntu2204
     CONFIGURE_ARGS: --enable-gcov
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
-    MAKE_CHECK_ARGS: check
+    MAKE_CHECK_ARGS: check-unit check-softfloat
   after_script:
     - cd build
     - gcovr --xml-pretty --exclude-unreachable-branches --print-summary
-- 
2.39.2
