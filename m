Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp798802lfc;
        Thu, 12 Mar 2020 08:43:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvEaHjn0Nz9kDpSs3u5NqoV7Stxu9yvYZ3IFgWjVpaAQrk2m2K+3RbIjqbu4LsMa4Nh0y0M
X-Received: by 2002:aca:2b04:: with SMTP id i4mr3111035oik.61.1584027820724;
        Thu, 12 Mar 2020 08:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027820; cv=none;
        d=google.com; s=arc-20160816;
        b=RTPeXHO32OhCo9QF50V6BkhYMbdaoPrnWMA5FNWQXJrdcFTaze3C9YexzM7mH4RuUW
         r4zvyBjbtEczM77NtIhkr5+bpJIu8p6jbEHUkHj2Rf0I5Tm5dlukneWVLrVXlZA6lcSc
         veacmH+T1HxDLZ8jo+x6Etk/BXnWHa/aOnT6Af4UUmD7/N9lU7H3pawrr1Ti/E/dC1g+
         050SXNi2o2mBpXs4ftRZhEa5P7A0fCsa+fgLeBlMnQOacdx5gbncazwxxgnv/okMUbfs
         hk2gr41i3DI5hR6+q58HUF9WksYmGwGlE8sEeXLQwLklxVg784cCu/SeZzzh3MvFf0nJ
         7bBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=L32ijn0JvgWid8cEaZUZkfWPFPXKJ067qGBdQUVReeI=;
        b=QxoN7+89kPkTTVgiWAuC2hY/Z+lJg29y7LiI/UDIUAwXDnoM4Y5MWgdC6x64eFGwH9
         Nx9VrGxIq5hq4ur+QPvU1NUMsxcQ7DZw7Ch5IQBMiJKpWk0IHfnx5RY/mKX3266YH2nR
         9Etq9lHLk47kXh/iVdPyr/UaWmGEcpaJLbe9KKPqv+URWxM178MX5PCNfMbWPsu42shC
         PlI5Jn2jIbFw9kwZd7omy1rfpaWYhr2xCmhNGd9Ph9d+/YOmy/Exm3T31wFzriY/mDnm
         9ftUr3TiHR5xXQi+8mKHNIhtCP1VhKnw22S5xrM6j8Xzb7/QW6H7TbO25U/1EHggBndU
         YHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WAIxy4DS;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c21si2835424oto.137.2020.03.12.08.43.40;
        Thu, 12 Mar 2020 08:43:40 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WAIxy4DS;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgCLPnj (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 11:43:39 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56817 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727749AbgCLPnj (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 12 Mar 2020 11:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584027819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L32ijn0JvgWid8cEaZUZkfWPFPXKJ067qGBdQUVReeI=;
        b=WAIxy4DS5B2Pb48kzwXe3m9eCl4LxYUucV5zfGPIrH7Q5fMprWX+oOg46BgBWQHcqVuhWg
        IzdSvrh4yqYckYRbOxnb1d0/8ZyOdh08c0PoaejTGvSvHfKDVuTalg9ed9IbWkuGNk3MWS
        upBUCKw92NFce6L35yx974gkPYPx0to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-rwhGuAlZN5-oHk3xKccUCg-1; Thu, 12 Mar 2020 11:43:37 -0400
X-MC-Unique: rwhGuAlZN5-oHk3xKccUCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC515108442C;
        Thu, 12 Mar 2020 15:43:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7DB66836;
        Thu, 12 Mar 2020 15:43:26 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v3 03/12] arm: pmu: Don't check PMCR.IMP anymore
Date:   Thu, 12 Mar 2020 16:42:52 +0100
Message-Id: <20200312154301.9130-4-eric.auger@redhat.com>
In-Reply-To: <20200312154301.9130-1-eric.auger@redhat.com>
References: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dy8Z5BinBY5C

check_pmcr() checks the IMP field is different than 0.
However A zero IMP field is permitted by the architecture,
meaning the MIDR_EL1 should be looked at instead. This
causes TCG to fail this test on '-cpu max' because in
that case PMCR.IMP is set equal to MIDR_EL1.Implementer
which is 0.

So let's remove the check_pmcr() test and just print PMCR
info in the pmu_probe() function.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 arm/pmu.c | 39 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index 0122f0a..44f3543 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -134,29 +134,6 @@ static inline void precise_instrs_loop(int loop, uin=
t32_t pmcr)
 }
 #endif
=20
-/*
- * As a simple sanity check on the PMCR_EL0, ensure the implementer fiel=
d isn't
- * null. Also print out a couple other interesting fields for diagnostic
- * purposes. For example, as of fall 2016, QEMU TCG mode doesn't impleme=
nt
- * event counters and therefore reports zero event counters, but hopeful=
ly
- * support for at least the instructions event will be added in the futu=
re and
- * the reported number of event counters will become nonzero.
- */
-static bool check_pmcr(void)
-{
-	uint32_t pmcr;
-
-	pmcr =3D get_pmcr();
-
-	report_info("PMU implementer/ID code/counters: %#x(\"%c\")/%#x/%d",
-		    (pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK,
-		    ((pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK) ? : ' ',
-		    (pmcr >> PMU_PMCR_ID_SHIFT) & PMU_PMCR_ID_MASK,
-		    (pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK);
-
-	return ((pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK) !=3D 0;
-}
-
 /*
  * Ensure that the cycle counter progresses between back-to-back reads.
  */
@@ -278,9 +255,22 @@ static void pmccntr64_test(void)
 /* Return FALSE if no PMU found, otherwise return TRUE */
 static bool pmu_probe(void)
 {
+	uint32_t pmcr;
+
 	pmu_version =3D get_pmu_version();
+	if (pmu_version =3D=3D 0 || pmu_version =3D=3D 0xf)
+		return false;
+
 	report_info("PMU version: %d", pmu_version);
-	return pmu_version !=3D 0 && pmu_version !=3D 0xf;
+
+	pmcr =3D get_pmcr();
+	report_info("PMU implementer/ID code/counters: %#x(\"%c\")/%#x/%d",
+		    (pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK,
+		    ((pmcr >> PMU_PMCR_IMP_SHIFT) & PMU_PMCR_IMP_MASK) ? : ' ',
+		    (pmcr >> PMU_PMCR_ID_SHIFT) & PMU_PMCR_ID_MASK,
+		    (pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK);
+
+	return true;
 }
=20
 int main(int argc, char *argv[])
@@ -301,7 +291,6 @@ int main(int argc, char *argv[])
 		report_prefix_push(argv[1]);
 		if (argc > 2)
 			cpi =3D atol(argv[2]);
-		report(check_pmcr(), "Control register");
 		report(check_cycles_increase(),
 		       "Monotonically increasing cycle count");
 		report(check_cpi(cpi), "Cycle/instruction ratio");
--=20
2.20.1
