Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3319332lfb;
        Thu, 23 Dec 2021 04:13:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH73evlapUdbJEdPdhXCkw3OrhLvAju6OhEBrKU+NOa4TbKGKpUt2dQFBuXywzBHk5oR3E
X-Received: by 2002:a25:1586:: with SMTP id 128mr2910419ybv.471.1640261592185;
        Thu, 23 Dec 2021 04:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640261592; cv=none;
        d=google.com; s=arc-20160816;
        b=rw7opYiQzJ9kspRVx16h5VCdTYg94393h3cUVZHOzWF2wz+UTpa7tlQ+FQscIF17s7
         h5UQf+6uBjbN07mx4/R5XswE92sMHPreTe0gyTbBa25HFf6OYl77D3OMRFiJuFMO6ftY
         R3Qtd/Cra5fNlkAuC19FPUHsiKMMOj7MPhQpeXVJWMfUMZbLag4FWxvq6N3uFemmaGcQ
         UhV1mtkvZXUr+BJtBlGk/Xk1YUiEI9JoV7lZpBxjEO5vNDO8m3EGUeTfRq829nvCOjQK
         rFb0ZlnijtK5k6kiDjSjTxT1gVsANuuYXLhNBxdpxnoQB/DvMiFXaxbujq052IMRNRKO
         5Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jlgo6xDtAAtMm1rT3FU1HVvEVWIuXmrKi5ItJcLts/Y=;
        b=gfUIn0EbOZ1nN9Ezqnm/LVX/SK8/3epP8cKOLjaTqIwnjYJC/KJ9TqW7zI1Cd4q7ci
         fNGYVG5NlVp2mARK84eIWhSu8vNGhDRkbIWXGEEZ3OqxqNrwY0dHbG9iodW9ff7vi/Vl
         0if8/mxuopP3lmKZjRIekrLWNFC1mYxmlMaj+ZFUixw67+SpknNMBYieNtKuwFCqAi+x
         4HAeUrc7740xxp6gl/1CPukaQ7BHHROAndgz5VessuSeg1ygw6BHOcc3VqUOhBbUYonJ
         oYNRFMdo4/8+ibnjrHQtE9KpWRDXvAyRKzcakB1ShxlkmQxh3nTNgteKYJJxYrAFqwnW
         8Nkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Fps9z/0q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si6119342ybu.523.2021.12.23.04.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Fps9z/0q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0My7-0005on-Hq
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:13:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MiJ-0007P6-7c
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:56:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MiC-0000dN-R0
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlgo6xDtAAtMm1rT3FU1HVvEVWIuXmrKi5ItJcLts/Y=;
 b=Fps9z/0q/BJ8bSyD/SG1vhHEgw2Emr33CTOLbtFej+3CMRd5CjiITliF6YDw5lEnXfMmbt
 vZWCeCKFKVEYhwu/eLu/AKNnj4lGm+dDFnlw3auKXBUKaLNaJH8Hnd146D8sOnQImmgWtv
 +Wq71Y7n6XUxcBPBOjGDqZqqEEnSxYk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-wlTpA0uwOKijApmmeUmhew-1; Thu, 23 Dec 2021 06:56:38 -0500
X-MC-Unique: wlTpA0uwOKijApmmeUmhew-1
Received: by mail-wr1-f71.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so1229083wrg.7
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlgo6xDtAAtMm1rT3FU1HVvEVWIuXmrKi5ItJcLts/Y=;
 b=qfPAJAZEdFerI0qQQvP29tM53auX4p6rpTkkV+hgN9vQrmHMxZmRiLqyRj+l6ggu25
 SrKdul9ahYBegrLgi39o921vuVwJwQTH1XQAyIvtXAFOZJwcWV7XPL4YDoAoVl90HmEV
 aY+NkdfvhW6pDmED73B8jAR3aWcXLMs/gI7Z5J4Y83lGedqpJLobbTTBXxOpgLJpQAmd
 LpxIex4g40iejLH6uJ8oqN+wPyxON4Y86zuw8wqxR8KdUOHwYuqS+jAXQuDcKiGtd1Eu
 jNd3kpsvTFmWtgImqhwsRnTKlZofQxAOimZfNRsQmqtBZYpTA0r/odffTou72518q9VN
 ioNQ==
X-Gm-Message-State: AOAM532NjLywsaQd9pVqxb3NJzShczYzt7VUQHzQeAYCu5OwSPNfR8iq
 /UDdnShHgXQkn+DQKJCYURH0wkS+AGdxbNtqnYK7uSmLylrb9UuO4dXNTLLLuEkReQSucqHL1Lv
 eBaGIldSscfYF
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr1594850wry.460.1640260596755; 
 Thu, 23 Dec 2021 03:56:36 -0800 (PST)
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr1594799wry.460.1640260596463; 
 Thu, 23 Dec 2021 03:56:36 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id j14sm4775556wrn.88.2021.12.23.03.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] dma: Let dma_memory_set() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:33 +0100
Message-Id: <20211223115554.3155328-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LXwFTq17JFKZ

Let devices specify transaction attributes when calling
dma_memory_set().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210702092439.989969-3-philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 3 ++-
 include/sysemu/dma.h       | 3 ++-
 hw/nvram/fw_cfg.c          | 3 ++-
 softmmu/dma-helpers.c      | 5 ++---
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4c45f1579fa..c90e74a67dd 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -111,7 +111,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t taddr,
 static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
                                     uint8_t c, uint32_t size)
 {
-    return (dma_memory_set(&dev->as, taddr, c, size) != 0) ?
+    return (dma_memory_set(&dev->as, taddr,
+                           c, size, MEMTXATTRS_UNSPECIFIED) != 0) ?
         H_DEST_PARM : H_SUCCESS;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 296f3b57c9c..d23516f020a 100644
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
  * address_space_map: Map a physical memory region into a host virtual address.
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index c06b30de112..f7803fe3c30 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -399,7 +399,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
              * tested before.
              */
             if (read) {
-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
+                if (dma_memory_set(s->dma_as, dma.address, 0, len,
+                                   MEMTXATTRS_UNSPECIFIED)) {
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7d766a5e89a..1f07217ad4a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
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
-- 
2.33.1

