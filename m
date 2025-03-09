Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607637njc;
        Sun, 9 Mar 2025 06:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVAag37txlT3F55YjQKDXHNesVS8c5m20jsHl0/X4ASORrxaVg1TPqap1UV0RkwsL66Bhtz1yMhVMQYA==@linaro.org
X-Google-Smtp-Source: AGHT+IEnpjo0wa3rRSHJML3mDwaPPC4UE/kRrgZe5SHa5WWi69UFrBczPDcYo/BnwIovMWTCOAdo
X-Received: by 2002:ac8:7f10:0:b0:476:884e:52f4 with SMTP id d75a77b69052e-476884e55aemr9060961cf.12.1741528561628;
        Sun, 09 Mar 2025 06:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528561; cv=none;
        d=google.com; s=arc-20240605;
        b=VVMwoFb2GE1HofSKMVd2YEmVi33liwKCFPaL2gQ8wudCDsMUesAAuTacI8ntcCBQFE
         4arVbCIWv6amkhHWW2owqmJ+KCrddGrUh1cxTQRuHM7e4VjXE4oqISLBC7zn4T42uUfC
         5WBupU6ASGcAvw1/Qwc8ES3JguiqxbUVE/NkXGfhAAdbZrmOnpIdB2lFBCMBcI+03sDS
         qQNIS7D5LS7O+SZgAZVJIc6FX4EzQ3MSAjlXzlwyySaFEe8/LUuaMXUY5xdd52/xMq68
         tgz8blqFHanregucblic463A8rthCV7EB3bI8Mns1BufeoqDSfvdTNx/lXmgFvrSzOc1
         B8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZILZxH//9yn/g2fOnN0KfFlhn2GnvQe89qPfzDlhjUE=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=RK1H06o7IRh7zjvUYfVU0HdfFS6hqMywnWC0X1Zgd/2REn0Kv3oBTgnWCADfkYm2rP
         M4VmxwxksHk1zH8/Bd6WyPmlOdE5IvFGOFb7W1mWvMW0mvDQr+MQf5T5H6IqTymZ5snS
         vSTixHYu/w3B/FMgisYQIPGuVidojDJes2PcRdNPIa3ffgl6BECn17RN7BxLUrpBXd2z
         xJF+aQ8WIZCuZm5RtBiWFCIuJ/SejMSWRdyQadq1iFInzRA25BcogtD70yMhIikhTw/E
         uo6UlCB5WziG4ztLVICoHSLuwroIlfg3JD/GGFkA3FcJ5F0trgBeJjg81k+RJxa3YmOx
         4beg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SHvgayEQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4768755ae0asi4292311cf.56.2025.03.09.06.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:56:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SHvgayEQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH5S-0001L2-7r; Sun, 09 Mar 2025 09:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5J-0000s6-3E
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5H-0003Jr-76
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZILZxH//9yn/g2fOnN0KfFlhn2GnvQe89qPfzDlhjUE=;
 b=SHvgayEQHMFh0i1vtim0omqh5HUgjEVgkWBN7vmMVsoaZsROxbB7ww61ODyZp66ECk7PlK
 jWKYlWvvMDIpRsw07C4l3eli5DAg9Bb5t/db6QuWVf5EtehqCMqXLTC1m+g+LjORn1ZQ7R
 JCGaJ3r8m2V+Hm8QIn6DEcnSGZQoSGM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-jkouy0OMPpGPoi_viehCiw-1; Sun,
 09 Mar 2025 09:52:43 -0400
X-MC-Unique: jkouy0OMPpGPoi_viehCiw-1
X-Mimecast-MFC-AGG-ID: jkouy0OMPpGPoi_viehCiw_1741528360
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9F4691956080; Sun,  9 Mar 2025 13:52:40 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0DA4A1956094; Sun,  9 Mar 2025 13:52:38 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 27/46] hw/intc/aspeed: Support different memory region ops
Date: Sun,  9 Mar 2025 14:51:11 +0100
Message-ID: <20250309135130.545764-28-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ahX4kbTH4twT

From: Jamin Lin <jamin_lin@aspeedtech.com>

The previous implementation set the "aspeed_intc_ops" struct, containing read
and write callbacks, to be used when I/O is performed on the INTC region.
Both "aspeed_intc_read" and "aspeed_intc_write" callback functions were used
for INTC (CPU Die).

To support the INTCIO (IO Die) model, introduces a new "reg_ops" class
attribute. This allows setting different memory region operations to support
different INTC models.

Will introduce "aspeed_intcio_read" and "aspeed_intcio_write" callback
functions are used for INTCIO.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-11-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/intc/aspeed_intc.h | 1 +
 hw/intc/aspeed_intc.c         | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 208e764c4ade..3433277d8715 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -43,6 +43,7 @@ struct AspeedINTCClass {
     uint64_t mem_size;
     uint64_t nr_regs;
     uint64_t reg_offset;
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_INTC_H */
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index d06e697ecc2f..d8ee6e1c0406 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -332,7 +332,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem_container);
 
     s->regs = g_new(uint32_t, aic->nr_regs);
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), aic->reg_ops, s,
                           TYPE_ASPEED_INTC ".regs", aic->nr_regs << 2);
 
     memory_region_add_subregion(&s->iomem_container, aic->reg_offset,
@@ -359,12 +359,15 @@ static void aspeed_intc_unrealize(DeviceState *dev)
 static void aspeed_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
 
     dc->desc = "ASPEED INTC Controller";
     dc->realize = aspeed_intc_realize;
     dc->unrealize = aspeed_intc_unrealize;
     device_class_set_legacy_reset(dc, aspeed_intc_reset);
     dc->vmsd = NULL;
+
+    aic->reg_ops = &aspeed_intc_ops;
 }
 
 static const TypeInfo aspeed_intc_info = {
-- 
2.48.1

