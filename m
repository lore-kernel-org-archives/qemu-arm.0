Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4742ejs;
        Mon, 8 Jan 2024 12:52:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEuwQP9JeIMBMl11b7+lY66wKIwnUBLATSZ64xwtfuL/otNXBHQipB53EetVATmOGrHIbF
X-Received: by 2002:a05:622a:a095:b0:429:9f32:df68 with SMTP id jv21-20020a05622aa09500b004299f32df68mr1311721qtb.4.1704747155415;
        Mon, 08 Jan 2024 12:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747155; cv=none;
        d=google.com; s=arc-20160816;
        b=wykNq+4IzJzQofPI1sYE7LQhA1qUeaD8VrHMOpGV62nVzl32xTWUICndnJGDAopcCP
         LU0dEUreS+YGaYsEnQa6KEl0GQCeQ3pjNLkVwCuHqoUpEaxP0b9Cg7895NcKuy/uBQVA
         J01Ptq3j1p9DNmyV+4w1W3q+0Cv+TxJExyggFVnV0a6H+Gu151t4+9V+KsKYHrn6WeyK
         nXNMApae7g+F9IZJxcxlR7AxilmfLl0/oA3kmamw97kyGxwdJObF6CoCFCcn1dI47i1r
         LDvD0PUhw1vnZCh54oat8JePrSJSim2KMm1G0sthqaDR6b8V30K4CxVu5eos1mMyrfTY
         4Rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=gAKwLxJ9GrgFAgVd8NfOlltKClYjwdlcDlfOHDbpTRo=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=ORR4GJEjVk5n7rVXC8aRReCuDNH42ZQEtjuS24y+x5y5Q1pmwl4bqKHUSeRqTVk2Mw
         K2SmHZ1ZhTPJmiXhSOZd8TNzwgfmLRL2rG/k6auTDbgflu8E514ypu5lUIjDukd8zzlE
         w/NsoS7RlM+wMXv1cEA8DKG1yIPQLChZv2on7eVI1Vct6Nbc7r6eUVM0rsKTx7o4c6RE
         ZZ6o+FBJB0A9GoNznls/ZOwnYW2SDj8baL6WvXGl2ry+tmbh5G0f7c7Ydq3TyYYZ30C1
         0jFaPvMfU5vel+9xSmx1jqGdT1kLPzoyNMRRPwxVfmxaU7hVjD+KM9yWmzYJEWNGNfSP
         S+0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=m9RL72ho;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id ff26-20020a05622a4d9a00b00425c3b740b8si589694qtb.766.2024.01.08.12.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=m9RL72ho;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663913.1033961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaZ-0004O2-Ui; Mon, 08 Jan 2024 20:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663913.1033961; Mon, 08 Jan 2024 20:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaZ-0004I5-5y; Mon, 08 Jan 2024 20:51:15 +0000
Received: by outflank-mailman (input) for mailman id 663913;
 Mon, 08 Jan 2024 20:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaU-0000R6-9t
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:10 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4d55755-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:51:06 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYk-008RPx-4k; Mon, 08 Jan 2024 20:49:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYk-002NFp-28; Mon, 08 Jan 2024 20:49:22 +0000
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
X-Inumbo-ID: a4d55755-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gAKwLxJ9GrgFAgVd8NfOlltKClYjwdlcDlfOHDbpTRo=; b=m9RL72hoic6j71eYQXCMpigCQe
	kc7kcinrlRJQT0Dra5IIza7HBIzUpfvP5+FJXezICTEkDc6nRNpoxfqjpKKsZVnzqw1cURpeRGXx+
	V6y/uGAb1uqTlEvsdxiw913WMZpVWKi1lJF/d98AFA9UytmAYsZSF71U5gtWVtT0BdwqCH8eM2ocW
	Pqh3uqD98gkzuDPYFCSM2yaVbwuk+7KGIn0tWWOErXzbgRblNoO2egcYiWSXe5JWB9k7sSjPHzsk9
	TBJVdEVZ5St8UB4risV+pAvMeTKX4hufCKmrZBrjH8zqus4Fwf68EclEkgpVrxIJHhDSQ9MO7C5ob
	5Ffqt/iA==;
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
Subject: [PATCH v3 27/46] hw/arm/highbank: use qemu_create_nic_device()
Date: Mon,  8 Jan 2024 20:26:56 +0000
Message-ID: <20240108204909.564514-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: JIexj5CBCQbO

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/arm/highbank.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c21e18d08f..6a0e20e58d 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -296,19 +296,17 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
 
     sysbus_create_simple(TYPE_SYSBUS_AHCI, 0xffe08000, pic[83]);
 
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], "xgmac");
-        dev = qdev_new("xgmac");
-        qdev_set_nic_properties(dev, &nd_table[0]);
+    dev = qemu_create_nic_device("xgmac", true, NULL);
+    if (dev) {
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xfff50000);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[77]);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, pic[78]);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, pic[79]);
+    }
 
-        qemu_check_nic_model(&nd_table[1], "xgmac");
-        dev = qdev_new("xgmac");
-        qdev_set_nic_properties(dev, &nd_table[1]);
+    dev = qemu_create_nic_device("xgmac", true, NULL);
+    if (dev) {
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xfff51000);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[80]);
-- 
2.41.0

