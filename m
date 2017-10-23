Received: by 10.223.173.229 with SMTP id w92csp1972868wrc;
        Mon, 23 Oct 2017 08:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ThKh2NhmWp/n5BNWD8pKPCjeeBpeX3v/uYS2MCTCo1WGrIe1kn9Bi2+UntdQCulOtAZZNf
X-Received: by 10.55.158.78 with SMTP id h75mr18067294qke.355.1508772997624;
        Mon, 23 Oct 2017 08:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508772997; cv=none;
        d=google.com; s=arc-20160816;
        b=DFKE1G+sAwuM7Pe6wY4PhOfDZIr6f5cbYN4d6xdJfonJ7lgwXGOFkQKXCWVwjf8RSE
         g4s4Sx9BXg4J06QslaR8f89UaPhVylvry/yJx+4ELthdlZqoNJRsM5+WTrizy25Mgy7Z
         DVy8QDNrya9rp2KXkmUnpYOnLl6RxXYTHQj4RoSbbphMuCr4YqhdzFDk5D3ovACtxPl/
         TH1pk+UW/QaM0Hr7SOZOdA3tMZ1AfMKfAw6bnwnKumpabHXND6tNLLnDB0OXwlP4OBxY
         yCzHcTAx2XKZKypwN4WxjnEL6f0OOjRgQkvu3GXUL8I2JZBZQ1wMyEFsWGC0pUZV+hNf
         k8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=M8mFTIuT8M1l6Cp54oEsBj6eh505/XJ3TIyYa908f1g=;
        b=nYC+T30HSWlV5aCIbkPrrP6DjrwTxUgvQan8GldwbnQhvzsWu09qABLapTf9rf7qiP
         y0jMhHIgnvo61hfA2WTXRxAVhESI95MAjHBAfs8Y1UYv2ZsOCnaDcI4zCja5x1h1HXIo
         m/p5aGKq00TSDS9R7lVdMYebrZDll8WVOBwj9hnomEHHg4e+D1W/SSNGODupJlngn7dH
         iJ43KC90LDah7zCmejRhxXGbbcQEA9FusDPdjx9iAM3hmMhLZzg2hn76H0IZX2pa8qKO
         A+4Y27i07PA0CfYvSf/N15erw8iIvPQVUow0iy+FI9mahOIHt/J8u2gXvDBksU5vk/lx
         nAYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si2535193qkf.342.2017.10.23.08.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 08:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6emJ-0002vs-Aa
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 11:36:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6em3-0002pq-8z
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6em0-0004nv-18
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e6elz-0004nZ-RS; Mon, 23 Oct 2017 11:36:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDBF06A7CB;
	Mon, 23 Oct 2017 15:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CDBF06A7CB
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F19C1795B0;
	Mon, 23 Oct 2017 15:36:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Mon, 23 Oct 2017 17:35:37 +0200
Message-Id: <1508772937-21054-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 23 Oct 2017 15:36:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 4/4] hw/intc/arm_gicv3_its: Implement full reset
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
X-TUID: lcyyFUBDO+kC

Voiding the ITS caches is not supposed to happen via
individual register writes. So we introduced a dedicated
ITS KVM device ioctl to perform a cold reset of the ITS:
KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET. Let's
use this latter if the kernel supports it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_kvm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 537cea1..73e2530 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -215,9 +215,19 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
 
 static void kvm_arm_its_reset(DeviceState *dev)
 {
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
     KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
 
     c->parent_reset(dev);
+
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
+        error_report("ITS KVM: reset is not supported by the kernel");
+        return;
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
 }
 
 static Property kvm_arm_its_props[] = {
-- 
2.5.5

