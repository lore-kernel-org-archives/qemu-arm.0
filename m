Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606301njc;
        Sun, 9 Mar 2025 06:52:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxrBC85etGLcdZFwc19H2FGOjO7ETG/833VzwYPJds+CRXd6WcCuqhhAGUOvfJ2T24lg2zeZRZnAwXFw==@linaro.org
X-Google-Smtp-Source: AGHT+IEXH3aft8hK/cGxX1W+b8d0WqpTKZDn+iuMC5qAdOo8/VWcIYenRZasPOUlMVqg97BhETZ1
X-Received: by 2002:a05:622a:1a9c:b0:472:2bc:8763 with SMTP id d75a77b69052e-476624b4364mr78599051cf.17.1741528365598;
        Sun, 09 Mar 2025 06:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528365; cv=none;
        d=google.com; s=arc-20240605;
        b=NOAafvh/6YotuiKkIxhUv2b1uOuVxPqnqBk49IvOLxiASrVGyS0UzTQCIHrVzD1HlA
         BZVt045yzGdtUrcEiVZDaYeL6cYeAeHnwQSP0qXpbDeR6Q/UC5iVzJyE2+DbjUypCBFN
         yuJV+SRcBkjrmJOjT9Tg3Yey7Dp0EzXI7o2zC6emPJbF9fuZD9cDp3akzLwykAe3lJdg
         9+5cxpvu2ZPhnjDWIj5I8hVOGReIy4wrtxLozwV66pfOz3kWmp2y2ya3dN+0sCT0Kfbp
         rTpyrrkrzxPkCGGBEJ6BF1v3G1uqZ7YjDh9szHEeFpHn9vK+DLhOg3fioUMykT5cG6FQ
         FHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C/yJdADoP3j47UceQltVcyUw20zz5dtQlfRxAxOoGoc=;
        fh=34Iw5affspMzPSZvYyGXJaYAvLSLfbjT3SnYu8GjqYM=;
        b=Z7LmrhlEdtCIKue2Zobhji4x9XveQ74025UcTxDENeg+qmGRqvpGE7yhRuuOuQEFy7
         +EOPRX51vjnBoV31MyZepT77M+o1WmyN3Kbp7fnZ1pLZqbFroKyhZiJYxKzGwCpq1/sO
         Hca6311TQ4WrX8q4wJUNiGdfnweP4FwTp2c/5rVw7qZcdfXBggWpFiQx4XP86GMFbEVS
         A3pn7apThuMXjzcF1PtxN7Kz0BYnAc4TFVM91NvAHqilxflB80ZUGYqvR4UxmsMS5/A5
         Dsv1UV6M+i5UfUuORx0vaI4ASgQvnywpTD4EjQzVNCznqyuzU/tDlruYovD44gMmQc9O
         rvdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8ElqdDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db5ce32si70184881cf.623.2025.03.09.06.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8ElqdDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4f-0007kq-GM; Sun, 09 Mar 2025 09:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4a-0007aL-1H
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4Y-0002In-84
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/yJdADoP3j47UceQltVcyUw20zz5dtQlfRxAxOoGoc=;
 b=Y8ElqdDVg+7hPNhCtY5lJcjYPXtWhnPeV/I60lfd2jK+Tg7eKkfuJQzYT739I0A6J6UEnK
 8WKwWcRlTaXt3RgR6FrLZjLzO2ku3SD2Fn76hilnJ6eQU0TupkjzSywbuWcX1JK0uaKn7g
 Wll+wXCw9lVD+dau8sbpYm5e22POqTE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-3ycyO7WJNkOp5nHbUzm4NA-1; Sun,
 09 Mar 2025 09:52:03 -0400
X-MC-Unique: 3ycyO7WJNkOp5nHbUzm4NA-1
X-Mimecast-MFC-AGG-ID: 3ycyO7WJNkOp5nHbUzm4NA_1741528322
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 28538195609E; Sun,  9 Mar 2025 13:52:02 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 34B171956094; Sun,  9 Mar 2025 13:51:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 10/46] hw/arm/aspeed_ast27x0: Add HACE support for AST2700
Date: Sun,  9 Mar 2025 14:50:54 +0100
Message-ID: <20250309135130.545764-11-clg@redhat.com>
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
X-TUID: 2IFhzt8gLtg8

From: Jamin Lin <jamin_lin@aspeedtech.com>

The HACE controller between AST2600 and AST2700 are almost identical.
The HACE controller registers base address starts at 0x1207_0000 and
its alarm interrupt is connected to GICINT4.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://lore.kernel.org/qemu-devel/20250225075622.305515-4-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 6506bdfdff68..56e43d45ad22 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -67,6 +67,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_SDHCI]     =  0x14080000,
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
+    [ASPEED_DEV_HACE]      =  0x12070000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -401,6 +402,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
 
 /*
@@ -737,6 +741,17 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.48.1

