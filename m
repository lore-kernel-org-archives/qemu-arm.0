Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1571136njc;
        Mon, 25 Nov 2024 12:01:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUeoZbGnw+aiLuF34Tjwqg1JZ10MPWSWFo0r207FJAGg4R9F02wdGeSpHF11rRcXWVezYTn/5yQXI2Btg==@linaro.org
X-Received: by 2002:a05:600c:46c4:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-433ce411003mr128107135e9.4.1732564770818;
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564770; cv=none;
        d=google.com; s=arc-20240605;
        b=brllX5seFpO/wzQPr7m72RMp6ebi0TywA4y3k0ktkzOZLPecPqiOpDomcuBFUG3ecx
         ptRooJFEUPgA9JsYAtPOYKYLXasy0RN69sBm3EJQQWevKwpDpuFQcIWNGrnRwdh+6c/1
         DKlYsYjRN8lf5y8z4TnMQrzqBbzssItg9m0vOMq1LPDG60hCxpbPMi7jf/93pACpLXLa
         ejQ939gQoRev1ejGcEkqYAK0gKW3zFokhLa/FT7ysC9McMb56hOoHsMMp9LsW6ua966J
         QgW4gO/bujFvze2pa6tWNQle/sVyYorLIO+xSVdIEK+3+TfouQNZEsansaZi+bR/BvPf
         hb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0m2/9HP5vLC3hqAB+yCWUJo/ObLxgmWN4DQPmhXmpqg=;
        fh=0qmnrhgR2zXM3zNdhwF78DfpBfVjrFQujq+Ma1eqb+g=;
        b=btB9KyGuXJdHIs8cGl02GyxhkB+Frzh34Zq1OHNY3pry1hLaWarAHT9I8L2JHW9LW3
         OFQE7XusmRat8gaXUVyRZE2MENJpMU2QwbN+PQzSc1cYQppPAFkOfXVu61RvInRlBZGy
         lrQzALMt8ZvE2M5Z4bTOoCpcAXuOrqR71f4K/g2cJwjZ9Sl3Jz7g26CGbtM717xd8ZCG
         kUlcHhTA4dlqYGpamchY1B0COMpU46cFu/WSiiGXx4I8X5i5ivM0a1d2kzIg495vqfEw
         7Tj4pWcK0a7pj5SoOgQXShh3esim/oKRR2bAk01tCo01FJsIocDPNdYb/hVsp5VyoYHN
         fxrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akWE0Wa5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a02d8cbesor11412725e9.6.2024.11.25.11.59.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akWE0Wa5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564770; x=1733169570; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0m2/9HP5vLC3hqAB+yCWUJo/ObLxgmWN4DQPmhXmpqg=;
        b=akWE0Wa5WwB63uIVcI6BOA2lW03GNjcv3+W4BmVHXH47WY0E9B0CUDygH6FOf3MIh6
         KcpYorQ4KJIRuJV7wR3aURwaRVrW06PsUiNso9WB5qjEnqlz8PEnvKL8dARR4M8Uw6Bd
         dyDP2ztWiScHw+cw+0HYfMh90ffm8+3AEgNrQ6kd94W+LddMxVYqTR0nAW4QoHDmlU0s
         qdx8wNwMnUr9BJIOn+EziWxaGeE3+3yUtTCs5OdapNVLPc0084NXJZkhz5Z2iP3LTMKw
         f/goi2fqX3gkRPa2qESwmN52wE7RlvDHDNhbxI48KLT4JuskWSMkWA1PXZIUy+pebCy9
         ycLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564770; x=1733169570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0m2/9HP5vLC3hqAB+yCWUJo/ObLxgmWN4DQPmhXmpqg=;
        b=uOe2CNCPVqnb4AWisRrmF4PwRljcgt+r74ZW6tVRbmJMmfCfnzlTKCNUENnFiwhxUO
         R0YqPm4EVJPh0fmfqNHspVdQ1Uw5uwRFwaOLoc4wy4MFtQXRbpzOO5mKw4k2sW4/RUxO
         6WT2k10kyGWu8IkMBZ9IUWbXHJi1EtscGnApvYzlgF1XOWVJh8REwDQSNCUM9PDkyw2F
         O54QxBAnNKeK38mgup5/eLfCrzq3kq4aJBDzP/Eo4eRJ81PGRiuFqZ6oAaOYi4X0743W
         HE9DqQHAYn23xLmFGP3VhCARUdom4v9VNgCDVeQRN+HTOgUzWQfrZt7tuC6UpGlAr08p
         /Ibw==
