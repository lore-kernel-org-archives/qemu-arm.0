Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4b8f000000b00336a0c083easm26789106wrt.53.2024.01.03.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 09:49:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B41EC5F9D8;
	Wed,  3 Jan 2024 17:33:53 +0000 (GMT)
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 43/43] docs/devel: document some plugin assumptions
Date: Wed,  3 Jan 2024 17:33:49 +0000
Message-Id: <20240103173349.398526-44-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Fpwy1kx6b1gk

While we attempt to hide implementation details from the plugin we
shouldn't be totally obtuse. Let the user know what they can and can't
expect with the various instrumentation options.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 535a74684c5..9cc09d8c3da 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -112,6 +112,55 @@ details are opaque to plugins. The plugin is able to query select
 details of instructions and system configuration only through the
 exported *qemu_plugin* functions.
 
+However the following assumptions can be made:
+
+Translation Blocks
+++++++++++++++++++
+
+All code will go through a translation phase although not all
+translations will be necessarily be executed. You need to instrument
+actual executions to track what is happening.
+
+It is quite normal to see the same address translated multiple times.
+If you want to track the code in system emulation you should examine
+the underlying physical address (``qemu_plugin_insn_haddr``) to take
+into account the effects of virtual memory although if the system does
+paging this will change too.
+
+Not all instructions in a block will always execute so if its
+important to track individual instruction execution you need to
+instrument them directly. However asynchronous interrupts will not
+change control flow mid-block.
+
+Instructions
+++++++++++++
+
+Instruction instrumentation runs before the instruction executes. You
+can be can be sure the instruction will be dispatched, but you can't
+be sure it will complete. Generally this will be because of a
+synchronous exception (e.g. SIGILL) triggered by the instruction
+attempting to execute. If you want to be sure you will need to
+instrument the next instruction as well. See the ``execlog.c`` plugin
+for examples of how to track this and finalise details after execution.
+
+Memory Accesses
++++++++++++++++
+
+Memory callbacks are called after a successful load or store.
+Unsuccessful operations (i.e. faults) will not be visible to memory
+instrumentation although the execution side effects can be observed
+(e.g. entering a exception handler).
+
+System Idle and Resume States
++++++++++++++++++++++++++++++
+
+The ``qemu_plugin_register_vcpu_idle_cb`` and
+``qemu_plugin_register_vcpu_resume_cb`` functions can be used to track
+when CPUs go into and return from sleep states when waiting for
+external I/O. Be aware though that these may occur less frequently
+than in real HW due to the inefficiencies of emulation giving less
+chance for the CPU to idle.
+
 Internals
 ---------
 
-- 
2.39.2
