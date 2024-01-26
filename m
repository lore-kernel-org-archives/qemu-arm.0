Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023913ejc;
        Fri, 26 Jan 2024 09:34:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFb0CeyEdvkwCoUmIMV7JC0D5LiB0jbl/6PxTBRBcLj7Uwr+ozbLN/v6sPS6vSESUjpyiY
X-Received: by 2002:a0d:d285:0:b0:602:cced:240a with SMTP id u127-20020a0dd285000000b00602cced240amr275967ywd.0.1706290458296;
        Fri, 26 Jan 2024 09:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290458; cv=none;
        d=google.com; s=arc-20160816;
        b=IKjqDUyWyJWa1ur7yKtBwLNFTemg6bqwnISH5gjcVdG79l1HUDl1JjaDzvPxJ5TbJK
         YVHDO66SbXRsGH7QRINuQc4jLSqfBYvfYnwPv30skYKmiz+ihWCBarjJyPRFD+Wiv/5j
         xab7VTDM3NGQjPpwTVo8SV4OJ71+s8fZv3yEPJEFJjhsgGYnNLBalQikRlJ6B734ZqHk
         EdDhaghFovUur0hUNacpEgnamdMLpziyFXKofaggOcQa4oc2lDbQYckoJUTIz7IuMUef
         HpE38CwH73jl8C3J8YR+e502qRE5uMhhoP4gEMnNno16TgJz8PUGRwVXppoDr9om+OxF
         lUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=/MTEStVe8JsIJfw31uF1pPqlJs68QbDUjigCzt5wrRY=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=D8V11WUx79X41yem1Z8TUCxSwBJS7vv2+7I4qRpUT+KUWwD84d40opUTKKzvEZU3n/
         O0PtvgLPpKE/IkpRqYvnsggVZevngo0/GCA/vvY4S52xNGqeVvW+iDsEc0vfdXIvtznv
         GvWsF6jjcsb472kx+B+Q86xFUAqCZd26ce8awP8FMWYnvciLNClqj49WXdsTVC5tr3L9
         zz+qz/G/MEumgrJNw4CFlR1RZvvIeQF3bhhwHaOBJanOCx4oy5le8XwX/SbM4cSjHwol
         lljE9zw06W9hAbOGVYwlXWzRhgLD0BB/WtE/I37S4NUwJ8qEFnD01PcxUMqn+Nvpyccn
         C0PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=aDzp80vU;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id u82-20020a816055000000b005ffa9fa2721si978267ywb.536.2024.01.26.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:34:17 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=aDzp80vU;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.672260.1046118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4o-0006h8-5J; Fri, 26 Jan 2024 17:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672260.1046118; Fri, 26 Jan 2024 17:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4o-0006gs-0A; Fri, 26 Jan 2024 17:33:14 +0000
Received: by outflank-mailman (input) for mailman id 672260;
 Fri, 26 Jan 2024 17:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4m-0004Zo-OI
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:12 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7483f1-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:12 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ49-0000000EKV3-1wai; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ4A-00000001env-1PSB;
 Fri, 26 Jan 2024 17:32:34 +0000
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
X-Inumbo-ID: fa7483f1-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/MTEStVe8JsIJfw31uF1pPqlJs68QbDUjigCzt5wrRY=; b=aDzp80vU5CN2Sm/Q2GM88ExicE
	ccJGYACucBtKe16CrPuXI8x6MQzxzt6fV0r84XESGseZvld5CXCQC9QzZzcFPJnI64cgHCod7ddPH
	RewZmZQw7QQO2bMuxR/34YPRdIs5t2+mEggs7lr6xme1yiAytBNa/dIBwShHfjpuqxZIMinnpRN5R
	0dR7BxscgGzjNLkpTt0TkHuA0WY+1biD2fXhnufi8RwbXxrBzTgy+iapTPigX5QHv2cam5VVRY345
	xORHuQhgWGfuhy5q/rHr7UPvtk0ZKFK3DTasYt9itfNJnx5onSt6L5htjQErOc2Vj9QlNnrKKRiuW
	RKbK9Axw==;
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
Subject: [PATCH v4 38/47] hw/net/lasi_i82596: use qemu_create_nic_device()
Date: Fri, 26 Jan 2024 17:25:15 +0000
Message-ID: <20240126173228.394202-39-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: 8S8K17mkuusr

