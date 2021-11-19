Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a141sm12027233wme.37.2021.11.19.08.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:37:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 704E91FF99;
	Fri, 19 Nov 2021 16:37:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [kvm-unit-tests PATCH v4 2/3] arm64: enable its-migration tests for TCG
Date: Fri, 19 Nov 2021 16:37:09 +0000
Message-Id: <20211119163710.974653-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119163710.974653-1-alex.bennee@linaro.org>
References: <20211119163710.974653-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sb/2t9x1Q+rH

With the support for TCG emulated GIC we can also test these now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Message-Id: <20210525172628.2088-4-alex.bennee@linaro.org>

---
v3
  - add its-migrate-unmapped-collection
---
 arm/unittests.cfg | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index f776b66..21474b8 100644
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
@@ -210,7 +208,6 @@ arch = arm64
 [its-migrate-unmapped-collection]
 file = gic.flat
 smp = $MAX_SMP
-accel = kvm
 extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
 groups = its migration
 arch = arm64
-- 
2.30.2
