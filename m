Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2afsm650058715e9.35.2025.01.07.08.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:52:21 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A05ED60679;
	Tue,  7 Jan 2025 16:52:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-riscv@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Fabiano Rosas <farosas@suse.de>,
	Weiwei Li <liwei1518@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eric Farman <farman@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 29/29] MAINTAINERS: Remove myself from reviewers
Date: Tue,  7 Jan 2025 16:52:07 +0000
Message-Id: <20250107165208.743958-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sybdq4Dj7O6M

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The time I spent contributing to QEMU was great, but I've not been active
for a long time now. So removing myself from the reviewers list of
"Integration Testing with the Avocado framework" and
"Build and test automation" subsystems.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20250103194450.360789-1-wainersm@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cab9018d9f..c1d954c9de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4152,7 +4152,6 @@ M: Alex Bennée <alex.bennee@linaro.org>
 T: git https://gitlab.com/stsquad/qemu testing/next
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 M: Thomas Huth <thuth@redhat.com>
-R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Maintained
 F: .github/workflows/lockdown.yml
 F: .gitlab-ci.yml
@@ -4198,7 +4197,6 @@ Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
-R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
-- 
2.39.5
