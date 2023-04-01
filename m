Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213708ejb;
        Sat, 1 Apr 2023 03:51:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlZIJOdy3LTpvJcK0YzP7Cz/gzazH4k74aHIzS4/3Ue/fc4DYk1EQcYI+WEH9kZULz416o
X-Received: by 2002:a05:6214:20a7:b0:56f:52ba:cce6 with SMTP id 7-20020a05621420a700b0056f52bacce6mr53186043qvd.19.1680346315378;
        Sat, 01 Apr 2023 03:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346315; cv=none;
        d=google.com; s=arc-20160816;
        b=mUWK3qwv6ycMs6ovi5YXaD4r25LF/uFeY/U9snKr7ljaOB9szlwNOq9huPX7D6+rpo
         yjqkac2sHiWA38dcUb5BA7yevwwsbdSY91ModV0L2UDEuxDytFbeuBxZcZpa8Cu944cL
         mPcl2XNVzB7VRbPgUcSb8pGEq97MigmO7cYzyhfmQpegNuO2R/BFZUVEJ99nsrf3nQFA
         g6+dryGVDeYPT1/D3zij6kGsjnfkQzaECw3KTUT5dDH93rPqOY5U2zpWenYiHXV4BfmK
         XZs1rebI3afEo/HUDJ7lKVr3gLHRctCsSTU07FpUzvmQ0jqAh68xIcApPTkkynwcIqOy
         zFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=D8bYzLyNXIeInkuK1zlvxR+8oj7W06AeUzqoSCZlDNM=;
        b=WWxu2zfvTUfoAvWV6xoeaNczP2uD38UK4j6v437QmitzLUBRa1BHJj2gvsboQmpr8R
         t7J27veNCdV+fMaofkxXZ1IwSEQkJidvLKxdYJu0kH/zuUeB/rYYfKS+SwanVHHOL/TS
         keNoSz0vghCrK3I+WpnmL2CnNm0sn1+CkMrtToWzhbMzSCAyIc8812n0DrX/HkRFei2b
         zB9CIE/lXwn0xUjJvITtO/sz7/oy2MtPRAbgX7Vnbc0JA5eSDVhrvHl4rg1yXYXqau0f
         yQ1uax71ZM0U1Sw9ZDI72BA0GEkf+r0Qdba/kcUFSDrRXcyFwJIyoh5SgNJT+f1MY2/n
         TKnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pjqn1jD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt12-20020a056214048c00b00570b7ce3d78si2967306qvb.465.2023.04.01.03.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pjqn1jD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYoZ-0000u0-OI; Sat, 01 Apr 2023 06:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3aQwoZAgKCEo4y045mrms00sxq.o0y2qy6-m3yz0zsz6.03s@flex--smostafa.bounces.google.com>)
 id 1piYoZ-0000tA-0L
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:31 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3aQwoZAgKCEo4y045mrms00sxq.o0y2qy6-m3yz0zsz6.03s@flex--smostafa.bounces.google.com>)
 id 1piYoX-0003Ac-A4
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:30 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 h22-20020a05600c351600b003ef739416c3so7479661wmq.4
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346217;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=D8bYzLyNXIeInkuK1zlvxR+8oj7W06AeUzqoSCZlDNM=;
 b=pjqn1jD2g1av5fQumTKmd3FNI4TWCd/t6fT9v8qSV6iup4ZUXf+vGk7eF+58mZ4hY4
 u89/iSe5UD7wRHO870HKxkkExoPP3kPKsYuRG3m10iGUO2TzKeto6Us+gB424KGVn4V4
 towYmEopv9nvXB4xEyNBIcPwLKev/Lod+hrx6pIaqfs3booZHwhifRUOpSqj/eAtMLgG
 crdSlnBzsFWopyGcAA4Hb61nTKccHgja2tnkOC1Q1mqjpy8mIXuQ2tIhcaZglUmQp2fs
 uN//8KiA2e8TRTx/021AmzPnujgCsvYDAOEXulmkJ7VsbZIPOzQpuf4K74jV9oRNMp6u
 frUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346217;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8bYzLyNXIeInkuK1zlvxR+8oj7W06AeUzqoSCZlDNM=;
 b=iop6u/kAsiqZcIYvgaaYvgilyb/5jl34Ra54TefqvS5GZF8zyxeEVuB+zRQyJ5xdH8
 pt8cSxNpdq013cCNI8hGIqTZBFV93x65DVVr3WRuDLuoVU9cl3QYjPFweL1/5PaW04Nm
 4euhPaxPa7KbNUVtpI1+gZtjuun+vnLDpoonFfO8cR9KXvggWEYcYR+HcehzIffUp4/h
 YBcXWHOn/Xf5FKSDrHT2902T45JRfPG7rH8Wfj2f5gK0yd3P4KDYwsvgOLuvWKisagp8
 EtNCMfy8sZP5r2EZVoQtIvjBbGcDpAjGlll/ZOpuAm9NjU+K3jj69xkrP0v6/3d3atQj
 9d6Q==
X-Gm-Message-State: AO0yUKWbI1GgCVkhxDireEEd3q0AHMk0mz6pEke/9YQE0hu8VBqRBtXJ
 yd7Dym1uPOAft7WITCGBmnDly+ogokOtPQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:c414:0:b0:3ed:7664:6d79 with SMTP id
 k20-20020a7bc414000000b003ed76646d79mr6953447wmi.0.1680346217192; Sat, 01 Apr
 2023 03:50:17 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:52 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-10-smostafa@google.com>
Subject: [RFC PATCH v3 09/10] hw/arm/smmuv3: Add stage-2 support in iova
 notifier
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3aQwoZAgKCEo4y045mrms00sxq.o0y2qy6-m3yz0zsz6.03s@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: EaLQ02F5Bh84

In smmuv3_notify_iova, read the granule based on translation stage
and use VMID if valid value is sent.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Collected Reviewed-by tag.
---
 hw/arm/smmuv3.c     | 39 ++++++++++++++++++++++++++-------------
 hw/arm/trace-events |  2 +-
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b5b1fad1a..826aacf8b1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1006,18 +1006,21 @@ epilogue:
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
@@ -1032,11 +1035,20 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
@@ -1050,9 +1062,10 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
 
@@ -1060,11 +1073,11 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
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
@@ -1095,7 +1108,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
@@ -1113,7 +1126,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
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
2.40.0.348.gf938b09366-goog

