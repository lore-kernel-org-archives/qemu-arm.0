Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232584ejc;
        Fri, 27 Jan 2023 07:16:05 -0800 (PST)
X-Received: by 2002:a05:600c:22c6:b0:3da:fc30:bfc5 with SMTP id 6-20020a05600c22c600b003dafc30bfc5mr41084175wmg.13.1674832565517;
        Fri, 27 Jan 2023 07:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832565; cv=none;
        d=google.com; s=arc-20160816;
        b=GfG6wnk1amBWFH8YE5CfaSpmguq07m0oVZLjcVXT3gjzeBmDDLkxLaM9ukU7IdTagN
         5VPelfkCFtD0Lu2uyP+hPGKP/OJ9RnKczEiJvqXg00NSmTJEIk+BMpZtJHsm5TMWTFNS
         f0j2Qq79q5/u0Q06/GeAEUMOXWP5rZfHxXDmaXvc9TddBX2I6KeRIB4SAjLa014bU5uu
         Cum5/FW8VNb+l+TaaVjE+j9PJGW53eMUvCQ/bxCHhkCgCYuqD7Cwkym0L9hgICC1g7jx
         g+qmdo5yo6R4Fl/8BmgnFsALG4/7v+YHxxPkpY2DGHGV+85eFfirruekx2Rt6e4KUA0K
         kaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/yCr2nbr6Ow8T/NrICHyB/xhB72u1bVIcflvvLmkcxM=;
        b=v+ZGE2Rt6MYbsvOdDoSLegTguTUxBNuQ8Nn9iZ4tJJ7435lpc5K4WP7CV411R72KwE
         SIkOT91CZMNOIQ3kgMXq/3EUwwKGndzVeYuTI95UZ5xFSvjLin8DyOzMEOz7XjjBKZmd
         OPJzEvS3N/gpFpFAqjwus4ubj1gXyPqHdeTRyJq9QkNcln1UUHYh8rwTk4mtjEaGxU3O
         4c7iOnL3tHB0+sDhqLQtg0yyMGxTWk1qY8J92QMVTsf65jN5OwVbZ3BldqKuJOtqmVgV
         0JlzVmtW3Ct+lTGQWZvrvy69k7fssuOP7+5fnbs4Bu1Q7n3ZBYlQLOQ4ErbiQUJ/PWO9
         HklA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNt6aTHj;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l4-20020a7bc444000000b003d23e842d39sor1614578wmi.18.2023.01.27.07.16.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNt6aTHj;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yCr2nbr6Ow8T/NrICHyB/xhB72u1bVIcflvvLmkcxM=;
        b=CNt6aTHjGeoDde9QzjkVmzl1CKstQnOSjr0QOvjCKdOzGl8r2NY7C+OMzvqcPJBsui
         a/xTBYuqto0qtHdsw0bVaJPHV+3d45MrCzw9LA2WvSjJksydPpUVEUqAnxhhPGmsFlzE
         vyw0kj9UDuA5CDEMoWvvAufC3aqMgaV/yaPdx/FpJyIg2elCKL60vFcM9T/cF3G129Mu
         0ngFiigLk9WO7q4n4ebEQTk2gmTfzT0IP5IHpXS3J/B1OdqgDpj33XvaRBefKfmvP/3p
         4J3x0AU5o1MEr8K9Sc7ecgQzYhpbpsZQgSSVvAbtNyKMf53y3vT9mYSqCC9IJOfBd/3C
         PEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yCr2nbr6Ow8T/NrICHyB/xhB72u1bVIcflvvLmkcxM=;
        b=j8brhVaT9Szh/WnlUfwxEuSElY+Tu+DAHYGawqfVAkeMJAIKKRt6gBNgwYN+y4eLRp
         F6N80ZvZuTiuAbOXegwV6xFhCb9LWBgMTwc4qOs4pq8kwnNtbwt/V5fEX6bLOHAcwAMK
         b4KCbLh21qF+qty7R8f6YNeK/VmeewE4xyWVfrhFjqqJC94t3BYfL4JxWdbI5G7TqYPh
         C2zH2sgh+C6RLyjYa+5vwvYdkKV+YGzgEH9qLwVjJLOSAV+SqNelc6DfOYqCMbeytIwx
         3mOxAPRcXyMXnZLnhm8wb1RWlGEnG0od8xj/Uh8+UJVvg94Khb5sabOqdp5habJQX0zo
         bMFw==
