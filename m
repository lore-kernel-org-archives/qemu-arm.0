Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id gv9-20020a170906f10900b006d7128b2e6fsm8061677ejb.162.2022.03.15.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4A01D1FFBC;
	Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH  v1 4/8] tests/tcg: drop -cpu max from s390x sha512-mvx invocation
Date: Tue, 15 Mar 2022 12:12:47 +0000
Message-Id: <20220315121251.2280317-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mYA7iqzZ19dW

With -cpu max we get a warning:

  qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.

But dropping the -cpu max and it still runs fine.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 257c568c58..7aa502a557 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
 sha512-mvx: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
-run-sha512-mvx: QEMU_OPTS+=-cpu max
-
 TESTS+=sha512-mvx
-- 
2.30.2
