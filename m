Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1464951ejb;
        Fri, 3 Feb 2023 07:00:01 -0800 (PST)
X-Google-Smtp-Source: AK7set957N0BrADQSmAZleSc9mXrf3j1iqzmeNN5txuVBjMqU0gpO+PPS/ifgcmdKf4vWpFcV9uK
X-Received: by 2002:ac8:5c06:0:b0:3b9:b668:6baa with SMTP id i6-20020ac85c06000000b003b9b6686baamr20838751qti.19.1675436400773;
        Fri, 03 Feb 2023 07:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436400; cv=none;
        d=google.com; s=arc-20160816;
        b=mdC8dzTZsu2yckWdS4HWVOTjW6sZCkQeYZsdNvIBX57lT2IQSZUzBAvXuYaF6kSWUh
         aNjkvwpOyk0HS+Gdfv+NtjxuZgXPdIfboR3AO1RroB41ft3cXmMf1vdBUqnfGpjlFI1j
         vYd0IvywOCOFuJFjC1r+xL6J3bWEAIS2uboqzlRKCks5Q5c252lMJqXEquGuD2ohXy+y
         MTXFdpikTR++YlBDw1VxnIVD1v7IFFH5lGqybVMGBFnaw+49Xrcecx16OL9hiN5bYdDu
         lyX5jMEH2U9lDaOfKgf3QDj0Or0Y0K94Tvz4xsYKaKAdDd5NBte+a1+Uv1RlIGrK5JgX
         4K3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VgyTPh7msAYyuAXqahXOmNxtor/LOuPPEC+v7SLH2W8=;
        b=UJt5u9Dr9SWNdzPngDsFOrRowiUYHdwOFFbbk4uccv3N9XlJ3Zxs42rRLvmFb1EM2o
         KmZmgYA94cXzUf5CQHWtDTE5KVCSTAoHmTWJqDjjouSF3NXuZB3TEoYW8BHjSQS+mBUa
         ONM83BHehVvpdLxORGxgXi3mzdkU8ADshNsAGUwz53DJhy+Th3+LaJvt0I9cibq6j7Fr
         51oEEgZ8TRVYGrZ+KtM6quxEgUeu2d0PYrSvTI9D5bhC3P++f21iRIm5aC5PGdG20L8U
         CUW9naKqzpTEP/fvFqHRfu7gdTLxFmb3UM0utdSafmkgiwrnAG8Z4tuSKztA1vTB/rCP
         9HmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r84hhi6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ac85c07000000b003b86be9c604si2003813qti.301.2023.02.03.07.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 07:00:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r84hhi6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxUa-0003Xi-S2; Fri, 03 Feb 2023 09:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUZ-0003Uz-9K
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUX-00064c-L5
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6180256wmb.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgyTPh7msAYyuAXqahXOmNxtor/LOuPPEC+v7SLH2W8=;
 b=r84hhi6bkgbF7U5gkkwUAmM9YrM7x6BKIexLXhgMtE2lqswqmHkfe9hxI8t5xBU14t
 dj5BB5ssopN1lAB1rE+24vzCtuLpXnutmtOJp2sNw/NJgL/vadMjKgkGXol4CWbdeOkf
 urZgd3AJ+lTm3bQMfL6+QI6l+6J2qiZKXt6Co+N3NcnIVdLqmdk4zztxpZj7+VPsKsXi
 EVo0REZlkgEc9d8GcRJ01DM3r13TABhWfLxLqlThF0cE80Rf+n0PHqJuPt5jvTimpStw
 G2FQE26wFzLDfBGQS3yc5mDs26GDI491hY0FH5mhZ6mIsNweKFbIbEamWXUZJaPd40cF
 +qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgyTPh7msAYyuAXqahXOmNxtor/LOuPPEC+v7SLH2W8=;
 b=UzHxcspeGHI7VsdoRN96ysoItBIuv9JDRqBoGLD+91JMkbdj5nZhaBFPOAA0QgeTzT
 TFInkp75zbCpGdCmVoKzii69S09eVyNpVre4czr0Iehzh8vLMs3gbP8E+lMvJcJ8Kg7N
 3PKkY9qrK59s8y/kk8EVX++KghvcSs3UUtRsCM+JwCWLHGuG1S8BSofndI6kcM7dEoPn
 G9QuIGwIF+1FLrPOlgnCpgDn9jln8aU5X2Y8qH4j9SjoSKFZJpDqI0mVt/0XGyvrq2ak
 /QSAG1z/53ucAfXV47/nCmMkbV2wOKsdXUO0cSiUwVv5In4K3Y5xNHas4P9sGw14sikN
 TZjQ==
X-Gm-Message-State: AO0yUKWHNJAcQVNEMPGxA56FZbPgBpgWgeNVQaBv2VcynwFu6ZG/AmO3
 J6LX82xwfuKdDXSLbvbno2Qtww==
X-Received: by 2002:a05:600c:3588:b0:3df:e1e9:201d with SMTP id
 p8-20020a05600c358800b003dfe1e9201dmr5125160wmq.40.1675436200274; 
 Fri, 03 Feb 2023 06:56:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a05600c474e00b003dfe57f6f61sm2543539wmo.33.2023.02.03.06.56.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
Date: Fri,  3 Feb 2023 15:55:33 +0100
Message-Id: <20230203145536.17585-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XzDy1wKuqAuZ

Since now PCI and SysBus properties are identical, unify them.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index efebd93f1e..98375138b2 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     /* TODO : chain irq to IRL */
 }
 
-static Property sm501_sysbus_properties[] = {
+static Property sm501_common_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -2004,7 +2004,7 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
     dc->realize = sm501_realize_sysbus;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->desc = "SM501 Multimedia Companion";
-    device_class_set_props(dc, sm501_sysbus_properties);
+    device_class_set_props(dc, sm501_common_properties);
     dc->reset = sm501_reset_sysbus;
     dc->vmsd = &vmstate_sm501_sysbus;
 }
@@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
                      &s->state.mmio_region);
 }
 
-static Property sm501_pci_properties[] = {
-    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void sm501_reset_pci(DeviceState *dev)
 {
     SM501PCIState *s = PCI_SM501(dev);
@@ -2098,7 +2093,7 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_DISPLAY_OTHER;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->desc = "SM501 Display Controller";
-    device_class_set_props(dc, sm501_pci_properties);
+    device_class_set_props(dc, sm501_common_properties);
     dc->reset = sm501_reset_pci;
     dc->hotpluggable = false;
     dc->vmsd = &vmstate_sm501_pci;
-- 
2.38.1

