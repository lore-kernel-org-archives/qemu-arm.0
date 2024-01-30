Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1023912ejk;
        Tue, 30 Jan 2024 11:03:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUl6po2kYhK+FIfwfDfF+mGy6uWooe7YbXJe/Hy9Y5eLyV/NbIh0Gw5sZoNvNlL5NrfUR4
X-Received: by 2002:a05:620a:2046:b0:784:9c1:1fc1 with SMTP id d6-20020a05620a204600b0078409c11fc1mr2169122qka.32.1706641422291;
        Tue, 30 Jan 2024 11:03:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706641422; cv=none;
        d=google.com; s=arc-20160816;
        b=IwMlfqJVVSHSEHbuwjouAu3LYOktE/ZIVXZhUDuuwRRmiufSLYWwG7I+IY8E9BVpCE
         Xql6+NhYVZkNEZDUBTHwu6gUxIRxWT5718lNFREu2tnNE+0Tr4EbJpwndEqr1cTJAgPK
         BWlDtdDf6HYdxdfyo8bn+IdSArQWVxzUgQ4uElW9Oz87ifTcPo1VNrT4ufB/VpA48DXY
         ATL2DuhTSPYaIYFD+l0O7GxfalxHnZOA0Og/njQOHhg4tm7MO/2S2w12hhmJExWXIioM
         wS/WTPsi6nA5I20e+kx6RJeu7GrTD9zUZdfCNlBxgBzOAyrUnYqJW8QpOx3f+Lsv95FK
         ghHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Uha9WaUXkaJpBldRkVdewGQYlJYY1NU670ANqpxdAMg=;
        fh=SR+8DozJdQxNforhpK7RQJlJqxcnmmBQq9YEbztxGAo=;
        b=NU1e0v1kAM8hvyTGRcwjadsE7zcl9rixXgtzgZl2h0up4kT5n6rHlBkZhP7QkwFp9y
         4o+OHxJdUQ3XeTy9yru/qGJQTYZxudvf2uBHVAgsEQUeDh/b9pYPMSGbx/Oa2eFpLDrR
         Ra1RkOGUawNFqZMiXly10raZWEN5pfxxjCbavz7UNkus8Jd7MhRICbIAL+s5rce/mqbE
         sFgucJbjnnlDPesE5tWRMj+jPB45O27cZCuoc2gJQa3IeQZziUTVEqUZVllvN17mZ4n8
         +j8GhttffI/iKQXIIfV9D4bMKdvUZXRSRDu2VNTszfVpiiCq9dC67UTFje9dR5vpaEeM
         8BCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSSwV83e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a05620a2a0200b0078392895bfasi777958qkp.306.2024.01.30.11.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 11:03:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSSwV83e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUtOP-0000xM-7R; Tue, 30 Jan 2024 14:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUtOM-0000vy-Dg
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 14:03:30 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUtOK-0008UU-4H
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 14:03:30 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so616195266b.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 11:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706641406; x=1707246206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uha9WaUXkaJpBldRkVdewGQYlJYY1NU670ANqpxdAMg=;
 b=MSSwV83eNR9FGLpmJSssxUslPb6W8kIccTFl5XC672cIbn6RhLZOHKd2oN80hEXwkU
 nJJ2Ovd6rUPHIkWxzcaR64AFnh33WPKAOReWeyAbYQx51QEX5912SOZpqS71fhstQOKx
 SWlkqFm44H9nnjX4IarKtpio9aADYSYs2xKiZ6My2CAekgAsbs6osR6AoHboXTApTsQs
 3eFvzHIP7COPqMHwuzYX67cavcFC/e5/cfvgr3ey5wxnPla3hpJiKqviK0MvWtIrhFRf
 +lcBdsh4oheTrDH3KPFsj3l+yNhvr+hEAt1Y0rkhI2jKud6Wdjf7tIJy6tiUnlctFu77
 H5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706641406; x=1707246206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uha9WaUXkaJpBldRkVdewGQYlJYY1NU670ANqpxdAMg=;
 b=ayfeq9F2HWUMd7i2boKqZxc/WXfkpufjVJpLkttWnIiYHTePkba8nh2g9hY8jn8RaY
 /ShtgW6lKQ+1n2D6oC2cXe5731Mxe7869wfdiLG65LxjhfK3kKwThmR8HFR/Wp9ltBBF
 KOC4nUZOhDy3GUvBPmAlBKhuk3B4SfbB+AEoGmh9JGYM2lPaGobdklx5yeFg92cPxqeG
 eWjdW8ey9R+YDtkPxtHqC1U+nFwOTe259rVbDgMcDLKpiQuYF8/vk9OLZXc8dqk2rCwh
 hwkQIKyWmUjBkfSpVR0SFjRR8YEGZvnGlMJgtT0/Ace5DrvQtkdX3XP9ra5QVlAHBjqr
 RR9w==
X-Gm-Message-State: AOJu0YxmhwMBvpUo15JvzwOqJwwp5C6C9hNAsCsy7ttxjy9gzJ7Tfo8n
 8aLTwbfRafTGp1abIWN6GJCEEUEiI5cZs1A2iTafAmnL9AtJ99zOmkJKy6Ky+aw=
X-Received: by 2002:a17:906:489:b0:a35:ad04:dcb7 with SMTP id
 f9-20020a170906048900b00a35ad04dcb7mr5066014eja.17.1706641406542; 
 Tue, 30 Jan 2024 11:03:26 -0800 (PST)
Received: from m1x-phil.lan ([176.187.218.134])
 by smtp.gmail.com with ESMTPSA id
 rg9-20020a1709076b8900b00a35464aab52sm4190773ejc.96.2024.01.30.11.03.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Jan 2024 11:03:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] hw/arm/stellaris: Convert ADC controller to Resettable
 interface
Date: Tue, 30 Jan 2024 20:03:14 +0100
Message-ID: <20240130190317.25692-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240130190317.25692-1-philmd@linaro.org>
References: <20240130190317.25692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: 4vlzT7xqxdqT

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d18b1144af..afbc83f1e6 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -773,8 +773,9 @@ static void stellaris_adc_trigger(void *opaque, int irq, int level)
     }
 }
 
-static void stellaris_adc_reset(StellarisADCState *s)
+static void stellaris_adc_reset_hold(Object *obj)
 {
+    StellarisADCState *s = STELLARIS_ADC(obj);
     int n;
 
     for (n = 0; n < 4; n++) {
@@ -946,7 +947,6 @@ static void stellaris_adc_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &stellaris_adc_ops, s,
                           "adc", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    stellaris_adc_reset(s);
     qdev_init_gpio_in(dev, stellaris_adc_trigger, 1);
 }
 
@@ -1397,7 +1397,9 @@ static const TypeInfo stellaris_i2c_info = {
 static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.hold = stellaris_adc_reset_hold;
     dc->vmsd = &vmstate_stellaris_adc;
 }
 
-- 
2.41.0

