Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1024345ejk;
        Tue, 30 Jan 2024 11:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQu7nfrYyBRkDAsOcrHmSybXlcQpsUhX0MqKHN2V/wjXRUbifgEDSKtgrQv991BuYLhjv+
X-Received: by 2002:a67:fd56:0:b0:46b:1870:e47c with SMTP id g22-20020a67fd56000000b0046b1870e47cmr1202201vsr.24.1706641455398;
        Tue, 30 Jan 2024 11:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706641455; cv=none;
        d=google.com; s=arc-20160816;
        b=V8WaNK+lcYYBT7/mb4oa/o5I/Npx8CziDHm2VuwWpYvTuj13mtDANp5SHvnyKKImam
         zlCn6dpp1H3v5OtFWGnKeikWDqYMEYpCYw6t7r8bJtxRXpYy5qBlPFPHjuSxTQ2jgGMY
         Mxhk2L8m0wsUQbb5YPjc3z0wRXmQJwFKIqY8nJ0ki0rO5VURPt4RBCLWMDf7us9EL3xn
         gG6sKJ+w3mE5hF2zDkxbolwH7ubngGu/EqXUTGgUhvfgITbPZkPD9TdQPO+83OkUVTZ8
         BDT63cajFfQz+mSH/Xd/0z5mGfkivgqIItcyApWBpqmwq2NrQ0knm+21uwgNb7d/i28I
         uV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UWlZLNkviQ6+EOhMX+hVeP6Y5TmUtDE6y8FSkM9wd24=;
        fh=SR+8DozJdQxNforhpK7RQJlJqxcnmmBQq9YEbztxGAo=;
        b=G9U4c6JJuxHWNsEdx2W0j6KAooyfqyxV3t+zqh5etciPev2vcBER17qQMq+4YV3jKQ
         ku2db7wDQ4VDv0/8Ywqm1ByT/rkg/ZlUVh4jfATWXgp4fvrvYAP3dOdXm6afIy4sXch8
         lCQ9I50sMjubWCL6pHTs6KKSj6Z93d0+WVAj9ZEMYiN42gFeXug08yYt+at+Qs6/KKsD
         csJq8TlubwmHbrDLwSd8Yh8zcFSQbQqZ+iweQ5wCfwsyfZ9UVOIU/Uf4eXUeX+frSqPh
         btj23PG7NG7YVWo/p7hnY3FnIsfSKiq22eMCs7G4HVX3C1Bc+4S9NXJTTPDPmqnJHKeG
         FYDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwsZiYGS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020ab06948000000b007d5a891ae8dsi1159357uas.167.2024.01.30.11.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 11:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwsZiYGS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUtOU-00010G-1v; Tue, 30 Jan 2024 14:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUtOS-0000yd-HY
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 14:03:36 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUtOQ-0008VS-67
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 14:03:36 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55f13b682d4so3221832a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 11:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706641412; x=1707246212; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWlZLNkviQ6+EOhMX+hVeP6Y5TmUtDE6y8FSkM9wd24=;
 b=XwsZiYGSpdGQn9pUfD+zXgF9ymC2HRfxDUPXrvPdqFEXNbeuDoMqmR7zkw132UCT8T
 KMbAFvt8EFNbC3Ab2oxc6TwHsnGkwwwvVp13TbFR3Sxl74TbTN79K1rZQZycJUjS8gfv
 /HWe5lnn4jMriSx11ePe5QZCoSvATpdIpOEzWl1IwIAT25/HLkkWIdLl5Z7bSR8YxTPo
 mkBmtjYxmK8elLWKErTDUSxpwnceRo5msABV7101+FmGBcW4zPNaESFb8PYIc7n1rFxK
 bjL7HYHSxpcCyx0SoWKjE1SYXW7n1lPhkkIKCkBBe23JnODniCKGAFBwKi5V83K1fvds
 kJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706641412; x=1707246212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWlZLNkviQ6+EOhMX+hVeP6Y5TmUtDE6y8FSkM9wd24=;
 b=hSsMqASsNxGepcuriWiuaHsjBT8CICOhBtMP064o9ncLY+1JEF/qFib4qEW+6KQ3kH
 VILR95APD7cMyBf4XhHNVCVLNqkSyaXH54pmL6dkm6M3r2e76igHkpmNSWrTcsIN0Ekz
 2jppVPO0oyx579Tpje9KgzPeUR9+Sxd8Onf3LSKgy8lk66CEXKLb27RxJRTMiPrc9vGp
 madi76QPEAyZBHZ/KTtkREELLlzTJTAYhLWeNZ8ahYbwhyrIGd1vklzIYOBIQ+h6DMUW
 EL6TF/O25eXL7LmCon82ggmhUpm0IA4bbRXYGchN/ZnjJtTy6Zp80C5PwMGt5Dj5+vTb
 6klQ==
X-Gm-Message-State: AOJu0YwbdLKS+slfOZ+bPrCwmY1AlPIGxx9xiF+lf/W8TU9MNYBUk0Rg
 xAfyQrq/2joIrRI6vUZ0iwqagH4/7tmQCe1PsaWCkuD3HeqCtJADYaR8E8KYoK8=
X-Received: by 2002:a05:6402:348c:b0:55e:f37f:7fc5 with SMTP id
 v12-20020a056402348c00b0055ef37f7fc5mr5533517edc.14.1706641412509; 
 Tue, 30 Jan 2024 11:03:32 -0800 (PST)
Received: from m1x-phil.lan ([176.187.218.134])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056402428900b0055d333a0584sm5111597edc.72.2024.01.30.11.03.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Jan 2024 11:03:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] hw/arm/stellaris: Convert I2C controller to Resettable
 interface
Date: Tue, 30 Jan 2024 20:03:15 +0100
Message-ID: <20240130190317.25692-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240130190317.25692-1-philmd@linaro.org>
References: <20240130190317.25692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: udkNl+bLQPzW

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index afbc83f1e6..284b95005f 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -607,8 +607,11 @@ static void stellaris_i2c_write(void *opaque, hwaddr offset,
     stellaris_i2c_update(s);
 }
 
-static void stellaris_i2c_reset(stellaris_i2c_state *s)
+static void stellaris_i2c_reset_exit(Object *obj)
 {
+    stellaris_i2c_state *s = STELLARIS_I2C(obj);
+
+    /* ??? For now we only implement the master interface.  */
     if (s->mcs & STELLARIS_I2C_MCS_BUSBSY)
         i2c_end_transfer(s->bus);
 
@@ -658,8 +661,6 @@ static void stellaris_i2c_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &stellaris_i2c_ops, s,
                           "i2c", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    /* ??? For now we only implement the master interface.  */
-    stellaris_i2c_reset(s);
 }
 
 /* Analogue to Digital Converter.  This is only partially implemented,
@@ -1382,7 +1383,9 @@ type_init(stellaris_machine_init)
 static void stellaris_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.exit = stellaris_i2c_reset_exit;
     dc->vmsd = &vmstate_stellaris_i2c;
 }
 
-- 
2.41.0

