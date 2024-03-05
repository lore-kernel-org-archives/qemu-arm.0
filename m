Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a12-20020a05600c348c00b00412ef5a0c78sm758146wmq.43.2024.03.05.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 009A65F956;
	Tue,  5 Mar 2024 12:10:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brad Smith <brad@comstyle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Brian Cain <bcain@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Beraldo Leal <bleal@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	David Hildenbrand <david@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Warner Losh <imp@bsdimp.com>,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 05/29] gdbstub: Introduce gdbserver_fork_start()
Date: Tue,  5 Mar 2024 12:09:41 +0000
Message-Id: <20240305121005.3528075-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WwavMDPO1boX

From: Ilya Leoshkevich <iii@linux.ibm.com>

The upcoming follow-fork-mode child support requires knowing when
fork() is about to happen in order to initialize its state. Add a hook
for that.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240219141628.246823-5-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/user.h | 5 +++++
 bsd-user/main.c        | 1 +
 gdbstub/user.c         | 4 ++++
 linux-user/main.c      | 1 +
 4 files changed, 11 insertions(+)

diff --git a/include/gdbstub/user.h b/include/gdbstub/user.h
index 68b6534130c..e33f8d9a9a6 100644
--- a/include/gdbstub/user.h
+++ b/include/gdbstub/user.h
@@ -45,6 +45,11 @@ static inline int gdb_handlesig(CPUState *cpu, int sig)
  */
 void gdb_signalled(CPUArchState *as, int sig);
 
+/**
+ * gdbserver_fork_start() - inform gdb of the upcoming fork()
+ */
+void gdbserver_fork_start(void);
+
 /**
  * gdbserver_fork() - disable gdb stub for child processes.
  * @cs: CPU
diff --git a/bsd-user/main.c b/bsd-user/main.c
index e39eef3040f..517c6b3ec2f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -113,6 +113,7 @@ void fork_start(void)
     start_exclusive();
     cpu_list_lock();
     mmap_fork_start();
+    gdbserver_fork_start();
 }
 
 void fork_end(int child)
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 3ce20b7bbfc..536fb43b03e 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -356,6 +356,10 @@ int gdbserver_start(const char *port_or_path)
     return -1;
 }
 
+void gdbserver_fork_start(void)
+{
+}
+
 static void disable_gdbstub(CPUState *thread_cpu)
 {
     CPUState *cpu;
diff --git a/linux-user/main.c b/linux-user/main.c
index 699da773714..755c566d6d2 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -145,6 +145,7 @@ void fork_start(void)
     mmap_fork_start();
     cpu_list_lock();
     qemu_plugin_user_prefork_lock();
+    gdbserver_fork_start();
 }
 
 void fork_end(int child)
-- 
2.39.2
