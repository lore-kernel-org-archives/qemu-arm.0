Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1446118ejb;
        Mon, 4 Sep 2023 09:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN5cxUVAWjrVEqMMUxQ8ftJiHZxHOOwSws3r/4jHnppsSZ1ghA4nTzigObt7K/HVBRbpHN
X-Received: by 2002:a05:6214:1a14:b0:647:2fa7:8e50 with SMTP id fh20-20020a0562141a1400b006472fa78e50mr10415609qvb.24.1693844231087;
        Mon, 04 Sep 2023 09:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844231; cv=none;
        d=google.com; s=arc-20160816;
        b=LhPYyKenbip5bxQvtuiUtPlNGRuZMJx6ABViE/A5nosvjNg+cqITviMH3RSpUQy83S
         tnCAvP7oCFQjSLQvv7itrwAxdkSwyzb9lURhIPXHT7NEv8Ku2o14jRAG1k5y9b3vNuqS
         FUqTx7qRYKE55776MWZ1fio2/dR9+K+y910QYRL1CJJuq0yFDnxSeqPLn9m52LzkVMES
         fQjIi0xR34bo9emIrYJfjhnyWshF7VUXUf4ZTPfOGeR718VOnbolAiKQZoUi/lmXZrAc
         Mq8we/SBDFab7wiNuk/Sey9XH37/GKWnEjRtFwHC5NEzOnCZAMPXHAuesvTPSHIymVBn
         UjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1py6WJ7lyP7JjfX18bziMc96oyFqE8D3chzbCT/Lnv8=;
        fh=/VsiGXSITn7Xm1R7BExfmeuAsw3bqogA9P0rdoE9plc=;
        b=b5+KazFDisnY7KQeWUzMik6cEAuMceYM2iIfkqYyMbMu+UJxUplvwVkoWtEiul59/L
         3JnF+ICV/9TK0vvklFtitNUZQXCkYTSOP4xg1buz/FxrmB3OMjnak1IE2rOaMHBSP4mM
         LKt5xinshFNDc34m8vNNJYSVBYD0xuLfaJwiAvKgDe+wnRqIKW9uYK5lVokNwSCWkECp
         2xuPUGonn2LwhpaggfRZmiTdHTKhyYCuB74oQqCKVhr/UmTEU8g+ywR53l1FeG3PZok3
         4DDKxsfNpE8lOly8+dD9DSmDaKPXTcHZfTUT3PTPAo59ZkjnFyEQLdMdmi4dNUnnD7Lh
         4E6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNd3w8XO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020a0cc98f000000b0063cd763767asi6675913qvk.232.2023.09.04.09.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNd3w8XO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCDM-0004N7-AI; Mon, 04 Sep 2023 12:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDE-0003kr-2O
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:04 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDA-0007fo-05
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-986d8332f50so251868366b.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844037; x=1694448837; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1py6WJ7lyP7JjfX18bziMc96oyFqE8D3chzbCT/Lnv8=;
 b=MNd3w8XOTB9J+rzeWLWgsDrMqDCWYGGHhv5W9sS13eAhto5q8PYFGcP7boDYDASpUF
 Q3YLHb1B3TJAX5Bt0XaPrjvmlYh45s3cmHxpJbKWXomblQz9QfJ6KRVscy0yZgt+G2LJ
 WdG8HIOZc1Mu8icYy335Temn2aUFP8LnOqBKTQzYyq3YJwcMHTuWQw1yZ45BC+w1cX1g
 PWXaViyIrcx1xr2FkdwNjp3N0iP+/uuk4OM9eY2Vt5T/K+rDerjCn/LPOArVDryG2DG2
 P/i2012cSyQR2HSToDcXRfQR600ud6prMgyVJsosAltiG7tCx/uKlXOcLjeRnj2AnlV+
 hdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844037; x=1694448837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1py6WJ7lyP7JjfX18bziMc96oyFqE8D3chzbCT/Lnv8=;
 b=XlTSEro4gXR1wPAMHzP+wMSZLQz2LC9pGt6aoK1xm7iP1JWCVARhflo09Zpfs8ghOD
 cgQFo6Xl37mdwNEtzJhMcMx91VRD0eE8/nGD72Nvj+JkjIqfIr6pJm6G5s49/DC5s6sL
 1WTun8pYFF/gGQCWYok02175JJSmRtFpb0lhH7GGQLU7n9ZCN6I8A5fHT75jNrkewA2z
 2GpakFzbaeFrWPpFODuCPChtNq6SfEz+JBxvgHoICwxStfrp2OoufsofjS0fMsT34HDT
 IHCzs07ivl3dfsKT2x4oupOHIqXGGT33csWmsFMIRt7wQ+0o8NMDMRU2JxhOI2rtSH+j
 RHBg==
X-Gm-Message-State: AOJu0YyVqdUTPFXZZPSZdcw/zjVGRWjPH5wwXLA6kBfdbsQBN5IpTfpg
 xF/lAudbFa8NhTOLV8MYDZnlhw==
X-Received: by 2002:a17:906:70d6:b0:9a1:6318:4d39 with SMTP id
 g22-20020a17090670d600b009a163184d39mr7494768ejk.29.1693844037451; 
 Mon, 04 Sep 2023 09:13:57 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 xo9-20020a170907bb8900b0099cbe71f3b5sm6306309ejc.0.2023.09.04.09.13.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 14/22] hw/nios2: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:26 +0200
Message-ID: <20230904161235.84651-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fHmuDuN4p6t2

Fix:

  hw/nios2/10m50_devboard.c: In function ‘nios2_10m50_ghrd_init’:
  hw/nios2/10m50_devboard.c:101:22: warning: declaration of ‘dev’ shadows a previous local [-Wshadow=compatible-local]
    101 |         DeviceState *dev = qdev_new(TYPE_NIOS2_VIC);
        |                      ^~~
  hw/nios2/10m50_devboard.c:60:18: note: shadowed declaration is here
     60 |     DeviceState *dev;
        |                  ^~~

  hw/nios2/10m50_devboard.c:110:18: warning: declaration of ‘i’ shadows a previous local [-Wshadow=compatible-local]
    110 |         for (int i = 0; i < 32; i++) {
        |                  ^
  hw/nios2/10m50_devboard.c:67:9: note: shadowed declaration is here
     67 |     int i;
        |         ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nios2/10m50_devboard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 91383fb097..952a0dc33e 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -98,7 +98,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
 
     if (nms->vic) {
-        DeviceState *dev = qdev_new(TYPE_NIOS2_VIC);
+        dev = qdev_new(TYPE_NIOS2_VIC);
         MemoryRegion *dev_mr;
         qemu_irq cpu_irq;
 
@@ -107,7 +107,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
 
         cpu_irq = qdev_get_gpio_in_named(DEVICE(cpu), "EIC", 0);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
-        for (int i = 0; i < 32; i++) {
+        for (i = 0; i < 32; i++) {
             irq[i] = qdev_get_gpio_in(dev, i);
         }
 
-- 
2.41.0

