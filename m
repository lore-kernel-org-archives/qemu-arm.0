Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j189sm8758466wmb.48.2019.07.05.09.04.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:04:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A10841FF8F;
	Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jan Bobek <jan.bobek@gmail.com>
Subject: [PATCH  v1 2/5] tests/tcg: fix up test-i386-fprem.ref generation
Date: Fri,  5 Jul 2019 17:04:18 +0100
Message-Id: <20190705160421.19015-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SlgdOtVn4+Nj

We never shipped the reference data in the source tree because it was
quite big (64M). As a result the only option is to generate it
locally. Although we have a rule to generate the reference file we
missed the dependency and location changes, probably because it is
only run for SLOW test runs.

The test still fails with mostly incorrect flags and different than
expected NaNs. I'll leave that for the x86 experts to look at.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Jan Bobek <jan.bobek@gmail.com>
---
 tests/tcg/i386/Makefile.target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index b4033ba3d1..d0eb7023e5 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -35,9 +35,9 @@ test-i386-fprem.ref: test-i386-fprem
 	$(call quiet-command, ./$< > $@,"GENREF","generating $@")
 
 run-test-i386-fprem: TIMEOUT=60
-run-test-i386-fprem: test-i386-fprem
+run-test-i386-fprem: test-i386-fprem test-i386-fprem.ref
 	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
-	$(call diff-out,test-i386-fprem, $(I386_SRC)/$<.ref)
+	$(call diff-out,test-i386-fprem, test-i386-fprem.ref)
 else
 run-test-i386-fprem: test-i386-fprem
 	$(call skip-test, $<, "SLOW")
-- 
2.20.1
