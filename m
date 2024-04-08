Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293668ejh;
        Mon, 8 Apr 2024 07:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQGvDRDZ5Q+Yp8SUnoSiaWIm6tzATc4O8kNUdGwSjfIMkAAdWLECJTO6pdvt1wtM6cBjVE81t4pxvCkgxIQAsOddNETSW+
X-Received: by 2002:a05:600c:4505:b0:415:6d51:8f8f with SMTP id t5-20020a05600c450500b004156d518f8fmr6886089wmo.15.1712585347639;
        Mon, 08 Apr 2024 07:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585347; cv=none;
        d=google.com; s=arc-20160816;
        b=qTUjOkkwWG/Lq3WDs/sBYE2FFOFXQkrRlUJR4OTeE76nP6m7Ah7wX4gzJRqWR/DYQH
         El3gczi0wjKDZ6sDLWQpd9jweDM8GPCc0NYZ1e+WSrJD4t1R06ewrr2NoqQeynldyXVw
         i0Z6/O9Flz2i7ZN+YjcWbNKVzsgE+yhY8PeEW063QywO0h9KFWmbHeUlCE3IxIPZLWZe
         LWy7VdzonAOwu/aGhNskxCH+e3O21eMq0WZ5q6iFmX6EAyXRLyGLcWzOqPMhHRhwp8Fe
         NoDoxitUB1PMR12ctkw+Gb6iUYISDvSBO71F+lI59Ofc+WR8olv10oudt4Z1NzLj/BOL
         OX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=8Rs5Gq0IJYI0ErVBm5gUmFtCJKGXjPzne5bV3NxRgVI=;
        fh=NuSUFU2GlTZUmSb4muZh/pvGcAc0CyVgDTRlG7AdFTE=;
        b=OB3e3es+iVZHioqPu43luZ1JyyVWP7HF8GJKc83ISpX4DeOTNL44GCPoGLTVlePVyP
         M+XFd3vlkBy6+weBPgt7mjYK9tbDG2ATXFgcSNOXdl465qcMvGYD59a9vIW7WNAdnJKe
         At6rXVWK8T6g4jlmJoawNh4CM5gBoWD49jECcQmIONGb7SsqHvclYhQn9BSmHTyiMFE/
         cgQxsHJxHeEtvREdO7w+SzEOurCAyrk0Du3lCLU3j/jMXy19Bv2koIWHmO+Ginz94cdd
         NmO3fZk4wY2MasUE/ay5r88OuXcpwBLgLJEtHG4MajcFaiWbd8DFVrbWsNJEb/ecfTUn
         NXAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=nhqOCCUy;
       spf=pass (google.com: domain of 3g_otzggkc_4ysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3g_oTZggKC_4ysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3g_oTZggKC_4ysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id x25-20020a05600c21d900b004167c7a2693sor422766wmj.5.2024.04.08.07.09.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3g_otzggkc_4ysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=nhqOCCUy;
       spf=pass (google.com: domain of 3g_otzggkc_4ysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3g_oTZggKC_4ysuyzglgmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585347; x=1713190147; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Rs5Gq0IJYI0ErVBm5gUmFtCJKGXjPzne5bV3NxRgVI=;
        b=nhqOCCUy8U6xy8Z3r7YXoovZBNLb50qkNf6+8exmb5V0RlVWFnC9zckEytpitBax2I
         i6JwIZyAIN/F1qysoqitnK9+OLtmOYxkuhrnkPQRWshFk2s1CpP1lSADY1cGE/rrNKAA
         MkcEcR3DrIKp68BMavWqlTw/Bc2/EChsHJUHB+H5rFEOzLNOjpdRpoosfruJ0yqedi/0
         VPJYi350cfj9MAnAeW1pzZ7Z2x9e0b5G46Pa6MFSOqtvSVl3FRz7XpfzhBiz0u8TNG5E
         7Ps4jxRNDB0UQYA6G+aqWmEmLxj3Y0JY0bQNS/sZGho5lE+iJ8YVAXI+R6hezQY8cs1r
         vsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585347; x=1713190147;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Rs5Gq0IJYI0ErVBm5gUmFtCJKGXjPzne5bV3NxRgVI=;
        b=Z6gTTo6WHPiF0YSlwIWFiajUa18jmtZaw8s/L72mARn/iMho3Z8nPT4r66jMFv4wKQ
         X14hhVGblidHRXLDgLF2E2X072WWTRZdm84RJJg18z9+FT/Lqrpcr/qf9PBPtWiCSQlE
         nmp8YOgsb3hT7rH2AICEf7+gc//5w1M4rwqTQ0O4A0ZZGjqGL75Y3zMDqgUSSsjA+qnx
         xsAmJfHpzc4bn+ymD+pwQvGlu/9938edR3bDNVsdV1BydInwZUow6ExBW/Mw3OxGmgD/
         dblCusMQC+AqwVMMef5zv6DRZtIJNdSVnMTLWEoIGO0cCSHS1iqmx/jTHv5in8Bflg2x
         0EQA==
X-Forwarded-Encrypted: i=1; AJvYcCUYNbLqQJk6YDk44UDKKW97zUimRpYPYrPcSfKWDwrsBkNzOH+EkLDIQw1bXIAQuUPsJ/Qp7vv2EagmHwv/7khlEfVKDsMr
X-Gm-Message-State: AOJu0Yy8q+bXCfI3WLG59K5e/FfFmYQEckJVuI32kWW5nGK92sGYqsZj
	xi9ZTI0WTToMw0vNjPq+rlKeIBzQcoQSYhfyq+ay57kEudewpQa7r6MXBpx3cuf23HYbJhDfxOQ
	4c2uNfg5lgw==
X-Google-Smtp-Source: AGHT+IEmUAeykZPkblw7r/hjiEJS0ynYXlgskD+NxTpOMWY2jMoLMkyccMmuLU3Cl1EI/fHm65MU+Gev9tD9Xw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4203:b0:416:8041:28f4 with SMTP
 id x3-20020a05600c420300b00416804128f4mr6389wmh.2.1712585347028; Mon, 08 Apr
 2024 07:09:07 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:08 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-4-smostafa@google.com>
Subject: [RFC PATCH v2 03/13] hw/arm/smmu: Consolidate ASID and VMID types
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rUZU3Gl2h5ru

ASID and VMID used to be uint16_t in the translation config, however,
in other contexts they can be int as -1 in case of TLB invalidation,
to represent all(don=E2=80=99t care).
When stage-2 was added asid was set to -1 in stage-2 and vmid to -1
in stage-1 configs. However, that meant they were set as (65536),
this was not an issue as nesting was not supported and no
commands/lookup targets both.

With nesting, it=E2=80=99s critical to get this right as translation must b=
e
tagged correctly with ASID/VMID, and with ASID=3D-1 meaning stage-2.
Represent ASID/VMID everywhere as int.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 10 +++++-----
 hw/arm/smmuv3.c              |  4 ++--
 include/hw/arm/smmu-common.h | 14 +++++++-------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 20630eb670..771b9c79a3 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -57,7 +57,7 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gc=
onstpointer v2)
            (k1->vmid =3D=3D k2->vmid);
 }