From: David Woodhouse <dwmw@amazon.co.uk>

Create the device only if there is a corresponding NIC config for it.
Remove the explicit check on nd_table[0].used from hw/hppa/machine.c
which (since commit d8a3220005d7) tries to do the same thing.

The lasi_82596 support has been disabled since it was first introduced,
since enable_lasi_lan() has always been zero. This allows the user to
enable it by explicitly requesting a NIC model 'lasi_82596' or just
using the alias 'lasi'. Otherwise, it defaults to a PCI NIC as before.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/hppa/machine.c           | 11 ++++-------
 hw/net/lasi_i82596.c        | 12 +++++++-----
 include/hw/net/lasi_82596.h |  4 ++--
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index a1045b48cc..5ae4f176f6 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -362,14 +362,11 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus,
     }
 
     /* Network setup. */
-    if (nd_table[0].used && enable_lasi_lan()) {
-        lasi_82596_init(addr_space, translate(NULL, LASI_LAN_HPA),
-                        qdev_get_gpio_in(lasi_dev, LASI_IRQ_LAN_HPA));
-    }
+    lasi_82596_init(addr_space, translate(NULL, LASI_LAN_HPA),
+                    qdev_get_gpio_in(lasi_dev, LASI_IRQ_LAN_HPA),
+                    enable_lasi_lan());
 
-    if (!enable_lasi_lan()) {
-        pci_init_nic_devices(pci_bus, mc->default_nic);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* BMC board: HP Powerbar SP2 Diva (with console only) */
     pci_dev = pci_new(-1, "pci-serial");
diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
index 09e830ba5f..fcf7fae941 100644
--- a/hw/net/lasi_i82596.c
+++ b/hw/net/lasi_i82596.c
@@ -118,19 +118,21 @@ static void lasi_82596_realize(DeviceState *dev, Error **errp)
     i82596_common_init(dev, s, &net_lasi_82596_info);
 }
 
-SysBusI82596State *lasi_82596_init(MemoryRegion *addr_space,
-                  hwaddr hpa, qemu_irq lan_irq)
+SysBusI82596State *lasi_82596_init(MemoryRegion *addr_space, hwaddr hpa,
+                                   qemu_irq lan_irq, gboolean match_default)
 {
     DeviceState *dev;
     SysBusI82596State *s;
     static const MACAddr HP_MAC = {
         .a = { 0x08, 0x00, 0x09, 0xef, 0x34, 0xf6 } };
 
-    qemu_check_nic_model(&nd_table[0], TYPE_LASI_82596);
-    dev = qdev_new(TYPE_LASI_82596);
+    dev = qemu_create_nic_device(TYPE_LASI_82596, match_default, "lasi");
+    if (!dev) {
+        return NULL;
+    }
+
     s = SYSBUS_I82596(dev);
     s->state.irq = lan_irq;
-    qdev_set_nic_properties(dev, &nd_table[0]);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s->state.conf.macaddr = HP_MAC; /* set HP MAC prefix */
 
diff --git a/include/hw/net/lasi_82596.h b/include/hw/net/lasi_82596.h
index 3ef2f47ba2..439356ec19 100644
--- a/include/hw/net/lasi_82596.h
+++ b/include/hw/net/lasi_82596.h
@@ -25,7 +25,7 @@ struct SysBusI82596State {
     int val_index:1;
 };
 
-SysBusI82596State *lasi_82596_init(MemoryRegion *addr_space,
-                                    hwaddr hpa, qemu_irq irq);
+SysBusI82596State *lasi_82596_init(MemoryRegion *addr_space, hwaddr hpa,
+                                   qemu_irq irq, gboolean match_default);
 
 #endif
-- 
2.43.0

