Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4029211ejc;
        Sun, 26 Feb 2023 14:08:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+YUtWyhCSA/GTTnEDPPF+jqOL7YxKy67EZ2F4YCq3budxZXyQC0nnZ6eaA2j/pD6NKuFxR
X-Received: by 2002:a05:622a:13d1:b0:3b8:3a7c:d208 with SMTP id p17-20020a05622a13d100b003b83a7cd208mr39508919qtk.34.1677449328417;
        Sun, 26 Feb 2023 14:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449328; cv=none;
        d=google.com; s=arc-20160816;
        b=HyFWgFj0OStacc8678wZT7M0wEKjuSmEjoK8tCt01Fheu4Ha87jDn+a747oZhPV3n9
         palH3zzF9b41YmGCkkEjk32jFJ1FffP1Bd+dzcNktXo34qkuTWqaVac2qKVkdlm2gxhZ
         MtY0XAdLL77ML7mY4JxFoUILnDLa4jfxUQ8/hDKzjUB7uavREDS3YvmLOz1CCI8SS9E3
         yfyiT02XTzXLkvcLipldbny42yyNx8T74P6DZe5MgVW4RkDhbC9CzrXEkUaGvqB6XqKi
         8yvQxWZsOr6NmX8+vdvzrAGBTvXrJj1HLF9a+kFIsQ30IDIYdw+X/d4MKB4OwcZol9AF
         kTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=JlPd0DK9kbtSrRzcFmcepGFWM8AX5M3SBMBW2iYq3WM=;
        b=gHeD0DT6jcyCGaua2VycQaB1Sm+S0gsRHayBj21QRKAyd55uIq3QcgrNBiBB1vb0a9
         SZGpUDV/D6uZ2c0FkB1YCiTIMh2Fd4FVb78DEspxIqSWVJUfdFVHkfUVOM8qedZwZHoC
         6CLnOttJl1HQbvSIu4hq0ePKs+9PUf2NhoWpSELB1KLnuQTFXO47850+EjzJxfSWQdKS
         5Whzpy3YP6Vxe6pr/0Uau5BntIkI5xPY19tuGVJTZALUlloWrkRAzAvH1hSUbt946mQG
         lFcG/vEi1SWKxhc/fDUcI3t+SNMOLURAOIQLU2DTeJLycGHZ6dM28oAmPsAUcXb9BiNL
         vvCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DvRjjjPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o127-20020a374185000000b00742936bf162si3356852qka.729.2023.02.26.14.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DvRjjjPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPB0-0002YW-9s; Sun, 26 Feb 2023 17:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Gdj7YwgKCN4SMOSTAFAGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--smostafa.bounces.google.com>)
 id 1pWPAy-0002WS-VB
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:24 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Gdj7YwgKCN4SMOSTAFAGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--smostafa.bounces.google.com>)
 id 1pWPAx-0003uA-71
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:24 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so4397398wma.7
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JlPd0DK9kbtSrRzcFmcepGFWM8AX5M3SBMBW2iYq3WM=;
 b=DvRjjjPJkjrXk4AXCvm1125zelt8dSeJ5E9qjwdUqRHnk/zxMoAxP3wn5TdSIIs6NZ
 plzuznAQMjl0BZKIs6zrtC+9RDOv57cEE9pcDjEa2Dub5oVdgv0xmzNowTSflSE8356J
 gTXc1+4Y2SSrbRpSEqBv7wXLLAP/STz52VVdE1H9PZBwkEHbGy7Ofa5mOrNACBIf5P9v
 AVv6whbEup9Q5DoimHUSP5/cmmL6KjJq7GsY8pQ5hCNnMxWUX+I3qzpa5EtkDhE2iFhA
 dr0o4VdTpBZYP9q0Tl6NuDrRpYbexE4U6D8tWms5cRu9FJ7n1HUxICMuDOb08AIeRm80
 otSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JlPd0DK9kbtSrRzcFmcepGFWM8AX5M3SBMBW2iYq3WM=;
 b=1z05RvwPdpx05u0AsQJ+ZlMl5B6JHxalBLW3QfFJU710KiuzSk2AktxWgLQb4udlE6
 CIPtXDHb21U/nQxscCh20FWoaG9yI1u1rDqmwwebDDdYM5HUGA2xR7rG8woZ60+xrFHK
 nG11wBIsqczVmPfMPhcH8jAq7MSvGzHyljcxM7bkSs+imZAfYngA3Msu4zDrZgD5Q3dN
 M+BKnHSfO6I9S+79kJiEfVr1h+o+GsJqkpG1Bh52glPZ0PmuukXd0wCCuMC5AYgI1J+u
 s21KnwptPgIhtcq/6WRItWoF/MLvGWhCrmh3Aytn0DOMre27OGw+rAJj5z3SSpP5PZNO
 krUA==
