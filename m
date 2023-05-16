Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp660788ejq;
        Tue, 16 May 2023 13:34:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45OPxbQTUmZoKSyvbXN+pQmUZu2ju7vrYI2SPn2GL2NLS+ZeY7NWjq5gS6uQ8prLeF4Cva
X-Received: by 2002:ac8:7e96:0:b0:3f5:2995:f6c8 with SMTP id w22-20020ac87e96000000b003f52995f6c8mr15417722qtj.60.1684269286051;
        Tue, 16 May 2023 13:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684269286; cv=none;
        d=google.com; s=arc-20160816;
        b=bDC0B29GDhe6Clve9dGEY7m8i8oza0/UL9oEsAsuC/itaxeSrDa6a0bFeHnT5Ep8ij
         Lfip/51NxziCuQ3u7yKUj/sm2W9dzaBoXur7xW/2t+K7//sCoyiqhFB4AUw8jVVhfuxI
         70hq+URJRkRmqjPTBv+lpopSUvuCggU5j7c3f3LKb8Si3l2p1PoEt3l8O99q8wjHLc2R
         V0QlRiiJnfwTx73VxEcRkmO7L0+DnNXQOZJ+X2Q6+Pk0NeuEBDN1vsCWRgeAVxk+IlNR
         r9I0hNbb3ba+PtFEUzPdfm7dIlLO4L/xhL0soTz7v6HQP669cwN7XmSuX5i1VfCRUPkY
         oa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:references:mime-version:in-reply-to:date
         :dkim-signature;
        bh=gMaldJbc5MTEgK//H62MchmxppF7Fy26hToGI1gsDC4=;
        b=y26+A81w9L6HsHohTELgdOL815bCOVH+ZusjCMzmZ56psQnAPcuR02yAgafVfoAh5Q
         vb5bAVYN0xFk8iw1jikFbm/BSZRfwTn10L7AKrnS9XdUxUID3PF6IhYyTpwrQQ1ek2AU
         fHR7AfrgP9ttXm4JJAccl3NUsPuKezTa6w4nMmyi4OjBkm0Awic0NPdvzfMCIFPcgm17
         SxWozP6RDlVzHLeCrJlV3RWrbhPw9Osmomr10KXKY56q4+Y1LWXjcjmhERX+7w2gHL4n
         tq01174nUyp+NN9lxeCrDbsy8C8V4F9tiU+miq7Ycq0cw13VXOPzkmCUPOxhxsNTkpzM
         MOxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=YGo0Fe5d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a04ce00b003f391e947basi11572485qtx.255.2023.05.16.13.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 13:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=YGo0Fe5d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pz1N9-000698-Oy; Tue, 16 May 2023 16:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3t-hjZAgKCkIwqswxejeksskpi.gsquiqy-hiziprsrkry.svk@flex--smostafa.bounces.google.com>)
 id 1pz1Mx-00067I-Cd
 for qemu-devel@nongnu.org; Tue, 16 May 2023 16:34:08 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3t-hjZAgKCkIwqswxejeksskpi.gsquiqy-hiziprsrkry.svk@flex--smostafa.bounces.google.com>)
 id 1pz1Mv-0006gg-FM
 for qemu-devel@nongnu.org; Tue, 16 May 2023 16:34:03 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 5b1f17b1804b1-3f426ffdbc6so38945e9.3
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684269239; x=1686861239;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=gMaldJbc5MTEgK//H62MchmxppF7Fy26hToGI1gsDC4=;
 b=YGo0Fe5d2UC9kfDc210nLwp1WuA3Lw7T1wkGRzJ21IXnnwyS2VR5MZneWnOwfrApLf
 z07VeDUuf6kG549m5tgd3iH72W7YgvTxWDKj0LZ5Pm6BjOh46HeDUdmfWbkH00ysBzs+
 AC6T9GkgH8TG4bpm1dB313E8yWMuYPozygukd4xoz2FQr5MFsX1IHnnRepe2DPIYJuMK
 eQSvnW9tE1tx6kOW2UwnVa2G20BejVD5fIMHsVza6JI+yD814VsIGmpzHC7LSyTbBMjo
 KblOP/y+U1dXFstZi1ICTrHowxJVgYC66cajsA/MVPijaBb1Bxis1geHE8HhQLlr521R
 rPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684269239; x=1686861239;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gMaldJbc5MTEgK//H62MchmxppF7Fy26hToGI1gsDC4=;
 b=NNciXimbY5vIToxEzVo9wgQ8ygqltCeQjE3vPdtSsqSYfO155DMXT619mv3vYA6ufG
 tR+fF1fPfvmloCK08memYf9PcljRJzXp+u72bO21ENAlEXLBzUEQYshCqSGT6N6juJmO
 m9KfN+V90QT41cq2QVv4iQOnCS45Rp5mwBGKRB1iJXeNPNDMavCr+3Tk2WV02Tgq1Gli
 4uIIIzJNXN44CgNuDtERrOhXz2KVajtEyI2AdWW0yAoaSpbCdIMoO6HwT77HmiV4jlL4
 gEw4VNcQfbJZIUQhPQFsmhqrE8elNyAklbxi8XS1Hwa9nLz3gYH8OtViOQn0GsV47wph
 tm4Q==
