Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp435601lfc;
        Thu, 3 Sep 2020 04:16:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO45NYC+qejWHhHecx3PtcLUrxUNYcuplpmWE2IN9agPZ64F9Z8tayqdXpwFu/gACRLx9/
X-Received: by 2002:a25:5cc2:: with SMTP id q185mr1938661ybb.409.1599131816507;
        Thu, 03 Sep 2020 04:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131816; cv=none;
        d=google.com; s=arc-20160816;
        b=M5EhYN+JQqmnNq3jwmFQMJmzIvmQsXlMyLBxeY+7eGBx4Y3nLRi4v3UeMoJ1Xj9zq4
         1MuJ8rti+7/I1dXnzxt4E34WPWsvNLUnjvnoljuLukfIML+GexypZ7rKWyLLFJHU+cvz
         39/JGGMiK7YN0S4v657abYxR523b0MOQ9scaQJxhD0Irotsq7ye8I1eVWM1JP92g4K+R
         wa/2B7sPRXmqO22ZInI3psL1jeADNZ9Qg12eDnhGLq5lpJeJMvdPCBzhgDkSxnoEMUSH
         Hd6oaLWXThEIva+7EGG45Hgz8GsImIC3w6oyoN5Y6R5fkOMuuT2X9NQC9QhandngrSoG
         LLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Gfc0vh/hSxUgj/nHXInlGH3QJr0Hadg3+ww1zXZjK0w=;
        b=ViRrDU1+uUr3GVQ9cpdTZfziEFUxoJgrqlCs0vbljPFeXqGxZal4tc1ZryLX0W+Yiw
         xhQ5dYezU+YQhE0VMTuA8jeKZkeznIbes7cWLrqwAHkw4c2x1Eh3hVsZmDVqGbfGghZT
         Gmj/5nl7odfSnWu/vSRnO4cLsglFqhGE7iEDFWhZEhh+SXdje97q/N+rwO2A1mUZZmCE
         GrkDqNhbj04yPqNCWNcGeq4QQxEUKQIRkzBxfg4IaHLZEJtHyEWlSaAsfyPH8HXR1NhN
         J7/EuCNquj012BQIKGQqG8+bDVyxYVKbzTUNYsGVwVJeJxQsYP5dVXXQQpTfPUoWcbh1
         9WnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UKpe9sK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si2588037ybn.384.2020.09.03.04.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UKpe9sK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDnEd-0004KA-Rb
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7p-0001MS-Br
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41336
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7l-0005z4-F0
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gfc0vh/hSxUgj/nHXInlGH3QJr0Hadg3+ww1zXZjK0w=;
 b=UKpe9sK8U3RUHZqdpXNqXB4rCXrncs31Su5LskFZuaklFP58EOqfSz06TUsDj8vnGis3Xt
 nPvrJ/0V39wrd8LVFi5JFeo09w8z+whs1G3s02p2cAfUH6SltRPjMGwSZr26xdSnJB10aN
 oqYebD4A7XYgdV5WS4hH/8uRf8fupHQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Xgn7-2DAM4GhJmrSE2i0Fg-1; Thu, 03 Sep 2020 07:09:44 -0400
X-MC-Unique: Xgn7-2DAM4GhJmrSE2i0Fg-1
Received: by mail-wr1-f69.google.com with SMTP id i10so952827wrq.5
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gfc0vh/hSxUgj/nHXInlGH3QJr0Hadg3+ww1zXZjK0w=;
 b=XoQE516U+6CUXEJhrh1PywC3CnWNPQ1BQeQ/JBH7VIugrcmClJqhpAKl2fSPMEBulU
 3A4XfzigYYvq1ukrVQVNeMzsqnMPVfJl2FcID6CEZQ7PlB4OIgg1sBcKOGBgFm+A6e6W
 9AHeKkgHC0Mi3Y/xUlLHIALJj6XKymtvHJ4opTgG7JAk3Oy7ggC1UsXFiCkMKxPaHjn/
 s6ycQ6aOfUvRSgJks/MX52wzLh3NotmXd+4cxblnP4jGgKSncS6PVL3r5QzbPTehNYzA
 bOuLtEJzkpn/ljArn8jmz4bDNtIf0qDXwjiAq47uUQJzFi7hOPQyxYljU69TTUlZ0jkj
 ciPA==
