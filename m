Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3324016lfb;
        Thu, 23 Dec 2021 04:21:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLBbY2qLSN8oMx+I9tvcbXxvBz2LIJV8nNJGRnlPOeMUpQVD88wqJigpH4T8FU5yMuZbrc
X-Received: by 2002:a25:b2a2:: with SMTP id k34mr2672817ybj.575.1640262093074;
        Thu, 23 Dec 2021 04:21:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640262093; cv=none;
        d=google.com; s=arc-20160816;
        b=C32nH083QGAXZi0d4K50Moqg38wO931LU0cM8PTKxYzh96AfN7Brbw91zR0GcV0rDK
         9odipgMapKBM307tzLM/M1jfleSg9O5FgHuiaop0hVo9Y5U5mEBf7QlO0qvGabva7b8B
         YIcXKOs0eub/XvU2IcrNzcD49USORuE3H0xHcjWfLghe8y7geUilHnZm40eVlrnOhQhg
         z994Bhpar0LvYMnrvxHHDlRQRmtC+QKgosHmeJkvSOYYdkvmQJd8OQVwGAAUvvZKZyHv
         hmhK6+c2guNK8GOecPpS1vce2QHkbcIySDakbC5PvY9I2eDSC+cHU84fjHzcFiagKy8F
         6qSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BZC8tfHy3WSbpiqDLZ5c3lPSNjnKLmWgO/7ewjz5hi0=;
        b=bpB7cGYUAQer46RKtZesWrBqj1Xxo2mC/0CiLhyMfY1DO7ayDRWXtSIzzFXA+HdmXG
         gBTZIhGgY6/mC6cN9/lXtZBz7xI7Ty2wV1cK7fytmcu3BOqso/+dpEu+DXqWkvsGFCts
         58sax7M4ozM3oJh9ZlXQ6Hg0NTUOHBMPrpmtbknlNiaQIep+NNhemBh4L9YdsFYQBG+o
         ymxF3MjosORwwJO9uPWjNhbzO09++KOhi57rkZtq3uiPH0jGNGeZdaXy9qREMMxAp3nF
         7QWDtLFVhXxXsTyY/xr6fRlVH62YZo9Cr/FxhCkxlbDKBWm0TCrvUbehuZwdTEkKZptj
         WdLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B63RWs09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i141si4516957yba.596.2021.12.23.04.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:21:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B63RWs09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0N6C-00067z-Fs
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mmf-00067J-Lm
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 07:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mmc-0001cM-Du
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 07:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZC8tfHy3WSbpiqDLZ5c3lPSNjnKLmWgO/7ewjz5hi0=;
 b=B63RWs09/XfwppEy1C0ifKv2CgXTDlKWTkQdowQsYlQ3X0gP6K64AaHgK1FDslYoAiZHbZ
 vnhql6gWa8g+hklhlO+JKqq3l1hgzxt2gG+OWeZrUYtFvJ1kChRVIuWvho38cvHoejEFWQ
 4wAC/4l7cFFWKmVyYIkOxfGtdHRfklw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-UHujNoZEN46s8_4CAgCoiw-1; Thu, 23 Dec 2021 07:01:16 -0500
X-MC-Unique: UHujNoZEN46s8_4CAgCoiw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b83-20020a1c1b56000000b0033283ea5facso2080416wmb.1
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 04:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZC8tfHy3WSbpiqDLZ5c3lPSNjnKLmWgO/7ewjz5hi0=;
 b=8ByUQFLXsN5nk6ylOiCkezQBakrM7PFtzYtfMPrOSvAVIF9Nc4dKCTnxXL/tgwTapH
 I8Rw02eyJ0BpX6nZebCOhfOODQFTfW4EM5GtUQEssaKLnGLa4M/SqiPXYg2ZoaQhsV5P
 tgoQWu5zStoNxmyd9O4XbhDcHXklyE/tm5Ay0uqUBkAw9+to7CmixpdEANmqln275Q8j
 PkjUJJJ2cLwEpSZ3qD0ysSdDyzLpsajA5QwkA/krIIUDk3QkG+qN7S3Cf+xmFMLVYCre
 XSSqVvKbTaYsLv7lmlsbFyCDEvHP0is6Lrwf2+eK4xomn9fo3blE8Gb/W2orlVerC+6P
 wpMw==
X-Gm-Message-State: AOAM533Hu4mHJEHp0WsKJh/0sABg9MDHvtlu6nJ4emXTdn3jI+yMHSQ9
 iJrOqllg+cN6EuAxnX4c4lZYgcBU7pnjBpLBrHEGVdmdkFiiSNeT2FzffVpnkI6NRIdn69ah/40
 qSs5kCASSorjS
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr1626692wry.438.1640260875231; 
 Thu, 23 Dec 2021 04:01:15 -0800 (PST)
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr1626638wry.438.1640260874931; 
 Thu, 23 Dec 2021 04:01:14 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id l36sm9514934wms.16.2021.12.23.04.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 04:01:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] pci: Let ld*_pci_dma() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:54 +0100
