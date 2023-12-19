Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1779844eji;
        Tue, 19 Dec 2023 13:35:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESc9EktKokgRjODMpE9mYXm4ty8tVSHXYxbXZ2rgf0bDmcUhAcVsNxAYG7QeBaYB8oYFXS
X-Received: by 2002:a05:6214:202f:b0:67f:2b83:f8fe with SMTP id 15-20020a056214202f00b0067f2b83f8femr9285325qvf.99.1703021706765;
        Tue, 19 Dec 2023 13:35:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703021706; cv=none;
        d=google.com; s=arc-20160816;
        b=iHDa3fysFeTTbLkJhJOLeDyptehpkobqT/OSiM0wrlv0ASRoBL9wmcOxwcFvWEpq5K
         zHerqhnSDX2YTdSbJsLXB4stcVJ9TDysWrk52ehiW6o7CGocdT86QsAXKbQJwz/hcQkd
         tGoz6XVn/8IFF7Yg7eT1YwK8t9gbe0hqa62JISIu6acZ3scyHllL+ek6Y1xWAvvdirHF
         JHM5beAS7B3pMcjo7Dju6x6S8vJu4j/PXWZuN3Vr3+aYsJ3jY3ysGtAWd0Fzhl+oNhW2
         Y26EdR1XzPtpmFxitKrFUvAh5VWFvOLBROlGHvEQDVyAPmhKMyYNn58Y39eDYRNFBE+x
         uUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6MVv+DDUf69kht4r/Sr+TmqqYgXi1IiKqWHyvJobH2o=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=vzswcULm6FKlcGvmIgQojjy0ghPVo5lrl7snHViUUMiRKjMdpXFFLJYOa0bPVSBth7
         6y/ywveVu/KKYsqDvCMrVxGGdy2Q60eBgCDUVMEH9NiWcLumzm37+3YY8k898mTvPaRN
         3g5LkJSCTk4qYno6pQ934dRD5hOrcxFdXFwj9UeHGJAOLkBZF4dppkq/VVY0W2CIdCJU
         OQRzAkJxe4+Jo5or6S4+qClcFv/6THAacYPD7XI79fjkuNFawzX4CaUUhxJM/LyNLhSL
         lbknaLqhM9p6FpWDcscrVO2c1IwxqLvc88lPvy8ela0Cw6P1aTkZMIKggXXFhyn8X6kx
         1NlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NnmZRHbu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a0cdb08000000b0067f0b985f45si10508026qvk.608.2023.12.19.13.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 13:35:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NnmZRHbu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFhiw-0007iI-Su; Tue, 19 Dec 2023 16:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IgyCZQwKCnUgTUbaXlmXYTgZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--nabihestefan.bounces.google.com>)
 id 1rFhiT-0007W8-JM
 for qemu-devel@nongnu.org; Tue, 19 Dec 2023 16:33:35 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IgyCZQwKCnUgTUbaXlmXYTgZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--nabihestefan.bounces.google.com>)
 id 1rFhiQ-0003yG-7y
 for qemu-devel@nongnu.org; Tue, 19 Dec 2023 16:33:27 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dbd633c0653so1010718276.2
 for <qemu-devel@nongnu.org>; Tue, 19 Dec 2023 13:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1703021602; x=1703626402; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6MVv+DDUf69kht4r/Sr+TmqqYgXi1IiKqWHyvJobH2o=;
 b=NnmZRHbu+TSbjGI0267KziT1RmuYdFwf8Ti9vrq2amEyGf4cfxjXA7oMzmVOQj5rQB
 vV+s+yXpDhANwGnWx+Bo5cocXoj18wz8YuL0ofk4i35qAMzbGOUQ+rVHmMitdQ9kqw0O
 kj+CiI4Iy0ZUtlprVQdEMPthoD2p+ErqrhAZ7HE/+BKT9Pq58EX+c/EYctTdR4Hynv2h
 pljEokxot8PYGFx7o+NvMGC3cl6X19FLNAvomIDkhD7b3Gg4TW/1W64YfCQL6j1tvgCc
 zhv4B7j4AorZEF6bifPlmYZmKzZmJvkmmeXPGdpVe0Yzjh+lXV0Yyjd5Tq/3oqzw8WP3
 rjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703021602; x=1703626402;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MVv+DDUf69kht4r/Sr+TmqqYgXi1IiKqWHyvJobH2o=;
 b=G/PEGEUqzamei3xL+rVXI1bWJIZ84vc9aOGTXcedru0S4QtkcXXgGPnoY8nMhy898a
 uwC381TftxcoeSzXOSxj4wuVcdywjoVCxApgsUwQpdBy7AqgGMxQ3KJL3OiozlRU2sS9
 hufpaqRnnJJpypmreautFx+eeyGTSPdC1RwaOSkgtgRA+Z6bbyjo+PA7VgH5dvxc0sia
 VVzeW570cNZ9qN8I39rzHwXAxjsmTaBSpcz6PfO9zZvykfIDlEsb+PHSnfjcsw3SrP4g
 /JKphtz+A8eJ3KaAszDLUq8Kj/TOphI/H15stunvKuE6j2JqfUqSUoUjDZ0l5leacNrB
 9K7Q==
