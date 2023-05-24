Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2614750ejb;
        Wed, 24 May 2023 08:01:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yRrP42rwe7XZ69vr89vB9U6RhGU6xX2dMFfQr+pnpPjIB2yZGonJM0WCIkhsFW4J62/4N
X-Received: by 2002:ac8:7f48:0:b0:3f6:c609:e9da with SMTP id g8-20020ac87f48000000b003f6c609e9damr2067537qtk.44.1684940491569;
        Wed, 24 May 2023 08:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940491; cv=none;
        d=google.com; s=arc-20160816;
        b=RZpN5R1Bo2ed49zRed5MCawg0DS3esMP0384W7aJgy7Mv7Maz6NE91D8fJT/oHbkcf
         19Nqh3Z4XKDbU61bZz9q3mumxxXW/GrPV5XxgVjxU21gSVn0O1PIq2w+WMu4ajrsv475
         KoAzj8QBqHLTCTzJabs5ET8hz7DfTO/9+2K6w1ikhXliiVF/PFyUI5mOkwfJrOdFSRaj
         29DmmKUqE9OJiU6xrSEfyOj4/1oiTuanSk1b1+Awo2HUBnQYb56rM4mpWniTPLX5YS9P
         e97yb5C/qjCixJkIUyXfGv5c6rA4mT8vyq+v5izEf1Th2LtdHYzzedd7irg1L110QfC9
         f3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kk8jHY5mepVVbmOZAIHsqrtCCvRurLEnDXO0jm3/hbc=;
        b=JiwJcmBTCZDZ+yfW5aG5lSGhyqpTF8GAMBUBAlv8dWXDF+2WudNbGLldBrN5wig8xw
         z4iWT58++dMdDVqKhzwG/evGJYX3V0i/RNZhx+JDN3DL+Kxd8c9xd73uf+gmre4SGOcv
         XhVyZeNJHINs8NHitw0Y0geNmn/BXU6bdByV/oH7AUINfccrnbis4TzA05w5DCKA1JTV
         5sqWCX9v9O6s8In1x46AobOskoijtax1Psz0R3jdogyGQXxdaYUJXZqG5UW8U9IV5OEu
         WvJOAUOr04xqbNrfipyKwP53JGS7NCpx0kONBHLeYqUjPCNxorHncnqMEVvO45TyJc/Q
         gCvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIrhM3Au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05622a100800b003ea63719f0fsi6632917qte.611.2023.05.24.08.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIrhM3Au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1pyK-0007GI-8K; Wed, 24 May 2023 11:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pyE-000779-9w
 for qemu-devel@nongnu.org; Wed, 24 May 2023 11:00:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1py9-0006gJ-DM
 for qemu-devel@nongnu.org; Wed, 24 May 2023 11:00:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-309382efe13so686595f8f.2
 for <qemu-devel@nongnu.org>; Wed, 24 May 2023 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940403; x=1687532403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk8jHY5mepVVbmOZAIHsqrtCCvRurLEnDXO0jm3/hbc=;
 b=AIrhM3Aulmqe+FCp8DksBqIW4DT3ESrVWIMlILTFSkxfKoMmVp6JCBk4yVuhNz7mtn
 KH0Dvh3c+XMMvdWJVWSJQ+Su2c4+Wy6/jhPyvMsSQVPoIfkmB3+mEQ/bF+JgwFBVvgjw
 hyi1Avw3bX6i+MvP35JxoyI1475l+5wo3kFzpm65KTPvV41H3V1B0sphd4o1vI2lDy9F
 trQi5xesM8+Pt3BYIkbqxS8Ap0hPZ/TZ5rwhsRmOsJT/EoMaUUA0QtB9tCMoGJAYMhKR
 vlqB7ilghf7BWB9G1kJsVBZtN9Cm2wL3Ht+BrOcuJ5TOJn01AC8wcNC4vgJoU4XvE+yn
 iAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940403; x=1687532403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk8jHY5mepVVbmOZAIHsqrtCCvRurLEnDXO0jm3/hbc=;
 b=eUym+cVIyF36di8kKnYFxP05MxmiyO4+BjxI/Ms0Uz6juz0C1s44FrlD8HmJ7QpgHi
 CZV9hKseRHraziN0GeKWVz/sWPqyLvCD/K0LYRekmLvxAYBaBVnlGY+50WAo0FeZR1fW
 sjYMhAQnEOxinCiD9QiPbZLd3f4YeNjQHOQ5xJkH6cGqMm6T6OkB1IOL4PTOEBcMly7z
 MGD/AJ6Z+vjgx0fNA824wV3rThJU+gcmv/1WaM4qCIKD6/xbndOUTgxP0JKoS3Wq5wKa
 zYkHEYYt/IO0Aid6Mw+vLIc7rFm+bKWpaxB4ni9BQZnYwWUIXVKQFpobOXXssnliXy+I
 P4dg==
