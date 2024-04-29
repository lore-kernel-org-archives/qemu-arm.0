Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931754ejb;
        Sun, 28 Apr 2024 20:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWchd4eZ+daQZ/DbQXad7972Av706WyR2Nr7NPFYSUFyvvQDKzrbAMV7mBIPPqpyUD9WezEV6sqCqCmM0JkuzlBBDlm0esA
X-Received: by 2002:a05:600c:3c8a:b0:418:ed23:a9f0 with SMTP id bg10-20020a05600c3c8a00b00418ed23a9f0mr5364771wmb.18.1714361091331;
        Sun, 28 Apr 2024 20:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361091; cv=none;
        d=google.com; s=arc-20160816;
        b=nhb1nmszghbZczD7pbFoBo9+FZDXj3ROzbEFRvoiM7FM/jPXJiFaNZLj9RAUu/N0/Y
         mkUX0DsyVaz94/HRlhe7vttqnK8yIyn1D1NCyjq9RhIUFzEK7pTmxDuctiEw+7IlCPRY
         FN30X9idn/PfEShYJsKngpr82Zv5xcIBdF9yGQffSsbsiH8FMhvn9VXDDgAhGm4UXyTS
         etAgObQLGgxh0SXg2/xkKbf3UjOyVswdMtn4/ElqVprl7ZCNPnzTkzv2Q0obKNO2IAjQ
         oKg7p51kU2y21SfHz0qofnYE9WEO9McIKGkKMhLDfZxN8mZ+8hxf0r3l7rVwQ0/zC3Jv
         jujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=ZpCcezp9/fTsowCTsySf9fmY/aXn95QjnE0/b0e/YVQ=;
        fh=VqExcrAuunyh84CE0tWY/cphh7jm3bJdtiLKtnDix8o=;
        b=rl2ZveryssD4Th/SbGUfgpJwWxHykKKfvWplfIschz99t9wLZ+J5t+ARInngFQdTVX
         oXnC63NXNguOn8zyYnf19lX/OTSK1I66JlRSuNAShyj37If5tGiy1Z4CbKHDWMq71rIa
         H/8uwMNPude0gE9isikWhY+io81KI+V2TBWG+27luwP+k3yyIGaByEJ3mOWZL0f+wT0V
         VsCZNdLPkp/uS52G7bBNO8lt32MdJXxurkyPc75nn1vtYclxcl9Q7DLTX6SAolVT6PUT
         Qv6fUdUMN4sMaKKDXoQZVL1hie8gXZ3YyE9OFZo6zJvfbLuExge4kkg6YOk0jw1uEHgT
         y5Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YenYEeDu;
       spf=pass (google.com: domain of 3axmvzggkcx4mgimn494aiiaf8.6ig4f8r.58hh88fch4li.ila@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3AxMvZggKCx4MGIMN494AIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3AxMvZggKCx4MGIMN494AIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id f13-20020a7bc8cd000000b004140476f167sor6148464wml.9.2024.04.28.20.24.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3axmvzggkcx4mgimn494aiiaf8.6ig4f8r.58hh88fch4li.ila@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YenYEeDu;
       spf=pass (google.com: domain of 3axmvzggkcx4mgimn494aiiaf8.6ig4f8r.58hh88fch4li.ila@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3AxMvZggKCx4MGIMN494AIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361091; x=1714965891; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpCcezp9/fTsowCTsySf9fmY/aXn95QjnE0/b0e/YVQ=;
        b=YenYEeDuLbFntEuICPrDIGDQ7MHr+iJDl5esNmt8pRACIKvynqWba6VnTWIo9j8VuV
         bUulAcSk1YYOYFt3LYpvuAONnitdkszzObINuUHkKsQdAxhbTTEdKGkzhPEBv+hmle+j
         M5BcnNCKgltOll+o/cMX39U2gyHaTbBc8Rt6BfyQbvOCcoS7nhpCmYqlxX7LORQviDbP
         hXuL2YDeghnjVgNG0MjoDs9JXKXjNQZ5FZu0ZlkDo15p1JmtC+rCAbbiYgX5noBLUu8L
         +YD2EqoG6NF+gBGQtWdjjPllfQl3Vihif9KHXkZU3LaCuTZXy1hbGoXZeGlaMdfXZVXi
         /tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361091; x=1714965891;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZpCcezp9/fTsowCTsySf9fmY/aXn95QjnE0/b0e/YVQ=;
        b=pVHmJ8LHCIuHrGrEO6iDF/X3YpfZ0euZRbi/2zhCRqlJK+pHr79Ajpnpg+B9P48+BA
         32WVU2u+eF+VBqaZJykYtvbY4IcUcEpcvwUrSfGLWxQE0oY+Fy2OwMZ+hw0/f2LTslo5
         FyVqbmoEGhx+2F1g8tbcbrggKk5rTe5no/fJssk/AIDZP3LoSvscAs091cWwW/paszd6
         A1WeW//MZ/8/iCY8kzJscEl9yDnTTg1Ia/VQ/YzKR3DauBOCJDWjPIO2EHbI2XhSu27V
         tAmAcXL1hABQ95hgY4NNcWTBT1V+bv4dHPN1miAvibVrwFLjLclkgDwhvM+VTplc0A78
         lPpg==
X-Forwarded-Encrypted: i=1; AJvYcCUMzJXuQoUrvUyXOAOI5vZ1hBwEFOyNFRFUN17Ak5HwyAb0uhPlckh0uIGKoC7WMFv17+LM83D5M4rIpuf+YJIgCv9MltP8
X-Gm-Message-State: AOJu0YyxYQYzNPZ/f22cnTQb7kRGbIlpckPuZWz8bGs/c2LhqqwGWM0U
	PRTOePKD+DKZsQ1WCNSskRi1PyjKxjJBGPfRAvfbfGZVwX69+enDVY26fRuVDK6tiqzrt81fiye
	zBZVAdql4lQ==
X-Google-Smtp-Source: AGHT+IFlmFvm8bFLPkRmQqZHSTw5edCekNmbTGPI6RjgH4IB4gxI0vAC1L48k37Wl9JBTfaWcoeZ653OKbEgJQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:2294:b0:418:16b2:a3a4 with SMTP
 id 20-20020a05600c229400b0041816b2a3a4mr41283wmf.3.1714361091028; Sun, 28 Apr
 2024 20:24:51 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:52 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-9-smostafa@google.com>
Subject: [RFC PATCH v3 08/18] hw/arm/smmu-common: Add support for nested TLB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GahxOMFejgM0

This patch adds support for nested(combined) TLB entries.
The main function combine_tlb() is not used here but in the next
patches, but to simplify the patches it is introduced first.

Main changes:
1) New entry added in the TLB, parent_perm, for nested TLB, holds the
   stage-2 permission, this can be used to know the origin of a
   permission fault from a cached entry as caching the =E2=80=9Cand=E2=80=
=9D of the
   permissions loses this information.

   SMMUPTWEventInfo is used to hold information about PTW faults so
   the event can be populated, the value of stage (which maps to S2
   in the event) used to be set based on the current stage for TLB
   permission faults, however with the parent_perm, it is now set
   based on which perm has the missing permission

   When nesting is not enabled it has the same value as perm which
   doesn't change the logic.

2) As combined TLB implementation is used, the combination logic
   chooses:
   - tg and level from the entry which has the smallest addr_mask.
   - Based on that the iova that would be cached is recalculated.
   - Translated_addr is chosen from stage-2.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 32 ++++++++++++++++++++++++++++----
 include/hw/arm/smmu-common.h |  1 +
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 21982621c0..0d6945fa54 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -394,7 +394,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr =3D gpa;
         tlbe->entry.iova =3D iova & ~mask;
         tlbe->entry.addr_mask =3D mask;
-        tlbe->entry.perm =3D PTE_AP_TO_PERM(ap);
+        tlbe->parent_perm =3D tlbe->entry.perm =3D PTE_AP_TO_PERM(ap);
         tlbe->level =3D level;
         tlbe->granule =3D granule_sz;
         return 0;
@@ -515,7 +515,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr =3D gpa;
         tlbe->entry.iova =3D ipa & ~mask;
         tlbe->entry.addr_mask =3D mask;
-        tlbe->entry.perm =3D s2ap;
+        tlbe->parent_perm =3D tlbe->entry.perm =3D s2ap;
         tlbe->level =3D level;
         tlbe->granule =3D granule_sz;
         return 0;
@@ -530,6 +530,27 @@ error:
     return -EINVAL;
 }
=20
+/* combine 2 TLB entries and return in tlbe in nested config. */
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
+    /* parent_perm has s2 perm while perm has s1 perm. */
+    tlbe->parent_perm =3D tlbe_s2->entry.perm;
+    return;
+}
+
 /**
  * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
  *
@@ -607,9 +628,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransC=
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
2.44.0.769.g3c40516874-goog
