Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp739407ejb;
        Wed, 5 Apr 2023 17:25:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350asyrLRlIgA+euZ0jhRqExTGQMNdYvbUD04w+HiTPPYBgFtCiKYKYP81GgEqXgF8p1IG9ti
X-Received: by 2002:a05:6214:1312:b0:5c4:cacf:9c4e with SMTP id pn18-20020a056214131200b005c4cacf9c4emr2437249qvb.6.1680740727864;
        Wed, 05 Apr 2023 17:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680740727; cv=none;
        d=google.com; s=arc-20160816;
        b=U5IC77gtnZb5Ljvn53WSLBjPUVhQeiWTJnXSTJyWK/s9pF7Izxp9LXK/cAktHEBBDh
         c/+0r4+qqKut2pg+CettwqtnVAKmy/6b4uRFrq1dfN3mD0yMM31NrTV9/Vbj+N+bNZVI
         qrTkU2RqqH1uTP29Hhmgi39srZ80ulyMhQCC0EPhzn2i0QQw+eHG1nimJnvpwSD5N7fE
         IV3JEzi4Bi5Wkn/2taCzDHPwdTyFhX5oAWaJjVA1oP2Cvh5RCexxGOoiy94gEPosoB/v
         EuDiQU5IiRKPd0OY8CldNqkV8Ga06clUfZYiOEWC/rts0aXlyke+oXyk9Ovpz+dDho8s
         asqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=c73IHAi+aPqB32XxKH0euKSiA4W+L+UT08GhoM3WrRI=;
        b=XfPXD4Qr/OSHEM9Ep0xXMCI8tVF4hC+M0ElzcDFOA7Z4Yqqa4o5IxD5vH4nT/TjYIn
         8CC9mn1EJbNptxRhH3QWD0qYZ5wMoEPB3dJ6bzevcmaHMVwWVQ8x9HMBaJfU/9kB8cdE
         f1sf2dNT+adbJ/e3gam+q6d/QXzibP7//xWVs3pO5Sk47GmgHxSKa+DxYRryspim4n0f
         z3xJHU6TamvcJFsbGBrqBCc99kzjEr2rPTlCLw47fqz35VCoWUzzmnUeG0S7B3B83s3o
         ZPrK9dF7vAUaYzUDz94GLZ4K9owGrD/GyEOTIpCYb1233Ky+Bdn5s2obBvBQBcEj62N4
         qE8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=f3brdb2g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a0562141c0900b0056eec5bab7fsi194440qvc.492.2023.04.05.17.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Apr 2023 17:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=f3brdb2g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkDR5-0004rW-UO; Wed, 05 Apr 2023 20:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VREuZAcKCFgAECBE386EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1pkDR3-0004mr-5b
 for qemu-arm@nongnu.org; Wed, 05 Apr 2023 20:25:05 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VREuZAcKCFgAECBE386EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1pkDR0-0005ES-Fj
 for qemu-arm@nongnu.org; Wed, 05 Apr 2023 20:25:04 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 o89-20020a17090a0a6200b0023b3d3acdd6so17938106pjo.3
 for <qemu-arm@nongnu.org>; Wed, 05 Apr 2023 17:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680740693;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c73IHAi+aPqB32XxKH0euKSiA4W+L+UT08GhoM3WrRI=;
 b=f3brdb2gLxSeDXEv9Rrq13ek9vvvxJF8IrGVCxBDmTZgX7wlmqA5MewnZrXUm9y+o1
 DfOv2FDGT+PC7OOw06XpBN2C0kbgNrIajdxylQojMTOjvE/7bKDi6kYFO8kY11s7Zd1c
 DOdEYeq/WhU1Zn3eF5wprYgSxeIXrA/383C6RBt8YX5CHqC32WDukOL30ywarXxipmzk
 R8Ssv0umqHzXqWgU/geGyomVWmft9+4UqbchmCc9vMFO+q2ujJJYdRn8jczyES1R9tUP
 HNfnWMCm7dpm0gt20LYj1QWVqri/lyCXGS3jM3BHlhuRrnWSpTPl5wT1aR41y+4QeueK
 lQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740693;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c73IHAi+aPqB32XxKH0euKSiA4W+L+UT08GhoM3WrRI=;
 b=iJWIYG2KPyYIqvZ53vbGU3xWOF2SDB3jBRkhKp1ODAgSEdSx7XCBQB6bOBXJyGlvoh
 4nsmJWjT8mVpq9GgxK5UjSP5YVazbHc0495pG5cOpIl5ldBH46DjG6+CEtFRysa1bj3H
 jEBPy1irfMpUHN3o3NRETjjT3A0XdAFq5xCoddYbfO4X4iDF9PvET1phKy0m8M+flz50
 HmxSg+Kyie+QRZ7Q0gjg5fhgEci11fplFW6iQBmyxWQL0dDKr5LA+HW2kmOw2eoZ5xd8
 j76QZ7+Pj29WjIR3zuOLryZYg7rfmyDEl0GZOg8DNkNB6XGMoDnsNfryEnOVdUX6THbB
 lqew==
X-Gm-Message-State: AAQBX9eFrTrEXCOn0EIfYCvuS5STY23h1G72+z41/ZZrSJ/3SLnnOSR6
 huLSImO32u7DwT5wNIuKMgGq0dxiUPBi
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a65:5887:0:b0:513:f8ae:5bf6 with SMTP id
 d7-20020a655887000000b00513f8ae5bf6mr2573288pgu.6.1680740693100; Wed, 05 Apr
 2023 17:24:53 -0700 (PDT)
Date: Thu,  6 Apr 2023 00:24:47 +0000
In-Reply-To: <20230406002447.4046378-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230406002447.4046378-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406002447.4046378-3-komlodi@google.com>
Subject: [PATCH 2/2] hw/gpio/npcm7xx: Support qom-get on GPIO pin level
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3VREuZAcKCFgAECBE386EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 5otSCBtC7M6H

This goes along with input pin modification. In some cases it's easier
to know the state of all pins on the GPIO controller before modifying
input pins, rather than knowing only the state of input pins.

For example over QMP:
{"execute":"qom-get","arguments":{
    "path":"/machine/soc/gpio[0]",
    "property":"gpio-pin-level"
}}

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/gpio/npcm7xx_gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 2a7be60d8d..58db3a8d64 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -399,6 +399,9 @@ static void npcm7xx_gpio_init(Object *obj)
     object_property_add(obj, "gpio-pins-in", "uint32",
                         npcm7xx_gpio_get_pins_in,  npcm7xx_gpio_set_pins_in,
                         NULL, &s->regs[NPCM7XX_GPIO_DIN]);
+
+    object_property_add_uint32_ptr(obj, "gpio-pin-level", &s->pin_level,
+                                   OBJ_PROP_FLAG_READ);
 }
 
 static const VMStateDescription vmstate_npcm7xx_gpio = {
-- 
2.40.0.348.gf938b09366-goog

