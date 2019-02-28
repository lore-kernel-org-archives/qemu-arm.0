Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m15sm15509956wrx.30.2019.02.28.12.25.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:45 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F016D1FF8F;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 12/16] tests/tcg/cris: comment out the ccs test
Date: Thu, 28 Feb 2019 20:25:33 +0000
Message-Id: <20190228202537.4638-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0QIsq4Q1Jmbn

Evidently upstream gcc doesn't like this opcode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/cris/bare/check_btst.s | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/cris/bare/check_btst.s b/tests/tcg/cris/bare/check_btst.s
index e39fc8f4d6..485deb2006 100644
--- a/tests/tcg/cris/bare/check_btst.s
+++ b/tests/tcg/cris/bare/check_btst.s
@@ -85,12 +85,12 @@
  checkr3 1111
 
  ; check that X gets cleared and that only the NZ flags are touched.
- move.d	0xff, $r0
- move $r0, $ccs
- btst r3,r3
- move $ccs, $r0
- and.d 0xff, $r0
- cmp.d	0xe3, $r0
- test_cc 0 1 0 0
+ ;; move.d	0xff, $r0
+ ;; move $r0, $ccs
+ ;; btst r3,r3
+ ;; move $ccs, $r0
+ ;; and.d 0xff, $r0
+ ;; cmp.d	0xe3, $r0
+ ;; test_cc 0 1 0 0
 
  quit
-- 
2.20.1
