Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2942424ejm;
        Mon, 24 Apr 2023 09:51:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YM1jFcdvmIAcpuHOS0HoNR4+XQTMjP9+YMHh9iR5pTzcfy8q2XDsIXKFlpu2d2e+bgcdb3
X-Received: by 2002:a05:622a:18a6:b0:3ec:4705:d216 with SMTP id v38-20020a05622a18a600b003ec4705d216mr24249525qtc.14.1682355111594;
        Mon, 24 Apr 2023 09:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682355111; cv=none;
        d=google.com; s=arc-20160816;
        b=dHK6C4LvlnIzhm/x8H8raKpGjUbVlu0OV187j9gX0/zeWVD6IVO4T+Q/QyYKplfCia
         1GhHgMuHg1R4AATwGLg76/ZyV5BXWSwOkToHMobo58j7OkF58bbREUuyQ3rS9cKFEZG3
         rt/FhHIQ3ReaL9u9REPowZk4sp+GyHixkDYK8rSKFDBpbxVDfqzqaxaDN+jsMqIMJ5rQ
         2xvNh6mU8Pe5g8WJi/RTWgGel5rjGiGacqM3RR9oe9OeWcy7yKmKMSwQBFEVo58SlJC/
         aMU4yJoXrAAbR87bw5+15iuSa3GFIWcSyllXRSWeScuM4LTJLrqRBp9hHHVW+Lo6NgRm
         SVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KDoq9PyOjHZooAPOHtlklGAcY5q2//1VIptVhgf5CWk=;
        b=D4SZJzNf3daOWDzNS68UyGD8UscvLiRACccoqHNiwhdKnHrEAta4XagNnTnV4dQPlv
         3tYzP91Leee539X969gOOZtXUIX3+JgZeQ4JlxZPvMmogQ4hINMkU41Z2W4qHigJPQ+5
         sbkpmBFjb0jq6tijkCSkQ7cY0JJc0qKQ1wiR6CC4KGA1/cn5EU8See6dOqJp3DzKunhd
         M9wgGxQMrMul0q6lF7xmI9BdK0F9jU/54MvP37SSTix5kuq69dQLtLpTY8HwyhD2Qh6H
         mUNuzEuVtmndnGon/kVkGV2+Vuhnu/k6Ne+djtnmI8fNFApLKGNZcYv09vJrnh7TGtr4
         p73Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aYR9K/U7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a05622a11c900b003ef3dd000casi7722825qtk.587.2023.04.24.09.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 09:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aYR9K/U7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqzPA-00038D-I6; Mon, 24 Apr 2023 12:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP3-00034t-10
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:51:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP0-00029z-3Y
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:51:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so2831522f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682355056; x=1684947056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDoq9PyOjHZooAPOHtlklGAcY5q2//1VIptVhgf5CWk=;
 b=aYR9K/U7r7GLAzB34mn7InSVi3oVnx1JTcFGS4b0CC7uUm6knh0ACuI83LDhm76UK4
 6ILiOkySMs0RZxyPr9hTJyxxHO9p1f3vnjwwrcZzQIcngY2A2bGO+JWVlF29UlKsbAcl
 qalN+lQvr8l+2HZoW2ipOZKhgvg0rItvSz+xY7uYz2byCd//1oQ/tGAbVmSYdjkoF/wP
 o0Cyuj7Tzq7hcdv8hszOTeTRrtc8ZH69K5cfZJBzOfIE1N2rnRDqKic9ld2bi2ex4G+i
 yWnStC6wTDibl27/Gc7ramsfWGrNrgSLFvZgIcTynn4rfIGIN9VWn4HPneVel9Fpcp5r
 3Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682355056; x=1684947056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDoq9PyOjHZooAPOHtlklGAcY5q2//1VIptVhgf5CWk=;
 b=YX7NvtrqSv7EUBuESpGSEYOwL0PJvmpgUQdGEMw8rMoVkSfqPy9D1v8vFnNJYYO1eJ
 dDxxzumFlijnc5uMNA2SXz6M5ZEKVK3iBHVSQXItV8twTlVopjoWGxtPglAJQk0pKrb4
 TXubYcF2xE1zNf2/3vqyE4SzQl98YsDJpUNs05G+aBHXzNSUrFDhACtnQvrW/YGuaGAJ
 xrkFGShuaXi1NXje13i+DfCciRMaeR4H48i5uaPk9YuGTFf248uX7wS2FQh94evK8A0x
 W5B3fEJBN7YDvXzJ3CraxYbdwRnKp9ErI2/8Si0BAqZ37O++JyxVTPh0OjY7nUv2gsJv
 mpAA==
