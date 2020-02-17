Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4990631lfp;
        Mon, 17 Feb 2020 03:49:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+dtt6SHmERrbs8Cx8PgToPOum3SNYEZs6OWZrtmanZ19bM7/AWG3LqAvmL+WRLtwlNxHF
X-Received: by 2002:a37:6c45:: with SMTP id h66mr13617787qkc.360.1581940167604;
        Mon, 17 Feb 2020 03:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940167; cv=none;
        d=google.com; s=arc-20160816;
        b=MrdEpbLEJFHOqr8Qi2c9yOfpUMjtSgnojkhQCoiu1EydQgIKCQRsM5ekEZ+fyN3t7Q
         XJKWRSGsAMpJLzGdvazKPCU2RMKhGqDfUlV3U7eas/kmDEw7O0Z7PCsa2uU+OE1eV8gF
         EWFYxyqOSrFrh4jm4juX5uxp1jzGhsSBWHcRlQSiFhdz3OVXPt6VaqJ8txnTFIWsrvZV
         oz7j+gNa38toEcOVD7RHTxxxO9kTNJoSRiidXZmpF+J1lp3T/vkAW02Ue929cuw4OruL
         xSXJyo2BS6pjbQv+eZyCKOhsd/CGF1oEaiBMravdOjYif+YMGlSwS8Z1rYGsyKwOBdbj
         x7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GA3hSTRvUjj0h1sIVU2hxdzg27YAXWTu1THZdiNMV1A=;
        b=uD43J0/Pg4L0XG2qC0IjmiQYqM0rMYjIoRqiFPjE44HVvmr1t0N8onHAiOuu4Wgrs9
         emeXlyrQQm/FBfze6fx1f1QUEunk+UPcx1b8EguFC4a3goFCZmkipf2DwN3c1hK5Ztag
         qRLmmxCGh/A76nYeOcT6WAmq0zv93sM5C58cN5umngGAURwIq6ysLRLkBZl35cQwizK+
         u9QD10hMDw7mOsm0O7LvGBBu6UFh/2DiTnDdIPCMiH36otkamoAGz1oioJkYmSHYSJT2
         UqHyNHdE/Ow9Roma3G+7Zgqkz5ZX2RgSGg4xM8E/1q0h2hEL+mdoPU9rwUG0qYwVXQwa
         vKuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VyI27O8q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si172572qvb.150.2020.02.17.03.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VyI27O8q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3etz-0002fl-0U
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqN-0006VY-Fj
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqM-0002Po-BV
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:43 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqM-0002P7-5H; Mon, 17 Feb 2020 06:45:42 -0500
Received: by mail-wm1-x341.google.com with SMTP id t23so16826858wmi.1;
 Mon, 17 Feb 2020 03:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GA3hSTRvUjj0h1sIVU2hxdzg27YAXWTu1THZdiNMV1A=;
 b=VyI27O8qMg45Z8IULsRRahYlyIn66s55ZoN7piORnzwJE1lT40pqywukJ7PhcuDo35
 PFtafWyqmuD3ysSf900SWt5sXt3tRtaHYGFRTBjbTTJxCwQcQyCIcs2n9VdmzjJSdUQo
 wgQQOxwtaBi1ZzZlKfU8L/TynqVNQ1KnqzFYrWv1OKa9PGZ7mRu+KvKJttLC97KnxUVC
 K/5UXkV7ADoMPFiguIkZCjdtjvE4hDRzXMepyj/SGIT8cNa8ZLBHxB4/ETCjwELZhB7G
 5CyxTge0jSmMkz+WRFJJeNMaSGaUEAJMwLJUIJVkjf4nEmYNbw0L3hXN9j1uGZr2PVVF
 QjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GA3hSTRvUjj0h1sIVU2hxdzg27YAXWTu1THZdiNMV1A=;
 b=Q9c8NDmenPBWFEfCznAY9pEUD5WWsgk/wei5ecPhwl1+THpuHXa+UjEBWh4saOmzha
 Sid8WRYjvtbRsVW9LfolTjGS/BnoEEWp56K+QIJTxRfHbtHioWW4cBmNdcuXe0dw9NGu
 /FFIM/Tm58+CKdxfbL3UVXb+DD1LyS0BnvbbunwN2x5RlXhEh9x9LVzmqVYZ666f4E06
 2hSrPFLi4g8FmsWFqiKVHjfVujepJykATyHbPAhdg7T4tV9EpPcG0u4XYFBaO3bGfioE
 3Eo173JVpwESSAKkmuCzBNcmVRH9Svxt7mRmcDrK/3fZRuiWVVdMLEEZZgWZBvKa/Lwj
 TnsQ==
