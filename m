Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u22sm7540146wmu.43.2020.04.02.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 07:39:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 70C6F1FF7E;
	Thu,  2 Apr 2020 15:39:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm: don't expose "ieee_half" via gdbstub
Date: Thu,  2 Apr 2020 15:39:13 +0100
Message-Id: <20200402143913.24005-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PkfeVB775scR

While support for parsing ieee_half in the XML description was added
to gdb in 2019 (a6d0f249) there is no easy way for the gdbstub to know
if the gdb end will understand it. Disable it for now and allow older
gdbs to successfully connect to the default -cpu max SVE enabled
QEMUs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/gdbstub.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index d9ef7d2187c..8efc535f2a0 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -192,7 +192,12 @@ static const struct TypeSize vec_lanes[] = {
     /* 16 bit */
     { "uint16", 16, 'h', 'u' },
     { "int16", 16, 'h', 's' },
-    { "ieee_half", 16, 'h', 'f' },
+    /*
+     * TODO: currently there is no reliable way of telling
+     * if the remote gdb actually understands ieee_half so
+     * we don't expose it in the target description for now.
+     * { "ieee_half", 16, 'h', 'f' },
+     */
     /* bytes */
     { "uint8", 8, 'b', 'u' },
     { "int8", 8, 'b', 's' },
-- 
2.20.1
