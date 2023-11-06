Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bg13-20020a05600c3c8d00b0040644e699a0sm13185234wmb.45.2023.11.06.10.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:51:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BB6806570A;
	Mon,  6 Nov 2023 18:51:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 03/22] target/arm: hide the 32bit version of PAR from gdbstub
Date: Mon,  6 Nov 2023 18:50:53 +0000
Message-Id: <20231106185112.2755262-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lqvRYg1LLwyi

This is a slightly hacky way to avoid duplicate PAR's in the system
register XML we send to gdb which causes an alias. However the other
alternative would be to post process ARMCPRegInfo once all registers
have been defined looking for textual duplicates. And that seems like
overkill.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231103195956.1998255-4-alex.bennee@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dc0d20a84..104f9378b4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3727,7 +3727,7 @@ static const ARMCPRegInfo vapa_cp_reginfo[] = {
       .access = PL1_RW, .resetvalue = 0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
                              offsetoflow32(CPUARMState, cp15.par_ns) },
-      .writefn = par_write },
+      .writefn = par_write, .type = ARM_CP_NO_GDB },
 #ifndef CONFIG_USER_ONLY
     /* This underdecoding is safe because the reginfo is NO_RAW. */
     { .name = "ATS", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = CP_ANY,
-- 
2.39.2
