Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c280400b0040fe308ff25sm2733004wmb.24.2024.02.16.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:37:35 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C73195F9E1;
	Fri, 16 Feb 2024 16:30:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-riscv@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 15/23] cpu: call plugin init hook asynchronously
Date: Fri, 16 Feb 2024 16:30:17 +0000
Message-Id: <20240216163025.424857-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216163025.424857-1-alex.bennee@linaro.org>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KEwYx1zvj3eS

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This ensures we run during a cpu_exec, which allows to call start/end
exclusive from this init hook (needed for new scoreboard API introduced
later).

async work is run before any tb is translated/executed, so we can
guarantee plugin init will be called before any other hook.

The previous change made sure that any idle/resume cb call will not be
done before initializing plugin for a given vcpu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240213094009.150349-5-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/cpu-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index fe16d0d9df8..68786360ea5 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -194,6 +194,11 @@ static void cpu_common_parse_features(const char *typename, char *features,
     }
 }
 
+static void qemu_plugin_vcpu_init__async(CPUState *cpu, run_on_cpu_data unused)
+{
+    qemu_plugin_vcpu_init_hook(cpu);
+}
+
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
@@ -217,9 +222,9 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
         cpu_resume(cpu);
     }
 
-    /* Plugin initialization must wait until the cpu is fully realized. */
+    /* Plugin initialization must wait until the cpu start executing code */
     if (tcg_enabled()) {
-        qemu_plugin_vcpu_init_hook(cpu);
+        async_run_on_cpu(cpu, qemu_plugin_vcpu_init__async, RUN_ON_CPU_NULL);
     }
 
     /* NOTE: latest generic point where the cpu is fully realized */
-- 
2.39.2
