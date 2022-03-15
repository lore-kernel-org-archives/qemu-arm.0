Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id eq18-20020a170907291200b006da97b09661sm8024676ejc.17.2022.03.15.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A5BFB1FFBE;
	Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH  v1 6/8] docs/devel: try and impose some organisation
Date: Tue, 15 Mar 2022 12:12:49 +0000
Message-Id: <20220315121251.2280317-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CIr5GbNbcSIO

We have a growing set of developer docs but the index is currently in
order of when stuff was added. Try and make things a bit easier to
find my adding sub indexes and organising into themes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>

---
v2
  - fix whitespace issues
---
 docs/devel/index-api.rst       | 15 +++++++++++
 docs/devel/index-build.rst     | 19 ++++++++++++++
 docs/devel/index-internals.rst | 21 ++++++++++++++++
 docs/devel/index-process.rst   | 17 +++++++++++++
 docs/devel/index-tcg.rst       | 16 ++++++++++++
 docs/devel/index.rst           | 46 ++++++----------------------------
 6 files changed, 95 insertions(+), 39 deletions(-)
 create mode 100644 docs/devel/index-api.rst
 create mode 100644 docs/devel/index-build.rst
 create mode 100644 docs/devel/index-internals.rst
 create mode 100644 docs/devel/index-process.rst
 create mode 100644 docs/devel/index-tcg.rst

diff --git a/docs/devel/index-api.rst b/docs/devel/index-api.rst
new file mode 100644
index 0000000000..b749240272
--- /dev/null
+++ b/docs/devel/index-api.rst
@@ -0,0 +1,15 @@
+Internal QEMU APIs
+------------------
+
+Details about how QEMU's various internal APIs. Most of these are
+generated from in-code annotations to function prototypes.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   bitops
+   loads-stores
+   memory
+   modules
+   ui
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
new file mode 100644
index 0000000000..d96894f07c
--- /dev/null
+++ b/docs/devel/index-build.rst
@@ -0,0 +1,19 @@
+QEMU Build and Test System
+--------------------------
+
+Details about how QEMU's build system works and how it is integrated
+into our testing infrastructure. You will need to understand some of
+the basics if you are adding new files and targets to the build.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   build-system
+   kconfig
+   testing
+   qtest
+   ci
+   qapi-code-gen
+   fuzzing
+   control-flow-integrity
diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
new file mode 100644
index 0000000000..bb118b8eaf
--- /dev/null
+++ b/docs/devel/index-internals.rst
@@ -0,0 +1,21 @@
+Internal Subsystem Information
+------------------------------
+
+Details about QEMU's various subsystems including how to add features to them.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   qom
+   atomics
+   block-coroutine-wrapper
+   clocks
+   ebpf_rss
+   migration
+   multi-process
+   reset
+   s390-dasd-ipl
+   tracing
+   vfio-migration
+   writing-monitor-commands
diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
new file mode 100644
index 0000000000..314e9e94cc
--- /dev/null
+++ b/docs/devel/index-process.rst
@@ -0,0 +1,17 @@
+QEMU Community Processes
+------------------------
+
+Notes about how to interact with the community and how and where to submit patches.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   code-of-conduct
+   conflict-resolution
+   style
+   submitting-a-patch
+   trivial-patches
+   stable-process
+   submitting-a-pull-request
+   secure-coding-practices
diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
new file mode 100644
index 0000000000..3acbd95d36
--- /dev/null
+++ b/docs/devel/index-tcg.rst
@@ -0,0 +1,16 @@
+TCG Emulation
+-------------
+
+Details about QEMU's Tiny Code Generator and the infrastructure
+associated with emulation. You do not need to worry about this if you
+are only implementing things for HW accelerated hypervisors.
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   tcg
+   decodetree
+   multi-thread-tcg
+   tcg-icount
+   tcg-plugins
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index afd937535e..a68207052d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -7,44 +7,12 @@ You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
 .. toctree::
-   :maxdepth: 2
+   :maxdepth: 1
    :includehidden:
 
-   code-of-conduct
-   conflict-resolution
-   build-system
-   style
-   kconfig
-   testing
-   fuzzing
-   control-flow-integrity
-   loads-stores
-   memory
-   migration
-   atomics
-   stable-process
-   ci
-   qtest
-   decodetree
-   secure-coding-practices
-   tcg
-   tcg-icount
-   tracing
-   multi-thread-tcg
-   tcg-plugins
-   bitops
-   ui
-   reset
-   s390-dasd-ipl
-   clocks
-   qom
-   modules
-   block-coroutine-wrapper
-   multi-process
-   ebpf_rss
-   vfio-migration
-   qapi-code-gen
-   writing-monitor-commands
-   trivial-patches
-   submitting-a-patch
-   submitting-a-pull-request
+
+   index-process
+   index-build
+   index-api
+   index-internals
+   index-tcg
-- 
2.30.2
