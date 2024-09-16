Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1257551njl;
        Mon, 16 Sep 2024 12:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdNHVbfdD6UjKNnOD2TLCdIBOkHo027diyjn9JNvdwdntSuPoHjP01cn4fwwPzGVAME874w+cbDmwBLw==@linaro.org
X-Google-Smtp-Source: AGHT+IH5QlKoWgPbWFg2Ouru8q/2X2FhZ4qc6vXSOrQWt8MU9M0d1VwBHcFvLlcA8aiD4PHLcp95
X-Received: by 2002:a05:620a:d81:b0:7a9:bc9b:b5d with SMTP id af79cd13be357-7ab30d0bbc4mr2196218285a.11.1726513204771;
        Mon, 16 Sep 2024 12:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726513204; cv=none;
        d=google.com; s=arc-20240605;
        b=lS3UAcnNCWh6uv3Bwl7YnxLQfnwCM1Lyl12VQ0jFW+6Qnh7CCLiIIeFeYWEk9eXsdN
         fxbCgg1g3OAR2yU2vyi/UrUC6iyLCDQuapzO9V445NcKgj5dBCQmzqr7IkaTjKbufUks
         Jkh9luuTZQ2ZzsAAndulNNXnBV0wzbkO9ZBEEQTeOlvafPAZ3s4FrOSX1AmrK1KRXXVm
         xR1WFe+XaKaJYcCs1Ot7ln0TrX8GOizFyVw3xckY+/XXKGmUyCYIjPKBfgMMXxD5vKMX
         qiHCCuQheI+x4PDxCwF9XUG6HSNLc9+g44g/Th3h96wc2KVFzy97zLU6Mtno3qU7rXf5
         j9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xN0e/uLlFIwe3i9VwsIxWIydNemCNI/Y0Q+7rUab0nA=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=PxpKc+omDy4YVXXqi/03rqlefwq10hQW312x8ZGrOPB6HfuWjQEYUQqP6U4DAG0LHy
         zOLH8uEbuEvM7YYM1epxJ/Qyoh8gIULxaLSHR83jJ7NZ2hvJB2JYbxjWx4oug1Sx4QPC
         R5UO/izlHRvchlZmQKALehZEVyt8B4YGx0FBLbsfqFiAMYWLQobwy0uHdBbF3OTGzrZL
         xCOSAdBuZkpuNe1tCBlirqgQ4C01YZhfDVFpG4vCpPezHfrwqlIqpHspRti0u5F7dTwx
         6t30ZYBP8yTyBk+dGBjKMfM5EwHzfFg/mXgegk+IVDHTVaAIud06BZjfZLCMlMCpczh+
         pRLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZyirbdmC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ab3eb5578bsi636739985a.229.2024.09.16.12.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 12:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZyirbdmC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sqGwY-00023M-RI; Mon, 16 Sep 2024 14:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGwJ-0001cj-Q8
 for qemu-devel@nongnu.org; Mon, 16 Sep 2024 14:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGwB-0003M9-98
 for qemu-devel@nongnu.org; Mon, 16 Sep 2024 14:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726513141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xN0e/uLlFIwe3i9VwsIxWIydNemCNI/Y0Q+7rUab0nA=;
 b=ZyirbdmCp9bcnnKpkYbTvTreueORelC64bDL2zX12HkLfqFPsYAhD0YEjaffEZCbBu79iy
 N72VhLhkR4185zdzeYkPeutH2URb5wcxsxgtaov/xjRJrER5FIeLhCL8Rw/4qKe+BByVls
 tOAy1dR/YkxQ/NgHfJMSZU2j5kK7k/4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-3OF4omL6PLekXEzHU-wysA-1; Mon,
 16 Sep 2024 14:57:39 -0400
X-MC-Unique: 3OF4omL6PLekXEzHU-wysA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E84041953959; Mon, 16 Sep 2024 18:57:31 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.44])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A921E19560AA; Mon, 16 Sep 2024 18:57:27 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 08/12] hw/i2c/aspeed: Add support for 64 bit addresses
Date: Mon, 16 Sep 2024 20:57:04 +0200
Message-ID: <20240916185708.574546-9-clg@redhat.com>
In-Reply-To: <20240916185708.574546-1-clg@redhat.com>
References: <20240916185708.574546-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kyZE/066V8+S

From: Jamin Lin <jamin_lin@aspeedtech.com>

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
and the base address of dram is "0x4 00000000" which
is 64bits address.

The AST2700 support the maximum DRAM size is 8 GB.
The DRAM physical address range is from "0x4_0000_0000" to
"0x5_FFFF_FFFF".

The DRAM offset range is from "0x0_0000_0000" to
"0x1_FFFF_FFFF" and it is enough to use bits [33:0]
saving the dram offset.

Therefore, save the high part physical address bit[1:0]
of Tx/Rx buffer address as dma_dram_offset bit[33:32].
It does not need to decrease the dram physical
high part address for DMA operation.
(high part physical address bit[7:0] – 4)

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/i2c/aspeed_i2c.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 74aa5e0a160b..3ae22cb052d8 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -743,6 +743,14 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                       __func__);
         break;
 
+    /*
+     * The AST2700 support the maximum DRAM size is 8 GB.
+     * The DRAM offset range is from 0x0_0000_0000 to
+     * 0x1_FFFF_FFFF and it is enough to use bits [33:0]
+     * saving the dram offset.
+     * Therefore, save the high part physical address bit[1:0]
+     * of Tx/Rx buffer address as dma_dram_offset bit[33:32].
+     */
     case A_I2CM_DMA_TX_ADDR_HI:
         if (!aic->has_dma64) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
@@ -752,6 +760,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         bus->regs[R_I2CM_DMA_TX_ADDR_HI] = FIELD_EX32(value,
                                                       I2CM_DMA_TX_ADDR_HI,
                                                       ADDR_HI);
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
+                                         extract32(value, 0, 2));
         break;
     case A_I2CM_DMA_RX_ADDR_HI:
         if (!aic->has_dma64) {
@@ -762,6 +772,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         bus->regs[R_I2CM_DMA_RX_ADDR_HI] = FIELD_EX32(value,
                                                       I2CM_DMA_RX_ADDR_HI,
                                                       ADDR_HI);
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
+                                         extract32(value, 0, 2));
         break;
     case A_I2CS_DMA_TX_ADDR_HI:
         qemu_log_mask(LOG_UNIMP,
@@ -777,6 +789,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         bus->regs[R_I2CS_DMA_RX_ADDR_HI] = FIELD_EX32(value,
                                                       I2CS_DMA_RX_ADDR_HI,
                                                       ADDR_HI);
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
+                                         extract32(value, 0, 2));
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
-- 
2.46.0

