Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2117997nji;
        Mon, 15 Jul 2024 01:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXut5WBeyChhYPFi14x16asefRMPpJCXqlnIcakl46m+niYmnw2meRWh/tktvUhT5bskCt7JzBap25FnnWeDEcCtcvwveKi
X-Received: by 2002:a05:600c:4f8d:b0:427:9dae:2768 with SMTP id 5b1f17b1804b1-4279dae2866mr80940875e9.38.1721033133052;
        Mon, 15 Jul 2024 01:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033133; cv=none;
        d=google.com; s=arc-20160816;
        b=oHBb5VmjFA570i+hlRMhjRAzlCvMl8xZLDYj5ZSbzqJ1Igbf/RCGN3TM+auln4m7Ea
         QWZj3/QOeSIIHp141KqfjViXHg8olezjTwwwahfNp1MIdttKGLkI7Fwpt1mVajd92UsW
         b3GUWuDjKi4t8ln1tnXNp3f+J2aU66/fyMiBNMhFSn+Ohbf89HS5wwTFFskexoxTrloj
         xSs0eMi1wzqnhJK2fNUVVx8KO/nLzlH4e9WB8CKEo91qYb23y8HeBGLn74VXxLSR+eFE
         J7uHftq/E2nHO4TLzc9u3EnLrbctyvtuFSADR0/wn6+p+vqO4TjoVI/sJJmIUUKMJgZV
         MUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=HauqpspRGzaWiC+Y5wBwhzngUip4YeSIv/BXthOH49g=;
        fh=TkLiNAOARQotljwv/XEOzE0bNUYsKggzxarWFYR9I1o=;
        b=Up6W/OLQD1jpglBLYn1H5FdAoIz8xuyJ4aTWLoYbx65wAbvIUFc4oeT94bVFZyMzN2
         iC7WCKmIXoGsxBp/6M866zT7oZrRp4kp9huzOkdDqYLrOKfwee/7x6Ni8jhH/CshoY79
         yW7RXOYbiFnxktkwTzZ/lKDFFkR27S8afxuUgre0Yul2O9zpH0XSWDwLWSkVU1sws+tp
         XXJ22Ihr2EtozvHij9VcJ9ZD+9lk3txZt7l0J0y7K3Z+MyCoX6jDAvbqubGtxfr3tnVZ
         gPf0J5ULIeW8z4ksXNToF6BWFMfobeHJOdn3JiJ0qV0eonqBNKPoN08ooUWe+oQUeAeh
         U0IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=G5yPHLsH;
       spf=pass (google.com: domain of 3roguzggkc_0xrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3rOGUZggKC_0xrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3rOGUZggKC_0xrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427a641906asor8874115e9.11.2024.07.15.01.45.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3roguzggkc_0xrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=G5yPHLsH;
       spf=pass (google.com: domain of 3roguzggkc_0xrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3rOGUZggKC_0xrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033132; x=1721637932; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HauqpspRGzaWiC+Y5wBwhzngUip4YeSIv/BXthOH49g=;
        b=G5yPHLsHaphG9WSRHAOvJZbc2w1ztVxngI7ZwU7TN9jWWYTOFFQm2Gm2HRhkF77ph4
         7jyYerGXV+hdutBvfg8q/WtMkLWWAOe8umx9HNcZiqvOOob5iVJ8du/jUA/jkJuY2AOk
         nMBarP6IuAQKg3qExxEmw8vgd7+lw5XDqOeG0ZCEPytPAt8BMkGQaF73p4eCeJv+FQV5
         weVDjaIQ06EV5lNlNNbZRBu7E/04RKn3LgLf1WhISLw/Mk4FH7IZlSdbwe8yvaLQztz3
         tPSsEsDOBgYh0O/JFPPgvKy04JjqP+CYQxcJo+mNszp9yY+UuBe0UkyWcy8bjccMQXuX
         Tqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033132; x=1721637932;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HauqpspRGzaWiC+Y5wBwhzngUip4YeSIv/BXthOH49g=;
        b=INk9EX1UBs+LryS7oBrJFAfFsRuxGPj+hMSK8K0aIrx1cdtJ9HPfUBlHIblBhoDWog
         tFW7o1al84waLevZeigD/7UzVxaS9RPiFYy+JE4v8589G3kBD/NVskHmrv2UUiI1/mk4
         A+V7gFtCr2GIpv28WN2qetNp1ZozbiPaQk1cGb0iqLcnvAXdmBrjlmakte+CdWV5upIV
         D4Egovl40SiWuL8ezk8CFM3th1LzFyRTV0w5RcfQU+oPOl4uM0QGWVVygEDRbfm9To66
         axxg3XaIReBHgSmUZ5dcuWF+z5vewujTPyg2cqKGMBEsteqJkmnRUbjgIIHWmiJcaDZE
         Qd6g==
X-Forwarded-Encrypted: i=1; AJvYcCXCXNTO+9DtwqQrvEcGk7pWPho2lFohyKhvkZlqhOFLCWAMNjwPQfTuDBQEBHG/esy98NihP25/9i01zEPm+G4lKznh1Nki
X-Gm-Message-State: AOJu0Yxxi/BSaOWNdLPQzEYDEHOCILM1BKw9qCEtIfhf35IBU09qlcdY
	FDnvVfpIHR/t/BKkRT9z7QDMuwTGc5XwVhjMa/0uDZ/yZMcucd07sKFQf9np8qOen9cuPC1Pz+U
	cSnVhlSnZXA==
X-Google-Smtp-Source: AGHT+IEVZI0lwci5jXrZC/bDA9IrqvrdR79+qlyLo6LTG4FAUay3uxlwg0Akz+mtF5A6NOiyImgFlj35MpWwEg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:3b8a:b0:426:6668:d45 with SMTP
 id 5b1f17b1804b1-426708ef826mr932405e9.3.1721033132428; Mon, 15 Jul 2024
 01:45:32 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:02 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-3-smostafa@google.com>
Subject: [PATCH v5 02/18] hw/arm/smmu: Fix IPA for stage-2 events
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rUXAYB5/qlLr

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
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
2.45.2.993.g49e7a77208-goog
