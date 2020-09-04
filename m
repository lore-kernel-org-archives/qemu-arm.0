Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2335603qvk;
        Fri, 4 Sep 2020 08:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH8NYNmnZ7h03aVHpBObbAdjILXKsDmsw8qHVobQPWlzRZTZY16sS9UrQ2zKowOHyddqHd
X-Received: by 2002:a25:abf0:: with SMTP id v103mr10865155ybi.203.1599234658981;
        Fri, 04 Sep 2020 08:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234658; cv=none;
        d=google.com; s=arc-20160816;
        b=1DXLR35u1EqHgElM+g5l0W7vSqO/m/3IpT3mp65JBAfuxIv/KklFbIfIqSHYrHTP5w
         RlfWPuCg00JdQl35x5dHrvE6yD+s8n+AbnO23aW10QRBJzfia/CFew7Bh4zLoUaQSY+J
         pfBl+2Mv+yKgQap3PJmxDAqzwaH4NM4eZhsvf90+pPcmsBt87NRUaV3yXq5fiRYDej3A
         Jl2xC3/m497OagceqYQi2ZiD/tL0vVNeF3o2EMwrDpdDV3oI/ICbyv2yTD3+07SGrMli
         tEYK1c/iRz0WSKD1Vc8Jhv9ujDVKIsqZQGf6uy91NfBh2kmOOP4rUaek1LdJTtWTVRhp
         duWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2AmcRETA9oKsnKY8UnfQs5f8OyuGwuYLNWaynUgMlWs=;
        b=KaN6PyNpVrxnlUvi1dRnmXNx9oZxZ9AeZ5uvut7wm5iaP7mWu0Zz0QAbRcE+MXTjIJ
         jH2nrHkQwsU+5goQn1rZComcPHFDEYSkKis/umBn52sxEY9ZlEPl+S5NhK7fDAIRIANK
         qih0MCn9VpTV+5IJeauDxn7yrAY1BDVhOiKKSmVA8WmGSXbb2qK5VBhBME25Jv9DDU/f
         b0DXHvmTDAGqqjCQ6IW0hamnihpswFmXWJiAH5s2V8YvPRfDBo6G0oLoo5RdGB8DcocX
         T5/IImCvqN318OVoujCBFUFQzVR4fB8ezh9LwyWCIfRVsHbHsrIm/kuyP9vKeAyB+nQm
         4Ldg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p71si6370882yba.71.2020.09.04.08.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDzM-0002Wm-7l
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDuG-0001vu-Ij
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:40 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36151
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDuE-0007hP-NL
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:40 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-OD9MQZ7IOnGj6w_y8TWfHA-1; Fri, 04 Sep 2020 11:45:34 -0400
X-MC-Unique: OD9MQZ7IOnGj6w_y8TWfHA-1
Received: by mail-wm1-f69.google.com with SMTP id a5so1839205wmj.5
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AmcRETA9oKsnKY8UnfQs5f8OyuGwuYLNWaynUgMlWs=;
 b=RcxOOmwdO61qO4Q4izyS655m1Dn/rlshXkGrIJZAGx2/aOj6mIgM7n0gAo448NPp2n
 2PYo4OnBDZdoj/Xj+YA/Tee1hEap6nZu9/LMX+n7nLSIgyQ23tP/UKnmsXYla9+626GR
 DpV2sOE8jUx+Q3epaF7anqvup0CDB8Ta+aQzLplYQsKorx77VueXXpR1xQYV+y7EEU+K
 4j7yIdLla7orp3BGEEEvCVbmEWvTL+JhZknsdYeUJl375JzJuPOJcstIN61e7Vulbbzq
 wlayOWZqqCY0iDFP+M/jlMRJ/N/nxWvK+yNu9NOBEKiaqA4m/sfs95qtU1Z1gSjGYzAl
 VHkg==
X-Gm-Message-State: AOAM532jqnugpu2qCip9FIStZOmXkWt/OIhGmXAc3CxcROcXDE2dj8CM
 5SqNjWUV21XWR/7V0IMB+9V9aFSep5hOkHlMMcEMKm1N3QZbDgmZ5JipEVn4LCehCO/NmPnChvy
 mhGaonPqAxQ5C
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr8837875wmh.177.1599234333470; 
 Fri, 04 Sep 2020 08:45:33 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr8837832wmh.177.1599234333203; 
 Fri, 04 Sep 2020 08:45:33 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id t16sm12218159wrm.57.2020.09.04.08.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:45:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/13] dma: Let dma_memory_set() take MemTxAttrs argument
Date: Fri,  4 Sep 2020 17:44:35 +0200
Message-Id: <20200904154439.643272-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwERzMqHYkxl

Let devices specify transaction attributes when calling
dma_memory_set().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 3 ++-
 include/sysemu/dma.h       | 3 ++-
 dma-helpers.c              | 5 ++---
 hw/nvram/fw_cfg.c          | 3 ++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index f134f6cf574..6e5c0840248 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -116,7 +116,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t taddr,
 static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
                                     uint8_t c, uint32_t size)
 {
-    return (dma_memory_set(&dev->as, taddr, c, size) != 0) ?
+    return (dma_memory_set(&dev->as, taddr,
+                           c, size, MEMTXATTRS_UNSPECIFIED) != 0) ?
         H_DEST_PARM : H_SUCCESS;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index b322aa5947b..d0381f9ae9b 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -175,9 +175,10 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
  * @addr: address within that address space
  * @c: constant byte to fill the memory
  * @len: the number of bytes to fill with the constant byte
+ * @attrs: memory transaction attributes
  */
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len);
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs);
 
 /**
  * address_space_map: Map a physical memory region into a DMA controller
diff --git a/dma-helpers.c b/dma-helpers.c
index 4a9e37d6d06..6a9735386dc 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -19,7 +19,7 @@
 /* #define DEBUG_IOMMU */
 
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len)
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs)
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
@@ -31,8 +31,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
     memset(fillbuf, c, FILLBUF_SIZE);
     while (len > 0) {
         l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     fillbuf, l);
+        error |= address_space_write(as, addr, attrs, fillbuf, l);
         len -= l;
         addr += l;
     }
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index f3a4728288e..a15de06a10c 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -397,7 +397,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
              * tested before.
              */
             if (read) {
-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
+                if (dma_memory_set(s->dma_as, dma.address, 0, len,
+                                   MEMTXATTRS_UNSPECIFIED)) {
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
-- 
2.26.2

