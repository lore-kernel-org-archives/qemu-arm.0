Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q6-20020a7bce86000000b003fbaa2903f4sm1063394wmj.19.2023.06.27.09.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:25:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 205811FFD3;
	Tue, 27 Jun 2023 17:09:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-stable@nongnu.org,
	Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 27/36] gdbstub: Permit reverse step/break to provide stop response
Date: Tue, 27 Jun 2023 17:09:34 +0100
Message-Id: <20230627160943.2956928-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7dDn44PTWzcI

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