X-Gm-Message-State: AFqh2krjdM+o0VRrukF+jRjmFOFz5kpjhkJum2zXJcKHUfO3kDRBxT8n
	BENWxTwvejnIXDtysb0YYuFSxuTT83nbUx03mwHmr06r
X-Google-Smtp-Source: AMrXdXv3QtlxQ+gf+hUERFL5yHKdS6vvVDRQi+5gQuQEKsme6aTFAvNeh2NA8GVZA57aOwFXs3PqPA==
X-Received: by 2002:a05:600c:1e08:b0:3da:f443:9f0f with SMTP id ay8-20020a05600c1e0800b003daf4439f0fmr41032630wmb.18.1674832565225;
        Fri, 27 Jan 2023 07:16:05 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
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
Subject: [RFC PATCH 12/16] target/arm/kvm-rme: Add Realm SVE vector length
Date: Fri, 27 Jan 2023 15:07:25 +0000
Message-Id: <20230127150727.612594-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +/n4XQyGRisU

The Realm configuration takes a SVE enable and vector length parameter.

We cannot reuse the -cpu SVE parameters for this because that
information is needed at Realm Descriptor creation which must happen
before VCPU creation.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  5 +++-
 target/arm/kvm-rme.c | 68 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index a012281628..94ecb87f6f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -864,11 +864,14 @@
 #
 # @personalization-value: Realm personalization value (default: 0)
 #
+# @sve-vector-length: SVE vector length (default: 0, SVE disabled)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
   'data': { '*measurement-algo': 'str',
-            '*personalization-value': 'str' } }
+            '*personalization-value': 'str',
+            '*sve-vector-length': 'uint32' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index e974c27e5c..0b2153a45c 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,7 +22,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         2
+#define RME_MAX_CFG         3
 
 typedef struct RmeGuest RmeGuest;
 
@@ -30,6 +30,7 @@ struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     char *measurement_algo;
     char *personalization_value;
+    uint32_t sve_vl;
 };
 
 struct RmeImage {
@@ -137,6 +138,13 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         }
         cfg_str = "personalization value";
         break;
+    case KVM_CAP_ARM_RME_CFG_SVE:
+        if (!guest->sve_vl) {
+            return 0;
+        }
+        args.sve_vq = guest->sve_vl / 128;
+        cfg_str = "SVE";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -346,6 +354,52 @@ static void rme_set_rpv(Object *obj, const char *value, Error **errp)
     guest->personalization_value = g_strdup(value);
 }
 
+static void rme_get_uint32(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+    uint32_t value;
+
+    if (strcmp(name, "sve-vector-length") == 0) {
+        value = guest->sve_vl;
+    } else {
+        g_assert_not_reached();
+    }
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void rme_set_uint32(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+    uint32_t max_value;
+    uint32_t value;
+    uint32_t *var;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strcmp(name, "sve-vector-length") == 0) {
+        max_value = ARM_MAX_VQ * 128;
+        var = &guest->sve_vl;
+        if (value & 0x7f) {
+            error_setg(errp, "invalid SVE vector length %"PRIu32, value);
+            return;
+        }
+    } else {
+        g_assert_not_reached();
+    }
+
+    if (value >= max_value) {
+        error_setg(errp, "invalid %s length %"PRIu32, name, value);
+        return;
+    }
+
+    *var = value;
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
     object_class_property_add_str(oc, "measurement-algo",
@@ -358,6 +412,18 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                                   rme_set_rpv);
     object_class_property_set_description(oc, "personalization-value",
             "Realm personalization value (512-bit hexadecimal number)");
+
+    /*
+     * This is not ideal. Normally SVE parameters are given to -cpu, but the
+     * realm parameters are needed much earlier than CPU initialization. We also
+     * don't have a way to discover what is supported at the moment, the idea is
+     * that the user knows exactly what hardware it is running on because these
+     * parameters are part of the measurement and play in the attestation.
+     */
+    object_class_property_add(oc, "sve-vector-length", "uint32", rme_get_uint32,
+                              rme_set_uint32, NULL, NULL);
+    object_class_property_set_description(oc, "sve-vector-length",
+            "SVE vector length. 0 disables SVE (the default)");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0
