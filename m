Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp1872146njb;
        Sun, 15 Dec 2024 16:50:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsxHkLDoj0Hgk86TQphaAL3MG8keQGa/QkYec353CZWwVYW2/ycjim0x7rbeFD4WP7j41ua0GQss1nDw==@linaro.org
X-Google-Smtp-Source: AGHT+IEFTLWlUmTvSEc2mdGhZh5PV7jVI28ziMtqeFd6JJ8G2Y1oCEIfCbJTsb1gIUyDKrXGn2ZM
X-Received: by 2002:a05:6214:2a8e:b0:6d4:c6d:17fe with SMTP id 6a1803df08f44-6dc8ca94308mr195319896d6.25.1734310259202;
        Sun, 15 Dec 2024 16:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734310259; cv=none;
        d=google.com; s=arc-20240605;
        b=L/6CAnPItgce9sA6MMpt6MGXnQY4mrbqVDW7AFFlWZm0CckaWmavXT911rNnqGgKFU
         djGZoVzlg9LkyYVBQCBipaSE4Y6HYYDYD7X2rx2Ho6sAWDvNrLw8Rg+DVKf6dc9h51wv
         LmrrYEjUCU/yThfwWm6Bxp516UwJc25Wrrbdl4iI/5yLOVw8yqlBp4SC0xX+gYSYddbi
         zcUspMzrHVo8Ab9n0Vyxjd1ou47g9tvquY5tzD3CCx7fZn66iUg9f/nnEbRph74KYp6s
         RPu288y/tY7+/+m65niRyTr6OjUyMOV1ZBHN4RPhWekq7YTGuVrDWP1xkJid3Ar9AAEM
         NPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FWmGdfs7I/39bU6vTy0i46WBke+O98sxD/aRcDZSQXA=;
        fh=G608hMzE3jlV/yruT3/OaUIRkFfGFaP31C1dNzb6ia4=;
        b=A90l7L3jwoWLuaESx695nJCDc4nsZXzXJ+5Hf+pq65SQ5Fp7mQ6jRyj9VWavjtYhdX
         mMbaxfsdNpFxJk2D+aqDw5vNLBwxsc7DtVG5AL5mL7Uq2egx4JNArN3cPgg6Rwv5x13+
         kBPzuN3Vr/yG5BU3+S7QZA+4JGlFJA87czqYynSb9Qo13kAavkOUYq+FqlAv2BAcNltC
         EM/FfIRheuhmnGHRtD1lJjs+TjaM/AYyI7sb3QBUY1TpiBWid8RJmpvPc4eXYeclJ1xI
         tSxQY66IVVM4tqR9RuzAm3p4UsN6Mww7C4aNO+ixMk6nRkGvVGQGwrtKbTSfBBMAmJWG
         6f9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=BEtw417p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd3b7388si63160356d6.526.2024.12.15.16.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2024 16:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=BEtw417p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMzJN-0001TF-LT; Sun, 15 Dec 2024 19:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJL-0001Pw-CH
 for qemu-arm@nongnu.org; Sun, 15 Dec 2024 19:50:11 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJJ-0007JL-CM
 for qemu-arm@nongnu.org; Sun, 15 Dec 2024 19:50:10 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-725dbdf380aso2705127b3a.3
 for <qemu-arm@nongnu.org>; Sun, 15 Dec 2024 16:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310208; x=1734915008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWmGdfs7I/39bU6vTy0i46WBke+O98sxD/aRcDZSQXA=;
 b=BEtw417p0hbGy2kmGzuSeU97E0qDM6CoKLm5ZZUe6/GsGhtHD6yWVRoIIgfW+JqQkW
 qEdUIcATUmN3gHqbXIA13AXG4Ln3zwExn4lxKq/LgUwMsdNVlCrJouGvcU5nQD/iOXQC
 EBtkdzwEryWQfnBMaLTQFPi8TTXlwhT66nv2YerUd3zXcD71uhbCn/jzK2DRbffqP+Hn
 x8taTB3HysBOtjZleMrzoauCbmj/t0hLJkNXlBDmJlYcqSntGp5iKd8QKeqmUyjZbiJQ
 fHxRcybq3TMbcDB9w3E9VLNUBxDbImvzYwF0I/4+rM44OOYap5w/AAH2r2NCcFYFrajN
 UFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310208; x=1734915008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWmGdfs7I/39bU6vTy0i46WBke+O98sxD/aRcDZSQXA=;
 b=BUr/ycPFgZDZZ4mCw/+xKEglg3r47r7a8dNrKK3GUP6ilDF2+/+cso7r8YU1b4Xpzf
 +7YjnFesQJ6SSsdt+ISAd3SCIwLvWbWCKK7GsbSv/sZ5NAENXqmGPyn2/1cEfoDx77Oa
 fv/dVVLUp2JAWEbA8EFuJaF4ypmQj/LnMueHZ7PhZIHjE4AKOBZTxqX2ppBQlYoSKgtr
 LmC4VGw3ORcPA7a+eiH+5TLAY9ZPjLZL8u9WNHuw1+3zfpMdmg25jjHwVdC+cMIHw4te
 RTdmgR10lzC5n/K0T8LsgrTFUhdCH1PJ2lVFntogbQNFyyBdrjt1Vp9uGgfXPc3zSNYC
 gMVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRPykQ8OafwPPCk2w5LrngKwIMVjcrijU6ZEljZlZ7omcbr1SRxAeXDyJ2Jm0XJjDbqm9wivHjnw==@nongnu.org
