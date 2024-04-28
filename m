Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1733985ejb;
        Sun, 28 Apr 2024 11:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0yTeawbAFDFAeYasdc2BhJr4aWvvhLki4LkKJ0nBay5YJHAr9vgIF9s8BeX8CvuhsslXMtu2qvKe3qVWp1QgaL1TsEfc3
X-Google-Smtp-Source: AGHT+IGAqbf7V3WeI1AC2F321hNR+HKScrGK/UlQljsezW47J6c03UGOYbg8ABenlc+jMdGQ4G7+
X-Received: by 2002:a05:622a:2b0e:b0:43a:18ae:ea94 with SMTP id ha14-20020a05622a2b0e00b0043a18aeea94mr11128269qtb.7.1714327952866;
        Sun, 28 Apr 2024 11:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714327952; cv=none;
        d=google.com; s=arc-20160816;
        b=PE0s4g6TV9535VaYZD6oiLh28aYyFcf6IbaAj2Hl7qALfcg0JYO84IKdqDsDzYLIhs
         wYuzhem9BE3/gEsJRWCJ2so0LxFjCGyhC14oTChMhGHydiBVezeyKBI5yxivu7ygExsy
         BNjbV2JbZmZEeKRCLu58N0Eu0LcgL8qtlQ5OgPwR8CABQwSuG5SoEEIOz2tBUf8gSMdP
         81IZ4L+lRGzjKCbwGt3oPtBuFvtcquxsaZrXR4L4utOvg54JobofZsR2S3KMfQ7XnaOf
         fEdXiMw9rJAEKVOc7WnBZ7OcqdFCX6sRuxvqzReLVrLWtpKlJjsZUB+2mNJNKYpDKyUv
         5aJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=DYqmuKG7OFfy8WpjCEv7E6IEzHqY4LgNfUe6fh1glv8=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=FKZlcHTmQsLZkSxGkIkJU+5Vpfk1Kpp+GzSAZCukJnpTFJR7lO605uVQP4tnu082vC
         qhkkbOTL24kC6QVT07rOFOd8U5Dx0rD/LFSHou7zbGO8s58bH0hj5Sckfr+j7nU4limq
         0UNJIQSOIJMzpCDzLDszuDznhKNvO/NEPYfeIGMm/LwCmEs+V5sxB//1eFE0kWj8ziZA
         7pJbHpCpcwyYXw16XbvvUw0XEDCVYt3lG5407puxj2aechnk8YnFgw4ksKX10Lc8xS1G
         0MycMH1svAkeMeiMA0jcX/346NBX3pKJDy2IJlbvXJ+N7/B/Sa5LudH+0Sxq4dz0Xkz0
         kMDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fj25-20020a05622a551900b00439e7c3c6b0si17451708qtb.802.2024.04.28.11.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2024 11:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s190V-00021b-0G; Sun, 28 Apr 2024 14:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1s190U-0001ym-7u; Sun, 28 Apr 2024 14:12:10 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1s190S-0007B4-Ea; Sun, 28 Apr 2024 14:12:09 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.236.220])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VSF0g2Wh1zyWD;
 Sun, 28 Apr 2024 21:12:03 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH v4] fix endianness bug
Date: Sun, 28 Apr 2024 21:11:56 +0300
Message-Id: <20240428181156.24071-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeduleetfeehffekueeuffektefgudfgffeutdefudfghedvieffheehleeuieehteenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefiedrvddvtdenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrddvfeeirddvvddtmeehheehkeeipdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtthhope
 hpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12643460,
 Updated: 2024-Apr-28 16:43:47 UTC]
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
X-TUID: J6Fpq4LQtgft

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
v4: remove rewriting desc in place
v3: add xlnx_dpdma_write_descriptor()
v2: minor changes in xlnx_dpdma_read_descriptor()
 hw/dma/xlnx_dpdma.c | 63 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 1f5cd64ed1..e9133e9dcb 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -614,6 +614,63 @@ static void xlnx_dpdma_register_types(void)
     type_register_static(&xlnx_dpdma_info);
 }
 
+static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
+                                    uint64_t desc_addr, DPDMADescriptor *desc)
+{
+    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
+                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
+        return MEMTX_ERROR;
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
+    return MEMTX_OK;
+}
+
+static void xlnx_dpdma_write_descriptor(uint64_t desc_addr,
+                                                DPDMADescriptor *desc)
+{
+    DPDMADescriptor* tmp_desc = (DPDMADescriptor *)malloc(sizeof(DPDMADescriptor));
+    memcpy(tmp_desc, desc, sizeof(desc));
+
+    /* Convert from host endianness into LE.  */
+    tmp_desc->control = cpu_to_le32(tmp_desc->control);
+    tmp_desc->descriptor_id = cpu_to_le32(tmp_desc->descriptor_id);
+    tmp_desc->xfer_size = cpu_to_le32(tmp_desc->xfer_size);
+    tmp_desc->line_size_stride = cpu_to_le32(tmp_desc->line_size_stride);
+    tmp_desc->timestamp_lsb = cpu_to_le32(tmp_desc->timestamp_lsb);
+    tmp_desc->timestamp_msb = cpu_to_le32(tmp_desc->timestamp_msb);
+    tmp_desc->address_extension = cpu_to_le32(tmp_desc->address_extension);
+    tmp_desc->next_descriptor = cpu_to_le32(tmp_desc->next_descriptor);
+    tmp_desc->source_address = cpu_to_le32(tmp_desc->source_address);
+    tmp_desc->address_extension_23 = cpu_to_le32(tmp_desc->address_extension_23);
+    tmp_desc->address_extension_45 = cpu_to_le32(tmp_desc->address_extension_45);
+    tmp_desc->source_address2 = cpu_to_le32(tmp_desc->source_address2);
+    tmp_desc->source_address3 = cpu_to_le32(tmp_desc->source_address3);
+    tmp_desc->source_address4 = cpu_to_le32(tmp_desc->source_address4);
+    tmp_desc->source_address5 = cpu_to_le32(tmp_desc->source_address5);
+    tmp_desc->crc = cpu_to_le32(tmp_desc->crc);
+
+    dma_memory_write(&address_space_memory, desc_addr, tmp_desc,
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
@@ -755,8 +811,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
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

