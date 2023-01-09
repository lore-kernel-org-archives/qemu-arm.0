Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2112518ejc;
        Mon, 9 Jan 2023 01:30:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDYH52e4JvB7w6EemoRXaeJQzdxVDQJkkM5vzRRWMAPGnpGuIQuMG7ilXVAht/K/BX/6P5
X-Received: by 2002:ac8:5299:0:b0:3a8:15d2:6e8e with SMTP id s25-20020ac85299000000b003a815d26e8emr80474263qtn.41.1673256601120;
        Mon, 09 Jan 2023 01:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256601; cv=none;
        d=google.com; s=arc-20160816;
        b=alYlwAWec22LWFXa687XYQKac6i0vmSrgJi+Tb06moKDF2R0fKTzi0fC5IkaztnML/
         g6TmwbWNV2OHLVOaqRf5Y69ywvBLwBhBZsFHgIa//tmCP6bsijjVxb8fgcu88qz76Vdq
         NrjEBW6Z7VHeYiPhzLdJruV9HWjZGmXEpVxOdGIdP9EpvLMw/EPvLicnbLGKbZpAFwx7
         ebpJ3pKht9UmWVmR/wu2pPPipBQqMQh5PCPadlfPnZ743VOCr4f5yknttf7Kh+YNMSeF
         NYHBj/ANr3Z/lPU89tNo8hqTUBfQbc150lqRvhbvEmy691DTTkk9d6tDcEJuPYOM/zJQ
         Xesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tSzFCO6NQ+8ffmrsTTKi/Gp5LFSgKmeeId0+ZsrnMi8=;
        b=oxdQjpJ+lSBGm7U3nkDQwdDI7A/Hd4MkKc9rVwwoQxDl32hct3W4RcTFiz61GfJhcA
         1Pa5QEge4fWCcrToGwa5M/VjbHzT2C6wob0UMANyp8UODij/CoLbOv9lVNKp+GODrLi6
         DiW9k9XvUwJatzeDlcrhhTBy117H3xYnb50ErWd6Q4EMCFQS1kxEm730Oi7QFVNyw+fR
         OihBZISujEWRs+eVVZUxT7kwevXqtv2bxm+FD43vi0QqexGpHT/UDgEdgFoY3X/o3O1E
         YDOdxgpS3/PQVB8KhsCJWwDlqepFAqXRHT6SEfrygSKJY+/7M9r4zexPCX9oT2qw4cV4
         0JoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NA4pyZmn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05620a455600b006fccaa125fdsi4577997qkp.504.2023.01.09.01.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NA4pyZmn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoQj-000445-7d; Mon, 09 Jan 2023 04:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQc-00040Q-OR
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:26:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQY-0005UR-NQ
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:26:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j7so2481844wrn.9
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSzFCO6NQ+8ffmrsTTKi/Gp5LFSgKmeeId0+ZsrnMi8=;
 b=NA4pyZmn8lwtpKLMWJt/dLIt57NJE11fKCEwfPFiR84zmGfxBXs5eBwzzx//MEZS8h
 2tq8QUeTwZ8F1mK+osyn6jFfbQRTdWg+6B4fSaUQMaYaw0GPJ7EmBpakBdgIZbYnN9Od
 waX/Swm9YTTSVs6pBNRUZmKt5LyIALAWSn8ntfC/uJhVQblwxK2bEQ2eYrP4/PTlivkm
 0aci5qiRF4NBa9V33voy71WEFS36+0CO3gXEjwU+YVWVuDPryA2qwf5G+HhiJOIQQCpG
 oi7ADqlnHtfNU4pLqts5KHwmUyQ75lfquo1hqrj5cmO+Vtz56bAHIBPzojhVI5ibFYtH
 +YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSzFCO6NQ+8ffmrsTTKi/Gp5LFSgKmeeId0+ZsrnMi8=;
 b=B4T5fSOajXCW00aXnxTf0bTUqOlX1XTRBQ0YQh+e7rTRoDUkfA9/9BGRRh+6Y/j+zF
 IhfWMAhq7L8KpGpTMz8AZ1b8LKq4mXPDUI/8n0xq6Y4/f69bkT2ZlkueB8eR3j6ODDa+
 Xgc3ol8apB2JLAt/epwQhTnkdWY74ZDORGCcteSvVx+XBlMC2HFfSq03dYS0rQV7jDSR
 W876OM1WIgTcvzRLl47h8qvAQXRlPxFx5PWDFI9UtckhIQqv0Q0y8VmrUecBFdMLNSZe
 Fw0FaMGrX9eE9dg61PlNq9P9vxsYpAZBsbbFmQJtWO/2+Zqqr3lyYdLU0c4H9xV4qlmU
 BJOA==
X-Gm-Message-State: AFqh2kpW5MwVxl2aAI3B15sPgDMCxHHCN+0hGmDxe/xFrmwjtcpV3bN5
 rIXZ2BJ36jhZoDJA5ar97S4Oug==
X-Received: by 2002:adf:e80e:0:b0:242:368:7665 with SMTP id
 o14-20020adfe80e000000b0024203687665mr40647874wrm.60.1673256405038; 
 Mon, 09 Jan 2023 01:26:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm8092385wrb.107.2023.01.09.01.26.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/9] hw/arm/palm: Convert TYPE_PALM_MISC_GPIO from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:13 +0100
Message-Id: <20230109092617.80224-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: teNb1L2A/8RS

Drop the pointless PalmMiscGPIOState structure definition,
since it defaults to the size of the parent's type.

Nothing in TYPE_PALM_MISC_GPIO access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/palm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 68e11dd1ec..912164e93f 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -134,10 +134,6 @@ static void palmte_button_event(void *opaque, int keycode)
 #define TYPE_PALM_MISC_GPIO "palm-misc-gpio"
 OBJECT_DECLARE_SIMPLE_TYPE(PalmMiscGPIOState, PALM_MISC_GPIO)
 
-struct PalmMiscGPIOState {
-    SysBusDevice parent_obj;
-};
-
 static void palmte_onoff_gpios(void *opaque, int line, int level)
 {
     switch (line) {
@@ -174,8 +170,7 @@ static void palm_misc_gpio_init(Object *obj)
 
 static const TypeInfo palm_misc_gpio_info = {
     .name = TYPE_PALM_MISC_GPIO,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PalmMiscGPIOState),
+    .parent = TYPE_DEVICE,
     .instance_init = palm_misc_gpio_init,
     /*
      * No class init required: device has no internal state so does not
@@ -187,7 +182,7 @@ static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
 {
     DeviceState *misc_gpio;
 
-    misc_gpio = sysbus_create_simple(TYPE_PALM_MISC_GPIO, -1, NULL);
+    misc_gpio = qdev_create_simple(TYPE_PALM_MISC_GPIO, &error_fatal);
 
     omap_mmc_handlers(cpu->mmc,
                     qdev_get_gpio_in(cpu->gpio, PALMTE_MMC_WP_GPIO),
-- 
2.38.1

