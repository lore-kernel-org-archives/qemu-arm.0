Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp586652lfk;
        Fri, 13 Aug 2021 16:37:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOgV4/aGGo4XwlAoV5x06kxHjzGMes9S7UAWc/VVqGLQfz9P9+wccQ/qexUZp/+dD7+3mS
X-Received: by 2002:a92:cd0a:: with SMTP id z10mr3291039iln.137.1628897872841;
        Fri, 13 Aug 2021 16:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628897872; cv=none;
        d=google.com; s=arc-20160816;
        b=jeWRzRduwOSokP3wq9SvyuDN26HOX+eKYwWhwTG0+23JjeGQeIBW7s/BIL0IwdNtbI
         KBfkcydm/0D1IIHmiQj41K63A9fEJ4YmJcfjXMCvgIsaY56/y6IF5vWPo/XSEaoK59dg
         jJhd2fU4lWfYFysT7gF/FAjsuIcqxR/6eS1F0lBt6mvlYlHlGzhxk9Db/o24R9+YRLux
         37FzBzSNwkUt6K7TDoo0aVY5R8YDuj5U6VCcogX8JkE56PwL4iPbqbyxZxmrP5bCSrS/
         b4HEyRrvY7rVILdegAmZagwhIckmYLOjgbNT+J4XTwF/lfU8qZSG2ppMWah61MSfbIEz
         iLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=dc7dxPtCmrgpci5KEojWBc04+d02fyLLaA9F/0tdfw0=;
        b=MGr5u/nCbdFBFC3OC8bKnQm/yRB5130PDLfpuiRgLNKDmhM8vw4FAKpTX+BmPzDtTn
         yREhgH1GDDs45ACD2frr0AZBnvxsrnBJnSfZ3qzMrVbw3lp3edbjXomvU+uEkoRjuxhU
         rb2dV5c0tFnEjqLquuet3Ucal6imMDoaihX6JE/Hoz6mSCuKcSwrfRRJmYEXzdR9NrYt
         wqND9KcEH4n/yc6RnWVwP16FpXJ2LUkxsdEPCWFA1haTMLSqnEsdo8s18vBN4M8qryhw
         QJDiKxHN4TBE6qTcShxa9FN1YV+G7n7fhyTLlnQfqTzJ8i3jk0y5e9MDGadksBl16oIV
         3Bmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=c5N6Yd0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si3634514iov.104.2021.08.13.16.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 16:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=c5N6Yd0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEgkK-00025k-5H
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 19:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hwEXYQgKCPQsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh9-0003fV-Ba
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:35 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:64478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hwEXYQgKCPQsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh7-0005vj-Vt
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:35 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 z23-20020a17090abd97b0290176898bbb9cso8687837pjr.8
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 16:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dc7dxPtCmrgpci5KEojWBc04+d02fyLLaA9F/0tdfw0=;
 b=c5N6Yd0qw/VS0Ke72ilXoCIflTKZUbV2KCiEhUlBBzLAeItvYJnWtYtED6kKFURDDc
 U8Arjq4ROH4CWuTcXoMlkSsrJPHZbl6D5H5hZPtk4rXUxuc5U0nlk7+kfLk+inSRniUf
 uzOIFMBH/hIVYNBL/djlqsLccRogTme+f7c7KoHXOq4vgwlhAyx9JvmBplM9LNvYShFf
 CwFAlohzz6n6aFnCKB8Um9nORAT6flMEaZO8PNSKxvV6sIQ54OdJz2RDQ5F3asHCF8oc
 akeQ3iGmiroa0zX6dRy1Haezoe5ruGJ71nTICpxdEcv9KJfv3HmBPuFUiJMkqxUW63jG
 jRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dc7dxPtCmrgpci5KEojWBc04+d02fyLLaA9F/0tdfw0=;
 b=ZTl09Bs43quyO78aihJsKBSMewnK5Z8cY6vPw3lb6okt/VoB5FJi1oe2Mq2I8Me0i1
 19/YuFBkcOY5asEOxuDYSi6kpsn1A1xthelq98u9P7Ou1PZjFmekTOfXy4PzQ9DlIwW7
 RUQI6wODF+CD14URiDvrNFAz/bE3yBCOefVu1DZ+EAnyLJLHQaXzBvhdGvZ7MX/63Kty
 3+2puS5b0DT+gtwvCcsHtTesBiYzew8k1FyEGU6vcQ7v7plqVuiQ8AwlTbF6/m/FqtWF
 jdoTX3ccUbcVZtSBWj/gapXtqOxlCJRDqticUwstgneUAGmeUS7CfiQCMR7VmkKqQ35T
 /QmA==
X-Gm-Message-State: AOAM530v77O7zRqRffElrqaksacmsj1vTfkYbB2Y3AluQlpS+ZtjVPRA
 p0LCdGMsKmARtXcLCXhOCy1xAdZzbcf+jw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:aa7:8058:0:b029:332:9da3:102d with SMTP
 id y24-20020aa780580000b02903329da3102dmr4667268pfm.21.1628897671891; Fri, 13
 Aug 2021 16:34:31 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:49 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3hwEXYQgKCPQsqdWkpodckkcha.Ykimaiq-Wnijkjcjq.knc@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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
X-TUID: IrwCzD5bi9Rn

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
2.33.0.rc1.237.g0d66db33f3-goog