X-Forwarded-Encrypted: i=1; AJvYcCW/3oafEWWygG9hLwMyeKeCHz+bSK6ke3gZ37tbzYfAuBSV7eh/XulXD31N23GUKSg1HyoS+iQ1Zbs02g==@linaro.org
X-Gm-Message-State: AOJu0YyntWMpuapuZAP9oEVoL3nHjxNsPZZKwlhbKn36gZSNmeAIEWX7
	L0Y4NUW4pOk6NmJKHq8jGxFtAxJzJHo14bEXYIOess27XADc8sZ+dNv+9mosWooBDw==
X-Gm-Gg: ASbGncuMgpCbuwwU6v2pMH+E2kFY23x1hyAM0OueigUJxxeEhrMCaIpCYuq71+2KC9w
	d3LMcW4sturFHmfDNOmVwx5GMqrfyUmkSLYv9gdJ+/YinW/7Yi32ZPW0FK20TI5t3JtBiX/P3Cd
	zo4DWoN1Lvx9bp5SLLByEUvmh6UdPNBHveT6Rv3kDZHlhi0OaCP3K61wXod8qIWaoMgE60wyL6N
	VeiRRUh6d7si2gQh5zM66zt8Zzk9FWOiftIKjpkmkL6t6XBQAtqtmu1pZEshLVFN4wT
X-Google-Smtp-Source: AGHT+IHIgHFWvVyyJCi5WA7qSU1TvSslIX+EBQ+ux7JHA9WcmEKKX7xGvPmRb34R9SzN6GO/cTMdzA==
X-Received: by 2002:a05:6000:2d08:b0:382:50d9:bc7c with SMTP id ffacd0b85a97d-38260be6bfamr7331722f8f.58.1732564770312;
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.29
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
Subject: [PATCH v3 10/26] target/arm/kvm-rme: Add Realm Personalization Value parameter
Date: Mon, 25 Nov 2024 19:56:09 +0000
Message-ID: <20241125195626.856992-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YhHMV0dSLDYY

The Realm Personalization Value (RPV) is provided by the user to
distinguish Realms that have the same initial measurement.

The user provides up to 64 hexadecimal bytes. They are stored into the
RPV in the same order, zero-padded on the right.

Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: Fix documentation
---
 qapi/qom.json        |  15 ++++++
 target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index a8beeabf1f..f982850bca 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1068,6 +1068,19 @@
   'data': { '*cpu-affinity': ['uint16'],
             '*node-affinity': ['uint16'] } }
 
+##
+# @RmeGuestProperties:
+#
+# Properties for rme-guest objects.
+#
+# @personalization-value: Realm personalization value, as a 64-byte
+#     hex string. This optional parameter allows to uniquely identify
+#     the VM instance during attestation. (default: 0)
+#
+# Since: 9.3
+##
+{ 'struct': 'RmeGuestProperties',
+  'data': { '*personalization-value': 'str' } }
 
 ##
 # @ObjectType:
@@ -1121,6 +1134,7 @@
     { 'name': 'pr-manager-helper',
       'if': 'CONFIG_LINUX' },
     'qtest',
+    'rme-guest',
     'rng-builtin',
     'rng-egd',
     { 'name': 'rng-random',
@@ -1195,6 +1209,7 @@
       'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
                                       'if': 'CONFIG_LINUX' },
       'qtest':                      'QtestProperties',
+      'rme-guest':                  'RmeGuestProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
       'rng-random':                 { 'type': 'RngRandomProperties',
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 83a29421df..0be55867ee 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -23,11 +23,15 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
 
 #define RME_PAGE_SIZE qemu_real_host_page_size()
 
+#define RME_MAX_CFG         1
+
 struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
     Notifier rom_load_notifier;
     GSList *ram_regions;
 
+    uint8_t *personalization_value;
+
     hwaddr ram_base;
     size_t ram_size;
 };
@@ -43,6 +47,48 @@ typedef struct {
 
 static RmeGuest *rme_guest;
 
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
+        error_setg_errno(errp, -ret, "failed to configure %s", cfg_str);
+    }
+    return ret;
+}
+
+static int rme_configure(Error **errp)
+{
+    int ret;
+    int cfg;
+
+    for (cfg = 0; cfg < RME_MAX_CFG; cfg++) {
+        ret = rme_configure_one(rme_guest, cfg, errp);
+        if (ret) {
+            return ret;
+        }
+    }
+    return 0;
+}
+
 static int rme_init_ram(hwaddr base, size_t size, Error **errp)
 {
     int ret;
@@ -123,6 +169,10 @@ static int rme_create_realm(Error **errp)
 {
     int ret;
 
+    if (rme_configure(errp)) {
+        return -1;
+    }
+
     ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
                             KVM_CAP_ARM_RME_CREATE_RD);
     if (ret) {
@@ -168,8 +218,69 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
     }
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
 
 static void rme_guest_init(Object *obj)
-- 
2.47.0
