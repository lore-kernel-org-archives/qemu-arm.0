Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E88606A331
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMIDt8uj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQNgA-0005Xr-KS; Mon, 09 Nov 2026 06:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfe-0005Ox-TI
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:29 -0500
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfd-0000HC-CP
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:18 -0500
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-3704d30b84fso988683eec.1
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794224176; x=1794828976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BalyzpNSLQJj320b3zZNACnQolA+luPcc18MlanzhuQ=;
 b=JMIDt8ujk029/pzuqyi0BqpopCn5f6sj2x5N6AxSGkUGhPwC/ABIXYkG/I34+hF0wx
 oCgi7ZqEwIA2Z6iXFI4EVkK4YK7IAljZ2gr6n0cY8X7lIP57g+S0K5ywnqXkoorEVXvH
 qc31YdZp4opY22sPTjI7Qss3DBazvVtQiWJvyBJx4g9Uf7yrad5M3NYOgANmmtDAl+BY
 wPtkjdD4iX/WpCOJtlU6YR0feJwlstjNCexSavStz8UdtW3jaxL55aFh0tDGntOkdAQV
 asLqJvu5B0ESJdm9Bzk0R9bxd97UZxP238GdWHkQPM9FmPv2HrtRxEMXZvVpUQRXaKRQ
 8CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794224176; x=1794828976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BalyzpNSLQJj320b3zZNACnQolA+luPcc18MlanzhuQ=;
 b=qZ+79G4BQmE0AkwWPwP3GFiXa4h+euLovZQlEh2jn6uDobNdT39Lub8oGjBikTxeAN
 lb5nsr7DNaw2RU0GDOiZUCb6wl6ePRGxQipHma+UsJeEJrxFH1CUJWoK9Na+ztVJKSBG
 DDATy9rAZXyu0jd8wEu5+eHtskmuEe/zsaoTWMVsPOdIILfJC27YvxtWFJ3XsTuWs5s6
 ZOEuEv7OQ4RyKDvnIFFZ4nb8UCl/IOWo5wfiUMi0r4MLrXkl4wc+NWiBNVMQNsx8/KUG
 UsiQ8F6LT9hqfBwlS7MpQOBetZjy+11H9W8ORSkK22kyza3nLJh8YZ4SXHmHgjVwc9TT
 EwYg==
X-Forwarded-Encrypted: i=1;
 AL+hErHfmw0clHIYJfyWdYbOFArOHvih1Lo2UEN7qx0ZfaFHiefLPb6EPSjjUNwSMNykKQSUpDx9nliMkA==@nongnu.org
X-Gm-Message-State: APuU4Z/C1+FdK/JPKKfTQR/dkcJRHos6rskw73Ix/81d+3VVNK22iMeH
 MlQtHtFBrU0tRQ/UxnEgisWMvptaH1qiCyIR4SE7o2sR/WNDM1Pp4TVx
X-Gm-Gg: AYBFou0sWE+Efz/GZPZNbZEOLE4p7WhzLp5JkJYeO3cSQvA4RS/aLPA51tPLSpU67oZ
 xOUHBlUlPXclML1UNNJG0YFtVrqakHkHeBtlN6i0MKuH5HNFa95YgQjqNq19BqUJl67y9g4Ijyu
 6aNLZB0i+v5rVJ1u9YT5rTYGdVKSgH7J7qiBFjLYsrFRH07Wy1RnTXa2TfIGtD20C7euTTyMklM
 g0UmYAYahFjk0BdEXzQyuBsOeDJhVjqlpe/WQHzZl6m3gQxWofBuJmDbCJrdYzRj8jkYlf+wg1U
 FcShRGJdeUkhYmK86wylTS+4SvV5S5IaJv1tC9wtNdo/XbajYzIlXbZSlxRwIzyRK21Godr11Wu
 9Ahf8PVDWTEO3S2Mv77aCOsCA8LnWPBq6hEyiQnCrPWh5VURfiEUGGymCf4t0zr1j9bOoNGvQdt
 jkJqR5x2kcCi1euWW1orPUzyI8xzbt3Be4aC6WrzmNWAtwh81pY0W98mwkiC+so42Pu2nF+YIpy
 hvEBpvlYo10Y+zDYo+7MZc80wAYw5mlb3VQefbJtisu/g6nWkQj37ZTf3BVS1O/q5XvzYdvjUUS
 xe/IV1cpmo5gKoxYxVX1HOOvrGzKdbLf
