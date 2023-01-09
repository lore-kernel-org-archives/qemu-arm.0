Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2290065ejc;
        Mon, 9 Jan 2023 06:17:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvqZYJaqRHYKwN2UDiJgppkHTLoLsyLEeZWVTS4mCQbARp8iziss/GS6rD4QMbG+I2g6GQr
X-Received: by 2002:a0c:f906:0:b0:531:be1a:89af with SMTP id v6-20020a0cf906000000b00531be1a89afmr44462370qvn.6.1673273867342;
        Mon, 09 Jan 2023 06:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673273867; cv=none;
        d=google.com; s=arc-20160816;
        b=rQOYa63z63wZZw/h3XHRsIo6fg4MyPZV9mWGstTy4bby6IgOkV+/zVpooFP9NGjMuD
         R5BX1CE83kY1kt+CDh+uhTon/e5JoxbHwZllbj2AhgmjvRXpT/0U9a96bD6g7d0ynPic
         9XW6lo6W0zBg9RmeVFukAp6jsMrrlym7+C90Rcx/FB5IA5hPvW0SA+qHtmZfxH7ScfTp
         r+xO3gYGS9Rdc6BhGYEPIRQ2/GN/0Uqsp0l+qzxZbGlPSwemk9DyY8iaKQIhIkgmyth0
         90ykrw3QzeNHXRS5TzqOzBCkHXMMsg6BL75mzgOUKS43OwSeYFKu/eA1VeXCxKDlSh8r
         dA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aIhg+s5O4aJ/tYVo4sVxeOk6SdlJhgUlESHjMAxmSzc=;
        b=gbNX9Onh1jBZhPf9uWu/penTGTdrzgVddOOjjK9QwycH8Ul5ehdR/9N0wXBi9DCz87
         wfOUJxt6xbmf2OnQDxNZC5PlFOQ+Z5ZsHRqTvHcJIhCPoddbZRe6TeieA1xUlljYWSvx
         LAt4IfZpMmfmmdz4OXSbhPPzmpXqEl69oP5eB7FC2dAjnPHBb/AyUj2n4g2mqt2jQ7lv
         w6Vd4ormLZYBIwgXbX3Ukjgn9Zxg4iJPsNlFTwL/Fe9Nn8P9IlKkB8H5EgMOql5+bLWM
         tDhGeo12lXl3uZXzhQKpvN8JcZs6qjD+3jLeGAn0rEI9lPy5XWAkCGPUwzCwx6hAUnUn
         HKmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/zKM0Pw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm8-20020a056214268800b004bbb0cf46b3si4566346qvb.325.2023.01.09.06.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:17:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/zKM0Pw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEskp-0001jl-0J; Mon, 09 Jan 2023 09:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskm-0001iW-T9
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:56 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskl-0006WD-7U
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:56 -0500
Received: by mail-lf1-x12b.google.com with SMTP id j17so13117376lfr.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIhg+s5O4aJ/tYVo4sVxeOk6SdlJhgUlESHjMAxmSzc=;
 b=l/zKM0Pwa3jr7rVU6rO+nxm/qCoem0rZvh7poReOaAkzYthjRHOpuu/B42U4qeB1+v
 SwYaZDJhIFOHmuudbm972z6H9/ZiQbG7TWwPdKBsxmKi3DAMT548CjVL4Po1FDnPqapK
 7F/CSZqETYtTAsU1GYQO+VTisp3vbRbP2vppDQUB4DqWhlHNbptLt7e0OfyTkl9MHTSN
 Bk4QzNBRJTPyVQiKe3eJlvY4ZgzSbDTOOUDKZD6gM59HZp6a1tmIupboXOmiyI6Io1sS
 9h0eta11kF93GBR0MZ6gsygPQvAfe8d+CyLtl9WUG93ooluBqJFeeqRDiAaT5icOYcAs
 Fu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIhg+s5O4aJ/tYVo4sVxeOk6SdlJhgUlESHjMAxmSzc=;
 b=KCbMzpInYZIJvg1oWKPHbnRuU52xixqfbCtVmlcdz6/RwQ7pw3DsfnO2oPWcal8uth
 JGnL+5L8yn6Y01Dicv4o9r2VD8jnUTub+gIUiyE6gEDF5Z+pzZFz8jNANCDiR6gGEyjb
 NAB3AyghFD8oY3UEDTY0OjPbqN4mHAvfYKmwwpxu9WPgja9bV/pSHvCwlWg26b+EAhwa
 5/W30mm8G2ygGIT5XULG1ATwGPRrUepw7uHNF43lEXZHSSTnqqeHwd0JPqEn09JW1GOB
 DSygCJWKHzm78aoCqWi1WAu9Hpb5IU+ov3KtyCM7EoscKU6NfiedOjqSm7c9m7ogMOMo
 QCrQ==
X-Gm-Message-State: AFqh2kpl7N3xTkagZjO0rXXvKWbV7Tn26xeL5SqpsyHuXJH1+lKGuaQV
 qo38grdjJwpfm1ZhgygifN7g7Q==
X-Received: by 2002:a05:6512:3d2a:b0:4ae:7974:7d32 with SMTP id
 d42-20020a0565123d2a00b004ae79747d32mr165993lfv.29.1673273033496; 
 Mon, 09 Jan 2023 06:03:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm18480217wms.43.2023.01.09.06.03.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 09/14] hw/arm/bcm2836: Remove definitions generated by
 OBJECT_DECLARE_TYPE()
Date: Mon,  9 Jan 2023 15:03:01 +0100
Message-Id: <20230109140306.23161-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: E3UBTXPBus3C

The typedef and definitions are generated by the OBJECT_DECLARE_TYPE
macro in "hw/arm/bcm2836.h":

 20    #define TYPE_BCM283X "bcm283x"
 21    OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)

The script ran in commit a489d1951c ("Use OBJECT_DECLARE_TYPE when
possible") missed them because they are declared in a different
file unit. Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 24354338ca..f894338fc6 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -16,7 +16,7 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 
-typedef struct BCM283XClass {
+struct BCM283XClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -26,12 +26,7 @@ typedef struct BCM283XClass {
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
-} BCM283XClass;
-
-#define BCM283X_CLASS(klass) \
-    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
-#define BCM283X_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
+};
 
 static Property bcm2836_enabled_cores_property =
     DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus, 0);
-- 
2.38.1

