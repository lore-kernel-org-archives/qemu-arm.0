Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm14970270wrb.29.2024.03.05.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:10:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DC55A5F954;
	Tue,  5 Mar 2024 12:10:05 +0000 (GMT)
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
Subject: [PATCH 04/29] {linux,bsd}-user: Update ts_tid after fork()
Date: Tue,  5 Mar 2024 12:09:40 +0000
Message-Id: <20240305121005.3528075-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L/PqQn/34c44

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently ts_tid contains the parent tid after fork(), which is not
correct. So far it has not affected anything, but the upcoming
follow-fork-mode child support relies on the correct value, so fix it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20240219141628.246823-4-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 bsd-user/main.c   | 1 +
 linux-user/main.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 512d4ab69fc..e39eef3040f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -134,6 +134,7 @@ void fork_end(int child)
          * state, so we don't need to end_exclusive() here.
          */
         qemu_init_cpu_list();
+        get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
         gdbserver_fork(thread_cpu);
     } else {
         mmap_fork_end(child);
diff --git a/linux-user/main.c b/linux-user/main.c
index 551acf16619..699da773714 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -161,6 +161,7 @@ void fork_end(int child)
             }
         }
         qemu_init_cpu_list();
+        get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
         gdbserver_fork(thread_cpu);
     } else {
         cpu_list_unlock();
-- 
2.39.2
