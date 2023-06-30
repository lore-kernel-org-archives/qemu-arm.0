Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b00313f45f74a8sm13308744wrm.103.2023.06.30.11.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 044331FFD0;
	Fri, 30 Jun 2023 19:04:27 +0100 (BST)
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
Subject: [PATCH v4 26/38] docs/devel: split qom-api reference into new file
Date: Fri, 30 Jun 2023 19:04:11 +0100
Message-Id: <20230630180423.558337-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: G3w/V72qryRu

Lets try and keep the overview of the sub-system digestible by
splitting the core API stuff into a separate file. As QOM and QDEV
work together we should also try and enumerate the qdev_ functions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230619171437.357374-5-alex.bennee@linaro.org>

---
v2
  - also include qdev API
---
 docs/devel/index-api.rst | 2 ++
 docs/devel/qdev-api.rst  | 7 +++++++
 docs/devel/qom-api.rst   | 9 +++++++++
 docs/devel/qom.rst       | 3 ++-
 4 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/qdev-api.rst
 create mode 100644 docs/devel/qom-api.rst

diff --git a/docs/devel/index-api.rst b/docs/devel/index-api.rst
index 7108821746..539ad29c21 100644
--- a/docs/devel/index-api.rst
+++ b/docs/devel/index-api.rst
@@ -11,5 +11,7 @@ generated from in-code annotations to function prototypes.
    loads-stores
    memory
    modules
+   qom-api
+   qdev-api
    ui
    zoned-storage
diff --git a/docs/devel/qdev-api.rst b/docs/devel/qdev-api.rst
new file mode 100644
index 0000000000..3f35eea025
--- /dev/null
+++ b/docs/devel/qdev-api.rst
@@ -0,0 +1,7 @@
+.. _qdev-api:
+
+================================
+QEMU Device (qdev) API Reference
+================================
+
+.. kernel-doc:: include/hw/qdev-core.h
diff --git a/docs/devel/qom-api.rst b/docs/devel/qom-api.rst
new file mode 100644
index 0000000000..ed1f17e797
--- /dev/null
+++ b/docs/devel/qom-api.rst
@@ -0,0 +1,9 @@
+.. _qom-api:
+
+=====================================
+QEMU Object Model (QOM) API Reference
+=====================================
+
+This is the complete API documentation for :ref:`qom`.
+
+.. kernel-doc:: include/qom/object.h
diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 2828843058..c342ce18e3 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -387,4 +387,5 @@ OBJECT_DEFINE_ABSTRACT_TYPE() macro can be used instead:
 API Reference
 -------------
 
-.. kernel-doc:: include/qom/object.h
+See the :ref:`QOM API<qom-api>` and :ref:`QDEV API<qdev-api>`
+documents for the complete API description.
-- 
2.39.2
