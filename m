Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498045ejd;
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+IqbNITeCaRFpZAkiLcQoxQfV+yNYa5hsYKfq8Jv/PDOB553TLGMS0zNwdA4m8BAjCglRohD6GfPTds84xsbUFn1vxmVk
X-Received: by 2002:a05:6000:18cd:b0:34a:6e5b:6c45 with SMTP id w13-20020a05600018cd00b0034a6e5b6c45mr1162636wrq.51.1713542397252;
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542397; cv=none;
        d=google.com; s=arc-20160816;
        b=gDLPRT4KwenGG6IHFSPVN3cW1WU5WxiyPjxQEGUHN2/kKz+HuLL1ME8+/Jpfyh6piQ
         Om+wQVz+RHNsojv7QvnteNhynsT7wTHCADEZ2KxziVZxtIpshl7PbRoJ4xqc+DWS4fPT
         9Kvw0iHTKmLGsX16gsOqdjSAHdvW4nhjKhBYtIdfR0A8x1wt3DW5Vm8hvy69k6NhA9pp
         dI5O1YNIsi8qupd5VNOJSLbV6Nrq2UdJh7KmPzlpYS1kD9ZKiykz8VEgUDitHwZ2e1r2
         oGBfyliCJ+ROjpkv7gXChcKJ+iNGSQDNTjw7E3dIkfDLBh2gjtU6bgS1kJptqPAnmkIY
         6mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+TiMKcfhWWVprWCCg72qipd7OlTmHhGexnpkTMCgpYM=;
        fh=L1gBCBOiSzbqdHOjrVrwhmwKTzwIAj7vpB3kEqQUbzU=;
        b=wu3y6J4zid+KDFAnxMl9GVIawRBzHlBHM9wtmmHppXV1q0OKuC1v7urLFHykOLtY5W
         THqknRWoF+9nROruPs9g12w858PHrtnRSoDLR7SPbV1BAf7Lyt1BrbKLPfOZ7DMF5abe
         M25acduOr8zKxdTl5qzY/vLZ1qqTfL8WN2o9ttuR4a+tmp0GFZVnT7o7IV4qgWR/royb
         A2u8AWBl42BAKajqU5HNXaZeudNGa7yprfHhTrE6gRZTLH6Xeq/Ju7ZztXHa1icdCoxS
         PKMiC5MBnxjPUfubJBoWBThw9Nv7fMj4KOrKx7QKpXgY4DGmiEdSr4qt/I2SwH49pFo5
         /C+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBPJRKal;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p2-20020adfa202000000b0034a4aa7921esor629248wra.2.2024.04.19.08.59.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBPJRKal;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542397; x=1714147197; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TiMKcfhWWVprWCCg72qipd7OlTmHhGexnpkTMCgpYM=;
        b=cBPJRKalUExHP+eGGZ7gNU25VFU6ywFxxtSfTGnQWuDGhzdI7ZEqewSo4kaIMgBpUO
         FXn/vdh+XBZjm3Xaax5+h2Kzz3Y25ScMD//LI8PpToC0dBrNvCycXCuyfs2thKta+zjo
         bFk5qWQnFn6tTqk/2ahp1Z1+IvNDa0tkbYmbmL54A5leZLISbipS299/dkxO68Hy2Mtp
         M0kyUWT4A/AoySpgNAzHcqaaL0omFjRck6n9BbrHj0LYS6gTirGb1PaQNaZ5H/aRh3Jk
         OW2KjjBce4XkuauDLG3oqtiXnRf6yel1gdK4RNeVpIl37mhUqePPqjNzwneD/2V5Zxju
         4UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542397; x=1714147197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TiMKcfhWWVprWCCg72qipd7OlTmHhGexnpkTMCgpYM=;
        b=EmcjeOHVOQOG4XEv10vQ18KzBLq+9FkN4aN9G5bCjgnmaOwukIyYFj2gJEcTWYCt9S
         LF5GC7hKfaoO7rOTRxcYRMgFwdIS9hYBVWLvEm6lyjdc/MQdvuTVpT79BklYLxSlliO3
         lfoTewpChhjW9P0mqTVTTSfssyABZEMSfV5fcqKgnNEdc5dD/6fyUZeEgkWWRHq/cYpe
         dHVhPI/nmfo8Of+0Mm6ES03UvbVkOnryqqd417OCxFrTP87+zK4yqNiVLvyGOwxss4kb
         WsPlqouOSTDT+xBNgsUyhMbfhGhulf+gSNsAeB/sD1mdvtX6M7bSonZq6tevmAIF2HVf
         pDsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7ahxWOyzB5nE2pTTxc4nVfK8BXAE1UUbhr8If7C19nRShTmFOFIjfO108ikAUDX3aOLXp668ACSryEnt1E89oBj4TZU2y
