Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232599ejc;
        Fri, 27 Jan 2023 07:16:07 -0800 (PST)
X-Received: by 2002:adf:de04:0:b0:2a9:89e:2b53 with SMTP id b4-20020adfde04000000b002a9089e2b53mr34958616wrm.45.1674832566910;
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832566; cv=none;
        d=google.com; s=arc-20160816;
        b=DcjUF5BTcXhFvfoohT9NGo1IWdu+4UJ9wltUM3KfzQkvMozIKV4Ok6EzDZOxjlH/Hz
         oHZXUXC8NCu3bbl5vYSAfZ0h3zLnsGuH5S+hu4HnwJEYNYFsa2bPP6rJpS3YPBpVb65B
         IWy3IVjOvubJVmJVrP9aM665TQEI40ImIpYXcleWmIr9JgMZ3SCPeKeuUuxZUMHy6aZs
         5rkZzxjfNxbjOPMbEPf8lTLDNjUfQhNdqtRMjk3yoK+PSR7Fc/uk7C6QAwQlhf0Uc572
         dV2ZowREKv2yh0gbIb2MX5IMyYOm7EEkPjJ+QhybdKv3KWlTT31HW1xVn5BbUtrz4gEO
         d5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OVsmj85ALmOgtCiDtTlLrbkojrzYJRmCVUkA1PDs0hI=;
        b=GJd6UCgFp48/iMKRX7tF/UKF4r6utPhfAXlcJSbe7W7Pc/KlDxEmcgfNpz/LB74uV+
         RCxKtHYEIwnsbkHppDvkzNN49an/Xc8kkOxzWhneRKQMyd7E9h+rVFnHCaWCfeBOt8CO
         3kR3buyJjZSp49MLq458DVV7/yu5pTRbiYSN/t4VFggpf10/j8NLwBI7pEKf6OvBkbfx
         7V5wUGGdv8QCMvGSuXUQcJF3dq9P4F5RP1iqMmSm+fQsGuMBEI69xjSbv9GKvVQqQ1BX
         +e2M3pf66gGfyKGQyAcjxQvK6EAFSo9u8/LVLRAhN1bgNZgW6h04FIjZOxMFpYsquCs9
         cyoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSdn30aU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n25-20020a05600c3b9900b003daffc3a551sor1645797wms.15.2023.01.27.07.16.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSdn30aU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVsmj85ALmOgtCiDtTlLrbkojrzYJRmCVUkA1PDs0hI=;
        b=pSdn30aUderHGq2l+XKDB7XFOzcA6XvNVG0TE4pbtfSq3Nv01Qf8usjCWUh1YfzZMD
         a8T4a9YeQdEeYHZpsi4AISoFNJMW24EOFuvBiHNlp1lQEIvqL3nEOiX91DsvxW8omtwq
         AxILQURVQitF6+6aYOItxcR1siQbDYtyd2Gl9aSd5xjZ6J9hKombHzZ3ZofC40LMK5t1
         JZFDsh5MiY6Mgyor4E8gBWWkIqckipAzSmVcjXWYleUalvax9bdp3YHbVoxdVMwqa0Gc
         tuQ6Upwt53NFaUGC7rdYoE0ZbJiwUvpXlIvntGkZF5GSnZSLq0h+uZsl8kvQp6YW9KIn
         BiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVsmj85ALmOgtCiDtTlLrbkojrzYJRmCVUkA1PDs0hI=;
        b=WVfz9HkarP1xjtZmAOU1PYg6ve6ZiJzBzWms+D7egfSlDWYKkUPi7m4w8RdTYiZH2V
         BQAzs/SKJPnWyCWNJXGF4HsTLxQVWzKZPNCewm1Maw7iCyhPnhwrPtXYJwlVAKAMDLie
         DvIckYlyNmMl+cSjSONJRB9VX1M8UWZdGsUZS/JQzuS8OCagfk/6teCMtHzcbFVzIdpe
         jeYaGXiL5XeBv32ieL+HDiIR66uaZ+O3fC3xxMv5Ui33egD5ulsWYXnVV48YIl0HGILO
         pSSdwEN55o4ckBwg+yDN6Fvfmld4qpXqrJOJFRhYYnDqpdlBHAFx+VFXgk0N4ONHHsDp
         xYbQ==
