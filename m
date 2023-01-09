Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2089815ejc;
        Mon, 9 Jan 2023 00:43:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+VrSVX/SI1TN3RAUCUsUhwOTvNBSlH6OWN8dH9/kaLkBBC8Tc+LWpCtnR2oDa7wqv3LmM
X-Received: by 2002:a05:622a:180f:b0:3ac:c79c:bf8c with SMTP id t15-20020a05622a180f00b003acc79cbf8cmr7328749qtc.30.1673253805623;
        Mon, 09 Jan 2023 00:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673253805; cv=none;
        d=google.com; s=arc-20160816;
        b=PNkA/EZ9hva/MK/j3q7RwrbM4PsmNNZLgGC6qQdDH1ZOp4TWmiZ20GnrMP+Bq77KwY
         lJ6L2RD6mkorTilP+nstzz1eJxT6apbIHA0BB+e/JsYLESkw4JO5zLIuryBfURVOIMn1
         ew0YDCmnuTiFMMJuZg9/MQ71q+OEM3Yg8B2U/Ulf2Z34405XtDAptUOMA6kfGF8H5V72
         iBwAIN9xGFcZOFDUOZ7Uls1R8VugwVeIJ1WZFhJbxjzjY6wLzWqu7RWzkDBGHymbYIWo
         RmLlb4g3lCJYIzHjAIohegIz3QCdjzetSE4bLgoAeQJ5cf1D3MuYQGDndQT2YVbDOG2s
         VwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YkFjYPFzUw/uhM0dOjJ0XXnVDH6Pxtvb+WDPgdl3CFI=;
        b=vwc74XqtbnczG4qpVut1LqgfnGlV9+zarD9LDjEnIAzBpN1yUO0jJT/Y4a9zEqWTgi
         faRAp1Ewk23Dpd/I4pUOtEWxqvU9xiYdEteTg3+nA0jvJQDbIz0AiGNkcdDK9iDUOKZu
         6/PynwOmy4gYJUrOz7jnikn0DHnIEs9oMxKDbSfhH+kye40+ylnZPTU/6RKP1bIqiQaj
         SZYrVTY6q19h+3pJMEkviZ4U0SNCsRKhdukqmbz6XDdiN5bLAmA8GVlIzVy8pFNyrr2v
         CzuCW6243meg+CpHXspm1FIo3Mi6BNxzXuekCpO1hQNiyVv9ldIox8myZ7Mllfi3xb53
         12og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRIdU1I4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc27-20020a05620a841b00b006c81aa7656bsi3968661qkn.128.2023.01.09.00.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 00:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRIdU1I4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEnir-0005gv-CK; Mon, 09 Jan 2023 03:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEniq-0005gS-IY
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnio-0001or-Ea
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 03:41:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ja17so5696146wmb.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 00:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkFjYPFzUw/uhM0dOjJ0XXnVDH6Pxtvb+WDPgdl3CFI=;
 b=nRIdU1I4i/bx4omiQof6SvnSGznHC44HR/u63P8ElDOfpec0llDkAI4gb6La1cdk+C
 CvsLIQYQvuBnSMMaxZet3az4SDSMy8IaKHg13IwNLhQNEvtyIGYoYYgcJatOgxiMIBRK
 HPlJAkaue0yWQDYRy3lW3Bb5mfnEflZM/ILfiS+GdAhtl1eltQ1dEpovlsm6tm3Pb9/r
 XvhcQee0t5Tn2fZEiYWghX1u5sP3mvAmDbkHhzDTVedYrT5aFFRGglCuUmsrdcF2vjwU
 HovPSR84gjU3iEVsf7fa4NCttov0vtnfc8P0oL86sfE0wTRlAOzBw3CKiPhoFqVT82Db
 ssig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkFjYPFzUw/uhM0dOjJ0XXnVDH6Pxtvb+WDPgdl3CFI=;
 b=IRRMuSqkd6lQRU1QS/Ci706GXFsN1wOuZJ0568/IUaCl23KiPoOH2xMRfp7gq3xRol
 TSozVAMYhC6uCL0oWZjikYbMUNzuMRO7M9DfecwTE8I5AgKEcX10ctuKU6LCTqEyyjvZ
 /AjWDPgOknbaQsLVScEqoyuJwTpNye9Ic5fc3uM6ipebRRpYMp8ks+0qUZdzII3MOb5p
 mOTXyyBA1YsRsamHTzUowxtQPlCSeE5RPU5WhiMaRH3BKV0HAaERhfBpuCVvn2ANSTEs
 A23iXGQLlPh5KoLh+sGxQWujV78Elk5rHnqTVYQXeIgnWhyy+jCvhSXqhKxvqkgTVidN
 iwqg==
X-Gm-Message-State: AFqh2kqnnt2p0MoHjnPTucqB2DFXXdXqW8dsmV66VNSq+brsv0DbQHxx
 U3LkqhTBirYdRFWc71TJRNZsBA==
X-Received: by 2002:a05:600c:1e24:b0:3d0:8643:caf1 with SMTP id
 ay36-20020a05600c1e2400b003d08643caf1mr46383087wmb.16.1673253693165; 
 Mon, 09 Jan 2023 00:41:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c444a00b003d998412db6sm16163677wmn.28.2023.01.09.00.41.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Mon,  9 Jan 2023 09:41:18 +0100
Message-Id: <20230109084121.72138-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 3tZS493iWTmb

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index ac84bf0262..e41cb63daa 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -165,9 +165,10 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
+    /*< private >*/
     SysBusDevice parent_obj;
+    /*< public >*/
 
-    MemoryRegion dummy_iomem;
     bitbang_i2c_interface bitbang;
     int last_level;
     qemu_irq out;
@@ -188,12 +189,8 @@ static void gpio_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
     GPIOI2CState *s = GPIO_I2C(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-    memory_region_init(&s->dummy_iomem, obj, "gpio_i2c", 0);
-    sysbus_init_mmio(sbd, &s->dummy_iomem);
-
     bus = i2c_init_bus(dev, "i2c");
     bitbang_i2c_init(&s->bitbang, bus);
 
-- 
2.38.1

