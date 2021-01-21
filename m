Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp173047lfb;
        Thu, 21 Jan 2021 11:27:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwphC8qIBKRYOyn9SfCN1put6ydIkF/ORggH/9u519fOmYNsvIq6SB50xKJ0QZYCCAE6Ug1
X-Received: by 2002:a25:286:: with SMTP id 128mr1333850ybc.116.1611257259063;
        Thu, 21 Jan 2021 11:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611257259; cv=none;
        d=google.com; s=arc-20160816;
        b=nKP+c/cWE10om9x/BPUVSOY5nn7RNY/7WQeQD3EnC6XQFuLHqpxfVD/xhrB7bxMRuR
         v8kMwzQNh2pydhluWch2fkckAY9GbM+1phYR8sBmvUsWJJIaDXaoSoHzsJUrtzNIvCQv
         j8QfsrCdjhamdxtKc2sohNdGmQbUjuiYRpKFRFGPMF89fVpEMB0vz6vHkfLc1HbRgLlf
         80Eh2+3yHIEv/R2EV8Q6VwuXnPQicSgCwFxWv2rfxhM/4Xd3IXIHMoIY+e8JGZCZv7Pe
         5qdaKVJ8s4/IOzmjzoLTpLbPeEXmQYn0oOrkPRR/zh7MDNNGcye8ZS94xVxrmITPMuku
         aCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rsYESJD/HWuRtywCiQ4FwoIx9DBv3ZNqK0aUaHfGa/I=;
        b=D1ycczXwF+obMb+68Fkg1xEso6NphNJJAeMgm8fHgli12KIDgh6jx6MZWn4YEch9MS
         VcnqLJG7hPlBird6TkBfkDjWdThm6W716NK/zgXJlw5c71HAwQ9E+7LZwZ37CvFyuqRG
         O7KEDCqjpZsxyAXH2ZWjIx1AulJ4oh+wtCFfCp7pymSIBCS9Jp0D3TnDyFY/i8OK5t++
         Ch+upS/9ahwiOYk9c/rLAohASAl/A/UjxQUm/EGdahnAifcYuiC6T5nvtJKVncjqxpqS
         tiixVkYI173XcwcX2CLayNweAfwVKIdA39frVZu+nuElPfI81mTbMVI5ULnD4x8rAal3
         nn6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffRZg1u6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si5342723ybf.392.2021.01.21.11.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffRZg1u6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fcI-0004sb-DH
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIS-0002VC-O2
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI3-0005uV-Se
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c124so2397279wma.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsYESJD/HWuRtywCiQ4FwoIx9DBv3ZNqK0aUaHfGa/I=;
 b=ffRZg1u6TLr3hUxuwv9QXO7tKTN9RmBUpy2Zsu+fbrbXUD5RZQ0ITOn9wEM1HhbPOn
 TEzIwrdVtsnAFnxDR3cJabvYoY+88bUNst306fglgNxT9E1pDycU1TCcE8MXaXNRex2C
 UAlMN6iNdi/nrAsoAEvRO8zsrlfNHvhKt7WF1p+zzG79tA2aGTFnaxFcTQhCmhSKw0Rd
 4UiEFXhlgcIQJJIkNseCLZlRa6qICIPVwDLl0BEzcqpqA0GkRE/oZO4BLTUDfGIW5Yvg
 c8eQQuLBZq5Z10S6BZdMzOeh4gE7HlncCRur1bBJCp3Cxcsxn3G8GopTMM4uSXxt3Nym
 pJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsYESJD/HWuRtywCiQ4FwoIx9DBv3ZNqK0aUaHfGa/I=;
 b=Cmte8y4596tZwLS1Y4g0VFTyOxsZFEwbr3IiiOOg8UPfyfOkc6CpqEJ+AF77EdE2cm
 Nj2WzNoZzJsD4OPcXi20GTJwJxDJ1oueNsQzvhmkWCnBNxt6B6gDoK0IddhbvRCv3HOS
 TwP5YyAmvcnNjogvHK94X+/WQqvdCxGSAXCK8YtHIH1cx905P/L2LvU3PNxDBomYbG/N
 7ns5/OBsyddWUetOIGaRWkd+nxDTc3o9Gd5qqmN8dS05EI6p/br1an1sXYWYRUT1VlU3
 3InyD06YaIWbQcLfF6ruKD9P0J3I4voTki9GNvFh9HCe/F+Up97eBUoGVJA8M9IFIxQ3
 zBIA==
X-Gm-Message-State: AOAM531ucawAQwVSVDKTaULpI8aMAM37+jcsG7Tj5AyvpvM1//TQAPKX
 KSxilAx7HG0TXWYLrpWhhk0YWw==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr713127wml.115.1611256002611; 
 Thu, 21 Jan 2021 11:06:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/25] hw/timer/cmsdk-apb-timer: Convert to use Clock input
Date: Thu, 21 Jan 2021 19:06:15 +0000
Message-Id: <20210121190622.22000-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/gKsHwu/84/

Switch the CMSDK APB timer device over to using its Clock input; the
pclk-frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/cmsdk-apb-timer.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index c63145ff553..f053146d88f 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -204,6 +204,15 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
+static void cmsdk_apb_timer_clk_update(void *opaque)
+{
+    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
+
+    ptimer_transaction_begin(s->timer);
+    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
+    ptimer_transaction_commit(s->timer);
+}
+
 static void cmsdk_apb_timer_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -213,15 +222,16 @@ static void cmsdk_apb_timer_init(Object *obj)
                           s, "cmsdk-apb-timer", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->timerint);
-    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
+    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
+                                 cmsdk_apb_timer_clk_update, s);
 }
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 {
     CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
 
-    if (s->pclk_frq == 0) {
-        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
+    if (!clock_has_source(s->pclk)) {
+        error_setg(errp, "CMSDK APB timer: pclk clock must be connected");
         return;
     }
 
@@ -232,7 +242,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
                            PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     ptimer_transaction_begin(s->timer);
-    ptimer_set_freq(s->timer, s->pclk_frq);
+    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
     ptimer_transaction_commit(s->timer);
 }
 
-- 
2.20.1

