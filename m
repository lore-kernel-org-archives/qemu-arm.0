Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232564ejc;
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr40652042wmn.9.1674832564011;
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832563; cv=none;
        d=google.com; s=arc-20160816;
        b=F8KP5r5A33ElaUwKY5GlrAw+sx8QitXDsTL9YArzYEDhmV6NpKkcHNPOf4C/Xhb+re
         FvfDYxxamJTkbp/rXJ/svaP+XGaYXX9mT5nL4H9vZELKVY9yfpcoq8B68A8ZZbUBQlSN
         oSuXKVevo7MNtAYjiA+uKpTXuedmyMcpoOEaumYgK4hv7zeaA5PFMi6e9NLaufv2MWFx
         zXRa8gN5qqb6XDDLIVeMPMCbquYN8kWn21px3s0mt3mbAbjhQo1X7znFaZjR/4HfixCH
         f7n3uKRRCRcpNVir44af/HX+48QNy4Xk2volyoFU1++PPmzZZ2Le8LOnoMxXLf1BJFab
         yqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bbNu19WMzaLjGCFMUQxiaofERC3jNZB3M13lh/rHhCc=;
        b=DKAoyGJm7Fppcv31hv+n7lwyfT2ENJyPUgsIEjqcVXZGDTm08QzzUYZzepDqnJ5d0J
         qdha7dpwPFehDqQJoQIG+DuHVke49oy3Hek1jIR9dp8aNhjt6WWXtcfOWI0zKjH5ImCq
         geKjaBGcCdI44YC+2ZbvdwPWsJsBiIijaUPVdgH+JpVjUmwoUtPeW0xsBHQ9MxWjllKp
         iRQj6b9vyO9fttTglZ7MfL5NS4R6NhKaY3faQlYP/nNw0gXc3vOFxC7MBewpVi0ewWmw
         n3dEnL9nrJbvWddfW4l4HFm6lTqs9dK+zg5bHpzQlPJhpBIkE8a4rsfssbUrkC/59O29
         YNqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDHzIbbu;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q9-20020a1ce909000000b003db065ef4e3sor2773814wmc.4.2023.01.27.07.16.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDHzIbbu;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbNu19WMzaLjGCFMUQxiaofERC3jNZB3M13lh/rHhCc=;
        b=vDHzIbbuzPY93SJqQ9+D1zj6THNjFE1vI5VlQp8/B6ZdwPY4v/VTMav34LqWWspTT7
         8zc9ZQ/wsV5LG5aUByL4MPYDTDsAxe/hw5PIrArUWs0USenyEQ2hKpToh4G27Xm3yf5a
         /6C+7aWL0ndySonLO9cOxjTBY98cK1mMEhQRbynORjLyNV4umS1I2aIpslp20SgUFGOB
         t9Ks65xBBgiR2VRjwPTHNmEkUVtrKmtAUm+jkAM4kU+HQAGhZIY8ETk+YAWFzwGOtre1
         93j28ER1xvvWFXI87o3oEmI28qAf0f2aeI473xtOhxccc80jyD10y5QibYZe37rmrcg5
         8gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbNu19WMzaLjGCFMUQxiaofERC3jNZB3M13lh/rHhCc=;
        b=1+mg2JVNwZZ1TI5ZuL/6PENh23c5S4J2029Nrlm/0jPcELVx1L7X1yQg9bgCCaRFGT
         qrgdo9NPYD8nkO0d42fz/96KIM2AvqLhN/uE67FCpdpMUye97UMZp4lZg5/l4vEtnoPH
         PYiFhicfZTevXlpVCi0Vewg8Kmx7GQGBwSsfv13zBaU4omm1q7iq11FcCa8QIn00FZ18
         a3Q60Da1wtpJ9ApN1QIpXXCRP0/1Upk2pZCgykHLp8a23smUZlK8h6+cQURBr8uKKfcz
         qgvGjUX4asrtsPzLkDzzweFR1ns5eJyy06couJYoj9OUa1tIz7b+xWhuahkojwXaf7H3
         mVAg==
X-Gm-Message-State: AFqh2kp5b6h4opgUjif48PFfT8ajfBbUyykCU510NHmSXE2x0jN1/puA
	GNPxu7yns+DEQJpmt2D3c2Xo5t3v
