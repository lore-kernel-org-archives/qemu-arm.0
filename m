Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z25sm10457578wmf.38.2019.07.05.09.04.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:04:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CA8AA1FF91;
	Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 4/5] gdbstub: add some notes to the header comment
Date: Fri,  5 Jul 2019 17:04:20 +0100
Message-Id: <20190705160421.19015-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tBhJoJMhfVTM

Add a link to the remote protocol spec and an SPDX tag.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 8618e34311..ea3349d1aa 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1,6 +1,10 @@
 /*
  * gdb server stub
  *
+ * This implements a subset of the remote protocol as described in:
+ *
+ *   https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
+ *
  * Copyright (c) 2003-2005 Fabrice Bellard
  *
  * This library is free software; you can redistribute it and/or
@@ -15,6 +19,8 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include "qemu/osdep.h"
-- 
2.20.1
