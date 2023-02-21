Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x8-20020a1c7c08000000b003dc4480df80sm4966219wmc.34.2023.02.21.15.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 15:01:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A4A3C1FFBB;
	Tue, 21 Feb 2023 22:52:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	nicolas.eder@lauterbach.com,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	mads@ynddal.dk,
	Marek Vasut <marex@denx.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bin.meng@windriver.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Chris Wulff <crwulff@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 17/24] gdbstub: fix address type of gdb_set_cpu_pc
Date: Tue, 21 Feb 2023 22:52:20 +0000
Message-Id: <20230221225227.3735319-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3WC5XiA6Ri90

The underlying call uses vaddr and the comms API uses unsigned long
long which will always fit. We don't need to deal in target_ulong
here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e107aa065c..4814e8fbf3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -535,7 +535,7 @@ static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 }
 
 
-static void gdb_set_cpu_pc(target_ulong pc)
+static void gdb_set_cpu_pc(vaddr pc)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
 
@@ -1289,7 +1289,7 @@ static void handle_file_io(GArray *params, void *user_ctx)
 static void handle_step(GArray *params, void *user_ctx)
 {
     if (params->len) {
-        gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
+        gdb_set_cpu_pc(get_param(params, 0)->val_ull);
     }
 
     cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
-- 
2.39.1