X-Gm-Message-State: AOJu0YyRbReNIOMKr3TmyJW5yOCYdxrfvsFQhh76Jp4kdsZ3TpN0kmTl
 piXoNkE5fYX7V3h3hfAYjp4W+srOxl4KyDHO4+g=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:134a:b0:dbd:2f0:c763 with
 SMTP id g10-20020a056902134a00b00dbd02f0c763mr239458ybu.1.1703021602765; Tue,
 19 Dec 2023 13:33:22 -0800 (PST)
Date: Tue, 19 Dec 2023 21:32:52 +0000
In-Reply-To: <20231219213255.604535-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231219213255.604535-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231219213255.604535-8-nabihestefan@google.com>
Subject: [PATCH v9 07/10] include/hw/net: General GMAC Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3IgyCZQwKCnUgTUbaXlmXYTgZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kvMO+UogbOTd

From: Nabih Estefan Diaz <nabihestefan@google.com>

Implemented Classes and Masks for GMAC Descriptors
 - Implemeted classes for GMAC Receive and Transmit Descriptors
 - Implemented Masks for said descriptors

- General GMAC Register handling
- GMAC IRQ Handling

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/net/npcm_gmac.c  | 40 ++++++++++++++++++++++++++++++++++++++++
 hw/net/trace-events |  8 ++++++++
 2 files changed, 48 insertions(+)

diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
index 98b3c33c94..44c4ffaff4 100644
--- a/hw/net/npcm_gmac.c
+++ b/hw/net/npcm_gmac.c
@@ -149,6 +149,46 @@ static bool gmac_can_receive(NetClientState *nc)
     return true;
 }
 
+/*
+ * Function that updates the GMAC IRQ
+ * It find the logical OR of the enabled bits for NIS (if enabled)
+ * It find the logical OR of the enabled bits for AIS (if enabled)
+ */
+static void gmac_update_irq(NPCMGMACState *gmac)
+{
+    /*
+     * Check if the normal interrupts summary is enabled
+     * if so, add the bits for the summary that are enabled
+     */
+    if (gmac->regs[R_NPCM_DMA_INTR_ENA] & gmac->regs[R_NPCM_DMA_STATUS] &
+        (NPCM_DMA_INTR_ENAB_NIE_BITS)) {
+        gmac->regs[R_NPCM_DMA_STATUS] |=  NPCM_DMA_STATUS_NIS;
+    }
+    /*
+     * Check if the abnormal interrupts summary is enabled
+     * if so, add the bits for the summary that are enabled
+     */
+    if (gmac->regs[R_NPCM_DMA_INTR_ENA] & gmac->regs[R_NPCM_DMA_STATUS] &
+        (NPCM_DMA_INTR_ENAB_AIE_BITS)) {
+        gmac->regs[R_NPCM_DMA_STATUS] |=  NPCM_DMA_STATUS_AIS;
+    }
+
+    /* Get the logical OR of both normal and abnormal interrupts */
+    int level = !!((gmac->regs[R_NPCM_DMA_STATUS] &
+                    gmac->regs[R_NPCM_DMA_INTR_ENA] &
+                    NPCM_DMA_STATUS_NIS) |
+                   (gmac->regs[R_NPCM_DMA_STATUS] &
+                   gmac->regs[R_NPCM_DMA_INTR_ENA] &
+                   NPCM_DMA_STATUS_AIS));
+
+    /* Set the IRQ */
+    trace_npcm_gmac_update_irq(DEVICE(gmac)->canonical_path,
+                               gmac->regs[R_NPCM_DMA_STATUS],
+                               gmac->regs[R_NPCM_DMA_INTR_ENA],
+                               level);
+    qemu_set_irq(gmac->irq, level);
+}
+
 static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
 {
     /* Placeholder. Function will be filled in following patches */
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 33514548b8..78efa2ec2c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -473,6 +473,14 @@ npcm_gmac_reg_write(const char *name, uint64_t offset, uint32_t value) "%s: offs
 npcm_gmac_mdio_access(const char *name, uint8_t is_write, uint8_t pa, uint8_t gr, uint16_t val) "%s: is_write: %" PRIu8 " pa: %" PRIu8 " gr: %" PRIu8 " val: 0x%04" PRIx16
 npcm_gmac_reset(const char *name, uint16_t value) "%s: phy_regs[0][1]: 0x%04" PRIx16
 npcm_gmac_set_link(bool active) "Set link: active=%u"
+npcm_gmac_update_irq(const char *name, uint32_t status, uint32_t intr_en, int level) "%s: Status Reg: 0x%04" PRIX32 " Interrupt Enable Reg: 0x%04" PRIX32 " IRQ Set: %d"
+npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting to read descriptor @0x%04" PRIX32
+npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
+npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
+npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
+npcm_gmac_packet_sent(const char* name, uint16_t len) "%s: TX packet sent!, length: 0x%04" PRIX16
+npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
+npcm_gmac_packet_tx_desc_data(const char* name, uint32_t tdes0, uint32_t tdes1) "%s: Tdes0: 0x%04" PRIX32 " Tdes1: 0x%04" PRIX32
 
 # npcm_pcs.c
 npcm_pcs_reg_read(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.43.0.472.g3155946c3a-goog

