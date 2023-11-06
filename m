Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004619eja;
        Mon, 6 Nov 2023 11:56:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHneZP4RzQ8Q2M6QnLezO9opCfnxDSnfY/6SlOGRxIwa51BzXspHh3yHCOJdK/BqxHn3BMZ
X-Received: by 2002:ac8:5c56:0:b0:417:944a:bcd0 with SMTP id j22-20020ac85c56000000b00417944abcd0mr37447507qtj.3.1699300612126;
        Mon, 06 Nov 2023 11:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300612; cv=none;
        d=google.com; s=arc-20160816;
        b=bFo31863KFGh93wm5NdKFccbb3w9wje4U6EMPtdiQuKcw9pZzynXwYgk1ogmVnoiyV
         h3wGaftrdDVJCrFiU8pfH7qX1uJi3dvPlG44Ni7/S5JR3icaE1G1trF2WMkM4n2FOFVb
         t6Q6UIrx518jybJaL7WkjBMilEB1zMnIMWfSyAxlyGd2edkh+uOgWm5LM60GsTX9MrTf
         sBsQiTdzQqfVS2hoqfZMfGPI6lz7cCIxCGb0N8BXeiUmZw2A2pFcoKEFZJyvaHfy/gxz
         ZomsISOgkwX+kciIIXN7P2xxh2pfSJ/HaCKTP2WNhhERQPm0N0qR3CI2hl9Es2VELoMB
         r/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=uVqD0N8xPMjrBJQgjiJIoni6BiAb3d/o4YlG390jwak=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=VoEyL/MTDK2DJKdoqwJpkPXBM6aqZ7zgp3HLbUpEWIGlplfvnJ3LKIlF3qnmZTSB64
         Y6yhMvtrH8Pml1sPnSNvFK7EKHbI+U0nvtmKleLC/GkHmXRhM2Iz/JY/+IrKBP8Ng5V4
         t56M9kZNN/44HxzX0ZxuOCHtLGqCEw05Lwj2CDRFsVq06x/GoJrvdGlJPNQlRKhgdNYr
         xzTn17cI0HtuZ8qXsAddiN7YCZ2Sg4QQbWS6G3Zh4onNaASxhYnri0OnZW0bJRQKWWWd
         a59uQVGPylRco5kpXjGY4GPizvkLvcqAn4saT72znEOLfivALeWTWfj+6wYk49+pEmbK
         X4wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=roICQBHr;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id 14-20020ac8570e000000b0041908908ba9si6007439qtw.165.2023.11.06.11.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=roICQBHr;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628292.979635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hJ-0003Za-DY; Mon, 06 Nov 2023 19:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628292.979635; Mon, 06 Nov 2023 19:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hI-0003Vt-Rj; Mon, 06 Nov 2023 19:55:44 +0000
Received: by outflank-mailman (input) for mailman id 628292;
 Mon, 06 Nov 2023 19:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hF-0001Ig-Dx
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:41 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 752943bf-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:38 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fb-007tab-VU; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fc-001GOe-0A; Mon, 06 Nov 2023 19:54:00 +0000
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
X-Inumbo-ID: 752943bf-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uVqD0N8xPMjrBJQgjiJIoni6BiAb3d/o4YlG390jwak=; b=roICQBHrd89cGUxxnVQ4SGclNs
	XDjywuqCAUA3rIR1ANWkBnG8pvsdilTtU1Shmu14Xh+Dlja1cu83/djrGY4S3Brgit+tJ175Yxw72
	qHussyQYr2ufcgB2kP3CwPwt5erN4ypQ8VYgQk9vlxWBH8Y3bG/SHHsmKBhgCrf4CDQte6PSsVbha
	BCxmvRH90iYXqsb4Dn+lUOWkYiBtjqO6gfKekI1FW4QmW4AmoU83zuRoaUao53crzpCx6K6cl20aT
	9so4T+ODmprdAaxd2nTr/MdJfd5BZ4v0402+Ux9u5VnzUrkeIPJktgn+lvga+phr+nXUtuYczzq1F
	3y7Vlc7Q==;
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
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
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
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
	xen-devel@lists.xenproject.org
Subject: [PATCH for-8.3 v2 29/46] hw/arm/stellaris: use qemu_find_nic_info()
Date: Mon,  6 Nov 2023 19:49:34 +0000
Message-ID: <20231106195352.301038-30-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: ixGKxlvcsTTQ

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
index dd90f686bf..fdf15aab63 100644
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

