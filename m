Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931821ejb;
        Sun, 28 Apr 2024 20:25:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZdG60TBxBjlM7XuzTUSVReoBN8Tz2lhqm5PDqY5pUMNQiwqbPXrHMntRSEd30NcEhrzsCabPJLqRUe47wuMQdA4nXWvI7
X-Received: by 2002:a05:6902:1351:b0:dd0:bb34:1e77 with SMTP id g17-20020a056902135100b00dd0bb341e77mr9291129ybu.53.1714361100611;
        Sun, 28 Apr 2024 20:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361100; cv=none;
        d=google.com; s=arc-20160816;
        b=XZKCvsgXUUqk5Z0fjE4iSxb99tKMseAyIpb+ja8hBRQZr4/YBxPE70hyRIgWDPmBe2
         +T2ybgEQ2R4HycZ+J44gNT80cY+36JCdRH3xbCE/gDiI2AkzAaT6zhKj2PeCbmi4enhw
         Zs7xrRRWVUGMQ+E+U36gb0jdk9w5/BW4ZdEv+cQ0fwbD8YyoQ2RLQRUbDmXuJqCa9+Z5
         AC6/92EEX6ORcx+JUkyRz3VlkRviDPCOkIJd6ed1tO2r7F9fKV/NhorhtncmAWnKUPeM
         kpNCO8+WJuC6heMAQdKqjDvvqd7gBITz+uiqwV1y0fCNCkO3K27+zsWuDykO9Snu/ZgN
         QSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=oW2D69loP/x98JCkLEbfxO2gw4J5/AFJUayqA/n1rU8=;
        fh=+BOrxwH8vbtKwMwEHv7Fji0r56FbLM6s/8ICC7EjkfU=;
        b=OOj+ctTdfwC5mXgTEeEI7PstTWFmYHpt5bAjgtRpQpdhcWuOKu/cVub83Hf++urD4F
         6BmX83bb8WK4wwZmWLdSLsYtsymaH2HYcVm0eiHDN6B/AcuYhHE9cX/egse9RlowrLSZ
         JRJYqSJ81sA24JoC8/3K2e8Kwsj/xKUjpNf/LUSMz97i5k8NsAW+l5K3ULZRpgZbSnW/
         PMOEI8TPByM9RXE8LrI0UULLEuTqxQVAvFIoe/dFx5j+bJ0/VvXtZoBCi4qyEgHVFUrB
         UijsoBq3igC3qAyHIg1dER2K+BNz6njiE7sAaSTxAxi8pMn+QqEYbUwH4GbKADjO0Hui
         K6Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YrVtrANP;
       spf=pass (google.com: domain of 3dbmvzggkcycvprvwdidjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3DBMvZggKCycVPRVWDIDJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3DBMvZggKCycVPRVWDIDJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id e189-20020a251ec6000000b00dcff855e95dsor17089025ybe.3.2024.04.28.20.25.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3dbmvzggkcycvprvwdidjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YrVtrANP;
       spf=pass (google.com: domain of 3dbmvzggkcycvprvwdidjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3DBMvZggKCycVPRVWDIDJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361100; x=1714965900; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oW2D69loP/x98JCkLEbfxO2gw4J5/AFJUayqA/n1rU8=;
        b=YrVtrANPOflI7cf9KaEEbJp2pyRq/npd3JlhDQsG7owxtJpMdBgs8yKGxbD3PX33xc
         BEXmYOWcxkn5WxTB51/Q21z7NC/3q4KY0sfD9RW0N05VsV9byyuHCmD8h5xW/nloWrqk
         wbUoaWjg2wePqlUe3KT+yz9UDfI4JS//ngW6Y4fxECGqLBRk5PrxWOQoCCG0NiJzWzHW
         t8X7gaX3H2sFJtFt8BvSOGakI5PtoKz3bc67RwgMoh/JySXryi9fPcm1JVeYB3i3L8d5
         +eDHI+XanxCbJSD5cinXpOrdSDSod9CgA5QX1ZDTA9Q7NJ1soZlJyIPhai5PKsi1jwtr
         FBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361100; x=1714965900;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oW2D69loP/x98JCkLEbfxO2gw4J5/AFJUayqA/n1rU8=;
        b=KqnmhsWx371D43MHspx4YkByygu1YIxAnPitTcKePJgXH7Ozp10FErpNGWuLQvVMSt
         K+nTuZpQcY8RJezFm4X3vcfi1bSPdx3u3nKMqQf9kerN27incq1tNXQ3C7hyCgqoWW5t
         R30nwVU48NrKpTAZuXM8dOFLC3QUnjD2JJR3Ye36gaB1JXKzqT/DVIklDzo2uGz/5N4v
         PFLGoRl7dB3oXF5MvxPVwDCOLjZK6MZhW3/N3NB+ryl50UhymMwDPEhcTVuywsDVc1KY
         CT1Tiu6CJN3aTBTIHxOhNVrrd5vZ7bCnidLKMxDsy+yhb01g9csVZX2bsU8TrHXbf474
         j8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW5zATPN1Fsy6DoqW9mfQzcsA4e/gyymN8HfMNJ7m0hNnHggi/c53Sgu1POFKZhkoyLgvq9ofmYUASmOUfpyv7Dz37py+BB
X-Gm-Message-State: AOJu0Yw+WUvxQM0KzEHttG3qFHGKl1PDuG0uFfjHReEj90fRir7onnvF
	HvUP2DRieuej1oO934MpBK+aVRPYFtIYLKKsSav6j8ge9+135R8yn50Gg5eoqfAKSGG9vZtjV2j
	WMwJEToQMEA==
X-Google-Smtp-Source: AGHT+IFr2eXpjPPCfdsJ2BE21RpPzH2hLgspKqU74n+07aHXcmmqZyx1+cPGbsJvdg8T+rM7KLUKix+CFsMPCQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1002:b0:dd9:1db5:8348 with SMTP
 id w2-20020a056902100200b00dd91db58348mr3290722ybt.8.1714361100182; Sun, 28
 Apr 2024 20:25:00 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:56 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-13-smostafa@google.com>
Subject: [RFC PATCH v3 12/18] hw/arm/smmu: Support nesting in the rest of commands
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZpcWPPAqhE2E

Some commands need rework for nesting, as they used to assume S1
and S2 are mutually exclusive:

- CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
- CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
  invalidate everything, this required a new vmid invalidation
  function for stage-1 only (ASID >=3D 0)

Also, rework trace events to reflect the new implementation.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 36 +++++++++++++++++++++++++++++-------
 hw/arm/smmuv3.c              | 31 +++++++++++++++++++++++++++++--
 hw/arm/trace-events          |  6 ++++--
 include/hw/arm/smmu-common.h |  3 ++-
 4 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index fa2460cf64..3ed0be05ef 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -147,13 +147,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
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
@@ -165,6 +166,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key,=
 gpointer value,
     return SMMU_IOTLB_VMID(*iotlb_key) =3D=3D vmid;
 }
=20
+static gboolean smmu_hash_remove_by_vmid_s1(gpointer key, gpointer value,
+                                            gpointer user_data)
+{
+    int vmid =3D *(int *)user_data;
+    SMMUIOTLBKey *iotlb_key =3D (SMMUIOTLBKey *)key;
+
+    return (SMMU_IOTLB_VMID(*iotlb_key) =3D=3D vmid) &&
+           (SMMU_IOTLB_ASID(*iotlb_key) >=3D 0);
+}
+
 static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer =
value,
                                               gpointer user_data)
 {
@@ -258,10 +269,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_a=
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
@@ -270,6 +286,12 @@ void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid)=
;
 }
