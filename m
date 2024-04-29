Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931717ejb;
        Sun, 28 Apr 2024 20:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/x9evvEeKkFW4/UOazj2OGO2FJ9vIIYGWLhrnbc42brenjeqAqipSkHgCMhOqZHSI4DWmZk9Ks8OxYRXZKg4lKrQLFuJ+
X-Received: by 2002:adf:ee4c:0:b0:34c:8adf:8fc9 with SMTP id w12-20020adfee4c000000b0034c8adf8fc9mr4158334wro.51.1714361086760;
        Sun, 28 Apr 2024 20:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361086; cv=none;
        d=google.com; s=arc-20160816;
        b=yOQEbCzx56vB9PWtgVJED1gO5ddwFr8l4L85AiIKTjMET7gZtkqV4BglnSnU6nfX6y
         GRdHM2X4IiSYiKlbI2jKmwTTXJbUQvlmkHgoIinV9iO+/FruBRgiF9tXqbVpl28KDHjN
         IC+qgq+J/b5imKXXR3+C+8bAdcrOO3E1jVSxehQhWvYHj+ho0T6GUrtq7EPO+UU/0bjY
         9/ZfgpU8eiMxyl+zmEmhexsTodMNDHDSU2tYBMMVVMK7fwQbQ8QR23wPLIjZabP6MvV8
         t92EiMSE0jDfmAkHg4kMjKRAZoK0waJNYZljqs4txQ7/nW8DyLPvlXJkXymuCMxuxyUe
         XFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=jzuUWu6bG8mAJ09DQsMaSkbyaQKWQKRU5BzKtgEAL9w=;
        fh=S8kkqCNZKiNJMvjcd89IeARm/7q8pOS/wIHvwme1DkI=;
        b=G7jHJ0awxZazRINK9WBLUtHXwp70rvYJUJqL5oW3TEN8BZVJF2tTpArqgk3EJk1LT3
         gVgVw+Crq1Vn0J9MvGkBBd4lX5Fzi54gINcIbFY+Xq0/sqk6bRXtptx5uyyEyMugY5Lt
         bba3cbJGuKS5jvCtupvTvJ+XMQGdfsKoUeuPY9w/+4vHtTKHb6esiJ5uB55r5DNyr+OO
         ljRegOKXoS387DVXXDbWn3h/A3k8aegVD9eECJIrSrnAmK/c0xTJU+ddWAnOghLcb1Iu
         Pt+V8YfiXpfTjQK6dSJCT+4K7/sK0KctJ3GtR9MwVQNJ8UmrJ3UApXnig9YFs9hN+4XK
         EIQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Hv7hxTeW;
       spf=pass (google.com: domain of 3_hivzggkcxkhbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_hIvZggKCxkHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3_hIvZggKCxkHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id k17-20020adfe3d1000000b0034d10997bc9sor257530wrm.4.2024.04.28.20.24.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3_hivzggkcxkhbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Hv7hxTeW;
       spf=pass (google.com: domain of 3_hivzggkcxkhbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_hIvZggKCxkHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361086; x=1714965886; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzuUWu6bG8mAJ09DQsMaSkbyaQKWQKRU5BzKtgEAL9w=;
        b=Hv7hxTeW0CpDvbT8DaTxTlxf4AZN5wcNvFKSAsjnZ+31EamNauI10ZPBCuXWm2xk29
         JsHX/do18sNywB//01PuHFcvK7R6HeOasUlY+3freVKXeEGs4c5LKEwuSeBvZSnj6s+W
         UXwuGS+CFTY6LCLoM6CSO105Kk53kD3pOhzV/gHH3U+pcJFscCF35v2Tko1943F5KTcj
         dFuDFGb2A/6dtTCA6wJ3pRJWfu5Tg/7qvrhy/KzsWJ+t8d9rJYYz4rlZbdpx/09nKfLm
         EILTYWYphyeLM4L6UbUhIHiWQjIwelrjRYES7Oxus+NxrwPeoqIBLcD+D3y5xulPh+i9
         fSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361086; x=1714965886;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jzuUWu6bG8mAJ09DQsMaSkbyaQKWQKRU5BzKtgEAL9w=;
        b=KSQWCqRPspFaC0ahEk4F5BIQ5PLi/Q4cN9ECOrnUUzQB8PBEHaDB1ALQDelNwArYIk
         K5OcJb75N5ANI0cFS9nzVfNiLNMVZzJhIBajB6LbMUsgR8gOnX3NIe2+mbFZGeDaYjp0
         80+vC+HTua7ASesh+fCs9TKldrtWYGPPXKq3ZLeuj18ktMun8mi+fjcmb61M04jIh8H6
         py77L1s9y/lw5mIQIREoeD6VuvaSLDO9O14zV8cedXM6RbUUN+F5vMylE++c24c4vqcD
         mRajGXRVVOJwYf6stsXdnLswP75gbzPjtOufhB67CUKQqHclGivsS+ClJCRjP3AWjHxk
         X8cg==
X-Forwarded-Encrypted: i=1; AJvYcCXY3WorLXXtHwc7UzMSasxVi8l4/OAbdJqvr97VkiDWDLQYVHPlPwUTuJ2ciuoI1gtEOdIT3Hj7yReoObkV+3s2iP2H3eaD
X-Gm-Message-State: AOJu0Yxjir4mEAHgCNt4s9x5akPECgPKIMNatBQdyBvDoM+GsYcxtt73
	XnvWoC67BGg8lCkouY8rCrhWf1EWM1Na5uWQfu1sDtjN/VNjQ5NIxfcNPFWCkQ0QdjzcvOZRqYX
	piLWw4wgaUg==
X-Google-Smtp-Source: AGHT+IHJ19W+FMAKMMdJREfN54SoZxHnKc1lgTqptp/y4HLWsEeiuyaMZkuXSYa5Z826UhbvRTmpPQV3h17i4g==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:adf:f7d2:0:b0:34c:65a6:14c8 with SMTP id
 a18-20020adff7d2000000b0034c65a614c8mr16143wrq.4.1714361086443; Sun, 28 Apr
 2024 20:24:46 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:50 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-7-smostafa@google.com>
Subject: [RFC PATCH v3 06/18] hw/arm/smmu: Consolidate ASID and VMID types
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: I/c2G5ke5fow

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
 hw/arm/trace-events          | 18 +++++++++---------
 include/hw/arm/smmu-common.h | 14 +++++++-------
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index d94db6b34f..21982621c0 100644
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
-void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
 {
     trace_smmu_iotlb_inv_vmid(vmid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid)=
;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f98c157221..cc61708160 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1243,7 +1243,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_TLBI_NH_ASID:
         {
-            uint16_t asid =3D CMD_ASID(&cmd);
+            int asid =3D CMD_ASID(&cmd);
=20
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
@@ -1276,7 +1276,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
-            uint16_t vmid =3D CMD_VMID(&cmd);
+            int vmid =3D CMD_VMID(&cmd);
=20
             if (!STAGE2_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index cc12924a84..09ccd39548 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -11,13 +11,13 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova,=
 uint64_t baseaddr, uint6
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t ptead=
dr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=3D%d le=
vel=3D%d base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" iova=3D0x=
%"PRIx64" block address =3D 0x%"PRIx64" block size =3D %d MiB"
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte)=
 "baseaddr=3D0x%"PRIx64" index=3D0x%x, pteaddr=3D0x%"PRIx64", pte=3D0x%"PRI=
x64
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
-smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=3D%d"
-smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=3D%d"
-smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=
=3D%d addr=3D0x%"PRIx64
+smmu_iotlb_inv_asid(int asid) "IOTLB invalidate asid=3D%d"
+smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=3D%d"
+smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=3D%d a=
ddr=3D0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=3D%s"
-smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_=
t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=3D%d vmid=3D%d addr=
=3D0x%"PRIx64" hit=3D%d miss=3D%d hit rate=3D%d"
-smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32=
_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=3D%d vmid=3D%d ad=
dr=3D0x%"PRIx64" hit=3D%d miss=3D%d hit rate=3D%d"
-smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg,=
 uint8_t level) "IOTLB ++ asid=3D%d vmid=3D%d addr=3D0x%"PRIx64" tg=3D%d le=
vel=3D%d"
+smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uin=
t32_t miss, uint32_t p) "IOTLB cache HIT asid=3D%d vmid=3D%d addr=3D0x%"PRI=
x64" hit=3D%d miss=3D%d hit rate=3D%d"
+smmu_iotlb_lookup_miss(int asid, int vmid, uint64_t addr, uint32_t hit, ui=
nt32_t miss, uint32_t p) "IOTLB cache MISS asid=3D%d vmid=3D%d addr=3D0x%"P=
RIx64" hit=3D%d miss=3D%d hit rate=3D%d"
+smmu_iotlb_insert(int asid, int vmid, uint64_t addr, uint8_t tg, uint8_t l=
evel) "IOTLB ++ asid=3D%d vmid=3D%d addr=3D0x%"PRIx64" tg=3D%d level=3D%d"
=20
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "=
addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
@@ -48,12 +48,12 @@ smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, ui=
nt32_t misses, uint32_t p
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uin=
t32_t perc) "Config cache MISS for sid=3D0x%x (hits=3D%d, misses=3D%d, hit =
rate=3D%d)"
 smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t=
 num_pages, uint8_t ttl, bool leaf) "vmid=3D%d asid=3D%d addr=3D0x%"PRIx64"=
 tg=3D%d num_pages=3D0x%"PRIx64" ttl=3D%d leaf=3D%d"
 smmuv3_cmdq_tlbi_nh(void) ""
-smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=3D%d"
-smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=3D%d"
+smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=3D%d"
+smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=3D%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=3D0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu=
 mr=3D%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu=
 mr=3D%s"
-smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, =
uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=3D%s asid=3D%d vmi=
d=3D%d iova=3D0x%"PRIx64" tg=3D%d num_pages=3D0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t i=
ova, uint8_t tg, uint64_t num_pages) "iommu mr=3D%s asid=3D%d vmid=3D%d iov=
a=3D0x%"PRIx64" tg=3D%d num_pages=3D0x%"PRIx64
=20
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity=
, int data_bits, int stop_bits) "%s speed=3D%d parity=3D%c data=3D%d stop=
=3D%d"
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
2.44.0.769.g3c40516874-goog
