Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed369bsm771539666b.100.2024.06.20.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:22:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 259085FA0C;
	Thu, 20 Jun 2024 16:22:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	Cameron Esfahani <dirty@apple.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/12] plugins: fix inject_mem_cb rw masking
Date: Thu, 20 Jun 2024 16:22:19 +0100
Message-Id: <20240620152220.2192768-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620152220.2192768-1-alex.bennee@linaro.org>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kOtH2/Aa+Yrm

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

These are not booleans, but masks.
Issue found by Richard Henderson.

Fixes: f86fd4d8721 ("plugins: distinct types for callbacks")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240612195147.93121-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 4 ++--
 plugins/core.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index cc1634e7a6..b6bae32b99 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -240,13 +240,13 @@ static void inject_mem_cb(struct qemu_plugin_dyn_cb *cb,
 {
     switch (cb->type) {
     case PLUGIN_CB_MEM_REGULAR:
-        if (rw && cb->regular.rw) {
+        if (rw & cb->regular.rw) {
             gen_mem_cb(&cb->regular, meminfo, addr);
         }
         break;
     case PLUGIN_CB_INLINE_ADD_U64:
     case PLUGIN_CB_INLINE_STORE_U64:
-        if (rw && cb->inline_insn.rw) {
+        if (rw & cb->inline_insn.rw) {
             inject_cb(cb);
         }
         break;
diff --git a/plugins/core.c b/plugins/core.c
index badede28cf..9d737d8278 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -589,7 +589,7 @@ void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
 
         switch (cb->type) {
         case PLUGIN_CB_MEM_REGULAR:
-            if (rw && cb->regular.rw) {
+            if (rw & cb->regular.rw) {
                 cb->regular.f.vcpu_mem(cpu->cpu_index,
                                        make_plugin_meminfo(oi, rw),
                                        vaddr, cb->regular.userp);
@@ -597,7 +597,7 @@ void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
             break;
         case PLUGIN_CB_INLINE_ADD_U64:
         case PLUGIN_CB_INLINE_STORE_U64:
-            if (rw && cb->inline_insn.rw) {
+            if (rw & cb->inline_insn.rw) {
                 exec_inline_op(cb->type, &cb->inline_insn, cpu->cpu_index);
             }
             break;
-- 
2.39.2
