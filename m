Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp92916ejb;
        Fri, 14 Jun 2024 00:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXL/r0LZ47MewL6yXa9yZ9nb7VGk9/7BlXJznIaK2Dxde+eiArMj4/JzVK4nODTBkZX8az2KP54+DLMQs3bMG7AgNN8ZNLV
X-Google-Smtp-Source: AGHT+IEmSbBF0FCn8jj4u0pS6pmrE8YsrYvuX+t2aboXGR89IMGZF/4wfwHcvjUKs1nIEu5VEvNk
X-Received: by 2002:a05:620a:4081:b0:798:dd5b:2ac6 with SMTP id af79cd13be357-798dd5b364fmr100453485a.14.1718350139560;
        Fri, 14 Jun 2024 00:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350139; cv=none;
        d=google.com; s=arc-20160816;
        b=t0a8wu7JfXo/cOAI1ugEZLTmGI9vyWRTeBJIP0Y0bv4NZTPs6u53MsvXOMqTzFSPWg
         HPE8sgI13b4hKan/aQm1JuTqp/db5OdvkxAf+SOlI1xKyWtuBlWAC0mh/SWeCyjXrdPX
         nJLkjIGxAN5t+3fo7DhTotgUP4Db4EAOVABVX9+6JeKqDyHtlYxmpWKhlMyWZI9D5lSU
         tnwng9vvKV+sB3ZGG/ysTydaGyMfhMf8Cy+um4SajR9n/8iFDZkmrxW9dnVLeUnh6ICz
         EDwclhUvt/2E/Cb/T5x6EkYWuc1S6jeg7vDixfeU2mw+7P0tAubg3C1g4ZdsZBGRBIX+
         fViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vp7XFPXMEU1Dwul92dfTaHpOSahTq3QmMtYEQzsSdfk=;
        fh=OB4nhQX1bFwm+MLKNUzc1UcgBcUdSYXblZnVHN1xxIM=;
        b=0CUIRLVM+06TTqvh7kAPt02h58pPpAk7yBFflFKM1RgFA7FUyJXR1NhBC2kVt7OPnd
         Gh5jWmFpYhYV65r+cBAUgPDHkQIv8FjO9KMrXN7WuWOzEuPZ4VbU8YmKc3owW9qlkS9z
         gFTeaFgao5ZCFujXTOk7VvvfAXQ1gDzG750BJEcW7EC3AzYGvASq3Ebsp7JMd+ZTu3LG
         arWkSMHJt5FC8V8er1/U6HrHNn2ZRzh7qX+h0cv9h8/41qLSURcDu32Kx4Vi78BNm8xX
         VAGGkp4hNe7GPpW8gTDZ7IK57qcbLi+jsZ6LBC0JG/4pcCk3DcMZOpa/qGxwDWuaEAbH
         5NcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YJOwvJm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab8ffbbesi318807285a.265.2024.06.14.00.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YJOwvJm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI1Lo-0003Rj-Pe; Fri, 14 Jun 2024 03:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1Lm-0003Ka-28
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1Lj-0000mg-V3
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vp7XFPXMEU1Dwul92dfTaHpOSahTq3QmMtYEQzsSdfk=;
 b=YJOwvJm/09NC8PF2TH4I5f0LxdOAUmi7+gMLMdfooOJBOHQCyq9J8XueEe+A1+CvqVP9Xq
 zQs3gTI8bW/JqkmslG7wy/Aud4IoXdDgKNvVPMPO+HvstCvUp2vGP+YKDbQTkPIG+NyNfk
 Y1ns79cX3cBMdlzckra0S86tGkUnxy0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-FbDwJRtGOXKtxsmsa2hXMQ-1; Fri,
 14 Jun 2024 03:27:47 -0400
X-MC-Unique: FbDwJRtGOXKtxsmsa2hXMQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D3E84195608B; Fri, 14 Jun 2024 07:27:46 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2FF943000222; Fri, 14 Jun 2024 07:27:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 10/19] aspeed/smc: support different memory region ops for SMC
 flash region
Date: Fri, 14 Jun 2024 09:26:11 +0200
Message-ID: <20240614072620.1262053-11-clg@redhat.com>
In-Reply-To: <20240614072620.1262053-1-clg@redhat.com>
References: <20240614072620.1262053-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KkuqM4mqC8Ix

From: Jamin Lin <jamin_lin@aspeedtech.com>

It set "aspeed_smc_flash_ops" struct which containing
read and write callbacks to be used when I/O is performed
on the SMC flash region. And it set the valid max_access_size 4
by default for all ASPEED SMC models.

However, the valid max_access_size 4 only support 32 bits CPUs.
To support all ASPEED SMC model, introduce a new
"const MemoryRegionOps *" attribute in AspeedSMCClass and
use it in aspeed_smc_flash_realize function.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index d305ce2e2fea..234dca32b017 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -115,6 +115,7 @@ struct AspeedSMCClass {
                            AspeedSegments *seg);
     void (*dma_ctrl)(AspeedSMCState *s, uint32_t value);
     int (*addr_width)(const AspeedSMCState *s);
+    const MemoryRegionOps *reg_ops;
 };
 
 #endif /* ASPEED_SMC_H */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index df0c63469cd7..129d06690d36 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1316,7 +1316,7 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
      * Use the default segment value to size the memory region. This
      * can be changed by FW at runtime.
      */
-    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
+    memory_region_init_io(&s->mmio, OBJECT(s), s->asc->reg_ops,
                           s, name, s->asc->segments[s->cs].size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 }
@@ -1391,6 +1391,7 @@ static void aspeed_2400_smc_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2400_smc_info = {
@@ -1441,6 +1442,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2400_fmc_info = {
@@ -1480,6 +1482,7 @@ static void aspeed_2400_spi1_class_init(ObjectClass *klass, void *data)
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
     asc->addr_width        = aspeed_2400_spi1_addr_width;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2400_spi1_info = {
@@ -1525,6 +1528,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2500_fmc_info = {
@@ -1560,6 +1564,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2500_spi1_info = {
@@ -1595,6 +1600,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2500_spi2_info = {
@@ -1682,6 +1688,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2600_fmc_info = {
@@ -1721,6 +1728,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2600_spi1_info = {
@@ -1761,6 +1769,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_2600_spi2_info = {
@@ -1843,6 +1852,7 @@ static void aspeed_1030_fmc_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_1030_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_1030_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_1030_fmc_info = {
@@ -1881,6 +1891,7 @@ static void aspeed_1030_spi1_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_1030_spi1_info = {
@@ -1918,6 +1929,7 @@ static void aspeed_1030_spi2_class_init(ObjectClass *klass, void *data)
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
     asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+    asc->reg_ops           = &aspeed_smc_flash_ops;
 }
 
 static const TypeInfo aspeed_1030_spi2_info = {
-- 
2.45.2

