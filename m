Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4748ejs;
        Mon, 8 Jan 2024 12:52:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlJrLxWFacqHxEwpHMBe9aUygynqfgVDI4xFce2eanEO2ItxaHrpH1Q0ByLm8RiF0OkIsO
X-Received: by 2002:a05:622a:1b19:b0:429:8d3f:b036 with SMTP id bb25-20020a05622a1b1900b004298d3fb036mr6487040qtb.4.1704747156384;
        Mon, 08 Jan 2024 12:52:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747156; cv=none;
        d=google.com; s=arc-20160816;
        b=OP2b1FJ2rXs/ynSZ69F9gOlaNx9MbhjS/CfPKGsETrg8KTJmzY8T7i/dVKeCPDkPyd
         3eBJgBITEyuqsXME/1CeBXU7CE+NXNR5KhkQu2HoBjNt/i2nRtPWKKKfEq2w0gKR/DYK
         W1al9qlWXZ/cV6Fk5Kde4pkhYpntb3/JtpwKZz9mbcfVuOPfDTBo+9rDVFVSesoZL8C1
         /UF48PZTxnvx5AGNg9I36X7zfK5sm6Q3iGVbRTUMoDPyyH6E40fYvC6VMecasthrgTlS
         i3r5yKm8oR8+/WS4V2x3GrYy0p5UP9bwqaIa3D4x961GBMU8hs9LGbNgfVXHXhUcUnZw
         6Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=ZkSNmy83S4DOqkgHUNjcsUnKDxjqNwsV356V+7t17VI=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=jM6N4sv0LlCSL+UbpeSPfT1jBc6lyQkMF7xxnWx0PGAc1DtZnqg9mMMPCpsrtiWv/E
         SkVN+pIi+Vv5NB16v/3+HV3IKw7Ell0Eg/V8UB7ALSf9gwOfWxh7QSP+pDjhhAj+8ytE
         isFZLVl1SJGlj81GgZmRQs0YVfvbCh1mndnYMPtCngwxDIvABCjkxWH2TRbmM9MjVyxC
         vfhF8nwa49GfkhT98VT0MtqrrFle6aCpDrbV8iHYumqtHihouKPhFAqn69bXlmarN0MA
         +037lyzJPUG9Npd20/57RWVfD0qeQDT1Wk8vG01FDoYP7NgZMed0c9xu8BAFKznjXT12
         HwYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=EQc+yjRl;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id o13-20020ac87c4d000000b00429973b0dc8si566591qtv.108.2024.01.08.12.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:36 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=EQc+yjRl;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663911.1033940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaX-0003mC-JC; Mon, 08 Jan 2024 20:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663911.1033940; Mon, 08 Jan 2024 20:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaW-0003hX-PH; Mon, 08 Jan 2024 20:51:12 +0000
Received: by outflank-mailman (input) for mailman id 663911;
 Mon, 08 Jan 2024 20:51:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrlO=IS=casper.srs.infradead.org=BATV+41a72dc6539c0dfbbc31+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaS-0000R5-Rq
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:08 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4321408-ae67-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 21:51:05 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1rMwYk-008RQ7-PV; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NGr-1c; Mon, 08 Jan 2024 20:49:23 +0000
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
X-Inumbo-ID: a4321408-ae67-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZkSNmy83S4DOqkgHUNjcsUnKDxjqNwsV356V+7t17VI=; b=EQc+yjRlYKASMGRQ5TGtJYtw74
	sF8ySymUAdfsOgT4x8BrVFBLhebRSylHntgqIY++FPzBttXXgr/16ja7fa2J1+ehxRT60nkpIJ6O2
	xdt6IBFKc6PoA3ULA/douiQH9RzvQ2xt9Wqg2tyJbaDQBf1BW2CB3ctV16gcUYApEAKkwdCHnPPyN
	iQ5mxU5swxpdModrJuuKK28dz5xRvKVKpiNRdDaPMFGioGC7eFsMNDKDyTOmQENQyzl80fz01z2zn
	Rl+kUJ85iSOo9TQly6JKlt7Nw8vnlz4wR7uiOnNFppoUpeXr7e8yTOB9xXJR8ax9b+bRWyyATW+sE
	MnMHK9vA==;
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
Subject: [PATCH v3 39/46] hw/riscv: use qemu_configure_nic_device()
Date: Mon,  8 Jan 2024 20:27:08 +0000
Message-ID: <20240108204909.564514-40-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: E/CQSk2BhvMd

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/riscv/microchip_pfsoc.c | 14 ++------------
 hw/riscv/sifive_u.c        |  7 +------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b775aa8946..7725dfbde5 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -202,7 +202,6 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *envm_data = g_new(MemoryRegion, 1);
     MemoryRegion *qspi_xip_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    NICInfo *nd;
     int i;
 
     sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
@@ -411,17 +410,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         memmap[MICROCHIP_PFSOC_USB].size);
 
     /* GEMs */
-
-    nd = &nd_table[0];
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(DEVICE(&s->gem0), nd);
-    }
-    nd = &nd_table[1];
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(DEVICE(&s->gem1), nd);
-    }
+    qemu_configure_nic_device(DEVICE(&s->gem0), true, NULL);
+    qemu_configure_nic_device(DEVICE(&s->gem1), true, NULL);
 
     object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
     object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ec76dce6c9..5207ec1fa5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -789,7 +789,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
     int i, j;
-    NICInfo *nd = &nd_table[0];
 
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
@@ -893,11 +892,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_DEV_OTP].base);
 
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd->used) {
-        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
-        qdev_set_nic_properties(DEVICE(&s->gem), nd);
-    }
+    qemu_configure_nic_device(DEVICE(&s->gem), true, NULL);
     object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {
-- 
2.41.0

