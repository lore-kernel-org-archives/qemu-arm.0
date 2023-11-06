Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3003996eja;
        Mon, 6 Nov 2023 11:55:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEs/5O8ASXNla4xToSSCYdmm69QyUfMW4DLuO3Veiga9jS9rnQltjropxMRtlrPvVm9gVBL
X-Received: by 2002:a05:620a:6183:b0:777:73e8:e24d with SMTP id or3-20020a05620a618300b0077773e8e24dmr32054732qkn.21.1699300535975;
        Mon, 06 Nov 2023 11:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699300535; cv=none;
        d=google.com; s=arc-20160816;
        b=ZG7MPbXK9J8cThdxC8rVvcz6qQqWQaPoX3Z4U/w5Gse93EixXfk9nirPPrs4fe/FcQ
         6F9GlyEB7zwMSVutXSIv5HkXS1TXy9Vfx+O2bk6E+1FdulTSJgKj/JcqL6PafO+BpVL2
         7OZy/8uw8bY/D6qdorddS5L/Mi7fdyZCb5RzZkoIXZ8ZWzdB9ATwWhPHcE8pySq5veCu
         L68QNU2Cub1QUNmuJod6U+H1TNhTeUz2v4dTXAIsCKMbqwG4PQb5vxgDClicpeG5vgr+
         CF7b42uwQnKre+7V0s/zPjXBYcezRS26JlVY3UG0sOTOdkAHZmTyH/psOY3MV/F0PJaG
         6JFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6llESs8/oOse6Qm5wJ5lTY9fMB0QkZmfTge4Rjf6G8M=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=b1EUlZE3py1U+3JACR3HJ0XtmZNAEUlMQx1GGaWh2O+0ovtpiDY84Y46ePqN2GnZN4
         yoA2WdO4Is3yLseFedPTzugZD07dc77VF+cAjaezXccCWZ6/JHndreCb5O9rl3mKtW7a
         IpMygQz1wppiONboOw3GEFOcfSGor6SwxeEBRKDccrqrNT98RGFwpgc4DYNTf3+k4psq
         mQST1gzTjJ6twxCqA9274zVJdra5Yu0uL7Q997/127XAFrjF/oqIVvAmMv5vbxdM0wBR
         Lpra1CIW6hVB4ROGHLnKe6vWqxaNrQGo/Uy0oSzRIR0aSms0xMGsr6xlz/MDBGvZis1L
         qG7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=buYUSYgO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05620a255100b007783026be9esi6199862qko.621.2023.11.06.11.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 11:55:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=buYUSYgO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r05gB-0005mF-Jn; Mon, 06 Nov 2023 14:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05g3-0005aE-29; Mon, 06 Nov 2023 14:54:27 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1r05fx-00065i-RI; Mon, 06 Nov 2023 14:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6llESs8/oOse6Qm5wJ5lTY9fMB0QkZmfTge4Rjf6G8M=; b=buYUSYgObmiJkgEwvOBOxICL5m
 Bu6dMQKL5r8EhzkrGEb6+QQLWhg4/ivpdi4hYISAKXzzl84UBkMxM8nA9pLswCfwEoDVSPEJMtJPS
 EobPO3/gZvrfN7EDLA3nJRcnsc1B+SNMzoJ9gpDbQOgvvyxCdFzM821lKBfrfAv9Epn/H0ylfjXsX
 o1vuclcKrn33Xg2SnDEzyMrNKJghJcdDfgLR69P38aiPUYnxsOieXhd8i91CuR4hgZoSLvwd20pBa
 UJKSMbQ3YOL87CNsct14MZJgcgnyv4BHk+8Mbr8CZLSJajVwO26WGABsw3+99noLxbwxJqhY2MbC2
 +d5TIpng==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fe-00AkGF-0J; Mon, 06 Nov 2023 19:54:03 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fd-001GPd-0F; Mon, 06 Nov 2023 19:54:01 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH for-8.3 v2 41/46] hw/sparc/sun4m: use qemu_find_nic_info()
Date: Mon,  6 Nov 2023 19:49:46 +0000
Message-ID: <20231106195352.301038-42-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eQlDUR65MOk0

From: David Woodhouse <dwmw@amazon.co.uk>

Obtain the MAC address from the NIC configuration if there is one, or
generate one explicitly so that it can be placed in the PROM.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/sparc/sun4m.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 17bf5f2879..75b0c0ff7a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -299,13 +299,15 @@ static void *iommu_init(hwaddr addr, uint32_t version, qemu_irq irq)
 
 static void *sparc32_dma_init(hwaddr dma_base,
                               hwaddr esp_base, qemu_irq espdma_irq,
-                              hwaddr le_base, qemu_irq ledma_irq, NICInfo *nd)
+                              hwaddr le_base, qemu_irq ledma_irq,
+                              MACAddr *mac)
 {
     DeviceState *dma;
     ESPDMADeviceState *espdma;
     LEDMADeviceState *ledma;
     SysBusESPState *esp;
     SysBusPCNetState *lance;
+    NICInfo *nd = qemu_find_nic_info("lance", true, NULL);
 
     dma = qdev_new(TYPE_SPARC32_DMA);
     espdma = SPARC32_ESPDMA_DEVICE(object_resolve_path_component(
@@ -320,7 +322,14 @@ static void *sparc32_dma_init(hwaddr dma_base,
 
     lance = SYSBUS_PCNET(object_resolve_path_component(
                          OBJECT(ledma), "lance"));
-    qdev_set_nic_properties(DEVICE(lance), nd);
+
+    if (nd) {
+        qdev_set_nic_properties(DEVICE(lance), nd);
+        memcpy(mac->a, nd->macaddr.a, sizeof(mac->a));
+    } else {
+        qemu_macaddr_default_if_unset(mac);
+        qdev_prop_set_macaddr(DEVICE(lance), "mac", mac->a);
+    }
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dma), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, dma_base);
@@ -832,7 +841,7 @@ static void sun4m_hw_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
     HostMemoryBackend *ram_memdev = machine->memdev;
-    NICInfo *nd = &nd_table[0];
+    MACAddr hostid;
 
     if (machine->ram_size > hwdef->max_mem) {
         error_report("Too much memory for this machine: %" PRId64 ","
@@ -893,10 +902,9 @@ static void sun4m_hw_init(MachineState *machine)
                         hwdef->iommu_pad_base, hwdef->iommu_pad_len);
     }
 
-    qemu_check_nic_model(nd, TYPE_LANCE);
     sparc32_dma_init(hwdef->dma_base,
                      hwdef->esp_base, slavio_irq[18],
-                     hwdef->le_base, slavio_irq[16], nd);
+                     hwdef->le_base, slavio_irq[16], &hostid);
 
     if (graphic_depth != 8 && graphic_depth != 24) {
         error_report("Unsupported depth: %d", graphic_depth);
@@ -1048,7 +1056,7 @@ static void sun4m_hw_init(MachineState *machine)
                                     machine->initrd_filename,
                                     machine->ram_size, &initrd_size);
 
-    nvram_init(nvram, (uint8_t *)&nd->macaddr, machine->kernel_cmdline,
+    nvram_init(nvram, hostid.a, machine->kernel_cmdline,
                machine->boot_config.order, machine->ram_size, kernel_size,
                graphic_width, graphic_height, graphic_depth,
                hwdef->nvram_machine_id, "Sun4m");
-- 
2.41.0

