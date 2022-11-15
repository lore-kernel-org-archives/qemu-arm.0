Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003c6cd82596esm23346895wmq.43.2022.11.15.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9C0081FFB7;
	Tue, 15 Nov 2022 13:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2? v1 0/2] Arm GICv2 patches
Date: Tue, 15 Nov 2022 13:40:46 +0000
Message-Id: <20221115134048.2352715-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: unfEnDtf3xt9

Hi Peter,

These are the 2 GICv2 patches as you suggested in the last review. I
don't know if they qualify for 7.2 but here they are if you want them.

Alex Bennée (2):
  hw/intc: clean-up access to GIC multi-byte registers
  hw/intc: add implementation of GICD_IIDR to Arm GIC

 hw/intc/arm_gic.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.34.1
