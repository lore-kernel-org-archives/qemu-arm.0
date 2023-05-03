Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k9-20020a5d6e89000000b0030629536e64sm9382356wrz.30.2023.05.03.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5784A1FFBD;
	Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Andrew Jeffery <andrew@aj.id.au>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Beraldo Leal <bleal@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/22] docs: document breakpoint and watchpoint support
Date: Wed,  3 May 2023 10:12:25 +0100
Message-Id: <20230503091244.1450613-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fXv8exOxiFYx

This varies by accelerator. Also mention the modern bear trap that is
ASLR.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/gdb.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 453eb73f6c..7d3718deef 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -46,6 +46,28 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
+Breakpoint and Watchpoint support
+=================================
+
+While GDB can always fall back to inserting breakpoints into memory
+(if writable) other features are very much dependent on support of the
+accelerator. For TCG system emulation we advertise an infinite number
+of hardware assisted breakpoints and watchpoints. For other
+accelerators it will depend on if support has been added (see
+supports_guest_debug and related hooks in AccelOpsClass).
+
+As TCG cannot track all memory accesses in user-mode there is no
+support for watchpoints.
+
+Relocating code
+---------------
+
+On modern kernels confusion can be caused by code being relocated by
+features such as address space layout randomisation. To avoid
+confusion when debugging such things you either need to update gdb's
+view of where things are in memory or perhaps more trivially disable
+ASLR when booting the system.
+
 Debugging multicore machines
 ============================
 
-- 
2.39.2