X-Gm-Message-State: AO0yUKULQGAdb1j4NLzNFx+GVr/ufra3F5NmC1MdzpBVHUCCe5Uq36ks
 oOmNy1NSYI6ijna4y62VjupvaTvhziiouQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:adf:fc51:0:b0:2c3:e6f6:7f37 with SMTP id
 e17-20020adffc51000000b002c3e6f67f37mr2416440wrs.5.1677449241757; Sun, 26 Feb
 2023 14:07:21 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:48 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-10-smostafa@google.com>
Subject: [RFC PATCH v2 09/11] hw/arm/smmuv3: Add stage-2 support in iova
 notifier
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3Gdj7YwgKCN4SMOSTAFAGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: sU+oFHxtFls4

In smmuv3_notify_iova, read the granule based on translation stage
and use VMID if valid value is sent.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 39 ++++++++++++++++++++++++++-------------
 hw/arm/trace-events |  2 +-
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8c76a48c8d..7297f6adc1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -971,18 +971,21 @@ epilogue:
  * @mr: IOMMU mr region handle
  * @n: notifier to be called
  * @asid: address space ID or negative value if we don't care
+ * @vmid: virtual machine ID or negative value if we don't care
  * @iova: iova
  * @tg: translation granule (if communicated through range invalidation)
  * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
  */
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
-                               int asid, dma_addr_t iova,
-                               uint8_t tg, uint64_t num_pages)
+                               int asid, int vmid,
+                               dma_addr_t iova, uint8_t tg,
+                               uint64_t num_pages)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
     uint8_t granule;
+    SMMUv3State *s = sdev->smmu;
 
     if (!tg) {
         SMMUEventInfo event = {.inval_ste_allowed = true};
@@ -997,11 +1000,20 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        tt = select_tt(cfg, iova);
-        if (!tt) {
+        if (vmid >= 0 && cfg->s2cfg.vmid != vmid) {
             return;
         }
-        granule = tt->granule_sz;
+
+        if (STAGE1_SUPPORTED(s)) {
+            tt = select_tt(cfg, iova);
+            if (!tt) {
+                return;
+            }
+            granule = tt->granule_sz;
+        } else {
+            granule = cfg->s2cfg.granule_sz;
+        }
+
     } else {
         granule = tg * 2 + 10;
     }
@@ -1015,9 +1027,10 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     memory_region_notify_iommu_one(n, &event);
 }
 
-/* invalidate an asid/iova range tuple in all mr's */
-static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
-                                      uint8_t tg, uint64_t num_pages)
+/* invalidate an asid/vmid/iova range tuple in all mr's */
+static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
+                                      dma_addr_t iova, uint8_t tg,
+                                      uint64_t num_pages)
 {
     SMMUDevice *sdev;
 
@@ -1025,11 +1038,11 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
         IOMMUMemoryRegion *mr = &sdev->iommu;
         IOMMUNotifier *n;
 
-        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova,
-                                        tg, num_pages);
+        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
+                                        iova, tg, num_pages);
 
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, iova, tg, num_pages);
+            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
         }
     }
 }
@@ -1060,7 +1073,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
@@ -1078,7 +1091,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
     }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index f8fdf1ca9f..cdc1ea06a8 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,5 +53,5 @@ smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
-- 
2.39.2.637.g21b0678d19-goog

