Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118154nji;
        Mon, 15 Jul 2024 01:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTOorMs6XkkT8w3POLIXkg+193ziF7APbAmbXL4VewFWHovi9ZLOuxtOJpD+vCIYdej27dTBriFHoZDpjjVpX20eZbWQY8
X-Received: by 2002:a17:906:c450:b0:a77:c043:5b59 with SMTP id a640c23a62f3a-a799cc6f977mr617657966b.20.1721033158699;
        Mon, 15 Jul 2024 01:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033158; cv=none;
        d=google.com; s=arc-20160816;
        b=Lgv4jr2hzB3Yrd5tZ9HW0p3Wi9DwVMhCb5RNSmkMPDxCHTBRdNKtARw+vZBA6hSq7D
         xCG43Ni3BXQe02MLUi8tk7X1k4ttcQvdPCmpTbN4Vh0BMRSN91DAvOZac2pC4IU+EtWo
         wCkTzZLqXA1i9xPL7+YkzKiJk9AuZKsjrp385OOfGY/LWdsXeadrWDd7FMaLk6tlZSwN
         NOUmIygABepN5AEhJusIHtQ3r1D7LgPzNUUxwHt9+zXp0hIMO2O6SS6BeqIX12e8DFzr
         ByXuhKxMDkC0w4+4ZWrzFAaNdckmn8touEjli60Gt9H5ojP1CnkT/bZtrsUIwgtxn5lN
         ib6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=kSLLJA+MylhZD+tmsfMTBjMJxnWvKaFxAJzvA+CCiPM=;
        fh=57iDe4vglQQGNAh7C8Uy7WN58RdozuAhJMI8HWKMm78=;
        b=NA8SjpYgQvv96R6ylSoc/KTxNkCDK3d3VAMwD7mGdr9vl0Q422MPPW1+BxLCRaVzkV
         ff5ZQbbexpt4wtkH1JCVA/402mj2CClnGTJtCRgg3VVZchMtjiV2XgENAGsUGLDSLZnm
         egZBqiZmEch9TlQTsZK2XynKBxmH/I2aYm9YO7Q9+yH+bk0zT5oeRrLFrYtx7MiLfZa/
         7Z3FIpvkxBdxGaYFu7gqT2yj1eQnwacXHrqyQOWoadDebEH0P7dpWLargPk8lPA2vgkH
         8RaEMLZQo13NKpNYMHIllDYIKfmVin62bnrlCt6XBaUangHAhObvAJ4krMLjD6rLrVcs
         mxDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sDUYdPdF;
       spf=pass (google.com: domain of 3xeguzggkcxggacghy3y4cc492.0cay92l.z2bb2296byfc.cf4@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3xeGUZggKCxgGACGHy3y4CC492.0CAy92L.z2BB2296ByFC.CF4@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3xeGUZggKCxgGACGHy3y4CC492.0CAy92L.z2BB2296ByFC.CF4@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id a640c23a62f3a-a79bc5b5098sor86409466b.12.2024.07.15.01.45.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3xeguzggkcxggacghy3y4cc492.0cay92l.z2bb2296byfc.cf4@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sDUYdPdF;
       spf=pass (google.com: domain of 3xeguzggkcxggacghy3y4cc492.0cay92l.z2bb2296byfc.cf4@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3xeGUZggKCxgGACGHy3y4CC492.0CAy92L.z2BB2296ByFC.CF4@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033158; x=1721637958; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSLLJA+MylhZD+tmsfMTBjMJxnWvKaFxAJzvA+CCiPM=;
        b=sDUYdPdFWK22nJz1vxwcqxQwh1Nt97OEZaLGXM5TiRCThc30bItAMtm6BH4luGIHRY
         6cnAFMql4smfjWQyfOmeQ0mQkjFL6WJmS6kDkCU7TkCTTcDO3sZYpqzyf5zdpdc5Y9ec
         P/zZDwHGDktVlhz+0DJTelZkPXMf/03vci5cTjpJDyCvJiYpG24Vk4nyaAH7eX179Iei
         9v/EEZWlyIYgtyuH+ZhoISQ3moHynApo/6wpWmfUqPou3txzLstfc3xdxGkVvD3w6+wl
         xBTjh7sAhugbrF978iFzdkJeoCF5FDf+Yt3bAr+zzS/fWkVmaw6/pe59KIUY/jYEO3Ov
         a/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033158; x=1721637958;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kSLLJA+MylhZD+tmsfMTBjMJxnWvKaFxAJzvA+CCiPM=;
        b=cOd01DUKpC11tr0NY2HfvV59KZYFQEzdbwyRcpMoSSNeAweBq577q2G63Sw0HKj7ZK
         L6IVr0kvyNW7+OF+Nc5toKlFHUhJoT9I3AULLFffFh1d3QdN67tmZvm88ONODuC5fE2g
         AeRAXp38J9gP3JRt7/hEZDPbgqLO7eqDOW/loP4Bklm7BfaX882AsxyVXl8SZRqJ6jFL
         4um27QulcUYfHM7K2TVI2ifqlWzZhXafpgk4upIMIcq7s4Vrzr0zD6/urvU6DWZCsOA2
         p/OMAMWNU8LuF/nibMEeDYLyMYUpnG+uBbdVzWA5I75cQ9pFRuK7Azz3IMQ74n93BfVt
         E3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXAmHzYmk/C71VwV07XPxk4+6/CizfDVAsjvhC44O9+siz4X5+MusjWfak1UbOld9c3/i0INu/4EDLnQrfzhfz/xLZDODdq
X-Gm-Message-State: AOJu0YwqfNpo+//f8kjSERthe8m2SoqSfSczOzsRZ/g2ugSv+aJ8Ywm4
	Wkd/774OIxKSNQPuSDR/vAmlEyQ65oX6DPKLMKtBugbEE399hVRvEyqAF47F2qL6OV3fc2cRp+z
	JEPDBxmxMMg==
X-Google-Smtp-Source: AGHT+IHeMCtt0rWhGRuIPi5vXqatFPsYEtvybGVAoR4/mvSBPex2Tm6Oe8iUbb/K7laB2fPI3lfeFUqVFwF6Cw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a17:907:6d07:b0:a77:eaf1:87c0 with SMTP
 id a640c23a62f3a-a780b505758mr1377166b.0.1721033157964; Mon, 15 Jul 2024
 01:45:57 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:13 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-14-smostafa@google.com>
Subject: [PATCH v5 13/18] hw/arm/smmu: Introduce smmu_iotlb_inv_asid_vmid
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: pEmVQUyWBXnG

Soon, Instead of doing TLB invalidation by ASID only, VMID will be
also required.
Add smmu_iotlb_inv_asid_vmid() which invalidates by both ASID and VMID.

However, at the moment this function is only used in SMMU_CMD_TLBI_NH_ASID
which is a stage-1 command, so passing VMID =3D -1 keeps the original
behaviour.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 20 +++++++++++++-------
 hw/arm/smmuv3.c              |  2 +-
 hw/arm/trace-events          |  2 +-
 include/hw/arm/smmu-common.h |  2 +-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index a100700497..bf35806b02 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -159,13 +159,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
     g_hash_table_remove_all(s->iotlb);
 }
=20
-static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
-                                         gpointer user_data)
+static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value=
,
+                                              gpointer user_data)
 {
-    int asid =3D *(int *)user_data;
+    SMMUIOTLBPageInvInfo *info =3D (SMMUIOTLBPageInvInfo *)user_data;
     SMMUIOTLBKey *iotlb_key =3D (SMMUIOTLBKey *)key;
=20
-    return SMMU_IOTLB_ASID(*iotlb_key) =3D=3D asid;
+    return (SMMU_IOTLB_ASID(*iotlb_key) =3D=3D info->asid) &&
+           (SMMU_IOTLB_VMID(*iotlb_key) =3D=3D info->vmid);
 }
