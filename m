Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7e50sm537503566b.69.2024.07.18.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AB4EC5FA3B;
	Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?= <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH 07/15] plugins/execlog.c: correct dump of registers values
Date: Thu, 18 Jul 2024 10:45:15 +0100
Message-Id: <20240718094523.1198645-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kHcuekqgnzCz

From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>

Register values are dumped as 'sz' chunks of two nibbles in the execlog
plugin, sz was 1 too big.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240620083805.73603-1-frederic.petrot@univ-grenoble-alpes.fr>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 371db97eb1..1c1601cc0b 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -101,7 +101,7 @@ static void insn_check_regs(CPU *cpu)
             GByteArray *temp = reg->last;
             g_string_append_printf(cpu->last_exec, ", %s -> 0x", reg->name);
             /* TODO: handle BE properly */
-            for (int i = sz; i >= 0; i--) {
+            for (int i = sz - 1; i >= 0; i--) {
                 g_string_append_printf(cpu->last_exec, "%02x",
                                        reg->new->data[i]);
             }
-- 
2.39.2