X-Google-Smtp-Source: AMrXdXuioK3g8AxkNhRgcCktwITCMg5N3XY8tLCe+7NRJIyk+QjMeNA3taCtZTXPnYGDCzaXt6hLXA==
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr40652021wmn.9.1674832563598;
        Fri, 27 Jan 2023 07:16:03 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:03 -0800 (PST)
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
Subject: [RFC PATCH 10/16] target/arm/kvm-rme: Add measurement algorithm property
Date: Fri, 27 Jan 2023 15:07:23 +0000
Message-Id: <20230127150727.612594-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nRdwgEjpjzHm

This option selects which measurement algorithm to use for attestation.
Supported values are sha256 and sha512.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        | 14 ++++++++-
 target/arm/kvm-rme.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 7ca27bb86c..87fe7c31fe 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -855,6 +855,17 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestProperties:
+#
+# Properties for rme-guest objects.
+#
+# @measurement-algo: Realm measurement algorithm (default: RMM default)
+#
+# Since: FIXME
+##
+{ 'struct': 'RmeGuestProperties',
+  'data': { '*measurement-algo': 'str' } }
 
 ##
 # @ObjectType:
@@ -985,7 +996,8 @@
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
       'x-remote-object':            'RemoteObjectProperties',
-      'x-vfio-user-server':         'VfioUserServerProperties'
+      'x-vfio-user-server':         'VfioUserServerProperties',
+      'rme-guest':                  'RmeGuestProperties'
   } }
 
 ##
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index c8c019f78a..3929b941ae 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,10 +22,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
+#define RME_MAX_CFG         1
+
 typedef struct RmeGuest RmeGuest;
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
+    char *measurement_algo;
 };
 
 struct RmeImage {
@@ -62,6 +65,40 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
     return ret;
 }
 
+static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
+{
+    int ret;
+    const char *cfg_str;
+    struct kvm_cap_arm_rme_config_item args = {
+        .cfg = cfg,
+    };
+
+    switch (cfg) {
+    case KVM_CAP_ARM_RME_CFG_HASH_ALGO:
+        if (!guest->measurement_algo) {
+            return 0;
+        }
+        if (!strcmp(guest->measurement_algo, "sha256")) {
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256;
+        } else if (!strcmp(guest->measurement_algo, "sha512")) {
+            args.hash_algo = KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512;
+        } else {
+            g_assert_not_reached();
+        }
+        cfg_str = "hash algorithm";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_CONFIG_REALM, (intptr_t)&args);
+    if (ret) {
+        error_setg_errno(errp, -ret, "RME: failed to configure %s", cfg_str);
+    }
+    return ret;
+}
+
 static void rme_populate_realm(gpointer data, gpointer user_data)
 {
     int ret;
@@ -128,6 +165,7 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
 int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     int ret;
+    int cfg;
     static Error *rme_mig_blocker;
     RmeGuest *guest = cgs_to_rme(cgs);
 
@@ -146,6 +184,13 @@ int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
         return -ENODEV;
     }
 
+    for (cfg = 0; cfg < RME_MAX_CFG; cfg++) {
+        ret = rme_configure_one(guest, cfg, errp);
+        if (ret) {
+            return ret;
+        }
+    }
+
     ret = rme_create_rd(guest, errp);
     if (ret) {
         return ret;
@@ -215,8 +260,34 @@ int kvm_arm_rme_vm_type(MachineState *ms)
     return 0;
 }
 
+static char *rme_get_measurement_algo(Object *obj, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    return g_strdup(guest->measurement_algo);
+}
+
+static void rme_set_measurement_algo(Object *obj, const char *value,
+                                     Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    if (strncmp(value, "sha256", 6) &&
+        strncmp(value, "sha512", 6)) {
+        error_setg(errp, "invalid Realm measurement algorithm '%s'", value);
+        return;
+    }
+    g_free(guest->measurement_algo);
+    guest->measurement_algo = g_strdup(value);
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
+    object_class_property_add_str(oc, "measurement-algo",
+                                  rme_get_measurement_algo,
+                                  rme_set_measurement_algo);
+    object_class_property_set_description(oc, "measurement-algo",
+            "Realm measurement algorithm ('sha256', 'sha512')");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0
