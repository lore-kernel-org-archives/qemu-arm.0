Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2101663ejb;
        Mon, 20 Feb 2023 01:18:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9Dk6jVnlCN5G7eC3rJqCNeJf6Ouj0Sc2c1rhaFUMPzK7TPPJYnpK3wx17wCKgWXamcGyK8
X-Received: by 2002:a05:6214:20c2:b0:56e:b2e4:1f2 with SMTP id 2-20020a05621420c200b0056eb2e401f2mr5345677qve.23.1676884711690;
        Mon, 20 Feb 2023 01:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884711; cv=none;
        d=google.com; s=arc-20160816;
        b=f/+iwCy4gEnVugyaZIHKxLWTeDAr1HMHQsdVeunzOtQyanNnX7eE/ySWzsw9PNGfV7
         J854wKGchMHdiB7gS7hiwtYAMT87tjqBaVurdI3+lHJcJdDRQpwj1LjvCO2ay7p/v5zj
         7Cd5hdred/JehhzhujTDd8YBMVo/t/932poy1sNlpCfbOSsXku8+MwdDM4rrND0s8gCC
         TwKvT+BQHX4EQv8qxTHmoXS/eDkTbcbcZ7x/3qexpMEwpL1tgCuCKq0ohO3W8nVI3Esx
         vnFPx0ACebONmM4iKnfkJ5JVY13ErgsnlOtN2yKjtE43u6CMrC7ThJq/z9U6qE/Hsbj0
         RsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5jcQ5Jy5SaeE5p3W9B4GoLvdNk0rJLyHlurFAjM3Bhw=;
        b=u7Vca006ONpWaeg+I4AEbJ+YR3vCRLsoCBYk7cM66UtzKofyfpcithByu0B4kHjJwX
         Mt+2LYLoBmtD38+P27lBTUe3ivQk7SpuGvZh/mTcMEnz+KkCzxjIMnX3KJKvwjyS+cnB
         LSfRxEP1CAR8iogtLm8X98b4/V5VbmzH7MUCHuCyAaZEShwrvFsD+NhnPZucgH+8XPSI
         tPnWF9XRkNgF7mLifEDoDQWL2dSy/hEu/rVXJAOQC/YiOc4+XjJxmM276Jg8p2a28TZE
         aDzzx+KFiRHhs1A+YuwDDI5ssnrG6mKWuEMjbuEs3h9QcACjJdegnQA+M83RFGWzoBe4
         r/Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oi9fRADP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a0cd98f000000b0057036e45736si7645127qvj.399.2023.02.20.01.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oi9fRADP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2Fe-0005i5-Nl; Mon, 20 Feb 2023 04:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fc-0005gD-Cx
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:24 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fa-0003mj-4j
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:24 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a05600c1d0700b003dc4050c94aso398394wms.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jcQ5Jy5SaeE5p3W9B4GoLvdNk0rJLyHlurFAjM3Bhw=;
 b=Oi9fRADPm4mQ8QrjNJxO44msZ0Sf8oIfHEOgcSvoLovJY7fbrdgwbniIRpeg0WNopY
 VpTGpueMEbNCTXm/EjH/pxTc5O944Nw6i2NKvh/wGYAa022smOtlET9sJcnhOyukGff8
 ltAWS61M8D9QAcdanizxg7Msc2FRj86hJaDeVpjQKL0v8+ICH9NAsT9YO3MA6OsFoHCX
 RqXG8ITslUay9WNEc9tsWxMYQxmZc4buxdEOI0ozWKMwZky5ulHwNKO+2+2YtDXmrnMO
 6gfMGO0OANcsXmELhHCMuxF2pgBlN/onmRGKpxf09TxmX466I/KcBo63XqaPjkrXVnXr
 6Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jcQ5Jy5SaeE5p3W9B4GoLvdNk0rJLyHlurFAjM3Bhw=;
 b=PjS03EAc6dr5RjBN5KN9P9Deaspj9fyobCb5J0AtqWuzw/8J2kJdX1b2Dv1Eoy1ORW
 JOPp4jAeQibfvqSf5QD9QhVQ4cl6ClW4ECzouzCJES+Wu2+472aIb4sHmlZibRZILEUX
 nWVx7UEr9Rbs9o9rY+DzCZnv1Oe+2sAJ79S7vph7zzhyHSVzyW4CO19IRdb9s9967NAi
 LmO0cGs9/SR1cgoz4gwklRA5y+VHBxfDYMO0mVdr2pPV/xJPOx0BkSzylSiuxYkzDOHM
 1VjifFoSY4nMh9FVTh6kHHCh9EAB1ercP0plap6dRh6vs+u9cMnRcm/w6/PfJnxB3mQJ
 gvjg==
X-Gm-Message-State: AO0yUKWZtsC1PMSbZ+YC8AKOoNyJl0OTsCl4EsX0zh0Cl2uOW7h+56Oj
 HWaKrUkKjY03sbY/bISxV5SaP9YqbFSD8SGi
X-Received: by 2002:a05:600c:4487:b0:3e2:1ddf:7452 with SMTP id
 e7-20020a05600c448700b003e21ddf7452mr7877108wmo.5.1676884460618; 
 Mon, 20 Feb 2023 01:14:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 iz7-20020a05600c554700b003e203681b26sm12951069wmb.29.2023.02.20.01.14.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 04/24] hw/ide/isa: Rename isairq -> irqnum
Date: Mon, 20 Feb 2023 10:13:38 +0100
Message-Id: <20230220091358.17038-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: 0yzdCJ5AJs+I

Rename ISAIDEState::isairq as 'irqnum' to emphasize this is
not a qemu_irq object but the number (index) of an ISA IRQ.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-5-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/isa.c     | 10 +++++-----
 include/hw/ide.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 8bedbd13f1..b434cbd0e9 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -46,7 +46,7 @@ struct ISAIDEState {
     IDEBus    bus;
     uint32_t  iobase;
     uint32_t  iobase2;
-    uint32_t  isairq;
+    uint32_t  irqnum;
     qemu_irq  irq;
 };
 
@@ -75,13 +75,13 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->isairq);
+    s->irq = isa_get_irq(isadev, s->irqnum);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
 
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1)
 {
     DeviceState *dev;
@@ -92,7 +92,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
     dev = DEVICE(isadev);
     qdev_prop_set_uint32(dev, "iobase",  iobase);
     qdev_prop_set_uint32(dev, "iobase2", iobase2);
-    qdev_prop_set_uint32(dev, "irq",     isairq);
+    qdev_prop_set_uint32(dev, "irq",     irqnum);
     isa_realize_and_unref(isadev, bus, &error_fatal);
 
     s = ISA_IDE(dev);
@@ -108,7 +108,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
 static Property isa_ide_properties[] = {
     DEFINE_PROP_UINT32("iobase",  ISAIDEState, iobase,  0x1f0),
     DEFINE_PROP_UINT32("iobase2", ISAIDEState, iobase2, 0x3f6),
-    DEFINE_PROP_UINT32("irq",    ISAIDEState, isairq,  14),
+    DEFINE_PROP_UINT32("irq",     ISAIDEState, irqnum,  14),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 5f8c36b2aa..09fe169ebb 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -5,7 +5,7 @@
 #include "exec/memory.h"
 
 /* ide-isa.c */
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1);
 
 int ide_get_geometry(BusState *bus, int unit,
-- 
2.38.1

