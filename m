Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2126806njc;
        Mon, 14 Apr 2025 09:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCjxnAYgBGgrZwW9MzN7pjqQBdylMkRgdzqo/gSjEOED6HDRIxBvkwgTg5xqhQUXjRiOHZooWIGbTvig==@linaro.org
X-Google-Smtp-Source: AGHT+IGYoHPrZhyyy5ZiTr/Mm8VPnU2UyJqKracY3lWPz/b0G1/5eMauIydhgd3uFCvlmqnZzmxU
X-Received: by 2002:a05:6902:2610:b0:e6e:4d8:81d9 with SMTP id 3f1490d57ef6-e704df24d21mr20451191276.9.1744648908150;
        Mon, 14 Apr 2025 09:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648908; cv=none;
        d=google.com; s=arc-20240605;
        b=iiGOFMCsWIddj4hp46AxJ3nUlTHvfS3kyJVcPFBdlIix02qGsJF2hNznaM6tqzj3e7
         Ps//8F+C2G1ra+tpYvK66LfxsLwDdCzcIc0Tp6V9gVEw1ZH26xUK2lMTs9dZksPzeG8q
         1y7bLVOJcR7SNHsOG1g3/Wgb3Z3yxvl7TrY2XhznJzEbJvPt7hFOf4OQgGAgetgQeY05
         jYIqiCHZ8aznBu0DrwEQIVizQuxjaiTNBgDpn0lyTD6pDPvw43QEeSH4GOZF8iuZgjJ/
         WTlTTPZQsfcRmYSO3Oytg8cM/jxF/ZJvj7yC5j2kKig2mZICBFfgm0gqyr0MyHjS7H+M
         GFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tZhEbAvW+nE/L3dL1QKuAVHmPprHwZitzXkNAkqvyqU=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=IFnkZk7X+XLDuctHqHACDJpAq0pqBpQy0ubTAmBO6pCrPo9nAfRBdVtsa3b0lI9FQt
         kZbRpO2UIv4NJO1xBKhDSzH9eVZsFXnYrL5tVOtxJg7SHDHZOYdWSQbR8JKUMN31dDSN
         IadZsq1cYYFZYb7cUN01yRxSRFj5iUf3PdnH3GTbUctmn9ecjotWaOHvqp92OdQlNT0A
         OOIZ5IAbeZZX25wOfYmSHLWhNFywPtpCpq0KjXreYPHK1zEwWkxT1zZNI08iZ70bSzuS
         19q8pmenwVw8i1LKffsBUg3Lt3C51ttsWqsnzJTnLlaseibxlOXwLvsD+TrqMdXLzExe
         Td7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eeEgdR2V;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e7032475f5fsi17385806276.161.2025.04.14.09.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eeEgdR2V;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZhEbAvW+nE/L3dL1QKuAVHmPprHwZitzXkNAkqvyqU=;
	b=eeEgdR2VrSyJEToLSYrYWV0Y6p132o4ICf8l/rxs5EZJc7Q5mTZ8KV55xOe2+G8bRQ16U5
	qwJiGxRh254rBP4hlCYKPp0f+YWdhw2B9iKNwboZYbmYHlBWKT1XsyD7Oxlf7id9AUACTM
	Jq3JJtPHv0UAwAITDRdM1wvP/GKm12g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-cRkk4Q_GMcmm54CBPn5psw-1; Mon,
 14 Apr 2025 12:41:44 -0400
X-MC-Unique: cRkk4Q_GMcmm54CBPn5psw-1
X-Mimecast-MFC-AGG-ID: cRkk4Q_GMcmm54CBPn5psw_1744648901
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4000C19560B0;
	Mon, 14 Apr 2025 16:41:41 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 79B2A180AF7C;
	Mon, 14 Apr 2025 16:41:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 09/10] arm-qmp-cmds: introspection for ID register props
Date: Mon, 14 Apr 2025 18:38:48 +0200
Message-ID: <20250414163849.321857-10-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: uXlQuIVg4mRC

Implement the capability to query available ID register values by
adding SYSREG_* options and values to the cpu model expansion for the
host model, if available.

Excerpt:
(QEMU) query-cpu-model-expansion type=full model={"name":"host"}
{"return": {"model": {"name": "host", "props":
{"SYSREG_ID_AA64PFR0_EL1_EL3": 1224979098931106066,
"SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0,
../..

So this allows the upper stack to detect available writable ID
regs and the "host passthrough model" values.

[CH: moved SYSREG_* values to host model]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>

---

TODO: Add the moment there is no way to test changing a given
ID reg field value. ie:

(QEMU) query-cpu-model-expansion type=full model={"name":"host", "prop":{"SYSREG_ID_AA64ISAR0_EL1_DP":0x13}}
---
 target/arm/arm-qmp-cmds.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 883c0a0e8cce..5f48c7d835e1 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
 #include "qapi/error.h"
@@ -209,6 +210,24 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
     }
 
+    /* If writable ID regs are supported, add them as well */
+    if (ARM_CPU(obj)->writable_id_regs == WRITABLE_ID_REGS_AVAIL) {
+        ObjectProperty *prop;
+        ObjectPropertyIterator iter;
+
+        object_property_iter_init(&iter, obj);
+
+        while ((prop = object_property_iter_next(&iter))) {
+            QObject *value;
+
+            if (!g_str_has_prefix(prop->name, "SYSREG_")) {
+                continue;
+            }
+            value = object_property_get_qobject(obj, prop->name, &error_abort);
+            qdict_put_obj(qdict_out, prop->name, value);
+        }
+    }
+
     if (!qdict_size(qdict_out)) {
         qobject_unref(qdict_out);
     } else {
-- 
2.49.0
