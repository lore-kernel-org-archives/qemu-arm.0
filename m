Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id iv12-20020a05600c548c00b0040641a9d49bsm16047128wmb.17.2023.11.07.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:23:58 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 13CB66575A;
	Tue,  7 Nov 2023 14:23:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 05/23] target/arm: hide aliased MIDR from gdbstub
Date: Tue,  7 Nov 2023 14:23:36 +0000
Message-Id: <20231107142354.3151266-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107142354.3151266-1-alex.bennee@linaro.org>
References: <20231107142354.3151266-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 42D9xrNHiszu

This is just a constant alias register with the same value as the
"other" MIDR so it serves no purpose being presented to gdbstub.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20231106185112.2755262-6-alex.bennee@linaro.org>

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6acd87f5b9..ff1970981e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9000,7 +9000,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
         ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
-            .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
+            .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST | ARM_CP_NO_GDB,
             .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
             .access = PL1_R, .resetvalue = cpu->midr
         };
-- 
2.39.2
