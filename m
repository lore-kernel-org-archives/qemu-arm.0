Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp1872254njb;
        Sun, 15 Dec 2024 16:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEjAfEzmcVyIAsl4CD9jeZef8AeZ6PNsr5mHWmo2K51PUYqmxwLMX8h6Kloi4MJMqNnmeL8QhLzKZDxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnHtLUXWsiG4oqNDuXfn5gUEVFyZH0OEbr4UIjgGFcekn5twZt4kQcPwbihshvb5eaRNMH
X-Received: by 2002:a05:622a:1210:b0:462:e827:c11a with SMTP id d75a77b69052e-467a575a86emr207768321cf.19.1734310286935;
        Sun, 15 Dec 2024 16:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734310286; cv=none;
        d=google.com; s=arc-20240605;
        b=cbQOl5dhARQWJk08CVc9vR7Castf5QwRgfzkonL+ER0QFguJktfRgtgdxFePJHXgTW
         G0VfPYLN3XJYchl8X1IoLQ/LmUML6uYhtyfak19Yfi7bynGWqc/f9+baQ0KHA15DH9rB
         ZWs05fs28xS01kAbh7efubqZ6UcUmyERUnjTZOrSCODizfjBCe7Ba9t1cx3kJJGmg6Do
         TfimUqB/clfkZpapUwXaoXJYWigkcjKLqgu1xS/6FVcam8Ic/SdMYPMJMMCKtBgaALQ8
         ts5ykxA947s6D3fVx8wdke0A7jaqGBs6mvx84nxAJQrZTQJ9xxRek6rUbEeQOnV2yR2B
         cOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0oPxPHNXebmd2yYjjqR5HgsogRG7IAY4swP2rcEypRg=;
        fh=jnHD3VsLlvFTejaF1eYrcb+kYoV3UhPL70uTnppbGNA=;
        b=VggAJfQ+KRi/TeeJsCmpNQ6vEa6b5w8riqFEPTyR2rgTzqTzWEL9xZPfRvZ/0bbJ40
         u3FGG6Iu9kZHAE0iJWqkj3m5+WjxT2+xV0mt8vBdjMpDW5Joh9FPcLFJnCAJg9hXi6TP
         hUwnPAU1xzPhb8K27eBS+agKfp/lyx6RXdQ49+B3TXXfsNfSqFOUA8+kHtj8Vb1zwd/C
         uJo66P/B+xb8f2xkzlzrIiRT17v3TnQ+8KjHP+7jkjRFoyNyHXzR5D56V+ZpU0cWEMxV
         HYIzUNX/ot3IYg9ssy17mxdZjc9FAtDFOEtn6Xzjfhg9ecmiGA1Skfhps0XV7AE0zkBo
         oAuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Y7ZlbFod;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7047c5f29si552451585a.18.2024.12.15.16.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2024 16:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Y7ZlbFod;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tMzJM-0001Ry-76; Sun, 15 Dec 2024 19:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJJ-0001OX-LZ
 for qemu-devel@nongnu.org; Sun, 15 Dec 2024 19:50:09 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJG-00078g-6f
 for qemu-devel@nongnu.org; Sun, 15 Dec 2024 19:50:09 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-725ea1e19f0so2910193b3a.3
 for <qemu-devel@nongnu.org>; Sun, 15 Dec 2024 16:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310202; x=1734915002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0oPxPHNXebmd2yYjjqR5HgsogRG7IAY4swP2rcEypRg=;
 b=Y7ZlbFodL/B/qZgoU4q8J7NLqnVW809NykVvkjF8zL6JuHQQgfOAZeyz6SQPs+Ggrn
 gLhgOpub5AkwoY1XeFILSp15v8YS3kakXu5DdI79FPNTPoMVcTZSJBbgVaRDBMvZG/d4
 en9WxvIq7cdafhNUTQRS49gLoeg7QN58nvnt/p+0s15a2SnciomInVFWOW+X1Z8czNCX
 KGF/4Xi4imP6LSb2Hxw1VJfJZEDb5fvwWJfXiaLNQGEUClwBdxi+bZYvY3PHEiNwShX2
 4IXpJ/NhgPwlZdT1vzUUFaCFt4KDMBA68sv3rRxgOiuTkxlyYJTPKOrtY8nPsMNIJaRW
 CztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310202; x=1734915002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0oPxPHNXebmd2yYjjqR5HgsogRG7IAY4swP2rcEypRg=;
 b=Ml50Xz2btgpigEUwzUgrc4oK1lYLGrs30n/9ipommaWfDRu2hy2GtORhI1/4McpJIx
 8jgN8o5Kp4JSJMefdWgUwhrQLxBJwjBK+RsKMWeMXiHdZ6+FdbtcIJR9wOIZi7QtJvQR
 s79ZMhJ556jd7QLkdaJBCK8NK1YHRGtUK9UuC+G7KHb+SbbURiQLAOgyCqYy21WuJ6IB
 JsL9GcL28+Aux41maAmnAF1X/5ojvwMUb9Vnd1pWc/71/lwc1FqY39lodFWPIdciirno
 TGQL2EwBdEPrnHbeQx1FlLYSBzJg/HjAmbCUrQiyFMBDJWNm/c1RNvfTMJcqnyC6X112
 6lOg==
