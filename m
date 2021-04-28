Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l14sm7760562wrv.94.2021.04.28.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 03:18:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1B26B1FF7E;
	Wed, 28 Apr 2021 11:18:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v1 0/4] enable LPI and ITS for TCG
Date: Wed, 28 Apr 2021 11:18:40 +0100
Message-Id: <20210428101844.22656-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PkFSBSRySZTJ

This is a companion to Shashi's series enabling LPI and ITS features
for QEMU's TCG emulation. This is part of our push for a sbsa-ref
platform which needs a more modern set of features.

  From: Shashi Mallela <shashi.mallela@linaro.org>
  Subject: [PATCH v2 0/8] GICv3 LPI and ITS feature implementation
  Date: Wed, 31 Mar 2021 22:41:44 -0400
  Message-Id: <20210401024152.203896-1-shashi.mallela@linaro.org>

Most of the changes are minor except the its-trigger test which skips
invall handling checks which I think is relying on IMPDEF behaviour
which we can't probe for. There is also a hilarious work around to
some limitations in the run_migration() script in the last patch.

Alex Bennée (4):
  arm64: split its-trigger test into KVM and TCG variants
  scripts/arch-run: don't use deprecated server/nowait options
  arm64: enable its-migration tests for TCG
  arm64: split its-migrate-unmapped-collection into KVM and TCG variants

 scripts/arch-run.bash |  4 +--
 arm/gic.c             | 67 ++++++++++++++++++++++++++-----------------
 arm/unittests.cfg     | 23 ++++++++++++---
 3 files changed, 62 insertions(+), 32 deletions(-)

-- 
2.20.1
