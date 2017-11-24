Received: by 10.223.159.82 with SMTP id f18csp2101519wrg;
        Fri, 24 Nov 2017 05:31:06 -0800 (PST)
X-Google-Smtp-Source: AGs4zMavRwqnTNUkhaUksWPGlsgLFi6QQk+m1f9VFgMz7bfDXSQTkGsbjzupw+OfR4wY9wccLeQT
X-Received: by 10.129.41.18 with SMTP id p18mr18928902ywp.245.1511530266045;
        Fri, 24 Nov 2017 05:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530266; cv=none;
        d=google.com; s=arc-20160816;
        b=ut1tNPbT83IVJH9uGRURtl661zumuQWODfRL32+wkQD9SpKRfL+FRlgBbPWo9C8g7H
         OGMXTtTxbZ+ncYxd1MM9I9k5IQhlMVRjah4Ngqd9lfDGyzFS7lqNen/cilB5eC+GYR9P
         YIvOmNZ93ZjqSVtUXuX4UiD7CrBA9J+IiB59h54blBobbXQm8c3Pm7PlRgPBEZCOBDKp
         5cDUHgN2ujV2wN/OT8xXO5phTtkIl2tRBbW9sbCv+epXf7S+MSQCApUNh2ly76Kx0cO0
         1fEtG7cBDXZDUxN2imWOee6n5Dofq4eOfey7ctt+4UiWOCOUL0OqrrsGnIXscpDT1SV3
         Jlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3Kn6xdst83dgSo3faqbNB6p/REdP+nNOktTzxBaYSZA=;
        b=vpMfrRbwtSyRrDKkH9r9yjm//kksojtSdYchNeuKnHT6jiH/SPFHQ+1C+v9Yo8x5LS
         CvLyBOvvfj5T5wDQR2BdMj+q9d5shi4K4v7MczYk0MGppPauHdkfsg/abiNT0c/HmxR5
         5nfM6Yh5/4z/jevv934XX2F59hG10vmHq073if4b0TaCgprewkCG18340vFZnsHHLChg
         +c9Ja+fxXvQwJ8q2DcLR4Rf4oQX1SihX1Xyp0paRGKTrlUtJmrCdgUfm3/jOLjoxJbrV
         37DGncDxBHm1KJAEFozoQ72k6BU+bOrgap0WWjg4wNAe1gfQooPpayl3EiM0bGy0FqfI
         VW5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si1022715ybk.450.2017.11.24.05.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:31:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIE4P-0001TI-Df
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:31:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIE4F-0001TA-Jl
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:30:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIE4E-0001p4-My
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:30:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIE4E-0001oq-HA; Fri, 24 Nov 2017 08:30:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BE99C0587D2;
	Fri, 24 Nov 2017 13:30:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AFED5EE1E;
	Fri, 24 Nov 2017 13:30:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 14:30:35 +0100
Message-Id: <1511530238-18318-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 24 Nov 2017 13:30:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 1/4] hw/intc/arm_gicv3_its: Don't call
 post_load on reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eijlCVNydKkb

From the very beginning, post_load() was called from common
reset. This is not standard and obliged to discriminate the
reset case from the restore case using the iidr value.

Let's get rid of that call.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_common.c | 2 --
 hw/intc/arm_gicv3_its_kvm.c    | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index f2cce59..2bd2f0f 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -131,8 +131,6 @@ static void gicv3_its_common_reset(DeviceState *dev)
     s->creadr = 0;
     s->iidr = 0;
     memset(&s->baser, 0, sizeof(s->baser));
-
-    gicv3_its_post_load(s, 0);
 }
 
 static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 6fb45df..b1b322b 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -155,10 +155,6 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
 {
     int i;
 
-    if (!s->iidr) {
-        return;
-    }
-
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                       GITS_IIDR, &s->iidr, true, &error_abort);
 
-- 
2.5.5

