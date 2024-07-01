Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286222njm;
        Mon, 1 Jul 2024 04:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU55Aa1sdO4LsxF/xAqjzsidYZTzA66A4KQJ5h3O3QfRKlnuah3fphUwBEol0cLXlXZG/8wsdD+0dgPP6RH+dAH5nSWrA+
X-Received: by 2002:adf:e784:0:b0:363:1b67:9e0f with SMTP id ffacd0b85a97d-367756ce3c0mr3411153f8f.41.1719831791677;
        Mon, 01 Jul 2024 04:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831791; cv=none;
        d=google.com; s=arc-20160816;
        b=deuHLP0PLPbl4BuBwisqKdPaQs7vjtA6t+RYmesaW3bP2/f/fhpYJtkr+Pj9w/2Eg1
         I12W2mg8u0LTdPx5JxnyLJ3nXNAuk5hpUd2obxM2KDyKbXBEvVwobvlXF9EgZnRP+KYq
         KqG2ZXwOKoQmS3Q8g/hFZxEHdx/Jg/0njo8l1n6zfPtBa3EFhb+x07ZNVdqQFLy+lcCV
         EFiRfoUTrYSVoRmAdDLAjJUx7d6x4QRKXcfIHdSH83/yB11To7EY95cdUa1Z0xOl82Gv
         xwXuIDRjzyrZGnMeu9l0pUODO71zjFJuM2EfPpfQkxAgPm6I5/+Ni9AFUDv4Zjju0v2v
         qVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=buei2TcPsrlo5yYQSY3rD7Mr3fqYf/EFvEpA8OSpk10=;
        fh=PwmbIDdtxroxJzB+WFkqoQhWmtPwv6tfWMq9faVoUL8=;
        b=RMwNQRkw4i28KuJrgrQXLxo6xX7hYTLu1/LY+vxJ+rQWamOfq/wuyJ5PvIqNZu3C/x
         Yz1xVjSVBgSxQzJ6WOw8JSXhFY/vnVn7zpyR1xmcjiD4JV30lWDcImq9opZFrV+0gj+2
         8EoZYHiemMsCzRZ0D+VN6zpa7BuMZBsGswcQb3TrgobrqSjYImvlpXREfvtJrhjQFFbC
         hxN8q1wyl/jbDlYK29ONXUICMEBqWQ7qZOAYZM19ECNa2AM0tx2kp0Z7Cb/ATFuOYDqu
         7lf9MgxBjos9nHGZLp36IYPw86VI1cihs8omdZmzWinyIzdZRtoIRLZEG/npIzVqzN5K
         lC9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dHKP6gJu;
       spf=pass (google.com: domain of 37oyczggkc0071378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=37oyCZggKC0071378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <37oyCZggKC0071378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id ffacd0b85a97d-3674369dd13sor2373337f8f.10.2024.07.01.04.03.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of 37oyczggkc0071378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dHKP6gJu;
       spf=pass (google.com: domain of 37oyczggkc0071378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=37oyCZggKC0071378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831791; x=1720436591; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buei2TcPsrlo5yYQSY3rD7Mr3fqYf/EFvEpA8OSpk10=;
        b=dHKP6gJu6yGIwArzxCZAl4gJJJODPPd1QC6Og3ekcRD7e/XLfsN9CkrJk7C6ayvVLJ
         iF+fVtSXhulOAa6m18nI2EfFicY0CxvvGYDztoArGGbFG3b+BtqRG2JijnL8f6An117P
         DhWZo2LxdOoCgh0GslWURbfYE+C4tZXZFVVBl+gg8+iTWECr+qA1MfIW1wbTeX0ZwhvM
         mGeKtiX6WZCvGtlbXmi96dW+WjzotID/ZbsdaC0SIpR5nIEEJAzTuuDUzIyvVXixepCx
         +/rA4xnbtlEkI8ci3j6vwdmZRnxABrkkdDktpn6wUMkLgMPvpD2iLXGXpmEBDLznD8yD
         aYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831791; x=1720436591;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=buei2TcPsrlo5yYQSY3rD7Mr3fqYf/EFvEpA8OSpk10=;
        b=uBpIDh23hVwtnzAc14oZTjWw7nRliJezhC8NrYnphtOCELus5OkIdK9Y4PDubQ71x8
         d119Yts6b0n42iXYHOIQj2aieW2Zu1ofRvWzHG9fVkVw34IPEJBG3Yvn8zvq/ok9ra8g
         4RvnUZtvEdQoEdSXUEv23GctxfegaK9ucs6nudsa3GM/hjwBpmeON3kGGv99qvMEJ9QM
         iuq5eEJ1P7j8UXsjfIMQBiLoin647ggdYmOCaYkCy+NQZq429vo1Sa7ZJVKruK8npYic
         m7mWXW1Y7ZFQrGT4d+6L/WrIZjkQrMq1LnGsXJx8VqoBlm8TU74rF8zCoWx/53YffoH+
         d7sw==
X-Forwarded-Encrypted: i=1; AJvYcCWoiGnn9tDQ36PIn7ucWo/9thOeY7fSD3//Uw85V4GW2N2Am8volR0BRZ6uEOgIaD6ly5vyawfQKgG2RWOipioWUJGHcyAE
X-Gm-Message-State: AOJu0YzJexi8dZZoGwUjISA5xamf7q9GnmxjDhGmsbPmUqAhPU78selT
	hFVCm5+v3OZSfJgoPWy3sklUpXzEd/lRPtmErokaMhrYpu+p1ry9Og1U6trrEcATyoYtfALcDF1
	AXj49cECl/w==
X-Google-Smtp-Source: AGHT+IGWi1LibK1nZw0q6Q4tqmmWYS4B+FgwA8ZzIABQd+wHsGEliel9TjUnDDHBjOACDBJOhFUG3Xb2cqVxCw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:43c5:0:b0:360:91c2:5708 with SMTP id
 ffacd0b85a97d-3677572997dmr8230f8f.13.1719831790599; Mon, 01 Jul 2024
 04:03:10 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:24 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-3-smostafa@google.com>
Subject: [PATCH v4 02/19] hw/arm/smmu: Fix IPA for stage-2 events
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tOO7xIST9plo

For the following events (ARM IHI 0070 F.b - 7.3 Event records):
- F_TRANSLATION
- F_ACCESS
- F_PERMISSION
- F_ADDR_SIZE

If fault occurs at stage 2, S2 =3D=3D 1 and:
  - If translating an IPA for a transaction (whether by input to
    stage 2-only configuration, or after successful stage 1 translation),
    CLASS =3D=3D IN, and IPA is provided.

At the moment only CLASS =3D=3D IN is used which indicates input
translation.

However, this was not implemented correctly, as for stage 2, the code
only sets the  S2 bit but not the IPA.

This field has the same bits as FetchAddr in F_WALK_EABT which is
populated correctly, so we don=E2=80=99t change that.
The setting of this field should be done from the walker as the IPA address
wouldn't be known in case of nesting.

For stage 1, the spec says:
  If fault occurs at stage 1, S2 =3D=3D 0 and:
  CLASS =3D=3D IN, IPA is UNKNOWN.

So, no need to set it to for stage 1, as ptw_info is initialised by zero in
smmuv3_translate().

Fixes: e703f7076a =E2=80=9Chw/arm/smmuv3: Add page table walk for stage-2=
=E2=80=9D
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
2.45.2.803.g4e1b14247a-goog
