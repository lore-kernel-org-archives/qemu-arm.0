Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232593ejc;
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
X-Received: by 2002:a05:600c:3d96:b0:3db:26b7:2fc8 with SMTP id bi22-20020a05600c3d9600b003db26b72fc8mr31141580wmb.39.1674832566215;
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832566; cv=none;
        d=google.com; s=arc-20160816;
        b=BSt5OHWght3afTvTkl2YrrTEn6Q2a+Y1AW+zAHk17VPh0S1SQSZseSuio2MBOOUdtV
         3D/rhx2cMBHhGa97SeZUVRhDrjkcncHOvKs700Nu4BdpuyOXrFmoWjCj3bSVuAlDNSrB
         xFREDfM4kDreuipTWthJ0ypvvcKYr64u1G7vAx46w3+4lJZSpZNmO+iI4/LhMoLlnbpt
         y6RJI+SiF5BpxfmJUDBR1/VeWKla3GK/zmp1QtMqvUnGSzSTjUOomVdXXz1rgnWLBBXv
         XsC20oD/8ekEeIsiaQiz1MIthbOHIC61Y8tWhMTXpvDol9BuAgyjxKEGJrKmrZ40bgRw
         s8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V2C8ym8is1CPYbe6HBHqeDtoLk1afh8VUgAOi79KyjA=;
        b=ghih1+XdNBu8dGSBIu9q5qdZZOA7VA8JpFz0Bv1NZIuJhCMP1vBo0pq74kmQoUb6mK
         QLemB9CMZBWDXNNfbce8aOpHPnS7SEYrbZvDDjUL8YJsPK8Y+Va9lr/cUr9fRgGqVBKm
         uS2CWBLogNv415gS6hIBiqSFrei1RWYXlePct0Rf5CbencmFXBDmwPQ++0OfQCMM4yup
         I53oyAzkfqcK3/vnMzrO0hblyV/3UJWUrmh4GuUoCZRpgSjPeSo9n7mR28wEXwDnRVOb
         4+K3GvRRGXU8IqHZkbQ4mU8hPWQWoSmmvqWFLx5SQdm/lr3q49YNte30WkNTufvQWhUI
         DiNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7mwAN6i;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y24-20020a1c4b18000000b003daf66d3522sor2704813wma.44.2023.01.27.07.16.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7mwAN6i;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2C8ym8is1CPYbe6HBHqeDtoLk1afh8VUgAOi79KyjA=;
        b=s7mwAN6iwR1Yf/RhvBpaZy7wHKwUfdOmrONVLHMtlMQ9jpePl/3OubN4tVZkAB2ntH
         UmqzkbSf6+HRcCSwxA8Eh1Yfkrx65L11zu0AzegLZ06x/A29sSkCsA+2kHgVCoJPmiqg
         AANnok2MzEDg134sXcVtijtQyp/Tn28+oj/wlqNbwHJMc5v4Oe7VETLN77Azfo42ss+0
         ENVO+dG6ZGtiEun3UaB6clmmQF+DYu814B1D2NlfOvXDKLABSKoV7Zeyrp/UTaCJ6wFF
         9JllU7HlhyCYry7q39UkzwfdTmlUspKXhZJpys9/l9gDhhEylzPYeCD/QkD6SRV0LYCW
         28aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2C8ym8is1CPYbe6HBHqeDtoLk1afh8VUgAOi79KyjA=;
        b=6MLFyNAS00ZunHnEagK56EQg9aA2C38Uf87DapCG7wg5pRM+NJ4QTk9RuRFEm5/EpX
         Eahs3klzsWzBCOHBv4YhG9To4K3JDPyu5StRw1RPKCFEzscMLUk+qVaMHrziEN1T6Wco
         6v80HyUs1BEZEDOIb+ULA0js/ZO/DjkNba4D9OSMoNN0xZDRgsJDBCcApRyG4ZGKsdJ5
         jvjb5f9th9tLM/n2d/SlLvFlNQzZRrT7gZNAZ84b/XZjKGDWiSk6qsSb6IqyBuovNk0f
         HIm2SHOa2Qj1TNPF0AN9udv2ZSTH8Wwy8PHSPTdzPICHHv2qDOZCNmWtaBRPT5aoQYUI
         EDQg==
