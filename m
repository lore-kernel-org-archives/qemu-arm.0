Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p12sm8462680wme.43.2021.06.04.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F2F9D1FFAC;
	Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Alexander Graf <agraf@csgraf.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 23/99] target/arm: only build psci for TCG
Date: Fri,  4 Jun 2021 16:51:56 +0100
Message-Id: <20210604155312.15902-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: r+g9gB6bhzqR

From: Claudio Fontana <cfontana@suse.de>

We do not move psci.c to tcg/ because we expect other
hypervisors to use it (waiting for HVF enablement).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0172937b40..a9fdada0cc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -19,8 +19,12 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
+))
+
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'psci.c',
 ))
+
 arm_user_ss = ss.source_set()
 
 subdir('tcg')
-- 
2.20.1
