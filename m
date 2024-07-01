Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286428njm;
        Mon, 1 Jul 2024 04:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVOlqSlZx5OfQ0o9MS4m42q4idgQDAyL8rUOwbZlRyL6bb0eCIYGWcG3o6wpRrmtgV3bj0xS1Vl6gu3/XKbk8FAEl7Bh1O
X-Received: by 2002:a05:600c:1508:b0:425:5a26:a12c with SMTP id 5b1f17b1804b1-4257a02f915mr37743605e9.13.1719831810473;
        Mon, 01 Jul 2024 04:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831810; cv=none;
        d=google.com; s=arc-20160816;
        b=XvLP06AR5k9TCNF/g68n3onSwV+vUHZ0ISc1a2WjnDKFM3gS4AcbDbbTgocuJCGo8i
         A49yJIoUtW2BdL/jKF0im1OxIAXBYHtbqVOoaLsPhzgfYfZmrNnATuxqsJjCyYF+uXLz
         ULVSvnknrmgfq8fazhXsRimTnbKCW2IgNRv2vJQcRE+TbRTdm2KO6oOwDjZzGT7yedC7
         xL22El+vwdQ0YWP2p6x0E/ECLaJgap/Ov7L3ke7X1hrLEex2xB5gVQq/itdefpv/KxgB
         21gzZejQTRG9rS182IvE09GtZgfWdW4CmbcB9JMO74uDZzND2ptC637MjL3UZVGGtzEC
         GsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=Fv7BS8g4xDe926Dlz2fnWNVQmTCy2c0vTs9ZGBz2UIg=;
        fh=HZIdEmvFwK6Zny28PUOoMn+X7lLcnYDf0FJEkbYBV+Q=;
        b=qo+afcDhC6lcAnetjJDQff3h7K4QvLHasNaVoxb3bg+el//pqqn9REiim8EmpxTn6y
         /QbYSgb0kQBX/HbmG/+qpu3bFGSwUTkag6XBaN5Xkw9Tx1qkb+Z3ekXZMhdpUe0spHdE
         xOYqpe1vN2R7SkoBXkvgl4PXDj2dxKub5ZKMIaRubJdUl0tQAg1YIeT6fzjXIUuVI09n
         YEd1mmioQXrsw5GltZHvM8X80eepqFwInaZ8S4Pfu0BhDETB+1QEwQ+6+CfrxtBIqJmL
         NUtq16bURytPIxs6q6H4e7lvjvzoDCk9Wq9Wd8KTFOBDHKsyLrGtxKeAK6/YoO5QjHL8
         ve/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=thhY4WZL;
       spf=pass (google.com: domain of 3ay2czggkc2aqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3AY2CZggKC2AQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3AY2CZggKC2AQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-425655afb20sor24455085e9.5.2024.07.01.04.03.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ay2czggkc2aqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=thhY4WZL;
       spf=pass (google.com: domain of 3ay2czggkc2aqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3AY2CZggKC2AQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831810; x=1720436610; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv7BS8g4xDe926Dlz2fnWNVQmTCy2c0vTs9ZGBz2UIg=;
        b=thhY4WZLxdOvw5mpuKgF6GsUvsADB9sk6pPvfyXvWDd16k4i9GDwH/Z2KGvQTk+q6Y
         2ReLPOFYFCA0FgNurILrCbpm1KAv9/AGN5Yzx5ygHFkw05YNM6yq/w64Egl29k9Id4yy
         hXVg1ks21Fvk1apP+aaOtMz0I7cvUGEbXcrh9gZW8/kldszRS1XuhSf+SoFCQGGnokjB
         PncSmruJXMGcQGKPx9MxM8X1SjoiLnHggWvcHIcQFjfeHpNVMgQpdH0I+LPY80rsXg+L
         5ylZB/P+W1F4FG7Y5WkjX9W6gUmUDywC5+QdDtqeMF2AzRGba5lhvjaTdgP7OED+1ukW
         VzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831810; x=1720436610;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fv7BS8g4xDe926Dlz2fnWNVQmTCy2c0vTs9ZGBz2UIg=;
        b=gyjgzQAWgNRKtLrisIr3pF1FQ+6dAv3CmdPw7Ipie8ePlBhK2SK7NmrtBmQV4dtI71
         Qt6ajD1a69iAOYHcDJq8XEyyWp+8Argp9k2vKwvIWDA5se8a2fPAPwMiyQ2VsGWipszN
         7bxf6bEKSJXObA7LnWjGf+vDjE3TBxp6ZSM5ocSw+JcuDlzVjUrZQs2iBzX9CYmNjuzr
         uOpYZULHM8+Ce3XdwjT7CxIZu7OtOoH1J6oQO6L8ESdfBjE878/rUZlP8CaP9yX1qcfy
         +zUnVjyTaK+5iXKgo+7i077MsWCtawsCkz0Cm0zDgHEOVbm25FowRzBjKN0s7mMWAW+h
         9TNA==
X-Forwarded-Encrypted: i=1; AJvYcCV1G3odCdMdkvXEfHD3Syh/WyaOtR7KHoAK2Vls/J+DlDb55GH+tXCl0w7OAzIAs0O5+KpBBOa2S7lWbCrYcScW8aS2a+cC
X-Gm-Message-State: AOJu0YwsqiZ3WiWXDMZ1DVuDzlGi+uu6GAikZrtAIrXQvjRNxHkwBugm
	/Jca9DakO44jSwoJXlU6j0cqizoCHBKfPnnHn1DUhWK8e2mxwGi2jkOx4Ob/nunvQxo8VuPwVFk
	BAeO+jSoPQQ==
X-Google-Smtp-Source: AGHT+IHwm67bAhBHv7dJZUN8mCt5SQ4ipmxn5RP6+ZSGDsNtAPHR5mMXCnUqaTODAsL9//V8EkKSbx487kpj0Q==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:19c9:b0:424:9c77:4dfd with SMTP
 id 5b1f17b1804b1-4257a06c738mr538705e9.7.1719831809978; Mon, 01 Jul 2024
 04:03:29 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:32 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-11-smostafa@google.com>
Subject: [PATCH v4 10/19] hw/arm/smmu-common: Add support for nested TLB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 6jce84MJ2jWL

This patch adds support for nested (combined) TLB entries.
The main function combine_tlb() is not used here but in the next
patches, but to simplify the patches it is introduced first.

Main changes:
1) New field added in the SMMUTLBEntry struct: parent_perm, for
   nested TLB, holds the stage-2 permission, this can be used to know
   the origin of a permission fault from a cached entry as caching
   the =E2=80=9Cand=E2=80=9D of the permissions loses this information.

   SMMUPTWEventInfo is used to hold information about PTW faults so
   the event can be populated, the value of stage used to be set
   based on the current stage for TLB permission faults, however
   with the parent_perm, it is now set based on which perm has
   the missing permission

   When nesting is not enabled it has the same value as perm which
   doesn't change the logic.

2) As combined TLB implementation is used, the combination logic
   chooses:
   - tg and level from the entry which has the smallest addr_mask.
   - Based on that the iova that would be cached is recalculated.
   - Translated_addr is chosen from stage-2.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 37 ++++++++++++++++++++++++++++++++----
 include/hw/arm/smmu-common.h |  1 +
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0840b5cffd..24b7d09e2b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -426,7 +426,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr =3D gpa;
         tlbe->entry.iova =3D iova & ~mask;
         tlbe->entry.addr_mask =3D mask;
