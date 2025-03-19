Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f556afsm25431265e9.19.2025.03.19.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B9FAA60341;
	Wed, 19 Mar 2025 18:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 06/10] target/ppc: make ppc_maybe_bswap_register static
Date: Wed, 19 Mar 2025 18:22:51 +0000
Message-Id: <20250319182255.3096731-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TxiITkN7ymIW

It's not used outside of the gdbstub code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/cpu.h     | 1 -
 target/ppc/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1e833ade04..950bb6e06c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -3016,7 +3016,6 @@ static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
 
 void dump_mmu(CPUPPCState *env);
 
-void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
 void ppc_set_cr(CPUPPCState *env, uint64_t cr);
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 3b28d4e21c..c09e93abaf 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -81,7 +81,7 @@ static int ppc_gdb_register_len(int n)
  * TARGET_BIG_ENDIAN is always set, and we must check the current
  * mode of the chip to see if we're running in little-endian.
  */
-void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
+static void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
 {
 #ifndef CONFIG_USER_ONLY
     if (!FIELD_EX64(env->msr, MSR, LE)) {
-- 
2.39.5
