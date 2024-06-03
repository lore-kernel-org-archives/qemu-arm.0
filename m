Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2004106ejs;
        Sun, 2 Jun 2024 22:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1XLPcUL6eFXdYzxaIt5cgOELg+UhR25FCTQfMx9AhRJ9vMgRL7Q16pJZIc6bA5CrJ0gq+ic1BKKSWvBr3l1MQT2bATRkM
X-Google-Smtp-Source: AGHT+IFO0KrfgCh5+3IY1QvZEKqkyG7BEdiYew0WYPtKnC8DXGEJVVHQnBTrpES6U6QJmmkNa+o5
X-Received: by 2002:a05:6214:4988:b0:6af:67b2:ff17 with SMTP id 6a1803df08f44-6af67b2ff7bmr42881196d6.59.1717393750112;
        Sun, 02 Jun 2024 22:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717393750; cv=none;
        d=google.com; s=arc-20160816;
        b=X7Mfu5EyKtnu/uQWwtv1YXKhfjxZClhtBiDJJBQkeXjLzRUN5+J0ES0m9dKQEDN8gx
         bjFSV/VEBDYxvtamCkCiOSr7Fhog3fCUUU6nC6SoVQe5YlChlroxcyZeipXV6upfwXa4
         gfC1e7VTwL/itCoTjF/Yq3YchiDnfVV4swDfNe9l2ai5V9nZbFF6W7qDYNyHolQdNlbX
         Ifky3TgYn9SiNwVDzdSACchNPQx0q3Kx17IAZvGHB7/nU/YXA2OTAvTUBVJ0Tagy3a3q
         Cfz4zKlE/tm442jQ9p4tQKegJT1ggGHxkkNpQbUCZ54+uf4NXhDtev5osz74x1VYiRgl
         jSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GEhvW8mMXGFmnN1YikczckSrxHyJV9SouAqt0p1mFPM=;
        fh=ppxrqpvAh8R6w81prY3bRtiwFppR56AWCCbOGauoMLA=;
        b=MS0bTiFgaKMibu6pge8+j5DRzubZ2s4ima+ts0RekLMKMVlOGuSjBjG+dOQBKaUKHf
         cK6QnN1nJfTbsInIpWAH4NXxFUyOJwSJf9E36s84p8nuuLgxIy5h6FAjRxY7+XWrxLxD
         OnEsjgHtpF0rsl4dHGqE+H42RE2SzXoOOmmR6at6HQUwojGeH6B48ddyn6AKd0RnZmP0
         S/MguNSbKDB/hhJtkVtnHq1WzHEqRqylTI1v4nXs/ggBg+hr4Y+Dcuye4isZCwqlhm8C
         aMKPaKWtzsIlEFhDzMnESyDvOsV2fJ4xNMByx5CYaHns20Fgej7B6pvQBzNpeP07jcuu
         Lgtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=OV7FobpQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4a732e15si81669786d6.100.2024.06.02.22.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jun 2024 22:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=OV7FobpQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sE0Xx-0008Sf-NX; Mon, 03 Jun 2024 01:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0Xw-0008RY-6z
 for qemu-devel@nongnu.org; Mon, 03 Jun 2024 01:47:52 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0Xt-0005BK-JY
 for qemu-devel@nongnu.org; Mon, 03 Jun 2024 01:47:51 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f47f07aceaso23721075ad.0
 for <qemu-devel@nongnu.org>; Sun, 02 Jun 2024 22:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717393668; x=1717998468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEhvW8mMXGFmnN1YikczckSrxHyJV9SouAqt0p1mFPM=;
 b=OV7FobpQpqeLVKtgsJn72Byc/xzLgtjGYN+WnypUL0sG5fIMo+0ECDssba+g4AcKTK
 Jgsolf2cHA+v9u0nGAQYjkiHk/wzvH3/7SvCabVLrRxBABkW6QfVZiFC4vTDBoxhFs5l
 YzW9M4fD6J4rW7sRx2nMDBZEGW1z0IxlvLN5sgcKz97uYbFHXrurQicKSi7M+WXbIq8R
 Col/+CO43qqUqDtsW3vbiY+LXLYrQefnAAgZ3lU3cc7RRDUiC5YxId3g3FbAXsFoz8CP
 44CBb+hLKvUFCgHKy7ggNepaj9nPSDztk5OpHRzO8jvCuzY5DxFtrn6LALtQp+i53+OW
 hc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717393668; x=1717998468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEhvW8mMXGFmnN1YikczckSrxHyJV9SouAqt0p1mFPM=;
 b=ZmDxRyNMUg0JAAr0cEUbo06hdKdcRnYwrqozgVjZC6ap1UUltLAbBomZWM2cLUbaPG
 NE/0x012MeIICHfxeMcqIM9LUQIP3tBhpGF5PwNmlGcIFNGlyXzy5h2h9kiKdBWdadzq
 JUlh/W5EoBhTgX77bbRgNEzVSjHjpDaEcxYLO2z94neKDDnOM+bzYjFc1cHEUj/9MWVs
 9YPj9pGGEUQyz5TXKQF4/YKdngaYE41ogDBHD61AP4PxOQTkBXwL+uX3GiYRfYrdf/jK
 0eBXWrnsaotA2LAsqBykFIHTiEru9TALdosPnKY3UkJLro+GpqBzEqYVcIrtI6wrbsKe
 ELKg==
