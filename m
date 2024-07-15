Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118209nji;
        Mon, 15 Jul 2024 01:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlQZvb7kToeh6yCn/I7C4GCoEx4d5RfFrcHPSp2hIn2DcraY/b7X2hahHxGFkzyI7Syn76jV8V1EifJYo5VfXF7RTMVEM0
X-Received: by 2002:a5b:1cd:0:b0:e02:b968:abaa with SMTP id 3f1490d57ef6-e041b0586b5mr19454605276.18.1721033167516;
        Mon, 15 Jul 2024 01:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033167; cv=none;
        d=google.com; s=arc-20160816;
        b=LNN38nt1Ye9ZiMIWucrKxCFVRjCq0GBiUhfYUM9nvtoMN5iB/Ti/84eLbP7ibMAVHx
         KWYhEtubBEa3vg/PRJOO5uq+oiiJMU3x3H2zKBEJM1Zpn/uPHqf2Cy7FX6H34bUEwO18
         aPgoJ/7HMR6CjPA5J8bpxkfPQozZSvPjnQR5XwasDV6Eqa/diOwazkMTbdubm8e9tREX
         qV7EFsChSYf1dP58YpUpvyDsW6L5X/0utKiqc4R9XTu3ht1dpwGQh61w4rz79CY2dqbN
         Kcu3W+qmMyawHoqfAqaRjZTO3etEAwEhYKHDhtspRqMcSqz9aPwbqHFUZPt9uToa9Jmo
         q7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=0SzSfEc0SLDVHh1GJe0Fzz1n1p2oM3+UJXhVVnM1uKM=;
        fh=wQ1EiAAiZctd2xWO+7vR9WN08IhTg+9T8xqle4EecsU=;
        b=d6Cn+mDFXfbczhOf6AFoPPUl//xmx+bvJGHhzNBOFIc2jd/dZSH4DunFfQaG4GWwRz
         M9/fd8wcAY5nO0iSc2x2BJdG3K5azLcLl3N5CGNQHDytxkUgIbCLxmA5TpS14aGK1J7K
         n4Ujq5lnRKtBw+324VxM6R2r2TjwsjteTyW5h+OMzXeQX7kXXDL2ZY3Z5nFOiCj+eHFZ
         AQG4Xbwt2/EnV0/SzvEvH91FbENc40gArRYsihzwKT7dK1j3FjrQG5qA4lCrjIDbZ9SB
         q/ngbk1Mw8+9OVibhdwK0BPo7NmkPGmrs7bksH3ZOmEQWObSBf37c8qRB++dnILqmY26
         q/1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=397mQdiE;
       spf=pass (google.com: domain of 3z-guzggkcyiqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3z-GUZggKCyIQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3z-GUZggKCyIQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e05a459a5a4sor1446198276.9.2024.07.15.01.46.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3z-guzggkcyiqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=397mQdiE;
       spf=pass (google.com: domain of 3z-guzggkcyiqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3z-GUZggKCyIQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033167; x=1721637967; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SzSfEc0SLDVHh1GJe0Fzz1n1p2oM3+UJXhVVnM1uKM=;
        b=397mQdiEa8+Lnd5Ujyw20LFm0L9NNZIMf4Sr4xDzAocuvhLrztI4hDAV3hzpi/iF2w
         bYVb/Z6a2X98s8ECA6TeMbU5iiOGTVInUyo5sw6RD8Vx5Jr61VNHZxH05K2/JuPzJZ4h
         6B2lJTXcZ4hTQe994KIdCKu27/WiOH/ONqLNbLaLZgBGb1iuaNMawsb8YmazdTZ/zOIE
         Bdtjz6tO2oH8gF1X/4jkGrYJZe1Ng2de6puthnYmBl1gQ3fm6E4NDqyk5FyyeT9GgZjV
         P2JquxPjG2/DRiPACFMX0RqC6hjRd9HbIfBkv3bg7XH6ZVmjX2eIItk7AuD77F6qV+Vk
         7cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033167; x=1721637967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SzSfEc0SLDVHh1GJe0Fzz1n1p2oM3+UJXhVVnM1uKM=;
        b=EuU1Qfd+3sqsKSDBQrqZ6hZ/V4opjn9RImAXIJvDxs97Ogn2bI7inSM6m5LUU8SZC+
         9qnI7KVwPPx9mFXWUbY+8xFr5VFuDr+Y2nrAd+kNMKVdBpMg3PYQ8cfwKYxGAwzfMZPJ
         w6EWPM4uPI3PVcy+YekALHPKiL8nYbyc5Cs9QkbqjPiTVP/az4gWJTgu+xNH2c3bmUme
         Cz1CIlvz1GoqEeWtSaDMItUnVMsAU9wTeJESZX006vhVs7pB/dRRQhNXLa0gY7765+v6
         +7X7UxgVw08z6mbNkJ0NHCxHh4CRCShgBgBcV5/Gbt06399kfvqAsKkJlO0xapEKWxjU
         VwPg==
X-Forwarded-Encrypted: i=1; AJvYcCXDhZsr3a51lcqJJBC4/mx4FxGRIOzHqejV+efGlicD8oL6tkUt+BwrI6NR4gEoWm09evzvhwiZbIZR7Xek/0Wq1HSnm5SA
X-Gm-Message-State: AOJu0YyXlQCKKTOkvTxvSjxiYjzRicFFwAqGyqkqPUGwNp8GLZTOblg1
	g04ns0byx70lo7C9m+303Nx5IzVVCQtkX7l2Kp90cVh6HxiiEpXEPPTuy7Fol5Hj65wz8WoL+po
	YJi8793pCog==
X-Google-Smtp-Source: AGHT+IG2pk0XWFiODdVXCH3m1dD+tWhY1SoheTx2eYfNnAcE0pgm1XQjh6XKF/9ZNzXwaO/lKLw82rAKXlWz5A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:240a:b0:e03:a2f7:739 with SMTP
 id 3f1490d57ef6-e041b134c1bmr30803276.8.1721033167057; Mon, 15 Jul 2024
 01:46:07 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:17 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-18-smostafa@google.com>
Subject: [PATCH v5 17/18] hw/arm/smmuv3: Support and advertise nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 1uGkcZSq/uTQ

Everything is in place, consolidate parsing of STE cfg and setting
translation stage.

Advertise nesting if stage requested is "nested".

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d052a2ba24..32b1f4cb75 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -261,6 +261,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
     /* Based on sys property, the stages supported in smmu will be advertised.*/
     if (s->stage && !strcmp("2", s->stage)) {
         s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
+    } else if (s->stage && !strcmp("nested", s->stage)) {
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
+        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S2P, 1);
     } else {
         s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1);
     }
