Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2906318lfy;
        Mon, 24 Aug 2020 15:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi6+rlzinPwdwZtJBrO6kJ0DJk/9vjsEWPl/CX/rAISO2CAxqrWMIrsRnTMbFR3mLQPb9B
X-Received: by 2002:a25:25cc:: with SMTP id l195mr10588093ybl.383.1598306411050;
        Mon, 24 Aug 2020 15:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306411; cv=none;
        d=google.com; s=arc-20160816;
        b=gzrsjFVShJiUqc6f3QmjAJgnf+0UpiNGE/SuWPiQOuk8jJ792R88weExGWo0l0zac4
         u9uIpByLyQkb1Z6DpoVd16zmrUmhL3rKWAoy039gaWzNA2hST1pqhUm1KidnVXcAJjjE
         eBKChL/CVl5DcGxEn0S1DG0iVkhMZIjmX9qIgU4kzKqscrgi5c0i1mR9jmEfyK8drj0o
         pNBecr4Den1U76oHGO5wWni6PVJm+z4IrHf27qKV0frX1AsT2dT+kerECusaqgQMbObc
         nCiQGk2z4gp3oK2ezX+kj/PLe162VAsV/paOz1EJ2zduh8IVMMZLFOqcAOSjziCoQXRw
         DKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z7X2ws78eCmnTUnSlsjYISkwZZ/DF3s6qLQ+bT7y+08=;
        b=dC2C9OwRBQM9HlSC+h2GmteKvltXgcxVNi8lvVSnW0kf1Kj9p7grEVn/O3cjpmJ+cV
         FjU9YBJWQ4Oe0zLHvKeuYNN3RO4swSBz1gkJRENNgWXo7jW4kJflq8fv8YavlxBuhGa/
         WDWRQUPzA5vUIYU+RyGky6ZjfMMqO8irwAQSweT+dlwWeXFoAdYdMIWs55OvNyxHlRiz
         p49rnaewfpaGsEbLX0zBr0xRR/a3qPuw8+3+F9P/5q5QvoQruEIGyLJAqFZDLLladhwR
         uPm9f/ekM/krzh1akhDKll7Sc7YzYB8DEE8aeTRmproWkHJ3wvxiy0RchhWRpc/UFzup
         vsVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RXm39c23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si14826890ybt.336.2020.08.24.15.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RXm39c23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKVe-0006Fz-8Y
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVR-0006Ds-10
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVO-0008GU-GK
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7X2ws78eCmnTUnSlsjYISkwZZ/DF3s6qLQ+bT7y+08=;
 b=RXm39c23Fg7tW2jNHIGGX59lnT/ThAQ3qCTZwM3tHmRhAVUYPiI2vBXHtfoQL2xYukeGZL
 k2O7wiQjPEtdgw2kLEVYo1O5t0L9X7EqDL4W74xN+jgg0Yw5ORaralWzZW1rLWDM+c7BEX
 ZNU4PdaO4OKi0+ZnBCRu1ps0d0dwEFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-QX1lQLUOO3uYjF9eFZ0maQ-1; Mon, 24 Aug 2020 17:59:49 -0400
X-MC-Unique: QX1lQLUOO3uYjF9eFZ0maQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ACDD18A2246;
 Mon, 24 Aug 2020 21:59:48 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDFD55B680;
 Mon, 24 Aug 2020 21:59:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] xilinx_axidma: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:59:31 -0400
Message-Id: <20200824215936.2961951-2-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 17:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/Pp8X1Mu5vL

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/dma/xilinx_axidma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index a4812e480a..5ad8bd3d2e 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -634,7 +634,7 @@ static const TypeInfo axidma_info = {
 static const TypeInfo xilinx_axidma_data_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
+    .instance_size = sizeof(XilinxAXIDMAStreamSlave),
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_data_stream_class,
     .interfaces = (InterfaceInfo[]) {
@@ -646,7 +646,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
 static const TypeInfo xilinx_axidma_control_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
+    .instance_size = sizeof(XilinxAXIDMAStreamSlave),
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_control_stream_class,
     .interfaces = (InterfaceInfo[]) {
-- 
2.26.2