Message-Id: <20211223115554.3155328-24-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yv0Dn0Qnxk02

ld*_dma() returns a MemTxResult type. Do not discard
it, return it to the caller.

Update the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 17 ++++++++---------
 hw/audio/intel-hda.c |  2 +-
 hw/net/eepro100.c    | 25 ++++++++++---------------
 hw/net/tulip.c       | 16 ++++++++--------
 hw/scsi/megasas.c    | 21 ++++++++++++---------
 hw/scsi/mptsas.c     | 16 +++++++++++-----
 hw/scsi/vmw_pvscsi.c | 16 ++++++++++------
 7 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c90cecc85c0..5b36334a28a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -850,15 +850,14 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                       DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
-#define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
-    static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
-                                                   dma_addr_t addr, \
-                                                   MemTxAttrs attrs) \
-    {                                                                   \
-        uint##_bits##_t val; \
-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
-        return val; \
-    }                                                                   \
+#define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
+    static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t *val, \
+                                               MemTxAttrs attrs) \
+    { \
+        return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
+    } \
     static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
                                                dma_addr_t addr, \
                                                uint##_bits##_t val, \
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index e34b7ab0e92..2b55d521503 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
         rp = (d->corb_rp + 1) & 0xff;
         addr = intel_hda_addr(d->corb_lbase, d->corb_ubase);
-        verb = ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UNSPECIFIED);
+        ldl_le_pci_dma(&d->pci, addr + 4 * rp, &verb, MEMTXATTRS_UNSPECIFIED);
         d->corb_rp = rp;
 
         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, verb);
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index eb82e9cb118..679f52f80f1 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -769,18 +769,16 @@ static void tx_command(EEPRO100State *s)
     } else {
         /* Flexible mode. */
         uint8_t tbd_count = 0;
+        uint32_t tx_buffer_address;
+        uint16_t tx_buffer_size;
+        uint16_t tx_buffer_el;
+
         if (s->has_extended_tcb_support && !(s->configuration[6] & BIT(4))) {
             /* Extended Flexible TCB. */
             for (; tbd_count < 2; tbd_count++) {
-                uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev,
-                                                            tbd_address,
-                                                            attrs);
-                uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev,
-                                                          tbd_address + 4,
-                                                          attrs);
-                uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev,
-                                                        tbd_address + 6,
-                                                        attrs);
+                ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attrs);
+                lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size, attrs);
+                lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, attrs);
                 tbd_address += 8;
                 TRACE(RXTX, logout
                     ("TBD (extended flexible mode): buffer address 0x%08x, size 0x%04x\n",
@@ -796,12 +794,9 @@ static void tx_command(EEPRO100State *s)
         }
         tbd_address = tbd_array;
         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
-            uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev, tbd_address,
-                                                        attrs);
-            uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev, tbd_address + 4,
-                                                      attrs);
-            uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6,
-                                                    attrs);
+            ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attrs);
+            lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size, attrs);
+            lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, attrs);
             tbd_address += 8;
             TRACE(RXTX, logout
                 ("TBD (flexible mode): buffer address 0x%08x, size 0x%04x\n",
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index c76e4868f73..d5b6cc5ee69 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -73,15 +73,15 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
     if (s->csr[0] & CSR0_DBO) {
-        desc->status = ldl_be_pci_dma(&s->dev, p, attrs);
-        desc->control = ldl_be_pci_dma(&s->dev, p + 4, attrs);
-        desc->buf_addr1 = ldl_be_pci_dma(&s->dev, p + 8, attrs);
-        desc->buf_addr2 = ldl_be_pci_dma(&s->dev, p + 12, attrs);
+        ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
+        ldl_be_pci_dma(&s->dev, p + 4, &desc->control, attrs);
+        ldl_be_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
+        ldl_be_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
     } else {
-        desc->status = ldl_le_pci_dma(&s->dev, p, attrs);
-        desc->control = ldl_le_pci_dma(&s->dev, p + 4, attrs);
-        desc->buf_addr1 = ldl_le_pci_dma(&s->dev, p + 8, attrs);
-        desc->buf_addr2 = ldl_le_pci_dma(&s->dev, p + 12, attrs);
+        ldl_le_pci_dma(&s->dev, p, &desc->status, attrs);
+        ldl_le_pci_dma(&s->dev, p + 4, &desc->control, attrs);
+        ldl_le_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
+        ldl_le_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
     }
 }
 
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index f93c34c4201..efcd8e3035e 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -202,9 +202,12 @@ static uint64_t megasas_frame_get_context(MegasasState *s,
                                           unsigned long frame)
 {
     PCIDevice *pci = &s->parent_obj;
-    return ldq_le_pci_dma(pci,
-                          frame + offsetof(struct mfi_frame_header, context),
-                          MEMTXATTRS_UNSPECIFIED);
+    uint64_t val;
+
+    ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, context),
+                   &val, MEMTXATTRS_UNSPECIFIED);
+
+    return val;
 }
 
 static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
