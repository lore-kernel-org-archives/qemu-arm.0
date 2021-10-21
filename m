Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp634276lfc;
        Thu, 21 Oct 2021 11:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJLAIn7fX0j8EiJkQJTMPwuXwU0bgbFllLGOoAGYIcYqmPxlJAA2/bjug4PJdD4PPL+ll5
X-Received: by 2002:a54:4f82:: with SMTP id g2mr5874590oiy.134.1634841681131;
        Thu, 21 Oct 2021 11:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634841681; cv=none;
        d=google.com; s=arc-20160816;
        b=dh9xH/xxHap449vctvS/ABI/lS2WexZZxRW6+5OXQI6TJOpwYddK+3K9Yv0lQLF9bw
         lLdcVPxCafomDvfWfFTCyO1dOUz9LLAJsvZFsV9z0uxd9THxxpLnJeO6BtzaUTbResqQ
         9sumHMwmgL5jJolnBRX5eZWYiL0Owjhxt2QMBDKQ9a/JAH2F8bFNY3cuDVtaFBqXl18r
         LWDexgWgKgYjp89uGSsu7bF4nOFwyOAlBa9CeiZfRySuVzvaGiaxukDQpPbpqK6hrasp
         QD7I9bLgRhbgVqtP2ksfjUuVh54cOyjsM35Oc6XuZJSAaEvqaQ8aSpmeAptBbma/whMN
         A7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=fAqAMR6EyliijFOAc7rsq13AWc3asmznUg+7CYurHZc=;
        b=PmoFbZeXqaClq5fPqToLoj5ka9bz+6c59n7fegvpLLOmgfxO5nXQ/w54ULf+hDX79u
         UCWnAjULCcwV041KBJNgFoq/uPfdkzfYPLFbJYxeuFy9UhBBt1Hdxiu1CP+oSFE9bn3v
         mlPvBspxBOq6YSPjM+hQ7I1F2eKQj4nB09heAdFhBP32pAI1HXHxCQxGEYE0e5mSKLoI
         MU4qPNJZVx2doT1K90fLMhB0gE99rTys8im6N8ERMI+9N8FvPhaYJ/eP0qQ4zxquQOAA
         JrGjkDx7/xIKPClWbXjugnDxru9Ik0BnIObCoUYfTZHsQKP7iZa26pjqdD9wuWyI8fnl
         8fnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TwjCUAYn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si9467184oiw.189.2021.10.21.11.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 11:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TwjCUAYn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdd0C-0005JU-C9
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 14:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FrRxYQgKCFcLJ6zDIH65DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1mdczP-0005FA-2O
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:34 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:43663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FrRxYQgKCFcLJ6zDIH65DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1mdczJ-0003Dz-JA
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:29 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 p19-20020a634f53000000b002877a03b293so579659pgl.10
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fAqAMR6EyliijFOAc7rsq13AWc3asmznUg+7CYurHZc=;
 b=TwjCUAYn0+gDtVov0Hf7YCnyrQBjfS9WoC0+l7khILqNiHf4gnYF4GWFboiuuConop
 2cOqFnAuLPjN1dnhG/2W/nS4SULd7UQrBZ3OGcmXSlwa6D143l5VJzOQu3MldHLFfohD
 mMOGBE4srruZO+zCCLjzh8MlPPVuuGctXsjxrp/lcm8JPXlx1SECE1W0HINs0jp+Z/4n
 OFWFmcrice8/Qe+/AFFlnmtZbZDM9Vb2HBm251VihrrmKibc4ILLXXyTVla2yeYA5ZUD
 MvJ6qenupUhvx1cgF5zq3Mm2+OIgm07DJIvMksHJCHM7ZtY45JgUTw3aWhHS93IFNPFL
 QuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fAqAMR6EyliijFOAc7rsq13AWc3asmznUg+7CYurHZc=;
 b=dCk+g5mKDJ8xN7m4C8hojfWPbTLAWlfEeFqPuwHkMURgjRezFVc7/JDfTsZ+4Le0zk
 cVNdplaKLa7nfsxIG0BIGAPtkKuA+bRtLdmfQSkoU7FWWmH3YckfQhnVbdn7I2XRErG6
 15kEnU+xqrojHY8sjRUswfcEwXNQPhCjT3+2pX52MECVnG22ChDCoy/91Rn3b0Z4Qwl7
 +S1rPpM5520GbB2IXpTQWSY0C9tYo16QH0UAn+UU5+M2ORF6+6iLH8ESPV64U7nYVedO
 a16FoZdttkEGfctARt1UvPPFZbDrQOJ5xuHdSMBRCtCouxzzzqwGjojFcWY232tfkqn9
 czbw==
X-Gm-Message-State: AOAM5336321kh1K4MdyNdq3UBb6KkVihGJ7gBY5HWj4h90dc5Z35UvuQ
 3j9RyvSBaGEZIUcglJDubeaO5kyo+qF9VQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:6902:b0:13f:c1cd:88f1 with SMTP
 id j2-20020a170902690200b0013fc1cd88f1mr6853697plk.36.1634841622820; Thu, 21
 Oct 2021 11:40:22 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:52 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3FrRxYQgKCFcLJ6zDIH65DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: f98td30oyLmN

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
---
 hw/adc/npcm7xx_adc.c           | 2 +-
 tests/qtest/npcm7xx_adc-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 0f0a9f63e2..47fb9e5f74 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -36,7 +36,7 @@ REG32(NPCM7XX_ADC_DATA, 0x4)
 #define NPCM7XX_ADC_CON_INT     BIT(18)
 #define NPCM7XX_ADC_CON_EN      BIT(17)
 #define NPCM7XX_ADC_CON_RST     BIT(16)
-#define NPCM7XX_ADC_CON_CONV    BIT(14)
+#define NPCM7XX_ADC_CON_CONV    BIT(13)
 #define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
 
 #define NPCM7XX_ADC_MAX_RESULT      1023
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 5ce8ce13b3..aaf127dd42 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -50,7 +50,7 @@
 #define CON_INT     BIT(18)
 #define CON_EN      BIT(17)
 #define CON_RST     BIT(16)
-#define CON_CONV    BIT(14)
+#define CON_CONV    BIT(13)
 #define CON_DIV(rv) extract32(rv, 1, 8)
 
 #define FST_RDST    BIT(1)
-- 
2.33.0.1079.g6e70778dc9-goog