X-Gm-Message-State: AAQBX9cK94EUtsCBjFVMWJohOlHUxgO73qOwUxSUmBt4tDmhV6Y6eK5w
 isNsJ0k+U6ozbQoPnRVCSlHsl3I631o6GLy6jFg=
X-Received: by 2002:adf:e54c:0:b0:2fb:ca40:e42c with SMTP id
 z12-20020adfe54c000000b002fbca40e42cmr10097973wrm.6.1682355056231; 
 Mon, 24 Apr 2023 09:50:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm11211279wrf.73.2023.04.24.09.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH 2/2] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
Date: Mon, 24 Apr 2023 17:50:53 +0100
Message-Id: <20230424165053.1428857-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424165053.1428857-1-peter.maydell@linaro.org>
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5tdmqO+K3Suz

In allwinner-sun8i-emac we just read directly from guest memory into
a host FrameDescriptor struct and back.  This only works on
little-endian hosts.  Reading and writing of descriptors is already
abstracted into functions; make those functions also handle the
byte-swapping so that TransferDescriptor structs as seen by the rest
of the code are always in host-order, and fix two places that were
doing ad-hoc descriptor reading without using the functions.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index b861d8ff352..fac4405f452 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -350,8 +350,13 @@ static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
                                           FrameDescriptor *desc,
                                           uint32_t phys_addr)
 {
-    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc),
+    uint32_t desc_words[4];
+    dma_memory_read(&s->dma_as, phys_addr, &desc_words, sizeof(desc_words),
                     MEMTXATTRS_UNSPECIFIED);
+    desc->status = le32_to_cpu(desc_words[0]);
+    desc->status2 = le32_to_cpu(desc_words[1]);
+    desc->addr = le32_to_cpu(desc_words[2]);
+    desc->next = le32_to_cpu(desc_words[3]);
 }
 
 static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
@@ -400,10 +405,15 @@ static uint32_t allwinner_sun8i_emac_tx_desc(AwSun8iEmacState *s,
 }
 
 static void allwinner_sun8i_emac_flush_desc(AwSun8iEmacState *s,
-                                            FrameDescriptor *desc,
+                                            const FrameDescriptor *desc,
                                             uint32_t phys_addr)
 {
-    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc),
+    uint32_t desc_words[4];
+    desc_words[0] = cpu_to_le32(desc->status);
+    desc_words[1] = cpu_to_le32(desc->status2);
+    desc_words[2] = cpu_to_le32(desc->addr);
+    desc_words[3] = cpu_to_le32(desc->next);
+    dma_memory_write(&s->dma_as, phys_addr, &desc_words, sizeof(desc_words),
                      MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -638,8 +648,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
         break;
     case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
         if (s->tx_desc_curr != 0) {
-            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeof(desc),
-                            MEMTXATTRS_UNSPECIFIED);
+            allwinner_sun8i_emac_get_desc(s, &desc, s->tx_desc_curr);
             value = desc.addr;
         } else {
             value = 0;
@@ -652,8 +661,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
         break;
     case REG_RX_CUR_BUF:        /* Receive Current Buffer */
         if (s->rx_desc_curr != 0) {
-            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeof(desc),
-                            MEMTXATTRS_UNSPECIFIED);
+            allwinner_sun8i_emac_get_desc(s, &desc, s->rx_desc_curr);
             value = desc.addr;
         } else {
             value = 0;
-- 
2.34.1

