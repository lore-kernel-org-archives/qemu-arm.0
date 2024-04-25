Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1385024ejb;
        Thu, 25 Apr 2024 06:42:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXI2izSHUrbSfA+eaKQvWA49SfFIgrTK4yA2pWsdvodVi8vd4BLxVnWns43Y10M4mr+q1W8fs/pV3x4aaGHK5/MtB/vD5k
X-Google-Smtp-Source: AGHT+IFe0bZRKWLjo3TTOgxqyosZtyZvtGHdnreNdwDwCb36Xxgsu6HQ22y1T6x8UXIXj3C1RjRs
X-Received: by 2002:ae9:c214:0:b0:790:9974:733b with SMTP id j20-20020ae9c214000000b007909974733bmr2599166qkg.35.1714052535200;
        Thu, 25 Apr 2024 06:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714052535; cv=none;
        d=google.com; s=arc-20160816;
        b=n7uFi1AqzYBdS/FkyUrVZnVePIULqgPjROxiY2VA5QXKK87eJ220CRKEBzmo5lZX97
         qD8SBzofH/z+XaPzCSfQJPi8Yr7l5GD2kSMvcdqjgFEuXSwleUA1OT4q1S/At0CnPjdx
         8X7Qupbb/C8DCp1gVOUBhRGRt5JQ/BTAW2qy6Az5mzb+WhgTEdRsUZX9xi1XZA7NVVZ5
         hU9Qfrvry4b0X+88pnSrpdL1HWQV2hTm+TK2zoVd2jQvRUFUF2xT0n7G/mMY5u4VyoCu
         apfNtD/HJ7OgK0NOMux9uNMpbIMD6lwZJL0FMNPVNe2mIuRLfjcrg546oB7/3IgfHtOK
         QMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=wGqamm0njMPhI8+Tq71xbmUqMKt7vC6zpEzbOg2JT0c=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=lk8CDr5vigTcUDAWoM6aBmBCvEb6kpBiGN0N214GyykibK8UEpFiMJB+7rC74mYtf7
         n8SlC1lCLiVtFtHloyKAN9IBZSKS1AkNmps6j5xxlE1XEufH+BFU9eHq2WczMCmKHWFg
         MPN4MO+RyX8RvicUlGNQ/60s9GB19JmqqPxm3BGnvTgr1c8fRGIvfnzr4PGc3L49Tu6/
         lJRP6k+4xRXPT05O2fei0Qcm7lNO5rj6VxpfVGY45j2u7MQNYpsF1+hTDjtPqRDobkKv
         ABQfstyfjA6kdCKXZrZwOpGsDmk+vU0IvicXZtUWVwdExwC4BC/3fJZk92aTzBq7g8B9
         +jZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020ae9c002000000b0078ebc07c4besi17219043qkk.661.2024.04.25.06.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 06:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzzMR-0004US-1C; Thu, 25 Apr 2024 09:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzzMO-0004U8-65; Thu, 25 Apr 2024 09:42:00 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzzML-00015C-Ml; Thu, 25 Apr 2024 09:41:59 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.232.172])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VQH894WV8zyWj;
 Thu, 25 Apr 2024 16:41:45 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH v3] fix endianness bug
Date: Thu, 25 Apr 2024 16:41:15 +0300
Message-Id: <20240425134115.32057-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <074c9cbb-939e-4fb1-87a9-235626bf3a94@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeefkedufedvkeffuedtgfdugeeutdegvdffffejfffgleffieduhfejvdelffdvudenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefvddrudejvdenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfedvrddujedvmeefkeeljeeipdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtth
 hopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12631002,
 Updated: 2024-Apr-25 11:41:39 UTC]
Received-SPF: pass client-ip=51.250.53.244;
 envelope-from=adiupina@astralinux.ru; helo=new-mail.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xn3tO4x/VP9j

Add xlnx_dpdma_read_descriptor() and
xlnx_dpdma_write_descriptor() functions.
xlnx_dpdma_read_descriptor() combines reading a
descriptor from desc_addr by calling dma_memory_read()
and swapping the desc fields from guest memory order
to host memory order. xlnx_dpdma_write_descriptor()
performs similar actions when writing a descriptor.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d3c6369a96 ("introduce xlnx-dpdma")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
v3: add xlnx_dpdma_write_descriptor()
v2: minor changes in xlnx_dpdma_read_descriptor()
 hw/dma/xlnx_dpdma.c | 59 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index dd66be5265..7845f43221 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -614,6 +614,59 @@ static void xlnx_dpdma_register_types(void)
     type_register_static(&xlnx_dpdma_info);
 }
 
