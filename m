Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2449438njm;
        Fri, 7 Mar 2025 12:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXE0Z0leAWq91nGYrMyMmMrB8TmlZ7AHQABbR5lru5qfDcFPoPEnDHlZJyZ0Wb3RJNKv9tVtnhQnLCi7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFwan8SI8nRkKIs7AsyVF7QCrtCXbjko1cB0jDu/nygwNj4VtJ0jUmy/N7G91iMLPRAZcC1
X-Received: by 2002:a05:620a:6285:b0:7c0:b336:5729 with SMTP id af79cd13be357-7c4e6193ea2mr827455585a.49.1741380077490;
        Fri, 07 Mar 2025 12:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741380077; cv=none;
        d=google.com; s=arc-20240605;
        b=PE0YfRXmbzLekzhxTCACerDPCNYpYoXzO8CwzubY2Ecmc5TNtBVIjUPQEuXQ6Hs6jy
         sTriSvLg8FbnuTn1sBdiLlRuOC3fvUaOcyHtxbe9GBKaNAIiKZbXwfWz1W/P/OkmvEu/
         J8N7ZLIkUDQOtaAzPQBLo8FTx+8FAORwj/8u1KIKJoSSU2hJkiCStPSxPd/XsUXuGwXH
         A/vuwdMv+W7+ZJuWUCf/WKivSCdVbO0Qpt9ccii5x6xzyviGz5TdLXzMvtcZ4uYG4mzc
         e7QforyBkbolsBCwRSKd4JXr4TLPLZwYExFwt3KK3nOzXFwsz7/5S+mYp5yA2zCTj5hr
         k52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iEe0rHIOQ6h9LxkKOZ8XIB5DeqYtbj0ptb/VSdm22+8=;
        fh=Z6qyPHVO3m31QP0N8c/p+9rrnWZRukaCDtWkNRbrN4Q=;
        b=lS5WwQ+6xJtesRMKsNKGmJh+rGzmvtlDLcIAtJLLRTqUVlkXAN2bzxMXa+saFfXh7P
         mDkxAbfU3B3vFkR+Br4WpYCPQl7DJ3Z/IRqzGK/cVWZAT7fpkYAV1Fej3yKk4KsL3Z1w
         JMm1yn09IutgwOxYH4FRFzIrnh3QDZG+tpKlCx83w7j3X03ewdT3354cXC8JO4+thCSv
         eIWhzlg2gKPyEoDdbC+MPksveNFXV31v/AcJVSTXKaXzXIUqDg7bhkagjvFkaMULY/0k
         zQ0uYF5fe9e66tBUU5BsDMPqQScKQQ2l2VuFT8noxIdAm3UOW6OU1TJloJ0MqaBrTDjj
         9B/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=kxG4EkqH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e536f2eesi395296885a.186.2025.03.07.12.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 12:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=kxG4EkqH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqeUh-0004Qr-WB; Fri, 07 Mar 2025 15:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUf-0004QP-E9
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 15:40:29 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUd-0001w5-7s
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 15:40:29 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2239c066347so43376225ad.2
 for <qemu-devel@nongnu.org>; Fri, 07 Mar 2025 12:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380025; x=1741984825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iEe0rHIOQ6h9LxkKOZ8XIB5DeqYtbj0ptb/VSdm22+8=;
 b=kxG4EkqHzhmHO7OPZul21m9dQpQDu1e6uEJQdr0o53cjRZAT3H+sMrLyxHsonLzfJF
 8c0jxadHgpstBFnquSfBkiAMNUZ1qbc+maEu4XFzdKHjVHxHE6IB68AEyMf1SiwGQAwE
 oKzbjl2XwH3fP+7a7QpjVGPjGXJ5iWOk3kj/gZsQWhBYZz29hpDwc0HJxNfdLuk+4cgF
 R6mkLQySUbxzEzW1Baqueyck8oOFa2QsgKGl9FYGHYvZiqdTMLW/0WokDR9Hnx+Dt8ZV
 XDRej60c765/MR4VCejCRcbzO9Id4Jlkfsua3yiEP80z3FL1D+Ej3Ij4UTo1NL2Pr0VF
 L5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380025; x=1741984825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iEe0rHIOQ6h9LxkKOZ8XIB5DeqYtbj0ptb/VSdm22+8=;
 b=b6cwtbF020q93HmBx3+4/RXMXehi0z416Es4rKivRTdnQVSOpgqNipZWvHjvaSISXf
 Nw0LSTPJP6VBnLdULL6E9M1gvJOlP3ZciqH/FKq6chIq9skZ0NGfbcpTPHkq6MEQ2Odf
 PzRe/1DVLk6+3m3/AkvFtwAp2JsX7HuGvVnJ5Tz7yzSMKl+ODgEKN3XX0oRQwGWVHbET
 hT2OZwEVbqAqfukdlm9O7zl5JyGQgpQa2UT8Yl/lAe95JxHGjBQKgpXDGM+OQK2VFPNr
 4mEbghBWGclcj2NvNn7fqagoDyZBDofLHXdMpNtxkavWQQuJxtHNUX+q+S38PvbzV583
 huHw==
