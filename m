Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g5sm7632844wrq.30.2021.04.28.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 03:18:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 410151FF8F;
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
Subject: [kvm-unit-tests PATCH v1 3/4] arm64: enable its-migration tests for TCG
Date: Wed, 28 Apr 2021 11:18:43 +0100
Message-Id: <20210428101844.22656-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428101844.22656-1-alex.bennee@linaro.org>
References: <20210428101844.22656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bIr3nvCw8EeS

With the support for TCG emulated GIC we can also test these now. You
need to call run_tests.sh with -a to trigger the
its-migrate-unmapped-collection test which obviously doesn't need the
KVM errata to run in TCG system emulation mode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 arm/unittests.cfg | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index c72dc34..d4dbc8b 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -203,7 +203,6 @@ arch = arm64
 [its-migration]
 file = gic.flat
 smp = $MAX_SMP
-accel = kvm
 extra_params = -machine gic-version=3 -append 'its-migration'
 groups = its migration
 arch = arm64
@@ -211,7 +210,6 @@ arch = arm64
 [its-pending-migration]
 file = gic.flat
 smp = $MAX_SMP
-accel = kvm
 extra_params = -machine gic-version=3 -append 'its-pending-migration'
 groups = its migration
 arch = arm64
@@ -219,7 +217,6 @@ arch = arm64
 [its-migrate-unmapped-collection]
 file = gic.flat
 smp = $MAX_SMP
-accel = kvm
 extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
 groups = its migration
 arch = arm64
-- 
2.20.1
