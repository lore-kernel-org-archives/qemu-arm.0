Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n32sm16627337wms.1.2021.11.19.08.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:37:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 648011FF98;
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
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [kvm-unit-tests PATCH v4 1/3] arm64: remove invalid check from its-trigger test
Date: Fri, 19 Nov 2021 16:37:08 +0000
Message-Id: <20211119163710.974653-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119163710.974653-1-alex.bennee@linaro.org>
References: <20211119163710.974653-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YAnV6OvyQAQK

While an IRQ is not "guaranteed to be visible until an appropriate
invalidation" it doesn't stop the actual implementation delivering it
earlier if it wants to. This is the case for QEMU's TCG and as tests
should only be checking architectural compliance this check is
invalid.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Message-Id: <20210525172628.2088-2-alex.bennee@linaro.org>

---
v4
  - drop the pending test altogether
v3
  - reflow the comment, drop "willingly do not call" as per Eric's suggestion
---
 arm/gic.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 98135ef..1b9ad06 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -732,34 +732,22 @@ static void test_its_trigger(void)
 			"dev2/eventid=20 does not trigger any LPI");
 
 	/*
-	 * re-enable the LPI but willingly do not call invall
-	 * so the change in config is not taken into account.
-	 * The LPI should not hit
+	 * re-enable the LPI. While "A change to the LPI configuration
+	 * is not guaranteed to be visible until an appropriate
+	 * invalidation operation has completed" hardware that doesn't
+	 * implement caches may have delivered the event at any point
+	 * after the enabling. Check the LPI has hit by the time the
+	 * invall is done.
 	 */
-	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
-	stats_reset();
-	cpumask_clear(&mask);
-	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
 	stats_reset();
-	cpumask_clear(&mask);
-	cpumask_set_cpu(3, &mask);
+	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
 	its_send_invall(col3);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=20 pending LPI is received");
-
-	stats_reset();
 	cpumask_clear(&mask);
 	cpumask_set_cpu(3, &mask);
 	its_send_int(dev2, 20);
 	wait_for_interrupts(&mask);
 	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=20 now triggers an LPI");
+			"dev2/eventid=20 triggers an LPI");
 
 	report_prefix_pop();
 
-- 
2.30.2
