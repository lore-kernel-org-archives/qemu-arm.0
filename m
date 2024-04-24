Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp810724ejb;
        Wed, 24 Apr 2024 11:14:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoTsZmm9pXEykU0LuX+1J0LJEsiOqBTCMJnfHp5dZ0+fuMMSNFGkRaTqxZLRKEYo59yfuzVRWFZ7JjYngDzGdFQQY+sEd4
X-Google-Smtp-Source: AGHT+IHxExcloNZS2hqcpz2QPy+o/aMjLu33aTSjlN6NQ+cf50sFVmRu+EqEkD9PrtqLiOnq0eyt
X-Received: by 2002:a05:6122:1784:b0:4d8:79c1:2a21 with SMTP id o4-20020a056122178400b004d879c12a21mr3888030vkf.7.1713982455291;
        Wed, 24 Apr 2024 11:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713982455; cv=none;
        d=google.com; s=arc-20160816;
        b=PsGhUNCtjHH7UQKARmalT0q7pSNF3W3r/TTlnWzd7w26OPuDEqENsYJvkTpvdEjwPp
         yWwEyGoKgLszHnzciRCfO7VjhYr5Ci8yC95j/Kz/CTrNqdPBaAVfRZucpEWgs0YbWPYl
         Mad1ILLuSsr4Qv+ozLITnwCbWNvlbpYcAjBCoIBASsSA/GOQlfN+eqOe33z3xJAwBqT3
         X2gmWvbRF1oFQaNp5VPl//uUfc4/TKyncAgfDQRf9N/GqIZ7olnNQccu21wJDXzQ10rr
         Xm0EYhMICPytGYoCv+GQJdG0DzU0IwMBW+CU47f0dkI6BH15Y3A8HEJvxNUM8qQwWquS
         zRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=1DCMIBKgHYIvPK6/MByme6bhFo5knAfvDooDm0BqRN0=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=dcXVrrbAhbOVFoivOLDhtcWvEtIpEumLSQL67r3mxk3oU6zSiDWRusio3PjY+0/bFx
         JQKQtuQx2dpFTnBYIJVJ/ZUVwkh1a8w1SiqQK0Wn256Trw73J0TD7LdZ4IzdkO8LGn4L
         b51LzF+6x646R/tcn5FCB1SAuzAA3UCxQp1zxiOqWeo8BvPVJ5VsrBnUrRuPnmIbW4uC
         zksKEmM/hFR8cumaz1RuMa3SMS7oMBOlIlHiHtDjHTlSfp9Lh2R3gnSqG2mgB8OPcl0T
         EglwkO8xKSl1vYEI+ONN488pFSaFHQPXoXoLvwwzrDcgG02+Bc28qIwxIZPDu0bK17UW
         nwKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fp22-20020a0561223a1600b004c002be1201si2822505vkb.269.2024.04.24.11.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 11:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzh7x-0007Kz-9q; Wed, 24 Apr 2024 14:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzh7v-0007KC-IX; Wed, 24 Apr 2024 14:13:51 -0400
Received: from new-mail.astralinux.ru ([51.250.53.164])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzh7s-0005Q8-Pd; Wed, 24 Apr 2024 14:13:51 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.232.60])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VPnDP3y0qzqSR8;
 Wed, 24 Apr 2024 21:13:41 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH] fix host-endianness bug
Date: Wed, 24 Apr 2024 21:13:20 +0300
Message-Id: <20240424181321.20844-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAFEAcA-=kk_TQVRLLQvH96DC-ffmDqd_hU5=z=Og8ntYGxPUeg@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeefkedufedvkeffuedtgfdugeeutdegvdffffejfffgleffieduhfejvdelffdvudenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefvddriedtnecurfgrrhgrmhephhgvlhhopehrsghtrgdqmhhskhdqlhhtqdeftddvieeltddrrghsthhrrghlihhnuhigrdhruhdpihhnvghtpedutddrudejjedrvdefvddriedtmeehieegjedvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtthhope
 hpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12628730,
 Updated: 2024-Apr-24 16:23:42 UTC]
Received-SPF: pass client-ip=51.250.53.164;
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
X-TUID: CDlyr8txh0uK

Add a function xlnx_dpdma_read_descriptor() that
combines reading the descriptor from desc_addr
by calling dma_memory_read() and swapping desc
fields from guest memory order to host memory order.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d3c6369a96 ("introduce xlnx-dpdma")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/dma/xlnx_dpdma.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 1f5cd64ed1..5fd4e31699 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -614,6 +614,38 @@ static void xlnx_dpdma_register_types(void)
     type_register_static(&xlnx_dpdma_info);
 }
 
+static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s, uint8_t channel, 
+                                        uint64_t desc_addr, DPDMADescriptor *desc)
+{
+    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
+                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
+        s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
+        xlnx_dpdma_update_irq(s);
+        s->operation_finished[channel] = true;
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
 size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
                                     bool one_desc)
 {
@@ -651,11 +683,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
             desc_addr = xlnx_dpdma_descriptor_next_address(s, channel);
         }
 
-        if (dma_memory_read(&address_space_memory, desc_addr, &desc,
-                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
-            s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
-            xlnx_dpdma_update_irq(s);
-            s->operation_finished[channel] = true;
+        if (xlnx_dpdma_read_descriptor(s, channel, desc_addr, &desc)) {
             DPRINTF("Can't get the descriptor.\n");
             break;
         }
-- 
2.30.2

