Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r10-20020adfce8a000000b00336781490dcsm31126317wrn.69.2024.01.03.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 09:33:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EF0895F93C;
	Wed,  3 Jan 2024 17:33:49 +0000 (GMT)
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 07/43] qtest: bump qom-test timeout to 15 minutes
Date: Wed,  3 Jan 2024 17:33:13 +0000
Message-Id: <20240103173349.398526-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QFullN74AHSW

From: Daniel P. Berrangé <berrange@redhat.com>

The qom-test is periodically hitting the 5 minute timeout when running
on the aarch64 emulator under GitLab CI. With an --enable-debug build
it can take over 10 minutes for arm/aarch64 targets. Setting timeout
to 15 minutes gives enough headroom to hopefully make it reliable.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20230717182859.707658-4-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f184d051cfe..000ac54b7d6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -2,7 +2,7 @@ slow_qtests = {
   'bios-tables-test' : 120,
   'migration-test' : 480,
   'npcm7xx_pwm-test': 150,
-  'qom-test' : 300,
+  'qom-test' : 900,
   'test-hmp' : 120,
 }
 
-- 
2.39.2
