Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j13sm7873547wrw.93.2021.04.28.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 06:13:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EAC011FF7E;
	Wed, 28 Apr 2021 14:13:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif@nuviainc.com>,
	qemu-arm@nongnu.org (open list:SBSA-REF)
Subject: [PATCH] docs: fix link in sbsa description
Date: Wed, 28 Apr 2021 14:13:16 +0100
Message-Id: <20210428131316.31390-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jhPw8lVEkdWC

A trailing _ makes all the difference to the rendered link.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/sbsa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index b8ecfdb62f..27b0999aac 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -4,7 +4,7 @@ Arm Server Base System Architecture Reference board (``sbsa-ref``)
 While the `virt` board is a generic board platform that doesn't match
 any real hardware the `sbsa-ref` board intends to look like real
 hardware. The `Server Base System Architecture
-<https://developer.arm.com/documentation/den0029/latest>` defines a
+<https://developer.arm.com/documentation/den0029/latest>`_ defines a
 minimum base line of hardware support and importantly how the firmware
 reports that to any operating system. It is a static system that
 reports a very minimal DT to the firmware for non-discoverable
-- 
2.20.1
