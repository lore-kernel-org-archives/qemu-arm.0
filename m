Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp799699lfc;
        Thu, 12 Mar 2020 08:44:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsbVsdV6Ia6b1cQMrE/GUpSNgvSayuLAiwoTp6sae8vGo+sDWe4pBXrlhE5ihrsOPq7KhYQ
X-Received: by 2002:a05:6830:23b6:: with SMTP id m22mr6790895ots.225.1584027874170;
        Thu, 12 Mar 2020 08:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027874; cv=none;
        d=google.com; s=arc-20160816;
        b=mFJcEbolhUlJ257ekgVCFg3xpFLWwFWFe1ssMUSWf2TbYpMdOg6cLYYaAaXzmUo0Fv
         nM4ORxXYXXcyh1ar4qMKG/wLbT/TLAxX1Q9s7rm+qhCFxah46haPYnWitZb4MvjBC1Ec
         aodSF1VxLaauNTS190KpEa+W+gxWrvrMqg+GzzhYSKiX+McSWeF3NPWwYqLdHGOfMO5U
         uSCRD6UbG9o1KrMVCnUimoenilLbRvlxzN61NcB64Eh5fyb0/Sw/Hg5XjkbPdj5eNL43
         /6FEWgyaiYTVCPoakyzbhA57h0cpVBn5vL+NLNuDTUiPD1gkFGI9Tt6HmPIM746FRJHp
         VStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=UlELUc8BfECpYBnXZ2RZ4Fo7yfR5/2QrlCwiuzUqtRs=;
        b=akNV18fvDdny3LW25TSEWnmhpHVmX7KTBn32CxZvyMm1lmZu7Ji/lVajNYVh/+cD4l
         wo759pFX5f55ioH8d849Nk6WOsmNeI9C6M1Myvfji/lSMgTH4FLiczacFHUQ6FehjbSt
         3HPfO1y0v7lb0eVtFHzjEp8BekSsX8mYdVff9GGnnbmBhyj/6qqc05F1GK7xSQkgkK+u
         nZ7N10SFevFK0OGfKwCgDWh26Pbp341R5NGYlKAGTvgYEbdfr1TqbYPhdlU/aA5x1Hn1
         iHOiBbXjFBJNbUQPOn385Rzwzk6oq9s2toi9cDeOuEHGK2Y4+WlEDAqG93B734Cz2TlW
         Yxww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdAeVdqX;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c21si2835424oto.137.2020.03.12.08.44.33;
        Thu, 12 Mar 2020 08:44:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdAeVdqX;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgCLPod (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 11:44:33 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55307 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727493AbgCLPod (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 12 Mar 2020 11:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584027872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UlELUc8BfECpYBnXZ2RZ4Fo7yfR5/2QrlCwiuzUqtRs=;
        b=OdAeVdqXyzEimQTrAkhbpIM3QvD+33iyEjOQW5QLA2+WeaWdYZCvAUKO77dPUibtkOkDdZ
        zEUbhgXRgmgMLFc8411LlDTdyBr2cVwFDxFTVNTRAOp8J521/ZHsrOAujfSklGZ1P7YDuu
        aAQZX5OCPXCQCXTFuGGnSW04iz3ZQcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-JBZ2QMoqOS-I3-uZSalM6w-1; Thu, 12 Mar 2020 11:44:28 -0400
X-MC-Unique: JBZ2QMoqOS-I3-uZSalM6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 840081922049;
        Thu, 12 Mar 2020 15:44:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 041105C1C3;
        Thu, 12 Mar 2020 15:44:21 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v3 08/12] arm: pmu: Test SW_INCR event count
Date:   Thu, 12 Mar 2020 16:42:57 +0100
Message-Id: <20200312154301.9130-9-eric.auger@redhat.com>
In-Reply-To: <20200312154301.9130-1-eric.auger@redhat.com>
References: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Qx2Ejc237YI+

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