X-Gm-Message-State: AC+VfDyRUYz7S0Y0PIYQW/jArH+y9EtudKo+yk2L2JHHT9YnWcG/dXjc
 Pg525xqcVLiRQztiQhmpTzJoHq4l2OY8yMqCLIp642O/eka3fU4Ck30V+lLKFO0sdMb23yCcuQQ
 LRaJFVxQHAnPhoFiMErTE3M+BdV8DRCWu8ueyN+EWwTAynnG+pAm4zTsMClZT9lO38g==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:cd89:0:b0:3f4:2610:5cb8 with SMTP id
 y9-20020a7bcd89000000b003f426105cb8mr5504912wmj.8.1684269239457; Tue, 16 May
 2023 13:33:59 -0700 (PDT)
Date: Tue, 16 May 2023 20:33:10 +0000
In-Reply-To: <20230516203327.2051088-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230516203327.2051088-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230516203327.2051088-4-smostafa@google.com>
Subject: [PATCH v4 03/10] hw/arm/smmuv3: Refactor stage-1 PTW
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3t-hjZAgKCkIwqswxejeksskpi.gsquiqy-hiziprsrkry.svk@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
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
X-TUID: x2kJsUhZrdKf

In preparation for adding stage-2 support, rename smmu_ptw_64 to
smmu_ptw_64_s1 and refactor some of the code so it can be reused in
stage-2 page table walk.

Remove AA64 check from PTW as decode_cd already ensures that AA64 is
used, otherwise it faults with C_BAD_CD.

A stage member is added to SMMUPTWEventInfo to differentiate
between stage-1 and stage-2 ptw faults.

Add stage argument to trace_smmu_ptw_level be consistent with other
trace events.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Collected Reviewed-by tag
- Rename translation consts and macros from SMMU_* to VMSA_*
Changes in v2:
- Refactor common functions to be use in stage-2.
- Add stage to SMMUPTWEventInfo.
- Remove AA64 check.
---
 hw/arm/smmu-common.c         | 27 ++++++++++-----------------
 hw/arm/smmuv3.c              |  2 ++
 hw/arm/trace-events          |  2 +-
 include/hw/arm/smmu-common.h | 16 +++++++++++++---
 4 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e7f1c1f219..50391a8c94 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_ad=
dr_t iova)
 }
=20
 /**
- * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
  * @cfg: translation config
  * @iova: iova to translate
  * @perm: access type
@@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_ad=
dr_t iova)
  * Upon success, @tlbe is filled with translated_addr and entry
  * permission rights.
  */
-static int smmu_ptw_64(SMMUTransCfg *cfg,
-                       dma_addr_t iova, IOMMUAccessFlags perm,
-                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
+                          dma_addr_t iova, IOMMUAccessFlags perm,
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     dma_addr_t baseaddr, indexmask;
     int stage =3D cfg->stage;
@@ -291,14 +291,14 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
     }
=20
     granule_sz =3D tt->granule_sz;
-    stride =3D granule_sz - 3;
+    stride =3D VMSA_STRIDE(granule_sz);
     inputsize =3D 64 - tt->tsz;
     level =3D 4 - (inputsize - 4) / stride;
