Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004685eja;
        Mon, 6 Nov 2023 11:56:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3o6n6J4X8B1DQG2iQ53TkSh3tnAyIkbFVITWVORYfbouSr5/gOCSE+WJ7fBWuTRv6Sh0R
X-Received: by 2002:a05:6830:46a0:b0:6b1:9646:2ea0 with SMTP id ay32-20020a05683046a000b006b196462ea0mr29205894otb.1.1699300619749;
        Mon, 06 Nov 2023 11:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300619; cv=none;
        d=google.com; s=arc-20160816;
        b=A26Cqtofj8IiFFWGqVi1vr8ga6AS+Uu76DCCXJwd9+TM+Lv9AhN5B7gGFQv1ULJmAH
         v9+3u4M/hLCwFa0McVgP3Bnd1O7byjHg+xATS1VxG7gqrd3RluyLpMyrByNDT9Oiz2KU
         j0GlGbNOEiKFjeYQWxF5hchH2kcT5UU0QFqkpNT0pSJwYT7IFq3Fpt8XxhkVIaVFB7DA
         46VOomHmrqwTctxKsaz4U1b5nN+B/NxEFjvFbT3geII5mzwjSdr/yjb/5+Vy8kho/VNt
         T5GOf+L4AyKJR8bmcTaUPk1234eyZd4Z/7st1YB4vFOyHEp3/TLbEgvGNbNFgdn82eoz
         trCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=53sT3CeDc9xXHXsxnlVgayDW0vZ6KE0BHHmNTnQfdBU=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=g1r51auS4U9ZY+Xlpfw9WjtlRRzhlrlOUD00/S5FpSbU7EBp1+lbHKQhVljuNBHppv
         mAVcYu3RZMNayWkAxLWosrzSwreQ51UzADw6IZpp0xbEY7GiQjuWilSjw42WqmbNEELQ
         siiNOc7a7NwexAsgthS0cTykqFvd2maG2rxqlD1rxMupEP0tnFtNKb13worLTeAyj6WR
         bNB89JotaTMto+DsNb0f6tmZ4xZ9UsK/FI7Ta9x9jkXFRgDf8lFUfvECkFRkxsejgb17
         VErI4VdhMaibmfiwjvDmwPvn/qeXi9LJIB+6elMwjQjD+GOqsdEYLNtf38bY7loWsX5Z
         74Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=HCwjrtii;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id k1-20020ac85fc1000000b004181abf57fbsi5663499qta.3.2023.11.06.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=HCwjrtii;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628294.979648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hL-0003zw-2U; Mon, 06 Nov 2023 19:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628294.979648; Mon, 06 Nov 2023 19:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hK-0003ru-9e; Mon, 06 Nov 2023 19:55:46 +0000
Received: by outflank-mailman (input) for mailman id 628294;
 Mon, 06 Nov 2023 19:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hG-0001Ig-CV
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:42 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c66d7b-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:39 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fa-007taP-Qm; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fb-001GNs-08; Mon, 06 Nov 2023 19:53:59 +0000
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
X-Inumbo-ID: 75c66d7b-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=53sT3CeDc9xXHXsxnlVgayDW0vZ6KE0BHHmNTnQfdBU=; b=HCwjrtiiJKiyFyU3x/NClKXi9b
	xvqGzELhrV7zmvpEhf70Qpc4Dv6Bo5o9kSmwVqFA/llaL/c2omY3KrJD96KvgRTOK8UqFxoTc5vLU
	HYxEf0aCK3PtGeFMO2Vkokgksqk9hPvQseo+afAp3kFPYf0yPdwUqzW346DhK6YVcENrldih7xm7x
	x0xgLqtgoOLOOlb6WY9heOhN98STW7gpFvgVWOUeuI8AQIfC+OyhKGIejtt0Vqq8iefPcJVNVp9lD
	lTBFgycuq+gi7+El6wIselkcLZRb9qGT/Z8QbjzGdnywxijjdBfaJ27zt09wtODTP4FCDxXeJWoxH
	ecMm0sOQ==;
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
Subject: [PATCH for-8.3 v2 19/46] hw/sparc64/sun4u: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:24 +0000
Message-ID: <20231106195352.301038-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: cadtW6Rl6L4W

From: David Woodhouse <dwmw@amazon.co.uk>

The first sunhme NIC gets placed a function 1 on slot 1 of PCI bus A,
and the rest are dynamically assigned on PCI bus B.

Previously, any PCI NIC would get the special treatment purely by
virtue of being first in the list.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/sparc64/sun4u.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index c871170378..be06278f7d 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -642,29 +642,18 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
 
     memset(&macaddr, 0, sizeof(MACAddr));
     onboard_nic = false;
-    for (i = 0; i < nb_nics; i++) {
-        PCIBus *bus;
-        nd = &nd_table[i];
-
-        if (!nd->model || strcmp(nd->model, mc->default_nic) == 0) {
-            if (!onboard_nic) {
-                pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), mc->default_nic);
-                bus = pci_busA;
-                memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
-                onboard_nic = true;
-            } else {
-                pci_dev = pci_new(-1, mc->default_nic);
-                bus = pci_busB;
-            }
-        } else {
-            pci_dev = pci_new(-1, nd->model);
-            bus = pci_busB;
-        }
 
+    nd = qemu_find_nic_info(mc->default_nic, true, NULL);
+    if (nd) {
+        pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1), mc->default_nic);
         dev = &pci_dev->qdev;
         qdev_set_nic_properties(dev, nd);
-        pci_realize_and_unref(pci_dev, bus, &error_fatal);
+        pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
+
+        memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
+        onboard_nic = true;
     }
+    pci_init_nic_devices(pci_busB, mc->default_nic);
 
     /* If we don't have an onboard NIC, grab a default MAC address so that
      * we have a valid machine id */
-- 
2.41.0

