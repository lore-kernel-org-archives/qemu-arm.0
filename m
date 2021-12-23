Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3323179lfb;
        Thu, 23 Dec 2021 04:20:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaQpQP8e+nP0/BTxWri8tcbcKQ9flsYzWtaWIZ81Kg9wivhSCLwwy0m2DI2KTZxBmF/ans
X-Received: by 2002:a25:7209:: with SMTP id n9mr2966661ybc.692.1640262000407;
        Thu, 23 Dec 2021 04:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640262000; cv=none;
        d=google.com; s=arc-20160816;
        b=kGdK/UnkhTaquvkVPvoFj8BrE8nSqqwykYTR/aoJdYBEyr/TJ9FV9nnUoR4+ZS4A+9
         WP6sEHdCbj6ISyGIW4++Sy4THT2Y0xVx28QeYrXNQQu1zbJ7IEPAbluXjD2JS8KSqTsM
         YJa0+7TAJ1glTxqULb9iduqW6vSym2pU9nWbBo+zfgkKockODGumaJfwoBQXXb5Osbuz
         Rwn7/W6Bql2lknamU31g0dS2uW71vlsVzrQZGX+LulLLJXMPoPjzPhAOEvnlzHpK/vQU
         AFKf8R80BZ7EIo/wmDpsWYkPE2jg4Fdc//xous8s2DUnLD9PCxlVZ0nz8bTkOZ3vauYw
         vcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oOieGHzt55TTLrMgE6y82ndRao5o7/HgB++E/ZPWN8c=;
        b=JdQeD/oCY/c+ITIw4yvYvKow9P+kO4QXQd13uOnIp+3Er1rpy1ElVyd68ZJELUyU+8
         wB01mGQM/uIvyITFaSwwH3AD8r9vRpJzMs3rI6XemVfC9nzJO6ROzOgkwc+DE5F+U8uj
         2z1Ba3mumzzNoMdW5fl1PMbBhxQ/ym5mLqDE0kGueVFtvp+wWfqVtqhAIOszrQn7coXN
         jzm6WlFxMRKj8olV09uAwHeTKAPketbs/ZExI2GJo6OCtNp8nQLVzBlVF4huThr8Iid+
         BmhgMMJMKrSuYdW64EThh7hrWmNLE4sma7dp1PIVLa6nAGg3vL/D1mH6KxYYqsxHuGXq
         HwAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EKSjXu0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si5239521ybg.337.2021.12.23.04.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:20:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EKSjXu0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0N4h-00036P-Q8
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mlo-0004o0-25
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 07:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mlh-0001Lb-VW
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 07:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOieGHzt55TTLrMgE6y82ndRao5o7/HgB++E/ZPWN8c=;
 b=EKSjXu0QeGv4YzU7mCLzsDXkOIGWDTZpoFcYKvkxpeElbGU7vJV70yiELo1ZA7hcGE6fTO
 EhwKywe+9EVMV8DvTGh47WXLHgLkgzkFXh3HhOtHysPU9+BFhYCv7m2JaACB4t7YKeIbcc
 DhJecQXWlhmnyASejYWBmCR4j4gOgOY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-6KlzspMTPwqRNiJAje1Y_g-1; Thu, 23 Dec 2021 07:00:20 -0500
X-MC-Unique: 6KlzspMTPwqRNiJAje1Y_g-1
Received: by mail-wr1-f71.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso1213506wra.18
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 04:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOieGHzt55TTLrMgE6y82ndRao5o7/HgB++E/ZPWN8c=;
 b=l+67cQIWUpIBhzKu/6UCjCcnvDkvLEH9wFb4nktqmhfJcK3hR3lk9WI1q2BG+HLK+k
 +6zSVCVBIUnAUP3HGXczLaSYRAsu0vqD+RuqhdD6BwzaM7aPyaNQi5p6huolTfddy1ml
 AEiZKrNgD9S+99kkekSrW5889MlAuSY98Hn4XNMJdzkjMlb+2Uf9h3hMRfwaUgBdHCou
 tnz3JdLpNsUhp0xZHJHX/TGRI4eN3aBNXIpkCHADWYpG/A8zXz/0DQayCCby3HCuPb95
 IW3xO3FteFZEOZw2VBT3jdy5uLeVG2juoy2O53THlTk07+rbNQTA/hnD17RK7YR7shh/
 CNfw==
