Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023920ejc;
        Fri, 26 Jan 2024 09:34:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhcXmOZvVv6o8i95BTJI3JN2ycJCI4cHweSc1d5DR32cKTQvPYPu2J0MUki/M8uyQeP9fW
X-Received: by 2002:a25:640c:0:b0:dc6:457f:c1cd with SMTP id y12-20020a25640c000000b00dc6457fc1cdmr291354ybb.6.1706290459596;
        Fri, 26 Jan 2024 09:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290459; cv=none;
        d=google.com; s=arc-20160816;
        b=YJLuzNLTCaXH+9WORZUQqcfZjZYabId9Fkia9izvGyecr75htSj6j5ojTurPhSu9pl
         M3Ar1xaKwO+AKh1SRq6vrwrgob5yGu0s+HogInE15ynee2SpnT0W9++xr2S4YqH8raNy
         +noWwYNZoIwyGKDTUxeryovwf2oDYTBGV1GE1r1GkXnjtLmx3ZvWb3opYHvgOFahufe5
         cthuEo71joslloNJiYrGS/QuaHFo454S4nbOls5LeL5DOHzIHSlR6N555yHJq2imcnef
         /MCl8q7iRyfYzH5Z1DpKUQG9Mp/iXzXjV6eK2c4e7UaAppx0PrXFnt5+oxRGelCut1zp
         aPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=968FfiIx6xTKDJXJoXrAu14UZ4c3HMbAlGKHEl9nV4w=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=N1tiNY4IPRDaqCz2Ru6w4ousltV5iQaaky5bbHBvJCPRW01DdDnLbrfVyyd2WAW7bv
         1YNXv0VJCCBUOJNWTPIqMIMy07Pd8vkQGDioxs0TLkAv62Fom8YWDbOLJuXMxBNi6PFv
         KzU5NXZhEexpEAg1wbg7L3ITfLrQT7iuIppz1UC31n5JobYbFU9Fus319DLmG02xk3F6
         E9RLIZQUURnzr3tI0OsL2DDnpaoSszh8dy7TxttpFV5JCPptZzd8ZHAZkVwMq/miluq3
         Gmg2V37SpMQxolyvMgEgxoXHO/4Fxexdvuk/2ZG9Bl72OlY05W+6RYYpquOl4KF7qTGb
         DBog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=bNQnqA3i;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id g13-20020a25b10d000000b00dc2289c41c7si956889ybj.633.2024.01.26.09.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:34:19 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=bNQnqA3i;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.672263.1046130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4p-0006rF-E4; Fri, 26 Jan 2024 17:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672263.1046130; Fri, 26 Jan 2024 17:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4o-0006p6-Uv; Fri, 26 Jan 2024 17:33:14 +0000
Received: by outflank-mailman (input) for mailman id 672263;
 Fri, 26 Jan 2024 17:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4n-0004Zo-OZ
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:13 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fad9be61-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:12 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUN-0LUU; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ48-00000001emE-3Z4R;
 Fri, 26 Jan 2024 17:32:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: fad9be61-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=968FfiIx6xTKDJXJoXrAu14UZ4c3HMbAlGKHEl9nV4w=; b=bNQnqA3ia7NcIR0I5BM/faxrjJ
	RQqKOP7UTwn5CM9MqTVYRdLSglntBNT1+Z68wtYVQ7M8VFbMOFa1J93IPv9G68D/pDzlNGz94M7PL
	SzvEchfk5/xjMAVTF7DHS0PLexbY4t+WWLG9PZtrybRwqGKrSoBh/Lul/vXiRihNOHQHlNlohKXQ9
	T/fhztZnc7WkSOt5GX74uYVaN8OuIcY0Sb27IROMoMObE+SpKfgEGnquCB/z5KPmf4hH0nQXFrd4X
	tr/O6dIBs7YD3ciKL3bKUq1lFsPuHBoSByMvikAkKk1UhcbGGUyw34CnpG+P6SAUG2ByunA3YlEu7
	1F1CeXwQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 21/47] hw/arm/allwinner: use qemu_configure_nic_device()
Date: Fri, 26 Jan 2024 17:24:58 +0000
Message-ID: <20240126173228.394202-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: UYxWYV80Abl+

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
2.43.0

