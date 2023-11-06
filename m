Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3005018eja;
        Mon, 6 Nov 2023 11:57:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeadSDlOcA+ScZh41EYG3h3QxbHlVvAJiX4QC7VkLkEpmlrJ4vvcZC+NMkMiZJJTsaPMeT
X-Received: by 2002:a05:6102:1357:b0:45a:9e8d:bf09 with SMTP id j23-20020a056102135700b0045a9e8dbf09mr20834711vsl.33.1699300672313;
        Mon, 06 Nov 2023 11:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300672; cv=none;
        d=google.com; s=arc-20160816;
        b=vxZIUG0fmtAbun2DAABP9SHti+SV1Kv3us2GLT7BJ+TwhOVtxwho81rUVrUNIN+Mic
         ohNOhDsyop63ubhhHGEOl6W7R6I4BdluKYgMdEsu4N56fKn4dgb7R2QEC53Ak+kACEmP
         0JQoPSjwmzLfn4WzgNkXgXzRQvtB4x7Jcwlr0DdyobrlGdH6dOhSijemUeLRmxi176XR
         s9ftm1gbzIYCf5Qg5mnir1QEwh/VQ2aISI3edj91nM7DMN1AL/JafckPVhnHIyqt0rZQ
         6Ox12tt/14Q2jM/1yEn41a2uWjUqnm0LAFQFiM/gSlEdj2laC6uDwPGCqE1ZQ9ubRP6D
         HfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hIoRnAOMf4YLSnQadmaBzYXHMtK98X95ymuChZmuyOk=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=j7qgOidCxl7e4SMmopNWA6449HOU1HV2jKe0GRImHdbyqgMKHxPydOCBkwFVP/BHa6
         GxuFYbKuRmEEJ3wOfh04AnMYyRXr+GE158IHYINMULL0qKoDZ7ux2i0H7qJWtdOkm4S/
         thVFPl5vk3yIIx4eeReEJ6nLy6zSlrTRp6YLw6TjPK5hF5YG/S7GEztEHS+n9bmiykgB
         3EMZ/3Our5icYAMGv7oSm4304pNCq46A+m0gGXfIGo/+zR86XNaP3umQtk+lqWkvJok2
         bIdv1lzLhrVeC5Q1eDAzS/RCtW2PMxB84FXE9AQyMiiuBl4PuYUewQFeXoOx8F7kHEod
         z12g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=qUzKCqpV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cr14-20020a05622a428e00b0041fe7e569e4si2443607qtb.242.2023.11.06.11.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:57:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=qUzKCqpV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r05g9-0005ko-Qv; Mon, 06 Nov 2023 14:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05g2-0005Xp-Pq; Mon, 06 Nov 2023 14:54:26 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05fy-00065Y-5R; Mon, 06 Nov 2023 14:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hIoRnAOMf4YLSnQadmaBzYXHMtK98X95ymuChZmuyOk=; b=qUzKCqpVO6Udx/7XIIZTFy0bXa
 8m85YwoNugBIZJ3XycbR/IgX5y/nXHX99FXCHqy5/o1vseWe0iaTrMoL7MC9FrQ0dc15abMItpQYp
 ZWJR1xN6KWhkW72+kWxsmKO27l6QjOeqBVWusI+Hz2MbeJrLM2hFQkN4Kf/4BSyixYnl65hkvrThQ
 qUJl8QRy1qnLdzOGW+Q2qIXWES9a99eal/SYiDM/UTBtyKCjIVqTujTI8PVOfA0Hg0nF4M2XIhOPE
 pqd28U2LshWkEgecDecNcvuQck8JMbE2m/iNgYoQnZgpMkJjSO7ZVbLHC9lvfQYXkLzxlaVVbyegU
 pI4+5QFA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFy-2Z; Mon, 06 Nov 2023 19:54:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fb-001GO0-0s; Mon, 06 Nov 2023 19:53:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH for-8.3 v2 21/46] hw/arm/allwinner: use
 qemu_configure_nic_device()
Date: Mon,  6 Nov 2023 19:49:26 +0000
Message-ID: <20231106195352.301038-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: whTxD8UNyVXR

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/allwinner-a10.c |  6 +-----
 hw/arm/allwinner-h3.c  |  6 +-----
 hw/arm/allwinner-r40.c | 27 ++-------------------------
 3 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index b0ea3f7f66..57f52871ec 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -142,11 +142,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->dramc), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 0, AW_A10_DRAMC_BASE);
 
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
+    qemu_configure_nic_device(DEVICE(&s->emac), true, NULL);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->emac), errp)) {
         return;
     }
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index f05afddf7e..4f102ad082 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -369,11 +369,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
                               "sd-bus");
 
     /* EMAC */
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_AW_SUN8I_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
+    qemu_configure_nic_device(DEVICE(&s->emac), true, NULL);
     object_property_set_link(OBJECT(&s->emac), "dma-memory",
                              OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize(SYS_BUS_DEVICE(&s->emac), &error_fatal);
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index a0d367c60d..4d5661b014 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -294,7 +294,6 @@ static void allwinner_r40_init(Object *obj)
 
 static void allwinner_r40_realize(DeviceState *dev, Error **errp)
 {
-    const char *r40_nic_models[] = { "gmac", "emac", NULL };
     AwR40State *s = AW_R40(dev);
 
     /* CPUs */
@@ -454,31 +453,8 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 2,
                     s->memmap[AW_R40_DEV_DRAMPHY]);
 
-    /* nic support gmac and emac */
-    for (int i = 0; i < ARRAY_SIZE(r40_nic_models) - 1; i++) {
-        NICInfo *nic = &nd_table[i];
-
-        if (!nic->used) {
-            continue;
-        }
-        if (qemu_show_nic_models(nic->model, r40_nic_models)) {
-            exit(0);
-        }
-
-        switch (qemu_find_nic_model(nic, r40_nic_models, r40_nic_models[0])) {
-        case 0: /* gmac */
-            qdev_set_nic_properties(DEVICE(&s->gmac), nic);
-            break;
-        case 1: /* emac */
-            qdev_set_nic_properties(DEVICE(&s->emac), nic);
-            break;
-        default:
-            exit(1);
-            break;
-        }
-    }
-
     /* GMAC */
+    qemu_configure_nic_device(DEVICE(&s->gmac), true, "gmac");
     object_property_set_link(OBJECT(&s->gmac), "dma-memory",
                                      OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize(SYS_BUS_DEVICE(&s->gmac), &error_fatal);
@@ -487,6 +463,7 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_GMAC));
 
     /* EMAC */
+    qemu_configure_nic_device(DEVICE(&s->emac), true, "emac");
     sysbus_realize(SYS_BUS_DEVICE(&s->emac), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emac), 0, s->memmap[AW_R40_DEV_EMAC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emac), 0,
-- 
2.41.0