X-Received: by 2002:a05:7300:cf89:b0:36d:4560:dd38 with SMTP id
 5a478bee46e88-3725e82942emr6391893eec.37.1794224175657; 
 Mon, 09 Nov 2026 03:36:15 -0800 (PST)
Received: from ubuntu.lan ([2405:4802:913e:86f0:35c7:7294:a0c3:69b2])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-372660f444csm19762941eec.19.2026.11.09.03.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:36:15 -0800 (PST)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH v2 4/8] hw/misc/allwinner-sid: Support configurable eFuse
 capacity up to 512 bytes
Date: Mon,  9 Nov 2026 18:35:32 +0700
Message-ID: <20261109113545.18561-5-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109113545.18561-1-dovankhai97@gmail.com>
References: <20261109113545.18561-1-dovankhai97@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132a;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x132a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allwinner SoCs provide different eFuse capacities: older SoCs have
16 to 256 bytes, while newer 64-bit SoCs (e.g. H618) provide up to 512
bytes of eFuse storage.

Add a "size" property (defaulting to 16 bytes for backward compatibility)
and an internal storage buffer up to 512 bytes (AW_SID_SIZE_MAX).

Signed-off-by: Khai Do <dovankhai97@gmail.com>
---
 hw/misc/allwinner-sid.c         | 12 ++++++++++--
 include/hw/misc/allwinner-sid.h |  8 ++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/misc/allwinner-sid.c b/hw/misc/allwinner-sid.c
index b5f827d4bd..afe5132c93 100644
--- a/hw/misc/allwinner-sid.c
+++ b/hw/misc/allwinner-sid.c
@@ -79,10 +79,15 @@ static void allwinner_sid_write(void *opaque, hwaddr offset,
 
         if ((s->control & REG_PRCTL_OP_LOCK) &&
             (s->control & REG_PRCTL_WRITE)) {
-            uint32_t id = s->control >> 16;
+            uint32_t id = extract32(s->control, 16, 9);
 
             if (id <= sizeof(QemuUUID) - sizeof(s->rdkey)) {
                 s->rdkey = ldl_be_p(&s->identifier.data[id]);
+            } else if (s->size >= sizeof(s->rdkey) &&
+                       id <= s->size - sizeof(s->rdkey)) {
+                s->rdkey = ldl_be_p(&s->storage[id]);
+            } else {
+                s->rdkey = 0;
             }
         }
         s->control &= ~REG_PRCTL_WRITE;
@@ -129,16 +134,19 @@ static void allwinner_sid_init(Object *obj)
 
 static const Property allwinner_sid_properties[] = {
     DEFINE_PROP_UUID_NODEFAULT("identifier", AwSidState, identifier),
+    DEFINE_PROP_UINT32("size", AwSidState, size, sizeof(QemuUUID)),
 };
 
 static const VMStateDescription allwinner_sid_vmstate = {
     .name = "allwinner-sid",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(control, AwSidState),
         VMSTATE_UINT32(rdkey, AwSidState),
         VMSTATE_UINT8_ARRAY_V(identifier.data, AwSidState, sizeof(QemuUUID), 1),
+        VMSTATE_UINT32_V(size, AwSidState, 2),
+        VMSTATE_UINT8_ARRAY_V(storage, AwSidState, AW_SID_SIZE_MAX, 2),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/misc/allwinner-sid.h b/include/hw/misc/allwinner-sid.h
index cfa22a4d7f..da8c235c5d 100644
--- a/include/hw/misc/allwinner-sid.h
+++ b/include/hw/misc/allwinner-sid.h
@@ -24,6 +24,9 @@
 #include "hw/core/sysbus.h"
 #include "qemu/uuid.h"
 
+/** Maximum eFuse storage size supported */
+#define AW_SID_SIZE_MAX (512)
+
 /**
  * Object model
  * @{
@@ -54,6 +57,11 @@ struct AwSidState {
     /** Stores the emulated device identifier */
     QemuUUID identifier;
 
+    /** Size of eFuse storage */
+    uint32_t size;
+
+    /** eFuse storage buffer */
+    uint8_t storage[AW_SID_SIZE_MAX];
 };
 
 #endif /* HW_MISC_ALLWINNER_SID_H */
-- 
2.43.0