@@ -536,8 +539,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
     s->busy++;
 
     if (s->consumer_pa) {
-        s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa,
-                                             MEMTXATTRS_UNSPECIFIED);
+        ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail,
+                       MEMTXATTRS_UNSPECIFIED);
     }
     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
                              s->reply_queue_head, s->reply_queue_tail, s->busy);
@@ -568,14 +571,14 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
                            context, attrs);
         }
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
+        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail, attrs);
         trace_megasas_qf_complete(context, s->reply_queue_head,
                                   s->reply_queue_tail, s->busy);
     }
 
     if (megasas_intr_enabled(s)) {
         /* Update reply queue pointer */
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
+        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail, attrs);
         tail = s->reply_queue_head;
         s->reply_queue_head = megasas_next_index(s, tail, s->fw_cmds);
         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
@@ -679,9 +682,9 @@ static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
     pa_lo = le32_to_cpu(initq->pi_addr_lo);
     pa_hi = le32_to_cpu(initq->pi_addr_hi);
     s->producer_pa = ((uint64_t) pa_hi << 32) | pa_lo;
-    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa, attrs);
+    ldl_le_pci_dma(pcid, s->producer_pa, &s->reply_queue_head, attrs);
     s->reply_queue_head %= MEGASAS_MAX_FRAMES;
-    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa, attrs);
+    ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail, attrs);
     s->reply_queue_tail %= MEGASAS_MAX_FRAMES;
     flags = le32_to_cpu(initq->flags);
     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index ac9f4dfcd2a..5181b0c0b0d 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -177,10 +177,16 @@ static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, uint32_t flags_and_length,
     dma_addr_t addr;
 
     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
-        addr = ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
+        uint64_t addr64;
+
+        ldq_le_pci_dma(pci, *sgaddr + 4, &addr64, attrs);
+        addr = addr64;
         *sgaddr += 12;
     } else {
-        addr = ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
+        uint32_t addr32;
+
+        ldl_le_pci_dma(pci, *sgaddr + 4, &addr32, attrs);
+        addr = addr32;
         *sgaddr += 8;
     }
     return addr;
@@ -204,7 +210,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
         dma_addr_t addr, len;
         uint32_t flags_and_length;
 
-        flags_and_length = ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_UNSPECIFIED);
+        ldl_le_pci_dma(pci, sgaddr, &flags_and_length, MEMTXATTRS_UNSPECIFIED);
         len = flags_and_length & MPI_SGE_LENGTH_MASK;
         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
             != MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
@@ -235,8 +241,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
                 break;
             }
 
-            flags_and_length = ldl_le_pci_dma(pci, next_chain_addr,
-                                              MEMTXATTRS_UNSPECIFIED);
+            ldl_le_pci_dma(pci, next_chain_addr, &flags_and_length,
+                           MEMTXATTRS_UNSPECIFIED);
             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
                 != MPI_SGE_FLAGS_CHAIN_ELEMENT) {
                 return MPI_IOCSTATUS_INVALID_SGL;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 33e16f91116..4d9969f3b16 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -50,10 +50,10 @@
 #define PVSCSI_MAX_CMD_DATA_WORDS \
     (sizeof(PVSCSICmdDescSetupRings)/sizeof(uint32_t))
 
-#define RS_GET_FIELD(m, field) \
-    (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+#define RS_GET_FIELD(pval, m, field) \
+    ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), \
-                 MEMTXATTRS_UNSPECIFIED))
+                 pval, MEMTXATTRS_UNSPECIFIED)
 #define RS_SET_FIELD(m, field, val) \
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val, \
@@ -249,10 +249,11 @@ pvscsi_ring_cleanup(PVSCSIRingInfo *mgr)
 static hwaddr
 pvscsi_ring_pop_req_descr(PVSCSIRingInfo *mgr)
 {
-    uint32_t ready_ptr = RS_GET_FIELD(mgr, reqProdIdx);
+    uint32_t ready_ptr;
     uint32_t ring_size = PVSCSI_MAX_NUM_PAGES_REQ_RING
                             * PVSCSI_MAX_NUM_REQ_ENTRIES_PER_PAGE;
 
+    RS_GET_FIELD(&ready_ptr, mgr, reqProdIdx);
     if (ready_ptr != mgr->consumed_ptr
         && ready_ptr - mgr->consumed_ptr < ring_size) {
         uint32_t next_ready_ptr =
@@ -323,8 +324,11 @@ pvscsi_ring_flush_cmp(PVSCSIRingInfo *mgr)
 static bool
 pvscsi_ring_msg_has_room(PVSCSIRingInfo *mgr)
 {
-    uint32_t prodIdx = RS_GET_FIELD(mgr, msgProdIdx);
-    uint32_t consIdx = RS_GET_FIELD(mgr, msgConsIdx);
+    uint32_t prodIdx;
+    uint32_t consIdx;
+
+    RS_GET_FIELD(&prodIdx, mgr, msgProdIdx);
+    RS_GET_FIELD(&consIdx, mgr, msgConsIdx);
 
     return (prodIdx - consIdx) < (mgr->msg_len_mask + 1);
 }
-- 
2.33.1