X-Gm-Message-State: AOJu0YxTvBAsxP4+9MhCb4HOTDYyTGPr7n1iOC7DqqFT9XMZyAZN6kOu
 iRYh1eTdge2AOLRP5t3kByQztiLrVMDg2avqh6vV/yoOgFsEKYso5d7fcECrQJuAqz+TWavw2xO
 papFLGHNW7wCpYAeBZVlZfhGY5r9o4pJ6bn/k8s/IauxpIhYck5mb1X+lpI/NYk/Zl7pK2z1LdR
 YHu9jBdlV97qE/M1Ect2mSUMyqp2bnFSAoeE8=
X-Received: by 2002:a17:902:ea03:b0:1f4:a45b:8429 with SMTP id
 d9443c01a7336-1f636ffde39mr95009475ad.27.1717393667593; 
 Sun, 02 Jun 2024 22:47:47 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63241e085sm55824135ad.299.2024.06.02.22.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 22:47:47 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 1/4] hw/dma: Enhance error handling in loading description
Date: Mon,  3 Jun 2024 13:52:45 +0800
Message-Id: <20240603055248.3928469-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603055248.3928469-1-fea.wang@sifive.com>
References: <20240603055248.3928469-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VDgm5/s6/uZK

Loading a description from memory may cause a bus-error. In this
case, the DMA should stop working, set the error flag, and return
the error value.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 hw/dma/xilinx_axidma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 0ae056ed06..4b475e5484 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -71,8 +71,10 @@ enum {
 enum {
     DMASR_HALTED = 1,
     DMASR_IDLE  = 2,
+    DMASR_SLVERR = 1 << 5,
     DMASR_IOC_IRQ  = 1 << 12,
     DMASR_DLY_IRQ  = 1 << 13,
+    DMASR_ERR_IRQ  = 1 << 14,
 
     DMASR_IRQ_MASK = 7 << 12
 };
@@ -190,17 +192,27 @@ static inline int streamid_from_addr(hwaddr addr)
     return sid;
 }
 
-static void stream_desc_load(struct Stream *s, hwaddr addr)
+static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
 {
     struct SDesc *d = &s->desc;
 
-    address_space_read(&s->dma->as, addr, MEMTXATTRS_UNSPECIFIED, d, sizeof *d);
+    MemTxResult result = address_space_read(&s->dma->as,
+                                            addr, MEMTXATTRS_UNSPECIFIED,
+                                            d, sizeof *d);
+    if (result != MEMTX_OK) {
+        s->regs[R_DMACR] &= ~DMACR_RUNSTOP;
+        s->regs[R_DMASR] |= DMASR_HALTED;
+        s->regs[R_DMASR] |= DMASR_SLVERR;
+        s->regs[R_DMASR] |= DMASR_ERR_IRQ;
+        return result;
+    }
 
     /* Convert from LE into host endianness.  */
     d->buffer_address = le64_to_cpu(d->buffer_address);
     d->nxtdesc = le64_to_cpu(d->nxtdesc);
     d->control = le32_to_cpu(d->control);
     d->status = le32_to_cpu(d->status);
+    return result;
 }
 
 static void stream_desc_store(struct Stream *s, hwaddr addr)
-- 
2.34.1

