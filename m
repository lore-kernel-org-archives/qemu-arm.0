Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3320253lfb;
        Thu, 23 Dec 2021 04:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9+b6AFbginOVcSgcWnghRKwGLzDQwQVnLKAmN8wXfnl8pWY6JJghXG7iXfRP8KboUDfaK
X-Received: by 2002:a92:2a0e:: with SMTP id r14mr825190ile.175.1640261687215;
        Thu, 23 Dec 2021 04:14:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640261687; cv=none;
        d=google.com; s=arc-20160816;
        b=fmOJW2oZHdzHI3Me3IKSa13ujJ37UnYAPMDy9bI076ioB8HqdZasLAyAXXTqnuZ1vB
         MBmsF7cy2DnClchw9UFx65azUN36/M3I4lf2ZVWDOGPjyEhsUiw2Tp2tVyJaz8A+2TXO
         OxREZjFoBOIeb/VZbUnNRP/uSJ7xPwOw0hrnXBfRaAohJGgBMwO9wzrFWhGgi7oO4mBW
         m3q0ubunbLGpvT/ZeNFFPn6wIbmHKor7R1G0aApb5XrRSJLgG0gSK9KX7jeIMeK2XX8i
         vidXK6YcvwcsYveRO1hesucNGH+5kMpHhmMBCn3/wskF2v1/CFC1yQiyFXxnPgxj3FA8
         35qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/EYBW+febHIYQTHlOkEync8IzdNbwI6kyRotYTo3Vg0=;
        b=Qw1pwTnB6llygrkG0pxrO5IouPnxDrb4400nB25ccecIAm9mLTHTByayOxz4tJtWSo
         Lpd/AzVuYCpgOtne0YS8QEICPd95QXJFhKVW3aBp0E4VaXoPWJPQpglI5bO+hN3g6zc/
         gt8G7q+WU1mdaZKTOINsiYu5xsx9GZWNQsBp1IpGYer5QzaMa1xeUg0dt+LqVm9xh8CK
         w1ldIJsTZn1NbW4RC924/5aVOX4v3t5LO0AgyVY0M0jzPexV47vhrhtTYRZRKgjvyT4/
         l5jUT/aOvOQU01g2xSVsupBCbFJY5ksPB9XIRLK+b36HH+WTz4JAQdFGjKZPnMHbOAZL
         Pa3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hNf9z1PG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si2982130ilu.135.2021.12.23.04.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:14:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hNf9z1PG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0Mze-0001Ou-IT
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:14:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mkp-000353-G6
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mkl-00015x-F4
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EYBW+febHIYQTHlOkEync8IzdNbwI6kyRotYTo3Vg0=;
 b=hNf9z1PGt2xK+H5vMcHTdR9t2ZdySB/FT1X6CmfBsksjwI1wPeEOTyknnQ+83hIIjLyi/s
 dqb1Rg1QxqXtfC+CEtiroWy6Sm8dJwedY8ytOU7uO6LjjvN4B2mUHjvGcu/0jJj15iOIQA
 EEm42FAdzjDQeElB2d3VhpdJ0cjk2Rg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-6h223W2bMnKRh_obLw7TIw-1; Thu, 23 Dec 2021 06:59:14 -0500
X-MC-Unique: 6h223W2bMnKRh_obLw7TIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so1927907wma.8
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/EYBW+febHIYQTHlOkEync8IzdNbwI6kyRotYTo3Vg0=;
 b=gdONxYCmZQf1jFANQrPQxHv8XIT+7EpzPqpoapPAxFH36dy+iqvVHzanOyJZ70EasI
 l16DXIU0rifhiyCSsVF3EmxB6AxEd8fTQQuXVVyINKmlbQtnKtzKJYn9OVOKowkNo+8Z
 znlA3sD79iHpFw1jJUUNq748K1bhl/FYDArYIoTA2+V+6++9XA8vYX1kNQVuaveVrE0y
 aXF5iQ9qeGT5UYZPtFNuwy05IW4jb4aM149NiDEu20ZH1cg3bJl7Zxq4wU5W0Xjr3LY9
 7wncYJ6Emr5qMyvAVA0ozORa+MGh667GTzDhMtHnAvpqnla4803c+tu1KPjVYC9gqWDF
 mQGg==
X-Gm-Message-State: AOAM530jPa3Xmseovb6Phi1pzQLZ6oB9dq7/IQR3aUIqbPaP48dYzL/L
 K9z60IWK76a42Oj6Lh9XzKejLacgwgD4xuoJXzu11blW9XgUrsI7CrJ/oaRrIRzJMZ42Y/uBuXP
 Yvrc02DT+fxNG
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr1535565wrs.276.1640260752682; 
 Thu, 23 Dec 2021 03:59:12 -0800 (PST)
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr1535541wrs.276.1640260752403; 
 Thu, 23 Dec 2021 03:59:12 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id h204sm4790919wmh.33.2021.12.23.03.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/23] dma: Let dma_buf_read() / dma_buf_write() propagate
 MemTxResult
