Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4723ejs;
        Mon, 8 Jan 2024 12:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhx+sFQdxwdxynDDt5yJ2WZ6gwHbjJEHp9aQbQqAr1tEVITp/NdbAhHhuBEaOzBwulrHMk
X-Received: by 2002:ac8:7588:0:b0:429:91cf:b967 with SMTP id s8-20020ac87588000000b0042991cfb967mr4536393qtq.0.1704747152000;
        Mon, 08 Jan 2024 12:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747151; cv=none;
        d=google.com; s=arc-20160816;
        b=j/InRMFzkgFHc4SWuZ8qhGtXtpoKyYV4+d6gEGudnSuYVJqpElo+ChCYWycrvFmu9J
         PSG8NPzwF+BzkVv1Pg2LJxEkdgFn7ZbDPUdyZsT8XR2zDkRPDTWVKYihJYfGPvswk6Rg
         4kMLwsRpjDNjpYGLTFTbuu64emlCWVPNIftpURQQgNXqVaPBEBUML37VDY2y57parsgp
         A8H7cZPMDZKoEb87tHBtb9fESc4e5HdhDL2L5M+DAAuKzMgLy1ktwDsPCxFeIKBAG+ax
         TGqwjaSP8BVvwC1sT/F7kZb0blOU6v4RFprXxUxWIPqCpsZv2w7f6zObQ68T2xoeNvbg
         31Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=OnWPh5hbzzJOk4js2nxRTuG9hB5F2v55vySQRb6M4tk=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=oiEKYCbWRgiQlaGznBBzp68Wf85on8JyUO3epdnwQopYHCMo6DbKJYa15f+Ur/R4+9
         SS5ugF8BJlDvZl0cEJxZo5HBWHGrTgnFcwCnwZKUdX6wWTrM4ynKxrh9OojHWsCSs+4b
         2bLKrqZLT5nUA3rtpuxywLQ1ih9X0TX6fgEqrVzchSAkt++aQU1okb7802CU8b1swYvp
         HeuUlxv/svyiKwgauybozTDwbO1Cu3E+8E2rY2rtSrGKppTCwK8840H7YT1eT1/i0UKY
         7WyX1D0LCcjjZIkrYR72JD5kthPFOPg2GN7nslXfyceJev0YZP9qBlPZN/Akvuz3eUpd
         R3JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=eM4ZffAn;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id hb5-20020a05622a2b4500b0042976cbf465si577516qtb.717.2024.01.08.12.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=eM4ZffAn;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663898.1033829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaN-0000yU-6l; Mon, 08 Jan 2024 20:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663898.1033829; Mon, 08 Jan 2024 20:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaM-0000wA-TU; Mon, 08 Jan 2024 20:51:02 +0000
Received: by outflank-mailman (input) for mailman id 663898;
 Mon, 08 Jan 2024 20:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNLN=IS=desiato.srs.infradead.org=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaL-0000R6-Kr
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:01 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fc9b7e1-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:50:58 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYj-007wXO-2l; Mon, 08 Jan 2024 20:49:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYj-002NEa-0w; Mon, 08 Jan 2024 20:49:21 +0000
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
X-Inumbo-ID: 9fc9b7e1-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OnWPh5hbzzJOk4js2nxRTuG9hB5F2v55vySQRb6M4tk=; b=eM4ZffAn4bADdkBWEqoCKrgnIf
	zU48GV4UpKFWM8AZjnxqAsNDiDBB40Ne9EVPaZMtoZW3+PQbyU1RJQBwqrdBybANNmBYcnUANdvi6
	3jQwb23XEJbXAdB8z2wKtWej+vmfHbf3vSn+ZxIEFUbx+y5K5A9QzBWx4TC3PPhlXRzYcY30AtfaH
	j6ZB5C74ZawnoR9pbtMFkFqDbDyTMuwxT7v9W45Qi0rs+jHA1fBUjUB/VNLvF3cXnktKP6l8AZAKD
	e6XnCxIBYP21Ps9UYsQeSm9Whiu+stofElHMXnGyXFGQsxMKRqo1x/rCYc1S89DacBc8KVdsQ51kM
	kbc0tmgA==;
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
Subject: [PATCH v3 10/46] hw/hppa: use pci_init_nic_devices()
Date: Mon,  8 Jan 2024 20:26:39 +0000
Message-ID: <20240108204909.564514-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: p8wwLX9/Z5Tz

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/hppa/machine.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index c8da7c18d5..19d477105e 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -338,7 +338,6 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus,
     uint64_t kernel_entry = 0, kernel_low, kernel_high;
     MemoryRegion *addr_space = get_system_memory();
     MemoryRegion *rom_region;
-    long i;
     unsigned int smp_cpus = machine->smp.cpus;
     SysBusDevice *s;
 
@@ -362,10 +361,8 @@ static void machine_HP_common_init_tail(MachineState *machine, PCIBus *pci_bus,
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

