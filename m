Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j40sm6114775wms.16.2021.11.12.03.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 03:47:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5F2261FF98;
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
Subject: [kvm-unit-tests PATCH v3 1/3] arm64: remove invalid check from its-trigger test
Date: Fri, 12 Nov 2021 11:47:32 +0000
Message-Id: <20211112114734.3058678-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211112114734.3058678-1-alex.bennee@linaro.org>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pJXsrWX+Tq/a

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
v3
  - reflow the comment, drop "willingly do not call" as per Eric's suggestion
---
 arm/gic.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 98135ef..1e3ea80 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -732,21 +732,17 @@ static void test_its_trigger(void)
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
 	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
 	stats_reset();
 	cpumask_clear(&mask);
 	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
-	stats_reset();
-	cpumask_clear(&mask);
 	cpumask_set_cpu(3, &mask);
 	its_send_invall(col3);
 	wait_for_interrupts(&mask);
-- 
2.30.2
