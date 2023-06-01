Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp295616ejb;
        Thu, 1 Jun 2023 02:46:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XqU8pRYTaWzmsTUUaQDVBcHQ7ynE2K46kZ9FwfjO7kiLQ/fs8kGo5zfKAX6m3uWhENgLI
X-Received: by 2002:a05:620a:2807:b0:75c:b6ad:4f45 with SMTP id f7-20020a05620a280700b0075cb6ad4f45mr9061038qkp.25.1685612816618;
        Thu, 01 Jun 2023 02:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685612816; cv=none;
        d=google.com; s=arc-20160816;
        b=qXH1PV/wAKLWw/OKHpJPRTXYb1RT1R8zS56aHb5TEe74bIugGAS88t2qsLntlWSuLe
         dYE55sjXABptVFJbAg9qOIV9aPLWv0GLtF8yzG0BBNss49vmh8J/DluOSTdb7dkOG8PB
         a/M1Lo5U4Ecuiw6VU2j1+xyJemld6E9riVsy4ndDAjk+AZ0C7kp6Wdy/yss0+fa3HcMv
         v8xUQK68ubWgQ3OYvtR+aEBFVYjydMEBl2ZEEsOXsHUJXvo7fJGBGYBz7/bM89ifStAH
         ptpPTT4QBfSC8XDAmQloyibQKnt+7RP2hYvCGQ0Dxg0Lq/v489NOUc5GoA/rjbIGscuj
         6xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ufm+WJCjG6m94oCrL/5Ldv1CVPJfrGDblHgEVPADtVU=;
        b=Ly+IMKzv9NtJsWMF9jAs9Y7WQOFd9EkSfvz0Z4beP5z3wj2Z4eO9UuVs5jLMx/jD8O
         NQb3mjXVnBsrGUUr2qZceIGSiG4OD5ZxGu8vt9403odzrTir84c7DqER/7XlSMZ+Wa8Q
         WRmpxjyW+HZCVyIZJ9EQ4g+MSEdxRwBK7E0sQWnro4lqCp+1r74vRP0DMyTlb/6T+J3t
         hzPvB6CwLObNvzLKSM9Crhzz4rnH8CriE7XpnH3VotTbLoxVhdzu+AnlYpmL+DoEmJJy
         qybI1ah/IiRO/jtJ9+QgNqX7rNZoYtcKjDIobgopTYyqCMx3nsfLDvf7FYvAZZIUzC/H
         kBqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z6E514Ta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a05620a078900b0075cdd7e2c4bsi6567690qka.368.2023.06.01.02.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 02:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z6E514Ta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4etH-0004jH-9K; Thu, 01 Jun 2023 05:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4etG-0004ik-3W
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:46:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4etE-0004CR-FX
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:46:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30ad8f33f1aso659696f8f.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612799; x=1688204799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufm+WJCjG6m94oCrL/5Ldv1CVPJfrGDblHgEVPADtVU=;
 b=Z6E514TaBtii7SkwlCbxbvcqAA9FCT2ZS0eOX/DqTzYlpIKLG3PNA/cYdYKHUecCQb
 wqWof+8gR31KLmgMPRLy9ZhyoN4zcf/wnvNYyeN0YMKqB1Aw5NqjKbiXSOQBS+RdhFMX
 7Go/8BJZ0FQKI56FClS1WLI/V+6nm6sZErIPwWEsZTNzihV2KyHdlMwJzCuIKSTnfWDQ
 3Uo1uRtaN8OkyLhTfk3N3FFrIjfM2YVf8x3d6xXniLKpPJgTQ25KdhjXpJrIvB+j45nz
 KkFCT6iZuX0Zoblbb5Anc+FlDw1dVoJdHLRnLG0ucQnu7PyOXjytjxvq7cqEBdg7tX/G
 jYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612799; x=1688204799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufm+WJCjG6m94oCrL/5Ldv1CVPJfrGDblHgEVPADtVU=;
 b=Nw5Q9T2TBNCObgLcP05bIWFJrrKoitEMZsOWvrw3kIRfi6VO0pKblZywp4JmrZ4nZI
 et2Mkpzlbla29UZkHirZm7XFJdlLdFHFCHuJu8D3FnY27cdzW90aeUD9EAEKTZnaSuAL
 oPuIFYwCCrWEtpXkxRWmy5ahGjXzqaYyKRYNgIfAuwsxRGWSm2bAd4XsSXzANYE2zTYx
 YL5RajFPdq7a31DNKb5E4Cra5kBlcigf2NTaCbvmK5vsA2YG65/epCzx+j0ikQKYkFer
 h2Ux6DORWBtf6uLLguJ6Y3LKvy8nsEp3wCIboyFHfd05TXyOpgnAlRIV7Acn7n+w9u/y
 Jt/g==
X-Gm-Message-State: AC+VfDwkXy/agmZegOcBdfosPCP6PPjgOHgAPsurjaXONQsdl5+gFHt1
 q1LXzh20QFokQjwvPGuxQkUDIA==
X-Received: by 2002:adf:e3c8:0:b0:30a:e643:2517 with SMTP id
 k8-20020adfe3c8000000b0030ae6432517mr1408660wrm.21.1685612799115; 
 Thu, 01 Jun 2023 02:46:39 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b003064088a94fsm9659338wro.16.2023.06.01.02.46.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:46:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/7] hw/usb/xlnx: Do not open-code sysbus_pass_irq()
Date: Thu,  1 Jun 2023 11:46:20 +0200
Message-Id: <20230601094625.39569-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230601094625.39569-1-philmd@linaro.org>
References: <20230601094625.39569-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: pMhTH9sRsOeo

The SYSBUS_DEVICE_GPIO_IRQ definition should be internal to
the SysBus API. Here we simply open-coded sysbus_pass_irq().
Replace to use the proper API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/usb/xlnx-usb-subsystem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
index d8deeb6ced..462ce6c3ff 100644
--- a/hw/usb/xlnx-usb-subsystem.c
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -49,7 +49,7 @@ static void versal_usb2_realize(DeviceState *dev, Error **errp)
     }
     sysbus_init_mmio(sbd, &s->dwc3_mr);
     sysbus_init_mmio(sbd, &s->usb2Ctrl_mr);
-    qdev_pass_gpios(DEVICE(&s->dwc3.sysbus_xhci), dev, SYSBUS_DEVICE_GPIO_IRQ);
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->dwc3.sysbus_xhci));
 }
 
 static void versal_usb2_init(Object *obj)
-- 
2.38.1

