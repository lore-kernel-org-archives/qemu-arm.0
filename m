Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s65sm320942wmf.48.2019.11.30.00.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 00:54:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A60D01FF9A;
	Sat, 30 Nov 2019 08:46:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	alan.hayward@arm.com,
	luis.machado@linaro.org,
	damien.hedde@greensocs.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 11/14] target/arm: default SVE length to 64 bytes for linux-user
Date: Sat, 30 Nov 2019 08:45:59 +0000
Message-Id: <20191130084602.10818-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130084602.10818-1-alex.bennee@linaro.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nBB8rCEgNA3T

The Linux kernel chooses the default of 64 bytes for SVE registers on
the basis that it is the largest size that won't grow the signal
frame. When debugging larger sizes are also unwieldy in gdb as each
zreg will take over a page of terminal to display.

The user can of course always specify a larger size with the
sve-max-vq property on the command line:

  -cpu max,sve-max-vq=16

This should not make any difference to SVE enabled software as the SVE
is of course vector length agnostic.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a39d6fcea34..bc5d6c4b974 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -703,6 +703,9 @@ static void aarch64_max_initfn(Object *obj)
          */
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
+
+        /* Default sve-max-vq to a reasonable numer */
+        cpu->sve_max_vq = 4;
 #endif
     }
 
-- 
2.20.1
