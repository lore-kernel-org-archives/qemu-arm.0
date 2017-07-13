Received: by 10.25.44.15 with SMTP id s15csp2166631lfs;
        Thu, 13 Jul 2017 06:28:12 -0700 (PDT)
X-Received: by 10.55.125.198 with SMTP id y189mr4485099qkc.156.1499952492137;
        Thu, 13 Jul 2017 06:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499952492; cv=none;
        d=google.com; s=arc-20160816;
        b=r6PamasqMCuuWVq/tsXY0Bn1iDmjLiQ54c+daJlNwsDVDMTbg+cgNwBAMIrY6Z+N1Y
         99nN7PgrdW2H+rvKwWRlvRrGEXI5WIn+zrVBgwtiQAEtgT/j08AtzbNHIrqPWCM4jBSk
         wHJj61hSW4vaYcRQfnXEEvgTCuEpNvNmc7RsR9bOd8cwtJN844ymdAfXf/D5kSwIjX6n
         inumIZ77PTlKwiqtacR3SgwzoKSCw9Yqc6No9WmkpnP2uoHLrAnXbl8oxjoKIIkcM4PE
         14K1fewB6bZPweEppmUYwuMnQYNcPKZktagiFH2xHSIGIh/ECQXNzlqDuFU/nbjLd5jK
         bqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=YRcAlVUeyL2PzupYy1krk5LBnkuQ6D+s5ZiGU1CKAmo=;
        b=G8KjQsZF343iEjVvvXDSZvdffVRMu7lMZznvg94g91DO7z/lLEoxY6QSIHaCzS4HS+
         IzhjYJ4LDfNMfygYLdscC2f2lPmKqGJWRxnrGGZu2Uyj//lULnEiqPQDEIjQfzSo/fhr
         X8KxZLnVGQIk2O0YyStBADfd+HgClP87WguvBBMNMeRLGviDbqrIdnP0ItCUgGMhgaPK
         Jp4F3ZAQs1YPQgPxzRN4WEKJBqW7nfiMryw/ZzxfNneSzYZL+5WBlB9JM2hpNivowN+t
         YN/ttUomG1asCylHGhHuI85vkPm/rAPJJMPrsJyk4k/w3+7O+VbNeKivRJxJ4R4cRzuc
         zleA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id g38si5075258qta.349.2017.07.13.06.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 06:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVeA5-0008Vc-92
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 09:28:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVeA0-0008V6-HJ
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 09:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVe9x-0001Ki-0F
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 09:28:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23713)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVe9w-0001K6-Of; Thu, 13 Jul 2017 09:28:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7064AC04B929;
	Thu, 13 Jul 2017 13:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7064AC04B929
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7064AC04B929
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C5B67CC1;
	Thu, 13 Jul 2017 13:27:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4E1071138647; Thu, 13 Jul 2017 15:27:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jul 2017 15:27:48 +0200
Message-Id: <1499952476-3454-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1499952476-3454-1-git-send-email-armbru@redhat.com>
References: <1499952476-3454-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 13 Jul 2017 13:27:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 1/9] xilinx: Fix latent error handling bug
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EufSsf7umNKA

From: Eduardo Habkost <ehabkost@redhat.com>

Assigning directly to *errp is not valid, as errp may be null,
&error_fatal, or &error_abort.  The !*errp conditional protects
against the latter two, but we then leak @local_err.  Fortunately,
the qdev core always passes pointer to null, so this is "merely" a
latent bug.

Use error_propagate() instead.

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20170608133906.12737-2-ehabkost@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message clarified]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/dma/xilinx_axidma.c  | 4 +---
 hw/net/xilinx_axienet.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6065689..3987b5f 100644
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
index b670184..5ffa739 100644
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
2.7.5

