Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2449444njm;
        Fri, 7 Mar 2025 12:41:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXG6YxZisrxpfTXsuK9S7+xmQzeG8p5jTKnfJDJ4DMh+k1/WK2FkMCwPJxPg/14bN7KlvRV2zuDFUckag==@linaro.org
X-Google-Smtp-Source: AGHT+IGEjHq908qTpIOYJXeb9ws2PpMUjbApzA/M7UR3asaheF4+v6rd/do5P4drp3/uPXS3nc1w
X-Received: by 2002:ac8:57c9:0:b0:472:8fd:90f1 with SMTP id d75a77b69052e-47618af1e83mr56255051cf.51.1741380077942;
        Fri, 07 Mar 2025 12:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741380077; cv=none;
        d=google.com; s=arc-20240605;
        b=l1WtF94MT0n1Icgf3jxE3SnHL9dC530JSlxO6LIU/TQIChMU6oEUTVZuwFNxibrEzT
         I7ZXcUqFQX+bykFqYAohP185kL33OuCqCdWYBZU2kXj1IW1WWMN6snS8xjA3qJR/gqKc
         iUJrPAmNRS78GvSzq3ciCAisVOQUwuqXRdhybmPE4mHm5TqwPTcsPGfTRKuKAO0jFZor
         rQ5VWkdVc6cTsOuvcNgYwjrlbnRh7XSbhLhRdS6W6FQNKbNMqAr41DnlfNM3UClW0jEF
         Hht43gQXvKBoWWv3oomQfX3K9tySsgk/0HE8dC94qSMtUzUpnQQAyUTRJiIktCEudOvZ
         na3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zxx0WY85eWS+nBxEymR5IyPvpq7FG/RiNFvCALVpVjI=;
        fh=Z6qyPHVO3m31QP0N8c/p+9rrnWZRukaCDtWkNRbrN4Q=;
        b=TcJyjfxoihuOrA8SMoBP61h6jxOdaMVLvDoRcpW0JP/MAlfYq3fupV3BqUyeLFlzSu
         fw7uc8SecNG8ZoWlmGGSniQasPEUqn7C4EHy2Llc/9TSJEEs5HzOvZiRL9jU2aH8zKfM
         cBUyFo8Y6r1ywDpxdDpHj8CAo8JV2baXUZctb1r4Za4iB0UQXv2lB/OKTPDijzPxyufw
         syPUPMJ7KpzRa0Wo3rJ2PYbAHUXdj134jWVkYjyckrjBYRDKEsEyPTVm1+BG4jfqxSyI
         jNdaFM+mH0YMIjV0fwSCxViCPjD+G38Q+uvb8QBfOWBoe5pwERhhE/sTj6W6i/IY9aSP
         Hjiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=E5gsurGM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db5d507si41316451cf.636.2025.03.07.12.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 12:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=E5gsurGM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqeV7-0004jU-Vn; Fri, 07 Mar 2025 15:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUp-0004Rj-0s
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 15:40:43 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUl-0001xZ-9k
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 15:40:38 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fe9759e5c1so3569917a91.0
 for <qemu-devel@nongnu.org>; Fri, 07 Mar 2025 12:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380033; x=1741984833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zxx0WY85eWS+nBxEymR5IyPvpq7FG/RiNFvCALVpVjI=;
 b=E5gsurGMhY0d06ODdfufhBqGF5+UXLsXCe3G4vRT+1qemLV+EuZVGIrLdFQWGF0GIP
 q3U5S8cdUcQXz1P4XSofdbB2HYb7n01QGCoQtdw8CKY93cKYORSt/5msXscvMb6j4fQX
 hQvvq9TVp/8h1yiR96Q5Q4ChdL5IYvxbSCFlyExumHduVEtJJWdI4bIh0TCk8UlwXQsw
 y5VKQKaAKLk9Kvam0XCCLzfUbNmDgxJBMIHh35nK9mxy9ySScyDGaF7j9aHinipeGjKR
 PUGFs4s2h3ctBDGuUlm4vZooOzAwzu76AyBT5A1DwRvEFMn16/1COMLJcq9w8508RSmd
 M90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380033; x=1741984833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zxx0WY85eWS+nBxEymR5IyPvpq7FG/RiNFvCALVpVjI=;
 b=WtAyj6kOvdFzMa/W2ASz97nNjGi1azcd8UIqv2wU75Vb+n/7399rH/NX2+vrXfOEs+
 yVFwQKPeEhw802CMlI0IGyPlQ+nl5VDkZyyhQLpRgXfj/1Vc7pS74zC0ZGs54qO6/Ps1
 8wh1tQjNDgY5WEI6ch/nMiCEU8ZPf6Hiua55HmrDPbYpU66Eff5pdUpLJsEc8oH/AWs5
 Lqps2Uqo3zTtky7Ygt1WQWK1D2h2dwI5tmSZ8esheETNsqVKZi8njX1GXTDHoWX5I9dv
 UFeJqVzJ2uwiuv3XOfeM/nuILPdUv7MyDr7rSlqKQqgUqjdSDibYXX+vHkw49YF8kBex
 SvyQ==
