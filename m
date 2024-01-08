Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4599ejs;
        Mon, 8 Jan 2024 12:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUzHFLtK44ZB/+sAmvyTRLBb7xjKuLNbqegrrEoWpwIS9i19HYkpD1jQejUgrdtxKYmgTD
X-Received: by 2002:ac8:4512:0:b0:429:8cf5:28dc with SMTP id q18-20020ac84512000000b004298cf528dcmr5389052qtn.3.1704747136580;
        Mon, 08 Jan 2024 12:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747136; cv=none;
        d=google.com; s=arc-20160816;
        b=BLOuPy+DvupkQnkdO9Dtwcq2l8tyzM0P1FIISlLguCQEbolwPm6NFRg8zoXpMunxUb
         tLYU4DPQaE1Xrtlhh3tKdm9s1FUpilITk6+SL8ekJEm0R3MJpzzc9D2UodgMhnuUQrGz
         UIyVY3hyuDT+y3Jv4UfcpY9LOwKB8/Q42nHO5a2C9Xc80PAHI1Kj9gGB5YrXLfou8jbC
         j/5IJewAd/M+I97f7oZyKpg0HP9qv5KSGhBlDfYyldv5/NzZq5fvwf5F/hr6ikFWESoh
         hqrnN8CW7qQ5aYL0UNTzDnhJzfTXTKj1IeIsUY4MLj7tTL8TTxTx8wrAveTUBtER05ye
         sx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=YuV1U9QqJn6O+NsoibaCqXzAKb9rkiw1btsa5muc1z8=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=usBXefF0RNqrwghArofU6BZhAKYAs8CoY5MyU623zZe4yeXqnWdqzOwkvux+p8HCGZ
         2FQEysRwnI+rz3mEF4sHbMv3F+i8EZ2WI5tbMTDZ7ERniE7R3NC0iI7996o+ygOZfMsj
         7WXWFhnTQikBdFHeW7a1yoPrL8kIJxoGcmWirlBUdGTsbDI2D452TAQgMmSApfoKXjED
         +w63xDhQnmj0vkVX3TvpePCOvI34LiDvLIFulP/sSO6bhNTPlAD7VktYRJedp1ybcCam
         3QuEM8KHgVJo/Ylp6WhlkC30ejRywR/syK0eA6KgzzspcjEyUTDrkeSH3dRcALCM1u7C
         Ch1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=B1IyKteH;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id 4-20020ac85904000000b0042991c9e3c9si551535qty.423.2024.01.08.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=B1IyKteH;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663903.1033875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaQ-00022g-F5; Mon, 08 Jan 2024 20:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663903.1033875; Mon, 08 Jan 2024 20:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaQ-000205-6O; Mon, 08 Jan 2024 20:51:06 +0000
Received: by outflank-mailman (input) for mailman id 663903;
 Mon, 08 Jan 2024 20:51:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaN-0000R5-RO
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:03 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a078b9f7-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:50:59 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYk-008RQ4-FK; Mon, 08 Jan 2024 20:49:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NGX-0l; Mon, 08 Jan 2024 20:49:23 +0000
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
X-Inumbo-ID: a078b9f7-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YuV1U9QqJn6O+NsoibaCqXzAKb9rkiw1btsa5muc1z8=; b=B1IyKteHJ3fp/36vduyMRbP8IR
	YKhL/Ygp6B7X6j63nRXIEjJ6tIJHQA5p+dXkv7+JXZNQmVaO3X/IAgKGMEgnD23LYEsbJeaKC16jZ
	Sl5cz7vnr9fQdbkcUJZkaxn8QxS/d/zNxaV8m19sOmSeAyNtjTSNpCbLr1XhhqKz3QhyBBf2No9SG
	/nIG3Y8ztAUMxRyDYrW8IJch2VWe4JBGppyBgsK1OM12GEn2DnGek6Zhp5etAmc2iFdQrxGX3cOsJ
	nn0cLBfc+ylsXBS7dNLnm+04s9niNuYlOWoTYdm8mLMr3Bu92phgV7xeMzesTW8Wibj4eN284q6Wo
	mYrnMPfw==;
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
Subject: [PATCH v3 35/46] hw/mips/mipssim: use qemu_create_nic_device()
Date: Mon,  8 Jan 2024 20:27:04 +0000
Message-ID: <20240108204909.564514-36-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: YiTTPV2h/7d9

From: David Woodhouse <dwmw@amazon.co.uk>

The MIPS SIM platform instantiates its NIC only if a corresponding
configuration exists for it. Use qemu_create_nic_device() function for
that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/mipssim.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 01e323904d..16af31648e 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -118,13 +118,15 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-static void mipsnet_init(int base, qemu_irq irq, NICInfo *nd)
+static void mipsnet_init(int base, qemu_irq irq)
 {
     DeviceState *dev;
     SysBusDevice *s;
 
-    dev = qdev_new("mipsnet");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("mipsnet", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -225,9 +227,8 @@ mips_mipssim_init(MachineState *machine)
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
     }
 
-    if (nd_table[0].used)
-        /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
-        mipsnet_init(0x4200, env->irq[2], &nd_table[0]);
+    /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
+    mipsnet_init(0x4200, env->irq[2]);
 }
 
 static void mips_mipssim_machine_init(MachineClass *mc)
-- 
2.41.0