=20
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iov=
a,
+SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level)
 {
     SMMUIOTLBKey key =3D {.asid =3D asid, .vmid =3D vmid, .iova =3D iova,
@@ -130,7 +130,7 @@ void smmu_iotlb_inv_all(SMMUState *s)
 static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
                                          gpointer user_data)
 {
-    uint16_t asid =3D *(uint16_t *)user_data;
+    int asid =3D *(int *)user_data;
     SMMUIOTLBKey *iotlb_key =3D (SMMUIOTLBKey *)key;
=20
     return SMMU_IOTLB_ASID(*iotlb_key) =3D=3D asid;
@@ -139,7 +139,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, =
gpointer value,
 static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
                                          gpointer user_data)
 {
-    uint16_t vmid =3D *(uint16_t *)user_data;
+    int vmid =3D *(int *)user_data;
     SMMUIOTLBKey *iotlb_key =3D (SMMUIOTLBKey *)key;
=20
     return SMMU_IOTLB_VMID(*iotlb_key) =3D=3D vmid;
@@ -191,13 +191,13 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int =
vmid, dma_addr_t iova,
                                 &info);
 }
=20
-void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
+void smmu_iotlb_inv_asid(SMMUState *s, int asid)
 {
     trace_smmu_iotlb_inv_asid(asid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid)=
;
 }
=20
-inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
 {
     trace_smmu_iotlb_inv_vmid(vmid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid)=
;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f081ff0cc4..897f8fe085 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1235,7 +1235,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_TLBI_NH_ASID:
         {
-            uint16_t asid =3D CMD_ASID(&cmd);
+            int asid =3D CMD_ASID(&cmd);
=20
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
@@ -1268,7 +1268,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
-            uint16_t vmid =3D CMD_VMID(&cmd);
+            int vmid =3D CMD_VMID(&cmd);
=20
             if (!STAGE2_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 5944735632..96eb017e50 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -84,7 +84,7 @@ typedef struct SMMUS2Cfg {
     bool record_faults;     /* Record fault events (S2R) */
     uint8_t granule_sz;     /* Granule page shift (based on S2TG) */
     uint8_t eff_ps;         /* Effective PA output range (based on S2PS) *=
/
-    uint16_t vmid;          /* Virtual Machine ID (S2VMID) */
+    int vmid;               /* Virtual Machine ID (S2VMID) */
     uint64_t vttb;          /* Address of translation table base (S2TTB) *=
/
 } SMMUS2Cfg;
=20
@@ -108,7 +108,7 @@ typedef struct SMMUTransCfg {
     uint64_t ttb;              /* TT base address */
     uint8_t oas;               /* output address width */
     uint8_t tbi;               /* Top Byte Ignore */
-    uint16_t asid;
+    int asid;
     SMMUTransTableInfo tt[2];
     /* Used by stage-2 only. */
     struct SMMUS2Cfg s2cfg;
@@ -132,8 +132,8 @@ typedef struct SMMUPciBus {
=20
 typedef struct SMMUIOTLBKey {
     uint64_t iova;
-    uint16_t asid;
-    uint16_t vmid;
+    int asid;
+    int vmid;
     uint8_t tg;
     uint8_t level;
 } SMMUIOTLBKey;
@@ -205,11 +205,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32=
_t sid);
 SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
                                 SMMUTransTableInfo *tt, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *ent=
ry);
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iov=
a,
+SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
-void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
-void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
+void smmu_iotlb_inv_asid(SMMUState *s, int asid);
+void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova=
,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
=20
--=20
2.44.0.478.gd926399ef9-goog
