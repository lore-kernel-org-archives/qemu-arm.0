Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f66sm9379143wmg.2.2019.09.06.13.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 13:26:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2874A1FF87;
	Fri,  6 Sep 2019 21:26:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 0/4] semihosting at translate time fixes
Date: Fri,  6 Sep 2019 21:26:31 +0100
Message-Id: <20190906202636.28642-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8mOqeDWgA9zZ

Hi Peter,

Hopefully this is the final version of the semihosting at translate
time patches. I've applied Richard's IS_USER changes and gated the SVN
for !M profile.

Alex Bennée (3):
  target/arm: handle M-profile semihosting at translate time
  target/arm: handle A-profile semihosting at translate time
  target/arm: remove run time semihosting checks

Emilio G. Cota (1):
  atomic_template: fix indentation in GEN_ATOMIC_HELPER

 accel/tcg/atomic_template.h |  2 +-
 target/arm/helper.c         | 96 +++++++++----------------------------
 target/arm/m_helper.c       | 18 +++----
 target/arm/translate.c      | 24 ++++++++--
 4 files changed, 48 insertions(+), 92 deletions(-)

-- 
2.20.1