X-Gm-Message-State: AOAM530P6s8i/f2QEv3qUnlf83E+TvYMPkYGasdYiWvZ6bvQPCDBXi/R
 /3KrJ5G911vt0S7y35tt1nb00UKY4L64ZIPmxZWM2ce5d3uO0HgLMzRY1bt1HEzLFPAg3BDqttW
 Bl0+wcRLsVpdN
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr1916137wmf.40.1599131383033;
 Thu, 03 Sep 2020 04:09:43 -0700 (PDT)
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr1916113wmf.40.1599131382849;
 Thu, 03 Sep 2020 04:09:42 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id z13sm3820908wro.97.2020.09.03.04.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:09:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/12] hw/pci: Only allow PCI slave devices to write to
 direct memory
Date: Thu,  3 Sep 2020 13:08:30 +0200
Message-Id: <20200903110831.353476-12-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: U5ftHwIj0MD/

Do not allow PCI slaves to write to indirect memory
regions such MMIO.

This fixes LP#1886362 and LP#1888606.

Example with the former reproducer:

  $ cat << EOF | \
    qemu-system-i386 -M q35,accel=qtest \
                     -qtest stdio \
                     -trace memory_access\* \
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe1020000
  outl 0xcf8 0x80001014
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x800010a2
  write 0xe102003b 0x1 0xff
  write 0xe1020103 0x1e 0xffffff055c5e5c30be4511d084ffffffffffffffffffffffffffffffffff
  write 0xe1020420 0x4 0xffffffff
  write 0xe1020424 0x4 0xffffffff
  write 0xe102042b 0x1 0xff
  write 0xe1020430 0x4 0x055c5e5c
  write 0x5c041 0x1 0x04
  write 0x5c042 0x1 0x02
  write 0x5c043 0x1 0xe1
  write 0x5c048 0x1 0x8a
  write 0x5c04a 0x1 0x31
  write 0x5c04b 0x1 0xff
  write 0xe1020403 0x1 0xff
  EOF
  562564:memory_access_illegal is_write:1 addr:0xe1020400 size:0x000e region:'e1000e-mmio'
  562592:memory_access_illegal is_write:1 addr:0xe102040e size:0x007c region:'e1000e-mmio'
  562601:memory_access_illegal is_write:1 addr:0xe102048a size:0x0004 region:'e1000e-mmio'

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Buglink: https://bugs.launchpad.net/qemu/+bug/1886362
Buglink: https://bugs.launchpad.net/qemu/+bug/1888606
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 8f901e6c289..cd97268b3a8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -788,8 +788,12 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                              void *buf, dma_addr_t len, DMADirection dir)
 {
+    MemTxAttrs attrs = {
+        .direct_access = (dir == DMA_DIRECTION_FROM_DEVICE),
+        .requester_id = pci_requester_id(dev),
+    };
     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
-                         dir, MEMTXATTRS_UNSPECIFIED);
+                         dir, attrs);
 }
 
 static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
@@ -808,14 +812,18 @@ static inline int pci_dma_write(PCIDevice *dev, dma_addr_t addr,
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
                                                    dma_addr_t addr)     \
     {                                                                   \
-        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
-                            MEMTXATTRS_UNSPECIFIED);                    \
+        MemTxAttrs attrs = {                                            \
+            .requester_id = pci_requester_id(dev),                      \
+        };                                                              \
+        return ld##_l##_dma(pci_get_address_space(dev), addr, attrs);   \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
                                         dma_addr_t addr, uint##_bits##_t val) \
     {                                                                   \
-        st##_s##_dma(pci_get_address_space(dev), addr, val,             \
-                     MEMTXATTRS_UNSPECIFIED);                           \
+        MemTxAttrs attrs = {                                            \
+            .requester_id = pci_requester_id(dev),                      \
+        };                                                              \
+        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs);     \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
-- 
2.26.2

