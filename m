Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp798708lfc;
        Thu, 12 Mar 2020 08:43:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvlypcSjrR51oO/CwYsZtOlw4RJlv1Dgf/09SzjmROjHPwSRVF73ECOGCHN33pccvfCtSgZ
X-Received: by 2002:a9d:64cd:: with SMTP id n13mr6927318otl.274.1584027813345;
        Thu, 12 Mar 2020 08:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027813; cv=none;
        d=google.com; s=arc-20160816;
        b=zyOwbdhwFxcsiaX+ZUiPmCnCkhU6aWGcggTtXVUrESMZQRKO7HIz78n9KCA2xmRNAc
         cVEfEmMd5zfY1oogdYk9/DOLQBnXy2T4AL9y0I7lG4w6A6gxgv274PwXyGSBrWRYk1f/
         oJr/vJb5gQUe3R7FvVjJZl7pFT9hSNDIBzRQhRm7oKe0QilX/+NV8Qn/GnidMQJXoFvf
         zpq/lFoj7GmXuqWaM5iFqhd1lhRpjZVnlNPdBrcUUXY4MKQrtjCduephNlfexICRl2P6
         yKV8kX2OWzLYZ4v7o6l/gklClEO9uu8EPCk36ic+YAB6yuMlIY/edtQ9WV/F526Dxuyx
         hQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=nOxDemA543fI2L+xh6FprjzhpIkpNUjunEo/98XltUM=;
        b=bt4OaAGIX57vCyslx109Ec5bEOLeoyrLUu2sWrz6Vz1kTw6a6KFfgnjLF22M44U3iV
         ZX8z0qbWE6LpjvBc6Kfn1Cfro9+3Or4w9ISYZhVTH7nboDf9ExJ9yQlAagkLKbuhsgEq
         kKAANxiShm3eZNsRnh2ODMsnuazmQdZ9zZS+AkaAlQZVqfdRLx13wxXjUvzIi1YkB9MV
         em/KxVwLEvT2baDc+AekvdnxC8654mZtmoNdzFVogyz1bi/U1H61/fiKnJJd5rCMS5FZ
         atzEhCY1Fj9cYm+83kkhnsEkYoM3O9PKl+unkaMUb0NdhTA3kDjjNcHx+MvsT6n/+G4M
         TQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=amhq3Wp6;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c21si2835424oto.137.2020.03.12.08.43.33;
        Thu, 12 Mar 2020 08:43:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=amhq3Wp6;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgCLPnc (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 11:43:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45711 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727698AbgCLPnc (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 12 Mar 2020 11:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584027810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nOxDemA543fI2L+xh6FprjzhpIkpNUjunEo/98XltUM=;
        b=amhq3Wp61Ilc4NDNBpR1cIekX7QgVfKo+jVQ+9df4lJq4aglj7ENiZTGb3Np9whNEVBK1Y
        cCR6+mXooynmWjZJFateetrwBtjBBwQULqtNruWzRmTwqOuavWynAbj/NSpF619/v6yeX4
        3s10gNG5/5l5KqBjYvLwX1g71VCnd+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344--MupW0a2M9-juJ2S6KejTQ-1; Thu, 12 Mar 2020 11:43:27 -0400
X-MC-Unique: -MupW0a2M9-juJ2S6KejTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C78A5100E6C6;
        Thu, 12 Mar 2020 15:43:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9A5EE5C1B5;
        Thu, 12 Mar 2020 15:43:18 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v3 02/12] arm: pmu: Let pmu tests take a sub-test parameter
Date:   Thu, 12 Mar 2020 16:42:51 +0100
Message-Id: <20200312154301.9130-3-eric.auger@redhat.com>
In-Reply-To: <20200312154301.9130-1-eric.auger@redhat.com>
References: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: +2K6SEQUPlxE

As we intend to introduce more PMU tests, let's add
a sub-test parameter that will allow to categorize
them. Existing tests are in the cycle-counter category.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

---

v2 -> v3:
- added report_prefix_pop()
---
 arm/pmu.c         | 25 ++++++++++++++++---------
 arm/unittests.cfg |  7 ++++---
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index d5a03a6..0122f0a 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -287,22 +287,29 @@ int main(int argc, char *argv[])
 {
 	int cpi =3D 0;
=20
-	if (argc > 1)
-		cpi =3D atol(argv[1]);
-
 	if (!pmu_probe()) {
 		printf("No PMU found, test skipped...\n");
 		return report_summary();
 	}
=20
+	if (argc < 2)
+		report_abort("no test specified");
+
 	report_prefix_push("pmu");
=20
-	report(check_pmcr(), "Control register");
-	report(check_cycles_increase(),
-	       "Monotonically increasing cycle count");
-	report(check_cpi(cpi), "Cycle/instruction ratio");
-
-	pmccntr64_test();
+	if (strcmp(argv[1], "cycle-counter") =3D=3D 0) {
+		report_prefix_push(argv[1]);
+		if (argc > 2)
+			cpi =3D atol(argv[2]);
+		report(check_pmcr(), "Control register");
+		report(check_cycles_increase(),
+		       "Monotonically increasing cycle count");
+		report(check_cpi(cpi), "Cycle/instruction ratio");
+		pmccntr64_test();
+		report_prefix_pop();
+	} else {
+		report_abort("Unknown sub-test '%s'", argv[1]);
+	}
=20
 	return report_summary();
 }
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 017958d..fe6515c 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -61,21 +61,22 @@ file =3D pci-test.flat
 groups =3D pci
=20
 # Test PMU support
-[pmu]
+[pmu-cycle-counter]
 file =3D pmu.flat
 groups =3D pmu
+extra_params =3D -append 'cycle-counter 0'
=20
 # Test PMU support (TCG) with -icount IPC=3D1
 #[pmu-tcg-icount-1]
 #file =3D pmu.flat
-#extra_params =3D -icount 0 -append '1'
+#extra_params =3D -icount 0 -append 'cycle-counter 1'
 #groups =3D pmu
 #accel =3D tcg
=20
 # Test PMU support (TCG) with -icount IPC=3D256
 #[pmu-tcg-icount-256]
 #file =3D pmu.flat
-#extra_params =3D -icount 8 -append '256'
+#extra_params =3D -icount 8 -append 'cycle-counter 256'
 #groups =3D pmu
 #accel =3D tcg
=20
--=20
2.20.1
