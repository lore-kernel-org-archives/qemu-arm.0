Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498034ejd;
        Fri, 19 Apr 2024 08:59:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAq9lBTqegPlwPj0x4Oj2Dxn6Fuv2+KfA65iK7NJGAXyyfv5EZwIOZlSt0RXGpDnp+AZKvcrLb+aJJ5GLXqcySisg3/AdF
X-Received: by 2002:a05:600c:a004:b0:417:c329:b52b with SMTP id jg4-20020a05600ca00400b00417c329b52bmr1773602wmb.39.1713542396462;
        Fri, 19 Apr 2024 08:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542396; cv=none;
        d=google.com; s=arc-20160816;
        b=UOch7TzHjO4PEGXfZWBwZaynDHB0MafQZoH9kg2MKOC8BGwkDqSWe/dRY00GzdBq3g
         0iz5fO+nIpPEe1JkdrGGmX1O3qmSKHmuYLY7HSzsx8lri4g3xokoGQ6zWheqw7zyQgDY
         2QrZmT6z8l2VTwbetsn3owCTDXHjTSP3nUTVYejdckFzTOVed7SV7ydXlPi/PFcbvD8f
         BQprtmfvY4qqo22lxKOfIP40e4U83SCvbdBOEI8ooYllSXVblIR64S1sOfHBiqTVkIiP
         NXoBX+kTXsfg6bkJuxy7EGLQsAWuk9vI0a0cidldYh0/zBpbon7lvqoDUsVIcnZ8fw6y
         e5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NGiNId90k9KX3SXTPJi6tPTMfWtWfQF5tgGXpkmGlP0=;
        fh=KgS4DoM0JOS2TqZ9wkAIY+IAApgbzzkttuIbLzw1MPs=;
        b=jkKua+hs3uXPWQoLthRNXeTHQAlD55tl0u220xABaf4THAOb5767Ayk259B1ZTISYC
         4cnnnkP1QAnZw7IaIcx8VvOY+yhU9R6SdWcBV/9iIOMDvfP8pDvwDad2vr1MK84YUZF2
         O7wvt41CTQ1SlVcVFUglU5ZbkyeTasDtmkWdG0IRVguI1F7ftcEuPd2Yj6Nu+6jJJ2Lp
         dCLtQt9ADs7wlGqLuaoa0+JJRb0F1f54NC9L838HRq6GuSQJwsnsiZ8PnUje1aKlENoA
         yjdRzDep3hmIEJoJmXHSRUR80mumEHOR+Cbf9v7Y8R1mO/YBT5S0/tymum/T2tSl8UgS
         uoJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CN8c5Im8;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y25-20020a7bcd99000000b0041745bd50c7sor1330894wmj.5.2024.04.19.08.59.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CN8c5Im8;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542396; x=1714147196; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGiNId90k9KX3SXTPJi6tPTMfWtWfQF5tgGXpkmGlP0=;
        b=CN8c5Im81Grx6WfgRt/JkM47/NUV4uKlEnbbECYip+AKLIK1Lc2Go225UxA+4Hx9F+
         /E+7srmSL6ErX89ElZqq3UzchRW9rmMDzxNldNSb+Dqr7VToitfr6hfxopim0xeHgMD8
         UuP1KaXvVpvMG4rIOxsY/Ch8+N2YLDiOXx6/WIQ2LXIQWmwRkitwMd/27Vt25jQDitfW
         VsDFo99zT0b6X+TsxRTq20SDBhW9oZO0nLaaGtBsNBM6BncxwlEmjjTieXoT5Jmp3+Md
         Q5J//tyWY/YXhrHafMnYfr+jeA258VNCs0UyNq1XGUu54Ye6WlPnXDBrnXDTJu1KXcW/
         iQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542396; x=1714147196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGiNId90k9KX3SXTPJi6tPTMfWtWfQF5tgGXpkmGlP0=;
        b=Es6L97EZCA4BCPN7I0pdROZOlEhs/of+dRjSoQXtk605X4RH0PhuHGruTjTn9xKEWJ
         frzB3gqPnseuL68ERkMzsVlNOQzKLHMNDOHSmih0iSq11cUg3qlWxcTyxf0ydM8R9U0N
         erfEPCBUZUaqAyjns4rIHFxYD9WluY8nlWH4Kd1oqX9S151YdJ/9dFHbxvZx2XdHnKh3
         sw984FmGny9VshuepZ3ax1rqw100mQf7xOPn5SslHYb9c0HkTInNu50EbxHg/Lxk/WHd
         c0AK62irSfy5l+2XATUkBTbjTCMk9Sso9O2njM/40SYN6QxsujO8bzIspwSRifn5irPv
         ILPg==
X-Forwarded-Encrypted: i=1; AJvYcCWfunPD2dLIZj3pum9rFfs1UeNhTE06QOjAmTL6IOiWip0GEFAoeVfCsS+qoabkmigAxzLLTJ9OenbNKjMPal092L5e54Mm
X-Gm-Message-State: AOJu0Yz7pUFdLCIHMQR3acsWWdlKE9UIi2hqpwxXMrArvpE24OuuoufH
	Lqy331ntxZiylCSvBVIZs4/FoD7XHYGHBko7Bdf1Yv7GPnvmfwl//+AFHTFdeRnOpg==
