Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165E7CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtFu-0005Pr-G7; Fri, 15 May 2026 10:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtFs-0005PN-Cx
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtFq-0003te-7G
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso62307865e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854264; x=1779459064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QWGPspy0sNOMbf5lpim3GaJwkmkvUIm+uwig0rAXqY=;
 b=zlaJ75e2uJzwmhl4GgtSe65g02fdhjElb58ISWMm/2F8JKuIl7XzJ8KYMm85/68+sG
 fBpnIQ3gawzzOyS6cJ4gu8Y9w5LQOpq8StJ/7FUwCY8QENF6462KxeTGpqEnV5FQb9sD
 NIuBvime8be1/ft4BNm2vySQzzi8kl6wBx71gncqcyFPGPhF6tHrIyP8lOA3iQYcbMeq
 Q41rn5hS55KB07Cm5XUx2IEnNBaYQDHRH/SIxKGsjzvTYX6wNGAkcaMMezTMlbyRJm9e
 2yduGWeHcjO76SK0Lk3CnWbkCa0ONZ1GXrCv5/8dLqwfnrXFbpsZPAr9mfHzJaIT1LZ4
 7KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854264; x=1779459064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7QWGPspy0sNOMbf5lpim3GaJwkmkvUIm+uwig0rAXqY=;
 b=qab9kPLj6Vg/kjj/Nm6kMzq2ISGc9kgbHy8ssj/av39haymsvclHaf9PUPyJCRGEGV
 FjYhBc9Rnk1xU2DC3mSRFXyQf6PQHFDZL6AuM9j2DIXss6fw4Em7oDrPy70VDhPbNr4i
 eCtNKsBuSeVKFUpmhVb/DrZUDrb3CdE+0o+KOl6yit1vBT4j06+GYPNpc1ooy47yt27l
 ifFHoe9WvyQussTHA4wR7ARZRisjBZ1z0mlX/ZPQhNr5mhFVyLxUV7GU2AinVp6Mkyfj
 E44upiWzL8sdxe1xEAzZnknr4gqmDKUnQPbKRo3R0JphXHW6cbt9Rwy5+diEYTVDSR/H
 47xg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eBUjuryz3PnrX9Xn5E+Y+y/F/A6g9gfhcF3/yznP6J9UvQeSAMqUU2aHudqzKh5fEbn2bqxqjUQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz5XKtvlLIrXRIQ+9lcJkp+0uNq5VwXNs78TsK63xYRSpfmLCoR
 uLV1m4Ra7Y49VXNA6jTlrPpoby+6ThjIQVaY6aijj53zl3ZF1DudaiYuzVd7sIdDZC0=
X-Gm-Gg: Acq92OHiqiRux+43CEiPBb+yGmt2Lx9XjoZnYRueF/Yib9rvFnR9YRUicscp+ZV0MAZ
 GJL3YnTJmAkUTU9tPlgE7rKqqDu5tYCAssddp1dQodx7w+dWQc4It4U4MeIKATaKOB1+rKeZeZi
 Bcqd9vNHhFf3skbr/UVUf9cSq2exUkGUk+TEnyWkcdSV3H9FVJq+9kgDZc7vfGlIrHBZg96vtO0
 x/fYY3a5xceNQD0TnMIefQDbvRFhufRmu+AjmEKYLSJyWMx1KvNSt7iyERQl7s7xTlOu8OvudPW
 GjGzm9D7Yk6DLBLNROOVECP7W5FPLYGfD31M3vF4oM6sKvtUeL6uJcB1OQX1nmTrW7F8Qsowszf
 o25ulQjL1IzjBThdDjSdkGZhGV/64K9qLhFuA7qiQ4uhM+cP3plWNUzQjAA1Qs3jkzhxDKxI+zH
 FUJTVcmF+6l1v15okTqXhJKLfp6E+M3E2hzg9/YQMyPJ6WHAyXgLDtn7dd1WO+nvo+hpFtIzuq
X-Received: by 2002:a05:600d:10:b0:489:e696:8362 with SMTP id
 5b1f17b1804b1-48fe60d7882mr51294645e9.13.1778854264161; 
 Fri, 15 May 2026 07:11:04 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c88495sm68165475e9.4.2026.05.15.07.11.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:11:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 04/20] hw/arm/aspeed: Initialize 64-bit CPU types during
 DeviceRealize()
Date: Fri, 15 May 2026 16:10:15 +0200
Message-ID: <20260515141032.3271-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
CPU (Cortex-A35), only available in the 64-bit binary.

If we build this file as common object, these SoCs become
available in both 32 and 64-bit binaries; however when running
the introspection test on the 32-bit binary, the init() method
tries to init the Cortex-A35 type -- although not realizing it
-- which is not available. This can be avoided by deferring the
CPU type initialization to the SoC DeviceRealize step (this is
safe because nothing uses the CPU type before, only the GIC
access them, just after their realization).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast27x0.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 87dcb82e1b0..e50125bfeec 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -418,11 +418,6 @@ static void aspeed_soc_ast2700_init(Object *obj)
         g_assert_not_reached();
     }
 
-    for (i = 0; i < sc->num_cpus; i++) {
-        object_initialize_child(obj, "cpu[*]", &a->cpu[i],
-                                aspeed_soc_cpu_type(sc->valid_cpu_types));
-    }
-
     object_initialize_child(obj, "gic", &a->gic, gicv3_class_name());
 
     object_initialize_child(obj, "scu", &s->scu, TYPE_ASPEED_2700_SCU);
@@ -701,6 +696,8 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
+        object_initialize_child(OBJECT(dev), "cpu[*]", &a->cpu[i],
+                                aspeed_soc_cpu_type(sc->valid_cpu_types));
         object_property_set_int(OBJECT(&a->cpu[i]), "mp-affinity",
                                 aspeed_calc_affinity(i), &error_abort);
 
-- 
2.53.0


