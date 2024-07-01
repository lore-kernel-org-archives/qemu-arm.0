Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286539njm;
        Mon, 1 Jul 2024 04:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTXxmHgga2iZOwEOLammbILQvHfhpI/nJVgo3okSRbkwcau7Nt4FlTmkoEqR02iuNR7m+TYpmSt0w+9ghOaKY50LnkqZFX
X-Received: by 2002:a25:c591:0:b0:e03:229d:69e5 with SMTP id 3f1490d57ef6-e036eb336a5mr5135281276.17.1719831820209;
        Mon, 01 Jul 2024 04:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831820; cv=none;
        d=google.com; s=arc-20160816;
        b=YVwqdZ2ujCRva1O7BhGjpeAEWcoCi7QP5pr8M12POBEKWv7b2HUazws3pNFWm627fY
         SHDdHBjVPRnbd4SGm6ScTFkxmqMfgb104KAl7Qpdf9fLGrR4Df3IgFDT7L0bYuhop2TS
         ImCvkHxVUNjUokhBiEvzS8aevDnjB/qiv26QiD3HP8czoK8Dgm5sf/C2NgBwEk9IFQ7b
         zIxPv6Debkgcsna/4Gckk7AToRQzgHS1UXPBbd6Q3VZN7zVuMWgxr0rV1/C9tKCwcPca
         FBQqEChDhshN91rQRVW2DTEXrUo3b0msaGBjh9hYazY1isntC9XOK5xWcmLOGjSiNdPc
         58HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=4Wsn10Q6EcfYP0+RS/ssBzezQ7yjVM+COl7mrZq27cw=;
        fh=2xA7KpuwWXQc/GW8vwa6FWFAn+SV6L9o80IE3SO8e+s=;
        b=nVXuxawwzkLflXziuvCIS1Q+070o4o45WAKRQOkgkptmyKowN7yBv3JkIfNDxUlRJN
         smemetkvJqzUjysorLV4MO4/fc8N9U5Mpbroh02sI+QjNJcotSQa3YZ37CPmWK7/stVz
         yNe+eacZb9A5wuwVhN0kGe7Uvr90vKE8zUM1wOif43vuMvJt7J+jD98oF7CsieHlC7c9
         VF4am62xSMRbkNkx2TW1mX7nZydTb8L+tDp4MQR2xWtx8ZdLmWTG4Tj4Nt32ZtD+Pyc2
         JbLyrHw0npaaZyizqMT+KCY+XqnsfQGPXqgRo+XylSPkW/Ip9n8sm80t0Zv1i1XRE+7q
         4Geg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="V/ERPDEG";
       spf=pass (google.com: domain of 3c42czggkc2oauwabiniowwotm.kwuitmf.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3C42CZggKC2oaUWabINIOWWOTM.KWUITMf.JMVVMMTQVIZW.WZO@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3C42CZggKC2oaUWabINIOWWOTM.KWUITMf.JMVVMMTQVIZW.WZO@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0354073388sor3713048276.15.2024.07.01.04.03.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3c42czggkc2oauwabiniowwotm.kwuitmf.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="V/ERPDEG";
       spf=pass (google.com: domain of 3c42czggkc2oauwabiniowwotm.kwuitmf.jmvvmmtqvizw.wzo@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3C42CZggKC2oaUWabINIOWWOTM.KWUITMf.JMVVMMTQVIZW.WZO@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831820; x=1720436620; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Wsn10Q6EcfYP0+RS/ssBzezQ7yjVM+COl7mrZq27cw=;
        b=V/ERPDEGRLp0r7lJP/ZiAa0VXc02B4/2sTwaBoagrrjw0DpRqhm6tVjQWEmRn7QP/N
         QC/d4ScuTya5rWEjYD4giFb0AavMFL/OGsmonGRRovoQcyBfUCmLy3KQfmkY223HCc54
         ZR66PG/YnGgUzlVv1oLglPMfKAoOmAgmUqb1riTmx68rBLywn23SQfkGxRddPXvjnDNA
         eQF6p6XspInSPyBlwQUIXt9U1ajLZzcUuh73ESMRgvh7KlwS7T+1FBfWPX4tGbU7Lcs0
         jSbLIyZFKxfkjJTCbf2RI0PCwcQWUMy60sfQtO7QPTLc1nGGYEgLgk0XLPZ9yxn+OOfe
         rRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831820; x=1720436620;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Wsn10Q6EcfYP0+RS/ssBzezQ7yjVM+COl7mrZq27cw=;
        b=IyQBi3jr1Kgx2wY5BcsnAaQESR/Vdi0I6XjKiY3/eNUu0PUjIdBRbdRyDckLxLuz4H
         H7wUNjMt9+iQHNkpAnBtr+N+1HlY0sRM7t7Hx0fsuHd44LRh2Ul1RDVeH8WH2Ofn6lGe
         OOmg9YK/Lqq3Vt2Tc4oQIm8I/shhWT76FY1XJehD0f3YT4iYe6P1y5sKTVSCBfo0mLOu
         DQahYq2sh28TE0PMW7TXW/9CAW8PAHm2r6fJEzEvMlmHR87uVSU1/X4q+ovoS7CFNAqA
         DVsepehIAAmyOFxKWBS6BTu+kvRYb9MkIcuyevPVvbJO0wvORn+pT3AHL4muDJ+hUbU1
         D5RA==
X-Forwarded-Encrypted: i=1; AJvYcCVoFehCmFiTPvTtGZSok1xknlC6RZIivOkDLXuqtBDTmWCKNIRlBrUzpR+Oz7D81eXMP9Lt+Cg2ndsdg/4Sek/lOCMPiLrN
X-Gm-Message-State: AOJu0YyGmYxbFG30Fvmo+gcBFeuDYU5Xd9+kjuNDNXkpI0c36wcl9U22
	nMIDOYBRBvFfE5yqoel9MhLRVliy1cyMzWqqDJnvXsRDdOqoEQvH2/Gh5VHgaGBcmR5wHqkxkot
	7QyLFcUl8IQ==
X-Google-Smtp-Source: AGHT+IEYjf+9fn+Q4Y5oniRwCoBNICkeU9ZQcpyTmJESFf5hSnorHgzAIbuFpsrAwqgsKMoffc6z9JuBqJw4ig==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:dbd3:0:b0:e03:60b4:b7a with SMTP id
 3f1490d57ef6-e036eb22e40mr249364276.6.1719831819774; Mon, 01 Jul 2024
 04:03:39 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:36 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-15-smostafa@google.com>
Subject: [PATCH v4 14/19] hw/arm/smmu: Support nesting in the rest of commands
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: A+KZt9srwtb8

Some commands need rework for nesting, as they used to assume S1
and S2 are mutually exclusive:

- CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
- CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
  invalidate everything, this required a new vmid invalidation
  function for stage-1 only (ASID >=3D 0)

Also, rework trace events to reflect the new implementation.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 16 ++++++++++++++++
 hw/arm/smmuv3.c              | 28 ++++++++++++++++++++++++++--
 hw/arm/trace-events          |  6 ++++--
 include/hw/arm/smmu-common.h |  1 +
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index d0309a95b2..faba4adc49 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -178,6 +178,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key,=
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
@@ -288,6 +298,12 @@ void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
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
index 928f125523..e9007af3cd 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1321,25 +1321,49 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
+             * VMID is only matched when stage 2 is supported, otherwise s=
et it
+             * to -1 as the value used for stage-1 only VMIDs.
+             */
+            if (STAGE2_SUPPORTED(s)) {
+                vmid =3D CMD_VMID(&cmd);
+            }
+
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
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
+             * invalidate the whole thing.
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
index 2bc9a03d47..361e639630 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -214,6 +214,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uin=
t64_t iova,
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
+void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova=
,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg=
,
--=20
2.45.2.803.g4e1b14247a-goog
