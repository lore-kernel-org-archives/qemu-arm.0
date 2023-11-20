Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b004068495910csm18174146wmq.23.2023.11.20.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B663565776;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 08/14] docs/system: clarify limits of using gdbstub in system emulation
Date: Mon, 20 Nov 2023 15:08:27 +0000
Message-Id: <20231120150833.2552739-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6w/7nuJ99/j+

It seems some users will try and use the gdbstub to debug userspace
inside a system emulation. While possible clarify the limitations of
this approach and direct the users to a less head scratching way of
debugging user-space.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Clarifies: https://gitlab.com/qemu-project/qemu/-/issues/1274
---
 docs/system/gdb.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 9906991b84..c0cc0c9c7e 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -60,7 +60,7 @@ As TCG cannot track all memory accesses in user-mode there is no
 support for watchpoints.
 
 Relocating code
----------------
+===============
 
 On modern kernels confusion can be caused by code being relocated by
 features such as address space layout randomisation. To avoid
@@ -68,6 +68,17 @@ confusion when debugging such things you either need to update gdb's
 view of where things are in memory or perhaps more trivially disable
 ASLR when booting the system.
 
+Debugging user-space in system emulation
+========================================
+
+While technically possible to debug a user-space program running
+inside a system image it does present challenges. Kernel preemption
+and execution mode changes between kernel and user mode can make it
+hard to follow whats going on. Unless you are specifically trying to
+debug some interaction between kernel and user-space you are better
+off running your guest program with gdb either in the guest or using
+a gdbserver exposed via a port to the outside world.
+
 Debugging multicore machines
 ============================
 
-- 
2.39.2
