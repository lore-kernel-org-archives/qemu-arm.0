Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp621792njk;
        Tue, 16 Jul 2024 23:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoc5LxjQagjWwKPN3NOodaQfU3m9IjkNU0DwlnBQRmDawk6kxgmbvzeXa4Hy5V1XG2K1/voXJGubiPR155SjfaruVONLb0
X-Google-Smtp-Source: AGHT+IEkmFes/h0kAZlE6g0MzohNubf4WK7rk4yvkfRNngOzROK5EUoCTV911AzxbLSIzJbc0TFb
X-Received: by 2002:ac8:5753:0:b0:440:5f59:7c58 with SMTP id d75a77b69052e-44f86e33830mr8879401cf.47.1721197909029;
        Tue, 16 Jul 2024 23:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721197909; cv=none;
        d=google.com; s=arc-20160816;
        b=ct5ENR3YI1tfduQo/34J0SyHiqnUqo1VXol5ypW3Ibp4OPHp2mbDPGuVzqTZ2KML5U
         yzIMRCMOuIq9otk7OxrfOaQVPCJy39iff+AGjSkApTFzZ6URiSEf0QaBTdTZMX12SgxI
         obxPwKqjMbsZxt9bqTpaj0o5weJl1/c+GcPEFNCKLe7oG6nQLxaR0KRYtX/iGIUrsV8j
         j77him8mJN7HexQX2yD2XgbSYtn7Yu0g3iMQqGzzpL4nvbC6arJ+f/d2oIPqyS0FElFE
         fTxrNLdMf/QdAOLqTKHmZ7mj7j5TB58J9uQsiA1A58lAy33x+GVw+CMTOhH6KXQNPha6
         Tx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bRmL0OYaoeGHe5hCmTex3w/LL9vR1msP0rIYrY1NERE=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=LwTKbufRB8nIXKxI4HBDtKcX2Hrf0nZaImy55C0w0B7VVPnFj/gokSLOI8FsPmWy+K
         d9tHqgtjnOY1zorRD0FBxGpOETdoeh30uPSV1MDR0xKbyp8mPy72kdJDu3oQ3CobAD/F
         Ko3rSAd+K70bmJfDf/9JolvzzqJYDRDyd2WXJLbS/vF7VrdMTmE8WMijRGyldtr5ykGe
         oC1Tu58s+9skKT4pycGINDtGFLGC8mRohLrCVWEfdOTYZBwtmO9666BVDqX4i5kk0eK+
         eAPB5pjuyy52kwzb6z5xgk+qswD8XJhBHoLk3T5yZZihNQqvw7KlrIEYkT2KLhSD7WZX
         OB2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PHF13bf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b7f7651si91717081cf.234.2024.07.16.23.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PHF13bf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTyBw-0006nJ-Q0; Wed, 17 Jul 2024 02:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBv-0006cC-7g
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBt-0002z5-N7
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721197865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRmL0OYaoeGHe5hCmTex3w/LL9vR1msP0rIYrY1NERE=;
 b=PHF13bf7/D0QjIw8SASr8VauNiiHPkiIaOAgP9pdkL2scwjbqA4qH8vNlThEFO82MwQAxo
 pc95cdBrICSfv1GsuQGgLnTUB06YnRQMBYeb5lny7QBDDLi3TyVD8O9WYBmfPiVxRc+iNZ
 6EWbhGuvjhn2Tv16L7kqQld3qYlhY6Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-kTTV2iIjNmihFa32piaE9A-1; Wed,
 17 Jul 2024 02:30:59 -0400
X-MC-Unique: kTTV2iIjNmihFa32piaE9A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A40C19560B6; Wed, 17 Jul 2024 06:30:57 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 63E3319560B2; Wed, 17 Jul 2024 06:30:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 4/8] aspeed: Introduce a AspeedSoCClass 'boot_from_emmc'
 handler
Date: Wed, 17 Jul 2024 08:30:18 +0200
Message-ID: <20240717063022.549849-5-clg@redhat.com>
In-Reply-To: <20240717063022.549849-1-clg@redhat.com>
References: <20240717063022.549849-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: HPoxMURZ/kiJ

From: Cédric Le Goater <clg@kaod.org>

Report support on the AST2600 SoC if the boot-from-eMMC HW strapping
bit is set at the board level. AST2700 also has support but it is not
yet ready in QEMU and others SoCs do not have support, so return false
always for these.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 8 ++++++++
 hw/arm/aspeed_soc_common.c  | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 849ba37f9524..624d489e0d63 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -164,6 +164,7 @@ struct AspeedSoCClass {
     const hwaddr *memmap;
     uint32_t num_cpus;
     qemu_irq (*get_irq)(AspeedSoCState *s, int dev);
+    bool (*boot_from_emmc)(AspeedSoCState *s);
 };
 
 const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 31713de74a5f..be3eb70cdd77 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -646,6 +646,13 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static bool aspeed_soc_ast2600_boot_from_emmc(AspeedSoCState *s)
+{
+    uint32_t hw_strap1 = object_property_get_uint(OBJECT(&s->scu),
+                                                  "hw-strap1", &error_abort);
+    return !!(hw_strap1 & SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC);
+}
+
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
@@ -673,6 +680,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->memmap       = aspeed_soc_ast2600_memmap;
     sc->num_cpus     = 2;
     sc->get_irq      = aspeed_soc_ast2600_get_irq;
+    sc->boot_from_emmc = aspeed_soc_ast2600_boot_from_emmc;
 }
 
 static const TypeInfo aspeed_soc_ast2600_types[] = {
diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
index 1e8f2558fdc2..05551461aea0 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -134,6 +134,11 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static bool aspeed_soc_boot_from_emmc(AspeedSoCState *s)
+{
+    return false;
+}
+
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
@@ -145,9 +150,11 @@ static Property aspeed_soc_properties[] = {
 static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
 
     dc->realize = aspeed_soc_realize;
     device_class_set_props(dc, aspeed_soc_properties);
+    sc->boot_from_emmc = aspeed_soc_boot_from_emmc;
 }
 
 static const TypeInfo aspeed_soc_types[] = {
-- 
2.45.2

