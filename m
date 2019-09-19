Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z142sm12389182wmc.24.2019.09.19.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:19:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 292F31FF8C;
	Thu, 19 Sep 2019 18:10:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 15/16] docs/devel: add "check-tcg" to testing.rst
Date: Thu, 19 Sep 2019 18:10:14 +0100
Message-Id: <20190919171015.12681-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4VgYXNr3saWb

It was pointed out we haven't documented the check-tcg part of the
build system. Attempt to rectify that now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index bf75675fb04..1feee3ad101 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -266,6 +266,8 @@ another application on the host may have locked the file, possibly leading to a
 test failure.  If using such devices are explicitly desired, consider adding
 ``locking=off`` option to disable image locking.
 
+.. _docker-ref:
+
 Docker based tests
 ==================
 
@@ -799,3 +801,63 @@ And remove any package you want with::
 
 If you've used ``make check-acceptance``, the Python virtual environment where
 Avocado is installed will be cleaned up as part of ``make check-clean``.
+
+Testing with "make check-tcg"
+=============================
+
+The check-tcg tests are intended for simple smoke tests of both
+linux-user and softmmu TCG functionality. However to build test
+programs for guest targets you need to have cross compilers available.
+If your distribution supports cross compilers you can do something as
+simple as::
+
+  apt install gcc-aarch64-linux-gnu
+
+The configure script will automatically pick up their presence.
+Sometimes compilers have slightly odd names so the availability of
+them can be prompted by passing in the appropriate configure option
+for the architecture in question, for example::
+
+  $(configure) --cross-cc-aarch64=aarch64-cc
+
+There is also a ``--cross-cc-flags-ARCH`` flag in case additional
+compiler flags are needed to build for a given target.
+
+If you have the ability to run containers as the user you can also
+take advantage of the build systems "Docker" support. It will then use
+containers to build any test case for an enabled guest where there is
+no system compiler available. See :ref: `_docker-ref` for details.
+
+TCG test dependencies
+---------------------
+
+The TCG tests are deliberately very light on dependencies and are
+either totally bare with minimal gcc lib support (for softmmu tests)
+or just glibc (for linux-user tests). This is because getting a cross
+compiler to work with additional libraries can be challenging.
+
+Other TCG Tests
+---------------
+
+There are a number of out-of-tree test suites that are used for more
+extensive testing of processor features.
+
+KVM Unit Tests
+~~~~~~~~~~~~~~
+
+The KVM unit tests are designed to run as a Guest OS under KVM but
+there is no reason why they can't exercise the TCG as well. It
+provides a minimal OS kernel with hooks for enabling the MMU as well
+as reporting test results via a special device::
+
+  https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
+
+Linux Test Project
+~~~~~~~~~~~~~~~~~~
+
+The LTP is focused on exercising the syscall interface of a Linux
+kernel. It checks that syscalls behave as documented and strives to
+exercise as many corner cases as possible. It is a useful test suite
+to run to exercise QEMU's linux-user code::
+
+  https://linux-test-project.github.io/
-- 
2.20.1
