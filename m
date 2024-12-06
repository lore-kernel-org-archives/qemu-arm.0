Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fd46cc8sm4791799f8f.59.2024.12.06.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:02:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 75DB25F9EA;
	Fri,  6 Dec 2024 16:02:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH 1/3] target/arm: document the architectural names of our GTIMERs
Date: Fri,  6 Dec 2024 16:02:37 +0000
Message-Id: <20241206160239.3229094-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206160239.3229094-1-alex.bennee@linaro.org>
References: <20241206160239.3229094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sbK/DhRB1caU

As we are about to add more physical and virtual timers lets make it
clear what each timer does.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 target/arm/gtimer.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
index b992941bef..de016e6da3 100644
--- a/target/arm/gtimer.h
+++ b/target/arm/gtimer.h
@@ -10,11 +10,11 @@
 #define TARGET_ARM_GTIMER_H
 
 enum {
-    GTIMER_PHYS     = 0,
-    GTIMER_VIRT     = 1,
-    GTIMER_HYP      = 2,
-    GTIMER_SEC      = 3,
-    GTIMER_HYPVIRT  = 4,
+    GTIMER_PHYS     = 0, /* EL1 physical timer */
+    GTIMER_VIRT     = 1, /* EL1 virtual timer */
+    GTIMER_HYP      = 2, /* EL2 physical timer */
+    GTIMER_SEC      = 3, /* EL3 physical timer */
+    GTIMER_HYPVIRT  = 4, /* EL2 virtual timer */
 #define NUM_GTIMERS   5
 };
 
-- 
2.39.5
