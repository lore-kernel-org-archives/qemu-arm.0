Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2592778ejb;
        Wed, 25 Oct 2023 02:01:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRMG6bjw8BcYdfUj+YHG6mPRAjwmUgXyfi/rN5YtNVRF6zr0oDcdYpoesPkmbPxwXxFkvy
X-Received: by 2002:ad4:5ba6:0:b0:66d:f91:fa33 with SMTP id 6-20020ad45ba6000000b0066d0f91fa33mr17107223qvq.29.1698224464967;
        Wed, 25 Oct 2023 02:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224464; cv=none;
        d=google.com; s=arc-20160816;
        b=rrTDDxxYIsxgVfBwxLfC4fZlV5eWZ6ssqYLttSpn+IbY8oBFbdpWyVmHl265AKx/6N
         fMQEdYD/no5vMoNmejaq3a3zfKuRxwHuMNyul5mEGdMpI9qJ6QcDsFX0wLQwHi27GQXd
         mwY37KI4ithMGEWMvxgdxV44UieVNcACY2EzIAC2A//P7Qo7J4voahM6LQ0XVOx/NJlm
         alBqQZmd6mouw2n8a0ZaIvmc5Ooa4w4ExTgzZAk2jS5xigKkTYIjb5Ucv27hMhJc3sl0
         W9952/zVMcl6UJXStTae8fZR0mAgqmM7c8oKADfzcDBTvei1iKGndYyWRVXlP8LDsEUv
         okPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=NB91pZa/uewD/guhNRzhTELgiMgy0lXb61X6ZRy0cB4=;
        fh=2AKgK1B3EYiX6882ovZW+CwIStVbar5zReCRX1lYnfY=;
        b=EGWgun+hz1hksyyJ5OjBwVkEcbIs6B9+0qDCO3r2bxnDVzp21G43vbW8euN3moDRoD
         ipHdBiWHwqjgvGw0byC6SRhDONrpGgV1t15wrYW6RVuDA8by2wfW2e7/YVxHpVEfiQ6c
         fF9bTnPOZ/yZf3mFzgXLiF3CMeWidsfxZ+oGFQMfJZ6+0DEbPVFuxz9yDq8DgB6SYbu1
         7jEytwqO42G7UXvaULGGaRQ7bt96aD+vqFo88DtLTgwhukECGMvMTqmlOunz8dNdwICB
         hEZeeMp30XVe+6g2NM9xFYlQq55ihybAQlNFNHP25Mdt5vXh7c5UjydwOT8wZnKy/mtS
         UtWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a0cd604000000b0066cfd0ec363si8227511qvj.418.2023.10.25.02.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvZjq-00083m-CD; Wed, 25 Oct 2023 04:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjo-00082l-Lj; Wed, 25 Oct 2023 04:59:40 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjm-0004Rq-T0; Wed, 25 Oct 2023 04:59:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjY40ygHz4wd0;
 Wed, 25 Oct 2023 19:59:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjY24HKlz4wnw;
 Wed, 25 Oct 2023 19:59:34 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/12] hw/arm/aspeed: Rename aspeed_soc_realize() as
 AST2400/2500 specific
Date: Wed, 25 Oct 2023 10:59:13 +0200
Message-ID: <20231025085921.733686-5-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025085921.733686-1-clg@kaod.org>
References: <20231025085921.733686-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: f3RKGKxEfRL5

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Keep aspeed_soc_class_init() generic, set the realize handler
to aspeed_ast2400_soc_realize() in each 2400/2500 class_init.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index bb377e9e6e32..191276a3203d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -239,7 +239,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
 }
 
-static void aspeed_soc_realize(DeviceState *dev, Error **errp)
+static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
     AspeedSoCState *s = ASPEED_SOC(dev);
@@ -509,9 +509,6 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    dc->realize = aspeed_soc_realize;
-    /* Reason: Uses serial_hds and nd_table in realize() directly */
-    dc->user_creatable = false;
     device_class_set_props(dc, aspeed_soc_properties);
 }
 
@@ -527,6 +524,11 @@ static const TypeInfo aspeed_soc_type_info = {
 static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
 {
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = aspeed_ast2400_soc_realize;
+    /* Reason: Uses serial_hds and nd_table in realize() directly */
+    dc->user_creatable = false;
 
     sc->name         = "ast2400-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
@@ -554,6 +556,11 @@ static const TypeInfo aspeed_soc_ast2400_type_info = {
 static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
 {
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = aspeed_ast2400_soc_realize;
+    /* Reason: Uses serial_hds and nd_table in realize() directly */
+    dc->user_creatable = false;
 
     sc->name         = "ast2500-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
-- 
2.41.0

