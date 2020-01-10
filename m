Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d14sm2826056wru.9.2020.01.10.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 08:16:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5DC421FF8C;
	Fri, 10 Jan 2020 16:16:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	1859021@bugs.launchpad.net,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 1/2] target/arm: detect 64 bit overflow caused by high cval + voff
Date: Fri, 10 Jan 2020 16:16:25 +0000
Message-Id: <20200110161626.31943-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110161626.31943-1-alex.bennee@linaro.org>
References: <20200110161626.31943-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zgcduoi8EDO9

If we don't detect this we will be stuck in a busy loop as we schedule
a timer for before now which will continually trigger gt_recalc_timer
even though we haven't reached the state required to trigger the IRQ.

Bug: https://bugs.launchpad.net/bugs/1859021
Cc: 1859021@bugs.launchpad.net
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 19a57a17da5..eb17106f7bd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2481,6 +2481,9 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         } else {
             /* Next transition is when we hit cval */
             nexttick = gt->cval + offset;
+            if (nexttick < gt->cval) {
+                nexttick = UINT64_MAX;
+            }
         }
         /* Note that the desired next expiry time might be beyond the
          * signed-64-bit range of a QEMUTimer -- in this case we just
-- 
2.20.1
