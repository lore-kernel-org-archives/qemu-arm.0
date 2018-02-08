Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h200sm425083wme.11.2018.02.08.09.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:00 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 099373E0BD4;
	Thu,  8 Feb 2018 17:31:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 04/32] target/arm/cpu.h: update comment for half-precision values
Date: Thu,  8 Feb 2018 17:31:29 +0000
Message-Id: <20180208173157.24705-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aodm6Zk9hlia

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c793250186..f976969011 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -486,6 +486,7 @@ typedef struct CPUARMState {
          *  Qn = regs[2n+1]:regs[2n]
          *  Dn = regs[2n]
          *  Sn = regs[2n] bits 31..0
+         *  Hn = regs[2n] bits 15..0 for even n, and bits 31..16 for odd n
          * This corresponds to the architecturally defined mapping between
          * the two execution states, and means we do not need to explicitly
          * map these registers when changing states.
-- 
2.15.1
