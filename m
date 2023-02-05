Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3074499ejb;
        Sun, 5 Feb 2023 01:46:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9dlVf2d0/G/dqGs++u5ZOiP86WYIH7Drn5VmrETSdVPVyJ5zp5xDZzXBPwy3PgcdLfFJhf
X-Received: by 2002:a05:6214:3018:b0:53a:c84e:8f16 with SMTP id ke24-20020a056214301800b0053ac84e8f16mr29792152qvb.42.1675590392997;
        Sun, 05 Feb 2023 01:46:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590392; cv=none;
        d=google.com; s=arc-20160816;
        b=nDTsC7GNg2vmiTUXzP5xGsyHuXUiUWW3pYnwWVZU6NJhR19R1lgkXmG4L/zW9iTvUq
         PnHriJbBvGgJ9xBl/3VSWe5OOZoIzKRuy5Be59nTn8Nf4y7+I67F5lRXC7SGcxeCrz9g
         CCJJeHaJwYvFbORWeJu0xnMUPmCXLGpr630UtfA5hsCFJdOgEpe6J0Tym6/lsHGWkkpf
         s/ZhG7ao7B8Vw5xUlOjWSB50FFTK7cU6kDWZA4VV+3hNyRusQ4r82RHa8FsGeE4ZYcdb
         Jhuf2QTL67ZBmc5Yky5ZxrazFKZ7BHNTd56HqVBRGp7O/bf1/PoVq/MCdfgMxQqRvBkT
         vB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=61sSA9pfY24gGI3vL07QbZ7ia+CN8svITseJ2KNlYjY=;
        b=XnuEttjTkj7Qqu8P5rZVb4iFJyvwShh9/3zRYD0W5/NsEJSGdntBTLeaGn12cuvxpL
         DW6CmJxz3PPjoWQfA0LQpv0Ejj/2dyIk32ZOPdF+jnnSuXz6iQmxTpJSFlmSEpe/EsRo
         A3rN4s/HZVUfRn+W7cmdo4wYiH8o7gh+CtbB05AT7zB8JZgwq32vUjwF52DuWO2E/yhS
         2Vm9DWIAZJv1JNMshCKPLQ6jcCAM8ul/cYsCoG2MRaPrmtUVd3xuGVyZ7dWQVapergtJ
         jZBvmfaBY4v+7gDPbx0MEIoFoNOgUFfwp4yd02EZb1yv9P26/LgJ9iWjpU3rUPURsYdV
         Y0Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pPVtPNhQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u186-20020a3792c3000000b0071ecf4f7a79si5245138qkd.235.2023.02.05.01.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:46:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pPVtPNhQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObbB-0005mL-UX; Sun, 05 Feb 2023 04:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3z3rfYwgKCmgYSUYZGLGMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--smostafa.bounces.google.com>)
 id 1pObas-0004wE-Hr
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:59 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3z3rfYwgKCmgYSUYZGLGMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--smostafa.bounces.google.com>)
 id 1pObaq-0001a8-NN
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:45:54 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so4172916wms.5
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=61sSA9pfY24gGI3vL07QbZ7ia+CN8svITseJ2KNlYjY=;
 b=pPVtPNhQE3y2EpZRqbz8x/41ldvpcUT03tG2Jk2TLAsLCtiLbNjINrjM1P50XNhafm
 1qQVU3FbTDYnSu6aFDGfQ4obh8zT3XSB9dJByke5PMRjiHtAwhl7moYUEuaLUgI8qC7s
 eGGZOySRDMi3KydF7/+aMcLOeRNRIV4uIQGpQ+4do6DzSNYDDdt4Af/8Kr5eqgOtxmzf
 5Et1ZUp0EAAoRk4pwgCwT3XA7SzrwCFPzpzJnWPquiriKcW/yQmCMzhL7AM5BL4cYgqW
 uQrpfuvUvPgWdH7SPTTyomSGX8WydMwFQpH6s2hnWxfyvZ9IWB0mwqxnJVQXbm1gu3JE
 8f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61sSA9pfY24gGI3vL07QbZ7ia+CN8svITseJ2KNlYjY=;
 b=IGUOpSgwbmkIHCW2NMYmDcVjMZKjjTTExfDUa5ltUAByu7MmxAkOkORc5e8E1JbAYe
 jq0fLAKd3+Z1/HtZSbE+LBuUSRggpvoQXYod/zH1tEjvklXMq+o8expLKmvEt0Jnd05P
 YyDtQyQFR9QtfH6kki2muZhhxFpMklNVldGPLGl349RrQNVlF0SOK41r5pRrE4We9doy
 w+q6B8aK4VNcaQb4R8fbWwWs4I/N6AJiNn7eb3NQlHEm+5L8n6gSUk/DAjmzZ2xeF8JJ
 0uG8T/kb9Er/DVWO7wtbSmqfgrtEJrnNCndAilXl1IhqamrMvyPJK+H/8JrseIcBHE7i
 0XMw==
X-Gm-Message-State: AO0yUKXYnGoHtoA08Wpyk9Z7Wh8eXQajIMo1FBYIv2qHtpMh3xjpgSBZ
 HKiPB5YKJ2iRmqp9P7Ao2UabP68h6C1OZgFonPC+8YaDdmCjDVKf9AV6G5FtUEybMR7ri0oNTjO
 09+jO0NXzTtirR594D7rYCpz7JZQr3JB1YMHRCosJE4D4JB14pywi9EJHBab0oE0Wyg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4395:b0:3db:52b:8ffb with SMTP
 id e21-20020a05600c439500b003db052b8ffbmr639017wmn.14.1675590351284; Sun, 05
 Feb 2023 01:45:51 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:09 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-15-smostafa@google.com>
Subject: [RFC PATCH 14/16] hw/arm/smmuv3: Add stage-2 support in iova notifier
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3z3rfYwgKCmgYSUYZGLGMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: hBD4skMpJsET

In smmuv3_notify_iova, read the granule based on translation stage
and use VMID if valid value is sent.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 39 ++++++++++++++++++++++++++-------------
 hw/arm/trace-events |  2 +-
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2b563a5b1b..e0976ac236 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -919,18 +919,21 @@ epilogue:
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
@@ -945,11 +948,20 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        tt = select_tt(cfg, iova);
-        if (!tt) {
+        if (vmid >= 0 && cfg->s2cfg.vmid != vmid) {
             return;
         }
-        granule = tt->granule_sz;
+
+        if (STAGE1_SUPPORTED(s->features)) {
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
@@ -963,9 +975,10 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
 
@@ -973,11 +986,11 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
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
@@ -1008,7 +1021,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 
     if (!tg) {
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
@@ -1026,7 +1039,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
     }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 61e2ffade5..625cf16f69 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,5 +53,5 @@ smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
-- 
2.39.1.519.gcb327c4b5f-goog

