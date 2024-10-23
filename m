Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91571ed3sm463602366b.164.2024.10.23.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:44:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B34075FC34;
	Wed, 23 Oct 2024 12:34:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	devel@lists.libvirt.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH v3 18/18] plugins: fix qemu_plugin_reset
Date: Wed, 23 Oct 2024 12:34:06 +0100
Message-Id: <20241023113406.1284676-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023113406.1284676-1-alex.bennee@linaro.org>
References: <20241023113406.1284676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cU8dUJ+Egw3Q

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

34e5e1 refactored the plugin context initialization. After this change,
tcg_ctx->plugin_insn is not reset inconditionnally anymore, but only if
one plugin at least is active.

When uninstalling the last plugin active, we stopped reinitializing
tcg_ctx->plugin_insn, which leads to memory callbacks being emitted.
This results in an error as they don't appear in a plugin op sequence as
expected.

The correct fix is to make sure we reset plugin translation variables
after current block translation ends. This way, we can catch any
potential misuse of those after a given block, in more than fixing the
current bug.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2570
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Tested-by: Robbin Ehn <rehn@rivosinc.com>
Message-Id: <20241015003819.984601-1-pierrick.bouvier@linaro.org>
[AJB: trim patch version details from commit msg]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 2ee4c22bef..0f47bfbb48 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -467,4 +467,8 @@ void plugin_gen_tb_end(CPUState *cpu, size_t num_insns)
 
     /* inject the instrumentation at the appropriate places */
     plugin_gen_inject(ptb);
+
+    /* reset plugin translation state (plugin_tb is reused between blocks) */
+    tcg_ctx->plugin_db = NULL;
+    tcg_ctx->plugin_insn = NULL;
 }
-- 
2.39.5
