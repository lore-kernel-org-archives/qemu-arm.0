Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213457ejb;
        Sat, 1 Apr 2023 03:51:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set8tBF3ktWHoOXbNrHNQKjKxe/BosFPPJlFTI/QlsC0m0H4sbyvZiqDyRTeGRW2nDdcxnfal
X-Received: by 2002:ac8:5850:0:b0:3bf:d1b3:2bbb with SMTP id h16-20020ac85850000000b003bfd1b32bbbmr53443989qth.13.1680346266516;
        Sat, 01 Apr 2023 03:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346266; cv=none;
        d=google.com; s=arc-20160816;
        b=pP8UHSj3HQBie0He+UIrqcmctKWJWWL5slYcYtPDX6rphywIxW+O+RpN3pb7lqlLT5
         VrCRgfCWr1RMkL3KBuTPb87WHqMbn/b2rqS7KxpkwqcWgV9vsRGpRiKCRPIDAroIOCGU
         dS4j/IJtrigpFgOR5iqrbRrHOhsd9obhmtrxTEdQt5MwT8wPwfR7QA2kMqzEVyH3krGe
         G0jBWP8JYHKTo0KYqAYTq2ucLJysbPSSGlBRP8+mWszzRXUdr3e0AO2TFz6/Hv3BgwEB
         upvDTV/AT4bIDRghUQKUaBzYsXap33LqUQ7h+ccD03YHGS8CYZFbrmgYV8qnXXturO6O
         U2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:references:mime-version:in-reply-to:date
         :dkim-signature;
        bh=gCZ16Z6H2AwNmeX1MuhAacC8ieM9057ihXyU6fhxeTM=;
        b=qZTDZynzc3Iy/0jx7jmLAxaPXzKz2Li4+xFQCt3fLByGuBT2gY1x3kVkTXMCMA6fh4
         KFu7c3Ba2X2RdtlahC+f3f7DKFY9WMwalYhbU/l2E7v2vUlbecfIyjK/QGGbBWbpNYbi
         W1w95ubEZh4Euu+3lXRDdhaegM2l6O484uOjYN1OhEPCP6PHkr+EGee7fGcW7IX0Kjmo
         VOlPL8sqJ8Jc1aS3Wt9fz/rFN1KO/VgY3pg26Nv2Ifs33E7gAskEYC6STxrioitAyakm
         HyiDjPN7GK8f5hQwLpsLZcTdNE0n6uoGGzJuUvOGYD0s6adwYPfr7D5AsuOHPb7we679
         /FsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=s5DUnlem;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a05620a254400b0071fb4224ca6si3222507qko.683.2023.04.01.03.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=s5DUnlem;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYoF-0000mA-Gn; Sat, 01 Apr 2023 06:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XAwoZAgKCD0rlnrsZeZfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--smostafa.bounces.google.com>)
 id 1piYoB-0000lL-Ch
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:07 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XAwoZAgKCD0rlnrsZeZfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--smostafa.bounces.google.com>)
 id 1piYo9-0002vl-BI
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:07 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 bi27-20020a05600c3d9b00b003ef6ee937b8so9045265wmb.2
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346204;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=gCZ16Z6H2AwNmeX1MuhAacC8ieM9057ihXyU6fhxeTM=;
 b=s5DUnlemnHaWtd/2NJq04MvI2C8Yaf1CLt1RKEIbx57LTUWlzyF2tj8d7Iczfrh3C1
 0wrskVqjH6B/5A5wu0toqrEDQsPWEoSY723DSeamNjl0FDmVXuXEn3H21Qi4M/F4LExx
 +C+DDnjI+lV6RUVzADQm5zvBfOnXIJnPJ60BcmeTlIQt2e4jjD9eMj+HIojXDftvK6AR
 ENojnE36QaRXhXE6QLKJdmxSXutvbjinm5mvm5k3ocscRiJDRGIVU4i+QnqciiIVKmMu
 kEuepeKK20R1l0v2l4Zb9jPLxS4qcYytuNK+YkdKz02/EWo4dkCPXs0ucV1ySGHJdkVs
 OvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346204;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gCZ16Z6H2AwNmeX1MuhAacC8ieM9057ihXyU6fhxeTM=;
 b=ixt//uqjxv/AgzzHUQftEJYZLnIs6yCQwy+ce1YhjtoWA8cvK4CisFUIyhnI8OVbm9
 n/iQODYrXfbeG7Phz8vUcL9oTFGfEb44j+5GkxKq/2kUC8EjrweH49LQfb1vzJ1giWSk
 OubBq9iooHITI2LshZf1KPgXsmmTkAFHN1PyVhfjpPnnICzA+RCNxBng4Qi6JRTkCGlg
 ty5SEwPeec6e53rzV4gpFGnegxFJrC53MaXLuYcjod59vpdUlbIOuvpY8czVL12OlQwg
 f3KlOZRxKp8kwhxMVV2Vo8x0+IWjhj0EQMHGeYy+IruOty3QhRqPK5df6CcK45kkrBD7
 yQEQ==
X-Gm-Message-State: AO0yUKXLJiXKj3GX+mPDe60jjBkrBYI0Q3YVHJatnCy8ETIWdSoCn70v
 jL6BkpAYzeHUQTlhs2jU9DjVt6xi8zJ4dA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:ca4a:0:b0:3ed:c669:8a15 with SMTP id
 m10-20020a7bca4a000000b003edc6698a15mr7007860wml.1.1680346204124; Sat, 01 Apr
 2023 03:50:04 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:46 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-4-smostafa@google.com>
Subject: [RFC PATCH v3 03/10] hw/arm/smmuv3: Refactor stage-1 PTW
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3XAwoZAgKCD0rlnrsZeZfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--smostafa.bounces.google.com;
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
X-TUID: ooGJHX9QSCzb

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
2.40.0.348.gf938b09366-goog

