Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x18-20020adff0d2000000b003365aa39d30sm30989513wro.11.2024.01.03.09.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 09:39:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FDAA5F951;
	Wed,  3 Jan 2024 17:33:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Yanan Wang <wangyanan55@huawei.com>,
	Bin Meng <bin.meng@windriver.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 21/43] readthodocs: fully specify a build environment
Date: Wed,  3 Jan 2024 17:33:27 +0000
Message-Id: <20240103173349.398526-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0RYcqNZgxBCn

This is now expected by rtd so I've expanded using their example as
22.04 is one of our supported platforms. I tried to work out if there
was an easy way to re-generate a requirements.txt from our
pythondeps.toml but in the end went for the easier solution.

Cc:  <qemu-stable@nongnu.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231221174200.2693694-1-alex.bennee@linaro.org>
---
 docs/requirements.txt |  2 ++
 .readthedocs.yml      | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 docs/requirements.txt

diff --git a/docs/requirements.txt b/docs/requirements.txt
new file mode 100644
index 00000000000..691e5218ec7
--- /dev/null
+++ b/docs/requirements.txt
@@ -0,0 +1,2 @@
+sphinx==5.3.0
+sphinx_rtd_theme==1.1.1
diff --git a/.readthedocs.yml b/.readthedocs.yml
index 7fb7b8dd61a..0b262469ce6 100644
--- a/.readthedocs.yml
+++ b/.readthedocs.yml
@@ -5,16 +5,21 @@
 # Required
 version: 2
 
+# Set the version of Python and other tools you might need
+build:
+  os: ubuntu-22.04
+  tools:
+    python: "3.11"
+
 # Build documentation in the docs/ directory with Sphinx
 sphinx:
   configuration: docs/conf.py
 
+# We recommend specifying your dependencies to enable reproducible builds:
+# https://docs.readthedocs.io/en/stable/guides/reproducible-builds.html
+python:
+  install:
+    - requirements: docs/requirements.txt
+
 # We want all the document formats
 formats: all
-
-# For consistency, we require that QEMU's Sphinx extensions
-# run with at least the same minimum version of Python that
-# we require for other Python in our codebase (our conf.py
-# enforces this, and some code needs it.)
-python:
-  version: 3.6
-- 
2.39.2
