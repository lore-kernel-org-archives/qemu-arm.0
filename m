Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp135996ejc;
        Mon, 22 Jan 2024 22:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMdA456/JN5JY5PRlHfTgDfqOe7VZ9m/o1C6PrJOEOfWiA1p2+3p4OzmHeIafC8/kPIsav
X-Received: by 2002:a05:622a:18a7:b0:429:ceab:33b2 with SMTP id v39-20020a05622a18a700b00429ceab33b2mr459245qtc.63.1705991978446;
        Mon, 22 Jan 2024 22:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705991978; cv=none;
        d=google.com; s=arc-20160816;
        b=TXRCS8EFNmGYd2n0sAhODVqo4omI19kIhYWU8avZPzmS4LZY21nXmJrbg93paax0E6
         7c6iebelFLc2+sAwFpcOkzHsYRDoPz5REjnlu4OXxve6QJqg4WjhHw68A0DRYzbKdG7z
         QdvO3/rGcuWeXQ/P/rqVHAFBhWiTnsWPOtySMGqz3Veg/M/W4F7S3D/fQTbUlPxbJS80
         1HWxdQJRnGUz0QIciEdoP/ZiOl0Rs8rFWmPymj1lyCU6p7jnin10wnnbsWdr4HLKZvq8
         P/UHNp5uwBc2pr1d9tj2T3DVWI5q189RQPg+g5FNcZdASLfzA//0hEUw1m5K3xjhmbfG
         jntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i77zJu4XGXBVApw9vLRB2i1/pQOfnONi4E/tNbGXicU=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=xt0Y0XO2g4I+Atg33qK2Blal3vI18jecVbLcPVINWcb0ELdLnqfBxz6i8/zSfskSyx
         jwbpNjOX+4mGMreqW79UKPDjP9ZwBTxgo+84WoJZR0lrmyKdMtLIq1RXyGvgzMpfOIn1
         FxlllrpYyVZ8bnn0ploc+bS3D1SYH41KrTWDZ8SECMOyT4UiI6hUEYnWl8sUvTn0Qq5Z
         pl2VrOuvrGeJfu/WrYdBemre8apjUVO+teAv6CW7npMqoVBXqs3WOPtt3uLBzEcqOQrM
         cAAnTXFiCAU0XVarIL38vwuoo2Q5+UzOmu+V+y2oCtvtxhfMfTt61ukpEbW+zPSRXvFi
         eF3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S1b2+tOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a059400b0042a26b35c05si7285911qtb.434.2024.01.22.22.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S1b2+tOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSARI-0003ct-L9; Tue, 23 Jan 2024 01:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAR4-0003Wp-7l
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:39:03 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAR2-00084S-8o
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:39:01 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a3a875f7fso4284704a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 22:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991937; x=1706596737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i77zJu4XGXBVApw9vLRB2i1/pQOfnONi4E/tNbGXicU=;
 b=S1b2+tOH6PTVbzHapEHhdghVd18Nqe7Z9tSKB4B2Hrher6PoizNnuhKjVeWEHizX6F
 xlVgLYU6n+Re7HDT+4vN5cE025ATlC1ttBhiutawL5MYl3R5T731hriytpDEbOADkpZ9
 hajsUBEkvdR9CQiYAtwLd9kCwGf5hzpDRjOQMLW/4Dis3Y7S6z70GlA+/+DoRjJMHpFM
 5lGYTul5oiPjsmKwE/EvwhpkcNENyLqMlgCZaFcP+tvPQTsqnOuIuzqtTxVy6uLdWXqG
 O4AL1viAVEgEYNPIhjrLj3jloB/3utqY9iAY+uZ7QDkx3Mz9ne0tO6rnZR5yKx/5WGUs
 IORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991937; x=1706596737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i77zJu4XGXBVApw9vLRB2i1/pQOfnONi4E/tNbGXicU=;
 b=W9Lsl9H0jLiu1FGiQkNiBgUiSuJ4aHy4YIEa63OYcmH+//kn6jnc5L0mkyxJTC8dU0
 U7OYOuKvGKIiC6/gvcTkaN+e82tYifNwgCDtQxIiMHsDe6gM2KXNUXWt5GdMv7XcSw98
 irizkRhb8OOLQ+aNB0j2GfOAeTO0HG3wybwVU3QGQYPzY3xTjV3UY+TImFCPyQH00643
 g+EKyrYf/3oY+e/Ij7XFL+gU+9pDX8GsvIAnQfUI2MPwOWv2oQjKWoGOCC3a+OyDduSa
 nPzGAPs4n0459Z3/w3uVnk7cEp2n9TxjLhmjVKzS04uGwX1pbIdGPwl/9Dxef9NX6tfK
 j6yA==
X-Gm-Message-State: AOJu0YyyOpGUsSPhlDNo+V4WUoSZOJNzf/YrJBoomSmwxERqRXVM7GNc
 Ww9ldZviZD1/lMARHmh/RVeIEifjafGDJPQa+iK035GazB2P3PzFnMq/qmJ/WO4=
X-Received: by 2002:aa7:c3c7:0:b0:559:f1b6:bf6b with SMTP id
 l7-20020aa7c3c7000000b00559f1b6bf6bmr572472edr.68.1705991937548; 
 Mon, 22 Jan 2024 22:38:57 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 dm24-20020a05640222d800b0055c1433be60sm2864216edb.50.2024.01.22.22.38.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:38:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] hw/arm/highbank: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:36 +0100
Message-ID: <20240123063842.35255-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: J+MmsyHbmkbY

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU types.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/highbank.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index e6e27d69af..67677eb651 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -344,10 +344,15 @@ static void midway_init(MachineState *machine)
 
 static void highbank_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Calxeda Highbank (ECX-1000)";
     mc->init = highbank_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->max_cpus = 4;
@@ -363,10 +368,15 @@ static const TypeInfo highbank_type = {
 
 static void midway_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Calxeda Midway (ECX-2000)";
     mc->init = midway_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->max_cpus = 4;
-- 
2.41.0

