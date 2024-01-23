Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp609064ejc;
        Tue, 23 Jan 2024 14:26:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp/Tt71DWNQJ1IP+C6d4IwfReqZb/8enlA6DVCHQYUFcUo2X+6nekEV3hM7HdKgmq8Yzu9
X-Received: by 2002:ac8:5987:0:b0:429:98a4:dedb with SMTP id e7-20020ac85987000000b0042998a4dedbmr2126768qte.97.1706048774455;
        Tue, 23 Jan 2024 14:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706048774; cv=none;
        d=google.com; s=arc-20160816;
        b=eQNEU6KxZ2zgUx97Xbd3+1dzI+5E7cCkcFKMQRwkya7Yp4bac67BtFa1lZeaLcrSaU
         99oU+HViu7tG05cTCmHwyqHnMUGXN6HNjCVOfN/lRjROu/Ufe39kb4xhw1/0/Cy9UmT+
         Y8m5/y97j6Ny4mfSSspOKqZk9pegyFhfmCnTDoVheVvgvWMtMgXz//IoP3m67l5Npqfc
         8fyINPQb9MrQ2LDpnMWM4h7uv9/R65V1Ns7y0dy8lDeQ2YFrcNyLpaTXepwMly2NOQPq
         Mxx0JSfaDBmid5kKMILRFMDRdzWqhoXZCOEB9Juycfjgl8uEo2332dozT2hAJLLRd78K
         cuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2RjX1tFrRGVlM1BwnlKhE6JoLvLjIml7FEvFQ9cMoCw=;
        fh=vCRQ4SxBRaw/scGiJ+6DsMj2AC960SBJLYr7612eZsc=;
        b=c/FVY5Q46nvdMNdLRO1SB7Entn3DNmg1CFAT0UytxgQ6QgsUB2ISewQTfvcGiiR3aO
         jpe0uvTmMeM90yuXIdQdzgDw5a0xpoUurvBfqez46evVnU33IYVMGlzQjE6hNLQ0fmeq
         1qe8gTadE9SNkeDSrmOEW5IYM3zFNydCg0tDiS1EL63oS9K2dLmGzwmlG+yPD7j7vyQI
         yRSjG4xdWdlQQnZF5PSj1Rx2ZKxDGWAJMklhYp9irrtLzHtCvlFiInCsLDViVvwtzaH4
         bIXUejaAuPfXVjFsjUmCrMMumFv0tYl4dO/zSXCCpbAJEs3hOaCfIwR1qyfFDzAzp6/4
         IabA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUc19tHZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9-20020a05622a020900b0042a42bfa670si4700590qtx.97.2024.01.23.14.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUc19tHZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSPDG-0005pX-HJ; Tue, 23 Jan 2024 17:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPDF-0005in-58
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:25:45 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPDD-0000zH-GZ
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:25:44 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so501945366b.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 14:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706048741; x=1706653541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2RjX1tFrRGVlM1BwnlKhE6JoLvLjIml7FEvFQ9cMoCw=;
 b=TUc19tHZjyl4FfUjXYKcFb56jSJO7LiGv+PpiXnYJ3C3ywjCMi5rBdmJ0lOv0TBpEE
 0KOfNhBgAfzuDI9yH/iPHhSm3jONaFEEoBH2RTH1SJFT809eGdYJhbnefSyFDEBjdXZV
 9EJxyWEZs5D5O/fyfspUAU6ZkRvh94mXFw6Z+gb4hm7im67XIbk9fUnQeT8J02Doq7it
 vtH/DMx4d2FCHcfrRMru30iBpR1E7Fu3bfL1XusCEiWyxuAwwzevvpp9OzDwton2+ox3
 LrIFrJ9y5KNCk0yPirt0XH5+51bWGglt7aRd9hRgp/eSVLnAa5Xa3GZ9x48Qi3MZi5QV
 xNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706048741; x=1706653541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2RjX1tFrRGVlM1BwnlKhE6JoLvLjIml7FEvFQ9cMoCw=;
 b=GUurJrp+uxo3Lmz1PcnrllZ5xZIANxEFW6zftceH4AxjZuwFOL+50aETO4m+odfAQp
 xXKmaTIhMs+9QfKANqvRnb5aWV+v7kxjAC/Ioc0wHcJ2kJS/k4cGPVWOPsdvwydB1jHl
 MnaJFHrd1iN2k1K778fCUxuKUzt5wx5U1VgcwJroyMCRIqL0HIcyPxnj8NN45ZSFQXHe
 UNPRJtY/UXuNb+RLbLmAihH9m+J2PHPbaNCO74eothjZktQVWOtuvQSYtoqAZLiDIBkH
 XZr1VaD7Gv/S+BqqVIlxLnJvCoPC5w53x7FwaDAsABxCo57NOg34pU/lT5laBhy6sZjg
 W7DQ==
X-Gm-Message-State: AOJu0YxRJeNKK5udEKcK+wd4BToPqgkP/7uUOXNR2zTRHcL/mtfVIrkF
 wk5riChUMp1HGC45MV8lCLNhFA+yVvi0Hib5ybakTs9EsNYCiS+XMy+6ralRIPk=
X-Received: by 2002:a17:907:8749:b0:a31:408:e4e5 with SMTP id
 qo9-20020a170907874900b00a310408e4e5mr146355ejc.178.1706048741114; 
 Tue, 23 Jan 2024 14:25:41 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1709064bc100b00a2c70caccbasm14539348ejv.107.2024.01.23.14.25.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:25:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/6] hw/arm/vexpress: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 23:25:07 +0100
Message-ID: <20240123222508.13826-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123222508.13826-1-philmd@linaro.org>
References: <20240123222508.13826-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aBo81g/lxY5p

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU types.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index f1b45245d5..a3561a1b56 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -783,22 +783,32 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
 
 static void vexpress_a9_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_CLASS(oc);
 
     mc->desc = "ARM Versatile Express for Cortex-A9";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = valid_cpu_types;
 
     vmc->daughterboard = &a9_daughterboard;
 }
 
 static void vexpress_a15_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_CLASS(oc);
 
     mc->desc = "ARM Versatile Express for Cortex-A15";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+    mc->valid_cpu_types = valid_cpu_types;
 
     vmc->daughterboard = &a15_daughterboard;
 
-- 
2.41.0

