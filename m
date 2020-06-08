Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5222142lfc;
        Mon, 8 Jun 2020 09:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywBhMeH9pYy/6HHrQS5am5wxBT/OYD5fOUbOYzFP2ljl5Nu+W3utBFky9/TpvW5Cb/wP1n
X-Received: by 2002:a5b:785:: with SMTP id b5mr37474145ybq.96.1591633476871;
        Mon, 08 Jun 2020 09:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633476; cv=none;
        d=google.com; s=arc-20160816;
        b=GenbAym0R9E2M1vKaqqJi4ZiFfBwxqruY4CPAp4XnrPEK89eWX0sv/Q2cJ7P4Xo18e
         4QJyJSX2sPrW8ZRRPyv3TCbpyGX+thu0wA0lHLyhgceBWB5lI0Cv3mk06rNjVwDWRC2w
         sm5n1Fey7cqz3MppOobwCy7wXCfSXw+WMQRm4anJzl6v9Rccnw/pzpBE5ca5ZHyUVzE5
         lOfVYkXloQsCMYkyGxkPWXN1NlyXWparZwUQTQDc4eOkGCKZcdDeyiMR7jUAYywDBYkI
         NV+WYTSZIuP1wMkUeQejXYT+mCNFK2IQiAJcnfVDcsBAqsvakI44rIzeXIjXgmYm/9fI
         Gj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
        b=EOsFNZvip60FjszWXT+nhDGp2rBdAf/pWewxaQDnsaOXltZK9fyt7l/g02i/h0VGCv
         NqT4JtVqvS8ZnxZvvLMv55NtpIbs2PyxoOTCWEAZGTDDMkgfOl10DCVUCvuLF/3E0XGN
         CdTJQRUC1nvOjnyPqROlKtKw0L4HYDNWm4QSBZTsPgpb1pcjzAo24UuU6vN2Q1yzS1iS
         if+vYbYCXTMC4xAZcuMrBb1JD9BL5AhaqA1FrdyijusN6K2llqTVsc7M+cafri3TuAwU
         SGNvRUF0syz8fZkJ4quccGc2GXzChQuedDek9AMfFZ/aBeJam0rkzasFP+NnHs8oONUj
         NMqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d5KjMTUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r63si112937ybc.159.2020.06.08.09.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d5KjMTUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKZg-0003bH-4q
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFQ-0007Vr-UT
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53305
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFK-0008Bf-V2
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
 b=d5KjMTUhcHEiL6BJl+25Mv6e0YIgG9agYY3MiFWXb8+5afPATdd25Tmg/F2UKuCQID6WMn
 bHLpWoi2Ndr4+loI2CvXgsO+s8Pi7SWuTaxET0zxNB22gO41PSjIarJtMzDACCQfhbBONl
 Hc4gERqvw7xxkpw/yJxj3RBxlbFP0xU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-eatlg2x_N1aXneUpXGd2zA-1; Mon, 08 Jun 2020 12:03:31 -0400
X-MC-Unique: eatlg2x_N1aXneUpXGd2zA-1
Received: by mail-wr1-f69.google.com with SMTP id h6so7397351wrx.4
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
 b=GE/fkrSmdOEDTyTpihGIX70oQGTXNPk+vrwggZLja/nUjbY1BjPb71QTWEmsDmJIsv
 zJdh1irVWD8GvTgnNGSEDDGLkyQEAC2Q7kPtA4rjAlpSRjr8KyqIJRNP4uVW6zi29Joc
 Byeptu6iUvavOEQaSeSyqb402S/8ahkIIHj6M2/2PQAhA6+ACLBKKDRJ6A0waxwgSdWv
 ybHv9Vjz+HXIGUCI/eeNY+EeWBc1x3AvWBCF6s0k/YUw/RIU2Q2leRUSXo+mgS2VGm1F
 8RO2193R6Qo+zYhalqHX3KV1N9Rw1QDfXbpzVcs0wjvzxz76zSRbAKwi3qZjrrWbfMk9
 fwdw==
X-Gm-Message-State: AOAM533EEsEumeBSpVECX44nrT8np9udFr5VksUdVfn40sW3ZxvasnRr
 djbry9nDh0RcQolwEXIxvJ+3hT33vxOW+AqEGyH0RbtNGo8vAXoOs4PV1+jP7rjbhGjeBO7MzFP
 8W9DMsXJOwSYI
X-Received: by 2002:adf:a41a:: with SMTP id d26mr25031330wra.324.1591632210362; 
 Mon, 08 Jun 2020 09:03:30 -0700 (PDT)
X-Received: by 2002:adf:a41a:: with SMTP id d26mr25031279wra.324.1591632210107; 
 Mon, 08 Jun 2020 09:03:30 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id n204sm42276wma.5.2020.06.08.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 28/35] hw/ppc/ppc4xx: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:37 +0200
Message-Id: <20200608160044.15531-29-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lqtb65MFB8Fr

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc405_boards.c |  5 +++++
 hw/ppc/ppc405_uc.c     | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c   |  7 +++++++
 3 files changed, 33 insertions(+)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 6198ec1035..eb1216b5f0 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -41,6 +41,7 @@
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/cutils.h"
+#include "hw/qdev-deprecated.h"
 
 #define BIOS_FILENAME "ppc405_rom.bin"
 #define BIOS_SIZE (2 * MiB)
