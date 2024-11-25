Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569384njc;
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGfoKMH/NF3UgZ5RjvaYtvLlwt3x2ghdqbWZsynYlBm7z2k5wTkuBRVn6xtQaIjMFk58QjQFb/YgnNHA==@linaro.org
X-Received: by 2002:a05:6000:2807:b0:382:3816:f50e with SMTP id ffacd0b85a97d-38260b89dffmr8549017f8f.34.1732564778388;
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564778; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYQq2aVw30eUMcbH9IKme7W8zpZSpki82zkQ0vykddhCbzw+DuX1ZMGCYYSK7jaJAK
         ELGP4VDi4B96JtRvTqcJsuEx7uW3fP8Ii+jp2a74mwwenNO+4oCmw0UWXJf9G/zkL+YD
         GD7dC4luNIMIJ3/dOtchu/e6WbpnxGFAcSRBxMlkw71eif76Hr5NUfstnLd0smCwHfai
         niJBW56UEuqQcfVoqqJCvmaT4CDrKf3syyE2mQltK7ARG3yzycj5vfaOyaJB4nWYuqbG
         PNHYwaiJ1Wqwm5uBzvz6EY8FqmYSKu8ALQewoN+zdS+Q6Oxv8KOwwdYhPqjR5CajwniV
         WS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gw4CAtCWZHkyS6PsIdGnG26rQiDW6W2BIcqFa8xSXq0=;
        fh=qZMGp2eeNRPDybKlsBm9Y9sF33z5T0OI82YFoPrF7t8=;
        b=VxPIZb4uBQTKx8Diw/kXUSfwzEhCSxFRLlQOVFUYrgx7zvc47dIpjBxPBANQ/gFJ0n
         bohh3YSByMeFQ2KyNGDnxIty1imc+J/6JxSX4iOmA7mIlGoLQeYQmtB6VhXUwuA4fOXC
         +kUVnXvkZBVLFElscOJh/4GEK4Qun9oKUBv5rS03KQPuCbcFOYEoldUTsrHe5C+cwVf9
         u52WCXT8cR63ZXryF/a+lE9ixgZ7Bsse8bYkVgl7Ixp+96iOnpDvXlwF26paEtxJzoWO
         hI0Ck86UaxG7QnCkXlN+Fa/wS+7rC/OzgQSUgvmVHDsscSi9SmE5Pe2GFa834D5ItvKZ
         i87Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HG5m4mdE;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3825f990ca0sor2154564f8f.0.2024.11.25.11.59.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HG5m4mdE;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564778; x=1733169578; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw4CAtCWZHkyS6PsIdGnG26rQiDW6W2BIcqFa8xSXq0=;
        b=HG5m4mdEgg/PPOxp8PIu8f58QqTjJXnqdHra8AVNvWiR+JalarwplI5Pv2AXtEEMRA
         qvf+gb5KdibrrgcYXy6buZRhuxIMHq4K7lyQlbruZaL92TMVRFoi+7XkDJyYlu6X76Kh
         58Md75pCfzJmFATaI+HL14XOQ7BtvF344pD4ys0Iy7OssQitsHpK8qvbaP9w4/iZ8XIw
         HJcc90V3i1JqZvAJCr+ovY0vbs3wXxbeJDk34YTl3eRtQD76YSjm3tRX5TDM33WoR0I8
         URYk9O9GsxgKBgs4SX04ddNSGp496Obp7Rtueoyr09BMZ0snyy05P/b+6QN4lMRL5PXM
         4R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564778; x=1733169578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw4CAtCWZHkyS6PsIdGnG26rQiDW6W2BIcqFa8xSXq0=;
        b=MRvXX9j5GBVEN+7zw4oAirb3uDwCwBH8uj+Es2k7nIv/QXxQoLpXbev3T7alh0qIGe
         1AQh9fBeqV9l/djKhFoLWRq4v8YTSew9B/MPkZTRPn5UILRQpDG+hTCD37SOHq7/5le8
         wEi+nI/Q+00hvmJfGdLRfxneQ1O5PuLuoGWkL2RasMdoE4x6SCdiixDzCDN3RjV63nbi
         9RNcfg4ahbkWahU9OCZYS+xyA2qCnNchOqF4VuTsKxEcOL5llo+YkX7tAtNR/bVXpuND
         n9Dfs17o/ZcS8opbtywNN+zCIDxYUyZoWYh/VTfYvZd/KCKH6Azhv/QMO8tMPoYv9cw6
         mlKA==
