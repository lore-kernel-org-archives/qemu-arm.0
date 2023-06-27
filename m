Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z26-20020a1c4c1a000000b003f91e32b1ebsm1868903wmf.17.2023.06.27.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:07:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6B6121FFC6;
	Tue, 27 Jun 2023 17:07:02 +0100 (BST)
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
Subject: [PATCH v3 14/36] tests/lcitool: introduce qemu-minimal
Date: Tue, 27 Jun 2023 17:06:38 +0100
Message-Id: <20230627160700.2955547-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160700.2955547-1-alex.bennee@linaro.org>
References: <20230627160700.2955547-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 54xpTruyXw0C

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
