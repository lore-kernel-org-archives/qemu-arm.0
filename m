Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4447747lfm;
        Mon, 27 Apr 2020 11:26:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZVl5pFLzr80Kg/W9wNHbyitEXNem/1h90VLLJ1rSifZGOp4Z0HFdqIwcXx+o9vcnxLG3r
X-Received: by 2002:ae9:eb52:: with SMTP id b79mr23506884qkg.300.1588012005792;
        Mon, 27 Apr 2020 11:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588012005; cv=none;
        d=google.com; s=arc-20160816;
        b=aG/Avxw4776X7VP09ZW6n+9D3xFYKNgllqmli4AP3aeYTo0n/aGOfAXZv0byo/WUrJ
         KZNllZ95vj1xKTLdkHSqhzELD0pdPDelAU0lygiFq1kCrHYIAX1jPI3UnOXqsA6PFuLA
         m779XPOS3BT6a+h2yr/MJImbdsrVUyr1ErrHvIAa1XU4iNqDOXku8X5949Kq/kTlicLU
         ENpG8NZEcPlG7qgqNazKT6RDuCr1oHestq9cxoZIIuycpIyWf25zDvEu5BB0GVCuf5n9
         Ap1wO6TUJBS1+/it7r9lIj3H7/9iJ9vnMpZA3Lua6hTYyUCy8k1Mw4lnu14q2v8Z0r7z
         dIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UNhPRqE1nqM4y1sMRPefC6bxgbHFZMPLnBTiv+uklco=;
        b=c0JjFENEVWDT+iAPWSP3ZpSAolZwta9E03cSCIdfcqezu921zjj5yPLq2uNxDmNbn+
         eBzKzFsYGTfWAF8X7nUVnWx4i2D1F8/eXsJjEsY7SK4XPOE7k534grsehfKrh0+SbCb0
         MURma+qYGzsitO5YeJq5y5nwuAQklhMiaasXrQNe1jWF1BiSivaTrHdn1MIIX5zUrJ1Q
         WCukv9J0mMDkU79kwzaLPhkU34skYT7n8aW6+g9JaOQQnQO8RGe0aS1FEbezXianEFWm
         pTdLsOTtt7hZbLYT5/0/7KVJfaUGdZ6uFBZUDHiY1XO2YwicVw9a50osXt/uikDzK+wc
         laDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uHlTD92V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d76si8952935qkg.316.2020.04.27.11.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 11:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uHlTD92V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT8Sr-0007Q3-5L
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 14:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JQ-0000CS-5L
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 14:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JP-0005Hj-BO
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 14:16:59 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jT8JO-0005GM-T3; Mon, 27 Apr 2020 14:16:58 -0400
Received: by mail-lf1-x142.google.com with SMTP id u10so14659234lfo.8;
 Mon, 27 Apr 2020 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNhPRqE1nqM4y1sMRPefC6bxgbHFZMPLnBTiv+uklco=;
 b=uHlTD92VaQz/k/B6CD1gSoDVYGcZbaZ7ZkIYbOznXMIfBOoBcTExAYuLxKpdHFd3VY
 UCzyOxZf7Np5Mugl1jCDxRc98f6Yd4zdewOeKFnogXQl4cm42eG36YcWQdmnSeVfC00q
 R3oYq4ELvPGOQ08QLMulygkRXSjRSviYK+jnhLtGPVY+4YPYhS7jyN7trWH1U3QHhQkz
 DxAEEv0vrSNOA5C8K2R8UsgYr34R/3UTzDRIYKgrKMQLMobFJXPNIuJkP+CpvzbWhK03
 VU1GI9n0iHq/LUJ1vdi+L6zsoq7wHNRcDTVH4Y717gLMd5yyZCSN/0dai+1ksXnbY1Mi
 iXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNhPRqE1nqM4y1sMRPefC6bxgbHFZMPLnBTiv+uklco=;
 b=lajyGt1a5hOsyNJ29Lz3b4kKvrPZaxiQVNwB9Fa5NpsLo4HAjrFuVCadtg/na+avL3
 oXpXjI+914i7GN87Fk4sbLe8i89YB9Cm0VOJC88eBqzc8wxMmeUYTVapR6sFw+gWgT0S
 mPlzIOcayjGcnZt3KX1JDsjsT3M+n2fLHgxPLI1541dDFi3HzJ3IF7OpAfE+OaJMDJlE
 KZtfmCIdvnhst6m/kCpOTmjBC3Hp2kn7SXvr3lS+7hSKH7TvXncTvSav9gBHD/V4CnpA
 6FbMduI8H2Ww8Zw9U0XBozLfq8dxxySZe6ezcLYoK7c8FkWtHmKa+L4ZUFW1ODFGshfj
 GEOw==
X-Gm-Message-State: AGi0PuZTZ5MiKP5YQ+iBtS6Y/hO94Ct6TFVwIrr0xZsjxdU8//yoTZck
 ClxI4Hl2zZrG7YD2azrKuaVDHwBF/Bg=
X-Received: by 2002:a19:48c3:: with SMTP id
 v186mr15971977lfa.194.1588011413208; 
 Mon, 27 Apr 2020 11:16:53 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id m13sm11905209lfk.12.2020.04.27.11.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 11:16:52 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/11] hw/arm: versal: Move misplaced comment
Date: Mon, 27 Apr 2020 20:16:40 +0200
Message-Id: <20200427181649.26851-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427181649.26851-1-edgar.iglesias@gmail.com>
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::142
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiaeUPX9+gM+

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Move misplaced comment.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index c73b2fe755..cc696e44c0 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -36,7 +36,6 @@ static void versal_create_apu_cpus(Versal *s)
 
         obj = object_new(XLNX_VERSAL_ACPU_TYPE);
         if (!obj) {
-            /* Secondary CPUs start in PSCI powered-down state */
             error_report("Unable to create apu.cpu[%d] of type %s",
                          i, XLNX_VERSAL_ACPU_TYPE);
             exit(EXIT_FAILURE);
@@ -49,6 +48,7 @@ static void versal_create_apu_cpus(Versal *s)
         object_property_set_int(obj, s->cfg.psci_conduit,
                                 "psci-conduit", &error_abort);
         if (i) {
+            /* Secondary CPUs start in PSCI powered-down state */
             object_property_set_bool(obj, true,
                                      "start-powered-off", &error_abort);
         }
-- 
2.20.1

