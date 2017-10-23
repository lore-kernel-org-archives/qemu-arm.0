Received: by 10.223.173.229 with SMTP id w92csp1972686wrc;
        Mon, 23 Oct 2017 08:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tjaur5Nk8AmCexRuGnRxGHTZUOYhqnHdPoe/SWzlNieWwalmN3yxcqEVarnsiYUoB8HYcq
X-Received: by 10.55.137.198 with SMTP id l189mr20394313qkd.169.1508772987183;
        Mon, 23 Oct 2017 08:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508772987; cv=none;
        d=google.com; s=arc-20160816;
        b=j5kAKuky2vk3EHEyl7LXv2/Jq/v1c+8UvH4DOI6Xp4Obm5KJadRaqyztIEOhqfkwcR
         pnsuq2ta+oQMLBXqlTwbzHLd1IyXJAEpz5hLd7W8yDTCu5ymvXuxuYdBo4ucg7zUlVMW
         WF9odAvXhjG57k6VtzEsnfO/CwX0fXeBwoZEwYV52TYgif+KO3hfhh/GB1dNFqC+z8uF
         fJuikadH4ger3GlE1ei8bfd3ysB4skt+4fGc7r4eTsJJc4YtVXRBqiVSES2th2d33fGK
         I4ZOMUwFgF86/W0OLVnGPErkJd2jJawOEtpCexTik5UnnnDfd9agYeIO2rDFYKNXKgvh
         3QJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=NgB95v6eymBWs15BitWVAAz5vEmHpNLCU0kpYoPTH70=;
        b=phX5QJDkJBj/CpaNU9/mv8kQnTCGHtukUBqXxhNXQgumGFqgiGdEAeESYZ4w2E923B
         ZwqwJojzeKi48WQ5tnTJjAX98MIMV6Q6pE/gOal0EwyspyZp2UnyslWKaSu4X4tqUue+
         f94BiTUUsE0NN/iQJkTPPOeyW8fURgN2ntcpCIPnS97Sj1/I4pmHhpI6HLmhGvveIUvo
         vqp6hQbZcWD1ZJOGE+9GjZmxq8XOukkUkt3W/35kIiXu7dBfWiEd8OCDfEsIazNigmiK
         io8RSWYsxE0Tc8d1m64o/Arpl/7fSl8q9GebSriN/Cd0RJUctvWkGMUOH3ZQHg+VMNOn
         R94w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y36si3907585qta.196.2017.10.23.08.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 08:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6em9-0002mf-2b
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 11:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elk-0002cg-OZ
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elj-0004hj-PE
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e6elj-0004hX-K3; Mon, 23 Oct 2017 11:35:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98AF3C0587CA;
	Mon, 23 Oct 2017 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 98AF3C0587CA
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92F797A1E5;
	Mon, 23 Oct 2017 15:35:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Mon, 23 Oct 2017 17:35:34 +0200
Message-Id: <1508772937-21054-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 23 Oct 2017 15:35:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 1/4] hw/intc/arm_gicv3_its: Don't abort on table
 save failure
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
X-TUID: jro6xQl6q1To

The ITS is not fully properly reset at the moment. Caches are
not emptied.

After a reset, in case we attempt to save the state before
the bound devices have registered their MSIs and after the
1st level table has been allocated by the ITS driver
(device BASER is valid), the first level entries are still
invalid. If the device cache is not empty (devices registered
before the reset), vgic_its_save_device_tables fails with -EINVAL.
This causes a QEMU abort().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: wanghaibin <wanghaibin.wang@huawei.com>

---

this patch would deserve being cc'ed stable (2.10)
This goes along with patches 1-5 of
[PATCH v5 00/10] vITS Migration fixes and reset, candidate
for being cc'ed stable
---
 hw/intc/arm_gicv3_its_kvm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 39903d5..1ae205f 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -64,20 +64,16 @@ static void vm_change_state_handler(void *opaque, int running,
 {
     GICv3ITSState *s = (GICv3ITSState *)opaque;
     Error *err = NULL;
-    int ret;
 
     if (running) {
         return;
     }
 
-    ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                            KVM_DEV_ARM_ITS_SAVE_TABLES, NULL, true, &err);
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_ITS_SAVE_TABLES, NULL, true, &err);
     if (err) {
         error_report_err(err);
     }
-    if (ret < 0 && ret != -EFAULT) {
-        abort();
-    }
 }
 
 static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
-- 
2.5.5