X-Gm-Message-State: AOJu0YwI84u2RefOhyDR11fXYaozQxhu1iRaKUOGA6K+3nI3GOMf3kZq
 3jcpO5+aboRdX46FiR6/ubuj8mYs76hLQ+j9JD9mLz/YUJKsqAtPNxQp4V3LsRQ=
X-Gm-Gg: ASbGncu5VsD0LKMta3dFfMBooLFlkZuoRwAlrO5hpLBaOOJXe+5mLn7sz7QDYe11eMy
 QpYiSCZlIYGKKAuX+KobZGLFFa4KHt+KGPxbENSA3PAFWUz8ypRnaiDBdzhXtNZgPATOF89h6vm
 IaKjkw3rba8SveGgXPZtJTYkQw296jXKR5JW4iZZL/1S13aY8UpttlTS7mBHUPa78wYy/1d3++e
 ghCRwjPlsGv4E9WQ4JkApybIhkolCt5Vn57RLyiC0Y0v6PycWkz7lw4x6UeVUiKdl/Owivp4gdk
 n+SeGvwT
X-Received: by 2002:a05:6a21:7185:b0:1e1:f281:8cfd with SMTP id
 adf61e73a8af0-1e1f281925dmr8531798637.15.1734310207905; 
 Sun, 15 Dec 2024 16:50:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:50:07 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [RFC PATCH 6/6] include/hw/pci: Send PCI dma requests with memory
 attributes containing BDF
Date: Mon, 16 Dec 2024 08:48:57 +0800
Message-ID: <20241216004857.9367-7-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NIhQ5w0U4guh

In order to distinguish which PCIe device sends the request over the IOMMU,
the requester_id must be set with the BDF of the device.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 include/hw/pci/pci_device.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index 8eaf0d58bb..e22d05dae8 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -263,8 +263,11 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
                                        void *buf, dma_addr_t len)
 {
+    MemTxAttrs attrs = {};
+    attrs.requester_id = pci_requester_id(dev);
+
     return pci_dma_rw(dev, addr, buf, len,
-                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
+                      DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 /**
@@ -282,8 +285,11 @@ static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                                         const void *buf, dma_addr_t len)
 {
+    MemTxAttrs attrs = {};
+    attrs.requester_id = pci_requester_id(dev);
+
     return pci_dma_rw(dev, addr, (void *) buf, len,
-                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
+                      DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
 #define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
@@ -327,8 +333,11 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
 static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
                                 dma_addr_t *plen, DMADirection dir)
 {
+    MemTxAttrs attrs = {};
+    attrs.requester_id = pci_requester_id(dev);
+
     return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
-                          MEMTXATTRS_UNSPECIFIED);
+                          attrs);
 }
 
 static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
-- 
2.43.2

