Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004569eja;
        Mon, 6 Nov 2023 11:56:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9GVn+XiKavZ5jaDqCH1TL9AvMREAdSK6gTbj0SweINNSHkoq1pm/gX/7uzJGCgrdeRXf0
X-Received: by 2002:a05:620a:2711:b0:778:9b9f:ccbb with SMTP id b17-20020a05620a271100b007789b9fccbbmr32777615qkp.0.1699300606027;
        Mon, 06 Nov 2023 11:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300606; cv=none;
        d=google.com; s=arc-20160816;
        b=0zk0MBwterQfvhwrCWWLJdlrWaVge+3mjjzPN4SYaVsqC0ww29hmAUfD0ZyOo7tqEX
         mvv/mNB1iLlfrS1CBigpFDGOMq8ZjTOlwhtHwSDzFYQo6q/TYK1Z0SeI0es9oI6YqEeO
         wDmwoT/JEIpENmK4KpBGYimYcTJdjTQ+uZlQ0HxKLNeDckZ699KPfYYJhVTZRUxtBAfe
         jkO9JG+usrwO7AiSmtuTkvfBZAvNW+c6KO/cEIoKqJNCV/80BRiSxyMj7hUnsN5Hct+A
         pL08bFM2QDu86syKZapDUhOqneaHlH8BDqrjod140ZVjbm6IW/KzRjDX7fCvbqqdxQCo
         KltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=nQ3rktK8dEdIEwAMeeCC6bqdVVt9BSYkg4MRVTEfqOM=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=sRI0z7oKepWYKOxhYnH2h56gT0h5/tinBjPfEl4tvPTOlXVe27ToYDODbhm4Q7yW13
         NwHrl7hDdrGjWDBFR2Rgj0wJ68Ltv5mXN9W4Hs0nYV7jHPg/6oEaV5M4YY/nBpfqxsfn
         cLOVfL+gQOSP4sCZ+7oQ5iHQdbY5d+DlZTx/h1Dr2Bkr6cSItGPRTyHiIPdjVYJnzZnv
         gYhSl+Xn2x/gntBL6V2cuwK6/bVKXVNh2XlXc3pKhjgIHl41qEdcvCnbKsGO4pjWI1xq
         2SlKYh/siTxXOB5LFXo2pD4Wb1sdvYX0XpecigVKT2v22dvd/6DJKNzz5/9jwwNVkvsI
         wImw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=SlkY4tP2;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id f1-20020a05620a280100b007788fc003aasi6251832qkp.618.2023.11.06.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=SlkY4tP2;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628290.979612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hG-0002s1-H5; Mon, 06 Nov 2023 19:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628290.979612; Mon, 06 Nov 2023 19:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hF-0002qT-U2; Mon, 06 Nov 2023 19:55:41 +0000
Received: by outflank-mailman (input) for mailman id 628290;
 Mon, 06 Nov 2023 19:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hD-00024f-MW
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:39 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7419ae07-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:36 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fa-00AkFe-1t; Mon, 06 Nov 2023 19:53:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNG-0t; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 7419ae07-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nQ3rktK8dEdIEwAMeeCC6bqdVVt9BSYkg4MRVTEfqOM=; b=SlkY4tP2znbXS4OHj3RcvyUsSm
	tuzLgYByxSm10vbMtYpyBtc8ACf6FEKT8fPuxx5Pb0dCNYaSL3cYvM9If40duOtk7XbVSLE3yjIGt
	9ASf8Ehupryu5QVXH1ak2UGqTv3xZ4i2+Bl1Pn5vKVhMe3mG1hbH6zKXlYBBCc/rKqJZ7cHDIX57b
	b1Ey2YUdG5TNE5hWQDIAhh+x7XnaMBHNuGjsQPNoY2lgSCHi5ogIUlFrNHhlik79+xhmB9oDZBvKu
	XaK/MHdaHL9U1QktbGG1tz8vpQ7S+tUHNSXNctY/Boc7rJacSZAxXv8qBUQ+RqMjAW9vnAEn7D4ho
	RPVIRK3g==;
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
Subject: [PATCH for-8.3 v2 11/46] hw/loongarch: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:16 +0000
Message-ID: <20231106195352.301038-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: LX0Azo+yawul

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/loongarch/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 4b7dc67a2d..c48804ac38 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -504,9 +504,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     fdt_add_uart_node(lams);
 
     /* Network init */
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /*
      * There are some invalid guest memory access.
-- 
2.41.0