-    indexmask =3D (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask =3D VMSA_IDXMSK(inputsize, stride, level);
     baseaddr =3D extract64(tt->ttb, 0, 48);
     baseaddr &=3D ~indexmask;
=20
-    while (level <=3D 3) {
+    while (level < VMSA_LEVELS) {
         uint64_t subpage_size =3D 1ULL << level_shift(level, granule_sz);
         uint64_t mask =3D subpage_size - 1;
         uint32_t offset =3D iova_level_offset(iova, inputsize, level, gran=
ule_sz);
@@ -309,7 +309,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         if (get_pte(baseaddr, offset, &pte, info)) {
                 goto error;
         }
-        trace_smmu_ptw_level(level, iova, subpage_size,
+        trace_smmu_ptw_level(stage, level, iova, subpage_size,
                              baseaddr, offset, pte);
=20
         if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
@@ -358,6 +358,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
     info->type =3D SMMU_PTW_ERR_TRANSLATION;
=20
 error:
+    info->stage =3D 1;
     tlbe->entry.perm =3D IOMMU_NONE;
     return -EINVAL;
 }
@@ -376,15 +377,7 @@ error:
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    if (!cfg->aa64) {
-        /*
-         * This code path is not entered as we check this while decoding
-         * the configuration data in the derived SMMU model.
-         */
-        g_assert_not_reached();
-    }
-
-    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
+    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
 }
=20
 /**
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 270c80b665..4e90343996 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -716,6 +716,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
     cached_entry =3D g_new0(SMMUTLBEntry, 1);
=20
     if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
+        /* All faults from PTW has S2 field. */
+        event.u.f_walk_eabt.s2 =3D (ptw_info.stage =3D=3D 2);
         g_free(cached_entry);
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2dee296c8f..205ac04573 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -5,7 +5,7 @@ virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing =
out."
=20
 # smmu-common.c
 smmu_add_mr(const char *name) "%s"
-smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t bas=
eaddr, uint32_t offset, uint64_t pte) "level=3D%d iova=3D0x%"PRIx64" subpag=
e_sz=3D0x%zx baseaddr=3D0x%"PRIx64" offset=3D%d =3D> pte=3D0x%"PRIx64
+smmu_ptw_level(int stage, int level, uint64_t iova, size_t subpage_size, u=
int64_t baseaddr, uint32_t offset, uint64_t pte) "stage=3D%d level=3D%d iov=
a=3D0x%"PRIx64" subpage_sz=3D0x%zx baseaddr=3D0x%"PRIx64" offset=3D%d =3D> =
pte=3D0x%"PRIx64
 smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pte=
addr, uint32_t offset, uint64_t pte) "stage=3D%d level=3D%d base@=3D0x%"PRI=
x64" pte@=3D0x%"PRIx64" offset=3D%d pte=3D0x%"PRIx64
 smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr,=
 uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=3D%d level=3D%d i=
ova=3D0x%"PRIx64" base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" =
page address =3D 0x%"PRIx64
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t ptead=
dr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=3D%d le=
vel=3D%d base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" iova=3D0x=
%"PRIx64" block address =3D 0x%"PRIx64" block size =3D %d MiB"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 9cf3f37929..97cea8ea06 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -23,9 +23,18 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
=20
-#define SMMU_PCI_BUS_MAX      256
-#define SMMU_PCI_DEVFN_MAX    256
-#define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
+#define SMMU_PCI_BUS_MAX                    256
+#define SMMU_PCI_DEVFN_MAX                  256
+#define SMMU_PCI_DEVFN(sid)                 (sid & 0xFF)
+
+/* VMSAv8-64 Translation constants and functions */
+#define VMSA_LEVELS                         4
+
+#define VMSA_STRIDE(gran)                   ((gran) - VMSA_LEVELS + 1)
+#define VMSA_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
+                                             (VMSA_LEVELS - (lvl)))
+#define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
+                                             VMSA_BIT_LVL(isz, strd, lvl))=
 - 1)
=20
 /*
  * Page table walk error types
@@ -40,6 +49,7 @@ typedef enum {
 } SMMUPTWEventType;
=20
 typedef struct SMMUPTWEventInfo {
+    int stage;
     SMMUPTWEventType type;
     dma_addr_t addr; /* fetched address that induced an abort, if any */
 } SMMUPTWEventInfo;
--=20
2.40.1.606.ga4b1b128d6-goog

