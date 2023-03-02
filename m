Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c351100b003e4326a6d53sm4241899wmq.35.2023.03.02.11.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:08:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C8E001FFBA;
	Thu,  2 Mar 2023 19:08:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Laurent Vivier <laurent@vivier.eu>,
	nicolas.eder@lauterbach.com,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	qemu-s390x@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Marek Vasut <marex@denx.de>,
	Greg Kurz <groug@kaod.org>,
	Song Gao <gaosong@loongson.cn>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	mads@ynddal.dk,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 02/26] gdbstub: fix-up copyright and license files
Date: Thu,  2 Mar 2023 19:08:22 +0000
Message-Id: <20230302190846.2593720-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WArYkWv1iOjU

When I started splitting gdbstub apart I was a little too boilerplate
with my file headers. Fix up to carry over Fabrice's copyright and the
LGPL license header.

Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 3 ++-
 gdbstub/user.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 129575e510..05db6f8a9f 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -4,9 +4,10 @@
  * Debug integration depends on support from the individual
  * accelerators so most of this involves calling the ops helpers.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 484bd8f461..09a18fb23b 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -3,9 +3,10 @@
  *
  * We know for user-mode we are using TCG so we can call stuff directly.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
-- 
2.39.2
