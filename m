Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z9sm11615062wmi.17.2021.05.25.10.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:26:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9809D1FF8F;
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
Subject: [kvm-unit-tests PATCH v2 3/4] arm64: enable its-migration tests for TCG
Date: Tue, 25 May 2021 18:26:27 +0100
Message-Id: <20210525172628.2088-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525172628.2088-1-alex.bennee@linaro.org>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s/2dSTuOl7+0

With the support for TCG emulated GIC we can also test these now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
---
 arm/unittests.cfg | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index f776b66..1a39428 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -194,7 +194,6 @@ arch = arm64
 [its-migration]
 file = gic.flat
 smp = $MAX_SMP
-accel = kvm
 extra_params = -machine gic-version=3 -append 'its-migration'
 groups = its migration
 arch = arm64
@@ -202,7 +201,6 @@ arch = arm64
 [its-pending-migration]
 file = gic.flat
 smp = $MAX_SMP
-accel = kvm
 extra_params = -machine gic-version=3 -append 'its-pending-migration'
 groups = its migration
 arch = arm64
-- 
2.20.1
