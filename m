Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3323860lfb;
        Thu, 23 Dec 2021 04:21:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOLqa+f93Xt4zYK5kL1GpCaA3prOolPa3NUXx00irTaV6h1fM+/w+G5DIRg4/89KhgGqij
X-Received: by 2002:a25:a449:: with SMTP id f67mr2804973ybi.368.1640262075202;
        Thu, 23 Dec 2021 04:21:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640262075; cv=none;
        d=google.com; s=arc-20160816;
        b=nPO4VsLuSsfqjZEWhL7MbkY5vhuk1H8IqrfPg52OdoAcA26RZVuSKaQu0v1XbUGVHD
         HV62PxDAWpbqFz84BN7YshgrIorTkZyK6ZlhLVVTvpUj/NdpUaBYGUo+M/UYvJ6JnbWv
         Ve/1wAmq3QstOnXzDIB2cP0mVTlkN+Dv29/FicdbzA+UnUtodmZExMuNxoqEl/vt/hwt
         u43iv7T2GZLhhSWjAOgA24Vjd72P8xs6Wqx1UCmtwgbfR8wqvxU49J/KQSIyy7Vf1d/2
         quyGJDfP0yl5GJ2xaWBXqUi9V8JQRCWaA5/P+C9T4HLTDDy7x+1vEJiN2hNH58RUoYY3
         e33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gjVcgLU0BnvWgwNGKBTyX6uz4VKITDXHkj90FQKH/Ds=;
        b=x5yF4++Dn3OCz/ExZYe4SbxEKgIgyuys/rQEVAeLLDccGT8judySldEW8Utpd4tTuN
         yL3DI9bpkuujuDp4dHLzS7gA5YA3oiUN9Fo1AWJ3pulGL+XZk5jB2pI5e8htCoRYfXMr
         xGRtyOs8PIBAejtrQ4V6ocieDrLljWZFv1OYmAX7sBCa8Vgk/J+M/PCZEfFErS+O7qem
         m9/XFoZa51XWG1z9uSDwEuIeFxq86GiUnmZ8109r/nBGyId9HApNTXk+Wt3bQ9AXozu5
         FdFT8sLiKLUxLaIkjdemcp0sj61+1k29X6lrKvMCeokcCjc3du3ogrmlmBZfLj7rtMIQ
         OO7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0qoaVkz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r201si5172914ybc.394.2021.12.23.04.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:21:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b0qoaVkz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0N5u-0005Qc-JG
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mk8-0001gq-IR
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mk6-0000ub-Dr
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjVcgLU0BnvWgwNGKBTyX6uz4VKITDXHkj90FQKH/Ds=;
 b=b0qoaVkz3L7YKfi58A+6Ch8J0A3IP0bkvEjogTiDDADsd6Fnk8SouZnb6Zdqhz5w3CCBm0
 mHPy1cul/SnAbjjR1gtds5HyEcw/MxlyXDm5TuTJKHxhx91FiwnlzTT/W18Vc5FyHQzO5+
 T/SKACQopDASr11PaCK26kUtfFhi6DU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-r8nb__EJMPCR_g8hv6PtWA-1; Thu, 23 Dec 2021 06:58:40 -0500
X-MC-Unique: r8nb__EJMPCR_g8hv6PtWA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so1218760wra.19
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjVcgLU0BnvWgwNGKBTyX6uz4VKITDXHkj90FQKH/Ds=;
 b=38pITSbqTvqxEXkhGt5SWZYVl4QrbvbLB4Q7539eY4ZXqLhU0/oVsqzGk+SukBXiY8
 3j8aVplcVPfixV4w6mGpTXWQ2YFpBZGfMwA5tPtkv+tfUkumKttF5XD04mWycmL5jQJP
 HZo3titmyRO970Prhmv1fPW57EZeBP/5AypnDJZdSDS2usE5+AUTyKuKdqG3S5BqZCqV
 XZTs5XX1+LIL5O8NXnDDSsqqVGPZ8E3Il3Wxwt50Dnqb6Z5f4HwGwjoPp8WEhrleMk1Q
 fLQIQua1X40E5vqTz6HYmvyv1uv5VpSpyfNl/4KlVuUPpQ+tSN9CGrlgo2FbhSBhG72R
 qHqw==
X-Gm-Message-State: AOAM530TporrF1EIE96ROMJptRBOlJulLPZdS49zBsSpRHxcHgNfarLn
 HUFoGGSkB2Ppdnpn4mS4GHDKSFx6GmY1cSRq3I62VA1I7U62iM33PTfoR1m7VUINZcFrYGg6Ygp
 +leZ81JuLkFku
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1503526wru.12.1640260718872;
 Thu, 23 Dec 2021 03:58:38 -0800 (PST)
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1503479wru.12.1640260718678;
 Thu, 23 Dec 2021 03:58:38 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id bd8sm4281783wmb.44.2021.12.23.03.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:58:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/23] dma: Let dma_buf_write() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:42 +0100
Message-Id: <20211223115554.3155328-12-philmd@redhat.com>
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
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lc8Hcx3byUd2

Let devices specify transaction attributes when calling
dma_buf_write().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h  | 2 +-
 hw/ide/ahci.c         | 6 ++++--
 hw/nvme/ctrl.c        | 3 ++-
 hw/scsi/megasas.c     | 2 +-
 hw/scsi/scsi-bus.c    | 2 +-
 softmmu/dma-helpers.c | 5 ++---
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 0d5b836013d..e3dd74a9c4f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -303,7 +303,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 8e77ddb660f..079d2977f23 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1381,8 +1381,10 @@ static void ahci_pio_transfer(const IDEDMA *dma)
                             has_sglist ? "" : "o");
 
     if (has_sglist && size) {
+        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
         if (is_write) {
-            dma_buf_write(s->data_ptr, size, &s->sg);
+            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
         } else {
             dma_buf_read(s->data_ptr, size, &s->sg);
         }
@@ -1479,7 +1481,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     if (is_write) {
         dma_buf_read(p, l, &s->sg);
     } else {
-        dma_buf_write(p, l, &s->sg);
+        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
 
     /* free sglist, update byte count */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3..e1a531d5d6c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1146,10 +1146,11 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     assert(sg->flags & NVME_SG_ALLOC);
 
     if (sg->flags & NVME_SG_DMA) {
+        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
         uint64_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &sg->qsg);
+            residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
         } else {
             residual = dma_buf_read(ptr, len, &sg->qsg);
         }
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index dc28302f96d..da1c88167ee 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write(&info, dcmd_size, &cmd->qsg);
+    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 77325d8cc7a..64a506a3975 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1423,7 +1423,7 @@ void scsi_req_data(SCSIRequest *req, int len)
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
         req->resid = dma_buf_read(buf, len, req->sg);
     } else {
-        req->resid = dma_buf_write(buf, len, req->sg);
+        req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index fa81d2b386c..2f1a241b81a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -322,10 +322,9 @@ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
                       MEMTXATTRS_UNSPECIFIED);
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
-                      MEMTXATTRS_UNSPECIFIED);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1

