Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n19-20020a170906165300b006a625c583b9sm8137120ejd.155.2022.03.15.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EC4BE1FFB7;
	Tue, 15 Mar 2022 12:12:51 +0000 (GMT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.0 v1 0/8] misc testing, i386, docs, gitdm, gitlab
Date: Tue, 15 Mar 2022 12:12:43 +0000
Message-Id: <20220315121251.2280317-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ujSL+o4F/kvm

Hi,

As per usual here are the collection of random fixes and tweaks as we
go through the release process. Most of these patches have been posted
individually before although the semihosting and gitlab patches are
new.

The following need review:

 - gitlab: include new aarch32 job in custom-runners
 - semihosting: clean up handling of expanded argv
 - tests/avocado: update aarch64_virt test to exercise -cpu max
 
Alex Bennée (7):
  tests/avocado: update aarch64_virt test to exercise -cpu max
  target/i386: force maximum rounding precision for fildl[l]
  tests/tcg: drop -cpu max from s390x sha512-mvx invocation
  mailmap/gitdm: more fixes for bad tags and authors
  docs/devel: try and impose some organisation
  semihosting: clean up handling of expanded argv
  gitlab: include new aarch32 job in custom-runners

Thomas Huth (1):
  tests/Makefile.include: Let "make clean" remove the TCG tests, too

 docs/devel/index-api.rst            | 15 ++++++++++
 docs/devel/index-build.rst          | 19 ++++++++++++
 docs/devel/index-internals.rst      | 21 +++++++++++++
 docs/devel/index-process.rst        | 17 +++++++++++
 docs/devel/index-tcg.rst            | 16 ++++++++++
 docs/devel/index.rst                | 46 +++++------------------------
 semihosting/config.c                |  6 ++--
 target/i386/tcg/fpu_helper.c        | 13 ++++++++
 .gitlab-ci.d/custom-runners.yml     |  1 +
 .mailmap                            |  6 ++++
 contrib/gitdm/aliases               |  4 ++-
 tests/Makefile.include              |  2 +-
 tests/avocado/boot_linux_console.py | 22 +++++++++-----
 tests/tcg/s390x/Makefile.target     |  2 --
 14 files changed, 136 insertions(+), 54 deletions(-)
 create mode 100644 docs/devel/index-api.rst
 create mode 100644 docs/devel/index-build.rst
 create mode 100644 docs/devel/index-internals.rst
 create mode 100644 docs/devel/index-process.rst
 create mode 100644 docs/devel/index-tcg.rst

-- 
2.30.2
