Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 25-20020a05600c029900b003f42158288dsm11730705wmk.20.2023.06.26.14.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 14:59:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 566031FFBF;
	Mon, 26 Jun 2023 22:59:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v2 04/26] docs/devel: remind developers to run CI container pipeline when updating images
Date: Mon, 26 Jun 2023 22:59:04 +0100
Message-Id: <20230626215926.2522656-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215926.2522656-1-alex.bennee@linaro.org>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YlAJl63dfVQv

From: Ani Sinha <anisinha@redhat.com>

When new dependencies and packages are added to containers, its important to
run CI container generation pipelines on gitlab to make sure that there are no
obvious conflicts between packages that are being added and those that are
already present. Running CI container pipelines will make sure that there are
no such breakages before we commit the change updating the containers. Add a
line in the documentation reminding developers to run the pipeline before
submitting the change. It will also ease the life of the maintainers.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230506072012.10350-1-anisinha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 203facb417..8f18052ba7 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -485,6 +485,12 @@ first to contribute the mapping to the ``libvirt-ci`` project:
    `CI <https://www.qemu.org/docs/master/devel/ci.html>`__ documentation
    page on how to trigger gitlab CI pipelines on your change.
 
+ * Please also trigger gitlab container generation pipelines on your change
+   for as many OS distros as practical to make sure that there are no
+   obvious breakages when adding the new pre-requisite. Please see
+   `CI <https://www.qemu.org/docs/master/devel/ci.html>`__ documentation
+   page on how to trigger gitlab CI pipelines on your change.
+
 For enterprise distros that default to old, end-of-life versions of the
 Python runtime, QEMU uses a separate set of mappings that work with more
 recent versions.  These can be found in ``tests/lcitool/mappings.yml``.
-- 
2.39.2
