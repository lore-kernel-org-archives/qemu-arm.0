Received: by 10.223.159.82 with SMTP id f18csp3040020wrg;
        Tue, 28 Nov 2017 07:41:59 -0800 (PST)
X-Google-Smtp-Source: AGs4zMawQVLz6sxLt8WcuEG/EppsGvIQVAh+fH5HV0iAh18XqLE3euGByKHhM30whqHZWsuDn6oi
X-Received: by 10.129.119.70 with SMTP id s67mr27286593ywc.410.1511883719630;
        Tue, 28 Nov 2017 07:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511883719; cv=none;
        d=google.com; s=arc-20160816;
        b=Isua8S+tfUxNiPMj83BTHxv47B1qSfOOzsHw4Di2yhQZXIsJr2dUgBqRTtsBoUWMxS
         NCFUDZv0d5D4gVDfZtmYoufaLWVg+0HGxBNFaww6aZ8RN4BwhbxFHjlQD2IuNEXk1CNM
         lar640PNfL+5oTMtrs3QyLSFvETnYpoCJnECtUtrojI3QswigIDI8DHQIFFjluEfkdvt
         a2fnZ7Ke/OKllaKeyKjCioW1Q88o+7kGeJ8kvE9j54Sj+rr54qoduHcSFUf6+sB1C+C7
         kUqkVEzezGO5OlvAyL9O68rSpaPh/lRrbWNxKCCQLWDha+H2qPKS75VzKesYmpLSCx4e
         EFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1zTl9UBMPDy4b8miERsmEdftFZCWLG9sfAeeh/yCvgQ=;
        b=Vo5DK4iUkOvebz4YZLQp/gzXwNxLrrOslUXtFcNL7GHjGSw6CpaKf6flUgBO3xoTy5
         MZFUEWhUgeKoABIxPabTq58Jk2AZu2g2LFXzPlzf0xPLUJsprkrW9+hD4iFbhJ30W1od
         niX9acK/5/mFC8TBC/4vHkOOiRYzzGzREri4tAlP0kfcbjXO7md2D4BQ9jP/oBdNUMhr
         /Tw7EnRtm4q+54vmMc7u6jopYZSdvWEp8fKyMeZ4biNzyVU70wgeEYYOI3ttKOhdkyWy
         KjKEM1+y8N5ZSACxqa5fFhi77clr6eDO4QOmTGElp2vvZiPIVK9aFpe9Zaa00PDhPAdC
         Bf0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si6490298ywg.512.2017.11.28.07.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 07:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJi1H-0000oT-3O
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 10:41:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eJi19-0000oA-Vh
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 10:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eJi19-0004s2-5N
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 10:41:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eJi18-0004qp-V2; Tue, 28 Nov 2017 10:41:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD222C04B31A;
	Tue, 28 Nov 2017 15:41:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43D095C1AB;
	Tue, 28 Nov 2017 15:41:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Tue, 28 Nov 2017 16:41:29 +0100
Message-Id: <1511883692-11511-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
References: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 28 Nov 2017 15:41:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 1/4] hw/intc/arm_gicv3_its: Don't call
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
X-TUID: ykamwFeASK0l

From the very beginning, post_load() was called from common
reset. This is not standard and obliged to discriminate the
reset case from the restore case using the iidr value.

Let's get rid of that call.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v4 -> V5:
- added Peter's R-b
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

