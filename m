Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1024057ejc;
        Fri, 26 Jan 2024 09:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD46yectl8Uqq11390FcBiJ72C4CbM0JGQZtxxQG8nuTuU2O9NXwuFAd15TnOEFGw1iM+M
X-Received: by 2002:a05:6902:563:b0:dbe:aab3:4374 with SMTP id a3-20020a056902056300b00dbeaab34374mr359056ybt.2.1706290473531;
        Fri, 26 Jan 2024 09:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290473; cv=none;
        d=google.com; s=arc-20160816;
        b=x18rKEnz1xfM1zLJ+s6zovdrhsOMo7e3Xv+c7KdB81uOplTEpmlSPvXUSw/TnuF97m
         ezT2Q97JXrD0dYLIRTKJ+BvwrLVojyKGR8EDMYA4v8rdsUjU53/xjFnQqUuS0KX7pT3I
         /ioZIl4AakMrVWtyqG00DLQh7WSQ6zsiYo9iaasocPczftwXiYJIItBMVBhxDpR8Bz5K
         SdnTuT8PzMxBqb0t8LgOVDA/XMlQ803v7/wnsmyvTR/o2eMKl7RxZxr8XpRBXKYvZd9J
         zlONbOYB8VFLCfoNlJ9aU7DTCLDzMtDv0t0JA64KxtDGD8XzXdtyPftqoo2dFduAoQL5
         8q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=WRBuYa2rIuMOyCdfUaeq0aJt9tQyMaQzZk9uum9u4Yo=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=iBEqcjjs77Z+Zb85TemH+lcGcnnMwoWLkaQufM8zS/2ozJJtBs3nlFM71fitm7a8b1
         ea9qKcq0xowpsT2sW7dmOZDMvEnURMKIKNAPZA3wZZQqU2rScCZz+HJY6msMQJ59wO2p
         B2zE55sAkueXw+g5H4bAPDPfwfse6xJHOimhcEIJhbd7Yq1iyg2zQNCCbfpSuwX/jNcM
         X1KyYwnaRucRx+gWUvbidU/rCCd0VWoMfPRO6IhTI8x9Brb46LA1DdDXJFiZMIHprigI
         gqqvK9+vErwSWSxlc733SG1eixYVkdicIisdi1muQSTezlu2u+fZ61CCiGyLoOVDAdVo
         MOgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=pbgctkJk;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id t36-20020a25f624000000b00dc2529d2000si1031787ybd.588.2024.01.26.09.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=pbgctkJk;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.672271.1046180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4x-00006Q-Nu; Fri, 26 Jan 2024 17:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672271.1046180; Fri, 26 Jan 2024 17:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQ4w-0008TD-UT; Fri, 26 Jan 2024 17:33:22 +0000
Received: by outflank-mailman (input) for mailman id 672271;
 Fri, 26 Jan 2024 17:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ4r-0004Zo-P2
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:17 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd31a7b1-bc70-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:16 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ49-0000000EKV4-2g9X; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ4A-00000001eo0-1h7n;
 Fri, 26 Jan 2024 17:32:34 +0000
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
X-Inumbo-ID: fd31a7b1-bc70-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WRBuYa2rIuMOyCdfUaeq0aJt9tQyMaQzZk9uum9u4Yo=; b=pbgctkJkh9eaXYKWWUsW2nOnb5
	l3/8L/atRueV3pL+D+HzG7RHpQ+feZYCUdhPXZkdz2PfjHkDUCs9WxKoRw9ZI0wWNtnrluWAMaMoD
	OJ+N457sv2U7r8YHNyD0xMQ10uyPuk8lzBA04v7nt8pOF9VZIx6qjrTXKgkMpb0OedmfZ94Jd5O7h
	LYLz0sU8o9SGAzI6dm1AVi6h3b60IiNuLpJcHAGvvR8fOturCflELq4U38XAW3XovsNMiuh9jZ8L8
	b/pu5DMAf4ZGcH95ztIBGI2cN+TD9Q+Jm6vW0/1944EDl9T/wUt4fPE1kFkxTLnSyda/hvWlXeU0p
	z8rNRsyA==;
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
Subject: [PATCH v4 39/47] hw/openrisc/openrisc_sim: use qemu_create_nic_device()
Date: Fri, 26 Jan 2024 17:25:16 +0000
Message-ID: <20240126173228.394202-40-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: toDydU0ERs5z

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/openrisc/openrisc_sim.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 35da123aef..bffd6f721f 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -170,7 +170,7 @@ static void openrisc_create_fdt(Or1ksimState *state,
 
 static void openrisc_sim_net_init(Or1ksimState *state, hwaddr base, hwaddr size,
                                   int num_cpus, OpenRISCCPU *cpus[],
-                                  int irq_pin, NICInfo *nd)
+                                  int irq_pin)
 {
     void *fdt = state->fdt;
     DeviceState *dev;
@@ -178,8 +178,10 @@ static void openrisc_sim_net_init(Or1ksimState *state, hwaddr base, hwaddr size,
     char *nodename;
     int i;
 
-    dev = qdev_new("open_eth");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("open_eth", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -313,12 +315,10 @@ static void openrisc_sim_init(MachineState *machine)
     openrisc_create_fdt(state, or1ksim_memmap, smp_cpus, machine->ram_size,
                         machine->kernel_cmdline);
 
-    if (nd_table[0].used) {
-        openrisc_sim_net_init(state, or1ksim_memmap[OR1KSIM_ETHOC].base,
-                              or1ksim_memmap[OR1KSIM_ETHOC].size,
-                              smp_cpus, cpus,
-                              OR1KSIM_ETHOC_IRQ, nd_table);
-    }
+    openrisc_sim_net_init(state, or1ksim_memmap[OR1KSIM_ETHOC].base,
+                          or1ksim_memmap[OR1KSIM_ETHOC].size,
+                          smp_cpus, cpus,
+                          OR1KSIM_ETHOC_IRQ);
 
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
-- 
2.43.0

