Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s22sm414601wmc.16.2020.03.16.10.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:22:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EC0801FFB5;
	Mon, 16 Mar 2020 17:21:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Changbin Du <changbin.du@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Luc Michel <luc.michel@greensocs.com>
Subject: [PATCH  v1 28/28] gdbstub: Fix single-step issue by confirming 'vContSupported+' feature to gdb
Date: Mon, 16 Mar 2020 17:21:55 +0000
Message-Id: <20200316172155.971-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7VFSts44NqRb

From: Changbin Du <changbin.du@gmail.com>

Recently when debugging an arm32 system on qemu, I found sometimes the
single-step command (stepi) is not working. This can be reproduced by
below steps:
 1) start qemu-system-arm -s -S .. and wait for gdb connection.
 2) start gdb and connect to qemu. In my case, gdb gets a wrong value
    (0x60) for PC, which is an another bug.
 3) After connected, type 'stepi' and expect it will stop at next ins.

But, it has never stopped. This because:
 1) We doesn't report ‘vContSupported’ feature to gdb explicitly and gdb
    think we do not support it. In this case, gdb use a software breakpoint
    to emulate single-step.
 2) Since gdb gets a wrong initial value of PC, then gdb inserts a
    breakpoint to wrong place (PC+4).

Not only for the arm target, Philippe has also encountered this on MIPS.
Probably gdb has different assumption for different architectures.

Since we do support ‘vContSupported’ query command, so let's tell gdb that
we support it.

Before this change, gdb send below 'Z0' packet to implement single-step:
gdb_handle_packet: Z0,4,4

After this change, gdb send "vCont;s.." which is expected:
gdb_handle_packet: vCont?
put_packet: vCont;c;C;s;S
gdb_handle_packet: vCont;s:p1.1;c:p1.-1

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200221002559.6768-1-changbin.du@gmail.com>
[AJB: fix for static gdbstub]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9ae148cd1ff..013fb1ac0f1 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2130,7 +2130,7 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
         gdbserver_state.multiprocess = true;
     }
 
-    g_string_append(gdbserver_state.str_buf, ";multiprocess+");
+    g_string_append(gdbserver_state.str_buf, ";vContSupported+;multiprocess+");
     put_strbuf();
 }
 
-- 
2.20.1
