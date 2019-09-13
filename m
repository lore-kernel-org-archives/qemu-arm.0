Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp479287wrp;
        Fri, 13 Sep 2019 01:37:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZkRh5aeQ89vcnGT0YKobo6y12EgAG7BcUMJzC7w2ASLkBg+U0Xn63HYHO5cW4QGpPw0lU
X-Received: by 2002:a37:a604:: with SMTP id p4mr42673127qke.58.1568363856845;
        Fri, 13 Sep 2019 01:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568363856; cv=none;
        d=google.com; s=arc-20160816;
        b=GJUw0MWq4wXr2AhA4TxqV89B94gEmVGyWfdzwlLeMEvktPSI11LtcLCoyh0PFO0dvr
         c88RNnbKZWP6hROn3FKcwAjkTkXH2PbmSWFsf0LFIBZU9sz2i6kjpUYuQqKceDNC9m3d
         3VoK4gGmc8Km+VCEQ20vA+sl1Ckx2QpekcUTccXD125qVzCGUQgdPkeBJyvazypC7n1H
         bTMx7amD42WcLaqVd/JX/2+AwLvUyHWbSIuDx7ikJRh7jHZ/ikt0pFHjp2Ee5mlEVHk8
         1ONDqJfOED8UGxIlNIeagDUVc0mCxr9l3HEqqEQ5fwyWmmSXC+izh+TR7ImEYNQ+DoE3
         YKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nCbChdrLyaLbkeV86imhEZZQMfLmIqNy8p3AMtqNx3w=;
        b=Kcexfm9klo/yQRn8ydETVtMaPrezbL8ML3xO16jkWSUuwHyNRAh61xqbO2gNMd5P57
         b8FxIAIN2tU5y2BnJAD03igIlKbJfhNrzc0iPTJWrElc0fZqAWRVLRSBrtFTEqtQ976Y
         TdoYXRhKO0tzj4QCa0D0n2SHSAqSxZ4PLvOBFj9ZCisaMaNf8JzOrt55XsCB3qmzRkJB
         JvMJyJiiq2EgIbmfGjOCPEk5QvO6nIVljbjIHlL+rTHNafxiyAZYNikAtl3MNFmo+kO/
         mF0B7fSY0RGRyEA0bshbt9+h0/1dKHi7IE7m1ZWvn+NP7y7QGCNgF/tMJw8XsVOdprt4
         ahgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si19507033qkm.96.2019.09.13.01.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 01:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8h5D-0006BZ-Gi
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 04:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4v-00067Q-SC
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4u-0008JE-RF
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:37:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38432)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4u-0008Iw-MK; Fri, 13 Sep 2019 04:37:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB85B8342DF;
 Fri, 13 Sep 2019 08:37:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF0D060F80;
 Fri, 13 Sep 2019 08:37:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:15 +0200
Message-Id: <20190913083615.14719-7-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 13 Sep 2019 08:37:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1 6/6] amd_iommu: Let
 amdvi_iommu_notify_flag_changed() fail
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
X-TUID: HMl2rFMiawIE

In case a MAP notifier is attempted to be registered,
let's simply return an error. This latter now is
handled in the VFIO code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 137ba367db..09dee48fac 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1476,7 +1476,7 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMem=
oryRegion *iommu,
         error_report("device %02x.%02x.%x requires iommu notifier which =
is not "
                      "currently supported", as->bus_num, PCI_SLOT(as->de=
vfn),
                      PCI_FUNC(as->devfn));
-        exit(1);
+        return -EINVAL;
     }
     return 0;
 }
--=20
2.20.1