X-Gm-Message-State: AOJu0Yxvbu/Tl9HjTxfU71o9fCvwqqjo9fTbONA/9vZPJk+dCNLvmSBL
 w38nLD05759gNsPNQRJMJcpV7BsQK9RL9PNz94kSyICJYLif3rDBnKd0XTq7cYJkTdKFBfwY4Pm
 4dlnUisZuVfjBIn4MzHDULFKwH4jH4QrcMl43t7XxfLIO16EaUC37N3LqxURfv2TueebQWnIaja
 MiKxazsW+DY+Et9EVlSz1mfPedHaxYNG9YCk/m9Ow=
X-Gm-Gg: ASbGncugg9Y4TTAvpEEErhk98camwA9CAcneoHsRsPS/YXOxijBFjIDeO0Tsw7YRiRJ
 kzFDSv0VKaevUaMHBJqZ53gve42t9dISdkLmP3TlP65TIZ6EeWaBxEe0KZjHOs89al7Oz13NAPM
 L4kE4aKNEyk38MSpbWeYe1YkNxNZSG1N8vYPb0z3bqpleu1V7fYDKECEdutAPYmh6SzDN8cIbzi
 xOlQrsmme3+rKOHwAaOISfj6lLJ1nxS1zRguTStx3H3NdAiBqlSvzX/mAEFPOCvpLspf13uXdNc
 lVNTA/5O5bzxF6AFB0P1x102q/c9nlPLVt36D7JtWZ3WUsGHzj1HC4jwl2snGhs3OLED+FzD
X-Received: by 2002:a17:902:e5d2:b0:224:160d:3f5b with SMTP id
 d9443c01a7336-22428c1169cmr79400585ad.49.1741380025111; 
 Fri, 07 Mar 2025 12:40:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:24 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 2/4] hw/pci: Introduce an API to set PCI host downstream mr
 for IOMMU integration
Date: Sat,  8 Mar 2025 04:39:35 +0800
Message-ID: <20250307203952.13871-3-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x631.google.com
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
X-TUID: RUMe9rephpA4

When an IOMMU detects that a PCI host has registered struct PCIIOMMUOps,
it should call pci_setup_iommu_downstream_mr(), which invokes
PCIIOMMUOps.set_downstream_mr() to configure the PCI host's downstream
memory region, directing inbound transactions to the IOMMU.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci/pci.c         | 8 ++++++++
 include/hw/pci/pci.h | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1d42847ef0..983290ef0b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2858,6 +2858,14 @@ void pci_device_unset_iommu_device(PCIDevice *dev)
     }
 }
 
+void pci_setup_iommu_downstream_mr(PCIBus *bus, MemoryRegion *mr)
+{
+    assert(bus->iommu_ops);
+    assert(bus->iommu_ops->set_downstream_mr);
+
+    bus->iommu_ops->set_downstream_mr(bus->iommu_opaque, mr);
+}
+
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
 {
     /*
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index fcf648da19..1ad5dc7d9d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -442,6 +442,15 @@ bool pci_device_set_iommu_device(PCIDevice *dev, HostIOMMUDevice *hiod,
                                  Error **errp);
 void pci_device_unset_iommu_device(PCIDevice *dev);
 
+/**
+ * pci_setup_iommu_downstream_mr: Designate a downstream memory region
+ * for a PCIBus
+ *
+ * @bus: the #PCIBus being updated.
+ * @mr: the designated memory region.
+ */
+void pci_setup_iommu_downstream_mr(PCIBus *bus, MemoryRegion *mr);
+
 /**
  * pci_setup_iommu: Initialize specific IOMMU handlers for a PCIBus
  *
-- 
2.43.2

