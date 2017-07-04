Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u187sm3301025wmd.26.2017.07.04.07.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:09 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C1A583E0C85;
	Tue,  4 Jul 2017 15:49:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 00/11] Misc fixes, documentation and patterns
Date: Tue,  4 Jul 2017 15:48:48 +0100
Message-Id: <20170704144859.17644-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DxI7XFjQZf6+

Hi Peter,

A bit of a mixed set of patches here for you to pick from as you
will. The first 2 are additional tracing fixes including a fix for
segfaulting when generating a trace.

The next two are documentation patches as requested.

Then two minor tweaks, one to risu.el and a indent failure of risugen.

While I've been working through the half-precision stuff I've been
finding the --pattern approach a bit inflexible as you basically end
up eyeballing the risu file to build up the regexs. I've added a
little syntactic suger to the risu file to enable grouping. This makes
slicing a subset a lot easier, e.g.:

  ./risugen --group AdvSIMDAcrossVector --not-pattern ".*_RES" aarch64.risu

You can specify multiple groups in the risu file as the matching is
string based, e.g.:

  @Integer,Logic,Immediate

And then:

  ./risugen --group Logic aarch64.risu foo.bin

What do you think?

Alex Bennée (11):
  risu: make match status take tracing into account
  reginfo.c: always return 1 on OP_TESTEND
  README: document --static builds
  README: document record/replay support
  risu.el: derive from text-mode
  risugen: fix bad indent
  risugen: support @GroupName in risu files
  aarch64.risu: document naming conventions
  aarch64.risu: remove duplicate AdvSIMD Scalar 3 same block
  aarch64.risu: remove duplicate AdvSIMD scalar 2 reg misc block
  aarch64.risu: update AdvancedSIMD across lanes

 README         |  40 ++++++++--
 aarch64.risu   | 241 ++++++++++++++++++++++++---------------------------------
 reginfo.c      |  19 +++--
 risu.c         |   4 +-
 risu.el        |   2 +-
 risu.h         |   2 +-
 risugen        |  17 +++-
 risugen_arm.pm |   7 ++
 8 files changed, 175 insertions(+), 157 deletions(-)

-- 
2.13.0
