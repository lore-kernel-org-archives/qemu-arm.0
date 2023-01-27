Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232574ejc;
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
X-Received: by 2002:a05:600c:1d05:b0:3d2:3be4:2d9a with SMTP id l5-20020a05600c1d0500b003d23be42d9amr38598425wms.20.1674832564640;
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832564; cv=none;
        d=google.com; s=arc-20160816;
        b=rjF+Os8NmENGLDvxAtjSD5urz8ieztz3bSP+MoPEVg44TMpXjIp3ZCrsAjWRX5NzWD
         mIoqoovmNdQb8JqlSPJe59ev9sdC0K8LtapqAEw0r4KGUSP8YMCPr0S0cl9zZPq7KcUF
         tWDWaysoSExERxUnVUB0srPnVM/pOvzEgOeCs244qXTUXTcR1UuV2YpddOpu4qmj1RXC
         QxfyjBeQIhf/Pnjh2f7jQLDy8sn06zxsJghnJC3rRclf9Son2rFpZersK+5yi3X79G4x
         l2EtDJkiZ2OGVQ91t1/3cPY7YDDfTvkFswbd861NOh2SyeenU9jRvBIoy9dE+mQLGYKj
         GbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aRqhAb+yUzRoO2LrJ58otGlbRPLN5rD92kUg8QGKXw4=;
        b=CGrfK/TI0Ri5QXhttSuZWSCxLA3NKWJpxWqz8XMbRJdjo/zDEEgWXPfyWAIckQPkTH
         nWc5+JzHIinpyuvYjrdGy3elqqDbkRQhsLWWVPbGPo8P36eMpleTcMFF4NExV7sqK0Ej
         IECPkHvkcnedrxly0hNgFK2LIaihoIT2erSsGgkhcjpfDSBDExe1JODAeap1SkJLKoiv
         dU3nyl20f9zSxJwnUK03Vnjw9Os/6jZRMOizsBY9MmVX9mbiw5WicnZbU3E6o5KWbch3
         FNG5QElnG760UXR8R/GzrR8Q6UlqOTn3YkS2lAGBlERN2x522I/YmvOu9Zh0CFziLgAj
         GzrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYZEeYHw;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15-20020a05600c440f00b003dc1b9c3eb9sor1560500wmn.1.2023.01.27.07.16.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYZEeYHw;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRqhAb+yUzRoO2LrJ58otGlbRPLN5rD92kUg8QGKXw4=;
        b=lYZEeYHwrIIra3dNBZgCV34hHx3UOlynnjp5FxQko22E+CRXOsHBsWZh+E0ueUzICr
         XfuOtDFInunehgPdj42FlY0URJmVg5iptpqVH5woWrhqJNFIzypWypGjUoXwZN5MFKyJ
         Ltgc/q3IxkFoQEjICtF2kmwiNfgwj047hehYU0rAMssRO/XivwqDcIG1CFMlOHtEw9aM
         JZyRtzN55s2x+Kv306C7aoxeaJfOzasMM2L0uJk81PFgYQsHkhOj1X1wyjX542D/yT3X
         3clfnr+1uaGh/VAfVrwm92BJIrypJbdbdIma4uqgOEA3ok8CFno+WUzjM35dO37Xfy4e
         6rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRqhAb+yUzRoO2LrJ58otGlbRPLN5rD92kUg8QGKXw4=;
        b=K/kRuFNrc32W7I6AYio33YqTnTtOJPRyzXQdDYGKg2fMOX3Z3AbNZfgDVUhiSjT3Gh
         cdXU1CrU7KpkvMlAslrc2xc9rHFOms9+BJ+wfJOKXeNretJTSyxnvPZdgQ4JBGq7oCEQ
         WkhUVQF8E5yYdhSFhtr3I8HdfH51m0oAWeq/MP6SUmLCN/xuidaiV356rSROVsQ83n62
         nfFhxTLS2dBLeh7JzA4iyXMhxua8nOfuZ54HpjoFlr9LfsF8KVaOmwn5zyN27O23o8qO
         lOF50oQ4hamH8TzgsKU8fz9D8ddHepstOzR525LS/ARFZVEcE9+KwdEWNXUX7Qj+GO71
         Ub3Q==
X-Gm-Message-State: AFqh2krCrDMHkTHsigeLQ5yQHrztPeeAxLp+fdMmwQjJbTqx4pSVPm7f
	EMSfppG5Q8sANEg+2oLEedUOZI25
