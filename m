Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3004493eja;
        Mon, 6 Nov 2023 11:56:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESytxRz3czrlZufXywCTrKYiETSS855MT7W6fP0GUf4ravUZRNi+EyN3zNK76w0gThrs6J
X-Received: by 2002:a05:690c:2b0a:b0:5a7:d7dc:6328 with SMTP id em10-20020a05690c2b0a00b005a7d7dc6328mr17492228ywb.4.1699300596194;
        Mon, 06 Nov 2023 11:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300596; cv=none;
        d=google.com; s=arc-20160816;
        b=rI+v1DEwzIwXXVbwwttSJDzByQAHoQyeLON3r9hPX17TKeYzeaUyQGfV6JVuYcn94E
         25VPuTClZDQswgECNYZsh51Eib1v7za4hIY7PPHpcOcDUcd4SKDQPjl9MlVWxiXnt/Gt
         t3S3WxaElzx7LmszwRcdAjI2IJVq77Z9UzDK13w9DxjN9Kye3LCCZIlJCmr00pNrmHa2
         NTB6RupwslFgTrM+HO966vcQsSbMfnH2j1985G5sCM8Hmhgpkv55eKnvG9HT7pIJ0YC9
         97TN62SQvEajCr4bzl22HPJGE4S122PRldU2EirnOpl1370wTK4VQ80OpnzFPn1eUtwV
         jEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=GlXzCO3XdZ21RHsZxfP3RgbC823eeizUvksRPyKhf1o=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=tHudaUE/r8ofmPMf1CTNqpyc2nUH3qmXN7uPMpy7Rc0HoJZY42+TeMInhMamHcwqT5
         moDyl+wRlDS0CONWC0Pv/07a1ocA8Ti8CwTqlEtj6h0+aatsrEYzS+jpUnMTJQ2qdH4x
         5WGhpoPf252nKVsmT36oXdA/2TnScn6SoA1HGMNOhcx5xw22UCJETAJwfqj+A1wGK+ub
         JrKX0bsROQ/bL/f37hC19YfPrRiMswaQoT9AIwbn+/mo/qdQXZ22tRy9PadvJbiLYmHo
         PndywXuO3820ArMC00Tgsh8f7fE98n69Wzr8+OxIaQTisb5cnTU+JxIXPYFvBrPiuK8b
         atiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=RAUGPMsu;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id u2-20020a0cfe42000000b0065af57857cbsi6132770qvs.213.2023.11.06.11.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:56:36 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=RAUGPMsu;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628288.979594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hE-0002Uw-RY; Mon, 06 Nov 2023 19:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628288.979594; Mon, 06 Nov 2023 19:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05hE-0002T4-Hh; Mon, 06 Nov 2023 19:55:40 +0000
Received: by outflank-mailman (input) for mailman id 628288;
 Mon, 06 Nov 2023 19:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hC-00024f-MO
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:38 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7400c4db-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:36 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fb-00AkFh-2f; Mon, 06 Nov 2023 19:54:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fa-001GNT-1j; Mon, 06 Nov 2023 19:53:58 +0000
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
X-Inumbo-ID: 7400c4db-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GlXzCO3XdZ21RHsZxfP3RgbC823eeizUvksRPyKhf1o=; b=RAUGPMsu100KfZb039B1zNPPkr
	cnY3LL3SvbpR9CyekIYZvvCjkmeb6oCjI1mGH3a11Yj47QP6Nc7dY6lddHZeoLur9u37Ym3tqo4HL
	H+xpOMm1Z2rVr76YsT5Q2WEWSlnT5urIIFGrvZnrIGayTZeot4bBeLNJphF+5Ke2+mH2hVlApSOpw
	k97BXrAIzeO23Apx4Kcfdhouw0PP8Dc+tEKdMtYpHJ8ZN7MOxHqVb/BkDPpS0CIaLhEcT2rC/jPJF
	agqYepClQ/BkaconP80L6s0IEHAtzlwfCRodn1TqzSfpq5bFVMq0MlvqdRbXt2R04i2ThcRcHFwmX
	LYXKOxLA==;
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
Subject: [PATCH for-8.3 v2 14/46] hw/mips/loongson3_virt: use pci_init_nic_devices()
Date: Mon,  6 Nov 2023 19:49:19 +0000
Message-ID: <20231106195352.301038-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: vVNkhNX8uigB

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/loongson3_virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index 33eae01eca..caedde2df0 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -451,9 +451,7 @@ static inline void loongson3_virt_devices_init(MachineState *machine,
         usb_create_simple(usb_bus_find(-1), "usb-tablet");
     }
 
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 }
 
 static void mips_loongson3_virt_init(MachineState *machine)
-- 
2.41.0

