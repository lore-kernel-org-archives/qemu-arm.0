Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569312njc;
        Mon, 25 Nov 2024 11:59:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxJ4lOA2of4BtrtlJsvMZCusm1CCbzXV45epky9sdIwFgey3Z4t8D7IMfNAypf//bUUzLxp8JblfszCQ==@linaro.org
X-Received: by 2002:a05:600c:3b9b:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-433ce427c60mr128857255e9.14.1732564771446;
        Mon, 25 Nov 2024 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564771; cv=none;
        d=google.com; s=arc-20240605;
        b=MYfH4MAjgU9CKQQbwCwK157AVDL3xp/lrAdhlJTPqDiKnA4gpQk192OdghcPFXiRc8
         6DwGVakPThfwNVOB4ihmHLgw2AUrAsOfYXI9ozsPAdmRWB8tuHv2MHeJ6obvBKCFOvgZ
         duNOWcDXX8Msr7cd+2Yza8SLfPDvi26dq3maM6tnTg4KfEiuPP+EOOz3RUmjF5rjz7aG
         iTsda6qjavtdFzkVxAJO8sSGq2Kd9ABZ3juvwMYAI+tp3TZmneVu/6CF1RRfYmMKuqYv
         /RYKgurozwIR5qZQgTkFgX+q1f1BrVzHBZ+28P2uNBlrg26Oouvv4pB026MphyN3B4mZ
         Dz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DFJSI53cHJ1N3Z+oLQAsbnNAF3KjE8o1K+yxUpabOQA=;
        fh=/PwzwnGAnZFPod9izoHEbGm57IauAf+H74LQa4obr9c=;
        b=XiEpwb4kNF5xMsbwTQw0BNJHX3TpQy905unV0VRnVTYRwJfIRUaDcHNeAkORCfTlSV
         g/B1TSAe0+Zw9VFhG4qevNk1rAR8406etd6TkAg6mLpTDNFiC1b+X+7py4gDRhg/8crB
         MBkLgWNRDjtMNU3jARh/gh7dERPgzFmu3P/C5YHYpbidDqYc0y36lrnDJ4k9N3Fmej54
         j8l8CR8NmdvtBsDkR3ERmbhCQB3p24Sz5zAm8qAOXb11cuxlcA+8yAnkxSMYzlbF82aN
         OOhtN67EixYhFz4FpCJ9GeWonoTL8Go2NKA1XzN4g5Z8elh3cZ4qbll0dyFb4E+EdziG
         7dVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4SSKkVa;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd6193efsor37216245e9.0.2024.11.25.11.59.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:31 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4SSKkVa;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564771; x=1733169571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFJSI53cHJ1N3Z+oLQAsbnNAF3KjE8o1K+yxUpabOQA=;
        b=T4SSKkVaUqSwuWp3gOnxcQvoFhUZ+Pm3UOQSvRCgZUA+pOt/2Df5b5dOigdgPwRNf4
         Lt4mCFiHPA8+K7MT4SW9wa+1rB52sHQI7BT7cQifUdVBNpmx9rbJBTzA46OEJ9Uaeudl
         dRfsM82BtJXztysw3jDgEedAQXs9D5e3ljkJkcgIT3NXVHc5Hk6737U0E6XtGvpXITZ/
         si4lv8rPbO2JI+HjsNloX7RX7y885vy6b+WuR+fJ5tAuANFCMTZLc6gQW+rqYVTrwSo8
         aPN7n0kgDE+11EUn5R/h1ZCRsMseeNCnCP3n4GQBmZchvA5ZklyY2k6QlI7jbCkjp2m7
         jnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564771; x=1733169571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFJSI53cHJ1N3Z+oLQAsbnNAF3KjE8o1K+yxUpabOQA=;
        b=tw90u8l8w8dx2Fr03ifu47Oy19OYvdCWLG5Me//GVmjTcMGqNzLbWB/neBsnkGulvJ
         qrpfGI1SLYFqna8OgsDTmJC+nF+aUftbnrWneu6g88iUpr0IntWQFISM/bmw0/WiGSuC
         xwreAd2HGEhSdu2R1XVCiiQzTgk/IiuWalfPhT52YlwmBw8v/w0bMC/AyOvjmNXSAaXe
         Bysxbli7rNd9yUnxThy4DXu6zygv33mVhCjNQfA3QptqUI8ncP9VfVltLThiSB3mXwtA
         v5/6hBp6lScrLmBx+N6kkScO0q8qUeLK8wvwfUlevDS7eMgdKMD3PiD27iknwryzAj5B
         QSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwTDbufeHgU6EBU/F/2psbaTIFa6hCBjO8gv/uLxA3LEyhk86K5+OZrmKrY3tsYqsJ5Q9M/ODG0BYaVA==@linaro.org
X-Gm-Message-State: AOJu0YydOV27eaPhiJEWYmP7/YoUqPb54GWiFcdSXkm7xK/BLq+3bL5v
	Yv9exzPvyif7NlTmQQ/p9VYZHJpVreyE7enF92OjrGqsr8xJD9xrUOYVOq+spxa5iQ==
