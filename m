Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614f3d3f1sm5874972a12.94.2024.07.02.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:35:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B60F55F8D1;
	Tue,  2 Jul 2024 17:35:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com,
	drjones@redhat.com,
	thuth@redhat.com
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	kvmarm@lists.linux.dev (open list:ARM)
Subject: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU introspection test if missing
Date: Tue,  2 Jul 2024 17:35:14 +0100
Message-Id: <20240702163515.1964784-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240702163515.1964784-1-alex.bennee@linaro.org>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VsibA7CwUTQ4

The test for number of events is not a substitute for properly
checking the feature register. Fix the define and skip if PMUv3 is not
available on the system. This includes emulator such as QEMU which
don't implement PMU counters as a matter of policy.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 arm/pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index 9ff7a301..66163a40 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_at_64bits) {}
 #define ID_AA64DFR0_PERFMON_MASK  0xf
 
 #define ID_DFR0_PMU_NOTIMPL	0b0000
-#define ID_DFR0_PMU_V3		0b0001
+#define ID_DFR0_PMU_V3		0b0011
 #define ID_DFR0_PMU_V3_8_1	0b0100
 #define ID_DFR0_PMU_V3_8_4	0b0101
 #define ID_DFR0_PMU_V3_8_5	0b0110
@@ -286,6 +286,11 @@ static void test_event_introspection(void)
 		return;
 	}
 
+	if (pmu.version < ID_DFR0_PMU_V3) {
+		report_skip("PMUv3 extensions not supported, skip ...");
+		return;
+	}
+
 	/* PMUv3 requires an implementation includes some common events */
 	required_events = is_event_supported(SW_INCR, true) &&
 			  is_event_supported(CPU_CYCLES, true) &&
-- 
2.39.2
