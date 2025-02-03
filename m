Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7106178ccsm412435466b.9.2025.02.03.06.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:49:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8209F60F1B;
	Mon,  3 Feb 2025 14:40:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	Peter Xu <peterx@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-rust@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 18/18] plugins: fix -Werror=maybe-uninitialized false-positive
Date: Mon,  3 Feb 2025 14:40:48 +0000
Message-Id: <20250203144048.2131117-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RrvuJluqalXW

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../contrib/plugins/cache.c:638:9: error: ‘l2_cache’ may be used uninitialized [-Werror=maybe-uninitialized]
  638 |         append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Is a false-positive, since cores > 1, so the variable is set in the
above loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20250114104820.2613099-1-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 7baff86860..7cfd3df249 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -603,7 +603,7 @@ static int l2_cmp(gconstpointer a, gconstpointer b)
 static void log_stats(void)
 {
     int i;
-    Cache *icache, *dcache, *l2_cache;
+    Cache *icache, *dcache, *l2_cache = NULL;
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-- 
2.39.5
