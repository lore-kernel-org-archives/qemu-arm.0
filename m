Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58615038a86sm978580a12.95.2024.06.28.05.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:43:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1EFFE5FA39;
	Fri, 28 Jun 2024 13:43:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 12/23] plugins/lockstep: clean-up output
Date: Fri, 28 Jun 2024 13:42:47 +0100
Message-Id: <20240628124258.832466-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gTeSvgni3Nm2

We were repeating information which wasn't super clear. As we already
will have dumped the last failing PC just note the divergence and dump
the previous instruction log.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 353bf12dfb..5b7dfc9c06 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -135,10 +135,13 @@ static void report_divergance(ExecState *us, ExecState *them)
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
-        g_string_printf(out,
-                        "@ 0x%016" PRIx64 " vs 0x%016" PRIx64
+        g_string_printf(out, "@ "
+                        "0x%016" PRIx64 " (%" PRId64 ") vs "
+                        "0x%016" PRIx64 " (%" PRId64 ")"
                         " (%d/%d since last)\n",
-                        us->pc, them->pc, g_slist_length(divergence_log),
+                        us->pc, us->insn_count,
+                        them->pc, them->insn_count,
+                        g_slist_length(divergence_log),
                         divrec.distance);
         qemu_plugin_outs(out->str);
     }
@@ -147,10 +150,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         int i;
         GSList *entry;
 
-        g_string_printf(out,
-                        "Δ insn_count @ 0x%016" PRIx64
-                        " (%"PRId64") vs 0x%016" PRIx64 " (%"PRId64")\n",
-                        us->pc, us->insn_count, them->pc, them->insn_count);
+        g_string_printf(out, "Δ too high, we have diverged, previous insns\n");
 
         for (entry = log, i = 0;
              g_slist_next(entry) && i < 5;
@@ -163,7 +163,7 @@ static void report_divergance(ExecState *us, ExecState *them)
                                    prev->insn_count);
         }
         qemu_plugin_outs(out->str);
-        qemu_plugin_outs("too much divergence... giving up.");
+        qemu_plugin_outs("giving up\n");
         qemu_plugin_uninstall(our_id, plugin_cleanup);
     }
 }
-- 
2.39.2
