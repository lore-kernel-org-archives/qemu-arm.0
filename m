Received: by 10.25.44.15 with SMTP id s15csp4051865lfs;
        Sun, 16 Jul 2017 19:43:27 -0700 (PDT)
X-Received: by 10.237.36.107 with SMTP id s40mr3331210qtc.137.1500259407512;
        Sun, 16 Jul 2017 19:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259407; cv=none;
        d=google.com; s=arc-20160816;
        b=wL02yMxJm7I3yQ2l/SuxzYTGr+ZCzhJ9KknMxkZexw+kKzxFysxcZzmSXsOSoBb+eU
         2/TtpGHlfhBn0JvxIblh/NjYVfL7MYehd/UIDxKJ70AZoDZgmoHRLX+M6Qszl1WOspnE
         syD1nDUotz3klWTiRRTkNwoX4+bEEoL8SZvn9oasWMyW1NAgHGIiOkwemjB5vYiPBsim
         dyuyo2j7RkB5+IELC0BsofnIUTjF+bSh2lkHr3wFJy9WmAgQk2tEIBG2tYc77WIv4mB1
         35XW7WPuKL01bhC6A0PjvgEkx5FMJrHbjKPkCKtBd1Wo10lxqYTa4fcVkzoUCJKzPBaz
         31iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=4ys7ZGCD9qDo83uPn91dRUr06DWgpwrUK/5vK2RyRBA=;
        b=KoFTo/yNxXtUG6oKNbB1DFIwozUtFjcpUyZBupIsweIolRZAwvTlXAufTyIesOoiXt
         IpasRZLy3bdGb+6Z1wQEw9LKHNPQpnE6XzLyUvIoLLBzZ2GcSFYSCMrjFVbr5GrFLI/R
         XMFmFRnqQuWP+QfqDjeYQKK4t0lwfheg/wst44eD/emEP5ZrRnQO5U849AMFVY818D23
         0BXTQfz1xplKxX0MBDYVmG4yl06U4vUn+e4Uxo2oNY+n0L1ueLvzEbA27goZHiazh00M
         HAV9Pa3RrvAcSmg2kfd5CZwFkgJlsVB+dtcNEzT1/O0IiPT8HmrEbOedOQv5poTuxiiV
         r0gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w5si14132274qkc.373.2017.07.16.19.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWw0J-0003rA-Rl
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:43:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvs-0000eY-Ug
	for qemu-devel@nongnu.org; Sun, 16 Jul 2017 22:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvs-0001c4-37
	for qemu-devel@nongnu.org; Sun, 16 Jul 2017 22:38:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvvl-0001ZG-Kd; Sun, 16 Jul 2017 22:38:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9572C85547;
	Mon, 17 Jul 2017 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9572C85547
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9572C85547
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC7B6600C8;
	Mon, 17 Jul 2017 02:38:38 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:24 +0800
Message-Id: <20170717023824.18796-7-famz@redhat.com>
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
References: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 17 Jul 2017 02:38:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 6/6] xilinx_axidma: Convert to
 DEFINE_PROP_LINK
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82GaX3Pd3J/X

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/dma/xilinx_axidma.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 3987b5f..9b48103 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -562,18 +562,6 @@ static void xilinx_axidma_init(Object *obj)
     XilinxAXIDMA *s = XILINX_AXI_DMA(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLAVE,
-                             (Object **)&s->tx_data_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-    object_property_add_link(obj, "axistream-control-connected",
-                             TYPE_STREAM_SLAVE,
-                             (Object **)&s->tx_control_dev,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-
     object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
                       TYPE_XILINX_AXI_DMA_DATA_STREAM);
     object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
@@ -593,6 +581,10 @@ static void xilinx_axidma_init(Object *obj)
 
 static Property axidma_properties[] = {
     DEFINE_PROP_UINT32("freqhz", XilinxAXIDMA, freqhz, 50000000),
+    DEFINE_PROP_LINK("axistream-connected", XilinxAXIDMA,
+                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+    DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIDMA,
+                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.9.4