X-Gm-Message-State: AOAM530/0iYcaBOCUPzgxJoegN4XFFzlmG861djP3m+A9LPk82jbfVCv
 o6TmX4fRVhynbIJ5L5fUhTOQWHYlh9GLrN117UBGS18Igm39F+/Ktsx6nRwXAcFKgO0Pc2/tzQ2
 Y8S0zUrRocWH7
X-Received: by 2002:adf:dc12:: with SMTP id t18mr1594640wri.566.1640260818905; 
 Thu, 23 Dec 2021 04:00:18 -0800 (PST)
X-Received: by 2002:adf:dc12:: with SMTP id t18mr1594625wri.566.1640260818723; 
 Thu, 23 Dec 2021 04:00:18 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id s189sm9632538wme.0.2021.12.23.04.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 04:00:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] hw/scsi/megasas: Use uint32_t for reply queue
 head/tail values
Date: Thu, 23 Dec 2021 12:55:50 +0100
Message-Id: <20211223115554.3155328-20-philmd@redhat.com>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: K6JMSSYNNpku

While the reply queue values fit in 16-bit, they are accessed
as 32-bit:

  661:    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
  662:    s->reply_queue_head %= MEGASAS_MAX_FRAMES;
  663:    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
  664:    s->reply_queue_tail %= MEGASAS_MAX_FRAMES;

Having:

  41:#define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 65535 */

In order to update the ld/st*_pci_dma() API to pass the address
of the value to access, it is simpler to have the head/tail declared
as 32-bit values. Replace the uint16_t by uint32_t, wasting 4 bytes in
the MegasasState structure.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/megasas.c    | 4 ++--
 hw/scsi/trace-events | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 87101705d01..266c3d38003 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -109,8 +109,8 @@ struct MegasasState {
     uint64_t reply_queue_pa;
     void *reply_queue;
     uint16_t reply_queue_len;
-    uint16_t reply_queue_head;
-    uint16_t reply_queue_tail;
+    uint32_t reply_queue_head;
+    uint32_t reply_queue_tail;
     uint64_t consumer_pa;
     uint64_t producer_pa;
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 92d5b40f892..ae8551f2797 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -42,18 +42,18 @@ mptsas_config_sas_phy(void *dev, int address, int port, int phy_handle, int dev_
 
 # megasas.c
 megasas_init_firmware(uint64_t pa) "pa 0x%" PRIx64 " "
-megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, uint64_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx64 " tail 0x%" PRIx64 " flags 0x%x"
+megasas_init_queue(uint64_t queue_pa, int queue_len, uint32_t head, uint32_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx32 " tail 0x%" PRIx32 " flags 0x%x"
 megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
 megasas_initq_mapped(uint64_t pa) "queue already mapped at 0x%" PRIx64
 megasas_initq_mismatch(int queue_len, int fw_cmds) "queue size %d max fw cmds %d"
 megasas_qf_mapped(unsigned int index) "skip mapped frame 0x%x"
 megasas_qf_new(unsigned int index, uint64_t frame) "frame 0x%x addr 0x%" PRIx64
 megasas_qf_busy(unsigned long pa) "all frames busy for frame 0x%lx"
-megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, unsigned int head, unsigned int tail, int busy) "frame 0x%x count %d context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
-megasas_qf_update(unsigned int head, unsigned int tail, unsigned int busy) "head 0x%x tail 0x%x busy %d"
+megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, uint32_t head, uint32_t tail, unsigned int busy) "frame 0x%x count %d context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
+megasas_qf_update(uint32_t head, uint32_t tail, unsigned int busy) "head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
 megasas_qf_map_failed(int cmd, unsigned long frame) "scmd %d: frame %lu"
 megasas_qf_complete_noirq(uint64_t context) "context 0x%" PRIx64 " "
-megasas_qf_complete(uint64_t context, unsigned int head, unsigned int tail, int busy) "context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
+megasas_qf_complete(uint64_t context, uint32_t head, uint32_t tail, int busy) "context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
 megasas_frame_busy(uint64_t addr) "frame 0x%" PRIx64 " busy"
 megasas_unhandled_frame_cmd(int cmd, uint8_t frame_cmd) "scmd %d: MFI cmd 0x%x"
 megasas_handle_scsi(const char *frame, int bus, int dev, int lun, void *sdev, unsigned long size) "%s dev %x/%x/%x sdev %p xfer %lu"
-- 
2.33.1

