Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004764eja;
        Mon, 6 Nov 2023 11:57:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwZ9HsSW1WWGJXsil+O6TiHwjEGSxVGUbHs/rYd4Atpbx4yxV3IrUeE8bGe+dtENALM1eo
X-Received: by 2002:a81:9813:0:b0:5b5:9684:625f with SMTP id p19-20020a819813000000b005b59684625fmr7074496ywg.1.1699300632274;
        Mon, 06 Nov 2023 11:57:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300632; cv=none;
        d=google.com; s=arc-20160816;
        b=SFyBmja8HxgmNxEnfJqpY2k7ptCY6oXnvDixyaI2HShFviej7w3gTUSTUL3q+gHD0n
         z8IYEJlwHefJ443DIzWCKzFrxbrxie1sjJUP6/R9dg2YDQrLcbvRdqAlD8qyHhUO3HYK
         Mo5GqOJ2R8c7ytmL21cfxL8hmlPKe+HJLbOKgEtaXwqEnWouEu6UixGjUm4Ith/S/eyK
         H6Ldp0RdxOILnzYnJR+VInaiU5tIyOlkkb3LsRF7XG87LJDJZgRHvLaB2n3SwviQ+oCI
         LHJtf+zSV19F7tWyRZUEqZGF4qG4D7oPng6viZgFgimlVQkBzgdY/JvUJlupJ2WFL1B3
         F6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=Z4wmNoHv5HpsnaTauDJ4KT56/93LmHuykc4Xtvki9Sg=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=kldEJN0HD3DiuRDKXM/n2tG0deUD26QrgictOvETfEx8S2oyohLnjsGI5SGUa5FVj0
         KiKzpN65Q0UUrVVlX8BJ658hZbdh16I203g8CBTmthVoCt4ihGCzEeLXrDJUR6XrctId
         Q/AHW/PxoB4xw/EhsnaU9OB2ZT6ho86EUbw+r0J8g3bUd0kKe8QHP3g3hsfM1aovi/fW
         yTFgZQcPJrQgdkJxhOi8MtEkjTy58dP+WGBbedqV4cQwV8btdSWvnmOvM4JWxBasIkEr
         MEGCF67FySldKT1Yg0awb46r/lQw56S4cnXBgb6OnKJIjHPBnx9kuzGOkyC+6OdT+f1C
         usNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b="okUsf/db";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id u17-20020a0cee91000000b0066d10e104cfsi5944505qvr.347.2023.11.06.11.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:57:12 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b="okUsf/db";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628301.979714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hV-0006QS-NO; Mon, 06 Nov 2023 19:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628301.979714; Mon, 06 Nov 2023 19:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hU-0006Km-Fe; Mon, 06 Nov 2023 19:55:56 +0000
Received: by outflank-mailman (input) for mailman id 628301;
 Mon, 06 Nov 2023 19:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hK-00024f-Nx
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:46 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 760f8356-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:40 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fZ-007taH-Tz; Mon, 06 Nov 2023 19:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNC-0Y; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 760f8356-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Z4wmNoHv5HpsnaTauDJ4KT56/93LmHuykc4Xtvki9Sg=; b=okUsf/dbtKaDDR4uvBRKlfksBe
	mOsew+y19pPxm6WkzBeZQmIsCkMkrCRZPh4wQAqznMOq479Kv1X/XeZhBsuMpmzcqlqyBjhvuv7mc
	X3zHNT5gbkXIAeyZO/ki5Nn+oNQNcMigOyb78lXLViYKwd+1mKFkf2UcndTYkLY8zfSKT1Z+XcsRT
	YH6QR0tAmfggF3h75IKoC5fWNsE0yXOaS+f7bDC+81/gHpZlpc6JprIODCd72otABCMpT9fs+1amf
	ISabgUU5mXohO05dJGhI4O4ERYg+PMOMS4pHdOPKLW7zsv6y6gg1wvxDg1HYR/fI+GErAkGYu1A3I
	fcO8OPOw==;
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
Subject: [PATCH for-8.3 v2 10/46] hw/hppa: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:15 +0000
Message-ID: <20231106195352.301038-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: HtVDeaCvLxdZ

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/hppa/machine.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 67d4d1b5e0..d7cee6e49e 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -309,7 +309,6 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus)
     uint64_t kernel_entry = 0, kernel_low, kernel_high;
     MemoryRegion *addr_space = get_system_memory();
     MemoryRegion *rom_region;
-    long i;
     unsigned int smp_cpus = machine->smp.cpus;
     SysBusDevice *s;
 
@@ -333,10 +332,8 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus)
                         qdev_get_gpio_in(lasi_dev, LASI_IRQ_LAN_HPA));
     }
 
-    for (i = 0; i < nb_nics; i++) {
-        if (!enable_lasi_lan()) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-        }
+    if (!enable_lasi_lan()) {
+        pci_init_nic_devices(pci_bus, mc->default_nic);
     }
 
     /* BMC board: HP Powerbar SP2 Diva (with console only) */
-- 
2.41.0

