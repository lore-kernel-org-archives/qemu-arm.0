Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p10sm782836wrx.81.2020.03.16.10.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:22:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D78331FFB4;
	Mon, 16 Mar 2020 17:21:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Damien Hedde <damien.hedde@greensocs.com>,
	Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 27/28] gdbstub: do not split gdb_monitor_write payload
Date: Mon, 16 Mar 2020 17:21:54 +0000
Message-Id: <20200316172155.971-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u3xdQWF5oMob

From: Damien Hedde <damien.hedde@greensocs.com>

Since we can now send packets of arbitrary length:
simplify gdb_monitor_write() and send the whole payload
in one packet.

Suggested-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20191211160514.58373-3-damien.hedde@greensocs.com>
---
 gdbstub.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index a60ef5125eb..9ae148cd1ff 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3200,28 +3200,11 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
     }
 }
 
-static void gdb_monitor_output(const char *msg, int len)
-{
-    g_autoptr(GString) buf = g_string_new("O");
-    memtohex(buf, (uint8_t *)msg, len);
-    put_packet(buf->str);
-}
-
 static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
 {
-    const char *p = (const char *)buf;
-    int max_sz;
-
-    max_sz = (MAX_PACKET_LENGTH / 2) + 1;
-    for (;;) {
-        if (len <= max_sz) {
-            gdb_monitor_output(p, len);
-            break;
-        }
-        gdb_monitor_output(p, max_sz);
-        p += max_sz;
-        len -= max_sz;
-    }
+    g_autoptr(GString) hex_buf = g_string_new("O");
+    memtohex(hex_buf, buf, len);
+    put_packet(hex_buf->str);
     return len;
 }
 
-- 
2.20.1
