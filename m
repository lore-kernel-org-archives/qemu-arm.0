Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp598576lfg;
        Fri, 5 Mar 2021 10:46:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9qeFbeAfuBqyY5hNvmcGTOpmMvVkOdLGZv2qml61d69J/DHRjL6WkpGw1x69tjUblED2Z
X-Received: by 2002:a02:9a0a:: with SMTP id b10mr11225422jal.132.1614969997542;
        Fri, 05 Mar 2021 10:46:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614969997; cv=none;
        d=google.com; s=arc-20160816;
        b=I77no3fwHEk+69pxNLHQJbWuM/sthBcbjrGj589rqwPsGBZcZCfK5hmkq4jYprA8OY
         TQMlgogLP5Fd5sYlF8G4VsuDODxTnxsi6FllXnmq8o9+crW+wJl/MucuO35mMgwNU0wv
         d+QITbkmmUD0gid7p1plknj3jNluwdcOnaf1XULM88jT3l1jbBOYPDXcYL2TcOOYcIl8
         Be1WhdrEkRhgwCy8m8MdZDOipeffTEGRR+8pdpSsr/z0iX/1p3kwR8rGMN/S351efy9g
         kHvJ3aK1XGlpYs+LUmZyQ6tP8PPzoGpaiDzQMz1hATJpsT/DOHPbHix227tJb8r+mtqt
         p4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=KoXFQAKqmHa7MxP/M5qc4aFRcfh+iQOorfutsM2AqNE=;
        b=pRwRT9H8UL62jVs7NtK4+hE8JbRoVDk4E6rvXj/j944Pvgv5ddDOzJW+J+e+iBf6iR
         J22wI92c5UFpGOiOmaDb3/70DB4sCQDifAiS0wdAiJ0TOxADJF9iGsJas+TYRP39ghhs
         fMJ7AVZL2P5keXwwa6+afCeAXKpXepzMmyBaftxrZsUAweDULL08Wb3BNd0vnHKzfLUr
         LO8Z7wCP3RR3TmZR44UCBwZiEa+5dp2CobBBC2t2dJgXOmiQ6aTZ+nzDy1ZT8WhT2Hrm
         3dt1XbBohGD8Ev3y98Ii+ssCdAtE+57ZEvwz1Jugx90kqg1I0Jh+ew0kCUSczb8AhsRX
         iNMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=DxS1RSK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si2955751jam.97.2021.03.05.10.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 10:46:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=DxS1RSK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIFTA-0007GO-Qy
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 13:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3D3tCYAgKCBgKI5yCHG54CC492.0CAE2AI-yFABCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN6-0006fc-KA
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 13:40:20 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3D3tCYAgKCBgKI5yCHG54CC492.0CAE2AI-yFABCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN3-0006z0-U1
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 13:40:20 -0500
Received: by mail-qk1-x749.google.com with SMTP id o8so2508502qkl.3
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=KoXFQAKqmHa7MxP/M5qc4aFRcfh+iQOorfutsM2AqNE=;
 b=DxS1RSK4gaPfSH6kHb3+OL4i1qKQT+zUqCvZBs0SEFi59Zo82pCrzCEnwUd+mI5nn/
 qhxeaAGj8z/d+ebKe3F3IFKoF+kQ6eguI51hheAXp0Nu3bIZUnaP5ZUEz0VLBcdyX8ED
 7esKbpXtdMNI3lVmVAEST8p5alMZ0RTy2CQXoGkhU7BSFHGiEbQifV0r6cCX9KNklUIU
 ne8Hrsyzj38YSyBvvOpRLe9hstnbpTjzzIazvAPYrcEwrkm39bqthIyur16ln4TptfNG
 CxPOR/ulcGUJDO8z/bzP3PUYIzU/DnAG9+qeVVbMzC42rD4FUppqhsgSAccFcO+vyg+X
 GUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KoXFQAKqmHa7MxP/M5qc4aFRcfh+iQOorfutsM2AqNE=;
 b=pOP3sAwYP6p99LeBkxGE5LDAqxUSNCThaXiB18/tH9K/Eb0iDDsN7vuqEeif+xlk2S
 ROUPpVZbO4hfso3adnNV1FwpatPHc0JesVP6omiLq0zonsRY51XxTvEqetUvXSQS57/Y
 LFI6VfIVIyT8VmaB6Q1FdMcLW3IPrwTQQX/ew0zpw5Fl1IoppF9yW+wRs6OBxif+I/xt
 WhTLsLPuUO9WGkQiY4pHKrJO51Y+JV/+ptDLVcUFsYl2GDyb/t320HarP5pvTw+ZyNwG
 e5nWT+abv4AYjqHbxo8KtuwmkYDTUsyrHSPSqrudCIvuTEL+NUTHzsBi2mGja2vbYh8Z
 JOBQ==
