Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1308005njc;
        Sun, 21 Jul 2024 01:17:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWosx/ZW4f58d/STHrLltOB7mYNY33VPhIywLW1lmfk4l44MZHR+ABQM8C2JAhqmg+vgUISBrfNq6+SNvHoZdlmiiFadhdE
X-Google-Smtp-Source: AGHT+IEPV9oFsTkMVyKppmXVf+y+ABR69+b65ZWiQvQIDMACNz+0bwUnHW7+JLHCxNkEF4ne3jxb
X-Received: by 2002:a05:6808:21a1:b0:3d9:41fa:3f42 with SMTP id 5614622812f47-3dae5fb8d43mr5874942b6e.22.1721549831931;
        Sun, 21 Jul 2024 01:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549831; cv=none;
        d=google.com; s=arc-20160816;
        b=HGmSFdD9/achDwNRlGVvDOADNHWXB2POC6QbtQa3r+N1iculkpLgPCSLvD17WjLhDJ
         uGcLG7WIR4j/hLJWdGQ99FSOfFOegki9z0E6gmBbnnnsEGKZt6438VPeKzGra7S1crE6
         9bJj/+T1zmVR/6Y6EA0d0bVKsB+woBMU46spXzMR4T+1LPi7ORQsH5QxTrdrObuyIBIO
         HuWBdcGFItPR7d5jNTpi8LPzR7YSGtAnr7lWOraS8w6njxkUZmX9Yc28jvukuu/y1JYb
         YGcrm2cBS9gcRuJJYUkOLE83OTDip650PVXTF0TpD6TpDWCT/LqKCq3VSUv8jo7p2iH/
         xkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+LN/ynhD2DkbOUWD0h0IzbPLzWCaTcoqsrKtlRC4XCI=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=qb7wjpMRnEIihgc44rNMVsEVk4CxluE1TC7rwT35hXf1QksiXV+wuhGbonoQs0p8EZ
         7owUTOtWxSVGQkp9rgPIcLwx45u2u8qBwXX1GnwhXg1iE7SRnJTOwy9moY4qC6Ra1bO6
         42Gjg2aCBRGWRAeuFwnuJs88+6pvJ0Bpof5BrXiNBBgBXxRpfE5YJM+ABayC/6EkVSlp
         jgTkCU+Acc+5Zg06y0V2AAJKN0J276CA3vQuhonjY6rg03kZNUtkMqf0gOsU3TTQeIK3
         U3ryrKsr7nHILnwAIcxUJ6GSQ9mS/JpkSbQIWvkqV41M+g2JK+5Xra0UtBmHxn7/ksSY
         FgKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7wFGLfj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198f9773dsi542144885a.36.2024.07.21.01.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7wFGLfj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiX-0001SC-Ir; Sun, 21 Jul 2024 04:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiN-0000xi-Uj
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiL-0001W4-KT
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LN/ynhD2DkbOUWD0h0IzbPLzWCaTcoqsrKtlRC4XCI=;
 b=O7wFGLfjPtCGg/3q4JHJ6IBpyOjY7juooy3Rw1Y8K9pW+vrhjjreJ/hG22QaJkLkLPZzep
 +UlCYo7IY+ivakwqkC2XKKVbmlBaStQhFOyNbP49vsgB8V7nC7+aNX+awsh2Zcb/e5G+V3
 P1aP+a/+2Squ6uY6ilMNL+XAeQv+L0s=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-fOBNBiPyNv6Ym_sLT3sWKg-1; Sun,
 21 Jul 2024 04:14:38 -0400
X-MC-Unique: fOBNBiPyNv6Ym_sLT3sWKg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EE34219560B0; Sun, 21 Jul 2024 08:14:36 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 406CA1955D4F; Sun, 21 Jul 2024 08:14:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 11/15] aspeed/adc: Add AST2700 support
Date: Sun, 21 Jul 2024 10:13:57 +0200
Message-ID: <20240721081401.425588-12-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LMGKrCxXJbnB

From: Jamin Lin <jamin_lin@aspeedtech.com>

AST2700 and AST2600 ADC controllers are identical.
Introduce ast2700 class and set 2 engines.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/adc/aspeed_adc.h |  1 +
 hw/adc/aspeed_adc.c         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
index ff1d06ea91de..f502f197ac00 100644
--- a/include/hw/adc/aspeed_adc.h
+++ b/include/hw/adc/aspeed_adc.h
@@ -18,6 +18,7 @@
 #define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
 #define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
 #define TYPE_ASPEED_1030_ADC TYPE_ASPEED_ADC "-ast1030"
+#define TYPE_ASPEED_2700_ADC TYPE_ASPEED_ADC "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
 
 #define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"
diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index 68bdbc73b0e6..48328ef89194 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -398,6 +398,15 @@ static void aspeed_1030_adc_class_init(ObjectClass *klass, void *data)
     aac->nr_engines = 2;
 }
 
+static void aspeed_2700_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 ADC Controller";
+    aac->nr_engines = 2;
+}
+
 static const TypeInfo aspeed_adc_info = {
     .name = TYPE_ASPEED_ADC,
     .parent = TYPE_SYS_BUS_DEVICE,
@@ -430,6 +439,12 @@ static const TypeInfo aspeed_1030_adc_info = {
     .class_init = aspeed_1030_adc_class_init, /* No change since AST2600 */
 };
 
+static const TypeInfo aspeed_2700_adc_info = {
+    .name = TYPE_ASPEED_2700_ADC,
+    .parent = TYPE_ASPEED_ADC,
+    .class_init = aspeed_2700_adc_class_init,
+};
+
 static void aspeed_adc_register_types(void)
 {
     type_register_static(&aspeed_adc_engine_info);
@@ -438,6 +453,7 @@ static void aspeed_adc_register_types(void)
     type_register_static(&aspeed_2500_adc_info);
     type_register_static(&aspeed_2600_adc_info);
     type_register_static(&aspeed_1030_adc_info);
+    type_register_static(&aspeed_2700_adc_info);
 }
 
 type_init(aspeed_adc_register_types);
-- 
2.45.2