Date: Thu, 23 Dec 2021 12:55:45 +0100
Message-Id: <20211223115554.3155328-15-philmd@redhat.com>
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
X-TUID: aDv2N0wSDUOB

Since the previous commit, dma_buf_rw() returns a MemTxResult
type. Do not discard it, return it to the caller.

Since both dma_buf_read/dma_buf_write functions were previously
returning the QEMUSGList size not consumed, add an extra argument
where the unconsummed size can be stored.

Update the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h  |  6 ++++--
 hw/ide/ahci.c         |  8 ++++----
 hw/nvme/ctrl.c        |  4 ++--
 hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------
 hw/scsi/scsi-bus.c    |  4 ++--
 softmmu/dma-helpers.c | 18 ++++++----------
 6 files changed, 52 insertions(+), 36 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index fd8f16003dd..d11c1d794f9 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -302,8 +302,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
+MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
+                         QEMUSGList *sg, MemTxAttrs attrs);
+MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
+                          QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 205dfdc6622..0c7d31ceada 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1384,9 +1384,9 @@ static void ahci_pio_transfer(const IDEDMA *dma)
         const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
         if (is_write) {
-            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
+            dma_buf_write(s->data_ptr, size, NULL, &s->sg, attrs);
         } else {
-            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
+            dma_buf_read(s->data_ptr, size, NULL, &s->sg, attrs);
         }
     }
 
@@ -1479,9 +1479,9 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     }
 
     if (is_write) {
-        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_read(p, l, NULL, &s->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
-        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_write(p, l, NULL, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
 
     /* free sglist, update byte count */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 462f79a1f60..fa410a179a6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1150,9 +1150,9 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
         uint64_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
+            dma_buf_write(ptr, len, &residual, &sg->qsg, attrs);
         } else {
-            residual = dma_buf_read(ptr, len, &sg->qsg, attrs);
+            dma_buf_read(ptr, len, &residual, &sg->qsg, attrs);
         }
 
         if (unlikely(residual)) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index fe36de10a21..87101705d01 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -738,6 +738,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
     int num_pd_disks = 0;
+    uint64_t resid;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -848,7 +849,8 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -856,6 +858,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_defaults info;
     size_t dcmd_size = sizeof(struct mfi_defaults);
+    uint64_t resid;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -878,7 +881,8 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -886,6 +890,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_bios_data info;
     size_t dcmd_size = sizeof(info);
+    uint64_t resid;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -899,7 +904,8 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -907,10 +913,12 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 {
     uint64_t fw_time;
     size_t dcmd_size = sizeof(fw_time);
+    uint64_t resid;
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&fw_time, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -930,6 +938,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_evt_log_state info;
     size_t dcmd_size = sizeof(info);
+    uint64_t resid;
 
     memset(&info, 0, dcmd_size);
 
@@ -937,7 +946,8 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -967,6 +977,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
     uint32_t offset, dcmd_limit, num_pd_disks = 0, max_pd_disks;
+    uint64_t resid;
 
     memset(&info, 0, dcmd_size);
     offset = 8;
@@ -1006,7 +1017,8 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, offset, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -1100,7 +1112,9 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(cmd->iov_buf, dcmd_size, &resid, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - resid;
     cmd->iov_buf = NULL;
@@ -1172,7 +1186,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1221,7 +1235,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1232,9 +1246,10 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     struct mfi_ld_info *info = cmd->iov_buf;
     size_t dcmd_size = sizeof(struct mfi_ld_info);
     uint8_t cdb[6];
-    ssize_t len, resid;
+    ssize_t len;
     uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint64_t ld_size;
+    uint64_t resid;
 
     if (!cmd->iov_buf) {
         cmd->iov_buf = g_malloc0(dcmd_size);
@@ -1271,7 +1286,8 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(cmd->iov_buf, dcmd_size, &resid, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - resid;
     cmd->iov_buf = NULL;
@@ -1316,6 +1332,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
     struct mfi_config_data *info;
     int num_pd_disks = 0, array_offset, ld_offset;
     BusChild *kid;
+    uint64_t resid;
 
     if (cmd->iov_size > 4096) {
         return MFI_STAT_INVALID_PARAMETER;
@@ -1390,7 +1407,8 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(data, info->size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -1398,6 +1416,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ctrl_props info;
     size_t dcmd_size = sizeof(info);
+    uint64_t resid;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -1420,7 +1439,8 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &resid, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= resid;
     return MFI_STAT_OK;
 }
 
@@ -1465,7 +1485,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_write(&info, dcmd_size, NULL, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 2b5e9dca311..34cf41796bb 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1421,9 +1421,9 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->resid = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_read(buf, len, &req->resid, req->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
-        req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_write(buf, len, &req->resid, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index b0be1564797..498303157e9 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -321,22 +321,16 @@ static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
     return res;
 }
 
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
+                         QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t resid;
-
-    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
-
-    return resid;
+    return dma_buf_rw(ptr, len, residp, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
+                          QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t resid;
-
-    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
-
-    return resid;
+    return dma_buf_rw(ptr, len, residp, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1

