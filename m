Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2111894ejc;
        Mon, 9 Jan 2023 01:28:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsNE9QtiIjRyTbwgmANxksWBafHE/Qi1a9hoFaAawZN/SXnajdz4g80atyKMfhbSmNqLto9
X-Received: by 2002:a0c:f78c:0:b0:532:31e5:1566 with SMTP id s12-20020a0cf78c000000b0053231e51566mr1970513qvn.12.1673256516420;
        Mon, 09 Jan 2023 01:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256516; cv=none;
        d=google.com; s=arc-20160816;
        b=u2lRJBfKKwPI1DxHd3kz8gqSc1uGVNV29sZ5FtfLLxRKDPkCvBWzvXN5HAs03VeayI
         JYfMcUUH7+rObSZLBWrVjxiNL5C5FuJM7j9c81vpkkKPwhQjGehQDQ9J/EfUQANwjqJR
         zPNxBvaTaGRDO4YX5/pGH2eW0db1hePzlv3J6zpjkjEVcuAl5xM/CORusrCNvMMHTfLa
         fMkT9kBJKOOTVmETZbZyqXljmJN9eRO3JVKwOwgi9IlNzgyXYNi/xRVls8gTcTyxQxLA
         Jn8Kju5aCK2WqVVz0vPylptdORjg4taPqM6lsL3glF4dS4tRg1gi3+MXwIy0ik6Y+WA0
         hilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NE5J326RXvgXHGZhWzejrwD6fpnpQEJ0QTafe4YZjeM=;
        b=CGhpDK6SBvTomC0RmtDYTqp4E5mGyRo5KL7wvuz3WPhZFVlue9RiWNj95UpsrncUAt
         7Jjb5qH5ontNbxwTKxJgGB2AcVnn7doH/BQ8q+307KJWuuT9mYMxfGKl6DiK9JiwB4nK
         QaX1C9Ya4lSLOdvUjfqnp2ZEqacS3zEde78ynTGOrK/5Ha5EwDOHBc6h9cpLtB7m4Ykg
         mlDDg7tGrND+fX9VdLi9xQICaGe3/bftbJhBYspRdT3Sn/r1ZQy53Uf2dwk//6QU7VuL
         MmFTFMB/Z4IZcVasDC4H3TBTEHeaNCPy6OGxCtEkYd83He3YnLJg/G4y2QEto17BV47B
         0MxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1buR76P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk6-20020ad45d46000000b004c6e58f4913si4513889qvb.84.2023.01.09.01.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1buR76P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQh-00042g-DC; Mon, 09 Jan 2023 04:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQY-0003xs-8F
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:50 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQU-0005TI-25
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id bn26so7513358wrb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NE5J326RXvgXHGZhWzejrwD6fpnpQEJ0QTafe4YZjeM=;
 b=y1buR76PGI4z2+hl2piEYGF68bOUKz/XN+jeMIoo81akQ9li6UAvFS1QZA+vjoowdy
 ce0BhJdpxnYJK0MWjKi4613VLOptPbBPLYFnBOkSD8mY3oKSssc7IZ7enBmtQ6AIC6oK
 1oYfWJCmyuvOaJtL7+O8C+fVjyqOZocjCu9p85nQ/jYI0UpxHfw/1Y2a+ILoi58vFDNx
 63AssdgZCRazlPbXQPkzmuyLZzYwPJO/OA1ms7nUQGGjlx/RVlXpUYYx+k9e1hVR1kb4
 kn7O9Jf9sDqaI9Tn3UmY/Gnz6bAjFB7l7kCy6FMWabdA75qhQdVFeVTcSuXj82WYjgCd
 ef1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NE5J326RXvgXHGZhWzejrwD6fpnpQEJ0QTafe4YZjeM=;
 b=w+wrn0y28D6m0DyvRwLZ3ih/AEobAhrhBeSaEElHtw3lXOug7U8TcdyuRNohrQ37G6
 0hXgcJ9+xVym0eJN+3TYS/pVDMHu6MX7kqnE/0UU7ybLE99atO4RhRqZWk6T2qOI0sy1
 FXoaEi9u9xAaSwHxqQvRoPFvCjOOOgb8PuK4GBTWIdwA76j3ZQ6b/w1/EHOHe8vQJYQi
 OF2cN0cQjTj50F1FAn8YK77kYwTiJdBwetrCBP6726NZWBNODK9tkoJ4/qvpqFrq3GCW
 p2wPkHxCsyf8wWUxp4jr7IzuRNdf5KdNIjQ0iQpP4PFaadKv8Uk9J0YBnX5hvsGyBJ7r
 NXVw==
X-Gm-Message-State: AFqh2koEymt6Ue85U3TM4nGH4vXootULzN44RtQvQTyVaV3DzvB6PM63
 GkFbLcGWGT4WvOurAiSAzTFcNJojxxJJvDu7
X-Received: by 2002:a5d:4444:0:b0:2bc:8130:ccb8 with SMTP id
 x4-20020a5d4444000000b002bc8130ccb8mr21560wrr.40.1673256399959; 
 Mon, 09 Jan 2023 01:26:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adfef89000000b002b74be46309sm8020770wro.114.2023.01.09.01.26.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:39 -0800 (PST)
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
Subject: [PATCH 4/9] hw/arm/tosa: Convert TYPE_TOSA_MISC_GPIO from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:12 +0100
Message-Id: <20230109092617.80224-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A2wKsv689n9/

Drop the pointless TosaMiscGPIOState structure definition,
since it defaults to the size of the parent's type.

Nothing in TYPE_TOSA_MISC_GPIO access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/tosa.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index d5a6763cf9..ec0db24e8f 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -78,10 +78,6 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
 #define TYPE_TOSA_MISC_GPIO "tosa-misc-gpio"
 OBJECT_DECLARE_SIMPLE_TYPE(TosaMiscGPIOState, TOSA_MISC_GPIO)
 
-struct TosaMiscGPIOState {
-    SysBusDevice parent_obj;
-};
-
 static void tosa_reset(void *opaque, int line, int level)
 {
     if (level) {
@@ -104,7 +100,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
     DeviceState *misc_gpio;
     LEDState *led[4];
 
-    misc_gpio = sysbus_create_simple(TYPE_TOSA_MISC_GPIO, -1, NULL);
+    misc_gpio = qdev_create_simple(TYPE_TOSA_MISC_GPIO, &error_fatal);
 
     /* MMC/SD host */
     pxa2xx_mmci_handlers(cpu->mmc,
@@ -307,8 +303,7 @@ static const TypeInfo tosa_ssp_info = {
 
 static const TypeInfo tosa_misc_gpio_info = {
     .name          = TYPE_TOSA_MISC_GPIO,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(TosaMiscGPIOState),
+    .parent        = TYPE_DEVICE,
     .instance_init = tosa_misc_gpio_init,
     /*
      * No class init required: device has no internal state so does not
-- 
2.38.1

