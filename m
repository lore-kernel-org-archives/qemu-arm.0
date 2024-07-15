Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118119nji;
        Mon, 15 Jul 2024 01:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFI99hDu2RLJy/HE8txZhqdi5V3AdJZVJWb6ITIaOerbqSDScxRS/DIvo9xkZq48OBRyWjoDOqxJ430rrH41G4AbN0wE45
X-Received: by 2002:a05:6512:4018:b0:52e:d0f4:7930 with SMTP id 2adb3069b0e04-52ed0f47a38mr3672745e87.53.1721033151627;
        Mon, 15 Jul 2024 01:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033151; cv=none;
        d=google.com; s=arc-20160816;
        b=E8EYkGdc4KJ52wO7koMMTih1CVT3SqvlSVEAU5rMhXUsAxIpX77Iv0YOYOUnLSBAa5
         a/yLh2n67GluEzqhV7OfjZSLZwp/mF7acfggsp+DkDshivgOYubgjCX0jCYxeaHIqZnu
         3GsvlKBtDjjWX+E9OKofG4fA8DCCDKwYE9mkQs87AcfA3TyopB7cOrPOjRxbHmg+g+IK
         NVVzY8CuHqbQEpU62b/YwdMaPMA/iDXp1G+88EimIrvNN+zxhZ5nfe5wMhtReyCu6uF8
         SzhIcmG5LU7fw7Ke0r0lcNoR0S4wIF/Qx34+2Lo54LhlOnmtvIfKnUudNK2kdiHekwcJ
         Nr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=9VlBhFD/FhjdVTZgot1PeTSiVN6wwY6wr20X50ewn48=;
        fh=oNqP6QW2oVjGuel/+8gWD6w17ySbroHOY+AatqrdvFY=;
        b=Zpfkd1uhOPuc7bgF6t1BmwSzoZUCIgchWdTQeNIRSlgoFY+0hzLP72zNzPM0MjG/pI
         4Y9GDYwQF/kZpoqOSIKKn9/l5eXawmD1II2AfxjiD7QsU0VcEMk9juld3SSS82LLVEk7
         KaoOOPs88fqvD+znsaIONGJTwJpBB8mmy80u9Qqycz2AqqAYwNJ6ts2gqRrq+TWQj5df
         deXZQC5rTNbtOyrzBMJNYKbnRZJvp9ORsgH5irCZREcY0EHY3ms1ottaIoHU9SzPmsC7
         bkHjvIQsRvwSrc6c4wEk4acO/sFKzvIjXjA7ZoU87phZ7lnb7GQklNOJm23oZxs4o/b4
         KgFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4lvaq8LI;
       spf=pass (google.com: domain of 3v-guzggkcxia46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3v-GUZggKCxIA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3v-GUZggKCxIA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427a63809c1sor8377415e9.1.2024.07.15.01.45.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3v-guzggkcxia46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4lvaq8LI;
       spf=pass (google.com: domain of 3v-guzggkcxia46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3v-GUZggKCxIA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033151; x=1721637951; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VlBhFD/FhjdVTZgot1PeTSiVN6wwY6wr20X50ewn48=;
        b=4lvaq8LISOrDzYYgB/fu18sNvuCM8HE664RLd077Z9saVLOSEQN1F7CzfqiNolFPwo
         7/tO6bdIWbVN8YVuAB1pH5/VxCV7i+ros4c0UmyNcDollyzrQlEOvEB6j9pXCYAliat6
         /eDRp5IHNNCl8M786rczjfJi17qhJ/E3Cg7SGEKKzGK6dMnwEHMvGWQBArYMbw91Pi++
         G//6SHGxyACN9/najmaCqj2JZqYA8cf2Dtl9DaIZ4hI+Z2p+l0IPzc9ORXdguczyyY3u
         hE8Effx3BeI6ZF1JrpboCIjQYA/DoHGAj8UoShJpGZXnMIem8VNd1bu1FXyL3XKR9PN1
         TFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033151; x=1721637951;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9VlBhFD/FhjdVTZgot1PeTSiVN6wwY6wr20X50ewn48=;
        b=xE6Fa34CIHOsS7X55pb0I+oYkGq4C52Z5FZoSkKwbAkLKbfxfoSbh4s4dhXjNIRx7d
         ZG6diFjJvhJ3DDU7BOHB3wIEUALakNW11GioRQKNT+UvsrIUWWvpZVUSAaHb3Dd1Tlza
         Z18s9DyuIS896UOEdUV0xtYomwKA7MnVm6uPmvg0V4cZ5SMhvprxF21wwLoE8o4qHVQa
         mifR6aIVuYqcWumYAYJdByaIXdnNTeJRC++P2x5gsNQqrc9rLnhUUArrzM08CW/khiRC
         N0nfXlAyWlKnRSpPMlwXUY1pjIpaYsiDntzdEd0rkhY4ZjqOWgTv030gfZhgAufT5g25
         dFkw==
X-Forwarded-Encrypted: i=1; AJvYcCXxoPot/g1k4r765geFTNRSdHQMi/aRWP26Y4Nj6tpIOts44ULFAQj3luZ5qWcxqJnF4goulM73EkT3eh2DRUzb7R6bdklb
X-Gm-Message-State: AOJu0YxJtMLSwnp/APRrtLxPxFCt6ZoQYKvTWfwkDmBbQr46Jft71Zgg
	2OxrhmZ+RXRoWDxtizsxG6PUhkHWzEuleCzlsdYeijFiLLd1ZHIToYGErHCY3YJSjdcF0Z/cTV+
	bFcgGzJwkvg==
X-Google-Smtp-Source: AGHT+IHo5dmJlYuQjLV8KxY9bziGJnOf2h5kYpQYvKh+aLTYuz0eR06HXzi/8bznCqktfqiIB6NjHtkdTYKCag==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1c8e:b0:426:67e0:38b with SMTP
 id 5b1f17b1804b1-426708f1cebmr2720935e9.3.1721033151118; Mon, 15 Jul 2024
 01:45:51 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:10 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-11-smostafa@google.com>
Subject: [PATCH v5 10/18] hw/arm/smmu-common: Add support for nested TLB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: XtOJ/CKT8hJD

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

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 37 ++++++++++++++++++++++++++++++++----
 include/hw/arm/smmu-common.h |  1 +
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index f224e9c1e0..c894c4c621 100644
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
@@ -629,9 +655,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransC=
fg *cfg, dma_addr_t addr,
=20
     cached_entry =3D smmu_iotlb_lookup(bs, cfg, &tt_combined, addr);
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
index eecbebaaac..d84de64122 100644
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
2.45.2.993.g49e7a77208-goog
