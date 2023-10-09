Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n20-20020adf8b14000000b003296b62d413sm9694532wra.82.2023.10.09.09.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:41:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 446EA1FFBC;
	Mon,  9 Oct 2023 17:41:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 10/25] plugins: Check if vCPU is realized
Date: Mon,  9 Oct 2023 17:40:49 +0100
Message-Id: <20231009164104.369749-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hvlnmyeK9+Gh

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The created member of CPUState tells if the vCPU thread is started, and
will be always false for the user space emulation that manages threads
independently. Use the realized member of DeviceState, which is valid
for both of the system and user space emulation.

Fixes: 54cb65d858 ("plugin: add core code")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-4-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/core.c b/plugins/core.c
index 3c4e26c7ed..fcd33a2bff 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -64,7 +64,7 @@ static void plugin_cpu_update__locked(gpointer k, gpointer v, gpointer udata)
     CPUState *cpu = container_of(k, CPUState, cpu_index);
     run_on_cpu_data mask = RUN_ON_CPU_HOST_ULONG(*plugin.mask);
 
-    if (cpu->created) {
+    if (DEVICE(cpu)->realized) {
         async_run_on_cpu(cpu, plugin_cpu_update__async, mask);
     } else {
         plugin_cpu_update__async(cpu, mask);
-- 
2.39.2
