Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1216046ejy;
        Thu, 2 May 2024 07:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxMWRB5l16k067KsJefJq+whKtSys6PPtKrUZ1Bp3NBEV6GX7mYrBQt4XvyVvhAxHyzJKjc2vzHYoA//rXYdEbUPiN3ghz
X-Google-Smtp-Source: AGHT+IHM7dwZOWzkMqyaAGxANHopMua94BoZD6ZxNlu7pVZcOJOXCrUi+GXR18QmQywQbgMBTUcW
X-Received: by 2002:a05:6808:8d8:b0:3c6:d99:41e9 with SMTP id k24-20020a05680808d800b003c60d9941e9mr6466073oij.38.1714659465019;
        Thu, 02 May 2024 07:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714659464; cv=none;
        d=google.com; s=arc-20160816;
        b=Z88EQ4MnuMbbYM1ch7B69lsOMXJJdHjWYkNyvm2UCNlrzDbv4zl8PqYeCuQ4UUSBoC
         epgl4DXoWqpiIe302TtttPRDEFrFNOEqWEkXjZV1cnF51sAR03dLAgQVeo9EPttia9zn
         x96VPcdsHfmMMYR75aNYfzxaFzneY+3Wzuyul5FvAjVzu9rww9UL+e4F0M6MoINyMXhr
         0hF6SFWieg0a0HQD/A1npF6qLTYIl9QmOSTLSvxI380Z4v/xrSYl2AZ8se9OHrlYHEJS
         6oMXcvxUqNQLxqmZL0iizxNz20cw/h2VBtqp2UYcSC9ebTf8aVLUO7JHIgIJDrkH0NzG
         ZeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=QQhCd6TB3bv0Dadliv/SsXe0dKxIU48vwgSftt+edzI=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=bdQ9hhgcunjQm2KwHjpOJoUmTKc79O4g027flIDsxnYwaMq6Vdp0ADRcBOJWH4uXOT
         9a/6JxQnlE3cl/Fa4iJrsrvVD/5T2pZanyOitN+D+gFPuutmGSAYrwAmDq+UZmO8ZMOa
         sype0tFI4vU0+jjeHTiiwfGohvFxRy7VM1jSjeqfp164mmfHCAy4EIRXrRmjLPzvjnLl
         rH4i1B2S05Zzbg9qvJlK/MmSitPhahrilSSSOR5FGkGzVo4x44wVNk8oGNc9SkeZFH0r
         OwwvdOPeCRgBHfeaSdBRyndn4D68GMaYGB5MeiEuA0w3HluPbRt+eBn8+Rwg0EHnf/g5
         e0xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id is23-20020a0561026a9700b0047c544d8936si171650vsb.500.2024.05.02.07.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 07:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2XFK-0002uy-R3; Thu, 02 May 2024 10:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1s2XFG-0002uG-Ck; Thu, 02 May 2024 10:17:10 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1s2XFB-0007KH-OS; Thu, 02 May 2024 10:17:09 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.234.226])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VVbbQ6mlnzlVth;
 Thu,  2 May 2024 17:16:50 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH v5] xlnx_dpdma: fix descriptor endianness bug
Date: Thu,  2 May 2024 17:16:28 +0300
Message-Id: <20240502141628.28103-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87y18u3hjf.fsf@draig.linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeefkedufedvkeffuedtgfdugeeutdegvdffffejfffgleffieduhfejvdelffdvudenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefgedrvddvieenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfeegrddvvdeimeegudehfeegpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtth
 hopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12656802,
 Updated: 2024-May-02 12:36:40 UTC]
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
X-TUID: c12pI8VTIO/6

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
v5: fix subject and make xlnx_dpdma_write_descriptor() not void
v4: remove rewriting desc in place
v3: add xlnx_dpdma_write_descriptor()
v2: minor changes in xlnx_dpdma_read_descriptor()
 hw/dma/xlnx_dpdma.c | 66 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 1f5cd64ed1..f582c1a085 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -614,6 +614,63 @@ static void xlnx_dpdma_register_types(void)
     type_register_static(&xlnx_dpdma_info);
 }
 
+static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
+                                    uint64_t desc_addr, DPDMADescriptor *desc)
+{
+    MemTxResult res = dma_memory_read(&address_space_memory, desc_addr,
+                &desc, sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
+    if (res) {
+        return res;
+    }
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
+    return res;
+}
+
+static MemTxResult xlnx_dpdma_write_descriptor(uint64_t desc_addr,
+                                                DPDMADescriptor *desc)
+{
+    DPDMADescriptor tmp_desc = *desc;
+
+    /* Convert from host endianness into LE.  */
+    tmp_desc.control = cpu_to_le32(tmp_desc.control);
+    tmp_desc.descriptor_id = cpu_to_le32(tmp_desc.descriptor_id);
+    tmp_desc.xfer_size = cpu_to_le32(tmp_desc.xfer_size);
+    tmp_desc.line_size_stride = cpu_to_le32(tmp_desc.line_size_stride);
+    tmp_desc.timestamp_lsb = cpu_to_le32(tmp_desc.timestamp_lsb);
+    tmp_desc.timestamp_msb = cpu_to_le32(tmp_desc.timestamp_msb);
+    tmp_desc.address_extension = cpu_to_le32(tmp_desc.address_extension);
+    tmp_desc.next_descriptor = cpu_to_le32(tmp_desc.next_descriptor);
+    tmp_desc.source_address = cpu_to_le32(tmp_desc.source_address);
+    tmp_desc.address_extension_23 = cpu_to_le32(tmp_desc.address_extension_23);
+    tmp_desc.address_extension_45 = cpu_to_le32(tmp_desc.address_extension_45);
+    tmp_desc.source_address2 = cpu_to_le32(tmp_desc.source_address2);
+    tmp_desc.source_address3 = cpu_to_le32(tmp_desc.source_address3);
+    tmp_desc.source_address4 = cpu_to_le32(tmp_desc.source_address4);
+    tmp_desc.source_address5 = cpu_to_le32(tmp_desc.source_address5);
+    tmp_desc.crc = cpu_to_le32(tmp_desc.crc);
+
+    return dma_memory_write(&address_space_memory, desc_addr, &tmp_desc,
+                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
+}
+
 size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
                                     bool one_desc)
 {
@@ -651,8 +708,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             desc_addr = xlnx_dpdma_descriptor_next_address(s, channel);
         }
 
-        if (dma_memory_read(&address_space_memory, desc_addr, &desc,
-                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
+        if (xlnx_dpdma_read_descriptor(s, desc_addr, &desc)) {
             s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
             xlnx_dpdma_update_irq(s);
             s->operation_finished[channel] = true;
@@ -755,8 +811,10 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             /* The descriptor need to be updated when it's completed. */
             DPRINTF("update the descriptor with the done flag set.\n");
             xlnx_dpdma_desc_set_done(&desc);
-            dma_memory_write(&address_space_memory, desc_addr, &desc,
-                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
+            if (xlnx_dpdma_write_descriptor(desc_addr, &desc)) {
+                DPRINTF("Can't write the descriptor.\n");
+                break;
+            }
         }
 
         if (xlnx_dpdma_desc_completion_interrupt(&desc)) {
-- 
2.30.2

