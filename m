Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2624143lfg;
        Mon, 1 Aug 2022 09:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sa/Tc0H2FHZ6ziRk0vKoQQkYPSylwjIZPLiGOpO3GEiNnmOVMFwL/zvuQ/gVAgPUvuy67K
X-Received: by 2002:ac8:5a86:0:b0:31e:d114:1964 with SMTP id c6-20020ac85a86000000b0031ed1141964mr14634690qtc.572.1659372069873;
        Mon, 01 Aug 2022 09:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659372069; cv=none;
        d=google.com; s=arc-20160816;
        b=0NRwKgHKgDPU7jhsmjdpLlpnTxV7zjM1i2sL09iSHA5H4KZAJQsSStr2Xj+icy1Bzd
         x7kv9+eFrP33xQLWCNd38a1HMmwMGxlZrv99yQ9ETBlr3kDKOWwYLAalFdS4WkyJhEEr
         rM7j0kczN1wmUhCPr6VjgMgVmobtGb5pJVjRw/PJlKoHJaPhxbv6hHganQXGGLfyQhrx
         WlE3YIVeWFaTIlRuyGWuIBx4QlDR2nZhCRgZiGqStcKqt+vzELf+bJ3d8+3D95mHWeqw
         MDc6OgsYVKMhDi3fbWgcoph3XhO94kRVpcl/ykKXuhpU3Q4ZgsK7Z2RjbmmHQZz976D9
         ZV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5Po5dbxCTB6FpVkWKUuKVkXUQTPDqBD2I1uh+Mfrcsk=;
        b=Nn5ERPaqixFCwgwHkNVhcM5qLQBzQ8+orWOXKrNpinHmsGaQPNLH9kOVe7bH3dd+LX
         50vAiZ4wSF5HNTjglK/ZQZHPan8YT0WtZbm/z4V7MYU9Jc3oIwXszaYhpZQEvez/9jFy
         Ywc778UmTikG3VK/6qsfXjFfQ9jEzBDDd78HMSvvPEz7kgrwoBMXKNEOWhS52OaShHkd
         sbYk6WP1oY4qrT6vYNwPM6vruXriKquKE1uTXOMOM+kSQJiNt3GPFMovxTHk4VE9njc1
         zTfvV2SwQUC9sB7mmdjTHI9L3OgyG0fa3bc0TVYjTBRFPQv/DzkDfl6U06kF+yqj/I92
         wuGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm14-20020ad45ece000000b0047453faec86si3920791qvb.283.2022.08.01.09.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 09:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIYTd-0003o6-82
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 12:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIYJ7-0004ft-Fk; Mon, 01 Aug 2022 12:30:17 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIYJ5-0006tr-Jj; Mon, 01 Aug 2022 12:30:17 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxNrh0B1fz4xG4;
 Tue,  2 Aug 2022 02:30:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxNrc3zlWz4x1N;
 Tue,  2 Aug 2022 02:30:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PULL 2/2] aspeed/fby35: Fix owner of the BMC RAM memory region
Date: Mon,  1 Aug 2022 18:29:48 +0200
Message-Id: <20220801162948.1920497-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801162948.1920497-1-clg@kaod.org>
References: <20220801162948.1920497-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4kTaYNihfdh

A MachineState object is used as a owner of the RAM region and this
asserts in memory_region_init_ram() when QEMU is built with
CONFIG_QOM_CAST_DEBUG :

    /* This will assert if owner is neither NULL nor a DeviceState.
     * We only want the owner here for the purposes of defining a
     * unique name for migration. TODO: Ideally we should implement
     * a naming scheme for Objects which are not DeviceStates, in
     * which case we can relax this restriction.
     */
    owner_dev = DEVICE(owner);

Use the BMC and BIC objects as the owners of their memory regions.

Cc: Peter Delevoryas <peter@pjd.dev>
Fixes: 778e14cc5cd5 ("aspeed: Add AST2600 (BMC) to fby35")
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Message-Id: <20220727102714.803041-3-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 79605f306462..90c04bbc3389 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -72,11 +72,13 @@ static void fby35_bmc_init(Fby35State *s)
 {
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
 
-    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
-    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
+    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
+
+    memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
+                       UINT64_MAX);
+    memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
 
-    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
     object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
                             &error_abort);
     object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
@@ -120,9 +122,11 @@ static void fby35_bic_init(Fby35State *s)
     s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
     clock_set_hz(s->bic_sysclk, 200000000ULL);
 
-    memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
-
     object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
+
+    memory_region_init(&s->bic_memory, OBJECT(&s->bic), "bic-memory",
+                       UINT64_MAX);
+
     qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
     object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
                              &error_abort);
-- 
2.37.1

