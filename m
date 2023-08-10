Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k18-20020a056000005200b00317d2be2e59sm2513473wrx.73.2023.08.10.08.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:36:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A2D1E1FFC3;
	Thu, 10 Aug 2023 16:36:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	gdb-patches@sourceware.org
Subject: [PATCH 8/8] gdbstub: don't complain about preemptive ACK chars
Date: Thu, 10 Aug 2023 16:36:40 +0100
Message-Id: <20230810153640.1879717-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810153640.1879717-1-alex.bennee@linaro.org>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2ny/QJPPWZj0

When starting a remote connection GDB sends an '+':

  /* Ack any packet which the remote side has already sent.  */
  remote_serial_write ("+", 1);

which gets flagged as a garbage character in the gdbstub state
machine. As gdb does send it out lets be permissive about the handling
so we can better see real issues.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: gdb-patches@sourceware.org
---
 gdbstub/gdbstub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 20b6fe03fb..5f28d5cf57 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -2074,6 +2074,11 @@ void gdb_read_byte(uint8_t ch)
                 gdbserver_state.line_buf_index = 0;
                 gdbserver_state.line_sum = 0;
                 gdbserver_state.state = RS_GETLINE;
+            } else if (ch == '+') {
+                /*
+                 * do nothing, gdb may preemptively send out ACKs on
+                 * initial connection
+                 */
             } else {
                 trace_gdbstub_err_garbage(ch);
             }
-- 
2.39.2