X-Gm-Message-State: APjAAAUUYbG7Ju4I6x0p1GZAvOlfct7mZ1h4XXWh8Bk2KKS5GjqCXRWj
 IK9nJg57dr41b3vCw9j/JsHJ/gITwYE=
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr21938382wmc.123.1581939940880; 
 Mon, 17 Feb 2020 03:45:40 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/13] hw/arm/raspi: Introduce RaspiProcessorId enum
Date: Mon, 17 Feb 2020 12:45:24 +0100
Message-Id: <20200217114533.17779-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BmHpi9YM8R6Q

As we only support a reduced set of the REV_CODE_PROCESSOR id
encoded in the board revision, define the PROCESSOR_ID values
as an enum. We can simplify the board_soc_type and cores_count
methods.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index d9e8acfe3b..b628dadf34 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -69,16 +69,33 @@ FIELD(REV_CODE, MANUFACTURER,      16, 4);
 FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
 FIELD(REV_CODE, STYLE,             23, 1);
 
+typedef enum RaspiProcessorId {
+    PROCESSOR_ID_BCM2836 = 1,
+    PROCESSOR_ID_BCM2837 = 2,
+} RaspiProcessorId;
+
+static const struct {
+    const char *type;
+    int cores_count;
+} soc_property[] = {
+    [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS},
+    [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS},
+};
+
 static uint64_t board_ram_size(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
     return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
 }
 
-static int board_processor_id(uint32_t board_rev)
+static RaspiProcessorId board_processor_id(uint32_t board_rev)
 {
+    int proc_id = FIELD_EX32(board_rev, REV_CODE, PROCESSOR);;
+
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
-    return FIELD_EX32(board_rev, REV_CODE, PROCESSOR);
+    assert(proc_id < ARRAY_SIZE(soc_property) && soc_property[proc_id].type);
+
+    return proc_id;
 }
 
 static int board_version(uint32_t board_rev)
@@ -88,32 +105,12 @@ static int board_version(uint32_t board_rev)
 
 static const char *board_soc_type(uint32_t board_rev)
 {
-    static const char *soc_types[] = {
-        NULL, TYPE_BCM2836, TYPE_BCM2837,
-    };
-    int proc_id = board_processor_id(board_rev);
-
-    if (proc_id >= ARRAY_SIZE(soc_types) || !soc_types[proc_id]) {
-        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
-                     proc_id, board_rev);
-        exit(1);
-    }
-    return soc_types[proc_id];
+    return soc_property[board_processor_id(board_rev)].type;
 }
 
 static int cores_count(uint32_t board_rev)
 {
-    static const int soc_cores_count[] = {
-        0, BCM283X_NCPUS, BCM283X_NCPUS,
-    };
-    int proc_id = board_processor_id(board_rev);
-
-    if (proc_id >= ARRAY_SIZE(soc_cores_count) || !soc_cores_count[proc_id]) {
-        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
-                     proc_id, board_rev);
-        exit(1);
-    }
-    return soc_cores_count[proc_id];
+    return soc_property[board_processor_id(board_rev)].cores_count;
 }
 
 static const char *board_type(uint32_t board_rev)
-- 
2.21.1

