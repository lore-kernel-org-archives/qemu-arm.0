Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp661293ejq;
        Tue, 16 May 2023 13:36:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5f9co455zTPwIQDDcTlg9chbfvA1GrOdsOEgoTnOVLe43jGR/jmNZd61e8qQydhERG/0kL
X-Received: by 2002:a05:622a:1807:b0:3e3:8ed5:a47e with SMTP id t7-20020a05622a180700b003e38ed5a47emr61586952qtc.10.1684269363487;
        Tue, 16 May 2023 13:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684269363; cv=none;
        d=google.com; s=arc-20160816;
        b=k1F9/PBDHb87+6X9JbfXxN2dJ96H6kyHJhjcL1JjICkNB++wA45GEx9ojokDp5rNbS
         EHlCUuogvHOW883sSfNvE1s/sJVVMG0iXMbZGcifK1uwWO4UFOka+zKmJ9fMdxC9sc4Z
         /4vvDSnNUVc9Rh/D1WYPROKvvpNjezuf8Vsi6/chPfy7xFGua8u/ZbvkE7B9nlObZ2yY
         y0ZIa0xIFPoqxGcKcweweKTiUL7lpqguLcdmfW4qZ/LyYhv/Xg4RUnHgLCnlhukc+ptb
         DoWSsRyw6QbXETCw5CiSOy/IS/nAU2/6HlSMe1wmjaa+vuK3u3ZGRENOQOvlbrQhgDyP
         mIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=OQ2D9EHEdJzHVZOExkFVKMD+djzRyiuPzFS6Inmm1QM=;
        b=KgRcOOR32e6MF2dPLcd7YoYWpKpYmgXxgqAQ91k3C1DBPD/yWG7bQZIZ0yCO+ALHIb
         lwfsoBv1XBPiqLCjV+tPJJPTLgZY9iSc9d++4yoYA4Bs6cWz11RSTb3kOYL0/5cdDV+A
         jlbwIToLCuaFS2ymWFF96cFJG3moPAK0U7hIWWBxYArHePMNTcKQap2P5x+j8c1IFHT1
         6h4qoIbr+PL6O5CoSE9dMiP+0SH4ITBzigGOI070ASicJR0BG2bA6HHEP0W7VnyaOMOB
         zAKIS5ZDoMxv/52yoQl4Tuh1rp1yHt11gMqtwJUHlohE79joS/0WFe9dRVaK5MEVYVvH
         QoTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=Jik8YTlu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020a05622a024f00b003f5473f9f21si1200598qtx.385.2023.05.16.13.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 13:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=Jik8YTlu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pz1NE-0006Dz-9P; Tue, 16 May 2023 16:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xehjZAgKClAA46ABsxsy66y3w.u648w4C-vwDw3565y5C.69y@flex--smostafa.bounces.google.com>)
 id 1pz1NC-0006C1-M9
 for qemu-devel@nongnu.org; Tue, 16 May 2023 16:34:18 -0400
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xehjZAgKClAA46ABsxsy66y3w.u648w4C-vwDw3565y5C.69y@flex--smostafa.bounces.google.com>)
 id 1pz1N9-0006iT-G1
 for qemu-devel@nongnu.org; Tue, 16 May 2023 16:34:18 -0400
Received: by mail-wm1-x34a.google.com with SMTP id
 5b1f17b1804b1-3f42b226871so83695e9.0
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 13:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684269253; x=1686861253;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ2D9EHEdJzHVZOExkFVKMD+djzRyiuPzFS6Inmm1QM=;
 b=Jik8YTluH9sQkda4j/34MF9rf8CeqgRVbBS2zt43xt/U+y7aLVct2tsOkT5q+kMphE
 th6TcwDetiZgu+Z9OO8Qcpnqz2aS80UfNl1xs9HS6I+VoF7W+0+xNyBqM8uk05vXiXP/
 I5tfpmjUcvS9X6IWFGeewEihsCVjaag0bETp7GFi5TShl+6xxfLKSgpdTXsl4n+mmBna
 4xuj3FOs6eSVLvSzmLG57SDRloWjvaej207akmHZNsZeywySJQlcuYhsm8pcnnrDWGbm
 +aFaHBMGcDi3V2SuZUYhRZteuqaVPbWn+ksd7IbwLuWuV3lAO4btLnOvqx4Oc6lNeKUG
 zOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684269253; x=1686861253;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ2D9EHEdJzHVZOExkFVKMD+djzRyiuPzFS6Inmm1QM=;
 b=MgmWGPWl9ZIND7qWj2MyuCdL2CL7oDH6OXLtNKYIy8MwTWZqVnug2c6KWHF0kDk3WZ
 DeH0qoAVJml16aS1Exp4pYH0Kuj+7E8q3MhvFidtLKgx2VAl+d2Pl71O455kITNcbmeJ
 lv+0sWcN1W+nzKuWH3Tus986GXFBoGc8huDankweTXN+on0/3wXz+fTQfLD6387zFV1y
 npkA/X3RT87i+K8zpRsSMLfO1eBDWV3hmMNDMej0x9FrhgPLSijtoOriQh9U6VupLb2d
 LzIYZU1PXTxn8nw5camIB1fQuYmBqAcEo1Y5xoph44CXFgTp1WW44tX0lL72DLQJbh1T
 4OOA==
X-Gm-Message-State: AC+VfDwFyx+ikKH357k5vhJco/yzTdhp5ebMU2tqcsxL9AyNkcR7oKR6
 duqmgnvNbShxRAzZ0TeZ70oOUU/I6jUvFtHZNZnXaxlwUZjcxvnXozD7HAphO4oqEpzroSOcxfo
 jUSQfO+Ff1ysDxN0YTPSrYBAia8y1kK8ifd5FlrkFBbnsHieRhtpnriNwQK9gOeYE+w==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:22d6:b0:3f4:f0c2:11e with SMTP
 id 22-20020a05600c22d600b003f4f0c2011emr3051988wmg.2.1684269253261; Tue, 16
 May 2023 13:34:13 -0700 (PDT)
Date: Tue, 16 May 2023 20:33:16 +0000
In-Reply-To: <20230516203327.2051088-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230516203327.2051088-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230516203327.2051088-10-smostafa@google.com>
Subject: [PATCH v4 09/10] hw/arm/smmuv3: Add stage-2 support in iova notifier
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3xehjZAgKClAA46ABsxsy66y3w.u648w4C-vwDw3565y5C.69y@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
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
X-TUID: 7OBAgNb2B+si

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
index 3643befc9e..17e1359be4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -999,18 +999,21 @@ epilogue:
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
@@ -1025,11 +1028,20 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
@@ -1043,9 +1055,10 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
 
@@ -1053,11 +1066,11 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
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
@@ -1088,7 +1101,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
     }
@@ -1106,7 +1119,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 
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
2.40.1.606.ga4b1b128d6-goog

