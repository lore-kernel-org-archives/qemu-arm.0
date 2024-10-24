Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp125870njx;
        Wed, 23 Oct 2024 23:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOaecaoz8n1nyjBJ9jPaadzkX4CFVC5VTQzZC/Gyw5OYFAXYuI5gyYb0U/UEvWbgkRs4tvGuSkZCG8Jw==@linaro.org
X-Google-Smtp-Source: AGHT+IHhDnNw8C3zJIwkeGziKzSxCIJ7YROsQe39Hieq1I5K4sHzuYrXnPwExZnuBOqnBdy5BKD6
X-Received: by 2002:a05:620a:1791:b0:7b1:41d9:7b30 with SMTP id af79cd13be357-7b17e5bd477mr619117685a.60.1729751830251;
        Wed, 23 Oct 2024 23:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729751830; cv=none;
        d=google.com; s=arc-20240605;
        b=MWgiHtV7NVO8ffEPnA17P3iYBPwl8X9tjqk2s630OEKuRB6hS6iMUHTUK9Ou+zBgYO
         7/jWfRSNNIfgoozDVP2rWrMq6RH+4R2S7BV1cPu3btR7UdQPzQ52ORB5H+JXGPY0thn/
         LdoZto1rW7CDemspb0FjsdY+YNmpT8sFJuGZ5+66NVWURDHC0NKvHwJnc+9ijCWp7O6K
         UGdsApu7+Ijg1si8qb9acD2aJJ5vDfN146lwyatrIBMpXqsc3c4RxF0XfPj1rklTw9Kz
         rHwsrZjh7eE6YMJTIsbcZblqaeCsBqjhdLQqdN2N+7dYjSMtIjRBrd93aq0N7bw1SeN5
         mzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/ExQy3e/wgwYsGjskOCc6Qc1tz2wo0MPsXf2k6BYUGg=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=bIjEIbNCQF2q/l1gd9vdWjvbvfgw0024SFnU2F3roA84WVVkklBK0y1dubRt6BnBwR
         t5pHfENvt6f2swWHNYXE/HseTTfagKGxOd4/YfF4FpvyyUoBZvwhiIcm5aBhF4r4uZRK
         KN7p+/9rf7heRrAoAq8G1zrdN5S10MazdUNdukOysVrfEGn9ZkGvXhf5ImgKAxydt1T2
         ODuin+JVxhapOsOhMlqioHxDewhTo3Yui0iAIxCegxhxOs09a/WANPgpDC9vKtdWpKIG
         H5ZkA9xzcscOrpH0yhsg9L0daGNnwW3YF2jLOW6WSUDaInNRBTAel1xYvbKDmGkN5Zax
         4GJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EJq+TtYm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b165ab6376si1084519085a.746.2024.10.23.23.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EJq+TtYm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3rRT-0002CA-2j; Thu, 24 Oct 2024 02:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRR-0002Bj-Ez
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 02:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRP-0003Ot-K7
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 02:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729751726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ExQy3e/wgwYsGjskOCc6Qc1tz2wo0MPsXf2k6BYUGg=;
 b=EJq+TtYmeeuH91gZ/VpA4lJwXaWDE2NI4B/jNFy5ZBj70MPX165DpCkUMPc1+6PxON+IXZ
 AqBsJmhiN5d4IwE6GqDro/1XkUXTh+UTBzQc9l0Fq2nmXuL9+soGPHonGqpD21NFYMCGLk
 blWL1rp0TJZuRKSnMkEUMSpRY4LUbOY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-YATIVMnlOQixnqJJ4MLxcQ-1; Thu,
 24 Oct 2024 02:35:24 -0400
X-MC-Unique: YATIVMnlOQixnqJJ4MLxcQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 411911955E7F; Thu, 24 Oct 2024 06:35:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C3D4A1956056; Thu, 24 Oct 2024 06:35:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 02/17] hw/gpio/aspeed: Support to set the different memory size
Date: Thu, 24 Oct 2024 08:34:52 +0200
Message-ID: <20241024063507.1585765-3-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
References: <20241024063507.1585765-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.263,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Ojncfg9hAs0z

From: Jamin Lin <jamin_lin@aspeedtech.com>

According to the datasheet of ASPEED SOCs, a GPIO controller owns 4KB of
register space for AST2700, AST2500, AST2400 and AST1030; owns 2KB of
register space for AST2600 1.8v and owns 2KB of register space for
AST2600 3.3v.

It set the memory region size 2KB by default and it does not compatible
register space for AST2700.

Introduce a new class attribute to set the GPIO controller memory size
for different ASPEED SOCs.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/gpio/aspeed_gpio.h | 1 +
 hw/gpio/aspeed_gpio.c         | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 39febda9eaea..8cd2ff54968c 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -76,6 +76,7 @@ struct AspeedGPIOClass {
     uint32_t nr_gpio_sets;
     const AspeedGPIOReg *reg_table;
     unsigned reg_table_count;
+    uint64_t mem_size;
 };
 
 struct AspeedGPIOState {
diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 00fb72a509ef..564459ad4f07 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1047,7 +1047,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
     }
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
-            TYPE_ASPEED_GPIO, 0x800);
+                          TYPE_ASPEED_GPIO, agc->mem_size);
 
     sysbus_init_mmio(sbd, &s->iomem);
 }
@@ -1130,6 +1130,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -1141,6 +1142,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 8;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
@@ -1152,6 +1154,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x800;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -1163,6 +1166,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 2;
     agc->reg_table = aspeed_1_8v_gpios;
     agc->reg_table_count = GPIO_1_8V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x800;
 }
 
 static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
@@ -1174,6 +1178,7 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 6;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static const TypeInfo aspeed_gpio_info = {
-- 
2.47.0