X-Gm-Message-State: AOAM531PWOC4Aaz3Xaupv4bjprqV14RuQa2JWd2LdxTsK9msgY+lQqjH
 rBLP1VKMEa1HVt0YdPIChCLY/N5ZteM2aA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:ef11:: with SMTP id
 t17mr10185449qvr.21.1614969615418; Fri, 05 Mar 2021 10:40:15 -0800 (PST)
Date: Fri,  5 Mar 2021 10:38:54 -0800
In-Reply-To: <20210305183857.3120188-1-wuhaotsh@google.com>
Message-Id: <20210305183857.3120188-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH 1/4] hw/misc: Add GPIOs for duty in NPCM7xx PWM
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3D3tCYAgKCBgKI5yCHG54CC492.0CAE2AI-yFABCB4BI.CF4@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-arm@nongnu.org>
X-TUID: rLcb67Dmtpkj

This patch adds GPIOs in NPCM7xx PWM module for its duty values.
The purpose of this is to connect it to the MFT module to provide
an input for measuring a PWM fan's RPM. Each PWM module has
NPCM7XX_PWM_PER_MODULE of GPIOs, each one corresponds to
one PWM instance and can connect to multiple fan instances in MFT.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm7xx_pwm.c         | 4 ++++
 include/hw/misc/npcm7xx_pwm.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index dabcb6c0f9..4c48b281ef 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -139,6 +139,7 @@ static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)
         trace_npcm7xx_pwm_update_duty(DEVICE(p->module)->canonical_path,
                                       p->index, p->duty, duty);
         p->duty = duty;
+        qemu_set_irq(p->module->duty_gpio_out[p->index], p->duty);
     }
 }
 
@@ -483,6 +484,7 @@ static void npcm7xx_pwm_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
 
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->pwm) != NPCM7XX_PWM_PER_MODULE);
     for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
         NPCM7xxPWM *p = &s->pwm[i];
         p->module = s;
@@ -501,6 +503,8 @@ static void npcm7xx_pwm_init(Object *obj)
         object_property_add_uint32_ptr(obj, "duty[*]",
                 &s->pwm[i].duty, OBJ_PROP_FLAG_READ);
     }
+    qdev_init_gpio_out_named(DEVICE(s), s->duty_gpio_out,
+                             "duty-gpio-out", NPCM7XX_PWM_PER_MODULE);
 }
 
 static const VMStateDescription vmstate_npcm7xx_pwm = {
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index 5a689d3f66..7ad632a93a 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -77,6 +77,7 @@ typedef struct NPCM7xxPWM {
  * @iomem: Memory region through which registers are accessed.
  * @clock: The PWM clock.
  * @pwm: The PWM channels owned by this module.
+ * @duty_gpio_out: The duty cycle of each PWM channels as a output GPIO.
  * @ppr: The prescaler register.
  * @csr: The clock selector register.
  * @pcr: The control register.
@@ -89,7 +90,8 @@ struct NPCM7xxPWMState {
     MemoryRegion iomem;
 
     Clock       *clock;
-    NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];
+    NPCM7xxPWM  pwm[NPCM7XX_PWM_PER_MODULE];
+    qemu_irq    duty_gpio_out[NPCM7XX_PWM_PER_MODULE];
 
     uint32_t    ppr;
     uint32_t    csr;
-- 
2.30.1.766.gb4fecdf3b7-goog

