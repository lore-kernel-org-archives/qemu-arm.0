Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2231125njb;
        Tue, 30 Jul 2024 01:36:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3iYNYjJ8+Rra0NGEbZHv+SFcnTuS0kjWA4oL74CyOVYqXxG7yo41Zz+mEv+xD0SArrkj8NbLCSm8JHtaKejpkxcEDkduT
X-Google-Smtp-Source: AGHT+IHV5hHeom9u6OPOvGnVk7kNdaGkTeOwLRxjTIOYngUaq1RTpt3TYjPrShDI9m9aXRbJiSzH
X-Received: by 2002:a05:6122:2187:b0:4f5:1a43:de48 with SMTP id 71dfb90a1353d-4f6e69b92f1mr7392902e0c.14.1722328619270;
        Tue, 30 Jul 2024 01:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722328619; cv=none;
        d=google.com; s=arc-20160816;
        b=EnAYTvIzuNuv2UL4o6xZUSY9TQxd5IrasDKBpc6dlWLX6/4yAaYacYzmwGV2TqtvLa
         fTE4K7FC+NmI2IDzEXqRCFw2jxwuyNLleeAMn8QyQMIstnid1Qd/sszr59PCmjfijHUc
         s8ayCeHl9lk1F60gzh2CLTMYgfg1D6nMusyeAXWRkLt4ref/1letSiwSI0ro0ho7BCDZ
         I0XRITIrJ8YMre9k3806XpYf/Dw9NWQnbbLwH8mP2K9R26qZPgOpRVB6wPrDprt4GzqA
         eFUppSfxrqDOECQZm6DdyIUaOugA/yzk/1LtnIC+5BxXWjy7ei7/lgYGdw/8Ah3T+aBt
         u1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jOUqjJzRBXE9ngMgCljknKP+7Jm1yeG58sKU6+011Z4=;
        fh=Oc0u9GTcO+Pabi5/pDtW5t1qeXrKbFuym9IWeZYQo8E=;
        b=DqRT+Mg+hxi8zWlPRW7XVv+pL8OJLz+E/9rNP/dO/+k0XR6xriCVhvA14jddEzsouw
         /V+9rZjolRWw9PxYG8d7KTZ5khEWo9UiuCZweb59hyo/XwlfelekePO3hri5H5f3UYUf
         mdE3IhMX+hUXNojKd3V22SXWa84a1MG07fMP7hHqqv52sF9SifLuCLSUNQzWz/yLP8Ak
         za81zmocynXdOCGQntZc0/v/M6kQE187GpAcgKvlx9MHjzr25tAFQY8ONd7DXuKJOqxi
         k8abVhQfwf5aB6QSkLzL4Y56n0W5nEOK9zwNDvSZJtP3n4+5Gx9nvXvUVkcV8jduH5d8
         V/rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aruba.it header.s=a1 header.b=F2aucR8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=palumbi.it
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe84258d6si119711731cf.604.2024.07.30.01.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 01:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aruba.it header.s=a1 header.b=F2aucR8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=palumbi.it
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYiLR-0007w3-07; Tue, 30 Jul 2024 04:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYfxP-0000ay-4R
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 02:03:36 -0400
Received: from smtpcmd0987.aruba.it ([62.149.156.87])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYfxK-0005Vr-Sp
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 02:03:34 -0400
Received: from localhost.localdomain ([93.48.145.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YfxHsxLqUcvwVYfxHsOTOb; Tue, 30 Jul 2024 08:03:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1722319407; bh=Tvbf28qA9MBLLj+jr2qMi+M5DKY5MhWJE5Q1kMhnhYc=;
 h=From:To:Subject:Date:MIME-Version;
 b=F2aucR8drF/yPoE15FWD6DZqA1J6zyarU0wS0b49MdR1PPnQuSuCIV4QQzwZEFfEb
 ICB5Hl5hOdl4hgaB6ajQT81YjIxjBo6saCVLbPGZ6zlxiguj65ky87gVCvXoT4RwQG
 G2ErwHHHycURKWGxCBQ4uJ6d8S5FG7afdRvpjkX9HaYAyTUoRXzj+rXc30B80t9/D2
 YvgiHX+EDUMoGNGY8CI+eWyNJ4ocjWf4awNyM/dqnFhf3NR1mVLjVKIVNp7TlFeyL3
 pZ1DlyT4FdAQchLVWP/8zWkZbcR0SVNxFP4lCe4xEleVvqr/PgMLKXlF26VJ1LQF4g
 qXjqtNrsmn5kA==
From: marco@palumbi.it
To: qemu-arm@nongnu.org
Cc: Marco Palumbi <Marco.Palumbi@tii.ae>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: fix RX/TX interrupts order
Date: Tue, 30 Jul 2024 06:03:18 +0000
Message-ID: <20240730060322.72966-1-marco@palumbi.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM6AjDsTt4c7ONUayVJdS2eUWB2HYvluTnXIlC4SeWmtWrsWXjJQTd5LYe/zsOq7ZT2LBjSt+VK5xg+PmOPLISG6RmFprFOrlSa3BquXjH4eGkxJysf8
 uqOaqROY/Z2G+jghud/lcWNizp9btR0tzzYfbF5XXOUB/I5OkWHEXcySZO6Tx1PYlaaO7xWzq5W0yEoQSJYFoYHKOCUs07ph8AD8CWoDIksYT0QomEvyi1/f
 ryLd6MVzp6jPznMhzC9KIzawyOfFSxIZO/wjzXVq562yN8oOCF2UXW5KbEMCapFkwBry8SSn5VIw1jdPo03eLroJcngrt+SIPXOAW0fIEwo=
Received-SPF: pass client-ip=62.149.156.87; envelope-from=marco@palumbi.it;
 helo=smtpcmd0987.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Jul 2024 04:36:31 -0400
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
X-TUID: TyflAsfHkPRx

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