@@ -425,8 +428,6 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
 
 static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
 {
-    cfg->stage = SMMU_STAGE_2;
-
     if (STE_S2AA64(ste) == 0x0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 AArch32 tables not supported\n");
@@ -509,6 +510,27 @@ bad_ste:
     return -EINVAL;
 }
 
+static void decode_ste_config(SMMUTransCfg *cfg, uint32_t config)
+{
+
+    if (STE_CFG_ABORT(config)) {
+        cfg->aborted = true;
+        return;
+    }
+    if (STE_CFG_BYPASS(config)) {
+        cfg->bypassed = true;
+        return;
+    }
+
+    if (STE_CFG_S1_ENABLED(config)) {
+        cfg->stage = SMMU_STAGE_1;
+    }
+
+    if (STE_CFG_S2_ENABLED(config)) {
+        cfg->stage |= SMMU_STAGE_2;
+    }
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
@@ -525,13 +547,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
 
     config = STE_CONFIG(ste);
 
-    if (STE_CFG_ABORT(config)) {
-        cfg->aborted = true;
-        return 0;
-    }
+    decode_ste_config(cfg, config);
 
-    if (STE_CFG_BYPASS(config)) {
-        cfg->bypassed = true;
+    if (cfg->aborted || cfg->bypassed) {
         return 0;
     }
 
@@ -704,7 +722,6 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
 
     /* we support only those at the moment */
     cfg->aa64 = true;
-    cfg->stage = SMMU_STAGE_1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
-- 
2.45.2.993.g49e7a77208-goog
