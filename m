Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 42sm2956220wrx.92.2018.02.23.07.46.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:46:14 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id F3B723E0085;
	Fri, 23 Feb 2018 15:46:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH REPOST v1 0/8] Group support and random clean-ups
Date: Fri, 23 Feb 2018 15:46:05 +0000
Message-Id: <20180223154613.2096-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bRbrdrbDU66O

Hi,

This is essentially a re-post but with a wider distribution. There is
one extra patch which adds the FP16 1 source data processing. This is for
discussion on how best to represent all the different architectural
versions by using the second field in the aarch64.risu file.

Alex Bennée (8):
  risugen: support @GroupName in risu files
  aarch64.risu: clean-up and annotate with groups
  aarch64.risu: add cryptographic extensions for v8.2
  new contrib/generate_all.sh: batch risugen script
  contrib/run_risu.sh: allow appending of QEMU_FLAGS
  contrib/run_risu.sh: don't set -e
  contrib/run_risu.sh: add a visual cue for a clean-run
  aarch64.risu: update Floating-point data-processing (1 source)

 README                  |  10 ++
 aarch64.risu            | 287 +++++++++++++++++++++++++++++++++---------------
 contrib/generate_all.sh |  96 ++++++++++++++++
 contrib/run_risu.sh     |  10 +-
 risugen                 |  24 +++-
 5 files changed, 335 insertions(+), 92 deletions(-)
 create mode 100755 contrib/generate_all.sh

-- 
2.15.1