X-Google-Smtp-Source: AGHT+IEhdxtppP9kmHLrBdgwLon9GtWvTfBqcoN9AEI8D9tYjvYBXXyC8l70AMes/yWD0DhD/oFlrA==
X-Received: by 2002:adf:e68d:0:b0:34a:4eac:2e43 with SMTP id r13-20020adfe68d000000b0034a4eac2e43mr1716233wrm.68.1713542396105;
        Fri, 19 Apr 2024 08:59:56 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:55 -0700 (PDT)
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
Subject: [PATCH v2 14/22] target/arm/kvm-rme: Add Realm Personalization Value parameter
Date: Fri, 19 Apr 2024 16:57:02 +0100
Message-ID: <20240419155709.318866-16-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RbHyoHaIpMed

The Realm Personalization Value (RPV) is provided by the user to
distinguish Realms that have the same initial measurement.

The user provides up to 64 hexadecimal bytes. They are stored into the
RPV in the same order, zero-padded on the right.

Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: Move parsing early, store as-is rather than reverted
---
 qapi/qom.json        |  15 +++++-
 target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 623ec8071f..91654aa267 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -931,6 +931,18 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestProperties:
+#
+# Properties for rme-guest objects.
+#
+# @personalization-value: Realm personalization value, as a 64-byte hex string
+#     (default: 0)
+#
+# Since: FIXME
+##
+{ 'struct': 'RmeGuestProperties',
+  'data': { '*personalization-value': 'str' } }
 
 ##
 # @ObjectType:
@@ -1066,7 +1078,8 @@
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
       'x-remote-object':            'RemoteObjectProperties',
-      'x-vfio-user-server':         'VfioUserServerProperties'
+      'x-vfio-user-server':         'VfioUserServerProperties',
+      'rme-guest':                  'RmeGuestProperties'
   } }
 
 ##
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index b2ad10ef6d..cb5c3f7a22 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -23,10 +23,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
+#define RME_MAX_CFG         1
+
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     Notifier rom_load_notifier;
     GSList *ram_regions;
+    uint8_t *personalization_value;
 };
 
 typedef struct {
@@ -54,6 +57,48 @@ static int rme_create_rd(Error **errp)
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
+    case KVM_CAP_ARM_RME_CFG_RPV:
+        if (!guest->personalization_value) {
+            return 0;
+        }
+        memcpy(args.rpv, guest->personalization_value, KVM_CAP_ARM_RME_RPV_SIZE);
+        cfg_str = "personalization value";
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
+static int rme_configure(void)
+{
+    int ret;
+    int cfg;
+
+    for (cfg = 0; cfg < RME_MAX_CFG; cfg++) {
+        ret = rme_configure_one(rme_guest, cfg, &error_abort);
+        if (ret) {
+            return ret;
+        }
+    }
+    return 0;
+}
+
 static void rme_populate_realm(gpointer data, gpointer unused)
 {
     int ret;
@@ -98,6 +143,11 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
         return;
     }
 
+    ret = rme_configure();
+    if (ret) {
+        return;
+    }
+
     ret = rme_create_rd(&error_abort);
     if (ret) {
         return;
@@ -231,8 +281,69 @@ int kvm_arm_rme_vm_type(MachineState *ms)
     return 0;
 }
 
+static char *rme_get_rpv(Object *obj, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+    GString *s;
+    int i;
+
+    if (!guest->personalization_value) {
+        return NULL;
+    }
+
+    s = g_string_sized_new(KVM_CAP_ARM_RME_RPV_SIZE * 2 + 1);
+
+    for (i = 0; i < KVM_CAP_ARM_RME_RPV_SIZE; i++) {
+        g_string_append_printf(s, "%02x", guest->personalization_value[i]);
+    }
+
+    return g_string_free(s, /* free_segment */ false);
+}
+
+static void rme_set_rpv(Object *obj, const char *value, Error **errp)
+{
+    RmeGuest *guest = RME_GUEST(obj);
+    size_t len = strlen(value);
+    uint8_t *out;
+    int i = 1;
+    int ret;
+
+    g_free(guest->personalization_value);
+    guest->personalization_value = out = g_malloc0(KVM_CAP_ARM_RME_RPV_SIZE);
+
+    /* Two chars per byte */
+    if (len > KVM_CAP_ARM_RME_RPV_SIZE * 2) {
+        error_setg(errp, "Realm Personalization Value is too large");
+        return;
+    }
+
+    /* First byte may have a single char */
+    if (len % 2) {
+        ret = sscanf(value, "%1hhx", out++);
+    } else {
+        ret = sscanf(value, "%2hhx", out++);
+        i++;
+    }
+    if (ret != 1) {
+        error_setg(errp, "Invalid Realm Personalization Value");
+        return;
+    }
+
+    for (; i < len; i += 2) {
+        ret = sscanf(value + i, "%2hhx", out++);
+        if (ret != 1) {
+            error_setg(errp, "Invalid Realm Personalization Value");
+            return;
+        }
+    }
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
+    object_class_property_add_str(oc, "personalization-value", rme_get_rpv,
+                                  rme_set_rpv);
+    object_class_property_set_description(oc, "personalization-value",
+            "Realm personalization value (512-bit hexadecimal number)");
 }
 
 static void rme_guest_instance_init(Object *obj)
-- 
2.44.0
