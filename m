Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d538f000000b0031ae8d86af4sm14142002wrv.103.2023.08.29.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 09:15:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A8E3F1FFC5;
	Tue, 29 Aug 2023 17:15:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Juan Quintela <quintela@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 12/12] gdbstub: move comment for gdb_register_coprocessor
Date: Tue, 29 Aug 2023 17:15:28 +0100
Message-Id: <20230829161528.2707696-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829161528.2707696-1-alex.bennee@linaro.org>
References: <20230829161528.2707696-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6HmS2wU90PHM

Use proper kdoc style comments for this API function.

Message-Id: <20230824163910.1737079-13-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 10 ++++++++++
 gdbstub/gdbstub.c      |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 0ee39cfdd1..16a139043f 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -14,6 +14,16 @@
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
 typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
+
+/**
+ * gdb_register_coprocessor() - register a supplemental set of registers
+ * @cpu - the CPU associated with registers
+ * @get_reg - get function (gdb reading)
+ * @set_reg - set function (gdb modifying)
+ * @num_regs - number of registers in set
+ * @xml - xml name of set
+ * @gpos - non-zero to append to "general" register set at @gpos
+ */
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index fdebfe25ea..349d348c7b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -456,12 +456,6 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     return 0;
 }
 
-/* Register a supplemental set of CPU registers.  If g_pos is nonzero it
-   specifies the first register number and these registers are included in
-   a standard "g" packet.  Direction is relative to gdb, i.e. get_reg is
-   gdb reading a CPU register, and set_reg is gdb modifying a CPU register.
- */
-
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos)
-- 
2.39.2
