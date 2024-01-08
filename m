Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4282ejs;
        Mon, 8 Jan 2024 12:51:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMAoh1iKsHYKojZjL8SvCKMyUzawaQN0M3lPe6mZLJnS6NBMlZ2+20HqfL5sUb7VRKNAI8
X-Received: by 2002:a05:622a:407:b0:429:9ec1:c1dd with SMTP id n7-20020a05622a040700b004299ec1c1ddmr878960qtx.56.1704747092402;
        Mon, 08 Jan 2024 12:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747092; cv=none;
        d=google.com; s=arc-20160816;
        b=QNFjxDynYZ280NqrVVdsYOxvF0o/YE7Inx4NQ98yCXScmqHBKAyUkZGn1B3WRYVe1+
         UYA6G1WGEzvPZFLXOzf75cD/i4OhjJ3GIJ57qIVcd2co1vIPk4ELgd2fzVus9xNsQZvi
         SCpwOmpCUIdl0Ey7ilFSjs4yQLiRzm3k6NDpLR2HloRDzFv0ouc/UJPnn+gW5z/5STcO
         L/KowCh2ijlPM+Mh1X49S/YstHlsPtQbhEC4YHxAUrgNvAdVtyvvL2DJvcVzQ42rj3EO
         RgUvEy+yIpP0ia2O8FSx4/2sBTAaY1qC3/UGRxVuM1v4s2/efwnRysYnWi8rb6rHtFhM
         C30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5H4+RlrFBb1kzBe4t2y8/9sK3+GNicJATXfDxB43fyo=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=axLOGCDye6KtPpttj6hRdX0w0yLPnv5ZumBqqKtb7/Oj/hB26+aV/DY5TTkWyQYokj
         EjweuL/hxTwSoMKMehuZkdP6tTTrrraOFq3ClJ2kdGi8ECa0BJqZmogf5hj8JdO2FOHF
         NaExTf/RuuoWEFMe3H4LP2cg9p24U7yAlv83kCp5Bo1OEODm5oqmVXgpZl0ruVlt0MZb
         yataXg6ONF7lEpKyRdKTcgKNPtrw4lSUtaLm+QGZh1IofYoRV7h1nQZEGM6F0Y7JSRZg
         yfO7rcbwoTp9zQa32K2W+sXDBWT1oJTCZ6mVwgAaEXaap5T+uVYogPsxjvBrcG4PySBD
         /Unw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=sOqQRiIJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17-20020a05622a00d100b0042991063038si565767qtw.21.2024.01.08.12.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 12:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=sOqQRiIJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rMwaG-0004qK-8B; Mon, 08 Jan 2024 15:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rMwZY-0003o4-Lh; Mon, 08 Jan 2024 15:50:13 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rMwZE-0000v3-9n; Mon, 08 Jan 2024 15:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5H4+RlrFBb1kzBe4t2y8/9sK3+GNicJATXfDxB43fyo=; b=sOqQRiIJwqesJ1F0GQ8sGgjgn8
 14drnnNOVXK2BORNkgmyRJ3x5Mq5CcZFlOyG7ME7Ze3xzZwUSiYlHcoeKh0SIxQj9Vep8K3Aiyr7T
 TUu0l4sr07meaF+29YflIoNnjqtSzGGDslj15cNGYh/TAQPGVQgP3hkcsWJ0kB2IrEW0Mf9Tv+TTO
 bjYFGWQzr4BWwc/NfRxfdF9TxLv6x3VM1XftggObBDViAWOCgFZUSwscrjBqUzv6p8G0XzrqRfD0V
 UFmy4QN6XCuimCND6bM24kDM5DEYzSkxpoJroDRYSU4Io9GY6YqqlSctE4keDdGEcIC7YtVZrziSq
 Z074P6aA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYj-008RPz-VV; Mon, 08 Jan 2024 20:49:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NG1-2d; Mon, 08 Jan 2024 20:49:22 +0000
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
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 29/46] hw/arm/stellaris: use qemu_find_nic_info()
Date: Mon,  8 Jan 2024 20:26:58 +0000
Message-ID: <20240108204909.564514-30-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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
X-TUID: oy08Z6+VBWv+

From: David Woodhouse <dwmw@amazon.co.uk>

Rather than just using qemu_configure_nic_device(), populate the MAC
address in the system-registers device by peeking at the NICInfo before
it's assigned to the device.

Generate the MAC address early, if there is no matching -nic option.
Otherwise the MAC address wouldn't be generated until net_client_init1()
runs.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/stellaris.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 729a8bf569..e8e1c83413 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1027,7 +1027,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     DeviceState *ssys_dev;
     int i;
     int j;
-    const uint8_t *macaddr;
+    NICInfo *nd;
+    MACAddr mac;
 
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *flash = g_new(MemoryRegion, 1);
@@ -1050,12 +1051,22 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
      * need its sysclk output.
      */
     ssys_dev = qdev_new(TYPE_STELLARIS_SYS);
-    /* Most devices come preprogrammed with a MAC address in the user data. */
-    macaddr = nd_table[0].macaddr.a;
+
+    /*
+     * Most devices come preprogrammed with a MAC address in the user data.
+     * Generate a MAC address now, if there isn't a matching -nic for it.
+     */
+    nd = qemu_find_nic_info("stellaris_enet", true, "stellaris");
+    if (nd) {
+        memcpy(mac.a, nd->macaddr.a, sizeof(mac.a));
+    } else {
+        qemu_macaddr_default_if_unset(&mac);
+    }
+
     qdev_prop_set_uint32(ssys_dev, "user0",
-                         macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16));
+                         mac.a[0] | (mac.a[1] << 8) | (mac.a[2] << 16));
     qdev_prop_set_uint32(ssys_dev, "user1",
-                         macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16));
+                         mac.a[3] | (mac.a[4] << 8) | (mac.a[5] << 16));
     qdev_prop_set_uint32(ssys_dev, "did0", board->did0);
     qdev_prop_set_uint32(ssys_dev, "did1", board->did1);
     qdev_prop_set_uint32(ssys_dev, "dc0", board->dc0);
@@ -1267,10 +1278,13 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     if (board->dc4 & (1 << 28)) {
         DeviceState *enet;
 
-        qemu_check_nic_model(&nd_table[0], "stellaris");
-
         enet = qdev_new("stellaris_enet");
-        qdev_set_nic_properties(enet, &nd_table[0]);
+        if (nd) {
+            qdev_set_nic_properties(enet, nd);
+        } else {
+            qdev_prop_set_macaddr(enet, "mac", mac.a);
+        }
+
         sysbus_realize_and_unref(SYS_BUS_DEVICE(enet), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(enet), 0, 0x40048000);
         sysbus_connect_irq(SYS_BUS_DEVICE(enet), 0, qdev_get_gpio_in(nvic, 42));
-- 
2.41.0

