Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g26-20020a7bc4da000000b003fee8502999sm2503436wmk.18.2023.08.30.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 07:54:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EA9CC1FFBE;
	Wed, 30 Aug 2023 15:54:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 03/12] tests/tcg: remove quoting for info output
Date: Wed, 30 Aug 2023 15:53:58 +0100
Message-Id: <20230830145407.3064249-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830145407.3064249-1-alex.bennee@linaro.org>
References: <20230830145407.3064249-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7dTO/r2wupj+

This avoids ugly multi-line wrapping for the test on non V=1 builds.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230829161528.2707696-4-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 681dfa077c..b77bbd9b3c 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -14,7 +14,7 @@ AARCH64_TESTS=fcvt pcalign-a64 lse2-fault
 fcvt: LDFLAGS+=-lm
 
 run-fcvt: fcvt
-	$(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
+	$(call run-test,$<,$(QEMU) $<)
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
 config-cc.mak: Makefile
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 7ba9053375..a051d689d7 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -37,10 +37,10 @@ run-gdbstub-untimely-packet: hello
 		--qemu $(QEMU) \
 		--bin $< --qargs \
 		"-monitor none -display none -chardev file$(COMMA)path=untimely-packet.out$(COMMA)id=output $(QEMU_OPTS)", \
-	"softmmu gdbstub untimely packets")
+	softmmu gdbstub untimely packets)
 	$(call quiet-command, \
 		(! grep -Fq 'Packet instead of Ack, ignoring it' untimely-packet.gdb.err), \
-		"GREP", "file  untimely-packet.gdb.err")
+		"GREP", file untimely-packet.gdb.err)
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "no guest arch support")
-- 
2.39.2
