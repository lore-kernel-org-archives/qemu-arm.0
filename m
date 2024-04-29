Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931902ejb;
        Sun, 28 Apr 2024 20:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwiqhiWxzSMyIceZT0MSEsvhmcgF8R9kKZLfz0t4BaW1Qtznw6PaEKet5M8MQxTf0/vzqtl2IVHSHwss42MFEP3V97Ypdo
X-Received: by 2002:a05:690c:6f84:b0:60a:576:7b79 with SMTP id je4-20020a05690c6f8400b0060a05767b79mr9819930ywb.41.1714361113099;
        Sun, 28 Apr 2024 20:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361113; cv=none;
        d=google.com; s=arc-20160816;
        b=Mesin54ZILAnIiS0PjSzgvDeW6YF/fs68UQPbcysNrCkDm2QNTcG1NqloKlisnx7JH
         ys3i4PGDTujA279xh2w+fdXVe+49rj84Wjk06I88APbo1/nmW8a6Sy0iISmLHS+ri14l
         MRGunCRo/D4/G3q2F5P9oxjU3fxbbDPawvvreOvoOMB6/vwDjqnMaz8f0HJNyZEOHJRY
         pbrSirpsA+LIlV6utDPNXkanUjLBa8iClJuDqZ0DjmlK8voI9nOYVTJAKZmUwcbuiuxs
         A0vsJT9bkuMtiRwqxATy27qqTgEhUMdxDbyBEUectH3fGICQW8VE1L5GhOyx5fqA2aEr
         ID8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=/BTFGfZ1d0gsjHHzEN1EL1O2w8u4ar4XUJHJI2pzbXc=;
        fh=s0i1s+oPknUuS6xxmo6gMN7iuG7QUHCFvnwXmhDm7D0=;
        b=TZGFpiyK8iX6qVfS0b2bGWqZPSh1TDo8JqvNkAPik2SUe5WxopsQ9iU0n074wEqJL8
         KqX4U+xfsyOgSW4PNdWHIS7l1S5404BLmSZjihOqMMKmq2dMURv4jRsI5+12LEgh8Vma
         BCJdowAxsTa5mFDfkcZkj+X2/6Ecti1LfxdHfhDBIlb9gjE2CdPIDOQUKVn4gj+FIcbO
         Of7RXTlW8d/ee6LYSJHE6XTAJw6PFfWaDXWb2jpAXi/qkgxCDXHBsUvAnRlEHljZW3F8
         XapD401wVaqGWgnc+gqCxSOeq45i7qrv1rEz/gJJa7mPK/pnPyNtl+ymOrw1ryqOFy3S
         q8zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SqlE6KW9;
       spf=pass (google.com: domain of 3gbmvzggkczmhbdhipupvddvat.rdbpatm.qtccttaxcpgd.dgv@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3GBMvZggKCzMhbdhiPUPVddVaT.RdbPaTm.QTccTTaXcPgd.dgV@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3GBMvZggKCzMhbdhiPUPVddVaT.RdbPaTm.QTccTTaXcPgd.dgV@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id w126-20020a814984000000b0061115878062sor17651263ywa.16.2024.04.28.20.25.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3gbmvzggkczmhbdhipupvddvat.rdbpatm.qtccttaxcpgd.dgv@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SqlE6KW9;
       spf=pass (google.com: domain of 3gbmvzggkczmhbdhipupvddvat.rdbpatm.qtccttaxcpgd.dgv@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3GBMvZggKCzMhbdhiPUPVddVaT.RdbPaTm.QTccTTaXcPgd.dgV@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361112; x=1714965912; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BTFGfZ1d0gsjHHzEN1EL1O2w8u4ar4XUJHJI2pzbXc=;
        b=SqlE6KW9eiWnGbGTpf9N4X9yJMBsajLA1TsJU2S+UxY+9hC3GniEPnemufzJU/jqTR
         2/oaWzBqNwo7FpdYQTnTQs5AqgO6BhScS5hl44GCFHfpSESzx4wdCPpOYRTBwYl5WxVj
         Jgn7Nl4NxBpPYf3qwgTQ/uZ/i0X7iSYclkHDesqCjeTRFQbBEo1tFhP1/7ddZLbx2tLt
         qG052a0lidopQhCzUHvK7cMAyGJML0OfpHNvr1b3vlA/y857/DBHHSlYwjpZbl4X7pn3
         cfYDNMpJlGVjxIvuEespORbWIkvvrUsJgV72HeWN5vgQrs2PsR58gEQ1y4zeZFyCyPlB
         1IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361112; x=1714965912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BTFGfZ1d0gsjHHzEN1EL1O2w8u4ar4XUJHJI2pzbXc=;
        b=R9yQSAHcjVaMOcKKUPik3a0Y5S9/o/gEltfeWEQUudrR/86vUW3N1YXpcR3GadXoLZ
         SxZvVe2rQUoP/uo6YZVCOrvDlYCxa2tHNBgC6nc7yP0m29C+V8Zr1R6X+idpxMB8IgPr
         mjFgpyqASC2nCagWVMhEUqpu/9LdriV5XiWahyLlWhrFdraL7rz6vQaOow0O2FYipyDR
         mn9y0G6RsuX0uImI6MamNARQrZIRZE6VFJ8prO3viqi6bLyfPVSeFaJ+zRVoKqjs8la6
         TJmT/vqkVjCk1+jeK7L5kigOCalF4873Q5M832MXeOh3HYTpmqjvH5pI2jUdzz3auDNO
         sOgg==
X-Forwarded-Encrypted: i=1; AJvYcCXevXqwGD6mKuhO8t8nx8saKTy5J7FE+yZnesP1PyPxumv7i2wZJwGrs89Gcy71HqCLIg5frClgZYeRun4CyH+c+LJc88Wj
X-Gm-Message-State: AOJu0YzHxDLZftmXD3r39H7HLWpihVT3ufWw5kAlhyRS6GTijQOY9s4Z
	iQWrVOOzd7wZA2k1bS73c8NoClnSjxcO9Gqo8ThPIv1kV8LoL2ogNqG97ryUsIzYaQk9/r4vznv
	Qy6LiZ5UNuQ==
X-Google-Smtp-Source: AGHT+IFFo+jlYuYjHxKJhkRV7lC/G2aM9qqbB4pNsc3sRMEJ+F0x5yqamojV8kbwertJTfE3LteXYx8IvBJ4lQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:2b0b:b0:de5:2ce1:b638 with SMTP
 id fi11-20020a0569022b0b00b00de52ce1b638mr1035935ybb.0.1714361112365; Sun, 28
 Apr 2024 20:25:12 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:24:01 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-18-smostafa@google.com>
Subject: [RFC PATCH v3 17/18] hw/arm/smmuv3: Add property for OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: hXnkIqJPtW35

Add property that sets the OAS of the SMMU, this in not used in this
patch.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  3 ++-
 hw/arm/smmuv3.c          | 29 ++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 0ebf2eebcf..dd91807624 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -111,7 +111,8 @@ REG32(IDR5,                0x14)
      FIELD(IDR5, VAX,        10, 2);
      FIELD(IDR5, STALL_MAX,  16, 16);
 
-#define SMMU_IDR5_OAS 4
+#define SMMU_IDR5_OAS_DEF 4 /* 44 bits. */
+#define SMMU_IDR5_OAS_MAX 5 /* 48 bits. */
 
 REG32(IIDR,                0x18)
 REG32(AIDR,                0x1c)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4ac818cf7a..39d03e7e24 100644
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
@@ -1901,11 +1903,34 @@ static const VMStateDescription vmstate_gbpa = {
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
@@ -1933,6 +1958,7 @@ static const VMStateDescription vmstate_smmuv3 = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_gbpa,
+        &vmstate_oas,
         NULL
     }
 };
@@ -1945,6 +1971,7 @@ static Property smmuv3_properties[] = {
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
2.44.0.769.g3c40516874-goog
