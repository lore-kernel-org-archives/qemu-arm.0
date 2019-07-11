Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp981871wrv;
        Thu, 11 Jul 2019 10:35:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyp67AtO/F6lzKF8Ut0IwWnE2ZBLoIMqMoYgoICL8bQZrs4EgsH/7PNKwEk4CAiY7+YiwNq
X-Received: by 2002:a17:906:7243:: with SMTP id n3mr4265687ejk.112.1562866502558;
        Thu, 11 Jul 2019 10:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866502; cv=none;
        d=google.com; s=arc-20160816;
        b=WADYebNoYKtcSfioSHdKN25y/y6xLk/tB5xf3C2mwMUxO/6pA/e8nb1h+BIQLY8Znt
         ryszFrZLb70mA+jfzrjOuUEhOOD9B4b6GtAGLWaXC08+jkjNuP2cOaR9Ltm1vKTdjz+b
         ZyHm5OpHislFm6ayNVcePfNiBoIcfydpfxOEze3UFiN1C7IckZfKnOzltKYet8ZQh9xU
         fkunmHs9YmaQb4UDuW0JCySphPeFk2ioEpSOzPOBIWpvxMgNb9x+7Qhm5Vjvf8oYLYsx
         pgefbZNIFY2NyOlQkUI6ZZCh47CFsdv30yw1xxQpo03emQS0JjFTPNf2Luql20vLzmFG
         NM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iM38rwHjKxjlYS4n98uSg5O+AEQyqmQMK7TZaEUsvZA=;
        b=iZ0jaTf346OnwmaECj3jbsemrulbkb8YpgSOJ95rxOKZL+K8+lPQJk3ILjUtzITjdz
         l4gZLAFMOqtRuy8L6kLDGcVFohT4/AHBce8W1VA6KPYyOX1L1UyglOlNXQwGAkoAcMBN
         hV/cYC7N4c4CeMXAkHbAUZMBURkYW7nKK+HcmOMLLljLmbGgVxoWo+5xsa887GNHgjT/
         H2z86MGtOWGtw0rZmgy1XQkoWirq11v+Y29xrmur/8LPOG01w5THFP6hsu6YEHfS4RBM
         KydCLn2riywyHHycXyloYgbwBxiYu/4vNTiawmhblq4kvAPd3VLKu0swAYbrJud2d1WX
         qVqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si4010226edd.395.2019.07.11.10.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44025 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcyC-0007TF-DA
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcvb-0006Rn-Lf
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcvZ-0004di-PM
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcvZ-0004cQ-KF; Thu, 11 Jul 2019 13:32:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE20485538;
 Thu, 11 Jul 2019 17:32:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FBE65C1B4;
 Thu, 11 Jul 2019 17:32:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:41 +0200
Message-Id: <20190711172845.31035-26-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 11 Jul 2019 17:32:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 25/29] hw/arm/smmuv3: Fill the IOTLBEntry
 arch_id on NH_VA invalidation
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0FFfLtSR1v/

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f7497de9e4..8c88923f73 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -824,6 +824,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova =3D iova;
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
+    entry.arch_id =3D asid;
=20
     memory_region_notify_one(n, &entry);
 }
--=20
2.20.1

