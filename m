Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d3sm16788921wrs.41.2021.05.25.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:42:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C4ADF1FF7E;
	Tue, 25 May 2021 18:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests RFC PATCH] arm64: split pmu tests into tcg/kvm variants
Date: Tue, 25 May 2021 18:42:21 +0100
Message-Id: <20210525174221.16987-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +g4d9wMo6vzf

QEMU is able to give a counter for instructions retired under TCG but
you need to enable -icount for it to work. Split the tests into
kvm/tcg variants to support this.

[AJB: I wonder if the solution is to have a totally separate
unittests.cfg for TCG mode here?]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 arm/unittests.cfg | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index adc1bbf..2c4cf41 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -66,24 +66,40 @@ file = pmu.flat
 groups = pmu
 extra_params = -append 'cycle-counter 0'
 
-[pmu-event-introspection]
+[pmu-event-introspection-kvm]
 file = pmu.flat
 groups = pmu
 arch = arm64
+accel = kvm
 extra_params = -append 'pmu-event-introspection'
 
+[pmu-event-introspection-tcg]
+file = pmu.flat
+groups = pmu
+arch = arm64
+accel = tcg
+extra_params = -append 'pmu-event-introspection' -icount shift=1
+
 [pmu-event-counter-config]
 file = pmu.flat
 groups = pmu
 arch = arm64
 extra_params = -append 'pmu-event-counter-config'
 
-[pmu-basic-event-count]
+[pmu-basic-event-count-kvm]
 file = pmu.flat
 groups = pmu
 arch = arm64
+accel = kvm
 extra_params = -append 'pmu-basic-event-count'
 
+[pmu-basic-event-count-tcg]
+file = pmu.flat
+groups = pmu
+arch = arm64
+accel = tcg
+extra_params = -append 'pmu-basic-event-count' -icount shift=1
+
 [pmu-mem-access]
 file = pmu.flat
 groups = pmu
-- 
2.20.1
