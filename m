Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp316173lfi;
        Fri, 3 Apr 2020 00:14:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ/6svbYyGXKqED3x8HseBeLYwIi4nSemSBuwk5zjpHm6MBW65MlqtckGOXZVBJg37cQ6IK
X-Received: by 2002:a9d:943:: with SMTP id 61mr5431750otp.3.1585898051002;
        Fri, 03 Apr 2020 00:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585898050; cv=none;
        d=google.com; s=arc-20160816;
        b=UqF07r8i65EjoSpX3La0x58WNteb8OfNwdYSRExLUUkdyAGxIb9VW6V5RwXrbMNC3T
         7LA0Xuc9bHY3+d/B4YQ8COqqQ5nhPPau7BTmg+TX8ECgZEh0MmNPzMTjDJtWZiIod7qr
         JxafWNjuhVeFxbGyRjrLUOixe2ji/TUalOYw0++KvJTOtfRaCyjJLTCdoCvgoYo85jmx
         vlt3f7pXr+mAHiJjSbzA4AkBzlVW2qMyFN1lWdczGPLpNqbwIe6jEX60a7Bi1/eo82+h
         yoUUFqLNVM3LqQ6L01rH8Gxtncu/CT80obNKcxDdX2MgtuEtMRW6ivi/vWBzmM4kCNVL
         X4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=UlELUc8BfECpYBnXZ2RZ4Fo7yfR5/2QrlCwiuzUqtRs=;
        b=OZlv+WBDy3TYA8tDUiwDHYAsKXosb+AwyKpUoaeU/7e/SzVzxHwFhuZyhHNjW3e50J
         asR4NWmquo4Mpp4/dMZPJlaJsRZRS88eqM/MXvHGQk3LjJPMNZCHpEubhw/uO8wSlaZM
         wjQo7e9hye2+J8dQIBJARcUJzs5MoZRnbpQE+Uc7AFllISmw4Sw85Y21asjDSXsrZ2+C
         wgkmYsmG16b4U4yHn5noGDdJgSkGJ694NG5KbXK/U19xNnElvBG/u8hYY91Ye3aX+SOn
         RyZ/URZ+FOdIHe5ufHim9/uYqPBYmsyFJS8zWEfr19Ax3ORjS2sUFeByCA/vVc2Mxkyl
         QSbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GT1QNIZa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x9si3221020oia.194.2020.04.03.00.14.10;
        Fri, 03 Apr 2020 00:14:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GT1QNIZa;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389800AbgDCHOJ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Apr 2020 03:14:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48283 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732205AbgDCHOJ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Apr 2020 03:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585898048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UlELUc8BfECpYBnXZ2RZ4Fo7yfR5/2QrlCwiuzUqtRs=;
        b=GT1QNIZar+CO41aJYPtXyn7sawOPeJ8xc4r4FgmmN4/JPA01ib/OHUCwuFDmb+ZizWe9kt
        HUdwCW7PQUI/7zNpMVm9V1wHF0ljtuAzyimZtuCrVqEbi/8x+Z089SJ+pM7nDcchyNpuNH
        AYXUFDnph6jjvv/Y6XhFO+TdyfsYi2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-AwAQ_jQENxuPO_SraOuITA-1; Fri, 03 Apr 2020 03:14:07 -0400
X-MC-Unique: AwAQ_jQENxuPO_SraOuITA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8975B477;
        Fri,  3 Apr 2020 07:14:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A167248;
        Fri,  3 Apr 2020 07:14:02 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v4 08/12] arm: pmu: Test SW_INCR event count
Date:   Fri,  3 Apr 2020 09:13:22 +0200
Message-Id: <20200403071326.29932-9-eric.auger@redhat.com>
In-Reply-To: <20200403071326.29932-1-eric.auger@redhat.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ds4IHMThqEwa

Add tests dedicated to SW_INCR event counting.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3: new
- Formerly in chained counter tests but as QEMU does not
  support chained counters, the whole test was failing. Peter
  split the test.
---
 arm/pmu.c         | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 arm/unittests.cfg |  6 ++++++
 2 files changed, 53 insertions(+)

diff --git a/arm/pmu.c b/arm/pmu.c
index 45dccf7..c954c71 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -140,6 +140,7 @@ static void test_event_introspection(void) {}
 static void test_event_counter_config(void) {}
 static void test_basic_event_count(void) {}
 static void test_mem_access(void) {}
+static void test_sw_incr(void) {}
=20
 #elif defined(__aarch64__)
 #define ID_AA64DFR0_PERFMON_SHIFT 8
@@ -464,6 +465,48 @@ static void test_mem_access(void)
 			read_sysreg(pmovsclr_el0));
 }
=20
+static void test_sw_incr(void)
+{
+	uint32_t events[] =3D {SW_INCR, SW_INCR};
+	int i;
+
+	if (!satisfy_prerequisites(events, ARRAY_SIZE(events)))
+		return;
+
+	pmu_reset();
+
+	write_regn_el0(pmevtyper, 0, SW_INCR | PMEVTYPER_EXCLUDE_EL0);
+	write_regn_el0(pmevtyper, 1, SW_INCR | PMEVTYPER_EXCLUDE_EL0);
+	/* enable counters #0 and #1 */
+	write_sysreg_s(0x3, PMCNTENSET_EL0);
+
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+
+	for (i =3D 0; i < 100; i++)
+		write_sysreg(0x1, pmswinc_el0);
+
+	report_info("SW_INCR counter #0 has value %ld", read_regn_el0(pmevcntr,=
 0));
+	report(read_regn_el0(pmevcntr, 0) =3D=3D PRE_OVERFLOW,
+		"PWSYNC does not increment if PMCR.E is unset");
+
+	pmu_reset();
+
+	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
+	write_sysreg_s(0x3, PMCNTENSET_EL0);
+	set_pmcr(pmu.pmcr_ro | PMU_PMCR_E);
+
+	for (i =3D 0; i < 100; i++)
+		write_sysreg(0x3, pmswinc_el0);
+
+	report(read_regn_el0(pmevcntr, 0)  =3D=3D 84, "counter #1 after + 100 S=
W_INCR");
+	report(read_regn_el0(pmevcntr, 1)  =3D=3D 100,
+		"counter #0 after + 100 SW_INCR");
+	report_info("counter values after 100 SW_INCR #0=3D%ld #1=3D%ld",
+		    read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1));
+	report(read_sysreg(pmovsclr_el0) =3D=3D 0x1,
+		"overflow reg after 100 SW_INCR");
+}
+
 #endif
=20
 /*
@@ -650,6 +693,10 @@ int main(int argc, char *argv[])
 		report_prefix_push(argv[1]);
 		test_mem_access();
 		report_prefix_pop();
+	} else if (strcmp(argv[1], "pmu-sw-incr") =3D=3D 0) {
+		report_prefix_push(argv[1]);
+		test_sw_incr();
+		report_prefix_pop();
 	} else {
 		report_abort("Unknown sub-test '%s'", argv[1]);
 	}
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 32ab8c6..175afe6 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -90,6 +90,12 @@ groups =3D pmu
 arch =3D arm64
 extra_params =3D -append 'pmu-mem-access'
=20
+[pmu-sw-incr]
+file =3D pmu.flat
+groups =3D pmu
+arch =3D arm64
+extra_params =3D -append 'pmu-sw-incr'
+
 # Test PMU support (TCG) with -icount IPC=3D1
 #[pmu-tcg-icount-1]
 #file =3D pmu.flat
--=20
2.20.1
