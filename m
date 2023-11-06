Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004628eja;
        Mon, 6 Nov 2023 11:56:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFggkK2SMWhVre3WllN8iR1EcgB7l0H875JDQYO6f8g4ZIikZsUeFFVWbvyPi2gjSCIHjgF
X-Received: by 2002:a05:6214:5691:b0:66d:1012:c16a with SMTP id qm17-20020a056214569100b0066d1012c16amr30968145qvb.1.1699300614125;
        Mon, 06 Nov 2023 11:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300614; cv=none;
        d=google.com; s=arc-20160816;
        b=lRJFKoL7bA+XqUqrSjYhTGqNaihVeTrSrTDtwEiutu7dywdmDIXxluI9MFD+bOTlLB
         /iLFO0eUFTB7ArQ/qM7EuVDpxDqztaUa8c0nrij0smJl0zBTuwvL0em+T0iEYNwdxTGP
         UqTWl3yehBKIf8Gc0vG7eABexuKVysqInBSfnpLl+qC3kmAHIAGwrOXMlZTYXmjM5z0p
         Gt5P9OemNjl9rjwYneULG85KpBRYmvfHVOc/2voGqx65exdhrgLFOMSXyolxRmeXcOrR
         GY8FeDc8d5Ult/sdj42xeq8THYwcaIeSOcQcE5nJ7u/mp2HU3Ex8VhGTAhGXKCrzmbOn
         lZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=MtsxthwV/XHTVMI8Ph+V2vIGIyQmamq03UN301HMpX4=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=yAdUT6er2lcTwWiJe9D6UAp0lq2YL4bG2sV6VBhTd+Xm+a3tIpxQiO6RQ71LCuXIlC
         YEYA8KjAia3cMW5FPMEeBpVnzH6NgsOUoYBTDUKtx5Af8n1yW/FIRSzEIxZzAcNaqkqU
         0/n9QvqFiYgVW/kE4P2cJSwIUcqkS68b03X9OJVoAsQ5bDp6+/EBT/VFlGKaNITCkHth
         LjGct0X0nbEvmnmU43xRf7HBZer6QnYVQtjrvusJV5pR3PKKetgF4PnVh2tnEF6YkJNx
         /EKAnX/K6NSP8FSsq7rlcWKiWoWrUlqhhDsRmYS6qQ7TEZj7UAgLSrWSudNWxLxaoYbG
         WmZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b="DAx/R55k";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id t17-20020a056214155100b006585a789586si6096564qvw.216.2023.11.06.11.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b="DAx/R55k";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628296.979654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hM-0004Dt-3r; Mon, 06 Nov 2023 19:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628296.979654; Mon, 06 Nov 2023 19:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hL-000476-FZ; Mon, 06 Nov 2023 19:55:47 +0000
Received: by outflank-mailman (input) for mailman id 628296;
 Mon, 06 Nov 2023 19:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hG-0001Ig-PO
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:42 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 760c71ff-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:40 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFf-2g; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNL-1G; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 760c71ff-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MtsxthwV/XHTVMI8Ph+V2vIGIyQmamq03UN301HMpX4=; b=DAx/R55kK7r8sP6AD0SSADmu8W
	6mv00cH13ry/O54Sp8qxXE34rxLnhofaOJUW1qGtQ/qsfuhzcqJUVr9I7hQJBodwJhYyKbuRvwIP0
	mhghhgHKbon1H8aYLpaHHe3QpOzgK09XrLyS83jLgmxFf3wl63b2Mble6kSsVzMwp00NGKftWyDy2
	67oJ3dnffyFdKhWF4GFw5dn6n5g3AbZO7tcWFsi2ouv9N9AhqXxKbDrhkDzjRtGNT9HPUn8OpRyY8
	nuuQRVH7hiUNbcQiAdIayce9GCd6MAsp19CIW5rrY9YWCRZRUENfxq9jw/TX254Mmyw5fP+Z53IvD
	Jyu/YTnQ==;
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
Subject: [PATCH for-8.3 v2 12/46] hw/mips/fuloong2e: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:17 +0000
Message-ID: <20231106195352.301038-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: Mtc36W2+/9kS

From: David Woodhouse <dwmw@amazon.co.uk>

The previous behaviour was: *if* the first NIC specified on the command
line was an RTL8139 (or unspecified model) then it gets assigned to PCI
slot 7, which is where the Fuloong board had an RTL8139. All other
devices (including the first, if it was specified a anything other then
an rtl8319) get dynamically assigned on the bus.

The new behaviour is subtly different: If the first NIC was given a
specific model *other* than rtl8139, and a subsequent NIC was not,
then the rtl8139 (or unspecified) NIC will go to slot 7 and the rest
will be dynamically assigned.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/fuloong2e.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 97b2c8ed8e..a45aac368c 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -201,19 +201,9 @@ static void main_cpu_reset(void *opaque)
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
-    int i;
-
-    for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-        const char *default_devaddr = NULL;
-
-        if (i == 0 && (!nd->model || strcmp(nd->model, "rtl8139") == 0)) {
-            /* The Fuloong board has a RTL8139 card using PCI SLOT 7 */
-            default_devaddr = "07";
-        }
-
-        pci_nic_init_nofail(nd, pci_bus, "rtl8139", default_devaddr);
-    }
+    /* The Fuloong board has a RTL8139 card using PCI SLOT 7 */
+    pci_init_nic_in_slot(pci_bus, "rtl8139", NULL, "07");
+    pci_init_nic_devices(pci_bus, "rtl8139");
 }
 
 static void mips_fuloong2e_init(MachineState *machine)
-- 
2.41.0

