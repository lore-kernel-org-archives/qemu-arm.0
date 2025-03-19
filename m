Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fcdsm26234845e9.7.2025.03.19.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 356E55F93F;
	Wed, 19 Mar 2025 18:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
Date: Wed, 19 Mar 2025 18:22:45 +0000
Message-Id: <20250319182255.3096731-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Qkko42mzXQB8

The aim of this work is to get rid of the endian aware helpers in
gdbstub/helpers.h which due to their use of tswap() mean target
gdbstubs need to be built multiple times. While this series doesn't
actually build each stub once it introduces a new helper -
gdb_get_register_value() which takes a MemOp which can describe the
current endian state of the system. This will be a lot easier to
dynamically feed from a helper function.

The most complex example is PPC which has a helper called
ppc_maybe_bswap_register() which was doing this.

This is still an RFC so I'm interested in feedback:

  - is the API sane
  - can we avoid lots of (uint8_t *) casting?
  - should we have a reverse helper for setting registers

If this seems like the right approach I can have a go at more of the
frontends later.

There are a few other misc clean-ups I did on the way which might be
worth cherry picking for 10.0 but I'll leave that up to maintainers.

Alex.

Alex Bennée (10):
  include/gdbstub: fix include guard in commands.h
  gdbstub: introduce target independent gdb register helper
  target/arm: convert 32 bit gdbstub to new helper
  target/arm: convert 64 bit gdbstub to new helper
  target/ppc: expand comment on FP/VMX/VSX access functions
  target/ppc: make ppc_maybe_bswap_register static
  target/ppc: convert gdbstub to new helper (!hacky)
  gdbstub: assert earlier in handle_read_all_regs
  include/exec: fix assert in size_memop
  target/microblaze: convert gdbstub to new helper

 include/exec/memop.h        |   4 +-
 include/gdbstub/commands.h  |   2 +-
 include/gdbstub/registers.h |  30 ++++++
 target/ppc/cpu.h            |   8 +-
 gdbstub/gdbstub.c           |  24 ++++-
 target/arm/gdbstub.c        |  57 +++++++----
 target/arm/gdbstub64.c      |  53 ++++++----
 target/microblaze/gdbstub.c |  44 ++++----
 target/ppc/gdbstub.c        | 194 ++++++++++++++++++++----------------
 9 files changed, 257 insertions(+), 159 deletions(-)
 create mode 100644 include/gdbstub/registers.h

-- 
2.39.5
