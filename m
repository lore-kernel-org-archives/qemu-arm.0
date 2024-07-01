Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286250njm;
        Mon, 1 Jul 2024 04:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTJDmayd4zyI51mRrPnVMZuRrs7LwGXD1Rm6UENFl0TxfirZLRSdDv/IpUldhQoqgCYs9OsrIdl/8s2ZvgD9q/6+3beCo0
X-Received: by 2002:a25:b49:0:b0:e02:c3fd:ed6d with SMTP id 3f1490d57ef6-e036ead0c85mr5311323276.2.1719831794064;
        Mon, 01 Jul 2024 04:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831794; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAMBy2AjkoZaIMOHYvxHwN73JhBdbVP2eUX6DCU2X9mLbxH88B7Tw8sTY7WJkv7/8r
         H12VDHEX9BHoUawXF37qiA6hqb9nfVEC0gX12T7SeCBD0Ix4BsPPbU6L/sqVSksUcanV
         mo8yva16IUfqoKiBlbtOWcqf2XWzaTWOi/ZVrrkpsOdeqfJEIi7wcm9uxoSFsP/qoMC5
         nRex0nKZffKKCzWa6z/okvWnaqg/42oi3ASGKbjxadyC3XaM+jso7+5bjG9Z7GkzNQgX
         MjzRJ0edvVPn2ADiHbXYXa2jorOnXFQamP/63cSsSBaaKuY7tszXR58s34/5gBnoZbNE
         kvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=wqwMFjuNcPNQgfmtUIfkUcIllMEdFf4XaEpH+L83rCQ=;
        fh=23/lVgaZ/J9N4o/0E7sgz0EpLaoLq3mecl3buLbfnho=;
        b=EnQkCujU2JNedhQptX8DM1u8FWuO1hhXXcdO047rFji1odDuIVQ27Y6L8lECqlcCuf
         dSJ3kFmWH5P+ZBrv42h8XRW62k6n13kMnecUhAtq7KQ+V5NroI1jBtaQKn55g3EWbQI1
         LfVutCup7C9mIwVQvYqLh87zdv9X2XwzoAAK9muKCCgFiR3t3Du65jLgq5DGcQifF6IF
         eevrPpyy+7Vce0jJYjNRddWk0nOedsX8Rrc9iKBx/PUSgRhyJshCTbsk7fGkjgbslERj
         Lr1ECNAiCKIo4O9zNLz4gIz8LeJD4GsKfDbIDUEhZqw5Gy77tw/KmJhmbJabYFgaNVE/
         hKgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Kv0S8Ypf;
       spf=pass (google.com: domain of 38yyczggkc1aa46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=38YyCZggKC1AA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <38YyCZggKC1AA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0353d913f7sor3409850276.8.2024.07.01.04.03.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of 38yyczggkc1aa46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Kv0S8Ypf;
       spf=pass (google.com: domain of 38yyczggkc1aa46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=38YyCZggKC1AA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831793; x=1720436593; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqwMFjuNcPNQgfmtUIfkUcIllMEdFf4XaEpH+L83rCQ=;
        b=Kv0S8YpfmIourkme3ie+p2aM2hRjfxQNTac53lV6Q0I1/Z2tVtkc12BClugubd/AfF
         fImAcYBTVwVnX/ziCEdesonvErcQ0SSksK3yCqCdtjc4BjusvTsZSYmmVIJcSzmhgUlg
         aFxUA5zPgIjoZMgDuMeicV8Ie5XrYSVdisv4aY9tUL79MaSfmhBlUwLwP6Ci5h51hueB
         HYI4G+VeGyByLYBpboVyVgEP8PIhYV4ukvcvyonBZB65ob9RrWs3jv92fagLRsl4ylNL
         v7j9y6VGrxCt93A+OYbhkbovAKhxITauLs4YGHsNl7IBuj2bayxg4oz2kYR1H82qzitX
         8prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831793; x=1720436593;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wqwMFjuNcPNQgfmtUIfkUcIllMEdFf4XaEpH+L83rCQ=;
        b=LU4u3T0e4/36d1g+mFerfhTlXy1jbkosNkqqC8buUDFB8/nK6rRXtw5dDdzG7dUQ2s
         qCevqxoAuGHLBV/SthuOG3f5Y2Lc+RhTf1Dmt8UhjO88o5AtaN3qIAQk/hfDRXp3Pt4G
         xxBmH1icWjvx0Vyx7cRmOudK66NV3cZKwP4/HPzETD6z0BG7p4JsGxFiX5ZzVV24Ge4k
         1isukvnAAMiiigockGon5qpq65kFy3luXk9dKQE4+e4vLBnMB8O+A8C/WO+xbfq36VNA
         VRSwoAoe6AGrwgw3lWzoogQEAFW2c/9eqGr5sMfy0DYT22sgOmleQNaKjXuehia1PsLi
         PtSA==
X-Forwarded-Encrypted: i=1; AJvYcCVbdzUJ0EJwd9FhV5SwAJPCL70sBXX8qEJlKggLJNk75cZlJiPCE8FhVYs72mCDGNPwXh0yb0hesPlGVDlPsWoynsVH514C
X-Gm-Message-State: AOJu0Ywf8HPrJvbuNJZhspJLjq0+oDI82W5MK0dARfXd1/U69Iu3rB/0
	SWFXNz7Ub+iCPYAOVpk13g2cDYZpiiy0v957JdH9UTfqOEpoDLrmLWf+dbv4eWMxbEG2c0QvYcW
	VdHah54MvQg==
X-Google-Smtp-Source: AGHT+IFA6H4WgylxWuZ+vt+/5n12yS4Zs2Xmd4MvpuDIDP+VuDP/DcgmBSLwr15ZoAgCBmR3gJWgFhmpdDH53g==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:c802:0:b0:e03:62dc:63de with SMTP id
 3f1490d57ef6-e036eb27486mr333339276.6.1719831793563; Mon, 01 Jul 2024
 04:03:13 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:25 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-4-smostafa@google.com>
Subject: [PATCH v4 03/19] hw/arm/smmuv3: Fix encoding of CLASS in events
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qLh1LrCNNSmv

The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
class of events faults as:

CLASS: The class of the operation that caused the fault:
- 0b00: CD, CD fetch.
- 0b01: TTD, Stage 1 translation table fetch.
- 0b10: IN, Input address

However, this value was not set and left as 0 which means CD and not
IN (0b10).
While at it, add an enum for class as it would be used for nesting.
However, at the moment stage-1 and stage-2 use the same class values.

Fixes: 9bde7f0674 =E2=80=9Chw/arm/smmuv3: Implement translate callback=E2=
=80=9D
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 6 ++++++
 hw/arm/smmuv3.c          | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e4dd11e1e6..0f3ecec804 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
     SMMU_TRANS_SUCCESS,
 } SMMUTranslationStatus;
=20
+typedef enum SMMUTranslationClass {
+    SMMU_CLASS_CD,
+    SMMU_CLASS_TT,
+    SMMU_CLASS_IN,
+} SMMUTranslationClass;
+
 /* MMIO Registers */
=20
 REG32(IDR0,                0x0)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9dd3ea48e4..1eb5b160d2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -942,7 +942,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             event.type =3D SMMU_EVT_F_WALK_EABT;
             event.u.f_walk_eabt.addr =3D addr;
             event.u.f_walk_eabt.rnw =3D flag & 0x1;
-            event.u.f_walk_eabt.class =3D 0x1;
+            event.u.f_walk_eabt.class =3D SMMU_CLASS_TT;
             event.u.f_walk_eabt.addr2 =3D ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
@@ -950,6 +950,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_TRANSLATION;
                 event.u.f_translation.addr =3D addr;
                 event.u.f_translation.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_translation.rnw =3D flag & 0x1;
             }
             break;
@@ -958,6 +959,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_ADDR_SIZE;
                 event.u.f_addr_size.addr =3D addr;
                 event.u.f_addr_size.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_addr_size.rnw =3D flag & 0x1;
             }
             break;
@@ -966,6 +968,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_ACCESS;
                 event.u.f_access.addr =3D addr;
                 event.u.f_access.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_access.rnw =3D flag & 0x1;
             }
             break;
@@ -974,6 +977,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
                 event.type =3D SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr =3D addr;
                 event.u.f_permission.addr2 =3D ptw_info.addr;
+                event.u.f_translation.class =3D SMMU_CLASS_IN;
                 event.u.f_permission.rnw =3D flag & 0x1;
             }
             break;
--=20
2.45.2.803.g4e1b14247a-goog
