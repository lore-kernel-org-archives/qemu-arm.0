Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp725518lfc;
        Thu, 3 Sep 2020 10:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4xH9NjV/LpVkzyiWc0cZiPV9R74bNsY0H1JkNzElXxi+4EteBe9CwwNN3ecB8D3H4gJ7C
X-Received: by 2002:a25:3748:: with SMTP id e69mr4117190yba.520.1599154109598;
        Thu, 03 Sep 2020 10:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599154109; cv=none;
        d=google.com; s=arc-20160816;
        b=i9TRg506v8BNe6OGI3sZAJphb/xJXfExknxfTBwRsLNj4O3m5Xu48CLq69e/YqjNz+
         qrVDZeDsoY+9hIVnRmFDy5e1h9S4nQ1OFm9PiIS18dvEmwYWpimfoItbu5SrV+IR42i7
         6m7F40PxwiwnXVBBhl8OAWu5PVm8zbNlizqs7JGh73+p81R5ATRYBAEZplQmJxAo6Ifc
         QpsuMEeQacOF2Hh6OOkqRQgY9NJPURKCkG5K/Nci2vgoB21PF8XfwiRyStH/7PeyIQgV
         wSZrCS87FMZdevXsnyFMXygqlmFDPrDNpWDTZn2de/JXGfKjOjqro/Nm96JKubzMWGc1
         8blA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h5iaQi3vWrr7M+kdi5/Gojkf+HOxBwaJDmXr+jv44dA=;
        b=XPhFs+PBuEraQVRTxSLBea5jkQgN5eUHzpMkBamrlLaMgjxUVORyblyo7C72TVRwIA
         nb89cUzp8jGbzW8sTllrBZ2mm/YAvcIkftRDvFM793eAyTQ3QeRuUWHis5l00jwCXVDD
         tiO52HspYeVD3TDc7xZNi7KIfKnPFm1pUYlggZl676LWcJPaSJFlDc4SdESS0K6ZSI2D
         3Q/dctvXLZFlYY+Xl4mBRyF0cDMcMh/bGbGQtzdqe1Pc88dSj8qDi4iIQZ9JZmeMmsul
         uiKtiuNwS/d7Isq9LjKFQxOBVL6vGZRHyxJO1zfJQiaf6/6yAF33lZ6n3Zqg0+M+aAUs
         smXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dlseXbUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e142si3294901ybh.104.2020.09.03.10.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 10:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dlseXbUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDt2C-00014q-Qd
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 13:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDt22-0000yk-9W; Thu, 03 Sep 2020 13:28:18 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDt20-0002WP-Nk; Thu, 03 Sep 2020 13:28:17 -0400
Received: by mail-wm1-x343.google.com with SMTP id u18so3672371wmc.3;
 Thu, 03 Sep 2020 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h5iaQi3vWrr7M+kdi5/Gojkf+HOxBwaJDmXr+jv44dA=;
 b=dlseXbUPPWe78yt35GsXIDaRQ7iWXdV+Kjuns6hAGs8G9CuivxFz4Ohu+9joPCTdtJ
 dWRuPopDm5Su8N2femkKXQV0ghgfzUg4V5KlAB+1XFJNolm/N/jPhTLV0Ay1LpEOypW8
 UClq4JZ+3sGbt0CuBJmrFIbSMTug0UUDw7pQL4r7flk1i6qu3b9ZTTX+fllC35+FwHLF
 DaGD5dMzrHMNm0UPnngtMENYnIlpajxhX7Bh/c8t5mNgJRz4WCfpmUeKYVri9sj2/KRm
 ZwP45wszHKmeLBAEiqzcCsHwMmAX9ikzy/irKvSiJAQoq3NSqRLqSIrvJpRjp+a88l9T
 5JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h5iaQi3vWrr7M+kdi5/Gojkf+HOxBwaJDmXr+jv44dA=;
 b=Ld9Mwn2b2JHrXam0O9PT2ip6y53h6R+1kpewNjKeSfft2ezy+o6qVMxgyBvAb3recL
 GIGblEn3M66uYHt7tiUC+Jz+EEZUkpkkFSmB66vUsmcr28iXlCGDYEvNYNgggZxI878j
 T4vP26ctUgDmHuWnp85196SVXRpCR7WBskBFY/OX0w46hcHb8kJ9bWMXkgtt8+swfEch
 WXNUGwa7SCT0wtLcldR5uecuM8WoJaIFvlDvnmUqIzb6jgPq/Cv3s99oVdK+2m9IeD6v
 g8AMpeR3aB5jw20im5z04+0LquYWuITEjyrOalhJ5sjSpiJXKGFp/vFZ4/ytrgW3f4Ti
 sfSg==
X-Gm-Message-State: AOAM530F3dSnylxn+f8eBeXf/YjqZDPNxQrfWIVWu/nVWlpChTnaDJ58
 QswKjXMcrbx5RaJxFmMqhldYS4yVuvY=
X-Received: by 2002:a7b:c387:: with SMTP id s7mr3520582wmj.171.1599154094081; 
 Thu, 03 Sep 2020 10:28:14 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b2sm5325802wmh.47.2020.09.03.10.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 10:28:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/sd/sdhci: Yield if interrupt delivered during multiple
 transfer
Date: Thu,  3 Sep 2020 19:28:06 +0200
Message-Id: <20200903172806.489710-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903172806.489710-1-f4bug@amsat.org>
References: <20200903172806.489710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Ruhr-University <bugs-syssec@rub.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FaSd7IFFQD9U

The Descriptor Table has a bit to allow the DMA to generates
Interrupt when the operation of the descriptor line is completed
(see "1.13.4. Descriptor Table" of 'SD Host Controller Simplified
Specification Version 2.00').

If we have pending interrupt and the descriptor requires it
to be generated as soon as it is completed, reschedule pending
transfers and yield to the CPU.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 06cb098036c..74b0bf77103 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -834,7 +834,10 @@ static void sdhci_do_adma(SDHCIState *s)
                 s->norintsts |= SDHC_NIS_DMA;
             }
 
-            sdhci_update_irq(s);
+            if (sdhci_update_irq(s) && !(dscr.attr & SDHC_ADMA_ATTR_END)) {
+                /* IRQ delivered, reschedule current transfer */
+                break;
+            }
         }
 
         /* ADMA transfer terminates if blkcnt == 0 or by END attribute */
-- 
2.26.2