=20
+inline void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
+{
+    trace_smmu_iotlb_inv_vmid_s1(vmid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid_s1, &vm=
id);
+}
+
 /* VMSAv8-64 Translation */
=20
 /**
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 82d918d9b5..e0fd494646 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1303,25 +1303,52 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_NH_ASID:
         {
             int asid =3D CMD_ASID(&cmd);
+            int vmid =3D -1;
=20
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
+            /*
+             * VMID is only matched when stage 2 is supported for the Secu=
rity
+             * state corresponding to the command queue that the command w=
as
+             * issued in.
+             * QEMU ignores the field by setting to -1, similarly to what =
STE
+             * decoding does. And invalidation commands ignore VMID < 0.
+             */
+            if (STAGE2_SUPPORTED(s)) {
+                vmid =3D CMD_VMID(&cmd);
+            }
+
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
+        {
+            int vmid =3D -1;
+
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
+
+            /*
+             * If stage-2 is supported, invalidate for this VMID only, oth=
erwise
+             * invalidate the whole thing, see SMMU_CMD_TLBI_NH_ASID()
+             */
+            if (STAGE2_SUPPORTED(s)) {
+                vmid =3D CMD_VMID(&cmd);
+                trace_smmuv3_cmdq_tlbi_nh(vmid);
+                smmu_iotlb_inv_vmid_s1(bs, vmid);
+                break;
+            }
             QEMU_FALLTHROUGH;
+        }
         case SMMU_CMD_TLBI_NSNH_ALL:
-            trace_smmuv3_cmdq_tlbi_nh();
+            trace_smmuv3_cmdq_tlbi_nsnh();
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_all(bs);
             break;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 7d9c1703da..593cc571da 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -11,8 +11,9 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, u=
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
+smmu_iotlb_inv_vmid_s1(int vmid) "IOTLB invalidate vmid=3D%d"
 smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=3D%d a=
ddr=3D0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=3D%s"
 smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uin=
t32_t miss, uint32_t p) "IOTLB cache HIT asid=3D%d vmid=3D%d addr=3D0x%"PRI=
x64" hit=3D%d miss=3D%d hit rate=3D%d"
@@ -47,7 +48,8 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=3D0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint=
32_t perc) "Config cache HIT for sid=3D0x%x (hits=3D%d, misses=3D%d, hit ra=
te=3D%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uin=
t32_t perc) "Config cache MISS for sid=3D0x%x (hits=3D%d, misses=3D%d, hit =
rate=3D%d)"
 smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t=
 num_pages, uint8_t ttl, bool leaf, int stage) "vmid=3D%d asid=3D%d addr=3D=
0x%"PRIx64" tg=3D%d num_pages=3D0x%"PRIx64" ttl=3D%d leaf=3D%d stage=3D%d"
-smmuv3_cmdq_tlbi_nh(void) ""
+smmuv3_cmdq_tlbi_nh(int vmid) "vmid=3D%d"
+smmuv3_cmdq_tlbi_nsnh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=3D%d"
 smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=3D%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=3D0x%x"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index de032fdfd1..361e639630 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -212,8 +212,9 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg=
, SMMUTLBEntry *entry);
 SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
-void smmu_iotlb_inv_asid(SMMUState *s, int asid);
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
+void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova=
,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg=
,
--=20
2.44.0.769.g3c40516874-goog