X-Gm-Message-State: AOJu0YzqHALLMT25akbFlBOWiIRkjZAi+1d8voBhygzuBhpnXnX0IK6r
	KGIpQiwi6317pCjStAUGa2NGIrFvaJDJhFnOonu8yu+4h39g2qiyY/dK+JHCDsmApg==
X-Google-Smtp-Source: AGHT+IEwMNMLMdwWzlmJIUijREc2Qf1Prq2dWY2hHTVBkRybeXPJsUyb6aSDemSmIpD+IWAfnVHXvQ==
X-Received: by 2002:adf:ce11:0:b0:343:3db9:6602 with SMTP id p17-20020adfce11000000b003433db96602mr1749385wrn.66.1713542396911;
        Fri, 19 Apr 2024 08:59:56 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:56 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 15/22] target/arm/kvm-rme: Add measurement algorithm property
Date: Fri, 19 Apr 2024 16:57:03 +0100
Message-ID: <20240419155709.318866-17-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GNdyK7Z28wTB

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
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: use enum, pick default
---
 qapi/qom.json        | 18 +++++++++++++++++-
 target/arm/kvm-rme.c | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 91654aa267..84dce666b2 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -931,18 +931,34 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestMeasurementAlgo:
+#
+# @sha256: Use the SHA256 algorithm
+# @sha512: Use the SHA512 algorithm
+#
+# Algorithm to use for realm measurements
+#
+# Since: FIXME
+##
+{ 'enum': 'RmeGuestMeasurementAlgo',
+  'data': ['sha256', 'sha512'] }
+
 ##
 # @RmeGuestProperties:
 #
 # Properties for rme-guest objects.
 #
+# @measurement-algo: Realm measurement algorithm (default: sha512)
+#
 # @personalization-value: Realm personalization value, as a 64-byte hex string
 #     (default: 0)
 #
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
-  'data': { '*personalization-value': 'str' } }
+  'data': { '*personalization-value': 'str',
+            '*measurement-algo': 'RmeGuestMeasurementAlgo' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index cb5c3f7a22..8f39e54aaa 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -23,13 +23,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         1
+#define RME_MAX_CFG         2
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     Notifier rom_load_notifier;
     GSList *ram_regions;
     uint8_t *personalization_value;
+    RmeGuestMeasurementAlgo measurement_algo;
 };
 
 typedef struct {
@@ -73,6 +74,19 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         memcpy(args.rpv, guest->personalization_value, KVM_CAP_ARM_RME_RPV_SIZE);
         cfg_str = "personalization value";
         break;
+    case KVM_CAP_ARM_RME_CFG_HASH_ALGO:
+        switch (guest->measurement_algo) {
+        case RME_GUEST_MEASUREMENT_ALGO_SHA256:
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256;
+            break;
+        case RME_GUEST_MEASUREMENT_ALGO_SHA512:
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
@@ -338,12 +352,34 @@ static void rme_set_rpv(Object *obj, const char *value, Error **errp)
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
+    object_class_property_add_enum(oc, "measurement-algo",
+                                   "RmeGuestMeasurementAlgo",
+                                   &RmeGuestMeasurementAlgo_lookup,
+                                   rme_get_measurement_algo,
+                                   rme_set_measurement_algo);
+    object_class_property_set_description(oc, "measurement-algo",
+            "Realm measurement algorithm ('sha256', 'sha512')");
 }
 
 static void rme_guest_instance_init(Object *obj)
@@ -353,6 +389,7 @@ static void rme_guest_instance_init(Object *obj)
         exit(1);
     }
     rme_guest = RME_GUEST(obj);
+    rme_guest->measurement_algo = RME_GUEST_MEASUREMENT_ALGO_SHA512;
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.44.0
