Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp798969lfc;
        Thu, 12 Mar 2020 08:43:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvtAjTVmQTzZnGSsgPNc/Tp2yCNXBWn373FO9lfMpy/cOq1KrpjDK7F+B5AIbFH8vMIdRAE
X-Received: by 2002:a05:6830:1610:: with SMTP id g16mr404750otr.295.1584027831341;
        Thu, 12 Mar 2020 08:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027831; cv=none;
        d=google.com; s=arc-20160816;
        b=O7Vpu2pwUKOK2E8KNlkVKM7QSd4Syr3Eu/QxVa0MemWJXs4kTe2xc5qsxiVtlFykr+
         u7FDVO3u/kJwaNanrEoGOXef1WEZDKmPK3xmtKuDFSvATUo2atWKKz2ZIKPZL5PvuoJs
         z8jKi9IGIzAQAzkDCFUJrQ4VG0VmPSssKxX3xZ3XEdZQK/RKa7b583MJzlVbhI5OYH4K
         yJL8x84h39bzBpVQa4NvteWfbUOHUoZ4h/QxOSA0MblLq+WJzQ2Xi94B7gTDqpoiBKXY
         Je49erb1usS3BgS27TcH3L/wUpmye73sGxslXlpyCIiLweZXpr6veuFzaA07TSMs7VpI
         6C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=VMgw7fPRvswGtz0UWDZWno+rhI8xWDdMNwR6QWL2h2w=;
        b=swqYgDEbvHuDsbQbyJdl+iPpJaAWkWUAnriEvBLZyT5V5RMkrKZ8FQSX88D8h0SHwv
         4puz1R9S7iAd+HJ8lcX8OTMg+lFmHsF3Q1kUZBKP0gDyPR+qePDM4WFRspjuGj5U6oFz
         RlI3AlI3Axpws71WZHnl0OiEuS3FDtzkuy+8rOdm/OdzcOredHbbSChiA2LqRmAloJd1
         y3RvYjK+3HOnCHkgGz3w9NTRbcmyWIq9Z3Rf+uIrMTssGX/v6JaHBGz/oDvf3ws62jzC
         /xPKRxEiIFVCbBlSlS49u69fVob5Rp6P541YmV3AXqcw1dMg/6YVv7ZfmLTmW/bNSUHc
         H9/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QANbpTSq;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c21si2835424oto.137.2020.03.12.08.43.51;
        Thu, 12 Mar 2020 08:43:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QANbpTSq;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgCLPnu (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 11:43:50 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50518 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727758AbgCLPnu (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 12 Mar 2020 11:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584027829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VMgw7fPRvswGtz0UWDZWno+rhI8xWDdMNwR6QWL2h2w=;
        b=QANbpTSqsxdKtyKY1ydF2yrNSM8tzRd4kDuExeQHVi/RzHdW+ClELwKmd5gquK6MsBLUF9
        U8H/QI7WsVuQMLFQxH4vElnZyiu6JcuKfYkeI3kZFoQlAFyN5u9i7AcEMGaBUtAurSbCrM
        uyMETzcipej2IWT4BvJvOCFjY7+qh7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-usSHrW4ZMfKBoq07xHe6zg-1; Thu, 12 Mar 2020 11:43:47 -0400
X-MC-Unique: usSHrW4ZMfKBoq07xHe6zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A437E18FF66D;
        Thu, 12 Mar 2020 15:43:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 92CE12CE03;
        Thu, 12 Mar 2020 15:43:36 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v3 04/12] arm: pmu: Add a pmu struct
Date:   Thu, 12 Mar 2020 16:42:53 +0100
Message-Id: <20200312154301.9130-5-eric.auger@redhat.com>
In-Reply-To: <20200312154301.9130-1-eric.auger@redhat.com>
References: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Utgr+MobwLXn

This struct aims at storing information potentially used by
all tests such as the pmu version, the read-only part of the
PMCR, the number of implemented event counters, ...

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---

v2 -> v3:
- Fix pmcr_ro and add a comment
---
 arm/pmu.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index 44f3543..d827e82 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -33,7 +33,14 @@
=20
 #define NR_SAMPLES 10
=20
-static unsigned int pmu_version;
+struct pmu {
+	unsigned int version;
+	unsigned int nb_implemented_counters;
+	uint32_t pmcr_ro;
+};
+
+static struct pmu pmu;
+
 #if defined(__arm__)
 #define ID_DFR0_PERFMON_SHIFT 24
 #define ID_DFR0_PERFMON_MASK  0xf
@@ -242,7 +249,7 @@ static bool check_cpi(int cpi)
 static void pmccntr64_test(void)
 {
 #ifdef __arm__
-	if (pmu_version =3D=3D 0x3) {
+	if (pmu.version =3D=3D 0x3) {
 		if (ERRATA(9e3f7a296940)) {
 			write_sysreg(0xdead, PMCCNTR64);
 			report(read_sysreg(PMCCNTR64) =3D=3D 0xdead, "pmccntr64");
@@ -257,18 +264,24 @@ static bool pmu_probe(void)
 {
 	uint32_t pmcr;
=20
-	pmu_version =3D get_pmu_version();
-	if (pmu_version =3D=3D 0 || pmu_version =3D=3D 0xf)
+	pmu.version =3D get_pmu_version();
+	if (pmu.version =3D=3D 0 || pmu.version =3D=3D 0xf)
 		return false;
=20
-	report_info("PMU version: %d", pmu_version);
+	report_info("PMU version: %d", pmu.version);
=20
 	pmcr =3D get_pmcr();
-	report_info("PMU implementer/ID code/counters: %#x(\"%c\")/%#x/%d",
+	report_info("PMU implementer/ID code: %#x(\"%c\")/%#x",
 		    (pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK,
 		    ((pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK) ? : ' ',
-		    (pmcr >> PMU_PMCR_ID_SHIFT) & PMU_PMCR_ID_MASK,
-		    (pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK);
+		    (pmcr >> PMU_PMCR_ID_SHIFT) & PMU_PMCR_ID_MASK);
+
+	/* store read-only and RES0 fields of the PMCR bottom-half*/
+	pmu.pmcr_ro =3D pmcr & 0xFFFFFF00;
+	pmu.nb_implemented_counters =3D
+		(pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK;
+	report_info("Implements %d event counters",
+		    pmu.nb_implemented_counters);
=20
 	return true;
 }
--=20
2.20.1
