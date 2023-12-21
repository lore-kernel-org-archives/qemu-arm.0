Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b0040d378623b1sm2793725wmb.22.2023.12.21.02.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:38:29 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 46A945F8C3;
	Thu, 21 Dec 2023 10:38:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Brian Cain <bcain@quicinc.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cleber Rosa <crosa@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-s390x@nongnu.org,
	David Woodhouse <dwmw2@infradead.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Henderson <richard.henderson@linaro.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 14/40] qtest: bump aspeed_smc-test timeout to 6 minutes
Date: Thu, 21 Dec 2023 10:37:52 +0000
Message-Id: <20231221103818.1633766-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5ZUfyrEYgOdb

From: Daniel P. Berrangé <berrange@redhat.com>

On a loaded system with --enable-debug, this test can take longer than
5 minutes. Raising the timeout to 6 minutes gives greater headroom for
such situations.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[thuth: Increase the timeout to 6 minutes for very loaded systems]
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-11-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index b02ca540cff..da53dd66c97 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,4 +1,5 @@
 slow_qtests = {
+  'aspeed_smc-test': 360,
   'bios-tables-test' : 120,
   'migration-test' : 480,
   'npcm7xx_pwm-test': 300,
-- 
2.39.2
