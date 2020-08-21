Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp83234lfy;
        Fri, 21 Aug 2020 01:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm368BAmFTeMwwmBDCzc4/Ncdhu2xXmVinWbR/p+wluZZ9Mcf4Vc462n8gUd37FAKx6bjf
X-Received: by 2002:a25:d48e:: with SMTP id m136mr2348266ybf.148.1597999163350;
        Fri, 21 Aug 2020 01:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597999163; cv=none;
        d=google.com; s=arc-20160816;
        b=M6qM1mHAuiW16A/XWXEf6gWYgNenryDqNxs3jqroTbDWx4bXSYPjLjfEA3AYdUxRmk
         OgxkWWgs7uaq7IwPVNEObnrV2KaZX/fyJqZJhUANmeHBPvAf9zJYLMQWeZ7Suyvjclmr
         GwCQW5NZ0N6dOo4G2lP1uoP86ObwrrKuSCF1hLXfYaZk+Ud9eXmSPAv3CTvTwCNJU50l
         yrlr7f2pJrW/0z8ydUZ4awTuxvx92x84YXUZ65eC9AOwOx7S4pqO3ptSF6K+bFf8/xuu
         23TQvjbPFaRxpHJa/Azv6r8jeCT4pVq7WSQecGa63M+iTEWN1BLuLEOjGkJ+kQ9YPGyf
         vMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MPOQTvWY5mkdTMoe7rAdUs/hKPaBZkWNb8pyJGwr0vQ=;
        b=bKpJdxC7dISDqpitUiYzgF+d9zA1mpY803MB29yz13v6jEUWPc59PMvf3zf68dVw4k
         BRQWC9ThZAeZXY34+nTyvVsnOJYuk8BlP7BHsd4mv6gjsXZ2yKStOyBzZGocT6gWYLfb
         opHBMDfVa3lHvUUUwqrIg/s07Y7tte6M4GvMWmxtlf2WJOX5dlqS4mY6eXo6FTGRxIYJ
         zyWN5/OnSmPplo+EPUQE91ll9aP2kTZIyfmGrBn0JYnHRcG3tJW64aiZjBspfGKSgLPM
         haPytn/zGOgtPGwGaONkVHoM2+hHlSNwa8Vdtvuth4ChFTEr2bjm+qjSmg1noleSZ7iV
         aY1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=qE6zTXif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s91si1668788ybi.418.2020.08.21.01.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 01:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=qE6zTXif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k92a2-0008F9-O4
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 04:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1k92Zt-0008CI-NN
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 04:39:13 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1k92Zr-0005sb-7t
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 04:39:13 -0400
Received: by mail-wm1-x343.google.com with SMTP id k8so1017545wma.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2020 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPOQTvWY5mkdTMoe7rAdUs/hKPaBZkWNb8pyJGwr0vQ=;
 b=qE6zTXif/EbApXibLnotpLxetU9HcUx8SDMRGNCtUKK93snTSfdY3ZqHsWi/dC6gdM
 IjpjO8hnqDixWu2VpyemRXYMSyNcFDaPt9+xfDfxspMEIZzqI3GWA8p/flpTXEX1YmI5
 qdWh/rL+qZ4PPlAiu35Z5lj4AND7ppujuMTuy4UlShgGeokugBCVw39nh3Y9PfwSrXu6
 7OVXn9HfJLOp5jibWxRmowTLQivPtDJxWVADdmyDNu1k8f57brC+/2Aecfn80TtvTr/9
 g1panFrDz1okvsWqk2ppmnnCrKbRSOoyFZnPmMLGtQCJF+vai9NpNtUDaOoIQQVnSgA8
 /FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MPOQTvWY5mkdTMoe7rAdUs/hKPaBZkWNb8pyJGwr0vQ=;
 b=rDFWFcrGVkSnotfEjUYWDEJ79KtWb/Um+AurcRMaTBaVHXH3a43eCrfTW3sWv0b9co
 hFNQ6ALYcqF7PWf2WM+1IUzgmyuMEf9/5sPkpJrPo9wGjpNkipNfl0+EFxSUcNp/XYad
 gvohnJagCcy/4wV0lDbRQPGdBn/0B8qUuzaLVPjJIXZQywfNvE+1LXK473QNZfjsLTDc
 xklbyIpARrhuLP+3x5jMMVVql985nqpYQNSp/om2zEkpQrO+ERHceYVQZJoSrmTudJYx
 RIlop9Pbj6bpnqB9B+z8pGfyj81A+tJcd7GsSog1hP1rnhbrkvqJ29cVL3sl1tTtfEGK
 Voyg==
X-Gm-Message-State: AOAM533xZkI/NCqReyWHDY7KkOiaRhwsdPAjwOG00NVvrQWiFl8dA6k1
 v8P3vemLRSymOPPLDnVutb1GPLw1EHNwOrQjgMbEc/snLC8+RxNN2nGpI3V7KRGE8O/ec/HiPaB
 rYH00gUthAp7xctDae5uWi7zX26v6lCXKSPgBcFWB1KyxQ8l3EJfh+dgacgrhwQXjUX4V8A==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr1994664wme.172.1597999149267; 
 Fri, 21 Aug 2020 01:39:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id n24sm3192206wmi.36.2020.08.21.01.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 01:39:08 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/sbsa-ref: fix typo breaking PCIe IRQs
Date: Fri, 21 Aug 2020 09:38:53 +0100
Message-Id: <20200821083853.356490-1-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 rad@semihalf.com, qemu-devel@nongnu.org, leif@nuviainc.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EX1IthI+ulZE

Fixing a typo in a previous patch that translated an "i" to a 1
and therefore breaking the allocation of PCIe interrupts. This was
discovered when virtio-net-pci devices ceased to function correctly.

Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 570faac6e2..48c7cea291 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -565,7 +565,7 @@ static void create_pcie(SBSAMachineState *sms)
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-                           qdev_get_gpio_in(sms->gic, irq + 1));
+                           qdev_get_gpio_in(sms->gic, irq + i));
         gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
     }
 
-- 
2.25.1

