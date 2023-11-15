Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c028600b003feea62440bsm826359wmk.43.2023.11.15.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:55:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 37AE35F7B5;
	Wed, 15 Nov 2023 20:55:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 05/10] tests/tcg: fixup Aarch64 semiconsole test
Date: Wed, 15 Nov 2023 20:55:37 +0000
Message-Id: <20231115205542.3092038-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115205542.3092038-1-alex.bennee@linaro.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zSekGMPMgjX0

We need to ensure we squash the serial port if we want to hand craft
our muxed input. As a bonus emit the example with a V=1 build to make
it easier for people to figure out.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
