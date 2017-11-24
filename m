Received: by 10.223.159.82 with SMTP id f18csp2158521wrg;
        Fri, 24 Nov 2017 06:19:04 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaNbOFX5tSFuDTKN8pz4Fv8B98wUpVGCwIlfq1vrNo6w8Zy+oQiKmpiBBEtd1kzjGA0MBJ1
X-Received: by 10.37.185.66 with SMTP id s2mr1951462ybm.11.1511533144631;
        Fri, 24 Nov 2017 06:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511533144; cv=none;
        d=google.com; s=arc-20160816;
        b=cNpFoJLL+UrYlhvtxpC47hvHOW/XLTz0RAmx0fYhxHENnCgyYC49QdtFmVPCMEQch1
         WTL1VV8Lcs6qXZn8Z5jD9EepalgTlNUPskLlzrGrwzeor6GCf+eQoDRo0I3v5LY1OKMq
         EyzMCmJQYAPHke/savKBiVMLX6bzENpo12qCyq0w393mV/dLT6YvUAilp53h5ylhMdTr
         ZAyNNEjALGgVjWkNEv3KTi5x5cSakMbAEmMZ71nufHnsxExR7gtAnnucjSrhpBRy6sBv
         GcoDrTiLA/YX32OUdCWXsYHtUhjFS/gI5p9rPG7ReUiOpOUTKyyrCxKushLPGKq4GAqB
         DvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1zTl9UBMPDy4b8miERsmEdftFZCWLG9sfAeeh/yCvgQ=;
        b=L7Uyi6zIJpnTGsLmzWpf09X9VMoslHpmwaBf6XqF3NJQC8cGphSIQKSKy9lg2QkM53
         vEMrY0WHJZm+abvlBTq0XJNBq5ar87RyICWby3HLjb8DgQEykGfPCjWMoWfN6KqLkW7Z
         cFxtwtWJLUm+dwLw+xD0LFua1S04SVOhaYXkyGPm1R5R+GsU3s8ir0Q9pzSe/v578CjO
         VDokHb5Iz4JoN/ews9LhdQLNdqAXrzGCKoqqhWiGHqooGZ127r6h/LIYhsTg4U3OIMMy
         72ZojbcdWTlgD7jtFku0R1sevlEswaigBHbqMmwmULdTfaoodTmLtiPBBSDZ0xqPAFeo
         ijAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p186si4862557ybp.695.2017.11.24.06.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEoq-0005OS-3N
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:19:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEoV-0005GV-WD
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:18:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEoV-0001Id-6s
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:18:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIEoU-0001I8-Vu; Fri, 24 Nov 2017 09:18:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E05C780F9F;
	Fri, 24 Nov 2017 14:18:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3A7A5C7B9;
	Fri, 24 Nov 2017 14:18:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 15:18:24 +0100
Message-Id: <1511533107-5315-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 24 Nov 2017 14:18:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 1/4] hw/intc/arm_gicv3_its: Don't call
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
X-TUID: tX/NBEZOgFbH

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

