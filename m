Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286336njm;
        Mon, 1 Jul 2024 04:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+8GlQb5YD8wzoz0dXkwxB7XgMLyzjGgnzGep3AJUwiMr81XsaY2KLq+XzzYILVXbVoCy7PfYFzFUzvt3LG1Zcn1cMh8kx
X-Received: by 2002:adf:ec8d:0:b0:367:47e6:c7ce with SMTP id ffacd0b85a97d-367756a357amr2805269f8f.6.1719831801452;
        Mon, 01 Jul 2024 04:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831801; cv=none;
        d=google.com; s=arc-20160816;
        b=QpLGVFgOH3OuazXAoIIhlGB3O8P3a0sOr0Xoe4N46c1LCHiZGoZ3Q1C81vtPw0JGc0
         q+Np0uXngbECOyefIt1AY7Y9A0WJzcAN/uOzDK9uqbcAUAU2JuYFipX8tYdEgmXdZis3
         kJ7UgEPxw/RkI3UBuBYi7SOzS5pUWDsDi0dKZTzJVMx9/D5y6dECY467bC7l8oKZT9k9
         mkpW78dcKQe+o4xZEIv5ogkcc33aX+O5JKOdadotNPjY57QGnnkAPW4YUQaPXwLkc0EZ
         bZEtYTbPTCWzTUIag4WLEFg6kWHLwDEXP0UTJebalaNhyS+VYywnpeXSBK2YI77THGuU
         mpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=GBUYlPOHi/mEEsubhJJdwkbh99sCSgz/LPd6wc4vUQY=;
        fh=wsGz5i3augV7+Xr/dgXE/2waxVybtjGEf4o/COWBnhE=;
        b=USoyTrjqDB1JmI5f5CX+aZTTYC3u+Yvlk/JczdAUJh7aulRe19TF9lOrFxz+4J/k0/
         M4xWG2UIk9aDT0KhKhN6FLdRl6OC7GhpxuJZ7AYYYH/Yd06mLp7JQJ4SbXdRp61WmGXY
         tm/5R0AWbRpWuruIwwh9LCOg2RVAStT4QFOpNsxmCbiSbsyoGmOdOCUx62mrLSujbD4w
         l+K3vV/7DyYxFue5dw10To1m9hr7yPcInlrS36vXIMIT13AcISR2t8t/J1JvOx82qk/9
         mI/Frb9lCEVO+6gue1fag3A2HzokhxIXVkm5zqC8s9tQZmv7dhsWsvPyu3fzn+WIQzCT
         NAHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rNRekWnN;
       spf=pass (google.com: domain of 3-iyczggkc1chbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3-IyCZggKC1cHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3-IyCZggKC1cHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id ffacd0b85a97d-3674356d526sor3154942f8f.4.2024.07.01.04.03.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3-iyczggkc1chbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rNRekWnN;
       spf=pass (google.com: domain of 3-iyczggkc1chbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3-IyCZggKC1cHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831801; x=1720436601; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBUYlPOHi/mEEsubhJJdwkbh99sCSgz/LPd6wc4vUQY=;
        b=rNRekWnNz9/GV2cyR/WRinklqsU3pLNVEMZz+PLN4T3gyfv3VUoqM/crm5C4o+U7Dx
         tPPX3iHrbY4o9ywhnuJYCgxE658RqYkROYYLC8rkW/0XV/WNp1fsS+v3VdTfDt8CRD0e
         swMT/ZtuTgKokt1gTsw3YU49ImTRyTTrGkeCzQnYvXwChoOzfngA4DRRL2wFBT0I9jlI
         /0u4AsH1sMWGSXwgKjZbIN9gLS8pkc9psTDiS/9Ung9BE6nubSNaQTsnd1VFD7IpprhT
         akvdzCBjrFEwLcGpCdWc3h5gNfQ1WqQCZDLTMp0CifWMM8l2nsv/nu/NWyGUvgUE/RrV
         fTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831801; x=1720436601;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GBUYlPOHi/mEEsubhJJdwkbh99sCSgz/LPd6wc4vUQY=;
        b=VDPrink5zLBK0zVdJRTUC/nVTQpZ1sW0HM/mnbd1aEmghV9tTdWDweGXHTjuNk1Nqs
         8P7zmfcbRCupVzoBUVyX0W12rm5EJ4cgwI363IabYlpswX10z0iZlZG1Ph7lEa5WXHQt
         6qlGmZ2q7aHvhYHloVtIRqcXDn/x+Ybl4WF25/1k6FW4bdqoEmm73TnaMHhgwMSJV2Va
         ZrMU9WrP2SDEWYgRR7x4fEmbs1cqrPppPoPHcTI9JYaNlgX3DvDGW3iuLwQV9oH/A7EY
         QvEQJgdHGyGjLasPbfjyBkzveRKB2URQ9Y3BJubi83INDc6IUBUTIgFkudiERihEtc3Z
         VTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ43anNE/OxVeOvJSUv/FBrALK5zYOLpDJspUANTv0NCnhKyNoDFtVYXVHgbMNrartne0aif623CXuLHfDlETqG7pAzDRg
X-Gm-Message-State: AOJu0YxKA7Zpk0FYwHsOdewGZmP4z9vgtq3GdNvZummwnWwz4+w7T7Hn
	5V0BcttkXqTBS/KuJZPIziykY92rGxXhbglssUre2E22ZrmbbaYiXuhtVm6jW/Srf1zZ/5siYGf
	C/lqXSERZPw==
X-Google-Smtp-Source: AGHT+IFQO4C/qpBZz962G18gMtk8X8hbV4Sp4TQt3HlGFq79UtfaJ8o4jKbYQOS/mq8bTx2sr8AazLoLMk+unQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:adf:fc4c:0:b0:366:f3b7:ec43 with SMTP id
 ffacd0b85a97d-3677572275bmr8928f8f.9.1719831800694; Mon, 01 Jul 2024 04:03:20
 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:28 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-7-smostafa@google.com>
Subject: [PATCH v4 06/19] hw/arm/smmu: Consolidate ASID and VMID types
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +PXYCM5FP3vb

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
2.45.2.803.g4e1b14247a-goog
