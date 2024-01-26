Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023801ejc;
        Fri, 26 Jan 2024 09:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsETU7C490tL0oMLmiWyBWJPlHTmpZRXYsg+pzgfi/sQAFElnKTOvPoLeBGz1dE7S6z4n8
X-Received: by 2002:a0d:df50:0:b0:5ff:5d60:bc26 with SMTP id i77-20020a0ddf50000000b005ff5d60bc26mr249131ywe.1.1706290448869;
        Fri, 26 Jan 2024 09:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290448; cv=none;
        d=google.com; s=arc-20160816;
        b=Xt3Gv1Nt9EfJceGrdzwrBPJkjqLVfixYzPihxyUfpDP8CEdmfXnAtdox8ghEMgDAXS
         nPhoyIDaTY7Vsofx0PWLVmV/iaCqExat7aQOof+UCYWW4VLvUK52DxG7QeOT7NzMITat
         qgoVtSz5n/EGDkujg3Kn7dfhT7Mv7dombnFXqoZOu+9enk1Ij5qEBuGFWguA0AdU19vp
         xdNYJuMWDYGqQJvyJh/bOP82w9PsKFXZNTuVS3cT0haRuq0ooojf8rxkGfSGYQfuHEiF
         o9lTOGoXUxDb9wUIJ3nC74d1G+j04GfsnId61GKKBJw02mrPbsCX2zWyJ+Iay7dOJWDs
         +4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=pMTNl31Z4wpC7RcyuXgVYoTxdcUq3RoTFZ8/v9Gj+ug=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=vN0GAu/opfciCcZINtqKQ8gjR9/1URTEagG3XyGUpEaKSWp24zj+8ozQrzcoVOjL2m
         HGXgk8EliuYXgD1sosc5Yugc1kqILluhIMoL1i6lU4viWKdI6j0XKmvbTgp/0j5aWsNe
         63z5V95gorFpfqDe8gNInnr5Zl5vIuwRl5HAaVG1cyPMdRuRYAAMhU/jaFcjTCw9v8Db
         hE9l+Z3YUkQH5gKbo/iEjBUWYk7ZiLk5yKUZHve4sm6sSWyS5by1eueEfEnLKqqitye3
         F0nAL+uShOLeFM9DT6GDJDnZlF1h+C3CkmIqcfXTjTFwZQT6Xfvm9jWK0gZCuLqtYt1g
         S8Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ODknmQx9;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id y8-20020a0dd608000000b005ffa1061076si974136ywd.233.2024.01.26.09.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:34:08 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=ODknmQx9;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.672253.1046049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4g-0004ot-Pn; Fri, 26 Jan 2024 17:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672253.1046049; Fri, 26 Jan 2024 17:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4g-0004om-Mk; Fri, 26 Jan 2024 17:33:06 +0000
Received: by outflank-mailman (input) for mailman id 672253;
 Fri, 26 Jan 2024 17:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4f-0004Zo-DP
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:05 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f62c9830-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:05 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUO-1Dvu; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ48-00000001emH-43JH;
 Fri, 26 Jan 2024 17:32:32 +0000
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
X-Inumbo-ID: f62c9830-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=pMTNl31Z4wpC7RcyuXgVYoTxdcUq3RoTFZ8/v9Gj+ug=; b=ODknmQx9pYHZ2OKzuPTEoZWS1B
	QfPM2lEpj+28gcu3a/nGfEJDtNOhbYE5phTZvy+Q95iPyF7opdo6PhO4rKABtsv1fVlLZ8/pUr+Ps
	snEPHO+f2tc4eKwrTOt4PRfShqjQC8kKFEpjsViqXHkLjp+mcTXkA0bqpHVgIykBy/YyJb5emsmXy
	PAqprcm+ymy0h/xEza6ae9QafFApdKKvSK+Gfgyvnp7DFT99VAYGuoBSMPd5FWS2dUQmSWMyHM9mt
	8RukyYs2i5ya21RAr7O3+4ZQ1nhuYilKDm9rnb2d1dJmC3axTOwTubfqZrvhFzMpUh0qimjhcAqMC
	lUUf6c0A==;
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
Subject: [PATCH v4 22/47] hw/arm/aspeed: use qemu_configure_nic_device()
Date: Fri, 26 Jan 2024 17:24:59 +0000
Message-ID: <20240126173228.394202-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: rA/UAG7xvxN4

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc59176563..bed5e4f40b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -356,7 +356,6 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     int i;
-    NICInfo *nd = &nd_table[0];
 
     bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(bmc->soc));
@@ -371,10 +370,10 @@ static void aspeed_machine_init(MachineState *machine)
                              &error_fatal);
 
     for (i = 0; i < sc->macs_num; i++) {
-        if ((amc->macs_mask & (1 << i)) && nd->used) {
-            qemu_check_nic_model(nd, TYPE_FTGMAC100);
-            qdev_set_nic_properties(DEVICE(&bmc->soc->ftgmac100[i]), nd);
-            nd++;
+        if ((amc->macs_mask & (1 << i)) &&
+            !qemu_configure_nic_device(DEVICE(&bmc->soc->ftgmac100[i]),
+                                       true, NULL)) {
+            break; /* No configs left; stop asking */
         }
     }
 
-- 
2.43.0