X-Gm-Message-State: AOJu0Yw+p+oRWb35pHdwcmSu8FlWetqXjEa00VcGKdkK6d64fDc3Pt/D
 PmchMmHsWrOFXYR/X9pgnXOb1mRSGepq47fkd9DcTERushP6AiHfoUWPb/KaPwAUV13lLweErWz
 8zzT6bz7/nH4KH07sf/nCO4o3hUMV8xiWSVXp2w9nfFoguoYTuczLn+nrIIOGO0kPQYxgOtDoIm
 j4rVGnu15tZ4IExLMIA2nebF+6jKkUN5bYkn+uQhw=
X-Gm-Gg: ASbGncuOcnJWK9aNrqkzmx3lBODu40Pj3f73JTyKwDk9dfE4tIaq6ltRz3Tzs6KAE8t
 FrEpef6n1drytdqWp7jATQ68nZLwSeB/dMYcdDdQNGsdLMh5oFrAm+XL9hRW1ZuiN0Q6UbAUkJv
 H5J3XEp/XIF/fyiP6WUY1l/vh4NSeyPKSbEyUDOdAaGXTfeKIqvG/fYQ6glVrg1lg1clVpmTBcE
 //hNhfqC0AKxZKFCMVK/EKML/iQ1E7aewyt3O7vY9+zmg0Vj+pgr317R6Tz2wAvE4tcmS8X2TV1
 ejfkAqOV4M/4cUcUcNorGPHu/dgS42PP/xeYA3ImDVTSqNvvWZYscDSbZaXN7/PDLKanYXN4
X-Received: by 2002:a17:90a:d44c:b0:2ee:d433:7c50 with SMTP id
 98e67ed59e1d1-2ff7cef6419mr6211011a91.23.1741380033200; 
 Fri, 07 Mar 2025 12:40:33 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:32 -0800 (PST)
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
Subject: [PATCH 4/4] hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts
 that have ATUs
Date: Sat,  8 Mar 2025 04:39:37 +0800
Message-ID: <20250307203952.13871-5-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x1032.google.com
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
X-TUID: ybC9aGcs+kiA

When the IOMMU detects that bus->iommu_ops has been registered, indicating
the presence of an ATU, it sets the bus's downstream memory region to ensure
transactions are directed to the IOMMU.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index d46beb2d64..9701fe3831 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2628,11 +2628,16 @@ static const PCIIOMMUOps riscv_iommu_ops = {
 void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
         Error **errp)
 {
-    if (bus->iommu_ops &&
-        bus->iommu_ops->get_address_space == riscv_iommu_find_as) {
-        /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
-        RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
-        QLIST_INSERT_AFTER(last, iommu, iommus);
+    if (bus->iommu_ops) {
+        if (bus->iommu_ops->get_address_space == riscv_iommu_find_as) {
+            /* Allow multiple IOMMUs on the same PCIe bus, link known devices */
+            RISCVIOMMUState *last = (RISCVIOMMUState *)bus->iommu_opaque;
+            QLIST_INSERT_AFTER(last, iommu, iommus);
+        } else {
+            /* The bus has an ATU. Set its downsteam memory region. */
+            AddressSpace *as = riscv_iommu_space(iommu, 0);
+            pci_setup_iommu_downstream_mr(bus, as->root);
+        }
     } else if (!bus->iommu_ops && !bus->iommu_opaque) {
         pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
     } else {
-- 
2.43.2

