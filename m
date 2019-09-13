Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp480960wrp;
        Fri, 13 Sep 2019 01:40:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVysnAyJLQktJDYDmf7yCxpzHQlr/JQRUK8KmgWThj6rx5AUXhP8epTksk8wV8ob+rnAFa
X-Received: by 2002:a17:906:6805:: with SMTP id k5mr1163793ejr.50.1568364005034;
        Fri, 13 Sep 2019 01:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568364005; cv=none;
        d=google.com; s=arc-20160816;
        b=FfU1Kg6lFAPpWBEhomym//YqnXanJsCJFrZ63zHIp3vSNU3vdPVudo5MvdyaPIPVAi
         8z+snvsMDgB2QbazE/yViMF8tIRc3OjLDlCfS0c7TYR82htqiOg1RAIBqaJd0t3y1x7M
         rqp/H08Nm6+9nXxWmA0gZ8IdqOYZMd53a2NBcqeFdjcQyY8XeHrmIt2YAM1AB+SYycxT
         Ujc261ASR3BibjvPWntG0bAm+B4O+e6X3vL530PssFwvsQVdmkQqa2d3jjwzQkUs5FUA
         ughpH7ZxGNBA3xS/l5TAD3u/yNde7QiE4CQBr/F5CodFwo9LLcC4tG5flAJq2Uwh975t
         DugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dXuZIba3IHNaGBtDbBt2pmvhrEw6RdPsx/vKf8BwbOA=;
        b=ckRDfguih8O1+o80IVeC2tCSLsHo7dmT3rZ1btHSXKq1yWQBkifBFtdt9EfGJY9XVu
         s4JzIwNCzonTDAKSnJXiVnmaOkVdFcbK0aO0jWncxzaWXY6z0Ot3FxJNMP1jy4Pu2a3U
         pKKdUQP8TC/DDH3zkCgfr+ma925ALULdemUE5JxZsaiiMlYWOy+tBuYTHhUvY/vhyGp5
         FdnsZ3vS5atAxdExMcLAACOQzrqxk7Vx3Y5C9xZcNYyIShO3LkKS3yNGS8L2+Ddsp/eX
         046//PYUoeqLBQ5moqWYWGgibWsqIWBid7uMnOOfaMg+1mnmnlfmiL30yNPP7S+pBIOw
         a9ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si7476840ejm.157.2019.09.13.01.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 01:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8h7b-0000Yl-S3
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 04:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4t-00064A-A9
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4s-0008Hr-8K
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:37:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50080)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4s-0008HU-3H; Fri, 13 Sep 2019 04:37:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6795D18CB8EA;
 Fri, 13 Sep 2019 08:37:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A4C60F80;
 Fri, 13 Sep 2019 08:36:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:14 +0200
Message-Id: <20190913083615.14719-6-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 13 Sep 2019 08:37:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1 5/6] intel_iommu: Let
 vtd_iommu_notify_flag_changed() fail
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
X-TUID: 9HDR6O/g+11O

In case a MAP notifier is attempted to be registered without
caching mode, let's simply return an error. This latter now is
handled in the VFIO code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/intel_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 7a89ea9ba1..2f66d6882c 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2931,7 +2931,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemor=
yRegion *iommu,
     if (!s->caching_mode && new & IOMMU_NOTIFIER_MAP) {
         error_report("We need to set caching-mode=3Don for intel-iommu t=
o enable "
                      "device assignment with IOMMU protection.");
-        exit(1);
+        return -EINVAL;
     }
=20
     /* Update per-address-space notifier flags */
--=20
2.20.1

