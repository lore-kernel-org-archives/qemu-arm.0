Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp184361njb;
        Thu, 30 Jan 2025 10:27:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpEWMQTEG3kewQ4o01OXvcdu3lUbvPHFC51uyNlIiynTVqhw2FgbmCwnNvhzOie9oCWmokLcTizL9K/g==@linaro.org
X-Google-Smtp-Source: AGHT+IGIeW0SKuK04unZYFJ0GprF7F14McT9R0pa3hGOOpAJmorxq0tabCUgc/LawZlG/tf+t+9y
X-Received: by 2002:ac8:594d:0:b0:467:63a5:fb9c with SMTP id d75a77b69052e-46fd0b90e65mr113906411cf.44.1738261665129;
        Thu, 30 Jan 2025 10:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261665; cv=none;
        d=google.com; s=arc-20240605;
        b=L+Q4IhrVAcm+gxVB31j04oR9bw28JIZcINaAo1qj9luU3FmBR4/WHB4tJctl4OL/03
         TWNocFEzAssTavLBQWWViF9D4nzILCu+omz1MX1F1AkG7W3lY5YW8rPkQqy5iw0glzsc
         1lNoohhifq91Qmpb8uocssNK4KJy/Xip+ChwGqeCMX3cxmSUFapQMWcJeJnFk8AzsvWX
         LxjfW2CTqNlo1SUUePW17dHyA2szNkLx9z9D2wVhU9pOzkEjciZtYT1QfAmwC+ltu3DS
         /9+CAE0emjuuooZYe4EI2hee0XtgFdHBBR99LULhM8dUGeXcYYh2s4BAGkr9jZ9Loxe/
         rS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XQNs/MO88QA6DkNCjxkxynlmOBFAmoCxktVishKIMrs=;
        fh=6HZvqyMCXiwJQ/MoihMqxYtNdzOYGvElqQiuK80LN4g=;
        b=gknQiN3DCzuWqkSWllHu0Kgt3K8p0/vXGiw6ZKr+cHY7BnM75zDLrbumIRsh88lMEx
         eap2P7mD9NpjG67vtBYNW0qwfma83lnCC8dZysafnZ9dmqcRowjzkdeo1DMiPYqR43jS
         CLwKxDG8rtG6BKgJcyIWew7a4O7JK6glOayA2rTyLEVh/py7hZJH0YiYniXXe1VtV9IZ
         8mYdu5AjshnBpqeEpcTIYDjG46sa/7BsM0nfvLsoIo4jwfhDKdKSMozGWWupUXYr+B7X
         oRTj+64FBWi/V1oLMUCKIc/XdbQtMcDdSmFxr0TU5vIfgE1sH0y6YmBb6VmP1djC3MI4
         qWTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uMkq8ODr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1ba891si21340761cf.242.2025.01.30.10.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uMkq8ODr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdZG2-0005Nh-Bo; Thu, 30 Jan 2025 13:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZFz-00057i-Uq
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:27:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZFy-0001Ty-71
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:27:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso8379465e9.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 10:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738261632; x=1738866432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQNs/MO88QA6DkNCjxkxynlmOBFAmoCxktVishKIMrs=;
 b=uMkq8ODrksmwCYvlOOvoohxo8L9ri9ru6iQJhmCWW1DG8WCtTSsy82rsCHpRZOWT3g
 iuBjzsxEiS3glSKiMRA5gxaF9vdn4vnU+ny7oL7eKagobtxZkcX9SQ2OcDCM0NDmbUAq
 P6SehN3p2SJqvZwJ/CMJAIMlU5abeuFrpFN4KsEH+3w+jojPugulTuNYM8mfuVJ4zBLm
 c4MhYUJVx2V6ZgW3L92KW8JjgyJhkN5h0mt62bNlvoaiTVwxXpX5kLWnfiu0lbM2FwN/
 TCvEBlftMFVqdEGaQzYFJwYttfwiSilIyngUPSQSgy1+wqHZkhyzuxQyFFYj5WOW9g/Z
 VuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261632; x=1738866432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQNs/MO88QA6DkNCjxkxynlmOBFAmoCxktVishKIMrs=;
 b=W0MTepk3dwzRvp69WhCHQNiVfbvCivr2WipFcOLCW+R1/0Ylyg25rndxtwyF5E5s2N
 7h0d8YFhvWxCNRzB83CooL9E0cEtf5DWiTvVNdGoxvgkg5+thqb4wMn6vGsjhtApOMKq
 p+E/n5HnIXLmSZ67+gggD3/u62rGkObzrw18dKtDLw0QAn063nCGIxC49dM0RN9p02kf
 HZV7/kDGTZ9IpIiH4dlkX6ghhiHkJk7Kb6MXHgZylHQ7C1KOwxJG0MNIar2Me1WqcKBA
 orkjK9tCxi8J0e+JVy9UHGjYRXdxPjM9hDj+v7ECUY5ojiBiG7+tpSjI7DIJFdAoB3Le
 OLXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDkWebWK0wSjg8XlfZzWVnBRxj1QWeD1ROEilGqQnUnMuojGo52nQlHbg2Gl4jlOVjAqVzUvK2JQ==@nongnu.org
