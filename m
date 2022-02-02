Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y6sm12065715wrl.46.2022.02.02.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:12:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C22851FFB7;
	Wed,  2 Feb 2022 19:12:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  0/4] improve coverage of vector backend
Date: Wed,  2 Feb 2022 19:12:38 +0000
Message-Id: <20220202191242.652607-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /Yd1uSRAvBE4

Hi Richard,

While reviewing the TCG vector clean-ups I tried to improve the
range of instructions we tested. I couldn't get the existing hacky
sha1 test to vectorise nicely so I snarfed the sha512 algorithm from
CCAN. The sha512 test is good because it is all purely integer so we
should be able to use native code on the backend. The test also has
the nice property of validating behaviour.

I did toy with the idea of incorporating CCAN as a submodule because
there is quite a lot of nice stuff in there we could use for further
tests. However for now witness the glory of a cut and paste job.

What do you think?


Alex Bennée (4):
  tests/tcg: cleanup sha1 source code
  tests/tcg: build sha1-vector for SVE and compare
  tests/tcg: add sha512 test
  tests/tcg: add vectorised sha512 versions

 tests/tcg/multiarch/sha1.c        |  67 +-
 tests/tcg/multiarch/sha512.c      | 990 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  23 +
 tests/tcg/i386/Makefile.target    |   6 +
 tests/tcg/ppc64le/Makefile.target |   5 +-
 tests/tcg/s390x/Makefile.target   |   9 +
 tests/tcg/x86_64/Makefile.target  |   7 +
 7 files changed, 1056 insertions(+), 51 deletions(-)
 create mode 100644 tests/tcg/multiarch/sha512.c

-- 
2.30.2
