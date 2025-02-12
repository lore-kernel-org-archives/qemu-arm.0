Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1090004njb;
        Wed, 12 Feb 2025 07:45:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLdnr/qvLA5yYWmwu8aTqMnd4I/pl6mP/VYOJDSoEa1pAh8UwRlfPVVRDCsUhi71bizzDOKftTkz9JTg==@linaro.org
X-Google-Smtp-Source: AGHT+IFlCpcwgWUyC+neBUkFqNgMzVGc8iygxp8pU/mingkOl1LNdz+lLYQdJ7H1kud5ms0Y8pbh
X-Received: by 2002:ac8:574d:0:b0:471:abab:7a82 with SMTP id d75a77b69052e-471afeecd54mr61212181cf.43.1739375138323;
        Wed, 12 Feb 2025 07:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739375138; cv=none;
        d=google.com; s=arc-20240605;
        b=dylqTmFa6UwW+6tht3It8ToFxwXz+dtwGNTbK1zXU2e61didMemk6M/KCoZEOQ4fcJ
         XSycl5nyjn/erzCxSTKQbtylMOsfN9xCoTv1ZV2TaE75X+bAETgSWIuVfcTBU/oYak5R
         5XcglPBBcUC3xo74VgJSyF5ZgfOY9lPkX9H5AmcLi8Zr3O010P7mVSNYqVqZV7HhzqDV
         bRPsvYXGa5tHRSXimQu3djeQ88UOfVGNrSvWW8L+ti7kesOJgWHriJfFkf3h0JMWhb2l
         sy2tGrAJgezIeYHh7lNT3Wt71DXpGlJ6zt7SxHZFslZ11gOEgL8qosT4hoeLRTQjRuGT
         a9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mwycz5Xhxtli1uhKd9D+bdo2NY7ikbIMbnIzjX1Fs40=;
        fh=lzaa7I3YGCYWkDWyTcVwEb5cG79+nkOCzjzvwF81yJk=;
        b=Jy7lH5tu1VdXMMUgeWMKhhhpqLHzWbM3cJeZ4PXkCL6F4s8fWKVZ76ySpXTS1XyciU
         GEiB2IdYHNeyfiUtwid7GDxJW4NejOUqTEPzhaw/H3YLjZxvwNIzqNojbTxKNE1FgEE+
         P1LNXLq7R3fimlPk84ZCoVhJPNdqU9ToJef+ZgqoUfAgj8hhgzRe8za31wZr32cBpgX4
         H8i7FJdMHK6LMkKGzeK1JdD+LrQeXrDc/R9+GT6RmtyfA3USwlrdGApDv2vdf2NvGJZY
         YdrSd37phH5tKo1H1VKNjVQDcG7RkI8mt/Mc4PRJgUQV32mwIa0nboORHmWJEAPW7jBV
         qtTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kxt/IVvn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47197dba4easi58821941cf.54.2025.02.12.07.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kxt/IVvn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiEuv-0005Nn-IF; Wed, 12 Feb 2025 10:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEuR-0004pB-HJ
 for qemu-devel@nongnu.org; Wed, 12 Feb 2025 10:44:20 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEuP-000702-Mr
 for qemu-devel@nongnu.org; Wed, 12 Feb 2025 10:44:19 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4395f66a639so1935025e9.0
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2025 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739375055; x=1739979855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mwycz5Xhxtli1uhKd9D+bdo2NY7ikbIMbnIzjX1Fs40=;
 b=Kxt/IVvndSdiupZd40lsqfqr1fHbeRNey2WUM9z8yzwitHSYr8bR4YFDddFbxwkRTm
 f2HAUZREq9ure5I5tj9Q8gAhE3eg1VdnxQHP1rpj3+AuZ1wxNEyAPU5a2oCz1UdtBJU0
 Id45Iaj3al3hTx46LS6WqoPl+CmRxi+MfA3ptWIkB80QoYY4WBRb1xNOAqCheW87D9A8
 ++N4sRGQp3EWgf5Gkp3eB9HH5HGdWBsGNBKSRDqjz7gtD5Mca3T7mTvtLIbHfs68Bsls
 tw8H4KTAbrW/5hPu2CxVzAzt+vf7duzSVajTjcwbqGKf9aDJWljsKFOJbYOqLv2oU+Ny
 radw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739375055; x=1739979855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mwycz5Xhxtli1uhKd9D+bdo2NY7ikbIMbnIzjX1Fs40=;
 b=tPcUQthxOX0ku1XWNsGGGRVW6dvxQDEPiRis9uAtodP8AAkvTrcj7BjYK1fIpzVSWc
 p9fNzcfnTvqKohn5g/O2Ey/CHVT2apT3h+mmWSFtXxh/Yoov/3+MidEUhZT97hGIeCD6
 eUTFPJOYaQo7jmh5cYWGL04PRGf8DT5XdDjVzNgUaPI/JjRzPa+0IrdOKnPlNMsWdC5M
 wyecz+psO0Pp5oYcn2NQ/76JzA+ToEUkTkcpTwXCqmmvsTr3Bz3POsHQAHySOe7b49VS
 rXuBGRm9qTI7ezPpfIYgDDwcLo7rLyupzYEehBm83DOTMeT3LQ8Jt0mcbm9Wki1yXh3A
 S8pQ==
