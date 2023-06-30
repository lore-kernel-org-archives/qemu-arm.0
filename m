Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 25-20020a05600c029900b003f42158288dsm22573094wmk.20.2023.06.30.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:13:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4FF8A1FFD3;
	Fri, 30 Jun 2023 19:04:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-stable@nongnu.org,
	Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v4 29/38] gdbstub: Permit reverse step/break to provide stop response
Date: Fri, 30 Jun 2023 19:04:14 +0100
Message-Id: <20230630180423.558337-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qVrcg1BRakC5

From: Nicholas Piggin <npiggin@gmail.com>

The final part of the reverse step and break handling is to bring
the machine back to a debug stop state. gdb expects a response.

A gdb 'rsi' command hangs forever because the gdbstub filters out
the response (also observable with reverse_debugging.py avocado
tests).

Fix by setting allow_stop_reply for the gdb backward packets.

Fixes: 758370052fb ("gdbstub: only send stop-reply packets when allowed to")
Cc: qemu-stable@nongnu.org
Cc: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Acked-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Message-Id: <20230623035304.279833-1-npiggin@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be18568d0a..9496d7b175 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1814,6 +1814,7 @@ static int gdb_handle_packet(const char *line_buf)
                 .handler = handle_backward,
                 .cmd = "b",
                 .cmd_startswith = 1,
+                .allow_stop_reply = true,
                 .schema = "o0"
             };
             cmd_parser = &backward_cmd_desc;
-- 
2.39.2
