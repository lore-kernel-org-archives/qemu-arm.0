Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp316249lfi;
        Fri, 3 Apr 2020 00:14:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypI2wEBGnJEe79+hG32P+FxI+VUIiS2HhDEp88yYp2So57NDT7+I6STDTsOQhS2Cjph586I8
X-Received: by 2002:a37:4648:: with SMTP id t69mr6987833qka.299.1585898055432;
        Fri, 03 Apr 2020 00:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585898055; cv=none;
        d=google.com; s=arc-20160816;
        b=OYrTv48v4baeD8GDEPaDXY7Z9grhhMzwg4aO+yJhmOSaoLSnGxw9QnmhhRAgPm+w4v
         /sSkB8zT4UtjoELQhD4wKBC0klf7bPHmg76DUEq98qPqb40/+boKNgBxi2lIccgRYzXe
         Gtu70vaGR0DkzRjnbLML+vQ723JtBE8bHdK+Rp54zEqqFUzFU6b8rvoeatx2j2ZnS1qg
         vJV7u3DhsN+EmzMLFHps6UHRvBDkQ+xWhc0P96SRUMYKOM7pZdJU4LTW7T27P4xz4VHz
         Ak+AASCHcQhz9haTgx0J8lMvOzOFgiBDFWhk//Mk9Ze5otOG+QKJVGGCoA3+9ha9NVdq
         tXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8+9CuCdXtgGWiHSnV5DHlOWg7DCSNPXDNoSdXF6kKQI=;
        b=Jk/+UUtkQlaqr8eKmW586o1xl/utIgFt8DVB5nH017M4ZCwPKFwBGwjboCGYl2ye9L
         9dbQyZRj3WaNGCoWuI6gBEvij+QMD+cgsTLtH/C+VQQBw/cA3+AfS96O0G6n6nn/d4cz
         4W6kzfItiRKGe/QmPubbGpjDvjyd5/S0NIWT336Pkg2XAFek0bkR0CE92eAqYUWVO3uf
         jqsxCx/LsoaEuIs0UCdnrcO5KcvqY9hVI92XEA7Wuwnrach07+mvkzsONfvBgqKdehIV
         Ws8v5OfisOyeTeWBtdf8p/uEpNSp6tfX94KFLOg4qcmvLqNRxahUkVuXeShWBnGxO8PZ
         c+tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=YRDPYOGK;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m47si4803415qta.19.2020.04.03.00.14.15;
        Fri, 03 Apr 2020 00:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=YRDPYOGK;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2350D4B181;
	Fri,  3 Apr 2020 03:14:15 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLFc4BQdRB6W; Fri,  3 Apr 2020 03:14:14 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 03C724B188;
	Fri,  3 Apr 2020 03:14:14 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 188E74B181
 for <kvmarm@lists.cs.columbia.edu>; Fri,  3 Apr 2020 03:14:13 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtP0RWLmMCWX for <kvmarm@lists.cs.columbia.edu>;
 Fri,  3 Apr 2020 03:14:12 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 218344B18F
 for <kvmarm@lists.cs.columbia.edu>; Fri,  3 Apr 2020 03:14:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585898052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OI1YdSQwikzDc085EaC9McOghPW3ztxWZW1WYLNUFc=;
 b=YRDPYOGKiE3uP1RpAoVGR8Tkx0pD01CoMYj2qD8dbJlwZfREYM9JCmNOdT0iGPmq4Qow4f
 48uk1ySUciUkBPTsvl9/CWUPaEYYPIo8Am1yQnUdkR4ivDIPW1jCk0+VxiN9BQ988O3X3c
 se+NLCOSlN2xMtlJ+3juKeIwjhE5zEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-mZOvCsZePEanI3HYWynJGA-1; Fri, 03 Apr 2020 03:14:10 -0400
X-MC-Unique: mZOvCsZePEanI3HYWynJGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD649149C2;
 Fri,  3 Apr 2020 07:14:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2A925C1C6;
 Fri,  3 Apr 2020 07:14:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v4 09/12] arm: pmu: Test chained counters
Date: Fri,  3 Apr 2020 09:13:23 +0200
Message-Id: <20200403071326.29932-10-eric.auger@redhat.com>
In-Reply-To: <20200403071326.29932-1-eric.auger@redhat.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: andrew.murray@arm.com, andre.przywara@arm.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Ev6tibrBSNNe

Add 2 tests exercising chained counters. The first one uses
CPU_CYCLES and the second one uses SW_INCR.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- each report_info has a different message

v2 -> v3:
- added prefix pop
- added pmu prefix to the test names
- defines, event array ...
---
 arm/pmu.c         | 98 ++++++++++++++++++++++++++++++++++++++++++++++-
 arm/unittests.cfg | 12 ++++++
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index c954c71..be249cc 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -47,6 +47,7 @@
 #define INST_PREC		0x1B
 #define STALL_FRONTEND		0x23
 #define STALL_BACKEND		0x24
+#define CHAIN			0x1E
 
 #define COMMON_EVENTS_LOW	0x0
 #define COMMON_EVENTS_HIGH	0x3F
@@ -141,6 +142,8 @@ static void test_event_counter_config(void) {}
 static void test_basic_event_count(void) {}
 static void test_mem_access(void) {}
 static void test_sw_incr(void) {}
+static void test_chained_counters(void) {}
+static void test_chained_sw_incr(void) {}
 
 #elif defined(__aarch64__)
 #define ID_AA64DFR0_PERFMON_SHIFT 8