X-Google-Smtp-Source: AMrXdXvpII8mh+keiDYkiX2HMz2ZdhohTLNeZvUUmnYpNPwpbuEe17sZiE16QDkHSoVzHfHMzySt/A==
X-Received: by 2002:a05:600c:540c:b0:3cf:7704:50ce with SMTP id he12-20020a05600c540c00b003cf770450cemr38573643wmb.38.1674832564397;
        Fri, 27 Jan 2023 07:16:04 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.03
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
Subject: [RFC PATCH 11/16] target/arm/kvm-rme: Add Realm Personalization Value parameter
Date: Fri, 27 Jan 2023 15:07:24 +0000
Message-Id: <20230127150727.612594-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zYhGWot99Xy3

The Realm Personalization Value (RPV) is provided by the user to
distinguish Realms that have the same initial measurement.

The user provides a 512-bit hexadecimal number.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qapi/qom.json        |  5 ++-
 target/arm/kvm-rme.c | 72 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 87fe7c31fe..a012281628 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -862,10 +862,13 @@
 #
 # @measurement-algo: Realm measurement algorithm (default: RMM default)
 #
+# @personalization-value: Realm personalization value (default: 0)
+#
 # Since: FIXME
 ##
 { 'struct': 'RmeGuestProperties',
-  'data': { '*measurement-algo': 'str' } }
+  'data': { '*measurement-algo': 'str',
+            '*personalization-value': 'str' } }
 
 ##
 # @ObjectType:
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 3929b941ae..e974c27e5c 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -22,13 +22,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
-#define RME_MAX_CFG         1
+#define RME_MAX_CFG         2
 
 typedef struct RmeGuest RmeGuest;
 
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     char *measurement_algo;
+    char *personalization_value;
 };
 
 struct RmeImage {
@@ -65,6 +66,45 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
     return ret;
 }
 
+static int rme_parse_rpv(uint8_t *out, const char *in, Error **errp)
+{
+    int ret;
+    size_t in_len = strlen(in);
+
+    /* Two chars per byte */
+    if (in_len > KVM_CAP_ARM_RME_RPV_SIZE * 2) {
+        error_setg(errp, "Realm Personalization Value is too large");
+        return -E2BIG;
+    }
+
+    /*
+     * Parse as big-endian hexadecimal number (most significant byte on the
+     * left), store little-endian, zero-padded on the right.
+     */
+    while (in_len) {
+        /*
+         * Do the lower nibble first to catch invalid inputs such as '2z', and
+         * to handle the last char.
+         */
+        in_len--;
+        ret = sscanf(in + in_len, "%1hhx", out);
+        if (ret != 1) {
+            error_setg(errp, "Invalid Realm Personalization Value");
+            return -EINVAL;
+        }
+        if (!in_len) {
+            break;
+        }
+        in_len--;
+        ret = sscanf(in + in_len, "%2hhx", out++);
+        if (ret != 1) {
+            error_setg(errp, "Invalid Realm Personalization Value");
+            return -EINVAL;
+        }
+    }
+    return 0;
+}
+
 static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
 {
     int ret;
@@ -87,6 +127,16 @@ static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
         }
         cfg_str = "hash algorithm";
         break;
+    case KVM_CAP_ARM_RME_CFG_RPV:
+        if (!guest->personalization_value) {
+            return 0;
+        }
+        ret = rme_parse_rpv(args.rpv, guest->personalization_value, errp);
+        if (ret) {
+            return ret;
+        }
+        cfg_str = "personalization value";
+        break;
     default:
         g_assert_not_reached();
     }
@@ -281,6 +331,21 @@ static void rme_set_measurement_algo(Object *obj, const char *value,
     guest->measurement_algo = g_strdup(value);
 }
 
+static char *rme_get_rpv(Object *obj, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    return g_strdup(guest->personalization_value);
+}
+
+static void rme_set_rpv(Object *obj, const char *value, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+
+    g_free(guest->personalization_value);
+    guest->personalization_value = g_strdup(value);
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
     object_class_property_add_str(oc, "measurement-algo",
@@ -288,6 +353,11 @@ static void rme_guest_class_init(ObjectClass *oc, void *data)
                                   rme_set_measurement_algo);
     object_class_property_set_description(oc, "measurement-algo",
             "Realm measurement algorithm ('sha256', 'sha512')");
+
+    object_class_property_add_str(oc, "personalization-value", rme_get_rpv,
+                                  rme_set_rpv);
+    object_class_property_set_description(oc, "personalization-value",
+            "Realm personalization value (512-bit hexadecimal number)");
 }
 
 static const TypeInfo rme_guest_info = {
-- 
2.39.0
