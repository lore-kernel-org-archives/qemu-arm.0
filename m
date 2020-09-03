Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp431162lfc;
        Thu, 3 Sep 2020 04:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCSdu77UREhfqDOuAd7bzMvT9vNTGpaSIUKEdZ9kjZRyVRO9POK4jImteALLaxR9Fhx71G
X-Received: by 2002:a25:9247:: with SMTP id e7mr2082287ybo.293.1599131449861;
        Thu, 03 Sep 2020 04:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131449; cv=none;
        d=google.com; s=arc-20160816;
        b=mrg2YbcMKvd2HfFsvVUQEqhGO/Suvx/a35EwAXlVBOX3id6orKeOgw0DaWoq7iR2Nq
         TWw/xfojVoPDM8zKFBcQl4fw1KS6ojQ0iG7SQGlXzJMTISmwCSZfeZ7SdoVpbj+mUTMu
         D4NmA0NbOhXPl/UQcJeYFxFTa80uJoQbHqm20on7bgTybZphkBlSMnFuxdPwZNRP3xHi
         UR2sI+esVPhGff6LllcCM45tr0eDFvJHq9qvdL5s+8MRfuZP0d0e36yrQU07A0h/FuBi
         D1AhtnPCi/PKhzMdClu/Erepi0+C43LnE9mlI5aUO1U/TLqB6aUKIZ3qNOz8lkQORYQy
         ywFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m9Kq6ilZXw1SgPGwv65dwwD+++f09k8wejmCLHdwFqM=;
        b=wOX7LQauyVy3OF+YK9eF+L4bNxDB8t/6D+EGnipv7ZtqCXNiyeJrBVSgetnYA4JB4U
         CzXSkqD0SvQ/lzPcHBLYPjvZz25exYMKfaMyCeW0VpaZvSjPz6t2Rl7fHpX7l+SRgZlb
         GZH0qwSquVbHBmoDA3Jg6J9keFZMGnCclMnNtrt/BtZ3Nk9R0oXIF0agnrSvktXu27UU
         PGC51y4yeVEFNKjgfjS5w34bLu/nC4xls9sVec9apVR5wxd8XrP8Us8R6N32vHEIX8uY
         ZerlpfeXOOz3QZvJNKMluyBMEz/yzFhN7QrFXKh6UohYKNbf+vqNlSI5zRpdMhzyBo3t
         y79A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ePwS11wT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si2635710ybd.491.2020.09.03.04.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ePwS11wT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDn8j-0003OR-3S
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7B-0000FF-Aa
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn78-0005rx-Vh
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9Kq6ilZXw1SgPGwv65dwwD+++f09k8wejmCLHdwFqM=;
 b=ePwS11wT7NlSW5m9cAAYhb1viLHk2AVKHo8hUmypGGxMFgdi/QqtOisxvEf+CupG2EE6r2
 SBvfsmzvsZg+PvM1DfWi8lRWWDn3mOSA1uylwZ92PR+2H9WX7jwfwbIi7d8e3WBZ/ECrb2
 CuNOLDUFVLYeXCP+iMe6Ku25xwujsrI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-Lso20-YrN82rak1yzUE4Lg-1; Thu, 03 Sep 2020 07:09:09 -0400
X-MC-Unique: Lso20-YrN82rak1yzUE4Lg-1
Received: by mail-wm1-f72.google.com with SMTP id k12so2294498wmj.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9Kq6ilZXw1SgPGwv65dwwD+++f09k8wejmCLHdwFqM=;
 b=gSl2bGWLzRcmAKJI6GQQGs7YlNY99aU/HFoEHUE4GC89v+WLR7nc/KlFVJG0xJDfxT
 z2R0sQduiwhHzYzLVAZww09yqJ3YFEWm2xbYKXh3T8tsbE72dqPehH13YPBTvBCwZouV
 A52mq6/CY4O7bvhlCzx2zW22pOMPcYK0T/63f4qd0TmaOWgUPCYMFVPM8i7szGNx/ITo
 Ub9Ir3aBjBLdx00+rhJjKfPTpbYr7Nr59wM4UnnOGbvhN6OiPjOqJ6ynKR3nS2jd/nC/
 JXL75LaWZyTSWm0bvQWlZvKT/OzEffzw7oOVFIlN16K//pXgM+jIdqaIANqIa3ITTJtR
 vv2A==
