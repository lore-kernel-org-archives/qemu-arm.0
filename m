Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t17-v6sm3574692wrr.82.2018.06.13.05.56.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id B86393E126F;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 11/22] risugen: add dtype_msz address helper
Date: Wed, 13 Jun 2018 13:55:50 +0100
Message-Id: <20180613125601.14371-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aJXlS5bVw/JF

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risugen_arm.pm | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/risugen_arm.pm b/risugen_arm.pm
index 696bf5f..8d423b1 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -765,6 +765,15 @@ sub write_get_offset()
     write_risuop($OP_GETMEMBLOCK);
 }
 
+# Return the log2 of the memory size of an operation described by dtype.
+sub dtype_msz($)
+{
+    my ($dtype) = @_;
+    my $dth = $dtype >> 2;
+    my $dtl = $dtype & 3;
+    return $dtl >= $dth ? $dth : 3 - $dth;
+}
+
 sub reg($@)
 {
     my ($base, @trashed) = @_;
-- 
2.17.1
