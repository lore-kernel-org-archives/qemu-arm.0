Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdfcc7sm654291866b.146.2025.03.24.03.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 95AEB5F8B9;
	Mon, 24 Mar 2025 10:21:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 00/11] gdbstub: conversion to runtime endianess helpers
Date: Mon, 24 Mar 2025 10:21:31 +0000
Message-Id: <20250324102142.67022-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: zZwj0T2k2B3j

The aim of this work is to get rid of the endian aware helpers in
gdbstub/helpers.h which due to their use of tswap() mean target
gdbstubs need to be built multiple times. While this series doesn't
actually build each stub once it introduces a new helper -
gdb_get_register_value() which takes a MemOp which can describe the
current endian state of the system. This will be a lot easier to
dynamically feed from a helper function.

The most complex example is PPC which has a helper called
ppc_maybe_bswap_register() which was doing this.

This is still an RFC but I've spun out v2 for further discussion.

In v2:

  - drop uint8_t casting and use void as C intended ;-)
  - add specific 32/64 bit helpers with type checking an assertion
  - various tweaks and fixes (see individual commits)

There are a few other misc clean-ups I did on the way which might be
worth cherry picking for 10.0 but I'll leave that up to maintainers.

Alex Bennée (11):
  include/exec: fix assert in size_memop
  include/gdbstub: fix include guard in commands.h
  gdbstub: assert earlier in handle_read_all_regs
  gdbstub: introduce target independent gdb register helper
  target/arm: convert 32 bit gdbstub to new helpers
  target/arm: convert 64 bit gdbstub to new helpers
  target/ppc: expand comment on FP/VMX/VSX access functions
  target/ppc: make ppc_maybe_bswap_register static
  target/ppc: convert gdbstub to new helpers
  target/microblaze: convert gdbstub to new helper
  include/gdbstub: add note to helpers.h

 include/exec/memop.h        |   4 +-
 include/gdbstub/commands.h  |   2 +-
 include/gdbstub/helpers.h   |   4 +-
 include/gdbstub/registers.h |  55 ++++++++++
 target/ppc/cpu.h            |   8 +-
 gdbstub/gdbstub.c           |  25 ++++-
 target/arm/gdbstub.c        |  55 ++++++----
 target/arm/gdbstub64.c      |  53 ++++++----
 target/microblaze/gdbstub.c |  49 ++++-----
 target/ppc/gdbstub.c        | 197 ++++++++++++++++++++----------------
 10 files changed, 292 insertions(+), 160 deletions(-)
 create mode 100644 include/gdbstub/registers.h

-- 
2.39.5
