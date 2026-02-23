Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA5EEC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMs-0005zF-Gs; Mon, 23 Feb 2026 12:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLH-0002wx-5z
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLD-0000Tl-4H
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:30 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso58006835e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866204; x=1772471004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PSIfnHT/9W4YeoezCcXgDdWqKuWJ/ARpVnHX63Z0IRE=;
 b=tZXeBjnuGxACndcGJzyz2w93j4AD7zWABZDUh93CioAz2xKgUtLzvyImPTdaD6Jm+T
 U+trSq+1rUsP/g59yP3UyP16uAYnfxHOJPAmZuyxVhLLRmTRUNoeVTQrEW27YleNyPNg
 oQ5qERqUFxIC77/PxwnDu3cQREA8NBwTGPu6eB5lklxttLI5213oDvHaU4lMatYL2mdP
 rIgQIjG0RssvGr4nRLgJHJzOadIBbi8dN2IzBzlAIqSMCZkfRGFykxsgyvp2LAvXDyt4
 hEOouDyTyyzMRt7nAsRKmPoj79tv4s4FCyKgTBKOXU25/TRBmZfmi6GpIFobqw4oHxXx
 pZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866204; x=1772471004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PSIfnHT/9W4YeoezCcXgDdWqKuWJ/ARpVnHX63Z0IRE=;
 b=D32w1gPLwPrzsEbapA1Vv5d6QScB+htD5uL9bDcOnLGFJolJ8MwLs5vRvRIxyvjyrK
 E6a/5OYOZwjViKHuTaU0mSS17La1ezmRqWBFeLJx1ELeG8jF+jUjyrii3W1soVc6Rp80
 M4d9iniI05Y3k/4dw3HHlt8LaMGODjg/k6fWqFRdDtqsMQ7dwl3pIB8sJiZWQQ6OMCbx
 myNhTYqXtMOsef+a0WwgR+RbDQLrymRYMKPQQuVnkFOncchLY1JMWZgcUFA+efgV9Ev9
 AbUerdp5Fc3Mh0VNBOZ9KmMv666PyfXODhSdoOc4kXH8+kC6tUzwit9h40Wc+qt3T1hY
 082A==
X-Gm-Message-State: AOJu0Yww2B8qsgg5o6V+Xtqbgyv2QSL/2vdl5sX6G7qE1Nc5pRbLvQ0u
 cSPb276LFtsCd4m3oPHzGeWxSeUWoYp1LCsfoycRs89bPkJU6K3nCvvsJN1OmifGcJg/f/ciQCM
 UQTt1
X-Gm-Gg: AZuq6aJ/0Wk/zNe2jOiDOTDxV3/o7W/BZAMQedg8LfHwo1RBcXpSlpjhZrY2ulhlh2p
 j5Cm7JTCdkFJDLlEDWoGPB5tBir7jJ7W+axhBrC+xpsvI0/dBTHpyAUwKoI4yGs8yWywYXyDWQF
 /1IhYM1aLFOe8bJcAjDjYaPYjRrrJR8segFdE8RPJuEeVow9yDO7aU7cTFw3WPERx5GHXf6hcDa
 jOf09GDG7fROvDxnAVH7I2bYBGOrSSe/q1HFoVnKUSpLiVvbBct0YQXMfoCYeVnqpxRM3/JteOe
 Ii0WBbn6Xqm6SEtYg7QqMhHV6dhGJ5qr9DmjbajKXmp6tRKUmHNHy5oFrWVlRlAq4ifh0UEOc0B
 X7TEnTFhLqQrVTNUgI1pgXejl5x0JjpUL94+MiVyT1dINOzmfcAwXzdyo0+yPuHarEUhB7dU6Xs
 oBojy52Vc0l92V3rg3zGbv0P5NmcehwzwVZX5RN/oMjweTVqnnBTBDNmVqKh/3nb2WP5qBkbIKJ
 GjTmisS1WOmYJggJSOAFapGsbEJPfQ=
X-Received: by 2002:a05:600c:3147:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-483a962e3e2mr138472885e9.22.1771866204456; 
 Mon, 23 Feb 2026 09:03:24 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 64/65] hw/arm/virt: Enable GICv5 CPU interface when using GICv5
Date: Mon, 23 Feb 2026 17:02:11 +0000
Message-ID: <20260223170212.441276-65-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

If we are using the GICv5 in the virt board, we need to set the
has_gcie property on the CPU objects to tell them to implement the
cpu interface part of GICv5.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1b63338196..1c684b59b4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2677,6 +2677,14 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
 
+        if (vms->gic_version == VIRT_GIC_VERSION_5) {
+            if (!object_property_find(cpuobj, "has_gcie")) {
+                error_report("Using GICv5 but guest CPU does not support it");
+                exit(1);
+            }
+            object_property_set_bool(cpuobj, "has_gcie", true, NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
-- 
2.43.0


