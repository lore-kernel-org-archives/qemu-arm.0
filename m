Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp926002wrp;
        Thu, 19 Sep 2019 05:25:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKBqpzReUer9hvJGuVqP7sYCjUQfz/LAik+tl01lrmcUAxi8ave1GS5c8ZsanJaQIA6Lch
X-Received: by 2002:ac8:474c:: with SMTP id k12mr2868430qtp.319.1568895921909;
        Thu, 19 Sep 2019 05:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568895921; cv=none;
        d=google.com; s=arc-20160816;
        b=nR5tJAZ6uek4xvv9x4+lbLuuknIXUAfTmLAr13VIhm9R38Y4ejjWvpTAdiM2nxuV/h
         Ck5rpVjJQmj/PtMfhVbrKcL2DaQh/ZKIpM5q/zGpYMeiQ2NE4fS/MpzepjmpxB8dLFvc
         lkOtrNkcBEC2LMn+4s8PwSJmTrh7jdFiquvRdN3fTrqGVEbk8JSna5Y5jdFT9II+Lm3b
         lteOHCFKnFDo0qZ+AguGHfqOnk3QhgaSpeOjs9F3rutHTXYTep75Ig2gyU+sxh08DuF0
         uxhcD+gTjxxmtz/0ANk19x61zSmicGQNvSiWJQ/nFFtU7vd/egKyhO0hpdKvugV89WDP
         eZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nCbChdrLyaLbkeV86imhEZZQMfLmIqNy8p3AMtqNx3w=;
        b=hiFbJrZtB2bk7LXrq2rguy9RZQ+aL4DmcfNEKnGHasnzfXO9vj67knkxXxvMXQ2Q6Z
         0cwNHUovxVUMXdYFLKgX1wUlXQDSrgcJJhntJ/0zA4SHSbr0tR0BYiXyzGtqzp56KiZw
         FP5xV7VtZ5Lr03qyaN5SaHwOl/D7dH0AQ1w2OWzJuAdslVyKBuvfvKJ8v/Wqf7E+4yHV
         jg8NhyOiOSC5ayYK2vqZKWyvPhN5RBF0+La/4Y3tZT4C3epg+Mm9KS13Gx6ZWAG9DfpM
         utcW3r9vv+yY8DES5faFznJz3gB4IOhQICkNJ7HiwBM58wNKV/xHLRNTsw/2czfeHmSx
         jmDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y38si6476023qtc.209.2019.09.19.05.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 05:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAvUv-00039u-1h
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 08:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvPF-0005Op-IX
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvPB-0004HJ-1g
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34206)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvPA-0004Fn-QW; Thu, 19 Sep 2019 08:19:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0EA937FDF0;
 Thu, 19 Sep 2019 12:19:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBB4060BF1;
 Thu, 19 Sep 2019 12:19:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:45 +0200
Message-Id: <20190919121845.29520-6-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 19 Sep 2019 12:19:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/5] amd_iommu: Let
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
X-TUID: g/iaglD3yKaS

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

