Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3324074lfq;
        Sun, 20 Sep 2020 11:01:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7VY9WZy1TlWPHoLwL/2J/ZdTcwIZx55ebSYX/o+NtFQjpC60fAj4rCSvxNIRefFKi11JS
X-Received: by 2002:a5b:109:: with SMTP id 9mr46142538ybx.35.1600624910063;
        Sun, 20 Sep 2020 11:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600624910; cv=none;
        d=google.com; s=arc-20160816;
        b=FscaLDWk48GSAsJOG/++ps9f9Y5R/W6Sqxf67q+z8qub0vnGJzZmKraf1ANA7D+nsG
         b24CY9BT/4vFmjfW71qZhUlpSSGiSgbPoIuJrCkS8cwYpmSvDxmy+BPuekIzp8R4TNWG
         1onXO4hNC7jpnYPdAlk6fsmRHffzBkEOVii3Y/Z6/+sTNKau+LZJk+9VESVqz8wv1Sd4
         rRzQ6Wq2jwWkIwfLGUCLC3HKzPGAwIGEisWhOwQqb3dQbyxaj44AaZw3vFDeh6mLXDfW
         0eE7fKQ+phdAxlPN0I2+eZ0O2tPnBKVvn7TXrypFTiiTAHtU9X6JP+Tpmwlmgv42MAhi
         tmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3AjXG5w656FN23Be/Hsok/QAzJiXXjNLyOG7YnfgnNo=;
        b=GRQ4M4Sp4e9r2VMPo7u8dDfgCw1NnjKpr3Ta5PCUsqcXd9U6rc4lCZKORx/sVz84ge
         UGe9GhlDpIOJ1+jBb0Lv9GJOnIS+5fvRbwo6ep3uqPu7wTF5Wk7wW4qOMsuFHWkXzN7B
         NEFCYgorGvzZUQQXUYs2Rsavm5o0FXVn6Q+zHUQHGolChUG/FkpsBANbczUp8eOqbzw6
         j4Lz+yYQFDiJTDIZgPLBJ+2OEwXyVBz+T6yvcDOIKs+GQKnccIfzKGlFDf3pKFKmxVHA
         56M5TFPyagFn8phzLJAIJ1Y5fbMWXDEQ3zkmasnh+AafYEr2T2ulc/rVUDVrcD5xrseU
         0Qiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ljsR5+zE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si6347528yba.488.2020.09.20.11.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 11:01:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ljsR5+zE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kK3en-0005O1-C1
	for alex.bennee@linaro.org; Sun, 20 Sep 2020 14:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3bg-0001ul-7U; Sun, 20 Sep 2020 13:58:36 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3be-00030s-Pn; Sun, 20 Sep 2020 13:58:35 -0400
Received: by mail-wr1-x441.google.com with SMTP id g4so10430451wrs.5;
 Sun, 20 Sep 2020 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3AjXG5w656FN23Be/Hsok/QAzJiXXjNLyOG7YnfgnNo=;
 b=ljsR5+zEPNjJbO27y7Q7qhZ1LQUsrhg4fL7Z606vSZcSpwnH+4mnfuev6facTO8M3+
 J0LwcDklENnTTm/vJe4s5kwsh1bJyQWS+LWBfFLyggsstbrZ4d++rlFl+hh6lqKszud1
 2n3uwkFXyzbdEVgUG/E2FrkZUp+6xyBuYrKQ6UHbYlcoqW0nIkssZHgulwkzMOiDSCax
 v4hWWFyHhEmM8ZQ6stYFKc/14DmoltbNZQZZCQIyPEI8ghHgCg1dxsQkK4BcpgmLSAQx
 9SwEXl3bXYIgSC6W3UXF1tUSYy4sQF7TOBF8T4knZo+pWDg0KG3f4wfdF2C2kVo3c2os
 RUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3AjXG5w656FN23Be/Hsok/QAzJiXXjNLyOG7YnfgnNo=;
 b=lRv2mZNvDIkmzsKzDpJt0XNEOGbTgqzTyd2T4xQF0B5wZiAcCz9j+7d0+w79TwTFP4
 pB/6Kdv/07iVaq28gZ36KYyDemJps6WBEqG88YU54FKyCf+yXFYQTfpTps6rF3CXXm1w
 PhbMtfndMGgI8WulV//wAq4fuBf2QMKR7iipSu6e7S7fSsUE45f8Ihlc2GzM0+Vdxi+J
 YwyftQkJG4lOEB0s+zJ2NYYsjxQJ0Jfd8cohO3TpbwSnzgBW7Sf9CRjOalSTTVpmlGfY
 NztOf+Rm/qDuY3QHu9CVPnuHNGa5SCbmIyPD4yFBPel7r6xPH/EgLKNply50x4rQ351w
 mhxw==
X-Gm-Message-State: AOAM531wZBiLMY7bFVciXQYPPeK4pJQH90m02NPdsqVqyRpsAAh4xrUX
 EZ48NwkdOP+sG5jasxpxAYyN+NeL144=
X-Received: by 2002:adf:eb8f:: with SMTP id t15mr24945019wrn.417.1600624712806; 
 Sun, 20 Sep 2020 10:58:32 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u66sm15675781wme.12.2020.09.20.10.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 10:58:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT
 definition
Date: Sun, 20 Sep 2020 19:58:22 +0200
Message-Id: <20200920175825.417680-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920175825.417680-1-f4bug@amsat.org>
References: <20200920175825.417680-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r6+Z/I1J3eAg

Use the BCM2835_SYSTIMER_COUNT definition instead of the
magic '4' value.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/bcm2835_systmr.h | 4 +++-
 hw/timer/bcm2835_systmr.c         | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 64166bd7120..11272837a6b 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -18,6 +18,8 @@ typedef struct BCM2835SystemTimerState BCM2835SystemTimerState;
 DECLARE_INSTANCE_CHECKER(BCM2835SystemTimerState, BCM2835_SYSTIMER,
                          TYPE_BCM2835_SYSTIMER)
 
+#define BCM2835_SYSTIMER_COUNT 4
+
 struct BCM2835SystemTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -28,7 +30,7 @@ struct BCM2835SystemTimerState {
 
     struct {
         uint32_t status;
-        uint32_t compare[4];
+        uint32_t compare[BCM2835_SYSTIMER_COUNT];
     } reg;
 };
 
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index 3387a6214a2..ff8c5536610 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -134,7 +134,8 @@ static const VMStateDescription bcm2835_systmr_vmstate = {
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
-        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState, 4),
+        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState,
+                             BCM2835_SYSTIMER_COUNT),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2