X-Forwarded-Encrypted: i=1; AJvYcCU0OqzcWeDGuMzh+GuRCHqIvq/sIuWQUM2ItZahIU6fuWA1a0tq9AnbPAu7gvVIqFqTtSY14gjvIiQkzw==@linaro.org
X-Gm-Message-State: AOJu0YyHYGr4/ggqeD0QoJw30OKm0GpI84nl7QB2rTa7m7KcWEK8XhDY
	2CdaGfAe9/+vlOn0Z6nT4jFTn4jvmWe7agzmeCgua7xy8j5FlPZuQO47kzXozInXNw==
X-Gm-Gg: ASbGnctw/RFYjmXqXO+xsGQo71Jli6rbcdJUJPxahPPKr+kb8B/eYe5vS7x13qiFYeN
	GhVHChX1Pehgoy8K0ptE6fg9VH/kAC8reXcrpwI48/paWvHcAsJsqNzKyoGIf7tI/WASUULEyDr
	nqwracHpGO/ANnVF/yXFiiUMgLdDzWU3YrMIygn0wh0T2J++/KBHDBfk861YzIAo+UDLmtadggs
	wnBTQ+BWA5BaC7ElaMhxLhl3KxwDW+LBraFl2dUv3Tcr/g5tW4eFEYkrJWMmmu0CbkK
X-Google-Smtp-Source: AGHT+IEzg8tSZSzM5M7PAnv/+rwiNHPuZQSFt85fVuX8MRm2KzuXcWmnFXwJzhBD8GzVmZB3aeXBDg==
X-Received: by 2002:a5d:6dad:0:b0:37d:4e74:684 with SMTP id ffacd0b85a97d-38260be230fmr13303703f8f.52.1732564777822;
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [RFC PATCH v3 23/26] hw/tpm: Add TPM event log
Date: Mon, 25 Nov 2024 19:56:22 +0000
Message-ID: <20241125195626.856992-25-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p/iw/hqxwbwp

Provide a library allowing the VMM to create an event log that describes
what is loaded into memory. During remote attestation in confidential
computing this helps an independent verifier reconstruct the initial
measurements of a VM, which contain the initial state of memory and
CPUs.

We provide some definitions and structures described by the Trusted
Computing Group (TCG) in "TCG PC Client Platform Firmware Profile
Specification" Level 00 Version 1.06 Revision 52 [1]. This is the same
format used by UEFI, and UEFI could reuse this log after finding it in
DT or ACPI tables, but can also copy its content into a new one.

[1] https://trustedcomputinggroup.org/resource/pc-client-specific-platform-firmware-profile-specification/

Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: New
---
 qapi/tpm.json            |  14 ++
 include/hw/tpm/tpm_log.h |  89 +++++++++++
 hw/tpm/tpm_log.c         | 325 +++++++++++++++++++++++++++++++++++++++
 hw/tpm/Kconfig           |   4 +
 hw/tpm/meson.build       |   1 +
 5 files changed, 433 insertions(+)
 create mode 100644 include/hw/tpm/tpm_log.h
 create mode 100644 hw/tpm/tpm_log.c

diff --git a/qapi/tpm.json b/qapi/tpm.json
index a16a72edb9..697e7150ee 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -188,3 +188,17 @@
 ##
 { 'command': 'query-tpm', 'returns': ['TPMInfo'],
   'if': 'CONFIG_TPM' }