X-Gm-Message-State: AC+VfDzFoxhUlKEF820r/Csn1Ex0wXC1IBJPLqq//GX2TukcZEYjLFfe
 OeU65+O0CwoT9aH8mu3EgglBEdZaQjOVoXpPZGk1WQ==
X-Received: by 2002:adf:ee05:0:b0:306:2b83:2d32 with SMTP id
 y5-20020adfee05000000b003062b832d32mr49767wrn.43.1684940403553; 
 Wed, 24 May 2023 08:00:03 -0700 (PDT)
Received: from localhost.localdomain
 (fac34-h02-176-184-31-193.dsl.sta.abo.bbox.fr. [176.184.31.193])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff783000000b002e61e002943sm14656962wrp.116.2023.05.24.08.00.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 May 2023 08:00:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/10] hw/arm/realview: Set MachineClass::default_nic in
 machine_class_init()
Date: Wed, 24 May 2023 16:59:06 +0200
Message-Id: <20230524145906.33156-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230524145906.33156-1-philmd@linaro.org>
References: <20230524145906.33156-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: d8rgtnsQ187r

Mark the default NIC via the new MachineClass->default_nic setting
so that the machine-defaults code in vl.c can decide whether the
default NIC is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index b7bb384000..0b2d6b82c8 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -70,6 +70,7 @@ static void split_irq_from_named(DeviceState *src, const char* outname,
 
 static void realview_common_machine_init(MachineState *machine)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     RealviewMachineClass *rmc = REALVIEW_MACHINE_GET_CLASS(machine);
     ARMCPU *cpu = NULL;
     CPUARMState *env;
@@ -274,7 +275,7 @@ static void realview_common_machine_init(MachineState *machine)
     for(n = 0; n < nb_nics; n++) {
         nd = &nd_table[n];
 
-        if (!nd->model || strcmp(nd->model, is_pb ? "lan9118" : "smc91c111") == 0) {
+        if (!nd->model || strcmp(nd->model, mc->default_nic) == 0) {
             if (is_pb) {
                 lan9118_init(nd, 0x4e000000, pic[28]);
             } else {
@@ -378,6 +379,7 @@ static void realview_eb_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM RealView Emulation Baseboard (ARM926EJ-S)";
     mc->block_default_type = IF_SCSI;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("arm926");
+    mc->default_nic = "smc91c111";
     rmc->board_id = 0x33b;
 }
 
@@ -390,6 +392,7 @@ static void realview_eb_mpcore_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("arm11mpcore");
+    mc->default_nic = "smc91c111";
     rmc->board_id = 0x33b;
     rmc->mpcore_periphbase = 0x10100000;
 }
@@ -401,6 +404,7 @@ static void realview_pb_a8_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "ARM RealView Platform Baseboard for Cortex-A8";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
+    mc->default_nic = "lan9118";
     rmc->board_id = 0x769;
     rmc->is_pb = true;
     rmc->loader_start = 0x70000000;
@@ -414,6 +418,7 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
     mc->desc = "ARM RealView Platform Baseboard Explore for Cortex-A9";
     mc->max_cpus = 4;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->default_nic = "lan9118";
     rmc->board_id = 0x76d;
     rmc->is_pb = true;
     rmc->mpcore_periphbase = 0x1f000000;
-- 
2.38.1

