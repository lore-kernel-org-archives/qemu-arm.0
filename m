Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5565974lfc;
        Mon, 15 Feb 2021 04:11:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZsGLViHPyHZ8Wbf+1Su5EmYQRA2kq+TVbImrW3SQFXEq/4FC+3C/vKebHcjX5zdZuiNpg
X-Received: by 2002:a25:df52:: with SMTP id w79mr21197412ybg.419.1613391113244;
        Mon, 15 Feb 2021 04:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613391113; cv=none;
        d=google.com; s=arc-20160816;
        b=xIFROEKv+Hgp7tbZ6q9SFeCLC+MxHSWhwgcKFcmaxiFlJnA+3KkA28DgBG98+uU+KZ
         dZ7GSe7WIqG6W34tJaALCRN5zGFHhXBdSnUuKCxvtQN8YqOI2qwDV5vnK/SzoA4KmHeH
         RnSycd/yKpsO783C+UmJJezpR/VoBEfO7zQWVa6xIGc9SOuYPRRR9udBfJ+fc8tgpfBw
         HiRQIYu0vb5owWixYv9/NcG4VA64sovAxIiV6PM0HSFT6NWtxn2Be8T3Uvxn1hsjAuub
         149UtmULPyNQP8fYuEIWVIVnc1dIfLebEVW0oanxhwZx6sWyebKwiyWBNN95Snun5fse
         RrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EqrwKzWHzWMN7lxcV1Y9F0BBb0MV1m8CQjXEiMLLrtw=;
        b=uXaSVG4SlpVacAZaIF+4P5jsOKkdELJdmXwAbwz2xZfZpDlTEGX6vjuUYDT+WHIU3+
         UP/tWfa+C+X1wg33n/wyx0zdGvK18RSkd8LK+Wlb3Bj13nb81O14G86aBiHgL9uWwA0D
         rc9mFuLriKqCmNQ9PMBdEgUMNcj8kiNWWbYfEu/MWkJUfzNDeewfrurzNO1sHsSURxPm
         X/+KouQpyb/9lBpouaV1LLPVJ3twONrYQg1QFluzcoHZmRapmOe7dRXnLlw3XfWoZbMo
         +H5NM3jWAzhn0Mraq9847QvYFoO/Pil35gdKrlgYN7FW3K62xY0mzbH111zmImvHMy9s
         Zo3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JaRD7M/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q127si16878562ybg.294.2021.02.15.04.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JaRD7M/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcjI-0006cz-Jh
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQt-00008N-L7
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:51 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQr-0004BJ-Sb
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id l17so5976323wmq.2
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EqrwKzWHzWMN7lxcV1Y9F0BBb0MV1m8CQjXEiMLLrtw=;
 b=JaRD7M/r+GAtMCQO5rNqqmKWe+rERAZB3+aTPn6mhCfppub3MW3j9u+5Hpfg9l5d8g
 EdcTOmGZyZfCvD0W9DLWN/jXya+4SXFcUQ/qyeqcusE6QjdPHpeVxChlBpcVUwB9hupd
 UOVJgXzYVjrs/X9Y27pU0zaHo6gRlM0ifnJSV80XUVRGVdOb9fV6sskWX9n68nI+YZYG
 2zFHTngKKcHnnH5O3y1MXslYp3uZ14eEFLZwdyGfDr6FkobGFI4xlcJFLOVu1vibYOfk
 0aD8UOzlLLITSDAkIozk+1UDvFUowgXAmst/Vp8Nbwy9Kj3oHGzt2Er2YCXygkX5D/61
 7WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EqrwKzWHzWMN7lxcV1Y9F0BBb0MV1m8CQjXEiMLLrtw=;
 b=ju43UEHpUuqbZoftBdqEqW2Lt76td1k1TjEpHtWHxQTEkWJHR1mrbRuJranfmZtZ5/
 NSfOF9X31hqJWK8Epz8SoPTcuDhrWdPDtm66LzsHKPgMYZxnnfPfZ2jaWWGb3mlYimd1
 ZMk1Zi/HwzL1z+cRd9k5NjIUFpCpd9azUdyWBHpGt5I99cKbpG58uxsnApQFPPgO/SJN
 tqO7iTfUS/JQx/nLaqkOHa9DLYQHHvaAmszl5awvcsqYRXbf9b3e5ufGpd85q8j+HLaS
 +7//FPmKY0PSPl5Nl4c4d+nCWpIVX0iscru2jZfPveQUpgtLdQiHviwe1+OiJSPdAP+C
 EZkw==
X-Gm-Message-State: AOAM530iarnhaA7lJj8blr/VI3z9rYXpJ2zWhegXAGsB0lAhwQZYExUK
 u2VaVb1gtm4HJZq4b7xh4zHPSw9E87kISg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr14086741wmj.76.1613389968665; 
 Mon, 15 Feb 2021 03:52:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] hw/arm/mps2-tz: Set MachineClass default_ram info
 from RAMInfo data
Date: Mon, 15 Feb 2021 11:51:31 +0000
Message-Id: <20210215115138.20465-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V86bMh0KKSsp

Instead of hardcoding the MachineClass default_ram_size and
default_ram_id fields, set them on class creation by finding the
entry in the RAMInfo array which is marked as being the QEMU system
RAM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 18f75eacfcd..08dd2cbaa40 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -811,8 +811,26 @@ static void mps2tz_class_init(ObjectClass *oc, void *data)
 
     mc->init = mps2tz_common_init;
     iic->check = mps2_tz_idau_check;
-    mc->default_ram_size = 16 * MiB;
-    mc->default_ram_id = "mps.ram";
+}
+
+static void mps2tz_set_default_ram_info(MPS2TZMachineClass *mmc)
+{
+    /*
+     * Set mc->default_ram_size and default_ram_id from the
+     * information in mmc->raminfo.
+     */
+    MachineClass *mc = MACHINE_CLASS(mmc);
+    const RAMInfo *p;
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->mrindex < 0) {
+            /* Found the entry for "system memory" */
+            mc->default_ram_size = p->size;
+            mc->default_ram_id = p->name;
+            return;
+        }
+    }
+    g_assert_not_reached();
 }
 
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
@@ -835,6 +853,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
+    mps2tz_set_default_ram_info(mmc);
 }
 
 static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
@@ -857,6 +876,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
+    mps2tz_set_default_ram_info(mmc);
 }
 
 static const TypeInfo mps2tz_info = {
-- 
2.20.1

