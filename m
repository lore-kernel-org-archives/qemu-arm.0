Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o21sm11663983wmr.44.2021.05.25.10.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:26:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 71D031FF7E;
	Tue, 25 May 2021 18:26:28 +0100 (BST)
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
Subject: [kvm-unit-tests PATCH v2 0/4] enable LPI and ITS for TCG
Date: Tue, 25 May 2021 18:26:24 +0100
Message-Id: <20210525172628.2088-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6Sovo1BT+KF8

This is a companion to Shashi's series enabling LPI and ITS features
for QEMU's TCG emulation. This is part of our push for a sbsa-ref
platform which needs a more modern set of features. Since the last
posting this is now at v3:

  From: Shashi Mallela <shashi.mallela@linaro.org>
  Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
  Date: Thu, 29 Apr 2021 19:41:53 -0400
  Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>

The only real change from the last version was to drop the IMPDEF
behaviour check instead of trying to work around it for the TCG case.

Please review.

Alex Bennée (4):
  arm64: remove invalid check from its-trigger test
  scripts/arch-run: don't use deprecated server/nowait options
  arm64: enable its-migration tests for TCG
  arm64: split its-migrate-unmapped-collection into KVM and TCG variants

 scripts/arch-run.bash |  4 ++--
 arm/gic.c             | 22 +++++++++++++---------
 arm/unittests.cfg     | 12 +++++++++---
 3 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.20.1
