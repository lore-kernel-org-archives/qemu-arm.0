Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3320620lfb;
        Thu, 23 Dec 2021 04:15:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws72HuiR+yCSSJ00KWIkbntETF0sC5G+5xQBxXjfFERqaim3TYJkutE80V245zj6vlybM3
X-Received: by 2002:a05:6e02:180e:: with SMTP id a14mr845688ilv.95.1640261717047;
        Thu, 23 Dec 2021 04:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640261717; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw5peRwMSbvZ6CxuK5MdTjAPqO6CNYg9I28/p/HxPCWqbSb/CKTFppMGZiJf7zQgSi
         VklCQB5dhxBrO8GxMtLXdYayDptw7Etzd4hT9/heFeKpxf++g2hOJtb8Is5mWaz25/IV
         Xh+3z9hYXFkHGtGBkLPuhl9s4NYeLbilziau1T3Ey28uVAbcSuU5M1MOlHGjaP9JAHp/
         eG/v5wrN8TwTsVc60alKwa42d7Li0INqLdORbXO1Uu/fZ3PtMNKJNJVXtIu/BsZe42MS
         lrskcE/lxt1dMwISYWUVir0LBBtWPuE91n1TGMLxaJ+v3fBhkhJmYHXvsIiTp5DHdK8y
         rsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ftwXgHnQRoZowrvTRk4Xx2aE6O9/FjV/sJjIF9qzyOM=;
        b=Kg14a8tM0aR+SZew+Bi+g7uLjOnNRFbDImyRaQO/uhsed0rraGOl1gmGq/6BLtuVjI
         oJn16CziVDSRas+ZId32d4x+CVQjJslTxjotb/KAL2Gd5yiT19MhrVV/nCYNTKVgGrY+
         2+yuoz8JQhe1fh4HLkhHPSruxrc6nQ3YKhFXXDTnExN+b4ezvjAyx72GrJlHRyseVzRF
         XPYS00ggpZyiZ6SqlwkuVDAb19YRKZUQLpj1sPRKTnbHccx3PeBFhKrs+Yv5LpfIqunv
         w2RyWlwpXnyCRtOTYrsl7Wz9+j+SR3QQWVHmHZ38IL31cfLWfUj0j3um4Lc3RKDbyxSJ
         Zcnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gLyNfbNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si3241733iow.66.2021.12.23.04.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:15:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gLyNfbNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0N08-0002kT-A8
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:15:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlC-00047J-0S
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlA-0001BD-3l
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftwXgHnQRoZowrvTRk4Xx2aE6O9/FjV/sJjIF9qzyOM=;
 b=gLyNfbNn9XoYWakBa90mDmHnPjq3tf6Ve9Ti/hYUu7hy49BXv/f3ZoFbgGJ1KQKQFjj1q4
 GBVC+uqCAke3AMTo1f5x93KyGcZWV2yB9PlSOX35+d4faSR1+HEbKDoJmbM+B/k4ETmBpP
 AD9W35uBo2sK1K9gQUM99Fh+R/g0OsU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-RfGCn2s3MgWasqhmo4BU0g-1; Thu, 23 Dec 2021 06:59:39 -0500
X-MC-Unique: RfGCn2s3MgWasqhmo4BU0g-1
Received: by mail-wm1-f70.google.com with SMTP id
 az11-20020a05600c600b00b00345c4309bccso1737910wmb.5
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ftwXgHnQRoZowrvTRk4Xx2aE6O9/FjV/sJjIF9qzyOM=;
 b=lGIeHgP7rS4WFJ85f2EToGU3bMgE9YSuigRBcO4LEmH61A+vofi/tzhcDWOrGKdMAy
 zaquZtFjML24L/sM/sDO6+3eMk9V3ib+olG1VP+dkM9aoVzTJxoDubQuDqP5zZnlMMBX
 5pbbPTOLqmnIgLDYYIfW8kEygIBRvDYdsW/ot8Gczi5KMlK1uV0UcGlF5wzXItTFg+z7
 b7oar3zBFmaV29zMtVKXIFXMc4z8sX25zc+LYWqgmB2Xa6XwWKQPuvdEZRva9gb0aAnW
 liWb6dp5Zc2zXG9EAVfWY9Y7VafsQQDnMdTs/T67zgc93VZK4e1UVfLNdLxJ+kSKXUK2
 vWeQ==
X-Gm-Message-State: AOAM5323vCnxXPfMLMtwTaYBMEM1HUk/onZnF3VTXPupAJ0KBSg1gMe2
 xfPynna2LdQqh6Z9hSGaW674JIIYMVtfN5v+u0jvnKT6j4T7DIRohUm0jneoPaP7C5IePseaB6Y
 MTeEzLbNJ7BXk
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr1519280wrd.177.1640260778440; 
 Thu, 23 Dec 2021 03:59:38 -0800 (PST)
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr1519252wrd.177.1640260778196; 
 Thu, 23 Dec 2021 03:59:38 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id o38sm2299342wms.11.2021.12.23.03.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/23] dma: Let ld*_dma() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:47 +0100
Message-Id: <20211223115554.3155328-17-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sK+Arh+Ee72y

Let devices specify transaction attributes when calling ld*_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h       |  3 ++-
 include/hw/ppc/spapr_vio.h |  3 ++-
 include/sysemu/dma.h       | 11 ++++++-----
 hw/intc/pnv_xive.c         |  7 ++++---
 hw/usb/hcd-xhci.c          |  6 +++---
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d07e9707b48..0613308b1b6 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -854,7 +854,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
                                                    dma_addr_t addr)     \
     {                                                                   \
-        return ld##_l##_dma(pci_get_address_space(dev), addr);          \
+        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
+                            MEMTXATTRS_UNSPECIFIED);                    \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index e87f8e6f596..d2ec9b0637f 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -126,7 +126,8 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
         (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
 #define vio_stq(_dev, _addr, _val) \
         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
-#define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
+#define vio_ldq(_dev, _addr) \
+        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
 
 int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index ebbc0501681..f3cf60d222d 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -241,10 +241,11 @@ static inline void dma_memory_unmap(AddressSpace *as,
 
 #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
     static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace *as, \
-                                                            dma_addr_t addr) \
+                                                            dma_addr_t addr, \
+                                                            MemTxAttrs attrs) \
     {                                                                   \
         uint##_bits##_t val;                                            \
-        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFIED); \
+        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
         return _end##_bits##_to_cpu(val);                               \
     }                                                                   \
     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
@@ -253,14 +254,14 @@ static inline void dma_memory_unmap(AddressSpace *as,
                                                  MemTxAttrs attrs)      \
     {                                                                   \
         val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
+        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
     }
 
-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
+static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
 {
     uint8_t val;
 
-    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+    dma_memory_read(as, addr, &val, 1, attrs);
     return val;
 }
 
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index ad43483612e..d9249bbc0c1 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -195,7 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr = vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+        vsd = ldq_be_dma(&address_space_memory, vsd_addr,
+                         MEMTXATTRS_UNSPECIFIED);
 
         if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -542,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive, uint32_t type)
 
     /* Get the page size of the indirect table. */
     vsd_addr = vsd & VSD_ADDRESS_MASK;
-    vsd = ldq_be_dma(&address_space_memory, vsd_addr);
+    vsd = ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPECIFIED);
 
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index ed2b9ea456e..d960b814587 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
+    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPECIFIED);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -3437,8 +3437,8 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         if (!slot->addressed) {
             continue;
         }
-        slot->ctx =
-            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
+        slot->ctx = xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid,
+                                           MEMTXATTRS_UNSPECIFIED));
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1