X-Gm-Message-State: AOAM533amPUWJQZlu/CdOc+jgYuJgitY5yDP3zV2hVFybbjfuXHuLk8l
 VNfRx+ZlMo2dOJg5WKyghgO72MGz2WVrbrIKvYT9PZi2R3X7XRfAJcRw+D3ION/THKo8jOyk8Mg
 mLmDWpO0LBkwT
X-Received: by 2002:a1c:9d83:: with SMTP id g125mr1863584wme.41.1599131346004; 
 Thu, 03 Sep 2020 04:09:06 -0700 (PDT)
X-Received: by 2002:a1c:9d83:: with SMTP id g125mr1863549wme.41.1599131345807; 
 Thu, 03 Sep 2020 04:09:05 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id 197sm3869799wme.10.2020.09.03.04.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:09:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] dma: Let dma_memory_rw() take MemTxAttrs argument
Date: Thu,  3 Sep 2020 13:08:24 +0200
Message-Id: <20200903110831.353476-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903110831.353476-1-philmd@redhat.com>
References: <20200903110831.353476-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oXz1PHOagafD

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h |  3 ++-
 include/sysemu/dma.h | 10 +++++-----
 dma-helpers.c        |  3 ++-
 hw/intc/spapr_xive.c |  3 ++-
 hw/usb/hcd-ohci.c    | 10 ++++++----
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 896cef9ad47..0c3217e019c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -788,7 +788,8 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                              void *buf, dma_addr_t len, DMADirection dir)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                         dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 6068323e48f..f03edeab173 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -106,25 +106,25 @@ static inline int dma_memory_write_relaxed(AddressSpace *as, dma_addr_t addr,
 
 static inline int dma_memory_rw(AddressSpace *as, dma_addr_t addr,
                                 void *buf, dma_addr_t len,
-                                DMADirection dir)
+                                DMADirection dir, MemTxAttrs attrs)
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
-                                 MEMTXATTRS_UNSPECIFIED);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
 }
 
 static inline int dma_memory_read(AddressSpace *as, dma_addr_t addr,
                                   void *buf, dma_addr_t len)
 {
-    return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw(as, addr, buf, len,
+                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int dma_memory_write(AddressSpace *as, dma_addr_t addr,
                                    const void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, (void *)buf, len,
-                         DMA_DIRECTION_FROM_DEVICE);
+                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 int dma_memory_set(AddressSpace *as, dma_addr_t addr,
diff --git a/dma-helpers.c b/dma-helpers.c
index 49d66716469..50473bb1996 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -305,7 +305,8 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
+                      MEMTXATTRS_UNSPECIFIED);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 4bd0d606ba1..dbf73a8bf47 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1666,7 +1666,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
         mmio_addr = xive->vc_base + xive_source_esb_mgmt(xsrc, lisn) + offset;
 
         if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
-                          (flags & SPAPR_XIVE_ESB_STORE))) {
+                          (flags & SPAPR_XIVE_ESB_STORE),
+                          MEMTXATTRS_UNSPECIFIED)) {
             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ESB @0x%"
                           HWADDR_PRIx "\n", mmio_addr);
             return H_HARDWARE;
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1e6e85e86a8..bac1adf439c 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -586,7 +586,8 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -595,7 +596,7 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
     ptr = td->be & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
@@ -613,7 +614,8 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     if (n > len)
         n = len;
 
-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) {
+    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     if (n == len) {
@@ -622,7 +624,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     ptr = end_addr & ~0xfffu;
     buf += n;
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
-                      len - n, dir)) {
+                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
     }
     return 0;
-- 
2.26.2

