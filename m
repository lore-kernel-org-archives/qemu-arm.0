Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp215498eje;
        Tue, 13 Feb 2024 07:52:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXweu9fljySziKrDT0hISR6JJmdTtJnDithGIhoEdA6fA7WvehG9ZWscpOYFZwwnI7lKKdyG3ylJGJ5y6P7DLYuaCL2skF1
X-Google-Smtp-Source: AGHT+IED49r4+nIytSVh6dii8j1l91sAh/nYMpfQKajoU+1wU/P2sXnq/2QMyVWuHYx8qj2D8NeK
X-Received: by 2002:a05:620a:9da:b0:785:8c58:e336 with SMTP id y26-20020a05620a09da00b007858c58e336mr10608115qky.54.1707839573148;
        Tue, 13 Feb 2024 07:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707839573; cv=none;
        d=google.com; s=arc-20160816;
        b=Nq/muKnqGC6GhtjtvpDKGQQ4tk4+i84DWmr5c7gHaOWGvrptWsJfAkzF8Zc0UJF6Ex
         n/cRnY66eD/Ea2fx3uPxXnuDO0qofPwHFZ7JtEmPaW2ZVP0QOocjLoya7hO4AYXXNPDB
         UYlQYj0l3JS9oXAAqmIiYuVzi0aPBk1C2Wdyhp/3sYg4AVtEF0gCp4jhlSi9OPScE9dn
         Y8HRRSy+VLWdvEhN8bPPvnt1vkseiSRbPh6M+HdjM+Khgi5SHRUKcUbcKN5xqbKKlbbV
         W+Z8YzG8UW2tYpFybr7ug1EIZEfXCG0BJ+5YBXCd2jyGo0nCHEGhReEMJ2WEZ7c3IMyb
         Bm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L085CpBqbUnpyqRxr8xkRM4/gsDgBNq2ejRMwVmcLvc=;
        fh=ApcAzZLAsKqBbCgk9UWLWFLOYqtlwLXdwiYQjX/kLtw=;
        b=ne6AuCkUqHDr6L+fjVjyqTpNIe2Bz8q0uNks4jsg1ABTYxHYbJB+sliQIfppBC8tW9
         pcHaRLB6LLJgj1w7RGgmfjvn6hQ1/tEWTQ5A0UJSKOMeDWZoZo1XSJP46UFWgk62ow0M
         lPFUxbSr8+KRt4nk3pWtPdu8c9PtlNsBViQ/vZd0EOKTYwZpqzRgveIgWfUHC2F61/yk
         FbYkZG1Xmu2JbiubjON/YdTp7nsYjAgc4RShbYs1YV7kGPnpGLiC4oACpb2m20p1SLz/
         WdWbJvPQ1n8rsORdB/Yt7NzceeVVk6Vdh7aZah0h27ukmA1uDVVn42QE3VQcfDPhZBjk
         v+Aw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gqfUylW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCVknFW9f3kJBaG+H0+zF6yKWUCFKqK5gljYzO3UgIujE2OQig1f2DZVULVm+VkxqZ5AEdm0APz7ujWLGtTwPyqzl2ywQy+p
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a000d00b00785db666b7esi3518789qki.739.2024.02.13.07.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gqfUylW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZv5F-000186-Bx; Tue, 13 Feb 2024 10:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv5E-00017Z-BJ
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:52:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv5C-0005nE-Og
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:52:32 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso35554905e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 07:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707839549; x=1708444349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L085CpBqbUnpyqRxr8xkRM4/gsDgBNq2ejRMwVmcLvc=;
 b=gqfUylW1BlOnHp7REJXELwFpkibfREbnhWI+7NDJqlUUKV442ZM19/Q9yr86+thPZG
 7rqOP719Dq7wiFe6IF2LNVl+CwJAcFa6tL7beQUoBqAlLoUOWc4ted3axR17a4uaOE2A
 Ij9fwmZLSwuuOd0KZViEVYQowzusFSjjPYMMqg8Wv8mhWNAy5i8vCLxI99dzs+iexCn/
 +vHAPORZdbdwEkUNrFF54iisIDybysL7CqL6NvbWjVgnhwE/4vH/WzqhbtPpuwWWJqNo
 nk+IwdNkRtCa4QC0zsL+V69wOCcFUTi3bZY/KWSoUp8x2y+GzdpVWw/xz6xqY+6FEKbj
 IM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839549; x=1708444349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L085CpBqbUnpyqRxr8xkRM4/gsDgBNq2ejRMwVmcLvc=;
 b=CChJtCPye4DmjZ0l+0aAr3SzF9XvLNuCazWd81HYGqsP1fU8D8G/DftRWUKi0h2C8W
 oj794bfQ8J/H1GAcpo1+sNHC5AS6u/aJ4f3zELXkk9Xpi7FLfZO1LmbR8PtP+xYlmTzH
 f6yheYz0aclNtAKXzrFPoHhsO7rXrrx0HtzG/jtPnMgHmS4TPDdRjj7ABAw6Rt9BIsFD
 FV70Sl3/fqSMroOK2IykvGe7+O65Dh+DuFLYDN6TOoyn16s/yrb1E1EZSMCxk2ieZqWJ
 LIRC1v8yQHlH8Gb9z+Ns9ZAxTZW5RevUCurJ6erMQzL1P4YAQn3D9TMNRjJLSdSab2pm
 4J9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvpvtubMKBUVAcysPUnvd2otRjJhiYJhxMmB63IIr5e+l97fWXvxdhP/INNGETu7/K5ovk8K6CjZpOwJ5S85PAc4ab
