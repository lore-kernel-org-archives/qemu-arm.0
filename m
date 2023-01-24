Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d6dc6000000b002423edd7e50sm2350815wrz.32.2023.01.24.10.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 039921FFBD;
	Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
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
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 19/35] docs: add hotlinks to about preface text
Date: Tue, 24 Jan 2023 18:01:11 +0000
Message-Id: <20230124180127.1881110-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9Ze+Sqkm5O5E

Make it easier to navigate the documentation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/index.rst  | 16 ++++++++--------
 docs/system/index.rst |  2 ++
 docs/tools/index.rst  |  2 ++
 docs/user/index.rst   |  2 ++
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/docs/about/index.rst b/docs/about/index.rst
index 5bea653c07..bae1309cc6 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -5,19 +5,19 @@ About QEMU
 QEMU is a generic and open source machine emulator and virtualizer.
 
 QEMU can be used in several different ways. The most common is for
-"system emulation", where it provides a virtual model of an
+:ref:`System Emulation`, where it provides a virtual model of an
 entire machine (CPU, memory and emulated devices) to run a guest OS.
-In this mode the CPU may be fully emulated, or it may work with
-a hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to
-allow the guest to run directly on the host CPU.
+In this mode the CPU may be fully emulated, or it may work with a
+hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to allow the
+guest to run directly on the host CPU.
 
-The second supported way to use QEMU is "user mode emulation",
+The second supported way to use QEMU is :ref:`User Mode Emulation`,
 where QEMU can launch processes compiled for one CPU on another CPU.
 In this mode the CPU is always emulated.
 
-QEMU also provides a number of standalone commandline utilities,
-such as the ``qemu-img`` disk image utility that allows you to create,
-convert and modify disk images.
+QEMU also provides a number of standalone :ref:`command line
+utilities<Tools>`, such as the ``qemu-img`` disk image utility that
+allows you to create, convert and modify disk images.
 
 .. toctree::
    :maxdepth: 2
diff --git a/docs/system/index.rst b/docs/system/index.rst
index e3695649c5..282b6ffb56 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,3 +1,5 @@
+.. _System Emulation:
+
 ----------------
 System Emulation
 ----------------
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 1edd5a8054..2151adcf78 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,3 +1,5 @@
+.. _Tools:
+
 -----
 Tools
 -----
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 2c4e29f3db..782d27cda2 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,3 +1,5 @@
+.. _User Mode Emulation:
+
 -------------------
 User Mode Emulation
 -------------------
-- 
2.34.1
