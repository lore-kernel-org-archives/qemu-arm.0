Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795731ejo;
        Fri, 5 Jan 2024 07:51:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1fI/2kpwmawXOwekKXp+LgOtqx3UQW545JoOTaiO2xi0CMsa4WS//qYTOiJdMo/Nj0sm4
X-Received: by 2002:a05:6e02:1809:b0:35f:f3f1:dd07 with SMTP id a9-20020a056e02180900b0035ff3f1dd07mr2693334ilv.56.1704469875391;
        Fri, 05 Jan 2024 07:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469875; cv=none;
        d=google.com; s=arc-20160816;
        b=JADrZuvG9iJNclfd1t3oN/MMewb13aWyWUFHnK5I3Y8iIBwNWGH2aDdQ7TMAmFK1Cu
         YwDHIdc85R50P/PlqYCgnNgmjlhY1eUFcagutYxWVSV8L5mojagj+uYqYfOdyA0MHI94
         msHrrETn7pHGBmlTEg+z2h+V8DXffAUWbpbQYgZkv/mErYbwKJcH0xOADHwlApII3k/7
         Sli3SfvE2yjnUD8PYwFtMFQ4aeT/RFHkXiw0iIXzBIFvucrr323/jANSjvv+1RV14DYC
         3/R0rR2aH/bnXUfLV/Dm6nMLNT3/jZvYnxUMQArYTC/hVldVVWL1dHp5Na6NdaoqJb6D
         c+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PoxGR8z2iD4/dV7vlDevdlyqaz6yGMvGSLHUDaB/+Ko=;
        fh=blOP6cOSNCAbDKwnsy0Dgmm9z1Xj+QQhLO4S+72HReE=;
        b=ltVYJWSYGMKoGI/woD0wmNvFBtO/MevBycg0KcZeTcSZQEZgSfJWJUvNTOuCT225r8
         b5UEmW6NHbL1BjUJoz+rHtIynenh7O3dXnzxeHjvl+XIQNo/13Iv3IdPkFMR1Bxiw2S6
         qCuYa4kKWszbQNC0sNt/kN5VMt/jzQFR9B+o8eCRVWidTWNEIAKZeeerDh2D0VQrBYyB
         J9wujN6Rg6EKIQd64DxD3HvSZFjBjMK1PBr+FMCuMjOrDPqFa1mKT4whXuViIpXtlAYr
         LdHBpznBk+J22isPV4hKs1T2Plbs31XVuczFUjKknMkvG+BElnFFj5q8l2wvqNj32oBk
         A+Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lS7mHqvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ac85bca000000b004297d4ece4fsi437661qtb.207.2024.01.05.07.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lS7mHqvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmTN-0002hd-Fp; Fri, 05 Jan 2024 10:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSD-0008GC-0O
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSB-0000xT-9J
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e3b43173eso2092515e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469786; x=1705074586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoxGR8z2iD4/dV7vlDevdlyqaz6yGMvGSLHUDaB/+Ko=;
 b=lS7mHqvQydw9G3Y95Kh+xSnAHmZcPK6Yh8lO6Q5C9+RCv/1NWXRQ4A55nbW9oDf4oQ
 9aSJuVas4MVrsgWiIyEyzqfq+nyNySZfOtIC5N9GM+HXAHyfV/1Lho4v7IPKzpQkYaqr
 egKqoEs5pBlK1/60ZWAnVsBN2S0ysVpzIxlnweC/UHHMq7PIPpCNsERY2FDaavfUtJtP
 4fTGLJ+fesB/gcydoGNKFrRiX3rH8XYdKuDJUZWh43hwFe66wwqDN7QzUPVMpt3zpFZ2
 2kIM3RYtJYkES9osuoVYSZzPSHx2XaQg0UtO6rJ4wRa1uL157YP0fxCdqjJ2TwPoMP1L
 PcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469786; x=1705074586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PoxGR8z2iD4/dV7vlDevdlyqaz6yGMvGSLHUDaB/+Ko=;
 b=vAopE2+uyOOIyk9jvE0fQlPYFcNv00wD67T11MXqyJdQH7LX+XF5a/b9gPtnGO+EnH
 YS4sfq1NjtBDoOzyuYSpMoOHV1+3PJRTWki0CHb+z648+30k/3bvVq4nUkKFCJ9MzPs4
 5waMbe8odL9VZUWPieWOiWIAuxpIdrnnm/7Y5B9QAOpdFzCdAl2glicK3p0rn24LG3t5
 Ju6VKaoVipy2d0qDCkS5hXCBtTTDh89x2wfRRxLV6AB8ECyKXrd0W8A7jhnXgGpFh9r7
 1NfNhEON3SAVBlxzjKpN4T2tpCXvV8NIMA4UUBVHGznTKlaP01V8m6XLtJL0mn9Y7ckl
 1t9w==
X-Gm-Message-State: AOJu0YzKXURm88vkebv9qHfm3ajBeWKc2iAxK0iElsFO+VqTeBCRFGsU
 nj3g0QcavaP+TBXx5iR61jA4ijKO1blruA==
X-Received: by 2002:a05:600c:22d6:b0:40d:5d07:55d3 with SMTP id
 22-20020a05600c22d600b0040d5d0755d3mr819881wmg.177.1704469785886; 
 Fri, 05 Jan 2024 07:49:45 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b003375c072fbcsm896486wrr.100.2024.01.05.07.49.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gavin Shan <gshan@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 65/71] hw/sparc: Simplify memory_region_init_ram_nomigrate()
 calls
Date: Fri,  5 Jan 2024 16:42:58 +0100
Message-ID: <20240105154307.21385-66-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X8KjSYfKLZtO

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, errp;
@@
-   memory_region_init_ram_nomigrate(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_ram_nomigrate(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-23-philmd@linaro.org>
---
 hw/sparc/sun4m.c   | 21 ++++++---------------
 hw/sparc64/sun4u.c |  7 ++-----
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 64895aebe3..550af01690 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -577,12 +577,9 @@ static void idreg_realize(DeviceState *ds, Error **errp)
 {
     IDRegState *s = MACIO_ID_REGISTER(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.idreg",
-                                     sizeof(idreg_data), &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.idreg",
+                                          sizeof(idreg_data), errp)) {
         return;
     }
 
@@ -631,12 +628,9 @@ static void afx_realize(DeviceState *ds, Error **errp)
 {
     AFXState *s = TCX_AFX(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.afx", 4,
-                                     &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.afx",
+                                          4, errp)) {
         return;
     }
 
@@ -715,12 +709,9 @@ static void prom_realize(DeviceState *ds, Error **errp)
 {
     PROMState *s = OPENPROM(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4m.prom",
-                                     PROM_SIZE_MAX, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4m.prom",
+                                          PROM_SIZE_MAX, errp)) {
         return;
     }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index c871170378..24d53bf5fd 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -454,12 +454,9 @@ static void prom_realize(DeviceState *ds, Error **errp)
 {
     PROMState *s = OPENPROM(ds);
     SysBusDevice *dev = SYS_BUS_DEVICE(ds);
-    Error *local_err = NULL;
 
-    memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4u.prom",
-                                     PROM_SIZE_MAX, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4u.prom",
+                                          PROM_SIZE_MAX, errp)) {
         return;
     }
 
-- 
2.41.0