-        tlbe->entry.perm =3D PTE_AP_TO_PERM(ap);
+        tlbe->parent_perm =3D PTE_AP_TO_PERM(ap);
+        tlbe->entry.perm =3D tlbe->parent_perm;
         tlbe->level =3D level;
         tlbe->granule =3D granule_sz;
         return 0;
@@ -547,7 +548,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr =3D gpa;
         tlbe->entry.iova =3D ipa & ~mask;
         tlbe->entry.addr_mask =3D mask;
-        tlbe->entry.perm =3D s2ap;
+        tlbe->parent_perm =3D s2ap;
+        tlbe->entry.perm =3D tlbe->parent_perm;
         tlbe->level =3D level;
         tlbe->granule =3D granule_sz;
         return 0;
@@ -562,6 +564,30 @@ error:
     return -EINVAL;
 }
=20
+/*
+ * combine S1 and S2 TLB entries into a single entry.
+ * As a result the S1 entry is overriden with combined data.
+ */
+static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
+                                                SMMUTLBEntry *tlbe_s2,
+                                                dma_addr_t iova,
+                                                SMMUTransCfg *cfg)
+{
+    if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
+        tlbe->entry.addr_mask =3D tlbe_s2->entry.addr_mask;
+        tlbe->granule =3D tlbe_s2->granule;
+        tlbe->level =3D tlbe_s2->level;
+    }
+
+    tlbe->entry.translated_addr =3D CACHED_ENTRY_TO_ADDR(tlbe_s2,
+                                    tlbe->entry.translated_addr);
+
+    tlbe->entry.iova =3D iova & ~tlbe->entry.addr_mask;
+    /* parent_perm has s2 perm while perm keeps s1 perm. */
+    tlbe->parent_perm =3D tlbe_s2->entry.perm;
+    return;
+}
+
 /**
  * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
  *
@@ -639,9 +665,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransC=
fg *cfg, dma_addr_t addr,
=20
     cached_entry =3D smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr=
);
     if (cached_entry) {
-        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
+        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
+            cached_entry->parent_perm & IOMMU_WO)) {
             info->type =3D SMMU_PTW_ERR_PERMISSION;
-            info->stage =3D cfg->stage;
+            info->stage =3D !(cached_entry->entry.perm & IOMMU_WO) ?
+                          SMMU_STAGE_1 :
+                          SMMU_STAGE_2;
             return NULL;
         }
         return cached_entry;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 09d3b9e734..1db566d451 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -77,6 +77,7 @@ typedef struct SMMUTLBEntry {
     IOMMUTLBEntry entry;
     uint8_t level;
     uint8_t granule;
+    IOMMUAccessFlags parent_perm;
 } SMMUTLBEntry;
=20
 /* Stage-2 configuration. */
--=20
2.45.2.803.g4e1b14247a-goog
