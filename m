Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x190sm13299933wme.27.2018.02.27.06.38.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:38:54 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 174F93E033B;
	Tue, 27 Feb 2018 14:38:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 03/31] target/arm/cpu.h: update comment for half-precision values
Date: Tue, 27 Feb 2018 14:38:24 +0000
Message-Id: <20180227143852.11175-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7SYPrtM3BKLN

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v4
  - fix comment
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 267a9d7e2f..25f31a4e21 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -168,6 +168,7 @@ typedef struct {
  *  Qn = regs[n].d[1]:regs[n].d[0]
  *  Dn = regs[n].d[0]
  *  Sn = regs[n].d[0] bits 31..0
+ *  Hn = regs[n].d[0] bits 15..0
  *
  * This corresponds to the architecturally defined mapping between
  * the two execution states, and means we do not need to explicitly
-- 
2.15.1
