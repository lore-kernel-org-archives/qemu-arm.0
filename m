Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c204900b003f93c450657sm11187352wmg.38.2023.06.27.09.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:09:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 87DA21FFBF;
	Tue, 27 Jun 2023 17:09:45 +0100 (BST)
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
Subject: [PATCH v3 14/36] tests/lcitool: introduce qemu-minimal
Date: Tue, 27 Jun 2023 17:09:21 +0100
Message-Id: <20230627160943.2956928-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LEN+LVje2nRI

This is a very bare bones set of dependencies for a minimal build of
QEMU. This will be useful for minimal cross-compile sanity check based
on things like Debian Sid where stuff isn't always in sync.

Message-Id: <20230623122100.1640995-16-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - minor rewording
---
 tests/lcitool/projects/qemu-minimal.yml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 tests/lcitool/projects/qemu-minimal.yml

diff --git a/tests/lcitool/projects/qemu-minimal.yml b/tests/lcitool/projects/qemu-minimal.yml
new file mode 100644
index 0000000000..b60fec715c
--- /dev/null
+++ b/tests/lcitool/projects/qemu-minimal.yml
@@ -0,0 +1,23 @@
+# Very minimal set of qemu packages, used for minimal cross-compile sanity checks
+---
+packages:
+ - bash
+ - bc
+ - bison
+ - flex
+ - g++
+ - gcc
+ - gcc-native
+ - glib2
+ - glib2-native
+ - glib2-static
+ - libc-static
+ - libfdt
+ - libffi
+ - make
+ - meson
+ - ninja
+ - pixman
+ - pkg-config
+ - python3
+ - python3-venv
-- 
2.39.2