+
+##
+# @TpmLogDigestAlgo:
+#
+# @sha256: Use the SHA256 algorithm
+#
+# @sha512: Use the SHA512 algorithm
+#
+# Algorithm to use for event log digests
+#
+# Since: 9.3
+##
+{ 'enum': 'TpmLogDigestAlgo',
+  'data': ['sha256', 'sha512'] }
diff --git a/include/hw/tpm/tpm_log.h b/include/hw/tpm/tpm_log.h
new file mode 100644
index 0000000000..b3cd2e7563
--- /dev/null
+++ b/include/hw/tpm/tpm_log.h
@@ -0,0 +1,89 @@
+#ifndef QEMU_TPM_LOG_H
+#define QEMU_TPM_LOG_H
+
+#include "qom/object.h"
+#include "sysemu/tpm.h"
+
+/*
+ * Defined in: TCG Algorithm Registry
+ * Family 2.0 Level 00 Revision 01.34
+ *
+ * (Here TCG stands for Trusted Computing Group)
+ */
+#define TCG_ALG_SHA256  0xB
+#define TCG_ALG_SHA512  0xD
+
+/* Size of a digest in bytes */
+#define TCG_ALG_SHA256_DIGEST_SIZE      32
+#define TCG_ALG_SHA512_DIGEST_SIZE      64
+
+/*
+ * Defined in: TCG PC Client Platform Firmware Profile Specification
+ * Version 1.06 revision 52
+ */
+#define TCG_EV_NO_ACTION                        0x00000003
+#define TCG_EV_EVENT_TAG                        0x00000006
+#define TCG_EV_POST_CODE2                       0x00000013
+#define TCG_EV_EFI_PLATFORM_FIRMWARE_BLOB2      0x8000000A
+
+struct UefiPlatformFirmwareBlob2Head {
+        uint8_t blob_description_size;
+        uint8_t blob_description[];
+} __attribute__((packed));
+
+struct UefiPlatformFirmwareBlob2Tail {
+        uint64_t blob_base;
+        uint64_t blob_size;
+} __attribute__((packed));
+
+#define TYPE_TPM_LOG "tpm-log"
+
+OBJECT_DECLARE_SIMPLE_TYPE(TpmLog, TPM_LOG)
+
+/**
+ * tpm_log_create - Create the event log
+ * @log: the log object
+ * @max_size: maximum size of the log. Adding an event past that size will
+ *            return an error
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Allocate the event log and create the initial entry (Spec ID Event03)
+ * describing the log format.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int tpm_log_create(TpmLog *log, size_t max_size, Error **errp);
+
+/**
+ * tpm_log_add_event - Append an event to the log
+ * @log: the log object
+ * @event_type: the `eventType` field in TCG_PCR_EVENT2
+ * @event: the `event` field in TCG_PCR_EVENT2
+ * @event_size: the `eventSize` field in TCG_PCR_EVENT2
+ * @data: content to be hashed into the event digest. May be NULL.
+ * @data_size: size of @data. Should be zero when @data is NULL.
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Add a TCG_PCR_EVENT2 event to the event log. Depending on the event type, a
+ * data buffer may be hashed into the event digest (for example
+ * TCG_EV_EFI_PLATFORM_FIRMWARE_BLOB2 contains a digest of the blob.)
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int tpm_log_add_event(TpmLog *log, uint32_t event_type, const uint8_t *event,
+                      size_t event_size, const uint8_t *data, size_t data_size,
+                      Error **errp);
+
+/**
+ * tpm_log_write_and_close - Move the log to guest memory
+ * @log: the log object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Write the log into memory, at the address set in the load-addr property.
+ * After this operation, the log is not writable anymore.
+ *
+ * Return: 0 on success, -1 on error
+ */
+int tpm_log_write_and_close(TpmLog *log, Error **errp);
+
+#endif
diff --git a/hw/tpm/tpm_log.c b/hw/tpm/tpm_log.c
new file mode 100644
index 0000000000..e6183a6e70
--- /dev/null
+++ b/hw/tpm/tpm_log.c
@@ -0,0 +1,325 @@
+/*
+ * tpm_log.c - Event log as described by the Trusted Computing Group (TCG)
+ *
+ * Copyright (c) 2024 Linaro Ltd.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * Create an event log in the format specified by:
+ *
+ *  TCG PC Client Platform Firmware Profile Specification
+ *  Level 00 Version 1.06 Revision 52
+ *  Family “2.0”
+ */
+
+#include "qemu/osdep.h"
+
+#include "crypto/hash.h"
+#include "exec/address-spaces.h"
+#include "exec/memory.h"
+#include "hw/tpm/tpm_log.h"
+#include "qapi/error.h"
+#include "qemu/bswap.h"
+#include "qom/object_interfaces.h"
+
+/*
+ * Legacy structure used only in the first event in the log, for compatibility
+ */
+struct TcgPcClientPcrEvent {
+        uint32_t pcr_index;
+        uint32_t event_type;
+        uint8_t  digest[20];
+        uint32_t event_data_size;
+        uint8_t  event[];
+} __attribute__((packed));
+
+struct TcgEfiSpecIdEvent {
+        uint8_t  signature[16];
+        uint32_t platform_class;
+        uint8_t  family_version_minor;
+        uint8_t  family_version_major;
+        uint8_t  spec_revision;
+        uint8_t  uintn_size;
+        uint32_t number_of_algorithms; /* 1 */
+        /*
+         * For now we declare a single algo, but if we want UEFI to reuse this
+         * header then we'd need to add entries here for all algos supported by
+         * UEFI (and expand the digest field for EV_NO_ACTION).
+         */
+        uint16_t algorithm_id;
+        uint16_t digest_size;
+        uint8_t  vendor_info_size;
+        uint8_t  vendor_info[];
+} __attribute__((packed));
+
+struct TcgPcrEvent2Head {
+        uint32_t pcr_index;
+        uint32_t event_type;
+        /* variable-sized digests */
+        uint8_t  digests[];
+} __attribute__((packed));
+
+struct TcgPcrEvent2Tail {
+        uint32_t event_size;
+        uint8_t  event[];
+} __attribute__((packed));
+
+struct TpmlDigestValues {
+        uint32_t count;     /* 1 */
+        uint16_t hash_alg;
+        uint8_t  digest[];
+} __attribute__((packed));
+
+struct TpmLog {
+    Object parent_obj;
+
+    TpmLogDigestAlgo digest_algo;
+    size_t max_size;
+    uint64_t load_addr;
+
+    uint16_t tcg_algo;
+    GByteArray *content;
+    uint8_t *digest;
+    size_t digest_size;
+};
+
+OBJECT_DEFINE_SIMPLE_TYPE(TpmLog, tpm_log, TPM_LOG, OBJECT)
+
+static void tpm_log_init(Object *obj)
+{
+    TpmLog *log = TPM_LOG(obj);
+
+    log->digest_algo = TPM_LOG_DIGEST_ALGO_SHA256;
+}
+
+static void tpm_log_destroy(TpmLog *log)
+{
+    if (!log->content) {
+        return;
+    }
+    g_free(log->digest);
+    log->digest = NULL;
+    g_byte_array_free(log->content, /* free_segment */ true);
+    log->content = NULL;
+}
+
+static void tpm_log_finalize(Object *obj)
+{
+    tpm_log_destroy(TPM_LOG(obj));
+}
+
+static int tpm_log_get_digest_algo(Object *obj, Error **errp)
+{
+    TpmLog *log = TPM_LOG(obj);
+
+    return log->digest_algo;
+}
+
+static void tpm_log_set_digest_algo(Object *obj, int algo, Error **errp)
+{
+    TpmLog *log = TPM_LOG(obj);
+
+    if (log->content != NULL) {
+        error_setg(errp, "cannot set digest algo after log creation");
+        return;
+    }
+
+    log->digest_algo = algo;
+}
+
+static void tpm_log_get_max_size(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    TpmLog *log = TPM_LOG(obj);
+    uint64_t value = log->max_size;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void tpm_log_get_load_addr(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    TpmLog *log = TPM_LOG(obj);
+    uint64_t value = log->load_addr;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void tpm_log_set_load_addr(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    TpmLog *log = TPM_LOG(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    log->load_addr = value;
+}
+
+
+static void tpm_log_class_init(ObjectClass *oc, void *data)
+{
+    object_class_property_add_enum(oc, "digest-algo",
+                                   "TpmLogDigestAlgo",
+                                   &TpmLogDigestAlgo_lookup,
+                                   tpm_log_get_digest_algo,
+                                   tpm_log_set_digest_algo);
+    object_class_property_set_description(oc, "digest-algo",
+            "Algorithm used to hash blobs added as events ('sha256', 'sha512')");
+
+    /* max_size is set while allocating the log in tpm_log_create */
+    object_class_property_add(oc, "max-size", "uint64", tpm_log_get_max_size,
+                              NULL, NULL, NULL);
+    object_class_property_set_description(oc, "max-size",
+            "Maximum size of the log, reserved in guest memory");
+
+    object_class_property_add(oc, "load-addr", "uint64", tpm_log_get_load_addr,
+                              tpm_log_set_load_addr, NULL, NULL);
+    object_class_property_set_description(oc, "load-addr",
+            "Base address of the log in guest memory");
+}
+
+int tpm_log_create(TpmLog *log, size_t max_size, Error **errp)
+{
+    struct TcgEfiSpecIdEvent event;
+    struct TcgPcClientPcrEvent header = {
+        .pcr_index = 0,
+        .event_type = cpu_to_le32(TCG_EV_NO_ACTION),
+        .digest = {0},
+        .event_data_size = cpu_to_le32(sizeof(event)),
+    };
+
+    log->content = g_byte_array_sized_new(max_size);
+    log->max_size = max_size;
+
+    switch (log->digest_algo) {
+    case TPM_LOG_DIGEST_ALGO_SHA256:
+        log->tcg_algo = TCG_ALG_SHA256;
+        log->digest_size = TCG_ALG_SHA256_DIGEST_SIZE;
+        break;
+    case TPM_LOG_DIGEST_ALGO_SHA512:
+        log->tcg_algo = TCG_ALG_SHA512;
+        log->digest_size = TCG_ALG_SHA512_DIGEST_SIZE;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    log->digest = g_malloc0(log->digest_size);
+
+    event = (struct TcgEfiSpecIdEvent) {
+        .signature = "Spec ID Event03",
+        .platform_class = 0,
+        .family_version_minor = 0,
+        .family_version_major = 2,
+        .spec_revision = 106,
+        .uintn_size = 2, /* UINT64 */
+        .number_of_algorithms = cpu_to_le32(1),
+        .algorithm_id = cpu_to_le16(log->tcg_algo),
+        .digest_size = cpu_to_le16(log->digest_size),
+        .vendor_info_size = 0,
+    };
+
+    g_byte_array_append(log->content, (guint8 *)&header, sizeof(header));
+    g_byte_array_append(log->content, (guint8 *)&event, sizeof(event));
+    return 0;
+}
+
+int tpm_log_add_event(TpmLog *log, uint32_t event_type, const uint8_t *event,
+                      size_t event_size, const uint8_t *data, size_t data_size,
+                      Error **errp)
+{
+    int digests = 0;
+    size_t rollback_len;
+    struct TcgPcrEvent2Head header = {
+        .pcr_index = 0,
+        .event_type = cpu_to_le32(event_type),
+    };
+    struct TpmlDigestValues digest_header = {0};
+    struct TcgPcrEvent2Tail tail = {
+        .event_size = cpu_to_le32(event_size),
+    };
+
+    if (log->content == NULL) {
+        error_setg(errp, "event log is not initialized");
+        return -EINVAL;
+    }
+    rollback_len = log->content->len;
+
+    g_byte_array_append(log->content, (guint8 *)&header, sizeof(header));
+
+    if (data) {
+        QCryptoHashAlgo qc_algo;
+
+        digest_header.hash_alg = cpu_to_le16(log->tcg_algo);
+        switch (log->digest_algo) {
+        case TPM_LOG_DIGEST_ALGO_SHA256:
+            qc_algo = QCRYPTO_HASH_ALGO_SHA256;
+            break;
+        case TPM_LOG_DIGEST_ALGO_SHA512:
+            qc_algo = QCRYPTO_HASH_ALGO_SHA512;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        if (qcrypto_hash_bytes(qc_algo, (const char *)data, data_size,
+                               &log->digest, &log->digest_size, errp)) {
+            goto err_rollback;
+        }
+        digests = 1;
+    } else if (event_type == TCG_EV_NO_ACTION) {
+        /* EV_NO_ACTION contains empty digests for each supported algo */
+        memset(log->digest, 0, log->digest_size);
+        digest_header.hash_alg = 0;
+        digests = 1;
+    }
+
+    if (digests) {
+        digest_header.count = cpu_to_le32(digests);
+        g_byte_array_append(log->content, (guint8 *)&digest_header,
+                            sizeof(digest_header));
+        g_byte_array_append(log->content, log->digest, log->digest_size);
+    } else {
+        /* Add an empty digests list */
+        g_byte_array_append(log->content, (guint8 *)&digest_header.count,
+                            sizeof(digest_header.count));
+    }
+
+    g_byte_array_append(log->content, (guint8 *)&tail, sizeof(tail));
+    g_byte_array_append(log->content, event, event_size);
+
+    if (log->content->len > log->max_size) {
+        error_setg(errp, "event log exceeds max size");
+        goto err_rollback;
+    }
+
+    return 0;
+
+err_rollback:
+    g_byte_array_set_size(log->content, rollback_len);
+    return -1;
+}
+
+int tpm_log_write_and_close(TpmLog *log, Error **errp)
+{
+    int ret;
+
+    if (!log->content) {
+        error_setg(errp, "event log is not initialized");
+        return -1;
+    }
+
+    ret = address_space_write_rom(&address_space_memory, log->load_addr,
+                                  MEMTXATTRS_UNSPECIFIED, log->content->data,
+                                  log->content->len);
+    if (ret) {
+        error_setg(errp, "cannot load log into memory");
+        return -1;
+    }
+
+    tpm_log_destroy(log);
+    return ret;
+}
diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index a46663288c..70694b14a3 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -30,3 +30,7 @@ config TPM_SPAPR
     default y
     depends on TPM && PSERIES
     select TPM_BACKEND
+
+config TPM_LOG
+    bool
+    default y
diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
index 6968e60b3f..81efb557f3 100644
--- a/hw/tpm/meson.build
+++ b/hw/tpm/meson.build
@@ -6,4 +6,5 @@ system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
 system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
 system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
 
+system_ss.add(when: 'CONFIG_TPM_LOG', if_true: files('tpm_log.c'))
 specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
-- 
2.47.0
