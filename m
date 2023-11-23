Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b0040b38082b99sm1009113wmq.1.2023.11.23.07.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 07:56:24 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 49A55645FB;
	Thu, 23 Nov 2023 15:56:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 06/14] tests/tcg: fixup Aarch64 semiconsole test
Date: Thu, 23 Nov 2023 15:56:12 +0000
Message-Id: <20231123155620.3042891-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123155620.3042891-1-alex.bennee@linaro.org>
References: <20231123155620.3042891-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8t94X4oGJavU

We need to ensure we squash the serial port if we want to hand craft
our muxed input. As a bonus emit the example with a V=1 build to make
it easier for people to figure out.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231120150833.2552739-7-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index b74a2534e3..77c5018e02 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -48,10 +48,11 @@ QEMU_BASE_MACHINE=-M virt -cpu max -display none
 QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
 
 # console test is manual only
-QEMU_SEMIHOST=-chardev stdio,mux=on,id=stdio0 -semihosting-config enable=on,chardev=stdio0 -mon chardev=stdio0,mode=readline
-run-semiconsole: QEMU_OPTS=$(QEMU_BASE_MACHINE) $(QEMU_SEMIHOST)  -kernel
+QEMU_SEMIHOST=-serial none -chardev stdio,mux=on,id=stdio0 -semihosting-config enable=on,chardev=stdio0 -mon chardev=stdio0,mode=readline
+run-semiconsole: QEMU_OPTS=$(QEMU_BASE_MACHINE) $(QEMU_SEMIHOST) -kernel
 run-semiconsole: semiconsole
 	$(call skip-test, $<, "MANUAL ONLY")
+	$(if $(V),@printf "  %-7s %s %s\n" "TO RUN" $(notdir $(QEMU)) "$(QEMU_OPTS) $<")
 run-plugin-semiconsole-with-%: semiconsole
 	$(call skip-test, $<, "MANUAL ONLY")
 
-- 
2.39.2
