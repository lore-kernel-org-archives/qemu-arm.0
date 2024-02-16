Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1152635ejb;
        Fri, 16 Feb 2024 03:06:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgEijaju37boLTq1k3rBY8I6lNxGle/R/oRUpVndhLDZddIUnitTVTx3okUXvHONXf5rCxXCCzKOWWrVv191NFMdaZYvzh
X-Google-Smtp-Source: AGHT+IF0+e8pkZJNnuhNVEmtoPkukbOEh6treVsEutrUeO7L5GPEo+mgbJAIRKESCyC3mNjaBywb
X-Received: by 2002:a05:6102:374c:b0:46d:617b:1bfb with SMTP id u12-20020a056102374c00b0046d617b1bfbmr6434929vst.10.1708081618938;
        Fri, 16 Feb 2024 03:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081618; cv=none;
        d=google.com; s=arc-20160816;
        b=MMJ/KSBfg3HhNY1V1KycJpgdT3iga5PEGvk42LvQ+uw1slZKwr2CbbIZZlZ+jqTdx0
         MP13PEWubnTXOMk87iCKlvdWd71sBf7uomBO0hUj1QZCPBqt+FNyxYZhkb0mFcvGso7J
         a3sfRnzqgBelINI+IsofJh88NicoJaCXlosJt8qrNnOtQafw45WOEJvU3Dtg8ZFMOet4
         PjlJmBlZ7vNuxu4Jw6G0Th/bu4ROOUmRrKoYt3AERGVtMD4DLowgm8wxJCvWrWk5OOXw
         sHnlNKrQQDzX4WbAbbJBjdTGMOg3/XUcYEdPq5VypN1SW+TUK89Yv+84M/AJexBl8kVt
         19ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+TP1TJioczzc39Hx3iqthMm6LDPQbvhwTOiEAkO1gUM=;
        fh=VbPIqyFuCYL65k0FKNVmSVSYwnadnuqExi5+vdUGOTw=;
        b=BvoQE0VzA4F4edOIqrs6j1g3QdRsWNv53gSAHvSN2S2bZ/B31OOXS6D2g0u41SExyz
         ZXv+OrGgnNiyegA8cSeCudkSqWLjm4RFPJFR6SXzYz91qt1WEhdGRRxywS46nKubv15X
         BQDyOyQURa+WPVdugxwDs79yKBDE134S8PpP0775TnKx9hFYX38BassQmGkpLDCwfYUg
         s5kAdG0iUj8T5LdovmLhT2x63reDtSNbEeKTP8TEGLlIqKwABaxNimgW11Tomb470Tdb
         9AKLAM8o4E4E8CRtam6nREiKmR5fsFroUZEbJ+ihzg9rdgHI5Dbn6aRpW0D8v3ioRREZ
         Mviw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxW32De3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sq18-20020a05620a4ad200b0078732e1a50dsi3567016qkn.526.2024.02.16.03.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxW32De3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw2K-00033E-KH; Fri, 16 Feb 2024 06:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw28-00026h-Vg
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:05:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw26-0001JT-0w
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:05:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso16716585e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081528; x=1708686328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TP1TJioczzc39Hx3iqthMm6LDPQbvhwTOiEAkO1gUM=;
 b=YxW32De3ZsXwzJns1+dzJxJhcBFHYEb8tnw00Pf98GX+sR5gfeKz/H3vV8ezDDiDmN
 Vp7iT2hVTH/vhgcq0Zrzd3K1wFB6aA+HwgnbHY/X5FiiFwjHjC4revQ7rlIVkg7gwxnx
 3uCP5OMjKl0is5y2Ety2xRPsrWsPB8LYEXR6hi3W6MV5DFzaS4sfVYqLENmRCUYq+/C9
 ST7vnlkCbp5vBgMHS4El2ekn9fFvZBNUkaGQ3nUYfHLOZYaS0jpGCX8rQhg/9NHrS7bv
 ED6JuTxTNE8BcokPCcENyQDdh4B9spnhIuEp48xK8VNG1R0yvqlKve4ebn6UcB/Fjaly
 EcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081528; x=1708686328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TP1TJioczzc39Hx3iqthMm6LDPQbvhwTOiEAkO1gUM=;
 b=Hs3KzelJ5scdh6UY0bhEem+NUDsOWmfTXHRKJ6U74iQi/cd78YvHCzu3IzAWKeGv6Q
 ESe+Dl9Z9DpR2Pg7Q4XoyWChYB0MvC5yP/gt39gEqu8UnRUedcIMNMxabCED7jSb5mZN
 KNWG/TfruIM0SkzcAO80uw8FcgAhq71jysO/yRw4/GRVS/bsnTXUvvM6mkdWxmAJ7uri
 mP9WU7vwaC1DGZTgTbPD23asq3hcrCEk/FlleMrS8zRPTPk18sWl8fTjmP0dxVeCvDgd
 tqfCf16+Zea3IfsZLMg4DK6zoQQ4kC5gR0+JlpCXnXkUy22TiE7Zw9AwFoggzxO2azOK
 q7bg==
