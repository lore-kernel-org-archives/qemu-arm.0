Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c2sm4420103wre.22.2017.07.13.07.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jul 2017 07:19:29 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id EBDF83E06FF;
	Thu, 13 Jul 2017 15:19:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [PATCH v4 1/6] include/exec/exec-all: document common exit conditions
Date: Thu, 13 Jul 2017 15:19:23 +0100
Message-Id: <20170713141928.25419-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170713141928.25419-1-alex.bennee@linaro.org>
References: <20170713141928.25419-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2M1qm019007r

As a precursor to later patches attempt to come up with a more
concrete wording for what each of the common exit cases would be.

CC: Emilio G. Cota <cota@braap.org>
CC: Richard Henderson <rth@twiddle.net>
CC: Lluís Vilanova <vilanova@ac.upc.edu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 include/exec/exec-all.h | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8096d64a1d..a23894f687 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -35,11 +35,34 @@ typedef abi_ulong tb_page_addr_t;
 typedef ram_addr_t tb_page_addr_t;
 #endif
 
-/* is_jmp field values */
+/* DisasContext is_jmp field values
+ *
+ * is_jmp starts as DISAS_NEXT. The translator will keep processing
+ * instructions until an exit condition is reached. If we reach the
+ * exit condition and is_jmp is still DISAS_NEXT (because of some
+ * other condition) we simply "jump" to the next address.
+ * The remaining exit cases are:
+ *
+ *   DISAS_JUMP    - Only the PC was modified dynamically (e.g computed)
+ *   DISAS_TB_JUMP - Only the PC was modified statically (e.g. branch)
+ *
+ * In these cases as long as the PC is updated we can chain to the
+ * next TB either by exiting the loop or looking up the next TB via
+ * the loookup helper.
+ *
+ *   DISAS_UPDATE  - CPU State was modified dynamically
+ *
+ * This covers any other CPU state which necessities us exiting the
+ * TCG code to the main run-loop. Typically this includes anything
+ * that might change the interrupt state.
+ *
+ * Individual translators may define additional exit cases to deal
+ * with per-target special conditions.
+ */
 #define DISAS_NEXT    0 /* next instruction can be analyzed */
 #define DISAS_JUMP    1 /* only pc was modified dynamically */
-#define DISAS_UPDATE  2 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP 3 /* only pc was modified statically */
+#define DISAS_TB_JUMP 2 /* only pc was modified statically */
+#define DISAS_UPDATE  3 /* cpu state was modified dynamically */
 
 #include "qemu/log.h"
 
-- 
2.13.0
