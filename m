Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002108njc;
        Mon, 4 Nov 2024 02:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVx04Lg3bHexVlB/q6ypDQrgNIdzAGPPtRbhP1blGm3K4TZ9Qp6vq01kbdagG8k+D6+ijqGXLk5GfgDSA==@linaro.org
X-Google-Smtp-Source: AGHT+IHli5VSr6wpHCW1R+1cjcd9XIh/iBXpx+w4XS6fSFttQ1oiG7yAhQJ3NvyD60ueej690QXJ
X-Received: by 2002:a05:622a:4e09:b0:462:b639:4b78 with SMTP id d75a77b69052e-462b6394c0fmr162536111cf.46.1730715377712;
        Mon, 04 Nov 2024 02:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715377; cv=none;
        d=google.com; s=arc-20240605;
        b=OvnMxBzd7/Tw4vjJriFF8nWRZ6ycr31eZ26BK3IOYn60le6OTPEkE2WjggX27KcGCD
         3DcjSezAkNQJHU9TdntQXvbj//rJZNn/y39O3TrVU+/JqA42VclCTC34KrGxdxWi5Pjk
         4FxU6Kzy2ERdAAB0DNzjOalpfOBl/XzY/BSZaCQspItkmYa0S76Ki0SvMKq9a60W/TZ/
         LN1TuyyzzbC/QrFR/3glZi6VPWbti700rdpkDjQYjKgBpVVxmnThH6/BYbP0BP/Fb1n/
         dKsZrsmn7MuTxe2FQ6uqiMHqX7a5NEmLBexVpZDEuhuJptdEBsVHGHgpUwd0eaykI5Po
         QoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3vxwhQQZnerJOWJaYywPdMKP95rIAwbsloBtL85Gz3g=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=c4oObtlGK97wRsyR3fjdWsp4+MR7t5MiIa8Sdt9GfC+Z1jmtMrleE1efrNXkKTRwqN
         xohRLnYt2XnLoTl/3OWXcL25yRSOtdKFzMO/Dz2X6MfAdjFra/PtJFVrVI1yRjY9AOuH
         XBoMZAdTdO5FOUVi7RSnZPE6PsrLflR1Vs+PL6N3BgCyiHyzQhf2RsZo7ouOCUufa+wb
         LBUPmgzPh1x9xXjPR3ByxuCfa3PyMAygixU/hTdFl5nsV+HOyhRgw7QSFf8V6rZlksy5
         LkFWaKspwVRGiTvQpO0zosqIRkf7BlMAdEazizd9Xs//00b9Ixd5b3/PgvID/JhC+g98
         Kk3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZcgEF5UC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b174asi114858511cf.67.2024.11.04.02.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:16:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZcgEF5UC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7u7R-0000lt-Dx; Mon, 04 Nov 2024 05:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7N-0000je-CY
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7K-0006Zu-Qs
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vxwhQQZnerJOWJaYywPdMKP95rIAwbsloBtL85Gz3g=;
 b=ZcgEF5UCY6ldd+PERoWy0gxcob5CoB4A0c+j7Aqd1V20rmjt+oFcnkwPjKtf/zP/1w7qE9
 Im019Gj8h4k8gK8MEhE0xQim96vWc4ybUVpTPUrhvNgId/EpTsSYczdKuhoUHDZf5YzJtq
 SpWiS1XLXqYhiZKm9yv547KutzBTLGM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-n-V2XvvYMJ-kGl-yOMkBEA-1; Mon,
 04 Nov 2024 05:15:21 -0500
X-MC-Unique: n-V2XvvYMJ-kGl-yOMkBEA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AF0A1195FE33; Mon,  4 Nov 2024 10:15:17 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 629E31956052; Mon,  4 Nov 2024 10:15:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 05/10] aspeed/soc: Support RTC for AST2700
Date: Mon,  4 Nov 2024 11:14:56 +0100
Message-ID: <20241104101501.2487001-6-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 4YUkB/ysxUCz

From: Jamin Lin <jamin_lin@aspeedtech.com>

The RTC controller between AST2600 and AST2700 are identical. Add RTC model for
AST2700 RTC support. The RTC controller registers base address is start at
0x12C0_F000 and its alarm interrupt is connected to GICINT13.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 7b2464409521..63d1fcb086d7 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -64,6 +64,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ADC]       =  0x14C00000,
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
+    [ASPEED_DEV_RTC]       =  0x12C0F000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -377,6 +378,8 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
+
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
 }
 
 /*
@@ -670,6 +673,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
+    /* RTC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.47.0

