Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k4-v6sm5074519wrl.12.2018.08.08.05.39.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Aug 2018 05:39:34 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 520463E060C;
	Wed,  8 Aug 2018 13:39:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  0/4] add hand-rolled fallback when capstone fails
Date: Wed,  8 Aug 2018 13:39:30 +0100
Message-Id: <20180808123934.17450-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Knvf7JJ9VFL/

Hi,

While capstone is actively maintained it hasn't managed to keep up to
date with newer instructions as they have been added. While these
should eventually be supported we need something in the meantime.

This proof-of-concept series takes advantage of the fact we already
have a parser for SVE instructions. By tweaking the output of
decodetree.py a little we can generate something we can plug into the
assembly dump when capstone fails. Currently it is just the
instruction name (as encoded in sve.decode) but extending it to
include the parameters shouldn't be too hard.

The plumbing into disas is a little ugly and perhaps that can be
solved later with some re-factoring.

So what do you think? Worth pursing or adding to the pile of cute but
not ultimately mergable hacks?

Alex Bennée (4):
  scripts/decodetree.py: add a disassembly generator (HACK!)
  target/arm: move decoder helpers into header
  target/arm: add a fallback disassemble function
  disas: allow capstone to defer to a fallback function on failure

 disas.c                    | 30 +++++++++++++++++++++-
 include/disas/bfd.h        | 11 +++++++-
 scripts/decodetree.py      | 52 +++++++++++++++++++++++++++++++++-----
 target/arm/Makefile.objs   |  8 ++++++
 target/arm/cpu.c           |  4 +++
 target/arm/decoder.h       | 50 ++++++++++++++++++++++++++++++++++++
 target/arm/disassemble.c   | 22 ++++++++++++++++
 target/arm/internals.h     |  2 ++
 target/arm/translate-sve.c | 50 +-----------------------------------
 9 files changed, 172 insertions(+), 57 deletions(-)
 create mode 100644 target/arm/decoder.h
 create mode 100644 target/arm/disassemble.c

-- 
2.17.1
