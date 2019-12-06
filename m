Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1040077lff;
        Fri, 6 Dec 2019 09:27:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxg+T88tGP3OavThxYG2nb1QGlXCrciCSEuEF/Dj2fVC/5Q2yJec6xnw9xvYYCQJsJILbDs
X-Received: by 2002:a05:6830:12cc:: with SMTP id a12mr10877098otq.73.1575653268270;
        Fri, 06 Dec 2019 09:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575653268; cv=none;
        d=google.com; s=arc-20160816;
        b=UmzNuC7dS/+rmm0LxDhuYV9Dt4jHZ98p6HqJWilbW98jUEXM9UeKhnxTyqq4c57UlA
         c+EEYBTMzJEgmv6VyQ7Kf1UULPdAHyM4hlWQWPxfTE2OMkGrP+irYrY0rh+zYhtpsv6m
         eMQYQfHELvIyIsxQVTkeoop/KAIltU3E1UzN3zNQ6MZg6MEZY6AqN2AVy78Rk/5dxHrQ
         x46qyanole0jqAh9DKs2y94KisNcrBCq96oX3f+aKFhqjP8+nLfKJYD4Cu77dr7d1veU
         9bL6rnMsijuBEgH5aj0ZJOI+i/F0rCxlh/H+GTxGnlxZU59dAXeYbFVBGcDV+2hLAofe
         xc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=lZIWyVz0mXJm3WKdFFZ/MDv4wbAF4ZdIGNT+t+b1NIM=;
        b=mEB/AbExof4A/MJVlEAx73CvQuD2s79KBZBQOwdsQET/OBTz6OwQqE2loFevJuGU5Q
         afU5+qoaJ2qXNL03tu9qvuM5SlKJhP98y+MK2hG2boglFcJ6ncjyPwA4FYejtRgn1Ew8
         R7wsSz0xY9cG/zBOwWFzdg+ke5eObfe8Ip3DWIRCVPf6V9VF6QxjBGlxM77eLlK9+oS1
         2wvR6n4V0QtYiQOrHNBCbozS+5DnlvEc8WHIRsi2A9kQdpuNuzBjStkBpDiil5rr9dbn
         R3ey3TiQ1u5VGSTCOJoaXZFOxF9dfq3uqaliGtI7vcnuQSLr0GHzMAYfdD42gUHKrZjL
         y/Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gDxL6DE/";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g6si6984218otb.231.2019.12.06.09.27.48;
        Fri, 06 Dec 2019 09:27:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gDxL6DE/";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfLFR1r (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 6 Dec 2019 12:27:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50870 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726325AbfLFR1r (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 6 Dec 2019 12:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575653265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lZIWyVz0mXJm3WKdFFZ/MDv4wbAF4ZdIGNT+t+b1NIM=;
        b=gDxL6DE/1IjAi8VzFP4328+FXyLjs1PkxQMtPLyTulAm4D5a+n6lJMX0vtji190ALhfULQ
        oSZuMVyfE1Yf56EiNOvH4hG2m65WGl9LnY6qshrPDnErh+jr4VSkd1CEWjNBzfUyob0cTh
        FNxtOcIx8HD2ULoU7GSAyPDr7MJAa7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-D71sZqEuNFWfvlreylC4FA-1; Fri, 06 Dec 2019 12:27:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DC9107ACC9;
        Fri,  6 Dec 2019 17:27:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 73DC86CE40;
        Fri,  6 Dec 2019 17:27:39 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org
Subject: [kvm-unit-tests RFC 02/10] pmu: Let pmu tests take a sub-test parameter
Date:   Fri,  6 Dec 2019 18:27:16 +0100
Message-Id: <20191206172724.947-3-eric.auger@redhat.com>
In-Reply-To: <20191206172724.947-1-eric.auger@redhat.com>
References: <20191206172724.947-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: D71sZqEuNFWfvlreylC4FA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Rt/pdtlnIRrN

As we intend to introduce more PMU tests, let's add
a sub-test parameter that will allow to categorize
them. Existing tests are in the cycle-counter category.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/pmu.c         | 22 ++++++++++++++--------
 arm/unittests.cfg |  7 ++++---
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index 1de7d77..2ad6469 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -287,21 +287,27 @@ int main(int argc, char *argv[])
 {
 =09int cpi =3D 0;
=20
-=09if (argc > 1)
-=09=09cpi =3D atol(argv[1]);
-
 =09if (!pmu_probe()) {
 =09=09printf("No PMU found, test skipped...\n");
 =09=09return report_summary();
 =09}
=20
+=09if (argc < 2)
+=09=09report_abort("no test specified");
+
 =09report_prefix_push("pmu");
=20
-=09report("Control register", check_pmcr());
-=09report("Monotonically increasing cycle count", check_cycles_increase())=
;
-=09report("Cycle/instruction ratio", check_cpi(cpi));
-
-=09pmccntr64_test();
+=09if (strcmp(argv[1], "cycle-counter") =3D=3D 0) {
+=09=09report_prefix_push(argv[1]);
+=09=09if (argc > 2)
+=09=09=09cpi =3D atol(argv[2]);
+=09=09report("Control register", check_pmcr());
+=09=09report("Monotonically increasing cycle count", check_cycles_increase=
());
+=09=09report("Cycle/instruction ratio", check_cpi(cpi));
+=09=09pmccntr64_test();
+=09} else {
+=09=09report_abort("Unknown subtest '%s'", argv[1]);
+=09}
=20
 =09return report_summary();
 }
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index daeb5a0..79f0d7a 100644
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
