Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h18sm259315wre.46.2021.11.19.08.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:37:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 57DF81FF96;
	Fri, 19 Nov 2021 16:37:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v4 0/3] GIC ITS tests
Date: Fri, 19 Nov 2021 16:37:07 +0000
Message-Id: <20211119163710.974653-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ew1KZUwoCWZG

Hi,

changes since v3:

  - dropped the pending LPI test altogether

Alex Bennée (3):
  arm64: remove invalid check from its-trigger test
  arm64: enable its-migration tests for TCG
  arch-run: do not process ERRATA when running under TCG

 scripts/arch-run.bash |  4 +++-
 arm/gic.c             | 28 ++++++++--------------------
 arm/unittests.cfg     |  3 ---
 3 files changed, 11 insertions(+), 24 deletions(-)

-- 
2.30.2
