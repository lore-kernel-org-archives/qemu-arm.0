Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h15sm5565709wml.9.2021.11.12.03.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 03:47:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4C9FC1FF96;
	Fri, 12 Nov 2021 11:47:34 +0000 (GMT)
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
Subject: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Date: Fri, 12 Nov 2021 11:47:31 +0000
Message-Id: <20211112114734.3058678-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dQ69Ii/SNSQR

Hi,

Sorry this has been sitting in my tree so long. The changes are fairly
minor from v2. I no longer split the tests up into TCG and KVM
versions and instead just ensure that ERRATA_FORCE is always set when
run under TCG.

Alex Bennée (3):
  arm64: remove invalid check from its-trigger test
  arm64: enable its-migration tests for TCG
  arch-run: do not process ERRATA when running under TCG

 scripts/arch-run.bash |  4 +++-
 arm/gic.c             | 16 ++++++----------
 arm/unittests.cfg     |  3 ---
 3 files changed, 9 insertions(+), 14 deletions(-)

-- 
2.30.2
