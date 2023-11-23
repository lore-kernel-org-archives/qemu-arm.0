Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp439643ejj;
        Thu, 23 Nov 2023 06:40:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu/6JaeqkgJ3dsIPXTdDqpK5RzoiWZTQTrxujdhkPyLlPZ9EtsyryJ8bYOG/7hWXcxEAje
X-Received: by 2002:a05:6214:414:b0:679:f1f1:aeb7 with SMTP id z20-20020a056214041400b00679f1f1aeb7mr8470210qvx.23.1700750425898;
        Thu, 23 Nov 2023 06:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700750425; cv=none;
        d=google.com; s=arc-20160816;
        b=EEwy9gFa8CRQ4+vKevN9qPFSEy7EK9pNNJimLsQa7AVvNJoYzHkY20lNqdE5eScv+0
         4l71KVrth4iNaNOdgAdbQ9Jjo3rmrXFBt2/nfwg2te7Uk9vlaS+j0mMbi0SIQSkDgCOX
         r3ffLGcBzfxBozgezbm4muJDppSuSuryBwbghO71YcmQQVTwh87enNXbcBltdgDafjMZ
         qwEzhv1WMHfkyDnsmYeGLxx5nq3XYWYydgzsUjk2V3X1V0mLd/oqly9Bzp3WoE4SliOo
         e0A9Drwo90CZrJnrpwOQy+uOq5Eo7Zj3O/AWeHYPLkx1dVP3Oi0Zjz2KVRp0hiPVkPhi
         b8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SliH/Dd/Fz40g7/vYVgjwfZm7k8MHl78S5VUvr4CFSQ=;
        fh=xd8Hqo+FyqINTpmMuSlnP3D7Rh8IYP9KQ4AY72o61pU=;
        b=ZqxUfFGDfoajU9SNJZrNBzYQ/o90eWzMPEXqWPsPEd5xc5d8l6BYxTNFZ/uQlMC1/O
         cq2Gd7MhYz+72FuFbqfvNVUafqVzQp+7bq07Wdq4Vu0vXdkQjrAF/w28b4Q/Yjj+mTEE
         qal00p8E2WY1TVMwhqj/2a2HQ1ihHmIz3WPO/9lzHtG0jVU9Srf32aIlOqTQ/ZWoY5Gg
         uEYn3WsrhgfoYWWtGtHBjNGjqbPPz05k5x3fRxLgEFg6aiXjJ8GHFbuNjD5/QKqtV82Q
         04QdXuSJn9oJFz2Rq/3BlbhsZDM4ghkQmQBKS5QguuDfFfL/+bmyPyioB4iKA5NH65Mr
         +8Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iFafsJXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020ad4558b000000b0065b20aeaec8si1198462qvx.194.2023.11.23.06.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 06:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iFafsJXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6AsO-0003sX-Gx; Thu, 23 Nov 2023 09:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6ArW-0002Xb-Ew
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:39:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6ArU-0002Zt-RQ
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 09:39:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332d2b6a84cso637144f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700750363; x=1701355163; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SliH/Dd/Fz40g7/vYVgjwfZm7k8MHl78S5VUvr4CFSQ=;
 b=iFafsJXZxbcp88GW/FzAYVOkEQPtcwTIZzLN0TTUmNJ17DhomDt2bF+WmiUQi7+cya
 npUHLlF3rJNtxx9X2a7SRXYKJPM6xisYGjXsfASR2P6hx3yVbFsxWnZvvND9k44m91VE
 btDJ3YLLE5/cS3BqND+YCjPqv8fCcsgaA4vBO4YFh4JsVZvd1m9eaj9EIn8ANEzvWy3N
 gP8Oo2sxkOljQVQ7V7BoI8/dqtkmBcmgcIOKd20RBvGn2qbRUwd7Av0uE0Ob7JS9P4W9
 lwEXWZa5cvcOLPTWNHxe1eKu6DylEmUPetzg6kiAIgcCSsqVUMZEf0P8VGCa0+mPw/S+
 c4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700750363; x=1701355163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SliH/Dd/Fz40g7/vYVgjwfZm7k8MHl78S5VUvr4CFSQ=;
 b=KN40m7Zw4ETtV0qePvydOIJyQudrfqglXIQ9+hPHgvOKY1B/pN3XafA+O/E5olJkDU
 /7aK0h3IlJyFcsZl+sT3Iijf1FBHbGDoLs9QTxHVUqS380JGYgJE5wSNJiiRyBaNgqxm
 fcd3Aq8jHYjTmvbMc2BMPjSozhQkkVl9xLLgO2j0wZohMJfE7hq9sQGbiig7TvkDJCV/
 aEVdac1D+upUXOri9vuXTb06yVmPcYX8HKjdgltE0yd4aFQbgtktucYD/VhDuF0Su/Gp
 cApMqq7WxvWZtwl2NsFqaA4YzUVRMMlozlQOP65zGJKVCW3a3tTEXrM1w2IOJGbxSGs0
 ad3A==
