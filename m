Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959288ejy;
        Tue, 4 Jul 2023 07:51:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZYR2z3eot7+lFUF1y6bxTSXOBcPydsMNA9SNXTk4jOImtzOUu/nky0Xhw38QuvOmYA2RL
X-Received: by 2002:ac8:58d0:0:b0:403:2e4c:28ad with SMTP id u16-20020ac858d0000000b004032e4c28admr15627136qta.18.1688482289234;
        Tue, 04 Jul 2023 07:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482289; cv=none;
        d=google.com; s=arc-20160816;
        b=LODtLF1/A0hxgdVAGuOR6D2lh+zO1J+qlBVRj/zEFfPXPQMjubOXAdI9dKfTho1DIg
         iNep8gn8mTvSDgUVTN4Fj4jW35zkKJ8ynTcv6VZZayR+auuSyAGH58FmmTW33/u/K6Vp
         Hq5exWKdUoyjAj1/GQcZgfVO3XXz8fYf9vOLaj7h2na+ufyAlkOk002lgQ5WplswZcqx
         2d6+m8pcZRXBNeDR978pjN2w07u3sUxrKuoaz2anN8k//7+kWame8yrQ0jUHs25OVTc3
         OlCaP1YATwV8VruuDlCMIBFy9HOJJXmsAV7jEMmMAlhcZXLVWTFCvoLNGbdVHbvIKcuU
         MA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gOIzLPOnHecDCNWW1WAVm9BTrVEQSroQYADUt2FEwKw=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=jT+YL+gpcHhqz76MqtFd/a8Aj93WzCctGOQJc1+j0OVAdRjEYNIOCy5s8ijO636bBD
         FGLgtJbmPWw8aeexelJQxlp+9T5tYA2If+D4lfuXnyhf+W0/tXoM/t0/wy9Pg5SGzFCF
         wlgqNBm5AFD851d6ncCu8l01/V7y9O6Qc7tDO+ycT4mlkw1aandKTQ2eCNZYul7/XFMp
         gjAOJN2huEH1CSuY124b4YuvaFKz6wDOmx+Ci2h3epTnniTJxknMByGMinnWIuG9S5Wp
         MLMd9uElggSdmCBLApPMSlabDiPmrjOad/xztH84pWePTibWU19LkIugMk5qcHpg/kS7
         8eeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tLJM0vQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020ac87f83000000b003f6c3d1c770si13115511qtj.467.2023.07.04.07.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tLJM0vQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhMg-0003uY-T2; Tue, 04 Jul 2023 10:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMf-0003o9-BN
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMX-0002zG-HL
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-313fb7f0f80so6283768f8f.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482235; x=1691074235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOIzLPOnHecDCNWW1WAVm9BTrVEQSroQYADUt2FEwKw=;
 b=tLJM0vQsru0+TU+0rZ7SyswPc2vgJ3H4a72Qg9FG0tQi+6YnROEc3BpPB3APRt4pJn
 TfA/XghcUuNHaoGwW1bdvaUn4SxUo5+3/gU17iSqNyDk5xTJjE5j3bJvZqdacQtlfjZY
 ZN7nbzcEqOlKtTol12hja8+VEOYuPwj94YGDqaWm4uI9cKIA5q6KAtPFQrcm/cEqFY45
 v9GGllsTQrF8BAIeGnKpC++/Frx+JsRtxf1EAlnuN8uNY8WURZRdy+eOMFMzIHi7b+hF
 hwSghL2JaF14NUYjYOWRVAoCGsMkahe+CKaOuDKufjO66MO7rdk+T28p34aMM/c0nqi0
 cgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482235; x=1691074235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOIzLPOnHecDCNWW1WAVm9BTrVEQSroQYADUt2FEwKw=;
 b=jEV8vycOvjYF45u3Pms2V1+P2JJKTUgSVcSYx2rG04dtRoGhEflw7HUuvbH8gsWLom
 ZlsosD16locKLyX+btC1dT7tX083cfiQio0CqBv55cGfSvfYU6ZQjo6oXc8zV/PIQ8ts
 qxQv9pQKNpWWMTOdzKAKpcDn0c3Xr9lRGG9UR7FgDgWTFTYn6B/PHXkUv9uC9KXYZp8S
 uxNXDAKocmBaKdJLkZtMgO7+NOVF3OAmhnfdW5JWQ+y0hqsqvFeZWNwsxv5iDKUF09qf
 n1L3eybvOPA0W1qJMbJzvOfZCe2owc/c46Ggr9Yi2j3wgFa3EhPj43uvv97Y3eGieMqR
 zBmA==
X-Gm-Message-State: ABy/qLZTYTDo8fUzmF3OpJjhYLHcAfUNwhdQvVpFIMMqmU8yUZ/41+zP
 0tsyOinyismF3BIIEshBkQWyUA==
X-Received: by 2002:adf:fe02:0:b0:307:8c47:a266 with SMTP id
 n2-20020adffe02000000b003078c47a266mr9066354wrr.61.1688482235763; 
 Tue, 04 Jul 2023 07:50:35 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adff189000000b003143c532431sm3293979wro.27.2023.07.04.07.50.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:50:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/19] hw/timer/arm_timer: CamelCase rename icp_pit_state
 -> IntegratorPIT
Date: Tue,  4 Jul 2023 16:49:57 +0200
Message-Id: <20230704145012.49870-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: mbRttJexVOQD

Following docs/devel/style.rst guidelines, rename icp_pit_state
using CamelCase as IntegratorPIT (PIT is an acronym).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/arm_timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 0e5d5d0f6d..c741e89cb4 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -327,9 +327,9 @@ static void sp804_class_init(ObjectClass *klass, void *data)
 /* Integrator/CP timer module.  */
 
 #define TYPE_INTEGRATOR_PIT "integrator_pit"
-OBJECT_DECLARE_SIMPLE_TYPE(icp_pit_state, INTEGRATOR_PIT)
+OBJECT_DECLARE_SIMPLE_TYPE(IntegratorPIT, INTEGRATOR_PIT)
 
-struct icp_pit_state {
+struct IntegratorPIT {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -339,7 +339,7 @@ struct icp_pit_state {
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
                              unsigned size)
 {
-    icp_pit_state *s = opaque;
+    IntegratorPIT *s = opaque;
     int n;
 
     /* ??? Don't know the PrimeCell ID for this device.  */
@@ -355,7 +355,7 @@ static uint64_t icp_pit_read(void *opaque, hwaddr offset,
 static void icp_pit_write(void *opaque, hwaddr offset,
                           uint64_t value, unsigned size)
 {
-    icp_pit_state *s = opaque;
+    IntegratorPIT *s = opaque;
     int n;
 
     n = offset >> 8;
@@ -375,7 +375,7 @@ static const MemoryRegionOps icp_pit_ops = {
 
 static void icp_pit_init(Object *obj)
 {
-    icp_pit_state *s = INTEGRATOR_PIT(obj);
+    IntegratorPIT *s = INTEGRATOR_PIT(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     /* Timer 0 runs at the system clock speed (40MHz).  */
@@ -399,7 +399,7 @@ static const TypeInfo arm_timer_types[] = {
     {
         .name           = TYPE_INTEGRATOR_PIT,
         .parent         = TYPE_SYS_BUS_DEVICE,
-        .instance_size  = sizeof(icp_pit_state),
+        .instance_size  = sizeof(IntegratorPIT),
         .instance_init  = icp_pit_init,
 
     }, {
-- 
2.38.1

