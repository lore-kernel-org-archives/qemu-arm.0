Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118054nji;
        Mon, 15 Jul 2024 01:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXW3IQOEU0VlYY3fOtCt/95GR02QSuf1eBgBGdQoVfWDGEAnUCn+R5I5s1tVk+71HPnU/2VPEsWsXCnWZHrn3LmgTSAN+4v
X-Received: by 2002:a05:690c:64c4:b0:64a:e220:bfb7 with SMTP id 00721157ae682-65c3c64c56amr178721017b3.30.1721033142381;
        Mon, 15 Jul 2024 01:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033142; cv=none;
        d=google.com; s=arc-20160816;
        b=KYVSM/G9KObvYBLGxlb/vbUySvc3WT8WLdGycc7qBjqP/dXbvcXMdTebNzsD6VUdTX
         pSBhES4Me6Ahvoknu8jOLeL/KwUAsv3Ynhw/OlNu1PTqfTl82GXSRTVMHsWzuj5xHvcv
         +YpHe8SjtEDnuz3GLD0bvlaCkUJHpD/kHIqUzql93Fy/SthJYly3cH5CGs2L1yqrLJB3
         Kf6+zz/vKKq26SYTHF+lScP3tb7G0HUwd3aVGa1M9SVVqskB33OgdGdrAb8urzzAg9Jw
         eJpXopabKneta21x9K4vx6qMv0Xcp1c6hIVrrkMZdQrZoTbOOy195eIjgCbRDOAq8IVG
         DmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=y7tdTKfSrFqrRuPUlDKh6OUg0xpA960AZ9D8G8EoFbM=;
        fh=fJ25Ce8ZBWk28v5EqAIHiiBK/tsoTCbKpEG9JuUNeqQ=;
        b=hlvYQCwRdHJ+sZw3EUZMI5PgbzA6jqQlrTzRihrNfJ3/xhWzoUeNBgVnsWzE5in3xn
         AAm/BqQ6ChFEQwutw4oRHosjUKPs1bxe4qg7q4Lnr1DSZZDbUIbZMGiqNIOx5BrTdGtB
         t1GsUvAvIW5Ot6caAfkSvs85dOH1fB8dc303x4Z+drcTw46Pz/FYk71G4NJ6zrnV0J2o
         PKdHrA0cn8evh9XwU60FruERwOl+CECar0CXcE3O+6cFvj5CgMrkcHbnOD0CzeoQN/aQ
         m5VDpslbnf6bElj6VpggEcY1vNBdVNNQgcad333Sb5jvc6bHytCj9hKlRQMh20DmCE03
         5/bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ql5KNGow;
       spf=pass (google.com: domain of 3teguzggkcwg0uw01iniowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3teGUZggKCwg0uw01iniowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3teGUZggKCwg0uw01iniowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-65fc4f0ad6bsor21905347b3.16.2024.07.15.01.45.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3teguzggkcwg0uw01iniowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ql5KNGow;
       spf=pass (google.com: domain of 3teguzggkcwg0uw01iniowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3teGUZggKCwg0uw01iniowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033142; x=1721637942; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7tdTKfSrFqrRuPUlDKh6OUg0xpA960AZ9D8G8EoFbM=;
        b=Ql5KNGowY20GMW3Qsf0+6pWPwrIFdvkEsb9HpLCQZODGfthOLWMup6liVoAmevbKf8
         OKMLFrO9hdJrWPFoDOaNPlVKKDGz3sn1CmfzBQYp7ADGvOwnyxYDH4e5cWiMwG8elwvL
         SgvNl6D49chvUyC75xWhxiMXaln1RhqrynyZwKvSzeipEELyUrj1XqMyTkwqB/chUdAU
         wTx+5m90cXqR5mQ8XJD02k114sdXz6BJdLV+2hlwPn/JVSKaOJJgQ7RHBkGTKbNviw1N
         VLpaTJzahVbsHl03tyziO3Al9hju6HyamaazBT7Q9SIOHdxD8f/kHyR87uNvNSBegACx
         WL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033142; x=1721637942;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y7tdTKfSrFqrRuPUlDKh6OUg0xpA960AZ9D8G8EoFbM=;
        b=MpOwN/yQw9vba872m2APcUBcJPWMIGHLZcrtg2j/pkm9tjyIbktaxxDD3ltt89Xgsb
         WEdPQxKX71iOa6jjpe54vVb9Yjq7/7kZoQh7XPGarW6Bpg8V7VrTOBCGz9IE2aB/YOfg
         ZLWeO1Q5SnKOHSei1fsWnZGhtJQt5uw5NhlcjgXTZl4DftgERIxiqgFC1ivIdpc2vXm6
         pSECxYo4XypHfzC3vR6n0hwLQRxyPZe3SrbGSQVZxRvIc3TS7UwcORcsuMUyL5kOiNR2
         b4F++5+mrjzbdrTsRcl6ifQWW/aMtXI33cCtAuVCaeqq4L5eHrU8vKQ9xqbIzPzRwhuz
         itEg==
X-Forwarded-Encrypted: i=1; AJvYcCU78OTZUEqO7MzmFSAw00GGeemh/h3CR7yUWE5Q2OMez/m9Q6BLHAVTqMRxFHrSR7IYB6hnQ+2mpztBAr4dcD3VYd+1yojp
X-Gm-Message-State: AOJu0YwH42AsG8pn625KC1DWVxJejR6UF4+SAxZ55V3LAy3Ea7HrYv1q
	qbkO5oh14Hra8Bgb2Ri/AkvUiYvnTT5meoYCS2YxiRUnPjGN4PtCe5Lt15nLdQSKn56H7LO4KTD
	tEjWlJda3cw==
X-Google-Smtp-Source: AGHT+IE5lY6gYdjToJVKlQFVXTytB0miyKjmYvJsCwPE4hSSn0UFSgK0KLnCqb20OH1DEs++58+EvQPtGBQOjg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:648a:b0:62d:fbf:920a with SMTP
 id 00721157ae682-658f0bc61efmr1104887b3.10.1721033141934; Mon, 15 Jul 2024
 01:45:41 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:06 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-7-smostafa@google.com>
Subject: [PATCH v5 06/18] hw/arm/smmu: Consolidate ASID and VMID types
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zNIpNU/TItsm

ASID and VMID used to be uint16_t in the translation config, however,
in other contexts they can be int as -1 in case of TLB invalidation,
to represent all (don=E2=80=99t care).
When stage-2 was added asid was set to -1 in stage-2 and vmid to -1
in stage-1 configs. However, that meant they were set as (65536),
this was not an issue as nesting was not supported and no
commands/lookup uses both.

With nesting, it=E2=80=99s critical to get this right as translation must b=
e
tagged correctly with ASID/VMID, and with ASID=3D-1 meaning stage-2.
Represent ASID/VMID everywhere as int.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
index 85a3efd357..11cd12e32f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1244,7 +1244,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_TLBI_NH_ASID:
         {
-            uint16_t asid =3D CMD_ASID(&cmd);
+            int asid =3D CMD_ASID(&cmd);
=20
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
@@ -1277,7 +1277,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
2.45.2.993.g49e7a77208-goog