X-Gm-Message-State: AOJu0YwxYBykDwxhdniUzuzH2OTxWxOAs2uPWKsIH5uTyiac7VozepS0
 ZlAHjswKZS1km8XB2WGk/F1CkZkKL65aAn0a4cBYUdrAQWQaArGC42Qc+18PgZ1ThiZvzpyza/a
 e+1k=
X-Gm-Gg: ASbGnct4j5IgYza60zNd+zb65mx9ouQ9c/2TTRNHIq31NFGS7aJHtA6rDOnMif9bUES
 W/7KAjLCLGi7/SivkeROPKw6DO/6i/4WaLlwt6a166DtBMt9/aEV6TmQJSOYkEocYcIGdOjN2qI
 Q70StaQANEcFWLEFtWlRC1vL9D9wrPIWixcgPSGwZxtmZzRBO9RaNN4oH4SAA+WYn4Qn39vngvT
 try70ywKSAppghvQppLjfW5OlIubaXLgRt4qGLj7s4qdel61K7lFWHCoFE8VewNXX9sN9xNN3yG
 Q00bbfJwHxAYN/3YwXW/LJ5/+h0BNdkmvVzE+x9a2k/0i7nsSCsiUG4qTo5K4WQ8q7lk1GE=
X-Received: by 2002:a05:600c:2d53:b0:439:5a37:8167 with SMTP id
 5b1f17b1804b1-4395a37827fmr27759845e9.19.1739375055492; 
 Wed, 12 Feb 2025 07:44:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a053c58sm23026455e9.13.2025.02.12.07.44.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 07:44:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 8/8] hw/cpu/arm_mpcore: Remove default values for GIC
 external IRQs
Date: Wed, 12 Feb 2025 16:43:33 +0100
Message-ID: <20250212154333.28644-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
References: <20250212154333.28644-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QeuPTIgo0pjy

Implicit default values are often hard to figure out, better
be explicit. Now that all boards explicitly set the number of
GIC external IRQs, remove the default values (displaying an
error message if it is out of range).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a15mpcore.c | 18 ++++++++++++------
 hw/cpu/a9mpcore.c  | 18 ++++++++++++------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index d24ab0a6ab2..676f65a0af4 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -58,6 +58,11 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     bool has_el2 = false;
     Object *cpuobj;
 
+    if (s->num_irq < 32 || s->num_irq > 256) {
+        error_setg(errp, "Property 'num-irq' must be between 32 and 256");
+        return;
+    }
+
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
@@ -146,13 +151,14 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
 
 static const Property a15mp_priv_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", A15MPPrivState, num_cpu, 1),
-    /* The Cortex-A15MP may have anything from 0 to 224 external interrupt
-     * IRQ lines (with another 32 internal). We default to 128+32, which
-     * is the number provided by the Cortex-A15MP test chip in the
-     * Versatile Express A15 development board.
-     * Other boards may differ and should set this property appropriately.
+    /*
+     * The Cortex-A15MP may have anything from 0 to 224 external interrupt
+     * lines, plus always 32 internal IRQs. This property sets the total
+     * of internal + external, so the valid range is from 32 to 256.
+     * The board model must set this to whatever the configuration
+     * used for the CPU on that board or SoC is.
      */
-    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 160),
+    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 0),
 };
 
 static void a15mp_priv_class_init(ObjectClass *klass, void *data)
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 25416c5032b..1b9f2bef93c 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -56,6 +56,11 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     CPUState *cpu0;
     Object *cpuobj;
 
+    if (s->num_irq < 32 || s->num_irq > 256) {
+        error_setg(errp, "Property 'num-irq' must be between 32 and 256");
+        return;
+    }
+
     cpu0 = qemu_get_cpu(0);
     cpuobj = OBJECT(cpu0);
     if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
@@ -160,13 +165,14 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
 
 static const Property a9mp_priv_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", A9MPPrivState, num_cpu, 1),
-    /* The Cortex-A9MP may have anything from 0 to 224 external interrupt
-     * IRQ lines (with another 32 internal). We default to 64+32, which
-     * is the number provided by the Cortex-A9MP test chip in the
-     * Realview PBX-A9 and Versatile Express A9 development boards.
-     * Other boards may differ and should set this property appropriately.
+    /*
+     * The Cortex-A9MP may have anything from 0 to 224 external interrupt
+     * lines, plus always 32 internal IRQs. This property sets the total
+     * of internal + external, so the valid range is from 32 to 256.
+     * The board model must set this to whatever the configuration
+     * used for the CPU on that board or SoC is.
      */
-    DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 96),
+    DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 0),
 };
 
 static void a9mp_priv_class_init(ObjectClass *klass, void *data)
-- 
2.47.1

