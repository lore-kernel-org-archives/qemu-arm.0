Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2677212lfv;
        Mon, 1 Nov 2021 16:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1/JI7XfhOoKHryaoEjxhAv1Ladv27lAShEt/3GKmgqg74K/Fik9HfO45lf28YtLN34iPu
X-Received: by 2002:a9d:764c:: with SMTP id o12mr24092717otl.129.1635809233338;
        Mon, 01 Nov 2021 16:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635809233; cv=none;
        d=google.com; s=arc-20160816;
        b=fJDW7xetZRCcPKJhRNzme29wsdXJdIRbG4mUQ/cv4EwYHwvjBsXI4aZ1jXjw8CjGQP
         H5rZ4asNSXpdvgBten7Z+mjmiMGpqVrLRneWXWLHNH2BGRsMK9UCPSID/0xcwJHhtlCB
         5HBZEyxDIr+VqCPgpKbUejbJS+A/vOb//oxKIz5xvOkTSVhFb5YUuBTfI+VBqzEt1eVF
         8zUz8oJHDSQDdPwI8qx0yxKocykInlP8z/8dnpWvGe+BJAxIbMxHdXQUobUKGFYrTMB5
         /QBCGpnNjVosIB5iH+qKkhZ20xSXToiu0wCQnsV2OI4OqdSJ1/8oUMSyJoTFPFA9uQwc
         S+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=6AUI0+PiGPmUzag0ZNUEPDyJly7ggJ1Nhpqw9WWQjcs=;
        b=fhQ2xHampS3hme8AS67nzowYE2Pp+ZNfNKY4mDHSbK4roPIVX7b1usS/lGyUrK6o5t
         4n6NFO4L6Yjh3YDNrNAIJatogAEtQOW2phzQj59+1RSaw4ETlLMW+oIQBlW+B5Ujntej
         G2Or+GHGmQuh+XkP6lBSz0m78EHjDfqoJbivbXJsK+Tuack+hfvjsQYvtWr65xvQsYni
         WxakVCRyr+EmHj+5vrkwcgMWenJuJ5LXP/AMHt+DAH3MvgVHPz6uRm6vQrAKkudreDcN
         1Zx/mGY7dL0XkFX2BB33qiMKOZ5qhG6kpPqwHuxj+hZGF6MSyCBJmLqur+BzcWAojgvj
         Hnww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=nHq50hJr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si8567260otj.121.2021.11.01.16.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 16:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=nHq50hJr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhghs-0005J6-FL
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 19:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3NXeAYQgKCjgqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfT-0002Ft-KS
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:44 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:55876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3NXeAYQgKCjgqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfQ-00030F-DP
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:24:43 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 n22-20020a6563d6000000b0029261ffde9bso10121167pgv.22
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6AUI0+PiGPmUzag0ZNUEPDyJly7ggJ1Nhpqw9WWQjcs=;
 b=nHq50hJrrVhslHc/JmRUl/s9XpJJgpGqNrXMJHS83cAflSo1Ic5WpnVVyg3V6WdKGN
 /HO84CyiOtQePtMhZqh9j66Nild1K1pFVd75cyYCFY2emqybZWBgM6B94CJoIjqxo9ua
 /ieCGxEQavK7hnJLnNUHpXMvKjzy93oSZHZvtU7YfjwcyOcK7p49NYxp2Eb8TcpXn55j
 yKevqx0AtzwPb71IjWqYp/A/34rM04fHd1mUExjSn/dCHghc9Y0hGOFNWqAtPkbukPct
 +TRU/oDmN3Pu0x5K/SU6rV2YjOVbjHrLq3wCgkM2gM9dqYRsGyFB+3T+lreFhTredNVL
 dArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6AUI0+PiGPmUzag0ZNUEPDyJly7ggJ1Nhpqw9WWQjcs=;
 b=YmWzmb2fCXmgemqyO5t4SBAdlXVGxfsMA4hCSGuYLEehyXsioFAIzuwsCs30uWZ6oO
 qtqVcjjn4BQvtjn9DJMCueSY2iRQAZmyc4vPP5yJCULQHO8HKwiyB4GqicFyAvDiLBBh
 LhoHc5naiJOFf2W6VNCzhM7FMSnSNpmAgEIOdOaERzczhYSdirCvhVsj60ANqoksBGPL
 ABqp5LPUnD7WrjIwATlQ9SoNPT9IFqF3HZCofVLUjhwVcsHogMUIsekMo0p3FqOIP8t5
 13E0i/FlFGIVTUQ7vhipjNdPnRgPSDo+lP8PGj8yfw9l++8wk7M+A9/qsaEN8ZgOIe3W
 9vdg==
X-Gm-Message-State: AOAM531tHJlmdFbDY+7qRPK0mJAeXcdHSAaP0B3ubOQ/YCxhiAC7ZsOR
 iJFJljnJzBjnMGy/uOgBZorCqm3ahTHr+A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:3802:: with SMTP id
 mq2mr2213021pjb.213.1635809077424; Mon, 01 Nov 2021 16:24:37 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:43 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 3/6] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3NXeAYQgKCjgqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avuao1LyJ8qO

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
Reviewed-by: Peter Maydell <peter.maydell.linaro.org>
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
2.33.1.1089.g2158813163f-goog

