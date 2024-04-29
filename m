Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931649ejb;
        Sun, 28 Apr 2024 20:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfJqY2CnUNQvdn846FXFDX+PFLRp0HmeqRLdLDVIen9HIPiYe0/cKBIRVAjpWLvgdkD2x5MMP07l/0i0xlwBChuFI5zY2F
X-Received: by 2002:a25:908c:0:b0:dcc:2da:e44e with SMTP id t12-20020a25908c000000b00dcc02dae44emr8856468ybl.61.1714361077102;
        Sun, 28 Apr 2024 20:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361077; cv=none;
        d=google.com; s=arc-20160816;
        b=WDWWfEtkSo1hskvvVrPxXUF+aV/tas3zZ1PcdwCQo/yBHPZY0wbTnqXI/y9ocRr0fP
         Kr9EgIkKq5ispLxeXk9d0Imz0vk0Yf7fMQF9hrZIHr8Owu/pvatVGE72OhoOk3mky7XU
         +tr5W2GftHdnenqHUYiZOrtyFbBSVxowDwWO40wBK7b5dg53KY4de15lip0TwgaoCzFf
         dQVTgnyUFU4niYIzJS25ZQhnUgmvR4AyfO1j6u9ntNW/ll2Ppet8RNFeYuFmNTPUcOqM
         HRUhlxtOeg7HlA0iHjRCXDqNMGOxmSS4awX6DdyOLZlVKb8y1u/++CIOPSwvBulvJYKe
         V+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=ugfwhxHAsXX+l79VAWHM6i77oS3L6rsnMUucApsxZzg=;
        fh=gj6TDZYFOSET2feFw9FZyAnEVeVqkKNVn2l+bNZZkm4=;
        b=ma0JGHnVw5AUNSkGcnKq5EaXKeBs76NNu6xwMzfbzZInVuyVFhHDYel4Aorx1OX4PU
         LjdYtUxdecFmratYgC/FKPF2TjOlAhAX2NkQM2PG939eYZX/QIo6Z30huVr2A6pQcexq
         HyzaQzcWdgpzVRqRbiPrdekBanSw1XovHAerUvOKBq9PYbL0mNl+9jFnln2L2YbL+wvh
         RlXi6Bs7Gsg8tlVdje0nAt6N1X01BSkSrOe/1p5TPWLolPA7gnUDCSqgQ+ghJaLXoCXg
         tDNXR1mtIOhXmCYYyUqYPNGS25bho56YouPnKsas4V5iiXDLKVoA0Y++NhE2XtHI9UIh
         PIAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=15UYeah3;
       spf=pass (google.com: domain of 39bivzggkcw871378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=39BIvZggKCw871378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <39BIvZggKCw871378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id n10-20020a25d60a000000b00de5a0e2e401sor3135545ybg.6.2024.04.28.20.24.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of 39bivzggkcw871378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=15UYeah3;
       spf=pass (google.com: domain of 39bivzggkcw871378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=39BIvZggKCw871378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361076; x=1714965876; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugfwhxHAsXX+l79VAWHM6i77oS3L6rsnMUucApsxZzg=;
        b=15UYeah30jocWoAxAh33g9fF7LpT8d7b3KmapIFB5iS+5YY4ySSY8vzS7kZIopmdOl
         n9NMJUvAi3HEq1tL2vo0jAnElmU35gYVLOnO8AgTF1fmDf8TBBZlbyEE1F/FYcoYcEtD
         c7auGwa1T1EaOKJqnG6jb2cjcuWcxzBhN5uXkSWpK/vBhr3AH0KBuIDnoiZQxFOIq7YS
         b192vzETNh0vigfW8rcrxuMbkQOYFDKT9NF+AH2rI6YE9Ns9VIM/AJUQuAhRtuyIHDBj
         UAMcyYG9nqb5pXPWAS86qyntbdfYQlXdCEyJO68BrN5AyhU9UNh1TXPZ5vnofNRGF3Bs
         DRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361076; x=1714965876;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ugfwhxHAsXX+l79VAWHM6i77oS3L6rsnMUucApsxZzg=;
        b=WSMfEc66KpMgf9GVnDO/JsDVkDhQWjqe9sr4bN49bjupSzhhn7qjvRoZooMJiT7rhf
         PEa2SfwTn+7sDSrr+npg7OhSH1+IMBsSGZ+GTR21ek3e7lQmFSkNf3jm2ynZmsvjJTa4
         AIh5ff7dr+XWqEfs5r9VoledAiEmXnsclgAOwzDh8f+GO/MXuiiQZvCyCZ7cYgN0lqZ+
         ypNOsfOi4s+R2TIWFX2jLsNveKsvu1E63wMhpcwkVMEce+Ae0hB/8lQiAc/q9nrScAQb
         Who2446b8+G7RUMGSmhXWuL80QjYLe6vLsda/dBqymhrGLbp1xaQBSathIDTyGPElfeC
         cHtg==
X-Forwarded-Encrypted: i=1; AJvYcCVDwlLQM0KQGOsGais8O8e7/p0vZhmmDqkxi+BuZqinLUjYnpfKs2ivXM5GGRg+YlxOoSu9alxtOB70ncTrZrd7eFMnNxK7
X-Gm-Message-State: AOJu0YyjRLc9XhcnYeQsLS0aYAVPKm0D7JRWKEwqGGpVbU1iCntIvNQg
	UWnHXgWr8JsRmlDC/UfAucF8sVlIx0UQQgjBYVS5I28IrW+y14y1BTkZo1+ybzGOV39mhKLSrmb
	ju9wUm9zueg==
X-Google-Smtp-Source: AGHT+IFT1m+wr9CErBEVDle49lV24xJJx2yoZ99l6OA47y92q4ouiYI0DmzSlqkA21/FF1Ru6Sx49cn5K2+I1w==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:2288:b0:de5:a77e:f9bd with SMTP
 id dn8-20020a056902228800b00de5a77ef9bdmr1632054ybb.6.1714361076658; Sun, 28
 Apr 2024 20:24:36 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:46 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-3-smostafa@google.com>
Subject: [RFC PATCH v3 02/18] hw/arm/smmu: Fix IPA for stage-2 events
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OrmTwaXExK76

For the following events (ARM IHI 0070 F.b - 7.3 Event records):
- F_TRANSLATION
- F_ACCESS
- F_PERMISSION
- F_ADDR_SIZE

If fault occurs at stage 2, S2 =3D=3D 1 and:
  - If translating an IPA for a transaction (whether by input to
    stage 2-only configuration, or after successful stage 1 translation),
    CLASS =3D=3D IN, and IPA is provided.

However, this was not implemented correctly, as for stage 2, we Qemu
only sets the  S2 bit but not the IPA.

This field has the same bits as FetchAddr in F_WALK_EABT which is
populated correctly, so we don=E2=80=99t change that.
The population of this field should be done from the walker as the IPA addr=
ess
wouldn't be known in case of nesting.

For stage 1, the spec says:
  If fault occurs at stage 1, S2 =3D=3D 0 and:
  CLASS =3D=3D IN, IPA is UNKNOWN.

So, no need to set it to for stage 1, as ptw_info is initialised by zero in
smmuv3_translate().

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 10 ++++++----
 hw/arm/smmuv3.c      |  4 ++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index eb2356bc35..8a8c718e6b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -448,7 +448,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
      */
     if (ipa >=3D (1ULL << inputsize)) {
         info->type =3D SMMU_PTW_ERR_TRANSLATION;
-        goto error;
+        goto error_ipa;
     }
=20
     while (level < VMSA_LEVELS) {
@@ -494,13 +494,13 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
          */
         if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
             info->type =3D SMMU_PTW_ERR_ACCESS;
-            goto error;
+            goto error_ipa;
         }
=20
         s2ap =3D PTE_AP(pte);
         if (is_permission_fault_s2(s2ap, perm)) {
             info->type =3D SMMU_PTW_ERR_PERMISSION;
-            goto error;
+            goto error_ipa;
         }
=20
         /*
@@ -509,7 +509,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
          */
         if (gpa >=3D (1ULL << cfg->s2cfg.eff_ps)) {
             info->type =3D SMMU_PTW_ERR_ADDR_SIZE;
-            goto error;
+            goto error_ipa;
         }
=20
         tlbe->entry.translated_addr =3D gpa;
@@ -522,6 +522,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
     }
     info->type =3D SMMU_PTW_ERR_TRANSLATION;
=20
+error_ipa:
+    info->addr =3D ipa;
 error:
     info->stage =3D 2;
     tlbe->entry.perm =3D IOMMU_NONE;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2d1e0d55ec..9dd3ea48e4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -949,6 +949,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             if (PTW_RECORD_FAULT(cfg)) {
                 event.type =3D SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr =3D addr;
+                event.u.f_translation.addr2 =3D ptw_info.addr;
                 event.u.f_translation.rnw =3D flag & 0x1;
             }
             break;
@@ -956,6 +957,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             if (PTW_RECORD_FAULT(cfg)) {
                 event.type =3D SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr =3D addr;
+                event.u.f_addr_size.addr2 =3D ptw_info.addr;
                 event.u.f_addr_size.rnw =3D flag & 0x1;
             }
             break;
@@ -963,6 +965,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             if (PTW_RECORD_FAULT(cfg)) {
                 event.type =3D SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr =3D addr;
+                event.u.f_access.addr2 =3D ptw_info.addr;
                 event.u.f_access.rnw =3D flag & 0x1;
             }
             break;
@@ -970,6 +973,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             if (PTW_RECORD_FAULT(cfg)) {
                 event.type =3D SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr =3D addr;
+                event.u.f_permission.addr2 =3D ptw_info.addr;
                 event.u.f_permission.rnw =3D flag & 0x1;
             }
             break;
--=20
2.44.0.769.g3c40516874-goog
