Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004512eja;
        Mon, 6 Nov 2023 11:56:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCEpQu8Uy/5dsekh5wJAQ8odoiguOsSgZwlrgXJkk7DPtQdmCWhwb/8xu/3ESsodSNp8xk
X-Received: by 2002:a05:622a:648:b0:41c:cf92:f62e with SMTP id a8-20020a05622a064800b0041ccf92f62emr35412064qtb.3.1699300598781;
        Mon, 06 Nov 2023 11:56:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300598; cv=none;
        d=google.com; s=arc-20160816;
        b=BLr0fHPU+zghXp/rwMe5FcQZSOn3uic7F93fqODTZTzst0vGTAIYgAFX6Uhvjq5v2k
         mEgxo4aFVN95N1HD5lettGLVHxTCZTzhXtFxN8JgfAObbPONwhlCMvBhx8jbT+Ni2Exh
         +KAQxDbs6F+Qw4JXs0drL2GfidTuvTBr8fJjhvRAHFwOpwJKGL1VtPZ3EKTDcoAL4aZ6
         NlSTGgH+OMsFceuYK86GKy8+D4UgP1BfZu8zz/a7/pMAYmF75PRI0O1yQj606b7wJWv0
         ciYhm4NVeXzOQqA59wJ582W/Pz59JXqRITXUS8cykAyagDuRPtCjhCAgwJKZJl63H0CH
         ioiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=9F94s85N161zpHncvzHPgHeV1YSdfSxyasD9KuzjSZQ=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=OugHN7cxr/CoJ6LNMDPAUZb5v3l7pl5lMIZsDqqNFr7q6hweKX9JB4ffcBN2G7gBHu
         q0Ug8Skp01UrBniGEEKqSTJ21qkMObJwyKl+Fq6ymZpNKIKVBsQ8elHJC4sYJblOVl36
         H2/eU1/uLUl3Nb774DXiEEyy+amolCIX/g7uqo6vV9lC6WxSGEYL2DJ18gOH+sjFLsF7
         YdvkD7WFUKWbS5B3nYaepi+IneITHxk0YUKxvPQN9hpUlxO2xNCc0Vj7qQ1o7F1L6vk2
         9f4Use1PY2gLWdEUEPXBkhe2Gqu3o2OAWsy56yZkIvmzenqfrKYERx8bwyDoyBf/7PtS
         U3Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b="bgZYgx5/";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id c17-20020ac87dd1000000b004198a7c49dbsi6100510qte.494.2023.11.06.11.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:38 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b="bgZYgx5/";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628287.979590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hE-0002Rb-I6; Mon, 06 Nov 2023 19:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628287.979590; Mon, 06 Nov 2023 19:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hE-0002QX-8l; Mon, 06 Nov 2023 19:55:40 +0000
Received: by outflank-mailman (input) for mailman id 628287;
 Mon, 06 Nov 2023 19:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hC-0001Ig-7Z
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:38 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73570866-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:35 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFi-2f; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNZ-1y; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 73570866-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9F94s85N161zpHncvzHPgHeV1YSdfSxyasD9KuzjSZQ=; b=bgZYgx5/6fVBDmshDfQfGpcoJa
	hEcGronT1Mrlm/GMtUt25KwxrxYJq5G9pAKwgZVawUSKTyL/pPZGyahE6hBfZ8QQN7r8xXvu2Sr5c
	U0CtRd6bWjvZ32F0V9KEuxtlOUxQzw2vkpRjJaIyJUEEdpZ4AvNgaS+5aEPqljEsOj4WNuuZSXgKn
	g17T87x+Cq1NKfAAT6rwTs3/6JnKwG51uBAN1i9bUNBIO4ZyV4BrnS28Ah+9zvJkb2KltpBfxMke/
	mI4hd3/a9SrEmVGQK+xZjpZUFZJ7DmCM9Bk4p0Xj4I4wxYtIPNQuGDzuDS8usmtXrsph43j8pPj+V
	I7YADE3g==;
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
Subject: [PATCH for-8.3 v2 15/46] hw/ppc/prep: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:20 +0000
Message-ID: <20231106195352.301038-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: qZu08gs170kX

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the first PCI NIC would be placed in PCI slot 3 and the rest
would be dynamically assigned. Even if the user overrode the default NIC
type and made it something other than PCNet.

Now, the first PCNet NIC (that is, anything not explicitly specified
to be anything different) will go to slot 3 even if it isn't the first
NIC specified on the commnd line. And anything else will be dynamically
assigned.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/ppc/prep.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 137276bcb9..1a6cd05c61 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -241,7 +241,6 @@ static void ibm_40p_init(MachineState *machine)
     ISADevice *isa_dev;
     ISABus *isa_bus;
     void *fw_cfg;
-    int i;
     uint32_t kernel_base = 0, initrd_base = 0;
     long kernel_size = 0, initrd_size = 0;
     char boot_device;
@@ -336,10 +335,9 @@ static void ibm_40p_init(MachineState *machine)
         /* XXX: s3-trio at PCI_DEVFN(2, 0) */
         pci_vga_init(pci_bus);
 
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic,
-                                i == 0 ? "3" : NULL);
-        }
+        /* First PCNET device at PCI_DEVFN(3, 0) */
+        pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "3");
+        pci_init_nic_devices(pci_bus, mc->default_nic);
     }
 
     /* Prepare firmware configuration for OpenBIOS */
-- 
2.41.0

