Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s4-20020adfea84000000b002ca864b807csm11119526wrm.0.2023.06.27.09.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:15:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5B0DA1FFCE;
	Tue, 27 Jun 2023 17:09:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 20/36] docs/devel: add some front matter to the devel index
Date: Tue, 27 Jun 2023 17:09:27 +0100
Message-Id: <20230627160943.2956928-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KdU+Dyp08WKD

Give an overview of the most useful bits of the devel documentation to
read depending on what the developer wants to do.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230623122100.1640995-22-alex.bennee@linaro.org>

---
v2
  - removed excessive start
---
 docs/devel/index-process.rst |  2 ++
 docs/devel/index-tcg.rst     |  2 ++
 docs/devel/index.rst         | 24 ++++++++++++++++++++++--
 docs/devel/tcg.rst           |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
index d50dd74c3e..362f97ee30 100644
--- a/docs/devel/index-process.rst
+++ b/docs/devel/index-process.rst
@@ -1,3 +1,5 @@
+.. _development_process:
+
 QEMU Community Processes
 ------------------------
 
diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
index b44ff8b5a4..a992844e5c 100644
--- a/docs/devel/index-tcg.rst
+++ b/docs/devel/index-tcg.rst
@@ -1,3 +1,5 @@
+.. _tcg:
+
 TCG Emulation
 -------------
 
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 09cfb322be..abf60457c2 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -2,10 +2,30 @@
 Developer Information
 ---------------------
 
-This section of the manual documents various parts of the internals of QEMU.
-You only need to read it if you are interested in reading or
+This section of the manual documents various parts of the internals of
+QEMU. You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
+QEMU is a large and mature project with a number of complex subsystems
+that can be overwhelming to understand. The development documentation
+is not comprehensive but hopefully presents enough to get you started.
+If there are areas that are unclear please reach out either via the
+IRC channel or mailing list and hopefully we can improve the
+documentation for future developers.
+
+All developers will want to familiarise themselves with
+:ref:`development_process` and how the community interacts. Please pay
+particular attention to the :ref:`coding-style` and
+:ref:`submitting-a-patch` sections to avoid common pitfalls.
+
+If you wish to implement a new hardware model you will want to read
+through the :ref:`qom` documentation to understand how QEMU's object
+model works.
+
+Those wishing to enhance or add new CPU emulation capabilities will
+want to read our :ref:`tcg` documentation, especially the overview of
+the :ref:`tcg_internals`.
+
 .. toctree::
    :maxdepth: 1
 
diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index b4096a17df..2786f2f679 100644
--- a/docs/devel/tcg.rst
+++ b/docs/devel/tcg.rst
@@ -1,3 +1,5 @@
+.. _tcg_internals:
+
 ====================
 Translator Internals
 ====================
-- 
2.39.2