X-Gm-Message-State: AFqh2kpniAMWTnqqKWkWHwftUmKfc870wRJvSnTseSFSBAjqIITMXwku
	ilJkaDjZSaLOW19QO4sREmuvRBYc
X-Google-Smtp-Source: AMrXdXvCyrrdBD4txmyM1581ANSCEcootkshX6S5ODTUKCWuBV6wWHsSOnDVnc556NQ4gvwBSGQDXw==
X-Received: by 2002:a05:600c:4d93:b0:3d9:efd1:214d with SMTP id v19-20020a05600c4d9300b003d9efd1214dmr39903164wmp.25.1674832566675;
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 14/16] target/arm/kvm-rme: Add PMU num counters parameters
Date: Fri, 27 Jan 2023 15:07:27 +0000
Message-Id: <20230127150727.612594-15-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8E1IImDHekPN

Pass the num_cntrs parameter to Realm creation. These parameters
contribute to the initial Realm measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  5 ++++-
 target/arm/kvm-rme.c | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 86ed386f26..13c85abde9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -870,6 +870,8 @@
 #
 # @num-watchpoints: Number of watchpoints (default: 0)
 #
+# @num-pmu-counters: Number of PMU counters (default: 0, PMU disabled)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
@@ -877,7 +879,8 @@
             '*personalization-value': 'str',
             '*sve-vector-length': 'uint32',
             '*num-breakpoints': 'uint32',
-            '*num-watchpoints': 'uint32' } }
+            '*num-watchpoints': 'uint32',
+            '*num-pmu-counters': 'uint32' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 3f39f1f7ad..1baed79d46 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -24,7 +24,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_MAX_BPS         0x10
 #define RME_MAX_WPS         0x10
-#define RME_MAX_CFG         4
+#define RME_MAX_PMU_CTRS    0x20
+#define RME_MAX_CFG         5
 
 typedef struct RmeGuest RmeGuest;
 
@@ -35,6 +36,7 @@ struct RmeGuest {
     uint32_t sve_vl;
     uint32_t num_wps;
     uint32_t num_bps;
+    uint32_t num_pmu_cntrs;
 };
 
 struct RmeImage {
@@ -157,6 +159,13 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         args.num_wrps = guest->num_wps;
         cfg_str = "debug parameters";
         break;
+    case KVM_CAP_ARM_RME_CFG_PMU:
+        if (!guest->num_pmu_cntrs) {
+            return 0;
+        }
+        args.num_pmu_cntrs = guest->num_pmu_cntrs;
+        cfg_str = "PMU";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -378,6 +387,8 @@ static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
         value = guest->num_bps;
     } else if (strcmp(name, "num-watchpoints") == 0) {
         value = guest->num_wps;
+    } else if (strcmp(name, "num-pmu-counters") == 0) {
+        value = guest->num_pmu_cntrs;
     } else {
         g_assert_not_reached();
     }
@@ -410,6 +421,9 @@ static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
     } else if (strcmp(name, "num-watchpoints") == 0) {
         max_value = RME_MAX_WPS;
         var = &guest->num_wps;
+    } else if (strcmp(name, "num-pmu-counters") == 0) {
+        max_value = RME_MAX_PMU_CTRS;
+        var = &guest->num_pmu_cntrs;
     } else {
         g_assert_not_reached();
     }
@@ -456,6 +470,11 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                               rme_set_uint32, NULL, NULL);
     object_class_property_set_description(oc, "num-watchpoints",
             "Number of watchpoints");
+
+    object_class_property_add(oc, "num-pmu-counters", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "num-pmu-counters",
+            "Number of PMU counters");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0
