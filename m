Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293891ejh;
        Mon, 8 Apr 2024 07:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVqMwD6DRxdel7FWUlubgDn50WWhv/ewpVS/fTwFn25rUCYJXbGBTZ1ufy/3JjPX8ZgCOovjTF92kCNr6pfqi9sHxcDcbI
X-Received: by 2002:a05:6000:2c4:b0:345:d9ac:cd67 with SMTP id o4-20020a05600002c400b00345d9accd67mr2119547wry.23.1712585367910;
        Mon, 08 Apr 2024 07:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585367; cv=none;
        d=google.com; s=arc-20160816;
        b=OZGnx/OL1JKtIB1z/dd0fahNEFGhXly8jh6rqkkEbnkwU6/MDfShdjOYn/VE4//rGS
         SFo2nHDcGxcFdmk/oBdqEc1dmDroFuuLeW1G+haj5ZcSfthweVFYY32RTqtWv/fNe7/g
         kqDPP3ma2/Afx+3tpbwgvUqhas1DfQop71n0RkyQ2wQv9v3/pIfSj60ly4Lnm3ZUH9t9
         zX2yJMvk2KZmzqZAVAcEz0JqfcvT/OZn8asI48v/nNe10G+VwfFJEBMfVlMb9bR0l2en
         myL9VeomqOnC4Zv3IDm9F3kki5oRM7KHCbB4cqnIJ7StgKr1JCqpMezSXVR+++TpoPBb
         CD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=0HFXPBczsaFzwM3/E8nUe7UI7cqODAn7zmH22JOuPig=;
        fh=A74DFPisBN2tGJzTW25hz+VFTamneagVeAYNbzTAUr8=;
        b=yFxhyf9DAH2pc9eto7EGWbBwYomV31xxXhmVO8FSR8cNznOlXWFObLNlPnx1u4K8mD
         vSnp0S14KNpdBoUaeN5ZaWKHKypZvfDREvq+Qqhy0Duwma6ntr6ZsLJvMcw1xOxHaeL1
         21qwiJvcpda+9zZvSA4sOcABpFuL3mqsoZiwCq/qNy3n/qAZiZhYkbOY7FsH09+EXAHr
         teCI/BnXqAduR539yJ26FaHROg0MDEPoktMG00iNAYhGOY7+wtCXSYEoNV0FKoe0KPBA
         Z5zeCj8wUHKXk6Xl5L2LBrxVF6CDDB7aBNRLPCiVkuG3dybC7KOQVbvlORHG5qeR3PfU
         EzHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bqJZWTBy;
       spf=pass (google.com: domain of 3l_otzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3l_oTZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3l_oTZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id q29-20020adfab1d000000b00343d6c740e2sor2092857wrc.2.2024.04.08.07.09.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3l_otzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bqJZWTBy;
       spf=pass (google.com: domain of 3l_otzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3l_oTZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585367; x=1713190167; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HFXPBczsaFzwM3/E8nUe7UI7cqODAn7zmH22JOuPig=;
        b=bqJZWTBylIAhrAR7Auw5rfzoewbezWgZClWoLxM/0+FJ41G2w1UjBvdZ2oawQqThxG
         SIrmBAerNLzDddiADlGdQnCFUY+osjealdtB9ibKDf6+gqV1tUAju+EemTSoQzsMmftJ
         swH2l9c3e2XuBZ+y8QO9B/PAr3Bohc2EPUia6re+hWALUHnimx0hUePPLiiDbiCg9Jt7
         PLJB1QOOY58RQ+2SNQFg7ZJFemRTp8ohV8eWlUzjo6krAiomioNthOpYWRHdDT88ah+y
         bfEB+pKnJsXfsK+v+b23Byv4SHOdajl29VJLNro3yJhgQIJXOwrSzwh3I+67eAmMFwPg
         KLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585367; x=1713190167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HFXPBczsaFzwM3/E8nUe7UI7cqODAn7zmH22JOuPig=;
        b=HLPFOJ/iFsOBIN8rhCJlfK5F3IE4WnHe5nJfSb+pD8Y59kdngaH4u4SOR+SMknAqGh
         eCHefw2Ysk7mjYPW636XKNmX/rGsm8FTz5G1GuiFMJ9BuqdOfHhkoEgq5Y0wMcqJmXv9
         5JntIS6+9dkgp6qf31DKt7AsR/fN5YivKTFjiwNB5GG673OaUN1dRgpPrTRy+0MRu58d
         CAdwJ0w7kjDq3eXCkQQOEbVMO3Bg7QwphgBlnBvc/P2Jk14D6ryjA7+c16gwKAr4G+un
         T46SaQnh2+9uzQ0t9S/G1kiU+yd9fT3iLRYexoO60msBo7NpAb4fBt9ns13XucksGJEv
         TnyA==
X-Forwarded-Encrypted: i=1; AJvYcCXoxXMiTmcqjXzUcqKPVz9qN4wvnlp7exYRxJPAfA3E93hQyJVgHhaRXGP6uY+RqDoJm4I+tF9Yx+sLM3Ul7002GtNrDwNK
X-Gm-Message-State: AOJu0YwWTsBuERiSk/F/rujWm/jZuHUkmKeTK0xnqj+7cV/s44lFDA8G
	0jaSlxabKd/UHD4htN0DfoNwkAlLhKoSx/uCl5nJI96FKW5FIVJhHdjjPPr1Ey2ehJ0sk1zsDeH
	vRiS/m/vRWQ==
X-Google-Smtp-Source: AGHT+IE7kCfdgL08HfEqucyFWrSJbWPjvekE7QrePaAghtRgm0vvVoGNYz6lmTGoMFN28/lVMU0gfGcPCY6egg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:6f0d:0:b0:343:ecac:5ffc with SMTP id
 ay13-20020a5d6f0d000000b00343ecac5ffcmr116195wrb.7.1712585367719; Mon, 08 Apr
 2024 07:09:27 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:17 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-13-smostafa@google.com>
Subject: [RFC PATCH v2 12/13] hw/arm/smmuv3: Add property for OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: P4shj8Nu1zwf

Add property that sets the OAS of the SMMU, this in not used in this
patch.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  3 ++-
 hw/arm/smmuv3.c          | 29 ++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index b0d7ad6da3..41612bb9ff 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -105,7 +105,8 @@ REG32(IDR5,                0x14)
      FIELD(IDR5, VAX,        10, 2);
      FIELD(IDR5, STALL_MAX,  16, 16);
 
-#define SMMU_IDR5_OAS 4
+#define SMMU_IDR5_OAS_DEF 4 /* 44 bits. */
+#define SMMU_IDR5_OAS_MAX 5 /* 48 bits. */
 
 REG32(IIDR,                0x18)
 REG32(AIDR,                0x1c)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c377c05379..a9e35c41b7 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -299,7 +299,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
 
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
+    /* PTW doesn't support 52 bits. */
+    s->oas = MIN(s->oas, SMMU_IDR5_OAS_MAX);
+    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, s->oas);
     /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
@@ -1878,11 +1880,34 @@ static const VMStateDescription vmstate_gbpa = {
     }
 };
 