@@ -504,7 +507,92 @@ static void test_sw_incr(void)
 	report_info("counter values after 100 SW_INCR #0=%ld #1=%ld",
 		    read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1));
 	report(read_sysreg(pmovsclr_el0) == 0x1,
-		"overflow reg after 100 SW_INCR");
+		"overflow on counter #0 after 100 SW_INCR");
+}
+
+static void test_chained_counters(void)
+{
+	uint32_t events[] = {CPU_CYCLES, CHAIN};
+
+	if (!satisfy_prerequisites(events, ARRAY_SIZE(events)))
+		return;
+
+	pmu_reset();
+
+	write_regn_el0(pmevtyper, 0, CPU_CYCLES | PMEVTYPER_EXCLUDE_EL0);
+	write_regn_el0(pmevtyper, 1, CHAIN | PMEVTYPER_EXCLUDE_EL0);
+	/* enable counters #0 and #1 */
+	write_sysreg_s(0x3, PMCNTENSET_EL0);
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+
+	precise_instrs_loop(22, pmu.pmcr_ro | PMU_PMCR_E);
+
+	report(read_regn_el0(pmevcntr, 1) == 1, "CHAIN counter #1 incremented");
+	report(!read_sysreg(pmovsclr_el0), "no overflow recorded for chained incr #1");
+
+	/* test 64b overflow */
+
+	pmu_reset();
+	write_sysreg_s(0x3, PMCNTENSET_EL0);
+
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+	write_regn_el0(pmevcntr, 1, 0x1);
+	precise_instrs_loop(22, pmu.pmcr_ro | PMU_PMCR_E);
+	report_info("overflow reg = 0x%lx", read_sysreg(pmovsclr_el0));
+	report(read_regn_el0(pmevcntr, 1) == 2, "CHAIN counter #1 set to 2");
+	report(!read_sysreg(pmovsclr_el0), "no overflow recorded for chained incr #2");
+
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+	write_regn_el0(pmevcntr, 1, ALL_SET);
+
+	precise_instrs_loop(22, pmu.pmcr_ro | PMU_PMCR_E);
+	report_info("overflow reg = 0x%lx", read_sysreg(pmovsclr_el0));
+	report(!read_regn_el0(pmevcntr, 1), "CHAIN counter #1 wrapped");
+	report(read_sysreg(pmovsclr_el0) == 0x2, "overflow on chain counter");
+}
+
+static void test_chained_sw_incr(void)
+{
+	uint32_t events[] = {SW_INCR, CHAIN};
+	int i;
+
+	if (!satisfy_prerequisites(events, ARRAY_SIZE(events)))
+		return;
+
+	pmu_reset();
+
+	write_regn_el0(pmevtyper, 0, SW_INCR | PMEVTYPER_EXCLUDE_EL0);
+	write_regn_el0(pmevtyper, 1, CHAIN | PMEVTYPER_EXCLUDE_EL0);
+	/* enable counters #0 and #1 */
+	write_sysreg_s(0x3, PMCNTENSET_EL0);
+
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+	set_pmcr(pmu.pmcr_ro | PMU_PMCR_E);
+	for (i = 0; i < 100; i++)
+		write_sysreg(0x1, pmswinc_el0);
+
+	report(!read_sysreg(pmovsclr_el0) && (read_regn_el0(pmevcntr, 1) == 1),
+		"no overflow and chain counter incremented after 100 SW_INCR/CHAIN");
+	report_info("overflow=0x%lx, #0=%ld #1=%ld", read_sysreg(pmovsclr_el0),
+		    read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1));
+
+	/* 64b SW_INCR and overflow on CHAIN counter*/
+	pmu_reset();
+
+	write_regn_el0(pmevtyper, 1, events[1] | PMEVTYPER_EXCLUDE_EL0);
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+	write_regn_el0(pmevcntr, 1, ALL_SET);
+	write_sysreg_s(0x3, PMCNTENSET_EL0);
+	set_pmcr(pmu.pmcr_ro | PMU_PMCR_E);
+	for (i = 0; i < 100; i++)
+		write_sysreg(0x1, pmswinc_el0);
+
+	report((read_sysreg(pmovsclr_el0) == 0x2) &&
+		(read_regn_el0(pmevcntr, 1) == 0) &&
+		(read_regn_el0(pmevcntr, 0) == 84),
+		"overflow on chain counter and expected values after 100 SW_INCR/CHAIN");
+	report_info("overflow=0x%lx, #0=%ld #1=%ld", read_sysreg(pmovsclr_el0),
+		    read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1));
 }
 
 #endif
@@ -697,6 +785,14 @@ int main(int argc, char *argv[])
 		report_prefix_push(argv[1]);
 		test_sw_incr();
 		report_prefix_pop();
+	} else if (strcmp(argv[1], "pmu-chained-counters") == 0) {
+		report_prefix_push(argv[1]);
+		test_chained_counters();
+		report_prefix_pop();
+	} else if (strcmp(argv[1], "pmu-chained-sw-incr") == 0) {
+		report_prefix_push(argv[1]);
+		test_chained_sw_incr();
+		report_prefix_pop();
 	} else {
 		report_abort("Unknown sub-test '%s'", argv[1]);
 	}
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 175afe6..d31dcbf 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -96,6 +96,18 @@ groups = pmu
 arch = arm64
 extra_params = -append 'pmu-sw-incr'
 
+[pmu-chained-counters]
+file = pmu.flat
+groups = pmu
+arch = arm64
+extra_params = -append 'pmu-chained-counters'
+
+[pmu-chained-sw-incr]
+file = pmu.flat
+groups = pmu
+arch = arm64
+extra_params = -append 'pmu-chained-sw-incr'
+
 # Test PMU support (TCG) with -icount IPC=1
 #[pmu-tcg-icount-1]
 #file = pmu.flat
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
