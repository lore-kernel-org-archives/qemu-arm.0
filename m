Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp315901lfi;
        Fri, 3 Apr 2020 00:13:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLo/fm2ALwC1mOx7ATp9gevaQqC9XU7VQ7iiRJcOFlc86oRHpERiFCn0QavvW34qrD0J5qn
X-Received: by 2002:a9d:644:: with SMTP id 62mr4748987otn.177.1585898032778;
        Fri, 03 Apr 2020 00:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585898032; cv=none;
        d=google.com; s=arc-20160816;
        b=pdJb8Tj5af06SLoRdexT0m6KiYo4szyR+9Az+JLBVOegLSFSvHvqyqAP5QNnz9eMNp
         w6uVWIRuE0BbjDcRnH1n+AIrTDMVp+IXX8/khykbRK69TKVNKmtvf1XnjS5yWiLPwsZU
         Z4oEptouUt6rPA8T26soBd5+WQnKccAzyJrReLIJEjaWfUOHj/r0ug0OJUSb1FgDAlNU
         XqpX8SJ0aWGJKaYmaRRzFx3ASP6o5ho3TTIqcFtfupaw7Dad42Yl7G6US6wJ694lumTl
         /GxbKaAxKUbKEj146jzxaY4cTAgzmkRWm5fARd2kEcm8Vr5IfMchMa8CMwSStj452DDK
         qMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=L32ijn0JvgWid8cEaZUZkfWPFPXKJ067qGBdQUVReeI=;
        b=NIXDPuOm7sFUEZjuqfHFIHbt/IakVzUlCpom/2eLbIvTpTqUnsO0Rz6FIGxVXuqxYC
         /dUkO0qQ0ItsjEscQp4IMqTW58cSe/bMCvJhettDBZ13v+aUzlz3VpJ2/q6xeMkWGI5S
         BampmCOsaf8PuPvDNKS2fMp29BZ7/8wqgddmzZ2oRc6IVBcVIrpmYQOdBiRwiBGnNmeB
         idm7BsmekFDkYJ5ESDTBVzXbrtWeGRThUazqFdzmNHf5Q4zRL4o5SgzFJhOEuHkbn0gq
         iv6HsflNFDYdcxs6pgb7n5gjTB1sCdZ3lQ496lbJ//Sm58mPZslzBKjgH5bVEuOS6nPU
         J0lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6SPozoe;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 30si3346651oth.68.2020.04.03.00.13.52;
        Fri, 03 Apr 2020 00:13:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6SPozoe;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389388AbgDCHNv (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Apr 2020 03:13:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42159 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389116AbgDCHNv (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Apr 2020 03:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585898030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L32ijn0JvgWid8cEaZUZkfWPFPXKJ067qGBdQUVReeI=;
        b=R6SPozoeM184kb1W+xClsQJuT3ZHmub2JPBbbCB7X9MpA0fFHo8Rq0/aPmuHSuw7CjjA5h
        zHWjkco2XiE9QoSTPJiwLlupsnptKYg9Lzw5M7ospyRYBl/1T9FKduWFxqoPuCagRMFERa
        XPup8yXROu48xSKzOqJ3MgtWiHcWf9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-4bN44hc4OP2CumKOlh-b5w-1; Fri, 03 Apr 2020 03:13:48 -0400
X-MC-Unique: 4bN44hc4OP2CumKOlh-b5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6537477;
        Fri,  3 Apr 2020 07:13:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A444E5C1C6;
        Fri,  3 Apr 2020 07:13:42 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v4 03/12] arm: pmu: Don't check PMCR.IMP anymore
Date:   Fri,  3 Apr 2020 09:13:17 +0200
Message-Id: <20200403071326.29932-4-eric.auger@redhat.com>
In-Reply-To: <20200403071326.29932-1-eric.auger@redhat.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: AkyTj/T6XIDF

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
