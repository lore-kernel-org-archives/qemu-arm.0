Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp479020wrp;
        Fri, 13 Sep 2019 01:37:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQPury+loi1FHbKWWVcs1uwievCruvr7LVSeUN3tz7hyJ71fEHCvThJMTtVC3vElM6m8KI
X-Received: by 2002:ac8:301b:: with SMTP id f27mr1642603qte.83.1568363834528;
        Fri, 13 Sep 2019 01:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568363834; cv=none;
        d=google.com; s=arc-20160816;
        b=lVAk1bp+HMCKCAKmIXSR9K1I+tl9S0Ox714tpCADXYHT52sMnilxHDgu6je16zOomu
         PeRiU2/Ax5Ky3xmvSNdv7z2GMkkjijGUnj2ZCnX+CH75ECV3fquepAgACGj75z3m6gQa
         RpPvFqaSLqcohuhm5ZNir5DuQT6R0P/4VCkRRbwWOGxmbBxNS3KjNwTNi27FLQY2Jc9V
         bcPy8Ty5DVwQMW/N9ep3n5nVk5dX4n4O2WHgfDq2nmMGMn/+3qf7B0DXLavLG8eim7+x
         MAR6tRyFXHySr2SAXuZLR/dT/gjyHyJJ45jDqfWWOdYfeWUgQCdxyXVzol6NrHlmvWtA
         wNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=p+IbM5/QArsdPPi4D9l7FzyjVenOPxdMziJRFYUTPx0=;
        b=wIrNaS82q6L2YmjTaPlRsKWROdywEN9S51IuBbctbdXv6UHCWDObBxQiapmcn1K+jR
         Ct7K/zMMhqvXc4Yv1WDg8x5nIM1X5Hbayf9AsfXY0QVAqMIVUAc29BiN3blKUf4Cvl0v
         tGOUJGtXq7Tf2QmogMsC0MvS9xsCqf56O1Kx0YRpcXWOvd2kZiy1SME7OBv3u0g0lzDB
         VfQaidGrVySrWc0xEttffNrDQ1Ma/5dM1iZzyOSIivjDACosJJ8SRU/LtbLs3ZAEXpCo
         UmAm5v5WoA3ctK3XZeY9de4YCO+hYTJ4JJgQwpEDRvAu7IEVnIpHb9X29Z8JD3SLKtlA
         xD5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s46si4742389qte.121.2019.09.13.01.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 01:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8h4r-0005gh-9p
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 04:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4Y-0005c2-Nd
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4X-00089J-PB
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59132)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4X-000894-KI; Fri, 13 Sep 2019 04:36:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2E71300BEA6;
 Fri, 13 Sep 2019 08:36:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B713A60F80;
 Fri, 13 Sep 2019 08:36:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:12 +0200
Message-Id: <20190913083615.14719-4-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 13 Sep 2019 08:36:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1 3/6] exec: assert on
 memory_region_register_iommu_notifier() failure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dfzjb0MDiT1g

memory_region_register_iommu_notifier now returns an error
in case of failure. Assert in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 235d6bc883..da30251a2b 100644
--- a/exec.c
+++ b/exec.c
@@ -692,7 +692,8 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
                             0,
                             HWADDR_MAX,
                             iommu_idx);
-        memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
);
+        assert(!memory_region_register_iommu_notifier(notifier->mr,
+                                                      &notifier->n));
     }
=20
     if (!notifier->active) {
--=20
2.20.1