X-Gm-Message-State: AOJu0YxSSdXMYMiSMvNyDLzxFrUzZa4gTvS0mP19xQlDvvoSXYFJ+Hge
 5/Ditksb8qDEf8cH1lcSKQcNGL6Frh/Hvlk2PtloVhL3iQR4WjRcyBmDktW9/Qk=
X-Gm-Gg: ASbGnct9FwYX9eo/cQDAQdCK5XdrgDQpTMlwlyvomGmUR2AnD6baSRUlWHsr06gA9I6
 y0Fniz0JeUBYJaI7smG2qr7Bk+xnU5jF38r60Qvn/PVpBl7qKvaPOkV/FXMObz5DYIb5NqSo5+Z
 JRLuRRd0iXg/orZSaG3RHyq6eHzIOj/mzPgiP4vADE/iK2dEfhp55RElB5k1BmCeCx37KBZOgtk
 dpeKxdYPsq7CTkRssi5n7P2jcso1Um+QvNel7UkWKaDtEgscNKHPCM/3oGK0Kf6B+nkclOtdbBx
 AG/6EgItR0+gW4NJDLi8L8DA1tcn5gZ8u0RI/4Qr0Jzexfnw6pkjrE1tc7Mq7Z3lFA==
X-Received: by 2002:a05:600c:4fc1:b0:434:9d62:aa23 with SMTP id
 5b1f17b1804b1-438dc40d296mr67137435e9.20.1738261632676; 
 Thu, 30 Jan 2025 10:27:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de2d6sm30922185e9.11.2025.01.30.10.27.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 10:27:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] hw/cpu/arm_mpcore: Remove default values for GIC external
 IRQs
Date: Thu, 30 Jan 2025 19:24:41 +0100
Message-ID: <20250130182441.40480-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130182441.40480-1-philmd@linaro.org>
References: <20250130182441.40480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hhUYCg09Qh/m

Implicit default values are often hard to figure out, better
be explicit. Now that all boards explicitly set the number of
GIC external IRQs, remove the default values (displaying an
error message if it is not set).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a15mpcore.c | 13 ++++++-------
 hw/cpu/a9mpcore.c  | 14 +++++++-------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 3b0897e54ee..372b615178f 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -58,6 +58,11 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     bool has_el2 = false;
     Object *cpuobj;
 
+    if (!s->num_irq) {
+        error_setg(errp, "Property 'num-irq' not set");
+        return;
+    }
+
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
@@ -146,13 +151,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
 
 static const Property a15mp_priv_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", A15MPPrivState, num_cpu, 1),
-    /* The Cortex-A15MP may have anything from 0 to 224 external interrupt
-     * IRQ lines (with another 32 internal). We default to 128+32, which
-     * is the number provided by the Cortex-A15MP test chip in the
-     * Versatile Express A15 development board.
-     * Other boards may differ and should set this property appropriately.
-     */
-    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 160),
+    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 0),
 };
 
 static void a15mp_priv_class_init(ObjectClass *klass, void *data)
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 9671585b5f9..c522f8d4b05 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -56,6 +56,12 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     CPUState *cpu0;
     Object *cpuobj;
 
+
+    if (!s->num_irq) {
+        error_setg(errp, "Property 'num-irq' not set");
+        return;
+    }
+
     cpu0 = qemu_get_cpu(0);
     cpuobj = OBJECT(cpu0);
     if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
@@ -160,13 +166,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
 
 static const Property a9mp_priv_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", A9MPPrivState, num_cpu, 1),
-    /* The Cortex-A9MP may have anything from 0 to 224 external interrupt
-     * IRQ lines (with another 32 internal). We default to 64+32, which
-     * is the number provided by the Cortex-A9MP test chip in the
-     * Realview PBX-A9 and Versatile Express A9 development boards.
-     * Other boards may differ and should set this property appropriately.
-     */
-    DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 96),
+    DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 0),
 };
 
 static void a9mp_priv_class_init(ObjectClass *klass, void *data)
-- 
2.47.1