X-Gm-Gg: ASbGncsCww3D74i6Q9lSpidp3ULFFD0j2yK3gf4hsNXg7sQxQ0yK4z7ybNv/glI7/1U
	7xgYPDdArTFo5K389LIpKaaN7eTdyX1izJV8YehgWj5xAaM15Z6hE1aUhdTNF0cUu+N0RZAcyMX
	vGx7a2s13LzpkCRssDJvqoyVygwqpjP9fA/Hr6w9PP3M0ziYg6ebAov/na2hNGKh70CO3OrJAhZ
	6tlG+zj6QNc5swG0yaRR++QQiQ27fls0dpkfAdpXXxcv5VcHJ/8mpwTP1B4mho1JW4U
X-Google-Smtp-Source: AGHT+IFReC0jAoBg3T5lkRnllyjlOiG9tzJlifErfsEXB7qfxFxhKbbca1oQPz7uQOdlOYwByoQPlw==
X-Received: by 2002:a05:600c:1990:b0:434:a555:d0d with SMTP id 5b1f17b1804b1-434a5551bbamr2381835e9.29.1732564770965;
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 11/26] target/arm/kvm-rme: Add measurement algorithm property
Date: Mon, 25 Nov 2024 19:56:10 +0000
Message-ID: <20241125195626.856992-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zDudO81hLMGX

This option selects which measurement algorithm to use for attestation.
Supported values are SHA256 and SHA512. Default to SHA512 arbitrarily.

SHA512 is generally faster on 64-bit architectures. On a few arm64 CPUs
I tested SHA256 is much faster, but that's most likely because they only
support acceleration via FEAT_SHA256 (Armv8.0) and not FEAT_SHA512
(Armv8.2). Future CPUs supporting RME are likely to also support
FEAT_SHA512.

Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: Rename measurement-algorithm
---
 qapi/qom.json        | 20 +++++++++++++++++++-
 target/arm/kvm-rme.c | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index f982850bca..901ba67634 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1068,6 +1068,20 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestMeasurementAlgorithm:
+#
+# @sha256: Use the SHA256 algorithm
+#
+# @sha512: Use the SHA512 algorithm
+#
+# Algorithm to use for realm measurements
+#
+# Since: 9.3
+##
+{ 'enum': 'RmeGuestMeasurementAlgorithm',
+  'data': ['sha256', 'sha512'] }
+
 ##
 # @RmeGuestProperties:
 #
@@ -1077,10 +1091,14 @@
 #     hex string. This optional parameter allows to uniquely identify
 #     the VM instance during attestation. (default: 0)
 #
+# @measurement-algorithm: Realm measurement algorithm
+#     (default: sha512)
+#
 # Since: 9.3
 ##
 { 'struct': 'RmeGuestProperties',
-  'data': { '*personalization-value': 'str' } }
+  'data': { '*personalization-value': 'str',
+            '*measurement-algorithm': 'RmeGuestMeasurementAlgorithm' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 0be55867ee..bf0bcf9a38 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -23,7 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         1
+#define RME_MAX_CFG         2
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
@@ -31,6 +31,7 @@ struct RmeGuest {
     GSList *ram_regions;
 
     uint8_t *personalization_value;
+    RmeGuestMeasurementAlgorithm measurement_algo;
 
     hwaddr ram_base;
     size_t ram_size;
@@ -63,6 +64,19 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         memcpy(args.rpv, guest->personalization_value, KVM_CAP_ARM_RME_RPV_SIZE);
         cfg_str = "personalization value";
         break;
+    case KVM_CAP_ARM_RME_CFG_HASH_ALGO:
+        switch (guest->measurement_algo) {
+        case RME_GUEST_MEASUREMENT_ALGORITHM_SHA256:
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256;
+            break;
+        case RME_GUEST_MEASUREMENT_ALGORITHM_SHA512:
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        cfg_str = "hash algorithm";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -275,12 +289,34 @@ static void rme_set_rpv(Object *obj, const char *value, Error **errp)
     }
 }
 
+static int rme_get_measurement_algo(Object *obj, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    return guest->measurement_algo;
+}
+
+static void rme_set_measurement_algo(Object *obj, int algo, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    guest->measurement_algo = algo;
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
     object_class_property_add_str(oc, "personalization-value", rme_get_rpv,
                                   rme_set_rpv);
     object_class_property_set_description(oc, "personalization-value",
             "Realm personalization value (512-bit hexadecimal number)");
+
+    object_class_property_add_enum(oc, "measurement-algorithm",
+                                   "RmeGuestMeasurementAlgorithm",
+                                   &RmeGuestMeasurementAlgorithm_lookup,
+                                   rme_get_measurement_algo,
+                                   rme_set_measurement_algo);
+    object_class_property_set_description(oc, "measurement-algorithm",
+            "Realm measurement algorithm ('sha256', 'sha512')");
 }
 
 static void rme_guest_init(Object *obj)
@@ -290,6 +326,7 @@ static void rme_guest_init(Object *obj)
         exit(1);
     }
     rme_guest = RME_GUEST(obj);
+    rme_guest->measurement_algo = RME_GUEST_MEASUREMENT_ALGORITHM_SHA512;
 }
 
 static void rme_guest_finalize(Object *obj)
-- 
2.47.0
