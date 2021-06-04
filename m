Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h9sm6140581wmb.35.2021.06.04.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2040E1FFA5;
	Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 17/99] arm: tcg: only build under CONFIG_TCG
Date: Fri,  4 Jun 2021 16:51:50 +0100
Message-Id: <20210604155312.15902-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CIMlMMFcH/bu

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index b3c9d808f5..04b94a3bfb 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -12,9 +12,9 @@ gen = [
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
 ]
 
-arm_ss.add(gen)
+arm_ss.add(when: 'CONFIG_TCG', if_true: gen)
 
-arm_ss.add(files(
+arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'translate.c',
   'translate-m-nocp.c',
   'translate-neon.c',
@@ -31,7 +31,7 @@ arm_ss.add(files(
   'debug_helper.c',
 ))
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
   'translate-a64.c',
   'translate-sve.c',
   'helper-a64.c',
-- 
2.20.1
