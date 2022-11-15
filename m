Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b003a2f2bb72d5sm27892688wmo.45.2022.11.15.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D3D991FFB7;
	Tue, 15 Nov 2022 16:17:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2? v2 0/2] Arm GICv2 fixes
Date: Tue, 15 Nov 2022 16:17:34 +0000
Message-Id: <20221115161736.2425584-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6HRTHBgXhWBp

Hi Peter,

These are the 2 GICv2 patches as you suggested in the last review -
this time with an updated commit message for the second patch. I don't
know if they qualify for 7.2 but here they are if you want them.

Alex Bennée (2):
  hw/intc: clean-up access to GIC multi-byte registers
  hw/intc: add implementation of GICD_IIDR to Arm GIC

 hw/intc/arm_gic.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.34.1