X-Gm-Message-State: AOJu0Yy2L8AWhMxEGHeLfeEeuB3dexZV/nY9Mq+225WT029LWZSBKT54
 pOV9eHywPxq0v0pykvGllaTaYQ==
X-Received: by 2002:a5d:47c7:0:b0:332:cb51:34ed with SMTP id
 o7-20020a5d47c7000000b00332cb5134edmr4585550wrc.54.1700750363110; 
 Thu, 23 Nov 2023 06:39:23 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d6a4f000000b0033169676e83sm1806159wrw.13.2023.11.23.06.39.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Nov 2023 06:39:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH-for-9.0 v2 8/8] hw/arm/bcm2836: Add local variable to remove
 various DEVICE() casts
Date: Thu, 23 Nov 2023 15:38:12 +0100
Message-ID: <20231123143813.42632-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123143813.42632-1-philmd@linaro.org>
References: <20231123143813.42632-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: PxqxwbatlYLE

Cast the CPU to DeviceState once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index e56935f3e5..013cee853d 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -120,6 +120,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     }
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
+        DeviceState *cpudev = DEVICE(&s->cpu[n].core);
+
         object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
                                 (bc->clusterid << 8) | n, &error_abort);
 
@@ -128,27 +130,26 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
                                 bc->peri_base, &error_abort);
 
         /* start powered off if not enabled */
-        qdev_prop_set_bit(DEVICE(&s->cpu[n].core), "start-powered-off",
-                          n >= s->enabled_cpus);
+        qdev_prop_set_bit(cpudev, "start-powered-off", n >= s->enabled_cpus);
 
-        if (!qdev_realize(DEVICE(&s->cpu[n].core), NULL, errp)) {
+        if (!qdev_realize(cpudev, NULL, errp)) {
             return;
         }
 
         /* Connect irq/fiq outputs from the interrupt controller. */
         qdev_connect_gpio_out_named(DEVICE(&s->control), "irq", n,
-                qdev_get_gpio_in(DEVICE(&s->cpu[n].core), ARM_CPU_IRQ));
+                                    qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         qdev_connect_gpio_out_named(DEVICE(&s->control), "fiq", n,
-                qdev_get_gpio_in(DEVICE(&s->cpu[n].core), ARM_CPU_FIQ));
+                                    qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
 
         /* Connect timers from the CPU to the interrupt controller */
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_PHYS,
+        qdev_connect_gpio_out(cpudev, GTIMER_PHYS,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpnsirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_VIRT,
+        qdev_connect_gpio_out(cpudev, GTIMER_VIRT,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_HYP,
+        qdev_connect_gpio_out(cpudev, GTIMER_HYP,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cnthpirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_SEC,
+        qdev_connect_gpio_out(cpudev, GTIMER_SEC,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
     }
 
-- 
2.41.0