+static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
+                                    uint64_t desc_addr, DPDMADescriptor *desc)
+{
+    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
+                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED))
+        return MEMTX_ERROR;
+
+    /* Convert from LE into host endianness.  */
+    desc->control = le32_to_cpu(desc->control);
+    desc->descriptor_id = le32_to_cpu(desc->descriptor_id);
+    desc->xfer_size = le32_to_cpu(desc->xfer_size);
+    desc->line_size_stride = le32_to_cpu(desc->line_size_stride);
+    desc->timestamp_lsb = le32_to_cpu(desc->timestamp_lsb);
+    desc->timestamp_msb = le32_to_cpu(desc->timestamp_msb);
+    desc->address_extension = le32_to_cpu(desc->address_extension);
+    desc->next_descriptor = le32_to_cpu(desc->next_descriptor);
+    desc->source_address = le32_to_cpu(desc->source_address);
+    desc->address_extension_23 = le32_to_cpu(desc->address_extension_23);
+    desc->address_extension_45 = le32_to_cpu(desc->address_extension_45);
+    desc->source_address2 = le32_to_cpu(desc->source_address2);
+    desc->source_address3 = le32_to_cpu(desc->source_address3);
+    desc->source_address4 = le32_to_cpu(desc->source_address4);
+    desc->source_address5 = le32_to_cpu(desc->source_address5);
+    desc->crc = le32_to_cpu(desc->crc);
+
+    return MEMTX_OK;
+}
+
+static void xlnx_dpdma_write_descriptor(uint64_t desc_addr,
+                                                DPDMADescriptor *desc)
+{
+    /* Convert from host endianness into LE.  */
+    desc->control = cpu_to_le32(desc->control);
+    desc->descriptor_id = cpu_to_le32(desc->descriptor_id);
+    desc->xfer_size = cpu_to_le32(desc->xfer_size);
+    desc->line_size_stride = cpu_to_le32(desc->line_size_stride);
+    desc->timestamp_lsb = cpu_to_le32(desc->timestamp_lsb);
+    desc->timestamp_msb = cpu_to_le32(desc->timestamp_msb);
+    desc->address_extension = cpu_to_le32(desc->address_extension);
+    desc->next_descriptor = cpu_to_le32(desc->next_descriptor);
+    desc->source_address = cpu_to_le32(desc->source_address);
+    desc->address_extension_23 = cpu_to_le32(desc->address_extension_23);
+    desc->address_extension_45 = cpu_to_le32(desc->address_extension_45);
+    desc->source_address2 = cpu_to_le32(desc->source_address2);
+    desc->source_address3 = cpu_to_le32(desc->source_address3);
+    desc->source_address4 = cpu_to_le32(desc->source_address4);
+    desc->source_address5 = cpu_to_le32(desc->source_address5);
+    desc->crc = cpu_to_le32(desc->crc);
+
+    dma_memory_write(&address_space_memory, desc_addr, &desc,
+                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
+}
+
 size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
                                     bool one_desc)
 {
@@ -651,8 +704,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             desc_addr = xlnx_dpdma_descriptor_next_address(s, channel);
         }
 
-        if (dma_memory_read(&address_space_memory, desc_addr, &desc,
-                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
+        if (xlnx_dpdma_read_descriptor(s, desc_addr, &desc)) {
             s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
             xlnx_dpdma_update_irq(s);
             s->operation_finished[channel] = true;
@@ -755,8 +807,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             /* The descriptor need to be updated when it's completed. */
             DPRINTF("update the descriptor with the done flag set.\n");
             xlnx_dpdma_desc_set_done(&desc);
-            dma_memory_write(&address_space_memory, desc_addr, &desc,
-                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
+            xlnx_dpdma_write_descriptor(desc_addr, &desc);
         }
 
         if (xlnx_dpdma_desc_completion_interrupt(&desc)) {
-- 
2.30.2

