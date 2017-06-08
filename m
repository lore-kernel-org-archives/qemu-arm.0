Received: by 10.25.0.23 with SMTP id 23csp2586841lfa;
        Thu, 8 Jun 2017 06:41:10 -0700 (PDT)
X-Received: by 10.200.56.83 with SMTP id r19mr42389200qtb.174.1496929270768;
        Thu, 08 Jun 2017 06:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496929270; cv=none;
        d=google.com; s=arc-20160816;
        b=nfekUE9qi2WyBcBDZraJCq5lXgW1JyK+uVstmJ89ef+2svXo/B9o9B7c4OQ7keOzoN
         K2T0hrNm4X7nYltcyoM7oO4lL46t39HvuOj/XAUSFbSriSf4IfPfKUo/AWkLYhStXKn8
         eZ5Vg0NHGRCwWmqGqR15ghx7UzTSRcM2CyhGsf/cPMWY1dROyF56nAxVPed0x9J2V0Ds
         NlhqESROrqymd3blNTuAbqGJQ9DTQzi2dOPbaIO6rOKlvEl7gRX3NBgTtdORNBTf8+ny
         fhlCHy+JCHQQl+LL9SfLuu1ovM3oFDJLmUv/fFSEl2abnrlxLD1ozPUcS4dcF+EdHxvl
         EMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=kox13W7g23lJkvnSNn0Na0ofCRZtPpRTxOXhmR+sPdw=;
        b=vLNjfR275b0ocLkrB2/vB0w6kA5fTWLXy7zyA6pHVvtpwztMWvdLzY7FIm0oKhyOmS
         fikp/P9KAUx+2wwkXZ+84VA2pJ++uzEceDcfdQWAkAQcvVwwLN31FYiZy/InBkSByoxf
         SQ3yjrcKCNl7gxlUVIJ7cXLQ7n9HpJgnTylyTnBi00I4ywhUmV0FAkWkjhT5ZkhDDxBi
         5BlfPNxqrvJukaTtBlCrT4FSEWIKB+eVljohBnQExQDu30SMB7waNYQdfYDYAa96tvPL
         oSeLh+HI85BCAFKeBMa/mSsqRf/ZFU1CQ7Jf33cKgHvvA3HZHeVFSx1sYs1S4QWtSrvg
         Gu3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g14si5402547qte.292.2017.06.08.06.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 06:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIxgR-0003M3-W7
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 09:41:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dIxed-0001bM-B3
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 09:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dIxea-0005Nd-KW
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 09:39:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52154)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dIxea-0005Mi-Ex; Thu, 08 Jun 2017 09:39:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DB46C04B955;
	Thu,  8 Jun 2017 13:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6DB46C04B955
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6DB46C04B955
Received: from localhost (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4BB98D1A1;
	Thu,  8 Jun 2017 13:39:10 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Jun 2017 10:39:02 -0300
Message-Id: <20170608133906.12737-2-ehabkost@redhat.com>
In-Reply-To: <20170608133906.12737-1-ehabkost@redhat.com>
References: <20170608133906.12737-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 08 Jun 2017 13:39:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/5] xilinx: Fix error handling
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/ID4YChjM2t

Assigning directly to *errp is not valid, as errp may be NULL,
&error_fatal, or &error_abort.  Use error_propagate() instead.

error_propagate() handles non-NULL *errp correctly, so the
"if (!*errp)" check can be removed.

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/dma/xilinx_axidma.c  | 4 +---
 hw/net/xilinx_axienet.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6065689ad1..3987b5ff96 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -554,9 +554,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
     return;
 
 xilinx_axidma_realize_fail:
-    if (!*errp) {
-        *errp = local_err;
-    }
+    error_propagate(errp, local_err);
 }
 
 static void xilinx_axidma_init(Object *obj)
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index b6701844d3..5ffa739f68 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -981,9 +981,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
     return;
 
 xilinx_enet_realize_fail:
-    if (!*errp) {
-        *errp = local_err;
-    }
+    error_propagate(errp, local_err);
 }
 
 static void xilinx_enet_init(Object *obj)
-- 
2.11.0.259.g40922b1

