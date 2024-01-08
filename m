Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4802ejs;
        Mon, 8 Jan 2024 12:52:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsOtISbnbhxMs14/6m/HNDSXFuptMdKfAdslQocKgrlWJsu5ezpgDJfeWTqi5bqyqxsdHl
X-Received: by 2002:a05:6830:25cd:b0:6d9:d486:be6b with SMTP id d13-20020a05683025cd00b006d9d486be6bmr7782927otu.2.1704747164469;
        Mon, 08 Jan 2024 12:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747164; cv=none;
        d=google.com; s=arc-20160816;
        b=s3Ef8q/nCplWYBp/HQscn7QB6xeFMgi0Wq9ZYB9fA8Jn27IljKJMXY2QoTQByHd/76
         0laHuiytmisQA9a5/nyInSQXfD64dkE9nNfIEgD6ekaaGRZj2msBx7l3eDLPORkl9qgC
         9KmzciWKk+vNaxrJ0D/D2dp8+tE3QwTOQsXmQ7H+Z7GYApWjf41r8UFV1NNTAM+7pBsX
         cohY3Rqvd/mBhT/CafanGoVGqRg0UqaF0uxx8RnlKbsK1mCAiJIz5ZosGxGf75yFyT3q
         sdKEucDDIkzFKpl3fywY3sUsbgKa5LhExEowsw4evdLQ7NjS3H9YupTaGnfiqDrF6/XQ
         6/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=3IJgWxMmUdLOBVuYUZ4BO4uyS9hEOvqvAglyEu5N/aM=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=DQ5TGB8XE+LmOujUw+HdLbsl8sqJAK4exnYxUpgi9NtxGafUyCNPTPDwYtw7RgBpE0
         ZlHLkfQ6dYJCfafdIm2sWDgScWjl954aJXdvRjid2epn2I0lDQYoyJNbWQKrvzQGy/xe
         2KmOEch9mDK7NR+Qj0Xr8LwssssaAtpG3fNOJKPZgwdgGez/9Zv9Gt42FNsVXlgLF8ep
         P2CPi/f54VlobtZigCmCMcF+fwDBvncdx0gNOBVbCnMTdVf1W7vaHMdwI1obFtv6MbB5
         VlwKq+Af+NG/a3xdpztIZiFyxZKKzcZUTQFuqATN4LWEamsBMItsYV4V+Ldjz9lcsiJt
         zY2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ZlBVon3D;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id j7-20020a05620a288700b0078158ded522si533882qkp.635.2024.01.08.12.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ZlBVon3D;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663910.1033939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaX-0003bi-75; Mon, 08 Jan 2024 20:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663910.1033939; Mon, 08 Jan 2024 20:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaW-0003Wl-5q; Mon, 08 Jan 2024 20:51:12 +0000
Received: by outflank-mailman (input) for mailman id 663910;
 Mon, 08 Jan 2024 20:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaR-0000R5-Rq
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2a7eecd-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:51:03 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYl-008RQ9-31; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NH5-2H; Mon, 08 Jan 2024 20:49:23 +0000
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
X-Inumbo-ID: a2a7eecd-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3IJgWxMmUdLOBVuYUZ4BO4uyS9hEOvqvAglyEu5N/aM=; b=ZlBVon3DzGBlJcC87Be0qL8RWU
	d6X4a+DxoBXqP/XC56vV646U0bCd4hdkyLAnU1gOfJvP0C/ZzRNMTkfwfzzf4mext7K0imLIVhvNI
	7coUYjY/T7UNIgIG85T/i9YMGkx8TR8sSvrDQh1F/vqzMXuY8Xw2sKB9xvUSr0rc2ofICePdTnDEu
	0o8fcUcIZB673qW57YhOeq/H8AT6j/TStiqxRQbHJKVAi0Q+dhqTf2bJMMW1B0HL8/8R3WbDQ5Xrx
	s5c7fcKmoTWB7pLR8xIRwnY+fyucp+GpIQICz922h/DyZTkH4cmVM6ML/C32nC8Zq5X6oEkYPxodk
	TwHGOZig==;
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
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 42/46] hw/xtensa/xtfpga: use qemu_create_nic_device()
Date: Mon,  8 Jan 2024 20:27:11 +0000
Message-ID: <20240108204909.564514-43-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: jzM6+2tyO3rC

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xtensa/xtfpga.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index fbad1c83a3..f49e6591dc 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -141,14 +141,16 @@ static void xtfpga_net_init(MemoryRegion *address_space,
         hwaddr base,
         hwaddr descriptors,
         hwaddr buffers,
-        qemu_irq irq, NICInfo *nd)
+        qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
     MemoryRegion *ram;
 
-    dev = qdev_new("open_eth");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("open_eth", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -301,10 +303,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         memory_region_add_subregion(system_memory, board->io[1], io);
     }
     xtfpga_fpga_init(system_io, 0x0d020000, freq);
-    if (nd_table[0].used) {
-        xtfpga_net_init(system_io, 0x0d030000, 0x0d030400, 0x0d800000,
-                        extints[1], nd_table);
-    }
+    xtfpga_net_init(system_io, 0x0d030000, 0x0d030400, 0x0d800000, extints[1]);
 
     serial_mm_init(system_io, 0x0d050020, 2, extints[0],
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
-- 
2.41.0

