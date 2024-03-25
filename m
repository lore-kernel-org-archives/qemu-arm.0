Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597663ejj;
        Mon, 25 Mar 2024 03:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh4YQ4z98JWGJTm0I4A5FOtrBb6uvtUkiXbyjQJDLVflCfc0si3lLp/lM8gJ/tjIL+5B0aJCh9DtJ8XzXt9yzSJHAkhFEz
X-Received: by 2002:a05:690c:dd1:b0:611:33f8:f81a with SMTP id db17-20020a05690c0dd100b0061133f8f81amr5965077ywb.4.1711361728980;
        Mon, 25 Mar 2024 03:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361728; cv=none;
        d=google.com; s=arc-20160816;
        b=htkag3+ZWtY186vjLBTevSoAw6RaTN/Y8vnt4ZGtDMEOYQ250axzZu1poWW+muRGEN
         DTVZCHzMMZOchRtCTqotGPsTQya+7odSegi8hTxlZJMFW5afRmVR2d9rkh1QQe29ypzR
         E5RadfgU+TBINw9LeB3Gfl+sSoMeWwpUIvAFVkA2HCqXSaYtXjRghbOtl+u7dlgoGUks
         jPa63banBTkIH2mu6FsMMeDt4eziVigmdgkQElzLUSfjiu33lVQztl8lrCGbtQhMAzZH
         qLBi14kbnZcXiFTZ69JbPbn4CWHCuA82qfrTSaMPwrDz4B+1Sxw47TbDN64MxBhZTu+c
         5KSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=PIQyD7fWOKdqPHHegPpRK4rKc0e9PSQxmCaN+UfpwQ4=;
        fh=o3WZFLIlY1etpZcn8OurkJMEz04aPUtxOTCCnoTrjbM=;
        b=BkWqRli7aIcN+qfbca7aCIS7V77DtKjenveDDClEfVwH0A8hgl39yXdR7rpKOda9OI
         XH8v1OOfkust96rv0j0T8iwZL8VHfHBLC3VTBASkPCWn3RLWxl/8aBFLHr2o4pFfTE+P
         shmzRmBIU8B0FO8u6TMWVfNhbHa5Rlf6L2Afyi0w74/W+28gl/z0SRIIz3HXCTf/g1t5
         hgISvtn2geBHJoxmX79tqBxm6SjtCtQ2OE8yKXB7eTjMTVKPp0C1oIO6u8evrEYXT9L3
         O1aYosqG8Yauj4qP60SeyuetbfGw/ufMDcsq10pxFxoctTq9tZriQh8at/Kj/+zeRZ4+
         Gudg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TqXLXfIx;
       spf=pass (google.com: domain of 3we4bzggkc5klfhlm3839hh9e7.5hf3e7q.47gg77ebg3kh.hk9@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3wE4BZggKC5kLFHLM3839HH9E7.5HF3E7Q.47GG77EBG3KH.HK9@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3wE4BZggKC5kLFHLM3839HH9E7.5HF3E7Q.47GG77EBG3KH.HK9@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id c203-20020a814ed4000000b00610f7c03ec5sor62499ywb.1.2024.03.25.03.15.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3we4bzggkc5klfhlm3839hh9e7.5hf3e7q.47gg77ebg3kh.hk9@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TqXLXfIx;
       spf=pass (google.com: domain of 3we4bzggkc5klfhlm3839hh9e7.5hf3e7q.47gg77ebg3kh.hk9@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3wE4BZggKC5kLFHLM3839HH9E7.5HF3E7Q.47GG77EBG3KH.HK9@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361728; x=1711966528; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PIQyD7fWOKdqPHHegPpRK4rKc0e9PSQxmCaN+UfpwQ4=;
        b=TqXLXfIxhrO0Lvu5FJEHkmLxV50VFExZ/5wBxfaEgOWrgbUeXDHeXJNlcguO0zl1pT
         /JGMs045E7IhcZSxORpodV5qllIaaUXaWCVXDPFbqFoyp5OMrWANL5th5f9Zq9oehSoD
         ov24Kojy1U7omN3Aw4povsf76gbcaAN/khVmCWZSLGJ8og6J+ECdZzUHXiWMQVd29gTs
         CPZ/zyQ3TH7CwJzMSX9CEtRds6sEWc6lrklM3HqMpL1GmJuxIFYmpjQToXXmB3zn85X1
         KpmkN47PVN6eHovUa5B2qNXlchXH6gpirCdeeevgn0MVU6r+9zy00CWRnkvkJ62nJ+vb
         aEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361728; x=1711966528;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIQyD7fWOKdqPHHegPpRK4rKc0e9PSQxmCaN+UfpwQ4=;
        b=DAo/R0y1nniKx5/4346QxmOq8xLNj2oAW97/+bNr/pIm9E7/BYbWtoROpmgmYAfFVh
         bmEgxPmB/eW3nwW3pcB57HbWtzDGQXsfbu93jym2dHLf2sAZod/X5CZYZDIzai1CC7+f
         RTOiWIeyiOPlCOvQUsfRp74ohAaKV1MXGiLbuubpYaDqEv+TODLGzcJwuBrHFLN94y0R
         gcivxITlOyCkJXx34EEXqNAWsW49TZKmNvuVLKKvPL6gEJ42Xj+vPRC6zERnP29mlcxf
         ufHpDHMgokksEGPy1HIs4QdfEM5RzDzoB/zhFykJ2NrW584zOsfCDtRaiRvx6SVkT5+I
         6tdg==
X-Forwarded-Encrypted: i=1; AJvYcCVROUOQ8ZdDjX+7cbusmXjvWqbqmyMNLgBUxG4oWEgMu2/+lFzXWEinOBoUdM5NnKejQezzdDTAkE1u2fqhGbJHmLA0peAv
X-Gm-Message-State: AOJu0YwIqkligNNWfuRRXrP8O7nbn4WARBoGCmqwmIXIBGo4s1AptjC6
	YFq0uXjbJfDMNhtYT4vveZiXsCz4Pwty6XQtYsyiS4y3oz7RN7acV9t8osQ0L3GzkpDU2lAFl6T
	Cox/u1TcODA==
X-Google-Smtp-Source: AGHT+IF/8jxqEryQ332F3IpGb3mlrotrn5WHTTl485//bAS4u0Rj9DpbMmYxICx9IowU22tYToi1vssVuX59MA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1207:b0:dcd:3a37:65 with SMTP id
 s7-20020a056902120700b00dcd3a370065mr237591ybu.7.1711361728495; Mon, 25 Mar
 2024 03:15:28 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:07 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-12-smostafa@google.com>
Subject: [RFC PATCH 11/12] hw/arm/smmuv3: Add property for OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: WSjz0EWk6XyT

Add property that sets the OAS of the SMMU, this in not used in this
patch.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  2 +-
 hw/arm/smmuv3.c          | 27 ++++++++++++++++++++++++++-
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index a7d53b3854..9bb4ec9ec6 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -105,7 +105,7 @@ REG32(IDR5,                0x14)
      FIELD(IDR5, VAX,        10, 2);
      FIELD(IDR5, STALL_MAX,  16, 16);
 
-#define SMMU_IDR5_OAS 4
+#define SMMU_IDR5_OAS_DEF 4
 
 REG32(IIDR,                0x18)
 REG32(AIDR,                0x1c)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2a29e3bccb..9d0db25379 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -299,7 +299,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
 
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
+    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, s->oas);
     /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
@@ -1869,11 +1869,34 @@ static const VMStateDescription vmstate_gbpa = {
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
@@ -1901,6 +1924,7 @@ static const VMStateDescription vmstate_smmuv3 = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_gbpa,
+        &vmstate_oas,
         NULL
     }
 };
@@ -1913,6 +1937,7 @@ static Property smmuv3_properties[] = {
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
2.44.0.396.g6e790dbe36-goog
