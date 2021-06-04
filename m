Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z188sm6250138wme.38.2021.06.04.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 38A711FFA6;
	Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 18/99] target/arm: tcg: add sysemu and user subdirs
Date: Fri,  4 Jun 2021 16:51:51 +0100
Message-Id: <20210604155312.15902-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WI+g+l13aFNS

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/meson.build        | 3 +++
 target/arm/tcg/sysemu/meson.build | 2 ++
 target/arm/tcg/user/meson.build   | 2 ++
 3 files changed, 7 insertions(+)
 create mode 100644 target/arm/tcg/sysemu/meson.build
 create mode 100644 target/arm/tcg/user/meson.build

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 04b94a3bfb..3503ad96c8 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -39,3 +39,6 @@ arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
   'pauth_helper.c',
   'sve_helper.c',
 ))
+
+subdir('user')
+subdir('sysemu')
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
new file mode 100644
index 0000000000..726387b0b3
--- /dev/null
+++ b/target/arm/tcg/sysemu/meson.build
@@ -0,0 +1,2 @@
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+))
diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
new file mode 100644
index 0000000000..7af3311190
--- /dev/null
+++ b/target/arm/tcg/user/meson.build
@@ -0,0 +1,2 @@
+arm_user_ss.add(when: 'CONFIG_TCG', if_true: files(
+))
-- 
2.20.1
