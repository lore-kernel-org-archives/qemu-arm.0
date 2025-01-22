Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp603069njc;
        Tue, 21 Jan 2025 23:10:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCRiKDs4G5FUx8q3H7FnkSksR/rxwXO6nEEwsOWsbDoM5kPNylR35KqjP9+X47e7rBt7ASemUhDZQsGw==@linaro.org
X-Google-Smtp-Source: AGHT+IENqH8yDqx+IsyL/ve0gtTzWKVFdigy0/109nZUupuyI42qbvq+yuDerLSqjciA5ivqE1kT
X-Received: by 2002:a05:622a:1993:b0:467:7513:3d8 with SMTP id d75a77b69052e-46e12a46083mr298953621cf.21.1737529817686;
        Tue, 21 Jan 2025 23:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529817; cv=none;
        d=google.com; s=arc-20240605;
        b=NSkUIHh3CuGnBsO1OFDaHjNVnFmMlf8J4s7hx33woFmkrDXHBE4L4XaKjUgLGdsNlc
         tgaFMx6eHiho51R1QEzqZgUos9ExJRrHRxSI3Bg7a3XGQnEUfpLwDjE8dZypqQKjNQpa
         HeHgLDHEF/pA4NHNXRvE803TadASe2lVO4arkgt9BaOkflmrHKqgK+zASqqfKLCYIAVM
         bOBmlrBb9YElChFoBzogKeQEvy8ZwWPj7PLg9Z9pBdPfIV3yTIUdcCbv0LUdmfjY6/oq
         WXRuVNg294Jai+8GX/JchsF9It1S4p/01HipUPXOINPmZEwHruUS47+yl9oypG2PmDLo
         o9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HCgBPHkwQ9noTFqoX4NtX4SFLU9O8jURWveoSWvlS7U=;
        fh=CQ3JhhEpLx6WUtQxwLyuUdUASVLLkjylcjrkyER1RTM=;
        b=Hvk4bDUq5BIsETr4NKS/COIbmhqtFlICcpYTGWXowpVw1SsbcZgfJscoxZhsx3x2PW
         RGyGiKkV7YtWBK/kithmuG5SOQaHYzXLvE+ntXY0g1dbpzQTvbN4YS/VHZCWOnS2YW5L
         cyLuo8yJqKQAhR1Rd+jhnLCr3OKqaBKc2/vhAbhTuV1PdQOgUdLCxspG1GB7HNUl5/TQ
         HLTRN3f/YbMbaHKhqR81GmDuBObpPyVh7ri74llE6couBBlIcTLliX1ux1HXcYIsay49
         JuQR8ZaUVR6Ae7yEEhx5lYdNbbC4qtkU5WXW1WQvbhNkS1Q0QAgSU9yxqlM+Ls9JSvhr
         Rluw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ie8BYGyz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afd1fd3fsi142657486d6.475.2025.01.21.23.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ie8BYGyz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taUrz-0005I3-CB; Wed, 22 Jan 2025 02:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUrx-0005Fg-DT
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 02:09:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUrv-0008Pr-PC
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 02:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCgBPHkwQ9noTFqoX4NtX4SFLU9O8jURWveoSWvlS7U=;
 b=ie8BYGyzWnaRA9aVTBx4/V0eKplGM7gF0OudGthchPBycnkG65/xTy3D3c8TdDSct8c/DN
 t0ZfHmdUBL9cS+ldKcIe8UcDeBe2i1pSwjIm78lLeISB03msASqNdTQOQdjZPmJGxUgXgT
 725/FGaeCE0kqAj5VO4GUaFP4FLzvvw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-fExaK_lFO6iG2gnGkO0ahA-1; Wed,
 22 Jan 2025 02:09:37 -0500
X-MC-Unique: fExaK_lFO6iG2gnGkO0ahA-1
X-Mimecast-MFC-AGG-ID: fExaK_lFO6iG2gnGkO0ahA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2281D1956054; Wed, 22 Jan 2025 07:09:36 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9D5813003E7F; Wed, 22 Jan 2025 07:09:33 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 6/9] aspeed/soc: Support Timer for AST2700
Date: Wed, 22 Jan 2025 08:09:06 +0100
Message-ID: <20250122070909.1138598-7-clg@redhat.com>
In-Reply-To: <20250122070909.1138598-1-clg@redhat.com>
References: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: R0Xhx+0NBTy0

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add Timer model for AST2700 Timer support. The Timer controller include 8 sets
of 32-bit decrement counters.

The base address of TIMER0 to TIMER7 as following.
Base Address of Timer 0 = 0x12C1_0000
Base Address of Timer 1 = 0x12C1_0040
Base Address of Timer 2 = 0x12C1_0080
Base Address of Timer 3 = 0x12C1_00C0
Base Address of Timer 4 = 0x12C1_0100
Base Address of Timer 5 = 0x12C1_0140
Base Address of Timer 6 = 0x12C1_0180
Base Address of Timer 7 = 0x12C1_01C0

The interrupt of TIMER0 to TIMER7 as following.
GICINT16 = TIMER 0 interrupt
GICINT17 = TIMER 1 interrupt
GICINT18 = TIMER 2 interrupt
GICINT19 = TIMER 3 interrupt
GICINT20 = TIMER 4 interrupt
GICINT21 = TIMER 5 interrupt
GICINT22 = TIMER 6 interrupt
GICINT23 = TIMER 7 interrupt

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20250113064455.1660564-4-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index fee37558372a..4114e15dddf4 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -66,6 +66,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_SDHCI]     =  0x14080000,
+    [ASPEED_DEV_TIMER1]    =  0x12C10000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -397,6 +398,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);
+
+    snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
+    object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 }
 
 /*
@@ -716,6 +720,19 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
 
+    /* Timer */
+    object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
+                    sc->memmap[ASPEED_DEV_TIMER1]);
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
+    }
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.48.1

