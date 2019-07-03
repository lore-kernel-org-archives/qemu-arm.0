Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p11sm3338001wrm.53.2019.07.03.08.52.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 08:52:44 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 519D71FF87;
	Wed,  3 Jul 2019 16:52:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/4] arm semihosting cleanups
Date: Wed,  3 Jul 2019 16:52:40 +0100
Message-Id: <20190703155244.28166-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YCQjrFzDo0WM

Hi,

One of the comments that came up during the review of the plugin
series was around the clumsiness of tweaking arm_ld*_code. The main
reason was it was being used to "peak" at semihosting instructions at
runtime to decide what to do. This series fixes that up to make all
the semihosting invocation consistent and resolved at translation
time.

Alex Bennée (4):
  target/arm: handle M-profile semihosting at translate time
  target/arm: handle A-profile T32 semihosting at translate time
  target/arm: handle A-profile A32 semihosting at translate time
  target/arm: remove run time semihosting checks

 target/arm/helper.c    | 102 ++++++++++-------------------------------
 target/arm/translate.c |  64 ++++++++++++++++++++++----
 2 files changed, 79 insertions(+), 87 deletions(-)

-- 
2.20.1