@@ -129,6 +130,8 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
     ref405ep_fpga_t *fpga;
     MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
 
+    qdev_warn_deprecated_function_used();
+
     fpga = g_malloc0(sizeof(ref405ep_fpga_t));
     memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
                           "fpga", 0x00000100);
@@ -408,6 +411,8 @@ static void taihu_cpld_init(MemoryRegion *sysmem, uint32_t base)
     taihu_cpld_t *cpld;
     MemoryRegion *cpld_memory = g_new(MemoryRegion, 1);
 
+    qdev_warn_deprecated_function_used();
+
     cpld = g_malloc0(sizeof(taihu_cpld_t));
     memory_region_init_io(cpld_memory, NULL, &taihu_cpld_ops, cpld, "cpld", 0x100);
     memory_region_add_subregion(sysmem, base, cpld_memory);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 381720aced..160604c62e 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -36,6 +36,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_OPBA
 //#define DEBUG_SDRAM
@@ -182,6 +183,8 @@ void ppc4xx_plb_init(CPUPPCState *env)
 {
     ppc4xx_plb_t *plb;
 
+    qdev_warn_deprecated_function_used();
+
     plb = g_malloc0(sizeof(ppc4xx_plb_t));
     ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
@@ -267,6 +270,8 @@ static void ppc4xx_pob_init(CPUPPCState *env)
 {
     ppc4xx_pob_t *pob;
 
+    qdev_warn_deprecated_function_used();
+
     pob = g_malloc0(sizeof(ppc4xx_pob_t));
     ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
     ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
@@ -351,6 +356,8 @@ static void ppc4xx_opba_init(hwaddr base)
 {
     ppc4xx_opba_t *opba;
 
+    qdev_warn_deprecated_function_used();
+
     opba = g_malloc0(sizeof(ppc4xx_opba_t));
 #ifdef DEBUG_OPBA
     printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
@@ -549,6 +556,8 @@ void ppc405_ebc_init(CPUPPCState *env)
 {
     ppc4xx_ebc_t *ebc;
 
+    qdev_warn_deprecated_function_used();
+
     ebc = g_malloc0(sizeof(ppc4xx_ebc_t));
     qemu_register_reset(&ebc_reset, ebc);
     ppc_dcr_register(env, EBC0_CFGADDR,
@@ -632,6 +641,8 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
 {
     ppc405_dma_t *dma;
 
+    qdev_warn_deprecated_function_used();
+
     dma = g_malloc0(sizeof(ppc405_dma_t));
     memcpy(dma->irqs, irqs, 4 * sizeof(qemu_irq));
     qemu_register_reset(&ppc405_dma_reset, dma);
@@ -735,6 +746,8 @@ static void ppc405_gpio_init(hwaddr base)
 {
     ppc405_gpio_t *gpio;
 
+    qdev_warn_deprecated_function_used();
+
     gpio = g_malloc0(sizeof(ppc405_gpio_t));
 #ifdef DEBUG_GPIO
     printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
@@ -897,6 +910,8 @@ static void ppc405_ocm_init(CPUPPCState *env)
 {
     ppc405_ocm_t *ocm;
 
+    qdev_warn_deprecated_function_used();
+
     ocm = g_malloc0(sizeof(ppc405_ocm_t));
     /* XXX: Size is 4096 or 0x04000000 */
     memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
@@ -1142,6 +1157,8 @@ static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
     ppc4xx_gpt_t *gpt;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     gpt = g_malloc0(sizeof(ppc4xx_gpt_t));
     for (i = 0; i < 5; i++) {
         gpt->irqs[i] = irqs[i];
@@ -1410,6 +1427,8 @@ static void ppc405cr_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[7],
 {
     ppc405cr_cpc_t *cpc;
 
+    qdev_warn_deprecated_function_used();
+
     cpc = g_malloc0(sizeof(ppc405cr_cpc_t));
     memcpy(cpc->clk_setup, clk_setup,
            PPC405CR_CLK_NB * sizeof(clk_setup_t));
@@ -1755,6 +1774,8 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
 {
     ppc405ep_cpc_t *cpc;
 
+    qdev_warn_deprecated_function_used();
+
     cpc = g_malloc0(sizeof(ppc405ep_cpc_t));
     memcpy(cpc->clk_setup, clk_setup,
            PPC405EP_CLK_NB * sizeof(clk_setup_t));
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f1651e04d9..b09d7ab5c6 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -33,6 +33,7 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-deprecated.h"
 
 /*#define DEBUG_UIC*/
 
@@ -303,6 +304,8 @@ qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
     ppcuic_t *uic;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     uic = g_malloc0(sizeof(ppcuic_t));
     uic->dcr_base = dcr_base;
     uic->irqs = irqs;
@@ -647,6 +650,8 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
 {
     ppc4xx_sdram_t *sdram;
 
+    qdev_warn_deprecated_function_used();
+
     sdram = g_malloc0(sizeof(ppc4xx_sdram_t));
     sdram->irq = irq;
     sdram->nbanks = nbanks;
@@ -908,6 +913,8 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
     ppc4xx_mal_t *mal;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     assert(txcnum <= 32 && rxcnum <= 32);
     mal = g_malloc0(sizeof(*mal));
     mal->txcnum = txcnum;
-- 
2.21.3

