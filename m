Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o130sm1684973wmo.43.2019.05.09.09.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 09:59:14 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5DD361FF91;
	Thu,  9 May 2019 17:59:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH  v1 04/23] tests/tcg/multiarch: add hello world system test
Date: Thu,  9 May 2019 17:58:52 +0100
Message-Id: <20190509165912.10512-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aMuuAq05A3oh

This is not really i386 only, we can have the same test for all
architectures supporting system tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/Makefile.softmmu-target       | 2 +-
 tests/tcg/{i386 => multiarch}/system/hello.c | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/tcg/{i386 => multiarch}/system/hello.c (100%)

diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 53c9c5ece06..c31bbbf39a7 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -27,7 +27,7 @@ CFLAGS+=-m32
 LINK_SCRIPT=$(I386_SYSTEM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,-melf_i386
 # FIXME: move to common once x86_64 is bootstrapped
-TESTS+=$(X86_TESTS)
+TESTS+=$(X86_TESTS) $(MULTIARCH_TESTS)
 endif
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
diff --git a/tests/tcg/i386/system/hello.c b/tests/tcg/multiarch/system/hello.c
similarity index 100%
rename from tests/tcg/i386/system/hello.c
rename to tests/tcg/multiarch/system/hello.c
-- 
2.20.1