=20
 static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
@@ -270,10 +271,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_a=
ddr_t ipa, uint8_t tg,
                                 &info);
 }
=20
-void smmu_iotlb_inv_asid(SMMUState *s, int asid)
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid)
 {
-    trace_smmu_iotlb_inv_asid(asid);
-    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid)=
;
+    SMMUIOTLBPageInvInfo info =3D {
+        .asid =3D asid,
+        .vmid =3D vmid,
+    };
+
+    trace_smmu_iotlb_inv_asid_vmid(asid, vmid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &=
info);
 }
=20
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a0979f15a0..cfee42add4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1361,7 +1361,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
=20
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 7d9c1703da..4aa71b1b19 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -11,7 +11,7 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, u=
int64_t baseaddr, uint6
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t ptead=
dr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=3D%d le=
vel=3D%d base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" iova=3D0x=
%"PRIx64" block address =3D 0x%"PRIx64" block size =3D %d MiB"
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte)=
 "baseaddr=3D0x%"PRIx64" index=3D0x%x, pteaddr=3D0x%"PRIx64", pte=3D0x%"PRI=
x64
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
-smmu_iotlb_inv_asid(int asid) "IOTLB invalidate asid=3D%d"
+smmu_iotlb_inv_asid_vmid(int asid, int vmid) "IOTLB invalidate asid=3D%d v=
mid=3D%d"
 smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=3D%d"
 smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=3D%d a=
ddr=3D0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=3D%s"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index f9c8b00c9d..b3a937190b 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -213,7 +213,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg=
, SMMUTLBEntry *entry);
 SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
-void smmu_iotlb_inv_asid(SMMUState *s, int asid);
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova=
,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
--=20
2.45.2.993.g49e7a77208-goog
