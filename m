Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp864959ejb;
        Sun, 22 Oct 2023 08:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/kBkrrT8SeQE/XO9YjkFpc6QTwpePP4GQgCuzTShGfy8LcIsFs7taPYrG+7VPgAfMijF8
X-Received: by 2002:a0d:d4d6:0:b0:5a7:da29:f6b7 with SMTP id w205-20020a0dd4d6000000b005a7da29f6b7mr6386129ywd.0.1697990101195;
        Sun, 22 Oct 2023 08:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990101; cv=none;
        d=google.com; s=arc-20160816;
        b=qxgs470GfhUjrQdTrEdzHhfDtcMU9WZZMMpQyW18bFEfDExDRpxD7UtJyMj5v31QVw
         jS2p5J/mGS1l2F9MFFhsHD74laUIqPOIutzg/iHntkQlA9+++y3g496CmKGTufcsAwMd
         SnHoYBuBdCxmAVxk5Iw07eyT1upUXpSYQnYqbRIRjVUjhZhJ7nSM7buM/VFpeDThiuK7
         6Fr0/CGnMi2RPh3RYcBdB+TfXvbhYXTq9POKwSIeFqi63FFETPc17QKqZGVe7r4Kwf9a
         yka6suotQtI6aB37zUAPJXWdQbrxVXwKeV+pvjDljEWVUbINKra7zUOZ7jyY1P9SvIGO
         wBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=KdVChXDyi4Lsk1+zy1mbsIif8KhkEel9PKnAsGBznGU=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=QDJKybNsTau3wLdaBZZUdVERvkc/mc+7IE4BD5HnmB35gMFPjZ5qd79mtocj9V4Ian
         RfyZxhGxwwH4BhoO4+gCUZ7iNHlCsUdVsfYoOF+yrYUGFxX6GG97MusS7P5jTMzpAHQX
         UPI6rRcGgWDDnDmex5GnveZxPJgcqWZr3nKqVoWbbX/pCauLYY0QhspJvCibZvWOMaA1
         /Rymfa6ag+7HG+ZVICelohhphjtvDSGN+dffNNuLn4WCDBM/WOsmvu2MPVQJE4bK88cA
         A2POLXWz8V+JEWdfl8AYDQnJYed3DORIkyAQtmiLzd6dUKo4PrA0oSHEBJn0Xtuc38nM
         ICtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=vNnsctZ7;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id s5-20020a818205000000b0059575fba61csi4509637ywf.446.2023.10.22.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 08:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=vNnsctZ7;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.620662.966244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualv-0007Bw-R3; Sun, 22 Oct 2023 15:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620662.966244; Sun, 22 Oct 2023 15:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qualv-0007Bp-N7; Sun, 22 Oct 2023 15:53:47 +0000
Received: by outflank-mailman (input) for mailman id 620662;
 Sun, 22 Oct 2023 15:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZR7=GE=casper.srs.infradead.org=BATV+88d8721f4af1339c2fab+7364+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qualt-0006wY-Oj
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 15:53:45 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cb7e936-70f3-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 17:53:43 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1quakK-008TGo-RQ; Sun, 22 Oct 2023 15:52:08 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakK-001qah-0a; Sun, 22 Oct 2023 16:52:08 +0100
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
X-Inumbo-ID: 2cb7e936-70f3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KdVChXDyi4Lsk1+zy1mbsIif8KhkEel9PKnAsGBznGU=; b=vNnsctZ71nBlYPw/cwYJqzmKQl
	+4LnT94jVeyGtjJWUdI2onxOdZCqkhNeaRi+pRy6cUhbFLb0u2J+I5IpJsZPGAA8W1Vq5k5DhT7Cm
	U8/waeBSWRqUPZIkY4LVSzsIhFxstb48frzkyqqrseGjUSCwPwNNhW7ukPjq1qNgRUfKoHFnj37zN
	hitcYfFQvtcthqdZkIPa5oVCItjRv9+BhnIQ5L3xgykuS10AwVNEOMQgPSm/g+YJxYB6ZZ4dAXR7S
	Kzf5l34VwI/VdqTKImNsJOPSEIh6UmoX0cc+mBEX2LKmJvzUsOeM398BfMIW+CPJfqp/ujh2wTuUY
	fm5z52MQ==;
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
Subject: [PATCH 35/45] hw/mips: use qemu_create_nic_device()
Date: Sun, 22 Oct 2023 16:51:50 +0100
Message-Id: <20231022155200.436340-36-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: FFm8KyJjEQ7r

From: David Woodhouse <dwmw@amazon.co.uk>

The Jazz and MIPS SIM platforms both instantiate their NIC only if a
corresponding configuration exists for it. Convert them to use the
qemu_create_nic_device() function for that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/mips/jazz.c    | 16 ++++++----------
 hw/mips/mipssim.c | 13 +++++++------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index c32d2b0b0a..b0f4aa2763 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -114,7 +114,7 @@ static const MemoryRegionOps dma_dummy_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void mips_jazz_init_net(NICInfo *nd, IOMMUMemoryRegion *rc4030_dma_mr,
+static void mips_jazz_init_net(IOMMUMemoryRegion *rc4030_dma_mr,
                                DeviceState *rc4030, MemoryRegion *dp8393x_prom)
 {
     DeviceState *dev;
@@ -122,10 +122,11 @@ static void mips_jazz_init_net(NICInfo *nd, IOMMUMemoryRegion *rc4030_dma_mr,
     int checksum, i;
     uint8_t *prom;
 
-    qemu_check_nic_model(nd, "dp83932");
+    dev = qemu_create_nic_device("dp8393x", true, "dp82932");
+    if (!dev) {
+        return;
+    }
 
-    dev = qdev_new("dp8393x");
-    qdev_set_nic_properties(dev, nd);
     qdev_prop_set_uint8(dev, "it_shift", 2);
     qdev_prop_set_bit(dev, "big_endian", TARGET_BIG_ENDIAN);
     object_property_set_link(OBJECT(dev), "dma_mr",
@@ -314,12 +315,7 @@ static void mips_jazz_init(MachineState *machine,
     }
 
     /* Network controller */
-    if (nb_nics == 1) {
-        mips_jazz_init_net(&nd_table[0], rc4030_dma_mr, rc4030, dp8393x_prom);
-    } else if (nb_nics > 1) {
-        error_report("This machine only supports one NIC");
-        exit(1);
-    }
+    mips_jazz_init_net(rc4030_dma_mr, rc4030, dp8393x_prom);
 
     /* SCSI adapter */
     dev = qdev_new(TYPE_SYSBUS_ESP);
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 2f951f7fc6..072864f539 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -111,13 +111,15 @@ static void main_cpu_reset(void *opaque)
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
@@ -218,9 +220,8 @@ mips_mipssim_init(MachineState *machine)
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
2.40.1

