Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp243238ejk;
        Mon, 29 Jan 2024 07:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPfUBhZsugGd3ZxUsK3CiXQ+e/OcWSLBu3KfVgoFTT7DsLz+z7gPT509AqZWa9oG74xad+
X-Received: by 2002:a05:6214:76c:b0:68c:5ac4:ae7a with SMTP id f12-20020a056214076c00b0068c5ac4ae7amr533917qvz.55.1706541565337;
        Mon, 29 Jan 2024 07:19:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706541565; cv=none;
        d=google.com; s=arc-20160816;
        b=p3PyT5TNKewqEq5VfDOctHZvA6+o8kTkJftTNXktitDlxa3Z3Q3mRaQL1HOakrXt5Q
         EjZ446rSK/qRFw2A9MXxYblmBivAjhADP8PQ4eqfSB9lCJmLh1FT9fFf+rwEZufcIczK
         SuU0HqOllPON8HjFdoDOwl5fIjodKDo7XZrFEz8IWPri8ti9qNxZ9DTTaFtAlcDpzNvi
         wivBPhmjbpIE7MoOSg/N4itsjEf5ql3NlB94I38Hlo1qktrMXkwAeF5HgXntOjj/Q4B3
         exf97F5G0us1mAyV8l27NHdys1zfKmg3IUiFtAT5SzomWMs2hgcorY8tGAUYrlMVU6rb
         0rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xtXJej6F9O2lSIbmdUvlDD/icBrkbUZ4loB0TQu2OEE=;
        fh=36wJ/nYrPLZmRQQgalgeL37C59AM5Zbikh1oCIbsvWY=;
        b=BY1+vW5QJnVtD3rvASt3VuCNCu1cSnYyILRFyztFSeqoQ3xpX2OpvNxljh14mVyDgY
         iRGQnQ9DrXtNAaW/jYBjjPci8cAFuB09RdxrrK7yJjvdH1YFPLNIVd5iJemHvAo7KP2B
         OHrvzevD5rA0q++t4zB2oAlSovYFMZZoWTvbxivMIGASDHF6Nf3Kc7ZkAFYo/BSYypJ9
         nEw5ej+lnmb+w+zfPJdB88LXU1WbjoAKHqGrOvxnn6JmmN4yyMWnaM+z96v7Tv9ANsOo
         lkbFQAjP1wOxFVqQXWN4EjXxmofb0beEtt2UauqccR7OcCwH4H3i4rzIyOM3kH+KNdEo
         zYNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HiM4rDVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a218b00b00783e29d715bsi5752251qka.769.2024.01.29.07.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 07:19:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HiM4rDVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUTPw-0007wI-QO; Mon, 29 Jan 2024 10:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPv-0007tK-VL
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:19:23 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPu-0007XL-BR
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:19:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso38813195e9.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541561; x=1707146361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtXJej6F9O2lSIbmdUvlDD/icBrkbUZ4loB0TQu2OEE=;
 b=HiM4rDVJVvjLcYtFC5JkQE+wQzB0gXQ1yeMAQ9jgyNkK6QCqAbr8SVjas9EmOFrWll
 jJ6fvhWZG+SQazLgQ0vYpFOpgPcWKq6QplQ1rEuPi0EereawdDODq/CLcq2JAuEp2LR3
 AdwC/mux80sBrRQ6uWE2M1omtPBQbT/Koy/qKkvVjojxMYSb7tTVja6zsi+Nrb/bDPv+
 fjQJ3RZYCfp4ALGCzYHvppT51p4+OGD0VeCXdRq8IXzDLOnl01TktAazjIh5X/GaDaQc
 GShBEpBaIiX0epNcxeN0G1DfPJDxAVgQ99tmPsp+lAb6vH/j6UxmnnNiC07TQrUiexHO
 Cuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541561; x=1707146361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtXJej6F9O2lSIbmdUvlDD/icBrkbUZ4loB0TQu2OEE=;
 b=C84ty4dME6kz+1fwiG8xtPcAsLj55/X4FnTiYWFUl8nIzWudZdVXNKtVNNzgRBO5sC
 At359zvXaKKRDNkI3jHjiwBVA+fXL0yJOLDroRDB86z1cvlvdVLHWGswAShGPc0vjuIo
 knd5epSlgiflAdKvPjLgaxhUbnos6gJ/OvicbT1Lc70717L7QATcAvD2Z9Brf3H3l0bq
 WLUKRw5larPjxu3du7w6KXzH8soWcODDC6XMlyzZLhV7h4zrynlShQJRS3WZooWGGrjU
 lgxMAl1tJd8Mw5xCCr9skZgPSykyUp/fAtV5tE7K2f4FuNVNweruggXf++PXB5BiDu3C
 fLOw==
X-Gm-Message-State: AOJu0Yxr1SpBgbHYrpPiXCZWQrzmZf6yQVQrPI/73k0oQtqjwdRVEflP
 jok3dlb0nj89FRbUMjQtpiRDABXHUtpSmmAwnHxtIAW9gCRvSw/3uEkl6a/DpDM=
X-Received: by 2002:a05:600c:4708:b0:40e:f69b:a9d7 with SMTP id
 v8-20020a05600c470800b0040ef69ba9d7mr2647959wmo.10.1706541560911; 
 Mon, 29 Jan 2024 07:19:20 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c459400b0040e527602c8sm14361157wmo.9.2024.01.29.07.19.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Jan 2024 07:19:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 8/9] hw/arm/vexpress: Check for CPU types in
 machine_run_board_init()
Date: Mon, 29 Jan 2024 16:18:27 +0100
Message-ID: <20240129151828.59544-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240129151828.59544-1-philmd@linaro.org>
References: <20240129151828.59544-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: aCuoqTOi4cKR

Leverage the common code introduced in commit c9cf636d48 ("machine:
Add a valid_cpu_types property") to check for the single valid CPU
type. Remove the now unused MachineClass::default_cpu_type field.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index f1b45245d5..1a14c1933e 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -783,22 +783,30 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
 
 static void vexpress_a9_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_CLASS(oc);
 
     mc->desc = "ARM Versatile Express for Cortex-A9";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = valid_cpu_types;
 
     vmc->daughterboard = &a9_daughterboard;
 }
 
 static void vexpress_a15_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_CLASS(oc);
 
     mc->desc = "ARM Versatile Express for Cortex-A15";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+    mc->valid_cpu_types = valid_cpu_types;
 
     vmc->daughterboard = &a15_daughterboard;
 
-- 
2.41.0

