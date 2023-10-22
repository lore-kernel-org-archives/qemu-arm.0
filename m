Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865121ejb;
        Sun, 22 Oct 2023 08:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOrtYl+lPK7O788Px1OH8pfT2iEKLbEa1RmmrOCEVCapBYbdcXvhVA381whorQRlZLklva
X-Received: by 2002:a81:918f:0:b0:5a7:da7e:effa with SMTP id i137-20020a81918f000000b005a7da7eeffamr5515310ywg.5.1697990124456;
        Sun, 22 Oct 2023 08:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990124; cv=none;
        d=google.com; s=arc-20160816;
        b=vEg9ZuFaY7GLoMTnBNcNTcL2Mhfv5tx1xkiFVOYAsbJRHzUXU+Xc8ya4niiy9bje3F
         uaxik8eh0bM1+qBphowfGjnHIHa3W8iAMMDSjf5fBTQ4WB64+kchZOHPilo4Eak93N/I
         FZaKrwC4+VvnfK/F9CStZ150i8DSKhHrR+3CiZPgDkFMTiBcR7QMaPJ32jRZzgjVJN2U
         Ltpht3U/tUk3G35QCJ+7Cm4ymQKBkj5/VtxjsYpZ4gJ7mSj1zHGs/Cn/c/qXERCzIzsG
         wfrFAcBZRht6+aaIOeTMY1Obiv4jms61XsSzZSkxZ9o0EscxITxLW25AFwY8MtKUGT2f
         8Iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=JzTcQ0rBwuNh/dC2n4aXnWP2v8pqHl5GWh4fXA8+m4Y=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=gS3UOot5nS6Y96rCTDHJ17LmursysAdquuoWeAPiuH24gOD4vA6w21R3Y+WkivhX/8
         9Eu9RihlKB8fLkE7av0bxDX0ybSOdRaFQri7bHrj4JirsG0hgcv+58NYfc4oXWxf5don
         KqSzEwOIZBg/vrB8pzWfF+zNvNxZj+jK7PH2p2pyVRykFIo9gQZEgjVnkUs3wxGBzUw6
         OSOK847s/GbmbcASMaXLWb6LxdxBF4ajngrgXjg2bAjz8k3rwZ90EROxcjIUqRicABgs
         Snj9Tf2ECE5Hw7OhDTcmCc/pj4gLnb48y9FuYvTjTjeokFKrHTxNBanGZbVyQ9IEMNk2
         Q8dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=TBJPbKw8;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id m20-20020a81d254000000b0059f64e6312asi4980333ywl.198.2023.10.22.08.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 08:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=TBJPbKw8;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.620678.966383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quam9-0002Pj-V3; Sun, 22 Oct 2023 15:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620678.966383; Sun, 22 Oct 2023 15:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quam8-0002IX-Uo; Sun, 22 Oct 2023 15:54:00 +0000
Received: by outflank-mailman (input) for mailman id 620678;
 Sun, 22 Oct 2023 15:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1quam4-0007Cq-BI
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:56 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3346e2bd-70f3-11ee-9b0e-b553b5be7939;
 Sun, 22 Oct 2023 17:53:53 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakK-008TGi-7C; Sun, 22 Oct 2023 15:52:08 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakJ-001qaS-2m; Sun, 22 Oct 2023 16:52:07 +0100
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
X-Inumbo-ID: 3346e2bd-70f3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JzTcQ0rBwuNh/dC2n4aXnWP2v8pqHl5GWh4fXA8+m4Y=; b=TBJPbKw8zZXGvkgfoDHCY7jqCr
	I8o1kjziqiYAA0ymr7W5GAG1c+Pt4k1vwBZVjwCXVYUv+JONH/C/Z7vExYq1DYf8sB3trXGTTUtcT
	nOFg82E4VXm/eToIN21YPh6E71idDBLA/EBIdurcoKVz6zUvhQRF+QAqSXucLLkJNRm+UsjJv99pC
	c/J2Wg25NMOgeq8NkfsqcjNrNtuUlDs2mT7HDkVOFL0YmFq0XzWlc6P5yIYj//0ClsZ0AEFRlLJJh
	QlonA5UaMj44wTj7SizE30BqyHPDFfrpohf6ZDSmcLzwvdgKWHWEHkc1QBy9COwESNMfcOVjXkqPT
	muHaZ0bg==;
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
Subject: [PATCH 32/45] hw/m68k/mcf5208: use qemu_create_nic_device()
Date: Sun, 22 Oct 2023 16:51:47 +0100
Message-Id: <20231022155200.436340-33-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: SFxmqu+xaMLC

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/m68k/mcf5208.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index be1033f84f..cf23b7dc6e 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -206,16 +206,16 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     }
 }
 
-static void mcf_fec_init(MemoryRegion *sysmem, NICInfo *nd, hwaddr base,
-                         qemu_irq *irqs)
+static void mcf_fec_init(MemoryRegion *sysmem, hwaddr base, qemu_irq *irqs)
 {
     DeviceState *dev;
     SysBusDevice *s;
     int i;
 
-    qemu_check_nic_model(nd, TYPE_MCF_FEC_NET);
-    dev = qdev_new(TYPE_MCF_FEC_NET);
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device(TYPE_MCF_FEC_NET, true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -267,17 +267,9 @@ static void mcf5208evb_init(MachineState *machine)
 
     mcf5208_sys_init(address_space_mem, pic);
 
-    if (nb_nics > 1) {
-        error_report("Too many NICs");
-        exit(1);
-    }
-    if (nd_table[0].used) {
-        mcf_fec_init(address_space_mem, &nd_table[0],
-                     0xfc030000, pic + 36);
-    }
+    mcf_fec_init(address_space_mem, 0xfc030000, pic + 36);
 
     g_free(pic);
-
     /*  0xfc000000 SCM.  */
     /*  0xfc004000 XBS.  */
     /*  0xfc008000 FlexBus CS.  */
-- 
2.40.1

