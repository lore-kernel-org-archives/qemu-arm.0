Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp864956ejb;
        Sun, 22 Oct 2023 08:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7NkzG7SCC1eOfkRiTLb/iO3HVFV4q18keMgT6EXdl3iy54QWb96+gWC7gckMjaLm8vL1G
X-Received: by 2002:a25:aa0c:0:b0:d9c:e719:1e76 with SMTP id s12-20020a25aa0c000000b00d9ce7191e76mr5372231ybi.1.1697990100981;
        Sun, 22 Oct 2023 08:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990100; cv=none;
        d=google.com; s=arc-20160816;
        b=znzwdoJ31OmVjoDKF4ZEHatTej5Ln/uoEBwNqO+9aRQ5/7VZWT7tP0GYw8sdqeTnuL
         5Gn3mF7A2/SfvGHxGysRMXuih5okpYi5kWWM9WW8vaInpniwAvTuO1mKAFc7/jCg9Td0
         VNdP7W+wwqM6tWJCZ4VptRtT9nMCBPvutHfyrUXeMgBjdtlvBoZ6RDc7UVEGTeEI4wj/
         XEVeW+9OYtfSu4/75v43XpfwIY3nooAhlkbC7uQ2n6XR6XbgkiF+H+hQ3ITaw33yaOJv
         5LUJ1PcdNUj4LvTon2mGkty6eG7j3x/doBkRrzMFVxSZ+f19hw0BXFP25fCLmHed423G
         IR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=350z0rMMun2JRDk6OAEQdA+JsY37n82We01MlpWX5pg=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=E8DVqZmzzQITolFsH+IJJOlOQ/aednpFDzuYmgczDjGKDKFnTo+i5jPcMAtr8rf1A0
         N1f22R15KeXKSd9Yl09VQypXx4p+vfYG+Qzp+B4qrJxR8bYVg4KBm6zz0bMxh5HcdZdi
         e83+nu8Oi1TxYiPlkp1DvvXcbLbbePFqFqoH0nexX/TmMpbP4DwPvcExSEv5PlICK3gY
         nbCWc64+/uJ2VuKi5fvznfcKoT89WgGfJ8UFEVfDTDP6NJZJbKElbJZCpPjQZAjSpjDa
         ou92suIhHuHqphmeop7XOaR3m6GzeI+My6NaWRLzvscuwrW4ExXxCTB2F13XKf7UZkWx
         Qusg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ImWsx5Wr;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id l16-20020a25b310000000b00d865bcd93besi4086100ybj.588.2023.10.22.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 08:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ImWsx5Wr;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.620664.966256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualw-0007MF-Gb; Sun, 22 Oct 2023 15:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620664.966256; Sun, 22 Oct 2023 15:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualw-0007Lh-A3; Sun, 22 Oct 2023 15:53:48 +0000
Received: by outflank-mailman (input) for mailman id 620664;
 Sun, 22 Oct 2023 15:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qualv-0006wY-J2
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:47 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2db5caee-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:53:44 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakI-008TGM-En; Sun, 22 Oct 2023 15:52:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakH-001qYj-16; Sun, 22 Oct 2023 16:52:05 +0100
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
X-Inumbo-ID: 2db5caee-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=350z0rMMun2JRDk6OAEQdA+JsY37n82We01MlpWX5pg=; b=ImWsx5WrIr08Ag7fyqW0t8hzmN
	4SkNQT2tb8YkKezRdD2dJt0hInj/BqQCINRbuKRji9Xb5NS3sdcXUz+YqeRqKaeWK9OCqNiWqJmbs
	TC2f/iS/MJGY7BpqVqcigjPcWAWdzROV2yXQR8NkJ+abvMmdnjFur3vHnNyLtFj+2lRivWY37WdhS
	6aCExMkok6D0szWPv7/X0vBDWvtDPInnSQ06A0m3fGu4dcX7bnNkCt00w1V5ve8JFPyNV+EnHN/iX
	CuGRG9eA1kzR/zyE7+/f+FllC9ON2Tg3VMifjng9c5d9xgO7dt6xAYHunYI06RCke6vyO35pOG1h8
	E7GiuGzw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
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
Subject: [PATCH 08/45] hw/arm/sbsa-ref: use pci_init_nic_devices()
Date: Sun, 22 Oct 2023 16:51:23 +0100
Message-Id: <20231022155200.436340-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: IJ0hSeQDUyam

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/sbsa-ref.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 3c7dfcd6dc..582a28ce92 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -691,9 +691,7 @@ static void create_pcie(SBSAMachineState *sms)
 
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
-        for (i = 0; i < nb_nics; i++) {
-            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
-        }
+        pci_init_nic_devices(pci->bus, mc->default_nic);
     }
 
     pci_create_simple(pci->bus, -1, "bochs-display");
-- 
2.40.1

