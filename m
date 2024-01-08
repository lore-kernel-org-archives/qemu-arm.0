Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4653ejs;
        Mon, 8 Jan 2024 12:52:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnNx2Ah/Ox71vy10Wp/jsza0EwWK7Sj60JX32Z+em7aheZM8sUCf0M8nrjAYZBu/JNXxn/
X-Received: by 2002:a05:6102:3955:b0:467:c74f:efe5 with SMTP id f21-20020a056102395500b00467c74fefe5mr2869543vsu.2.1704747143771;
        Mon, 08 Jan 2024 12:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747143; cv=none;
        d=google.com; s=arc-20160816;
        b=s/fUQx8WoOFgI+ZTSYb1N7iampLGUFthFVw55YSSNT07kQkjKoSkscrDFyXCGfohOa
         93rrwqlPMRqCTUmHw7U6t5bGYJiZwCZI6+xBIiAR13uU6biWVdYz/hgZ+XDKKld0e0PR
         n1XHyirpC1pLegU3P03R0Li4jIAifkDyp9Oln88MKVa+4cg2+rNBzbGbiMlm8v0zFC2m
         9HzJeCytZpW3PHzraZspPQ9TicaViYWoAfVxmqTpvpcPPGxLFJ0ukB8VT3xSzI7GLOrJ
         d21Z/P/r4tHGCyLf1r/WYbnPji6X7W+nRu2lnNCQ16CI4W0rNruJkAx4HOCfLZqqafDs
         CflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=mKejtkSe+nFfQ0aoeWucod44zhEmF2o9bYQegdFzkdU=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=uOB8wFD0EDVE5cKEU1An2MHCBoesP2zetmPLfivNs5+ZzU9CBpGODbwis0R6QbJwo2
         17lJxp5U82MDV9atGtMN4MWfCmf0ycujrg/M1tn0IIkiIK09vuaO5+StNFcfu0Jlm9Nb
         /nEIZnR1UJvG5Dr19AFoRH+x7OPkyKWYehKNDOz3JwVqpDwihHQZONDPBOMQDAy24H37
         jmSxP0i/t2/1ZDjBIJIzvjHeTNaCtns4FKuZ9VddwyAkoXoRC40dzgBiabPH8XesMFfR
         sHs868mqN6wW8Iv6R6NlOLp9Lmr0sQoT3m66tKlsZxQ/KBSlXXJjgrIYyFlOW76HRdVx
         9QEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ZhUUZhVn;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id s11-20020a05622a1a8b00b00429a368b18dsi209585qtc.476.2024.01.08.12.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:23 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ZhUUZhVn;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663899.1033836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaN-00012h-FW; Mon, 08 Jan 2024 20:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663899.1033836; Mon, 08 Jan 2024 20:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaN-00011p-6y; Mon, 08 Jan 2024 20:51:03 +0000
Received: by outflank-mailman (input) for mailman id 663899;
 Mon, 08 Jan 2024 20:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaL-0000R5-Qx
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:01 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cb0f570-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:50:55 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYj-008RPh-C4; Mon, 08 Jan 2024 20:49:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYj-002NFB-2x; Mon, 08 Jan 2024 20:49:21 +0000
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
X-Inumbo-ID: 9cb0f570-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mKejtkSe+nFfQ0aoeWucod44zhEmF2o9bYQegdFzkdU=; b=ZhUUZhVnEtNk66WpkrjhP43mCV
	H3uiW5TCXECVTszSMNTlGImLRnCJ7mRVxLbSXF38/zp3zDh02oGGm5xm1I++bqiszLsiMgpKlsBbn
	TJQE40SEXrpdX5zDOCgvIUvf9p8gxJfkb+6CquiaHmvhy7TAgDi56pnWpJpl40xFp1hW+Xx6NKe3k
	vCmsdXhQ0Q6xN/66xcfxEuTCsskLeP5QiaL+89ed4mPu9Kg9GS2bh5ElDodmdAGOkP/R3hIqKRb+l
	MgVuvJNBtE+tYSeTpi/2OPg3fM5ZN3Lu/S6/PYMJcGzRRk680SD/KQX/roookyqQ58M4LHbFjVmKM
	Otesh1vA==;
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
Subject: [PATCH v3 18/46] hw/sh4/r2d: use pci_init_nic_devices()
Date: Mon,  8 Jan 2024 20:26:47 +0000
Message-ID: <20240108204909.564514-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: 86JXUIt9HnHD

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the first PCI NIC would be assigned to slot 2 even if the
user override the model and made it something other than an rtl8139
which is the default. Everything else would be dynamically assigned.

Now, the first rtl8139 gets slot 2 and everything else is dynamic.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/sh4/r2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 4944994e9c..e9f316a6ce 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -240,7 +240,6 @@ static void r2d_init(MachineState *machine)
     MemoryRegion *sdram = g_new(MemoryRegion, 1);
     qemu_irq *irq;
     DriveInfo *dinfo;
-    int i;
     DeviceState *dev;
     SysBusDevice *busdev;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -309,9 +308,8 @@ static void r2d_init(MachineState *machine)
                           0x555, 0x2aa, 0);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
-    for (i = 0; i < nb_nics; i++)
-        pci_nic_init_nofail(&nd_table[i], pci_bus,
-                            mc->default_nic, i == 0 ? "2" : NULL);
+    pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "2");
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /* USB keyboard */
     usb_create_simple(usb_bus_find(-1), "usb-kbd");
-- 
2.41.0

