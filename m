Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp259320lfr;
        Fri, 16 Apr 2021 03:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy20dWoh6sarzFlcDDrESI2+0CsWpCEHPR+ZJhjABdFygBKbLw+g3NI8CYb5yI1Ys2jDXtg
X-Received: by 2002:a25:c0d5:: with SMTP id c204mr10907550ybf.57.1618569641249;
        Fri, 16 Apr 2021 03:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618569641; cv=none;
        d=google.com; s=arc-20160816;
        b=M3Eq7CPFM1kW5hFeZTa+V5IKqLKTJ97uMaU6P4tz9pvbenf0kBvFEY1RxvPfLTLaGo
         /020hP5EOguK7rXDASOGcxbweXFU5PMykMUkw9fab0RhY5wjutuQcwEiZr+PK63WSWeT
         5P7vCu485JCVPPNFGTMblpRuvsW/MyZvBbVTjpYcO/TIDaNp0SxUZ6VodVseqqtjSjKR
         Pyjv0Dq+Y0JlDun+ZcBRpTs37UzeB0XhQvcw4QQqumGlPXe+6wJSoeKQsbAUE9VTq3TL
         8bvC6drHSmz0pOnaxyyyPH7Xk/NLerHJd/2VfHEMw1Lfo9iD5YmlL0Z2Ecu4umjh2A53
         AvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e28W/IGA/Y8IVqH2SaQEZoIYXu2fwPxJICFBKtCl8wM=;
        b=V+Eyi1F6eZm21pdD4o7lMShAGXj4HvjR3YAJg9vYL4kObGDN6DWskUuZuTiG678eBc
         EhF3VyHVJpSB6ta48POQmfSB2nkMlr66D0nH9ZyHC4VsfhQYzW6dwUkhsuc54kjrUptZ
         av26JZFEY36mUhxrM8uaGrYKYz8Tpk7ZG2UxOj8bRWsfRxWZczjAvatMx7oxWKsmk40j
         b5n4EwDhrpx1k1XsmwdHpE4DlSWjsuBMgdQH0o9W3oTQG+ACCG9IxIM8rAIWjZu35mpN
         cK6xmDAMj06IMFMUSIVC8QEQc6YGPxbpdlG77KF7x1ELqb9Aqt8S0rCf4cbqNKSfxWNr
         gOvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xgelfsyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x62si5596960ybx.96.2021.04.16.03.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 03:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xgelfsyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXLtv-0002Eu-Qz
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 06:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXLtZ-0002E3-44
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 06:40:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXLtW-0004Ug-O2
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 06:40:16 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso3907617wmq.2
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e28W/IGA/Y8IVqH2SaQEZoIYXu2fwPxJICFBKtCl8wM=;
 b=Xgelfsyq0l+ME78+ANIsj6Tw1EbOIQ7oAnGefQxGrvlEJQ+dQA9pfT7TU6nT58VxfD
 7FWTRnVW9ppvoFZXeOa8TZsZE2uPYiAEnRb1iRHWWtXmI2j3LwyQeR0bf4z3iuUUtx7E
 EWzca3ZGuRiyO2GPXcrGVwu4xmPLFF03z++13aoZkOj8fW6kiqMytA4ZVFqumlqCJfoN
 XxWpmvilpdihVFFNTWL8v9KgYtYwyw0KLiZNPrb2PSKR79PF2N76HnVYhi84eE8uItF5
 S64wmlwkg4uYwL6hEy2KEx7Oqep27co29iOkUXYIfmNnWdR666udeubEC6rPlQSgChtu
 gKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e28W/IGA/Y8IVqH2SaQEZoIYXu2fwPxJICFBKtCl8wM=;
 b=oGaKOnwXDFCSfxvhRJdrZBAJdwidEujmw0unqp8iPmyjGm9wyWJJlA7j0yLsQymdEC
 afZ1eo/L/6826wNCvg/VHHhfTMet6AZxz3VppCyYW7YumNYgKdD3Plu0FhDIBL4MLWHM
 d7h6pmyXsP1gKkEWR3G56xxbMr/K8NqPBmCqHlY12eRDa9fadgNaa3Yd4zCckZY2/c0O
 tT3i8p0j6DNS0qvRwedo8r7Khc7CFbBTQH2G1Q+g90ui7oEU01CKJ9A85/SCPN8bPwgY
 FS3BH/lGc3ZMuO/hTKgeVZ//0m22Bxst89cguDoxoDFmm0ZiDXocbUjA+Y7hUIhXXEk1
 iP7w==
X-Gm-Message-State: AOAM533nn4EA/cFI/gXuY6sToeCKiTF/6ehC6hGmubjYvjDS2ZFsDwa9
 N0ce5AZUoJ0exSfaT7XABy2bEtjHxu98n2lP
X-Received: by 2002:a1c:1bd0:: with SMTP id b199mr7330048wmb.127.1618569612631; 
 Fri, 16 Apr 2021 03:40:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k11sm6033876wrx.88.2021.04.16.03.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 03:40:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0?] hw/arm/armsse: Make SSE-300 use Cortex-M55
Date: Fri, 16 Apr 2021 11:40:10 +0100
Message-Id: <20210416104010.13228-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tJDApDXHHGd

The SSE-300 has a Cortex-M55 (which was the whole reason for us
modelling it), but we forgot to actually update the code to let it
have a different CPU type from the IoTKit and SSE-200.  Add CPU type
as a field for ARMSSEInfo instead of hardcoding it to always use a
Cortex-M33.

Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a rather embarrassing bug. None of the test code I ran
on the a547 model actually cared about the CPU specifically being
an M55... Another one for the "maybe in rc4" bucket.

 hw/arm/armsse.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 170dea8632d..2e5d0679e7b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -56,6 +56,7 @@ typedef struct ARMSSEDeviceInfo {
 
 struct ARMSSEInfo {
     const char *name;
+    const char *cpu_type;
     uint32_t sse_version;
     int sram_banks;
     int num_cpus;
@@ -501,6 +502,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
         .sse_version = ARMSSE_IOTKIT,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 1,
         .num_cpus = 1,
         .sys_version = 0x41743,
@@ -519,6 +521,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE200,
         .sse_version = ARMSSE_SSE200,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 4,
         .num_cpus = 2,
         .sys_version = 0x22041743,
@@ -537,6 +540,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE300,
         .sse_version = ARMSSE_SSE300,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m55"),
         .sram_banks = 2,
         .num_cpus = 1,
         .sys_version = 0x7e00043b,
@@ -719,8 +723,7 @@ static void armsse_init(Object *obj)
         name = g_strdup_printf("armv7m%d", i);
         object_initialize_child(OBJECT(&s->cluster[i]), name, &s->armv7m[i],
                                 TYPE_ARMV7M);
-        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type",
-                             ARM_CPU_TYPE_NAME("cortex-m33"));
+        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type", info->cpu_type);
         g_free(name);
         name = g_strdup_printf("arm-sse-cpu-container%d", i);
         memory_region_init(&s->cpu_container[i], obj, name, UINT64_MAX);
-- 
2.20.1

