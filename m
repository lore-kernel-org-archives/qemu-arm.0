Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2208095njb;
        Tue, 30 Jul 2024 00:32:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm/CCDgbKISeeFxu+V+g/lefMKxbtPcwKmMgjpfOAdHQax3tV1ZU2C5Cn1M208xqcvMh9v255kkjviXk2j3HA3iSpO1AL5
X-Google-Smtp-Source: AGHT+IGz+EYP8QWIbHnHmlzbF3qqirwnj+LC/cJiLBq/iigCBy+BWZtSYUy2qccmdn6SZnmkD7Qy
X-Received: by 2002:a05:620a:25ca:b0:79e:f9f4:3e99 with SMTP id af79cd13be357-7a200c957demr180799885a.1.1722324754847;
        Tue, 30 Jul 2024 00:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722324754; cv=none;
        d=google.com; s=arc-20160816;
        b=S1Gjs+/h2eApZ3e+X/lVJ5idV5inRoA7yLSzdRJzzn+VL1Us50thOxmEkbPvar4Q74
         Tl02eep1sHj7UMQgpABcon2vB9PeZFb6ybjurjHGXzgDJJHp7NDFUD4UI8kRLSFUCnps
         NmtgHjgJIJacOXoqRoVGIRGNfRpsfRaIxIssSYBk2P2Ij3V7YN5y4zErih1ggkCg8/Gg
         /6w8a45oSp+g6jUyhkXJC7GICunscExJuBDCUXvKkDvtYiN5NSOue9AqmwKNVKMcSkLE
         WV8Eu4yyAlNTR4KQLHVerHZKUCGyNT78v+n7vtsjR9c5qLnCy6+0SbTCEje4XhNDbcNb
         F2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jOUqjJzRBXE9ngMgCljknKP+7Jm1yeG58sKU6+011Z4=;
        fh=RxM9RxqjeqV5aQZJ1LUus5lnrPhppysDU9Ra/+Szp4c=;
        b=AR+b0rt/CzkLouSma5TtcTM0mgxddgwOpWzkidp75lj28GD2QhzizzIuHpBhJtUekx
         7Irnt2HPMXThsBBkuuET6GU944RdqsaP4igB+F0bz2OuY4E0LuUMi5tRnJcpYdGXpHWR
         PRRHp4c6LpP3zMotd9L20VRWJHISFofuwTxYUFwSqxR0dVkj2ESO+xx/h2M6LXhcNOSm
         5Eb/TGMLw6MKzRSwp4zajDO7WC9r+4fIdvsU8d08QWpTDovMNYPZ7GioyDyxkciOVWMe
         e3Pzn36dQiW76Vd0PgwGJj37n5uuT8shpz84MNvBhQWbyW+ql7eW9c6x9EhQKWDBp7KB
         0Y2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aruba.it header.s=a1 header.b=X2eEhZ8X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=palumbi.it
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d73bb5e5si1239495185a.195.2024.07.30.00.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 00:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aruba.it header.s=a1 header.b=X2eEhZ8X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=palumbi.it
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sYhL7-0001VU-VJ; Tue, 30 Jul 2024 03:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYhL5-0001Tj-Hk
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 03:32:07 -0400
Received: from smtpcmd01-g.aruba.it ([62.149.158.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYhL2-0003DV-MJ
 for qemu-devel@nongnu.org; Tue, 30 Jul 2024 03:32:07 -0400
Received: from localhost.localdomain ([93.48.145.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YhKysiotWwy3rYhKzsii8y; Tue, 30 Jul 2024 09:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1722324721; bh=Tvbf28qA9MBLLj+jr2qMi+M5DKY5MhWJE5Q1kMhnhYc=;
 h=From:To:Subject:Date:MIME-Version;
 b=X2eEhZ8Xh0oFL9CsBB84vh3SOtyA2tHUbClldlgGXUnddedg8fYqDgJOGFGSDABjS
 eAB7tcyMgFtiDxsYWn+vnIcw8mDT5rpvGRL1reeYDNCS+69Z4XxpRdVWL7HRyvQC9x
 vns5HDTLAWxWJdnt2DzAp/DkAuyJm27YhrTTKkBDP1TUBOyHacbsauPykFoascin3G
 Fx4vMpBJhY1UchnUgpf0yZ/TCG7C3WIsR4FoCpiXVUiQYyZvsPRVPhFfEa9iCMOriE
 kpzshS34jkDZD8Pzv5X8s0sv5wwkIjXpcVi+f5cybUcY+7aMvwlgnBjlbYhzN9/TeR
 cKCAPW74FURjQ==
From: marco@palumbi.it
To: qemu-devel@nongnu.org
Cc: Marco Palumbi <Marco.Palumbi@tii.ae>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: fix RX/TX interrupts order
Date: Tue, 30 Jul 2024 07:31:20 +0000
Message-ID: <20240730073123.72992-1-marco@palumbi.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMSoA+e7khEW/6IbU3GeJ1fEIFlEacat5jOKmPa6cAHigbpAXrLVPK4/niKYuYSDkTpcmmZqEABnZ19NJjoq+Ds2FOA+zoYnrPq7U7Rvk4rKdJIV17RP
 qLhHKzwboVe87RlKjF+2dp0QvtrxrOnE3o3JZ4Ytg1xRLamGl36A9sI8IUOMaVOB/ki7dL47LSqCFTWgKshJbGxmOqEBrZIrl7hLGffT9AxP67mtv0QBA1Ly
 uxp7T7/MXAYTyNrxsQ4D4bbqKDmq6LGr0kjQb8+0RGtKPvcJ0Fb9xwhdlr+A6u6GLDIrEmG0ar7KcYJt+HcwFDbcseKAvpvF7/vwThbj5eP6pVirEp+MColD
 K9gpRC5M
Received-SPF: pass client-ip=62.149.158.217; envelope-from=marco@palumbi.it;
 helo=smtpcmd01-g.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JGkpd4qy0StS

From: Marco Palumbi <Marco.Palumbi@tii.ae>

The order of the RX and TX interrupts are swapped.
This commit fixes the order as per the following documents:
 * https://developer.arm.com/documentation/dai0505/latest/
 * https://developer.arm.com/documentation/dai0521/latest/
 * https://developer.arm.com/documentation/dai0524/latest/
 * https://developer.arm.com/documentation/dai0547/latest/

Signed-off-by: Marco Palumbi <Marco.Palumbi@tii.ae>
---
 hw/arm/mps2-tz.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index a2d18afd79..aec57c0d68 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -435,7 +435,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size,
                                const int *irqs, const PPCExtraData *extradata)
 {
-    /* The irq[] array is tx, rx, combined, in that order */
+    /* The irq[] array is rx, tx, combined, in that order */
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
@@ -447,8 +447,8 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->apb_periph_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
-    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[1]));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[1]));
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[0]));
     sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2));
     sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 + 1));
     sysbus_connect_irq(s, 4, get_sse_irq_in(mms, irqs[2]));
-- 
2.43.0