X-Gm-Message-State: AOJu0YwfzbIRBf3ApJj3E8gm9JCaWN3D9Zqw2oSGQn5KP9bBLhyGTR19
 1DOKuUYKbPL/F6A5tcN1qTN/t8CbuTlzrCAgBsHQh0emfrttbk9070iA0wANY90=
X-Received: by 2002:adf:e68a:0:b0:33b:68bb:e0d4 with SMTP id
 r10-20020adfe68a000000b0033b68bbe0d4mr7797379wrm.56.1707839549476; 
 Tue, 13 Feb 2024 07:52:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUw9y43ORycSmZRs6lqlG6429iNGLXvQA6XQLHwb0lbgnL7tN5yeWLsm0rHJkPib5f/eWu5ixgBCx4lWz05Oq3aH7JWmC+D0+w12+i8Vs4guKa5o/BXcMo1jlmK0S4zf+BNhMwYl3pPKcjkoJ/bSoHwVg==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adffacf000000b0033b39cba5e4sm9826619wrs.116.2024.02.13.07.52.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 07:52:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/4] hw/arm/stellaris: Convert I2C controller to Resettable
 interface
Date: Tue, 13 Feb 2024 16:52:12 +0100
Message-ID: <20240213155214.13619-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213155214.13619-1-philmd@linaro.org>
References: <20240213155214.13619-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yY++Qc+f9VDR

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 4fa857970b..d3a12fe51c 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -462,7 +462,10 @@ static void stellaris_sys_instance_init(Object *obj)
     s->sysclk = qdev_init_clock_out(DEVICE(s), "SYSCLK");
 }
 
-/* I2C controller.  */
+/*
+ * I2C controller.
+ * ??? For now we only implement the master interface.
+ */
 
 #define TYPE_STELLARIS_I2C "stellaris-i2c"
 OBJECT_DECLARE_SIMPLE_TYPE(stellaris_i2c_state, STELLARIS_I2C)
@@ -607,10 +610,17 @@ static void stellaris_i2c_write(void *opaque, hwaddr offset,
     stellaris_i2c_update(s);
 }
 
-static void stellaris_i2c_reset(stellaris_i2c_state *s)
+static void stellaris_i2c_reset_enter(Object *obj, ResetType type)
 {
+    stellaris_i2c_state *s = STELLARIS_I2C(obj);
+
     if (s->mcs & STELLARIS_I2C_MCS_BUSBSY)
         i2c_end_transfer(s->bus);
+}
+
+static void stellaris_i2c_reset_hold(Object *obj)
+{
+    stellaris_i2c_state *s = STELLARIS_I2C(obj);
 
     s->msa = 0;
     s->mcs = 0;
@@ -619,6 +629,12 @@ static void stellaris_i2c_reset(stellaris_i2c_state *s)
     s->mimr = 0;
     s->mris = 0;
     s->mcr = 0;
+}
+
+static void stellaris_i2c_reset_exit(Object *obj)
+{
+    stellaris_i2c_state *s = STELLARIS_I2C(obj);
+
     stellaris_i2c_update(s);
 }
 
@@ -658,8 +674,6 @@ static void stellaris_i2c_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &stellaris_i2c_ops, s,
                           "i2c", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    /* ??? For now we only implement the master interface.  */
-    stellaris_i2c_reset(s);
 }
 
 /* Analogue to Digital Converter.  This is only partially implemented,
@@ -1396,7 +1410,11 @@ type_init(stellaris_machine_init)
 static void stellaris_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.enter = stellaris_i2c_reset_enter;
+    rc->phases.hold = stellaris_i2c_reset_hold;
+    rc->phases.exit = stellaris_i2c_reset_exit;
     dc->vmsd = &vmstate_stellaris_i2c;
 }
 
-- 
2.41.0

