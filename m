Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2116573ejc;
        Mon, 9 Jan 2023 01:39:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXva3iAea8yMuYc15068U5P2eKIQaIcDA/6ryswWfFxqldBSFP/4PeUTQVPolQt2urg/2ZU5
X-Received: by 2002:ac8:4742:0:b0:3a8:16d:ea4c with SMTP id k2-20020ac84742000000b003a8016dea4cmr102010232qtp.31.1673257140163;
        Mon, 09 Jan 2023 01:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673257140; cv=none;
        d=google.com; s=arc-20160816;
        b=OKuGk9sT56mkQQ005JPaBDRacvaMO6mEp1o0y3c9RYq1/rl9uHi6mUTlA08XUIHUBJ
         f3ZerXW/utvj6R0hBUZ6sj47X3x0azi/1ysk7bG/AkJiGZHiebOTTG6shPBt86yw29Ed
         zFPqOmAFAvcoiLKtMR85lijwySyUvaq6rHlZj8yQJ4QNZXeMpWxd6KV5vUDFd2sarXQ0
         ILeChpqXPcYVQJFq326lBO9NNIwbBc9YN844bMl40Ssayhu81e7RvxnUFUJhheUM1MxS
         /PKQx/9SsLn+Esyc2H4Jib1MLOhVxP0TGx+HqDPO8gUUSv6o1brUbJwyT+VfZo715IdK
         +CVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FvquKJo5kaY1zgQryRGVpaPOLLzwnxxyM3RwhB/Stuo=;
        b=TkpkNPewdXo7Q21Kou2LBSciEg+L+ohl5DCR2Vxbb/cx3DCc2kJkyZDkmQKqPJBMUk
         5XdLy8B9n2BkVQoH5BoDtWlzhzjSzBhsNiiG9abDd17w785b7bxIKte+lpyEkVYnfcPE
         l+aC/rhEnLCTT2OOHjVrryMf11SClz/Ywmyk21q/gz+bWGK78VmrXsX04AyChxLnT6VX
         rkQItUUqrk8q2TtVJU2cOgPAs5rNI+zPwUclndb6X5aEUzeueFPTH8qDwfw8/hQJ4YDc
         +i5U23mdhOvCzupOtjNgnBU3Y97qFaeIruRJrCgfE7/o4X8NNYRNZIZnccsTmmyBWGgi
         mtdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qJ/L/mGO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx11-20020a05622a090b00b003a68b8303c4si4359854qtb.690.2023.01.09.01.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:39:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qJ/L/mGO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoQj-000448-JL; Mon, 09 Jan 2023 04:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQg-00041h-Ci
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:26:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQd-0005X2-D5
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:26:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6112815wmq.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvquKJo5kaY1zgQryRGVpaPOLLzwnxxyM3RwhB/Stuo=;
 b=qJ/L/mGOhcUGaMMHLzNnPOcFwLD8NaBXIhfwQAYAUDnykLgrt0YTjfFZUyh6ynbsMb
 KeIcdlWhlOoOIFJ6iBKzFxbVXLDujnFMjdo0kGnE6zoCqo3rgpfF7fElBogJmPJQ4Faz
 V8aAoNUQrTu9hHk33Xa2WHSjk+DJig+01NV4HFfpi7124f594YTC8iNqqAfJMt0n4KIf
 t8pnGVDB3QsQdeaVD+d4G24ZEbPJOM9YUJL2frQlDUFF6vxCQzTuxYnxmR3mFLjQcZfR
 10+9oj39m+EWla99AZONe3urrwbt+8dDH1JomydDcr1KrBsum7n3Tp28HFPZyfEithix
 bUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvquKJo5kaY1zgQryRGVpaPOLLzwnxxyM3RwhB/Stuo=;
 b=lj5KCv8zcG4mZTndMjnMPX+NMCVST/GyPywlcJ0w+YMGeIO6XGKP7hDgWF7JcwaMKy
 5VIEM2jl10OGOaD7J9cZGffv74F6/MLjNz5yhebgTd8Cbd8bWIAuOF/gockb62PE+Q23
 kYWlWgkzIWN+kAGx+Q4vbFfu4fdAKarDpOK3i3BjkfEYJSzBRPWkaJBv4+81Dk5EAgBV
 Ul33Yz8mei3xTcCGlNZae6ljvRJ4KeTVm+shH+xiWwR0Gb2CgbNMjALTalDxBvouMS5e
 9s05+OEb8w0IeoY18nQEZZmap/IDVEagLvx1J5CBpfSl0JTUER2q/faiWu7EWPsEwaza
 ruZQ==
X-Gm-Message-State: AFqh2koEgPgZl8pUZ6KSN6f0/nLWLhar92n6nmhnPyPv0KNu6F9epK0z
 4pb8i3iWeRwCGzQWbXxR78YHwg==
X-Received: by 2002:a05:600c:5008:b0:3cf:6f4d:c25d with SMTP id
 n8-20020a05600c500800b003cf6f4dc25dmr45672643wmr.21.1673256410043; 
 Mon, 09 Jan 2023 01:26:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003d9f14e9085sm2167906wms.17.2023.01.09.01.26.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] hw/arm/musicpal: Convert TYPE_MUSICPAL_KEY from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:14 +0100
Message-Id: <20230109092617.80224-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: hNYxdAwFkIX2

Nothing in TYPE_MUSICPAL_KEY access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 13f4dbdbc3..b496ff8a22 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1068,7 +1068,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(musicpal_key_state, MUSICPAL_KEY)
 
 struct musicpal_key_state {
     /*< private >*/
-    SysBusDevice parent_obj;
+    DeviceState parent_obj;
     /*< public >*/
 
     uint32_t kbd_extended;
@@ -1187,7 +1187,7 @@ static void musicpal_key_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo musicpal_key_info = {
     .name          = TYPE_MUSICPAL_KEY,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(musicpal_key_state),
     .instance_init = musicpal_key_init,
     .class_init    = musicpal_key_class_init,
@@ -1301,7 +1301,7 @@ static void musicpal_init(MachineState *machine)
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
-    key_dev = sysbus_create_simple(TYPE_MUSICPAL_KEY, -1, NULL);
+    key_dev = qdev_create_simple(TYPE_MUSICPAL_KEY, &error_fatal);
 
     /* I2C read data */
     qdev_connect_gpio_out(i2c_dev, 0,
-- 
2.38.1

