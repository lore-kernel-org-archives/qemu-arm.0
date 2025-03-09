Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp608262njc;
        Sun, 9 Mar 2025 06:57:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr6EC7BJqxC5+lBr0Z9sGuRYkyZbpHAst8tjE1Lzvm/iiNAJTYiL4i32i7bOF937pnb0f674vZrsqcCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHrLSve1IIlCOWZkTlgJSY5x6tvsnyNOjC+x7ZlxZl9/Bx0DRrG9yOOr/VeAYvSxospSPrw
X-Received: by 2002:a05:620a:4e99:b0:7c5:438b:78 with SMTP id af79cd13be357-7c5438b014emr527712785a.6.1741528654988;
        Sun, 09 Mar 2025 06:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528654; cv=none;
        d=google.com; s=arc-20240605;
        b=iblAhHbJ5o/BMj9tsSDnFJGBZUQPwqDKhZUnWGhkaHQHdIJC6bPXmrV8l4FutuOcCu
         ITCJrGcTVqfsMNfDIhB6XYpukSuzfD/vcVri4ojRqGO+Gdtigm0EcRiNR/LlYHvc0jgH
         eTG65HERMnKuRaXsijIXlUchdtyMRD0rjt0e/PGdkBJJqiR9zgZwluBJrsoovqVGrSry
         jPBSmVXnMUzmYLKugYG+zP0hqxSA2CRc8tWL5P8wupiA2HtCPGQoC/aV4PbNBHSi+51D
         KXYC/VfE5OvXDnNDBXJOmm+Y/a2rmeq66TTNXIdBu7jCYA49vaEOmOCNMR4Hf/9pUQ8R
         hnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YLl1bc4YtLJCWH6ozATRA+AxvNEaJw+HB5E7SiCcFyQ=;
        fh=34Iw5affspMzPSZvYyGXJaYAvLSLfbjT3SnYu8GjqYM=;
        b=lCVsu5hqOgrrGyeNhWVdHgR1LGgKGe9X3XRxot3uz6oYXBjs5cY0B2Uu05YxntUzy1
         uMAx8lznpY28WnsNVduIfyGC0LO40Es2OFsZ8lQdEYpgWIkPqwd07U+v6h0NfmZA+/BD
         8MvyM0bqNL+Z08QF6TzuH4/qri5eQv5ehmz9StwkKUpBoPgYMUvTykHwSuWAl5pbdYZg
         pQCQWCQfbAIKnhFKN3T2LTVlt0/zhR8lYdyxNU0yNuN5QvgWS8eF9u3c2AiA+oarJ0mi
         Tr4NMMVCL3QA3qcG/odk1GIwiWhLs5gRxNjBjr/ICdroPfhl+VnSSeR7fZkZtS3R6mWb
         kJJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJCrI0wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e533ca33si743079285a.75.2025.03.09.06.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJCrI0wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4e-0007jg-3i; Sun, 09 Mar 2025 09:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4Y-0007ZA-4r
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4W-0002Ds-C0
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLl1bc4YtLJCWH6ozATRA+AxvNEaJw+HB5E7SiCcFyQ=;
 b=RJCrI0wWI2Z2fYYyGxmbPW29Zabsg8HglXAHXmOzM8WOUd9tHA+hYOyDX1lwSewy9Vo5af
 A887O4kaZg0mRYFjD/cga4nHhxHvHoay7O9O+hd0boA9yNceQmZ91l1Fg9uMmlafr0LWxo
 2Hd8q1w6wWsyvUqcwmkIowbkqR0kh5Q=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-YHj2l2dWOdieWLYaxjFG8Q-1; Sun,
 09 Mar 2025 09:51:59 -0400
X-MC-Unique: YHj2l2dWOdieWLYaxjFG8Q-1
X-Mimecast-MFC-AGG-ID: YHj2l2dWOdieWLYaxjFG8Q_1741528318
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AF0F319560B0; Sun,  9 Mar 2025 13:51:58 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A181F1956094; Sun,  9 Mar 2025 13:51:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 09/46] hw/misc/aspeed_hace: Add AST2700 support
Date: Sun,  9 Mar 2025 14:50:53 +0100
Message-ID: <20250309135130.545764-10-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: JTdelTH6XeWv

From: Jamin Lin <jamin_lin@aspeedtech.com>

Introduce a new ast2700 class to support AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://lore.kernel.org/qemu-devel/20250225075622.305515-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/misc/aspeed_hace.h |  1 +
 hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 4af99191955a..d13fd3da078c 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -18,6 +18,7 @@
 #define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
 #define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
 #define TYPE_ASPEED_AST1030_HACE TYPE_ASPEED_HACE "-ast1030"
+#define TYPE_ASPEED_AST2700_HACE TYPE_ASPEED_HACE "-ast2700"
 
 OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
 
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 18b85081c7c5..86422cb3be70 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -552,12 +552,32 @@ static const TypeInfo aspeed_ast1030_hace_info = {
     .class_init = aspeed_ast1030_hace_class_init,
 };
 
+static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST2700 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x7FFFFFFF;
+    ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
+    ahc->hash_mask = 0x00147FFF;
+}
+
+static const TypeInfo aspeed_ast2700_hace_info = {
+    .name = TYPE_ASPEED_AST2700_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast2700_hace_class_init,
+};
+
 static void aspeed_hace_register_types(void)
 {
     type_register_static(&aspeed_ast2400_hace_info);
     type_register_static(&aspeed_ast2500_hace_info);
     type_register_static(&aspeed_ast2600_hace_info);
     type_register_static(&aspeed_ast1030_hace_info);
+    type_register_static(&aspeed_ast2700_hace_info);
     type_register_static(&aspeed_hace_info);
 }
 
-- 
2.48.1

