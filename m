Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1931391lfc;
        Mon, 25 May 2020 04:08:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaJXVpGSPPl7/vSbLSPaydCJVOHLTTYdR+LaOpVP9HPPY6DyOqRtebeZQ24eabpCLtWvGo
X-Received: by 2002:a05:6214:12b0:: with SMTP id w16mr14612117qvu.114.1590404897017;
        Mon, 25 May 2020 04:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590404897; cv=none;
        d=google.com; s=arc-20160816;
        b=fMkOIxIuO46LKBI2r3VnDnh82r3COMs5uVfTZsmkEZ+Krn6gvq2ov6876AT+8hhj1q
         R9PyQJ6PJqfTPb7GthL5yEtczTOXvV3yAKASy5uymjEihu8wDubz8VISqsW3VDBgVTkA
         YZg0B5YOFS8Vv7ZaHv6nL4nF9OTopSqxcrBG2or8dg6tjh2Ckke7TkbDw9I1XJnZBirX
         bUKNziM3guEWABCm8sbTcnykkmvjZ6QwuzI/Tz3jL5HiNu4fWRAy+x2yqv/FMyL0rMLY
         nouBUTNmrmwbsa33MXeEJxsr+VqNxKxqgbCEOWW7oasLj0HdIQ04IX3xkqBEmoypxLQ0
         MQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iL4sfFhqdm2R6XSdcTGkQgrXLA57/EPgzfZDT6s/zo4=;
        b=ljD/9FZiUDeKLOCd/4jsstOwVWWyOIxLAWAK9Mi2EHoj9NQbw4igob9y0SLyqZq09N
         b1R4sxRUXO3shc/7t1QyXrceYjiCSU+q6K59URjuHUZ2JKST1I9aQH4zYYoZnJGT4adx
         ucABKqGvWIuBbBkgJasE3e3zbBt15dfAuAJ1sWnsYqkTvN1Lj6xRNgBRnEduGh8J0wZ/
         V6N6gefj5oAPx/833zAmqKNq7/ohE9UOx7nd1XxvGwvY6FP+KHItpei17MX6seP4v/+S
         qIExekXKboPGtkbVLImvyGpOx+dHpyI44JFpYTEeM09eFMYkybEuhWsjxdj9RQ1HS/VN
         /Q2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c4vL5Pn0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si446059qka.329.2020.05.25.04.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 04:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c4vL5Pn0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdAxs-0000X8-Gw
	for alex.bennee@linaro.org; Mon, 25 May 2020 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdAxl-0000WW-Ob; Mon, 25 May 2020 07:08:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdAxh-0006fS-KP; Mon, 25 May 2020 07:08:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id x14so11345931wrp.2;
 Mon, 25 May 2020 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iL4sfFhqdm2R6XSdcTGkQgrXLA57/EPgzfZDT6s/zo4=;
 b=c4vL5Pn0EiXaGmh+WIcWpYcG97xR8MTSJtlHK2Z6Bosy4Mk8m+qLXJuI/LNPhwpfCA
 TzEyy7iCghRrPYA6rs04sQyu63xSEsAameQqPLHIPOF/bEm16+96B/VRRdtg7Oh7rWiy
 SdVshGj1ERnWmBGTsyOra5xCH2deQVcZRjqEMphFnsinPPkyly+Axc79paiDj+9JYw4P
 vj0ISywtWUEuf8j4WfJNWx8LkKXHcfElthcpmDJuU1T7XSyS0GyTQU5GxL3YahJR+khG
 fXNr+bntB6UvtjOSAZ4V0Q3Oy/ZR56qH9FzapJ5p+3PotaEllopmhCm1suIrpryBOsLK
 dsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iL4sfFhqdm2R6XSdcTGkQgrXLA57/EPgzfZDT6s/zo4=;
 b=H4glLr9t0PogEwvMLgQGjjylkoVW/jBtTAsgDAFsuQbxXjXT1ukZvmeCnyHiN/sbPp
 G2P8eDizr1M91B81nXPTasGqPyoysACBmZikssiKZmMBcxJh8W8O/usWl8xX/LurMaw+
 uDvYs6a3VAH15nT7fw+HlTN2W2ph2q0w06MZc7+s033gwao52U7byzs00PwjALobpJqR
 e508XarZVNjIlHo1PULgUeOr2c0LpZ2elvaeWirukwxbZ0jfAQmOLtbltt0EA6vjnSZC
 nkV+q4sIRvL774PA6vh1CIq2DugklBYSBIycjpY4xWLBlnrpZ9rZ7zGMsI029NMnhH9a
 WswQ==
X-Gm-Message-State: AOAM530c+FMrt4VOVckwUsE7vjFoBfOOm0jRHc/roEf6EIQyIoqQwa9e
 Q//TuHd56ekxNqHwpLhqlrHMcj/c5FY=
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr15840731wri.342.1590404883316; 
 Mon, 25 May 2020 04:08:03 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id o8sm10642573wmb.20.2020.05.25.04.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 04:08:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/adc/stm32f2xx_adc: Correct memory region size and access
 size
Date: Mon, 25 May 2020 13:08:00 +0200
Message-Id: <20200525110800.7230-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PFaAOcKzKQ8b

The ADC region size is 256B, split as:
 - [0x00 - 0x4f] defined
 - [0x50 - 0xff] reserved

All registers are 32-bit (thus when the datasheet mentions the
last defined register is 0x4c, it means its address range is
0x4c .. 0x4f.

This model implementation is also 32-bit. Set MemoryRegionOps
'impl' fields.

See:
  'RM0033 Reference manual Rev 8', Table 10.13.18 "ADC register map".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/adc/stm32f2xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
index 4f9d485ecf..5d834a98f6 100644
--- a/hw/adc/stm32f2xx_adc.c
+++ b/hw/adc/stm32f2xx_adc.c
@@ -278,7 +278,7 @@ static void stm32f2xx_adc_init(Object *obj)
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 
     memory_region_init_io(&s->mmio, obj, &stm32f2xx_adc_ops, s,
-                          TYPE_STM32F2XX_ADC, 0xFF);
+                          TYPE_STM32F2XX_ADC, 0x100);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
 
-- 
2.21.3