X-Gm-Message-State: AOJu0YynEK7Z7UuPrJRUcYm43reb0m7a3IdDuAIMW5WH9/+8olkDHzH1
 x2GHEKa4PsHbbNf0Xej3pvitiUOnppYt6du44QSTX83UuCNGCnbCAyYVq/EcGI0=
X-Received: by 2002:a05:600c:3b10:b0:411:aa3c:128d with SMTP id
 m16-20020a05600c3b1000b00411aa3c128dmr7082597wms.15.1708081528391; 
 Fri, 16 Feb 2024 03:05:28 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b00410c04e5455sm2031239wms.20.2024.02.16.03.05.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:05:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 20/21] hw/arm/mps2: Add QOM parentship relation with OR IRQ
 gates
Date: Fri, 16 Feb 2024 12:03:11 +0100
Message-ID: <20240216110313.17039-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
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
X-TUID: olrqNHIE2TAB

QDev objects created with object_new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Better would be to embedded an call object_initialize_child()...
---
 hw/arm/mps2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 50919ee46d..780f2adf0f 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -274,6 +274,7 @@ static void mps2_common_init(MachineState *machine)
 
         orgate = object_new(TYPE_OR_IRQ);
         object_property_set_int(orgate, "num-lines", 6, &error_fatal);
+        object_property_add_child(OBJECT(machine), "orgate12", orgate);
         qdev_realize(DEVICE(orgate), NULL, &error_fatal);
         orgate_dev = DEVICE(orgate);
         qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
@@ -317,6 +318,7 @@ static void mps2_common_init(MachineState *machine)
 
         orgate = object_new(TYPE_OR_IRQ);
         object_property_set_int(orgate, "num-lines", 10, &error_fatal);
+        object_property_add_child(OBJECT(machine), "orgate-12", orgate);
         qdev_realize(DEVICE(orgate), NULL, &error_fatal);
         orgate_dev = DEVICE(orgate);
         qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 12));
@@ -333,6 +335,8 @@ static void mps2_common_init(MachineState *machine)
 
             txrx_orgate = object_new(TYPE_OR_IRQ);
             object_property_set_int(txrx_orgate, "num-lines", 2, &error_fatal);
+            object_property_add_child(OBJECT(machine),
+                                      "orgate-uart[*]", txrx_orgate);
             qdev_realize(DEVICE(txrx_orgate), NULL, &error_fatal);
             txrx_orgate_dev = DEVICE(txrx_orgate);
             qdev_connect_gpio_out(txrx_orgate_dev, 0,
@@ -425,6 +429,7 @@ static void mps2_common_init(MachineState *machine)
 
         orgate = object_new(TYPE_OR_IRQ);
         object_property_set_int(orgate, "num-lines", 2, &error_fatal);
+        object_property_add_child(OBJECT(machine), "orgate-ssi[*]", orgate);
         orgate_dev = DEVICE(orgate);
         qdev_realize(orgate_dev, NULL, &error_fatal);
         qdev_connect_gpio_out(orgate_dev, 0,
-- 
2.41.0