X-Gm-Message-State: AO0yUKXxUG8EtgnoKIOShcIGXLdG3vAleNsPKwUXeDEfHKuTSvwvX1e+
	4SuiGPwOXl6gPyvAHTvNyJfZWg4/
X-Google-Smtp-Source: AK7set/q19d4BBJOiVPaxHB2Y4QlBcQjF6fwBnxYMemjW0hkO6/cTM6gtypfWGJ7NyKxDqXtET9E8A==
X-Received: by 2002:a05:600c:1551:b0:3dc:18de:b221 with SMTP id f17-20020a05600c155100b003dc18deb221mr12053778wmg.21.1674832565936;
        Fri, 27 Jan 2023 07:16:05 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:05 -0800 (PST)
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
Subject: [RFC PATCH 13/16] target/arm/kvm-rme: Add breakpoints and watchpoints parameters
Date: Fri, 27 Jan 2023 15:07:26 +0000
Message-Id: <20230127150727.612594-14-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FYorWCiOeIR3

Pass the num_bps and num_wps parameters to Realm creation. These
parameters contribute to the initial Realm measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  8 +++++++-
 target/arm/kvm-rme.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 94ecb87f6f..86ed386f26 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -866,12 +866,18 @@
 #
 # @sve-vector-length: SVE vector length (default: 0, SVE disabled)
 #
+# @num-breakpoints: Number of breakpoints (default: 0)
+#
+# @num-watchpoints: Number of watchpoints (default: 0)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
   'data': { '*measurement-algo': 'str',
             '*personalization-value': 'str',
-            '*sve-vector-length': 'uint32' } }
+            '*sve-vector-length': 'uint32',
+            '*num-breakpoints': 'uint32',
+            '*num-watchpoints': 'uint32' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 0b2153a45c..3f39f1f7ad 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,7 +22,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         3
+#define RME_MAX_BPS         0x10
+#define RME_MAX_WPS         0x10
+#define RME_MAX_CFG         4
 
 typedef struct RmeGuest RmeGuest;
 
@@ -31,6 +33,8 @@ struct RmeGuest {
     char *measurement_algo;
     char *personalization_value;
     uint32_t sve_vl;
+    uint32_t num_wps;
+    uint32_t num_bps;
 };
 
 struct RmeImage {
@@ -145,6 +149,14 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         args.sve_vq = guest->sve_vl / 128;
         cfg_str = "SVE";
         break;
+    case KVM_CAP_ARM_RME_CFG_DBG:
+        if (!guest->num_bps && !guest->num_wps) {
+            return 0;
+        }
+        args.num_brps = guest->num_bps;
+        args.num_wrps = guest->num_wps;
+        cfg_str = "debug parameters";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -362,6 +374,10 @@ static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
 
     if (strcmp(name, "sve-vector-length") == 0) {
         value = guest->sve_vl;
+    } else if (strcmp(name, "num-breakpoints") == 0) {
+        value = guest->num_bps;
+    } else if (strcmp(name, "num-watchpoints") == 0) {
+        value = guest->num_wps;
     } else {
         g_assert_not_reached();
     }
@@ -388,6 +404,12 @@ static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
             error_setg(errp, "invalid SVE vector length %"PRIu32, value);
             return;
         }
+    } else if (strcmp(name, "num-breakpoints") == 0) {
+        max_value = RME_MAX_BPS;
+        var = &guest->num_bps;
+    } else if (strcmp(name, "num-watchpoints") == 0) {
+        max_value = RME_MAX_WPS;
+        var = &guest->num_wps;
     } else {
         g_assert_not_reached();
     }
@@ -424,6 +446,16 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                               rme_set_uint32, NULL, NULL);
     object_class_property_set_description(oc, "sve-vector-length",
             "SVE vector length. 0 disables SVE (the default)");
+
+    object_class_property_add(oc, "num-breakpoints", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "num-breakpoints",
+            "Number of breakpoints");
+
+    object_class_property_add(oc, "num-watchpoints", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "num-watchpoints",
+            "Number of watchpoints");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0