+static const VMStateDescription vmstate_oas = {
+    .name = "smmuv3/oas",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_INT32(oas, SMMUv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static int smmuv3_preload(void *opaque)
+{
+    SMMUv3State *s = opaque;
+
+    /*
+     * In case it wasn't migrated, use the value used
+     * by older QEMU.
+     */
+    s->oas = SMMU_IDR5_OAS_DEF;
+    return 0;
+}
+
 static const VMStateDescription vmstate_smmuv3 = {
     .name = "smmuv3",
     .version_id = 1,
     .minimum_version_id = 1,
     .priority = MIG_PRI_IOMMU,
+    .pre_load = smmuv3_preload,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(features, SMMUv3State),
         VMSTATE_UINT8(sid_size, SMMUv3State),
@@ -1910,6 +1935,7 @@ static const VMStateDescription vmstate_smmuv3 = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_gbpa,
+        &vmstate_oas,
         NULL
     }
 };
@@ -1922,6 +1948,7 @@ static Property smmuv3_properties[] = {
      * Defaults to stage 1
      */
     DEFINE_PROP_STRING("stage", SMMUv3State, stage),
+    DEFINE_PROP_INT32("oas", SMMUv3State, oas, SMMU_IDR5_OAS_DEF),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index d183a62766..00a9eb4467 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -63,6 +63,7 @@ struct SMMUv3State {
     qemu_irq     irq[4];
     QemuMutex mutex;
     char *stage;
+    int32_t oas;
 };
 
 typedef enum {
-- 
2.44.0.478.gd926399ef9-goog
