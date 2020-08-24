Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2905306lfy;
        Mon, 24 Aug 2020 14:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJE7CcDVyQCbEhusn7r7/qLCnpZFjzyPxHvNEU2vuN/g9+9Zwts9z+avIL7eiRapjIAqqW
X-Received: by 2002:a25:5d7:: with SMTP id 206mr10948121ybf.512.1598306306210;
        Mon, 24 Aug 2020 14:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306306; cv=none;
        d=google.com; s=arc-20160816;
        b=FYJRBqSj/y3dqIyHQHUepX5jNxSbIoGMPwYoq5eJK7tQnGgTbnV32K1ho9C4bud56T
         EFdrPwP/RIrQzdPjvgHVh5RjHkJ7zY9KlFdlQSppFpqATOkNNTuY51z34MC+63jlDr0a
         W6vQ7tFiiPz/MMcl8MaSRruyS0reO7Lsx4rY8kppsf3G/1rOe6fB5gXH2uXKNl3yGRXh
         ttzIR/44gxm09nl+ZrHyf47VZUYfCoQuDdC5AwUCxNAJbaFIaS04Er8NEdt1+p2JrgjD
         5yQpqUJdwYvmSDvVF7Q2jkYCjgNLmg1MU59ROFeXNIn0yDNYq++okB4BBf4YjnzcYoS+
         oQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z7X2ws78eCmnTUnSlsjYISkwZZ/DF3s6qLQ+bT7y+08=;
        b=h481jVWnGAaFAoagwRJeG2+Sz70Hm4wC4d0bbA8a1bQyfmleqY1DVL+lvjtkVrn/p/
         x0TanMPgY0gtvgajfFgxsuQNyCIFY0tbymHiBce5GGxHaXIA/8gTffXEiLhPzL5eWTkJ
         nzTXbw/+tH/8kzXsG2v0yvW3AbYw+RqohPIgoOm17mItxZCeDKWilEmbWbTrKMok+vFA
         7pqePmbyPZ5SyRDNFklGDUVWx+h9JoCJBGiq5Z41HIaQ3q6rPx2TISnhWQOGzqxaRdjs
         Ftxv/ycOMSBaqfnLl5iPbDOUB8yKJbTEJlYHtzQ9BuPmJe+SaaOR8vWtLIBGRBGKSQVh
         1kKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U5bku7uc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si12343746ybc.52.2020.08.24.14.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 14:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U5bku7uc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKTx-0004aG-Kn
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 17:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKTF-0004Bv-L2
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:57:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60801
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKTB-00087w-T0
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7X2ws78eCmnTUnSlsjYISkwZZ/DF3s6qLQ+bT7y+08=;
 b=U5bku7ucrB6x0/bDccHPCYkBDgwp8v2ogG3PAqVdPAyXG9PWgBhDlngyhOD1w4DCqKKe+S
 RIz45WHvs9dt4Q6Hd4lZR40RHOfxekyZaNJ67Slzwsx8/EUXxiNud6QX55d6kfZrbgqFxC
 Znth92bUhc2JzhQKTXckL/Obq/gp7iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-70wxgYOUOayzoBBmJP-nzg-1; Mon, 24 Aug 2020 17:57:33 -0400
X-MC-Unique: 70wxgYOUOayzoBBmJP-nzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03DB31074661;
 Mon, 24 Aug 2020 21:57:32 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7D8160C0F;
 Mon, 24 Aug 2020 21:57:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] xilinx_axidma: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:57:16 -0400
Message-Id: <20200824215721.2960162-2-ehabkost@redhat.com>
In-Reply-To: <20200824215721.2960162-1-ehabkost@redhat.com>
References: <20200824215721.2960162-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 16:48:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jhTJOIf1mRxd

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

