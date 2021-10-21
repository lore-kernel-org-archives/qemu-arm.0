Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp640464lfc;
        Thu, 21 Oct 2021 11:48:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO+cdsGWB0ELwVadU2EJTuY7bkkTz/jlPSqpt8r6mcNQW0bGh/175w9OFM5DHtsdAX5+iw
X-Received: by 2002:a9d:7109:: with SMTP id n9mr6061745otj.24.1634842087512;
        Thu, 21 Oct 2021 11:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634842087; cv=none;
        d=google.com; s=arc-20160816;
        b=wiqy1+HsI53uyww/gnUTJRLPkVRk0gdbNgn4i8yefLk+YfyTnfM18MTMd6PAgP4SDh
         c6ov27DFEjCKr7O5AMJFCSufn8upa4rysfu16rLrGwUIs1UFiFdEsCtNsQ8ALoDNJMe4
         Xk2DqK3ozvjyCx1FiieJaH3cVEX+JhQhAVgl4Wyhf8BCFFegA+zTRZOxYNPS3gSE1SA4
         8n8RjSFp+3jPX+xX0WK5xHRtvfSeunzF1cEf+cbO0q7XE7uXkq5yNa5XDwrQG3YKtoyE
         Nt/kf/Q1AiFCT98U9odC94bdl0A7trs78xJotnAfpCRMBa+SNPgbqXLXdx/7O8/P5GWa
         Fh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=sFeWotbATGCBS+Vm4EPPVmJiHPouAImlbzZwfeR8ZU4=;
        b=vnNMpdrWPYBeT0Qz2+2nIqS/ARhC8y87PNkrGREVxQomW4B02d5Z6kI5mae3wa8g49
         /ymLXoEwd0TmtGhc4bWj4G3FOJL3Umuse4vF1X9h6+lybbWvkoRUVQJG0HsPtFHak5mX
         N36f0H4MTYjW8J9Nvht594VkZRmagkyUa9RqBujDoeNcBHG+3E2d/35QNQ1C6PtvpHnu
         piemxTLnWknhjoyzd+bQrqBWmGPmO976x8zblkreJljkDX7WDM4Uj8DQSQJVyEjNpdMc
         RfWw2QB8p2QjQanfo8ef92pizBoCshmcjYl5lMTr8kE23mC2kdOLMJZDigwAWsOTJgGl
         6Ozw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kzA6SMeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h92si5993195oth.186.2021.10.21.11.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 11:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kzA6SMeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdd6k-00060c-Md
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 14:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GLRxYQgKCFkNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1mdczW-0005Hb-KI
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:39 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GLRxYQgKCFkNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1mdczM-0003Me-Qa
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:30 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 mw18-20020a17090b4d1200b001a194edeeb2so298901pjb.0
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sFeWotbATGCBS+Vm4EPPVmJiHPouAImlbzZwfeR8ZU4=;
 b=kzA6SMeGRFmINTqMvfFCGDb4pKj7WsKRaC1t4Yx1IagxtJGT3TWDjN1InWcE0kMdVx
 +0lixEtUTBkoq2Knj6leTDd0rbGOoE70ngO4wQM2FuRCvjqV8n5NjowK7ldEdAFcXxDR
 34TOZEa0jEIrwt06pXHIv2zQRcG1pzxvRLqJS60yiHYkLca6FlRKZieBxGoZ7TJCIwG6
 4I4x6LHJRq+aY9XL3s/NWB30jBuyH1lQxy26W+U9fsMbyQyubFVKUUKHKCaIYDUeRzSH
 5xtkicAgqF4uuaQB1bYsUp+7U0IBK4gI6ELggxZYHKLFAa3BBMWn2Twcwe3RC3jQoVO4
 0bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sFeWotbATGCBS+Vm4EPPVmJiHPouAImlbzZwfeR8ZU4=;
 b=l5UqxEcueoW6P5y3fNva/oBKQApkqcQVg6NBO+F8fGBDrn3jbpFrwDBIgNzK8GnMDS
 b8yN2z6pYyaK6VxjdwS+TV9q9FCqT2pRxih+5DuHpMkekeCoqBxB2TJ0loBsO2n4F1+V
 qqLdsTBRb8bp6buC52hMxzfyS78FSU+JNVdUAhtABoBI03lsMXU6qXdpK0FdXEwuQAQP
 dYj+vy+fw+iapiRU3SYP0qSDiEZPB1xsnRbCEBdxWRanpM3JUxB5WEZxCeq1+8RwC10N
 CmMY1qYCxXCTHpx6Un1Lb8ez7b21el1QR6HaWEvwR6sc9QQsmf2MvfU7jans5oQGfhQs
 vRjw==
X-Gm-Message-State: AOAM533XJtXmkIndWJx5uL/Lq8SUSSjVmVOrPohi5mliKDiTDtENnfGV
 MYRKAMoHNIfkmJVa6KNasKYrK50og4rMiQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:acc:b0:44b:ff29:621b with SMTP
 id c12-20020a056a000acc00b0044bff29621bmr7362396pfl.32.1634841624479; Thu, 21
 Oct 2021 11:40:24 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:53 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3GLRxYQgKCFkNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TkvTvls3yU+L

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of read only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74..bc6f3f55e6 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.33.0.1079.g6e70778dc9-goog