X-Gm-Message-State: AOJu0Ywxjbw44GWUgcH7UniaSphi2pjTJmy9Z8pQjih6iwaChr0BAr1/
 +RgsfWCOT1Yxqwb3QkJIC4QOuWZxVJJ3UaeesKETndbqEOtLhVWZhVmo1WymLhigtrohLZSzeX9
 BAlXhW0iKC8d0za/j/iqzFugP6EmXPmXbcZsfWNBUzQ99OP8MSf+3T1aQr9CSr4W32EOz+FIEUv
 c4Xm9sFwx27TUcjwh02tsjtbkHeK/u0T+iaoViYV86WBvYJV8=
X-Gm-Gg: ASbGncuTuaBgf1bpPjvQnvNzsYppJ6OcXV6emNfg3xFrZZ7G7tiyih4+6lmquBwPWcr
 opUjd2HVfgWunwm8PHSCeJAIgqH9FilNJd6JTE4VEuReeQAEU0Z9MVgQZktDimvivdL+YxkJHzJ
 C6l+2cZrjlToyFLoAABpwK1bq7Z9cN/5rH1GU1+PE3pMm1vQNucGdU6+s9xmIZuGrrZnaqzDsTS
 FLCUy9FouxJ1Oe6aGvow7BcazU3N38fh5sFzHChFUwDSbNn8SNnxmmQ6Sw7pIAL3x5HjPkWYqlc
 s0hLd52M
X-Received: by 2002:a05:6a21:47c1:b0:1e1:e2d8:fd3a with SMTP id
 adf61e73a8af0-1e1e2d8fd4cmr13975584637.35.1734310201680; 
 Sun, 15 Dec 2024 16:50:01 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:50:01 -0800 (PST)
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
Subject: [RFC PATCH 5/6] hw/riscv/riscv-iommu: Acquire device IDs dynamically
Date: Mon, 16 Dec 2024 08:48:56 +0800
Message-ID: <20241216004857.9367-6-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: T1uNZIJR8XAi

When all memory transactions from a PCIe host write to the same IOMMU
memory region, we need to distinguish the source device dynamically.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index f5d53a36b2..e4b7008306 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -48,6 +48,7 @@ struct RISCVIOMMUSpace {
     RISCVIOMMUState *iommu;     /* Managing IOMMU device state */
     uint32_t devid;             /* Requester identifier, AKA device_id */
     bool notifier;              /* IOMMU unmap notifier enabled */
+    bool dynamic_devid;         /* Acquiring device_id dynamically */
     QLIST_ENTRY(RISCVIOMMUSpace) list;
 };
 
@@ -1184,7 +1185,8 @@ static void riscv_iommu_ctx_put(RISCVIOMMUState *s, void *ref)
 }
 
 /* Find or allocate address space for a given device */
-static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
+static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid,
+                                       bool dynamic)
 {
     RISCVIOMMUSpace *as;
 
@@ -1203,6 +1205,7 @@ static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
 
         as->iommu = s;
         as->devid = devid;
+        as->dynamic_devid = dynamic;
 
         snprintf(name, sizeof(name), "riscv-iommu-%04x:%02x.%d-iova",
             PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid), PCI_FUNC(as->devid));
@@ -2415,7 +2418,8 @@ static AddressSpace *riscv_iommu_find_as(PCIBus *bus, void *opaque, int devfn)
 
     /* Find first matching IOMMU */
     while (s != NULL && as == NULL) {
-        as = riscv_iommu_space(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
+        as = riscv_iommu_space(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn),
+                               false);
         s = s->iommus.le_next;
     }
 
@@ -2438,11 +2442,10 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
         pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
     } else if (bus->iommu_ops && bus->iommu_ops->set_memory_region) {
         /*
-         * TODO:
          * All memory transactions of this bus will be directed to this AS.
          * We need to distinguish the source device dynamically.
          */
-        AddressSpace *as = riscv_iommu_space(iommu, 0);
+        AddressSpace *as = riscv_iommu_space(iommu, 0, true);
         pci_setup_iommu_downstream_mem(bus, as->root);
     } else {
         error_setg(errp, "can't register secondary IOMMU for PCI bus #%d",
@@ -2453,6 +2456,12 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
 static int riscv_iommu_memory_region_index(IOMMUMemoryRegion *iommu_mr,
     MemTxAttrs attrs)
 {
+    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
+
+    if (as->dynamic_devid) {
+        as->devid = attrs.requester_id;
+    }
+
     return attrs.unspecified ? RISCV_IOMMU_NOPROCID : (int)attrs.pid;
 }
 
-- 
2.43.2

