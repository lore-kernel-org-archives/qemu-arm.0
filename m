Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2231029njb;
        Tue, 30 Jul 2024 01:36:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWB5RtmShBnhhRoXl8YTxPzy8xltlyt7drAShuJ9Mie1J1HLQ/uT7yKzMfYNd9RGMuNML1oVfumZwUES9p2zUrz4+Y7WVcg
X-Google-Smtp-Source: AGHT+IEk9fSC6If+n+DizZ/y+evuxIdlAPjXOXxny7QN4g0DmxTvCEs5gGZDNyCvGVmJJVaApHMo
X-Received: by 2002:ac8:7c48:0:b0:446:54f5:3181 with SMTP id d75a77b69052e-4503752e09fmr19420751cf.24.1722328604011;
        Tue, 30 Jul 2024 01:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722328603; cv=none;
        d=google.com; s=arc-20160816;
        b=WCyscAfbAkdQmtrMQxJNlME8wRD3e8/RhKt6qnlRVo10HN5qrAx5KtpOVyLodSI169
         9HW1ajHt/3O4fH9kuUI8Dg6NklaEZ7BlvnXzWLIMNGjLS5iPyl3bHEVafKCHWmGiLLvD
         DD4b8uOikzg/RUMIfq/v2BuG+eaKAx9sjkKYyTf1SAtTO1IQO0wVCWEkRwmiLpqwV6Gs
         pAOY0+2++ZQ4fZh3bLapntaItLv8JOB+lEBTM5rLEsq8EDTFPRjy5S+Gvv7Kka7LTPj9
         gVeLBIQGooeTPrq+ZF4MRyME+J0CkT4d5r2ilEjbrQHOv+buTdHcO1aEGZnO0lnFJoqU
         3ZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jOUqjJzRBXE9ngMgCljknKP+7Jm1yeG58sKU6+011Z4=;
        fh=Oc0u9GTcO+Pabi5/pDtW5t1qeXrKbFuym9IWeZYQo8E=;
        b=ZzjiZ+qZZsy0nptLJBEj5y1AwOMUft8lkVFYLeItLwfVqsS8jD773LG3dyUgkIKWCd
         +JSn63VHYwQVOG7P1g3eM0OunqzeZRj6ozeC0txX5YeUjft9GTs626Tpd0NX9cM0emuh
         vbuE/u7mqYr0LyQddJE+KlnGfvoT4fxoLGYuFG8nKy1+9pK+yJqW+8a4L9vT30441kd2
         qzt2ScDrtwFvFw3h30kUw/c5/W6ZydLKO6Sny6oYMPkw79mFqZz+QPuqIWUFxMXyb6cP
         SJ7s191feHDjwoBpdfMFWakkOCByevo80tetnNzZCmpopuKS6/D3XFj+BJ6SMKLYrPYg
         7Zlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aruba.it header.s=a1 header.b=ZJ2pSEtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=palumbi.it
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe815ad7esi123373671cf.194.2024.07.30.01.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 01:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aruba.it header.s=a1 header.b=ZJ2pSEtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=palumbi.it
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYiLQ-0007uM-Jh; Tue, 30 Jul 2024 04:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYesj-0004cw-6B
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 00:54:41 -0400
Received: from smtpcmd10101.aruba.it ([62.149.156.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYesg-0001Rl-1u
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 00:54:40 -0400
Received: from localhost.localdomain ([93.48.145.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YX0gsBXiIegg3YX0gs6la7; Mon, 29 Jul 2024 22:30:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1722285022; bh=Tvbf28qA9MBLLj+jr2qMi+M5DKY5MhWJE5Q1kMhnhYc=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZJ2pSEtQCugYyjzzlHfrMS0xwd2n6cb/75UjQIAIpVov0yG6kKotahlpD9mOtyftW
 gar+M4tKijQnujdO2lT1n0QxDkRwS2kBuy+BT1Rowxtxy/6TSejfvC/JUaj4LqivGR
 24+54pAlgu+F+vZSfcKkiV+xol221NpNSuVjVSTJFsDtQaZwpKR03PAGz5TbaAXeq4
 093xDUDnKISDBl4og8NPwGOZsEDtql90ogTCjRUz49s64Q2tTtEVMIuN0HMtYwdTFt
 PHbZuRY4EqL/Mg0tc3EoOaPk6AdMSs5sDesamrY8MfWZA27MqgLtvKOIfCpEaVWnr1
 rChEjI29CxL6g==
From: marco@palumbi.it
To: qemu-arm@nongnu.org
Cc: Marco Palumbi <Marco.Palumbi@tii.ae>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: fix RX/TX interrupts order
Date: Mon, 29 Jul 2024 20:30:16 +0000
Message-ID: <20240729203020.72937-1-marco@palumbi.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEidVWUwyBQEgMX2gMq5c67nHro0koOox+iRxqAMA+56sO8o3ZRl07b8VYgN5KsDeqNcbPhvzQ7OzmdYBhmAgJW9t3Lh9LNRnN64q0ntb0l3tHoJ03Ft
 AT9l+dFq3DLoDSLCXEQsLd0n3ZI5YvXMxaX5g+sxGUmh3XBuYY1WxVOUyK9aHGpFrDsXxpkhTNTADDxoXeljKwWeeh2J9iFh424EXssDg9FeW1MxDthNG/cZ
 eO0SFoE8hmwSQDLJ7KYTatQAyREuGK0eNrAzQffMVAgNi2cz72va7vi3rzedO8E8seO2NJKELwTMOnHJaojRyLpuPJYUgrdnEWgSlmcRemk=
Received-SPF: pass client-ip=62.149.156.101; envelope-from=marco@palumbi.it;
 helo=smtpcmd10101.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uQbGLTOkV9lu

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

