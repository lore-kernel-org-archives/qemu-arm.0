Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c37sm4945731wra.73.2017.10.31.07.54.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Oct 2017 07:54:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 9F0573E02F2;
	Tue, 31 Oct 2017 14:54:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 0/7] Add @Group support and some aarch64.risu cleanups
Date: Tue, 31 Oct 2017 14:54:37 +0000
Message-Id: <20171031145444.13766-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kFUaH9muWubn

Hi Peter,

My RISU patch queue was running a little long so I thought I should
push up stuff that was ready. The first few patches are simply
clean-ups to the aarch64.risu file, mostly removing duplicate blocks
that have crept in.

There is a prerequisite clean-up patch which moves the filtering into
the common risugen code and passes an array of keys to the backend.

Then I add support for @GroupName annotations which allow for a nicer
selection of groups of instructions. This works across all
architectures now.

Finally a big (but mechanical) update of the aarch64.risu file. I've
aligned the names of the major groups to what the ASL/ARM ARM uses and
added some example @Groups for the gross sections. I expect to add
more fine-grained groups later as we add the new half-precision and
SVE instructions.

Alex Bennée (7):
  aarch64.risu: document naming conventions
  aarch64.risu: remove duplicate AdvSIMD Scalar 3 same block
  aarch64.risu: remove duplicate AdvSIMD scalar 2 reg misc block
  aarch64.risu: update AdvancedSIMD across lanes
  risugen/risugen_$arch: factor out instruction selection
  risugen: support @GroupName in risu files
  aarch64.risu: clean-up and annotate with groups

 README           |  10 ++
 aarch64.risu     | 423 +++++++++++++++++++++++++++++--------------------------
 risugen          |  49 ++++++-
 risugen_arm.pm   |  18 +--
 risugen_m68k.pm  |  18 +--
 risugen_ppc64.pm |  18 +--
 6 files changed, 285 insertions(+), 251 deletions(-)

-- 
2.14.2
