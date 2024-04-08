Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293773ejh;
        Mon, 8 Apr 2024 07:09:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW882tEDBGVCgBKNmk2xKgLYC9UiLrnXYntudmAr37ZzqusY6sSq4pokj6QBryVnBpCfamLhX8XOCf2YKA44op1CM+a2htL
X-Received: by 2002:a0d:c803:0:b0:615:7f89:591e with SMTP id k3-20020a0dc803000000b006157f89591emr6772661ywd.37.1712585357039;
        Mon, 08 Apr 2024 07:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585357; cv=none;
        d=google.com; s=arc-20160816;
        b=MSAA7Z2v5v7GO4aQXL0A04Ua4KURewE1S4rKIt4+CJy7poK+AIF7dNQ8Ilw8TjZNKA
         uFhjDlcDgrzfoOBtJclFhwF7wRjYb4cALEEm1HjFrrq3y2vArrSyiqYxtdLMTxPi1RbL
         YGtZ1B+Ta77BE+Mdc9mjwARumQNIrFWPFyLyk0n78uIpGPSfnWiE0FOgFeeDuJQEfcPa
         H/kyd8PJtVX9x+Algl+Qa3imduPVXwt4YuEJRVcMlAzKCAKRx1+wmYUef1LFdKZvWZy/
         Fo5a10VS28xEqXYvO9yxcFCzWf6WrQCkke2ZdAZZ1iMsPF64SeTgwc9VmJM5vh9yrC/O
         ZXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=Xk+qSFCz47aClMf3taMYzTP5iIVIqYBAuzPN7ynPM4g=;
        fh=Ox7ZgLhb4PWylSTcab7rWQpK4Emwnvh6bnGn7yUnqSo=;
        b=ZfD5Kct4lIS7a69xNMTmxfxWA7sHTCJQIxqSEHyHUY/byd0rf4pP3FJnVA3O1P8o2V
         HpKKk6rYj/yKg8ljMvPRhRAZjAHajHZHGzAoij2BjD1T3rSkTfB0pheCaDoJzZ035Nl+
         1VWKDSrCqKNDTrBJSMjIO/QwYL6P2hl1J+KLxvS/WxbWq2kE7LWPV6rE1qYqH8c14HtD
         3RD1/a1YeW+kpHshpHpe5zNqdJ7ro6izqYrY6pCtkd9kHcCwyfVDxRFNPFueyGyBpAxo
         MqtuAT6SOJgfI+hznoQ9w8ND1cFpoHeiPcDj0kde6n+v3hJ8iVh2HJo/WlWXNXcShnEa
         khTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Dh8arIz+;
       spf=pass (google.com: domain of 3jpotzggkcwk1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3jPoTZggKCwk1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3jPoTZggKCwk1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id t8-20020a0dea08000000b00617ca0c66b8sor3756411ywe.1.2024.04.08.07.09.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3jpotzggkcwk1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Dh8arIz+;
       spf=pass (google.com: domain of 3jpotzggkcwk1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3jPoTZggKCwk1vx12jojpxxpun.lxvjun6.knwwnnurwj0x.x0p@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585356; x=1713190156; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk+qSFCz47aClMf3taMYzTP5iIVIqYBAuzPN7ynPM4g=;
        b=Dh8arIz+oelTjgFM9NK72/bcbwZbd/DR4bfS0Y3Iq4pihdhTRfPUeGsD9axu6TJn8o
         3YTjslZyRqlbpa70SveSIKswc/vsqmxutx1hf5TfQCHSedcZ6LqbCloYzBPjNqzDDkOs
         sYZNmJjHcnuse07cVtckOsRUl+VvW8Lyt1kka+UQsJokcFIXocVgm5BL0EkiDpegKKwU
         Bcff19FapzrfGDwjV6hL5SzgxiyeibhuSIVw9ZLDmnFFg73A2FsFd/egfGy3NmQ2bI+5
         PZ6iDDcSNMJaNeXBMctQ+StbmYIn6JtRG1kWiJSUF34I4508LTMZrzkcQ51l2WM0ZtVl
         zglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585356; x=1713190156;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xk+qSFCz47aClMf3taMYzTP5iIVIqYBAuzPN7ynPM4g=;
        b=tKB2Fbmo5wphBU3u/GTwnvFm9wCUlxRarDNSf+cLDQ6XhRbKa3IIZQqbfUnR3lv8D0
         4FXestJYCIUWUcPk2fX5J6JXaXzEhN6Fdl4dAa9OJbyWXNMEFDnf8ZeAjn5yjIkxk7qI
         n8XBZxgEr/rwkScK2OKUTvkVRZPXvOBzy7H2I7xYnMKk0qrmywSL0IlZeOTD/qnqJzTF
         E9UN3rHGttKYquxLkhgBeLeIMNZ2lHHhAEeP6Zvt2V1yoYdUOXzrTfYeOsnlZek4im+A
         pOG48U1FEmqUukCSW3NHVYkOb6Z1w32EFm1BlG2nv08jzAFNq1diEHuKEr4YH7XAUPEk
         0q9A==
X-Forwarded-Encrypted: i=1; AJvYcCVzrLhrGLNc7JqwKqFEUSzMqs1PYDWVztruKQuYj6T1LtkZeC6mY9yzgtpeYsjfvIgzG0vOz0saKvTQH0T0UwXhG2Fd3jtz
X-Gm-Message-State: AOJu0Yw4D6PaayoI0ivq2vsysktGqOyhZLXSKqENUueRJw6yynlT5rAk
	27B/XV9lu0QbZKI6q8aa7+BdNQjkFW1fmPUjptuRaBDQD56zrTfaSbIVif983itm+7qL8emcAnW
	QKluee0SIsA==
X-Google-Smtp-Source: AGHT+IFgs/376+JhEmHL6mcyoYevX26rq5sUKMzXeA5BtSuWdSMq4mTVB+0Ay68vxPn1y3yrCcvR95XhqTimtw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:db43:0:b0:615:3262:ffa0 with SMTP id
 d64-20020a0ddb43000000b006153262ffa0mr2506568ywe.9.1712585356625; Mon, 08 Apr
 2024 07:09:16 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:12 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-8-smostafa@google.com>
Subject: [RFC PATCH v2 07/13] hw/arm/smmu: Support nesting in the rest of commands
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zhu2Bd4yI2DR

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
index 8b9e59b24b..b1cf1303c6 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -148,13 +148,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
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
@@ -166,6 +167,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key,=
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
@@ -259,10 +270,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_a=
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
 inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
@@ -271,6 +287,12 @@ inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid=
)
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
index 17bbd43c13..ece647b8bf 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1280,25 +1280,52 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
index f5c361d96e..2556f4721a 100644
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
-smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=3D%d"
+smmu_iotlb_inv_asid_vmid(int asid, uint16_t vmid) "IOTLB invalidate asid=
=3D%d vmid=3D%d"
 smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=3D%d"
+smmu_iotlb_inv_vmid_s1(uint16_t vmid) "IOTLB invalidate vmid=3D%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=
=3D%d addr=3D0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=3D%s"
 smmu_iotlb_lookup_hit(int asid, uint16_t vmid, uint64_t addr, uint64_t mas=
k, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=3D%d vmid=
=3D%d addr=3D0x%"PRIx64" mask=3D0x%"PRIx64" hit=3D%d miss=3D%d hit rate=3D%=
d"
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
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=3D%d"
 smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=3D%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=3D0x%x"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index df166d8477..67db30e85b 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -226,8 +226,9 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg=
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
2.44.0.478.gd926399ef9-goog
