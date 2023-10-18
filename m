Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4628038ejc;
        Wed, 18 Oct 2023 06:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC3BKI2rh9dJUG4Hno+MPeQcv9yD+JnlabE9bGE8ILG/e0sd/AONrF0QLaw37lNKKYoWQr
X-Received: by 2002:a05:620a:158b:b0:774:a80:3e0b with SMTP id d11-20020a05620a158b00b007740a803e0bmr5118785qkk.5.1697634843224;
        Wed, 18 Oct 2023 06:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634843; cv=none;
        d=google.com; s=arc-20160816;
        b=nfFSAKtOboN3KhA0cbYNLr7HDhFh7BI20sBX7Vbh0/WF9uEEagWD116f2LA10c5oOS
         BE+QJRPyG69PqFSxty9UXoWiQzv35XSMddbhJQjhsBKkE9hKwyvbOUg63vtLSXlY6A0q
         9oK8181QYpYlbLUKdN575SAgPazw/ADevz9mKwIZ7C23ZGKXblqVCZL7Q9MmSrPoo1CV
         YKKSiMhnVjQiEBoB1msJUceBbmmaqeAA922sjeHnxvfgMSE7YWPCK1YQK6soGmMbuzRU
         EqYW9tfgGUqmF4CEif2Q+QJASGAxsVdiX7x7IkjGgDEJoY//1Wg4wSIAP7EiYa5unpfw
         Rcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WuH7XtOKs5G9Ns2H+BnAt+HjsoiLIzrJP7Sikrea0Vo=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=B2jNpBAqr7Ul7ptMHOFkl1IHmPxIJ0xQ2CpOAKCiGj8hN2RhztNpfRnwn9+bF72QVa
         4O2VsEQbnwvmJmnwpfPgECNzCksyZJoQXH4WjdIAwSuKXyYDsOOUrnVvA9IDw5Xz6yOO
         2UeBAhUQHILVHL9/d4VtG1PoslzRlwbpnJiEobzfrYTxcuwiB1edppEVf69YBfNgO7jR
         u3bJGhxjwzf9sjInppvbuaOSQJMq3AXCEQ1v0gW5sVmzxz2FxfSrHEsHQBMkOi+HmLHz
         SON67nx+/GkpME3VpNihfJkqlbbHRMrCLMBFdBVeafIelj7+sZAYj68QaIgzCOlUQX7w
         MTLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrSJkTYO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ae9e111000000b0076cc7de6bc6si2725185qkm.452.2023.10.18.06.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrSJkTYO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6M5-0007Jv-41; Wed, 18 Oct 2023 09:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Li-00071R-Ms
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:12:35 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Lg-0000eg-FS
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:12:34 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5079fa1bbf8so6503920e87.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634749; x=1698239549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuH7XtOKs5G9Ns2H+BnAt+HjsoiLIzrJP7Sikrea0Vo=;
 b=SrSJkTYOkevL7GWhmn+UksdlmmebYoVEuuwc/4qVjplfAedN/SrDBvnNvee/v8vT4H
 ujqxKqDUfDXjgu+7zT6y8HyCMyr5vdGcDu89V/C8Zg60x7QeeFehfct5l10+SokgFsE3
 hUA2eJ9j7IK+Y6T3HVYeUAMOk+Dvaz+HLHyHxsnkJYPHIol0Thq6g7DSw4lwOdmJgafp
 Ey/ID04u2Re5GcQ2qTdegqtyV7sOp3dgn6fCfTcT4LGDFn1SCM8SqzFe8/EJM/KfEgAA
 qcxj6UokGAMjMzDGqqX+apre3Cv/m+pqo9/JxBDOF/dMrAAIxxXISoHifUHx7ToJBWXT
 KS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634749; x=1698239549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuH7XtOKs5G9Ns2H+BnAt+HjsoiLIzrJP7Sikrea0Vo=;
 b=CLzcSnOWH1fMvsmFhE/tJjqC90m6QPTGvD8LdgSqFVbJhizpK5gZfZ77wD6chCxOOj
 flrKAl1XkEat38d/MD+W5sr7v9LLMGKg3Ygbp2oSr/sYR4ye9bUfgmc/gdigamLwnRW8
 hCMW2raURHH3YJynEp1rXbZRw6+KjQAAX9RU+FE+NbNGNWvZSUL7S6z+YdObp/NB9Yph
 xUXqWQnWTenkBfei88H2rtsX8FOb2IWjQA4Ua/85ILUeLIkNIYLt8dLpE2e3OYi9icdM
 fDqVHxs1Xn3rVMr73mPThpyXowMdpGbMom2/ZNewmlaK5rrFDx9VdgS4ZVvvdvBaa3bY
 P35Q==
X-Gm-Message-State: AOJu0Yz/KWSJKxVryK8qaFJp+7qVNVjVMiY8FdnLgiZRLkSFzGzRoAbH
 661U8Ehzt8aLs5C8VQW1Xqiozw==
X-Received: by 2002:ac2:4d86:0:b0:500:d970:6541 with SMTP id
 g6-20020ac24d86000000b00500d9706541mr3793512lfe.39.1697634749089; 
 Wed, 18 Oct 2023 06:12:29 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 b42-20020a509f2d000000b0053e43492ef1sm2855045edf.65.2023.10.18.06.12.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:12:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] hw/sd/pxa2xx: Realize sysbus device before accessing it
Date: Wed, 18 Oct 2023 15:12:13 +0200
Message-ID: <20231018131220.84380-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: +WIQH1+2V6xf

sysbus_mmio_map() and sysbus_connect_irq() should not be
called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 124fbf8bbd..9f7a880bac 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -483,11 +483,11 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
 
     dev = qdev_new(TYPE_PXA2XX_MMCI);
     sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
-    sysbus_realize_and_unref(sbd, &error_fatal);
 
     return PXA2XX_MMCI(dev);
 }
-- 
2.41.0

