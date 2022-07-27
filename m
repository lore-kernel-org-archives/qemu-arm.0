Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp169957lfg;
        Wed, 27 Jul 2022 03:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smli8YCBaGyaMHgBhkODR5mTeDQ2rN0GDErCkJh2kTleQOwEz+mollp/1N89+noWf318GN
X-Received: by 2002:a05:620a:294b:b0:6b5:f49e:4847 with SMTP id n11-20020a05620a294b00b006b5f49e4847mr15393279qkp.297.1658917713898;
        Wed, 27 Jul 2022 03:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658917713; cv=none;
        d=google.com; s=arc-20160816;
        b=fQTnLH+acgy0n8xv7SHLhU3E1Io2sGlpRvrYmbS5b1oR7YnSFPqYbO3Nz+tH98lHZ8
         XmHuDLF0gHQ8KG0VLc+FtlhX0G796fr8596IpPs1+QGMWEyfp9Fiwx6rYz1Fp+ToWcd5
         By/3FdTU+JomHFhnaji47PIYipe3kCg3mj5JHutsbtr0dBO4OtmliPLR8RMRlbSs/rL0
         UTVTNUK/o1aPXcSCKITlEftvMqie+KCaRTRGB/9sEnvGr0y4RWMUF6U/XlxGH32mme3L
         GUt5E/v2MNmrJ0ZltcubLE98nK0vMY93D59qfkj1EMruLSfCJS+fECHnOXl7Citg7Fz4
         Kn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Pd9XLW4cFxum/4grihOFQ2bHhnEsNvnOdJObOWWwrXs=;
        b=ZhTLJY8BZUsJHbnyAegK2WE5gDD5lwG3NNoU8PIf4MyaqIk20u1tebY+mNEWKV+I+z
         yJWiSvq8RbLc4nMGP8b6vTxC6OreDs93UA1BtB2zmK1fvmvnuP+Tbkq1HAPh0DEG+eXH
         DZ7o2O07jcZkvkUIGXxN9UCyDBuzEmzD4+/9nEzATmI0/yX5afH7ntSEnUpO/NZyTn5G
         784TXDnrOWq71z5ghgnXcvM4Hwdo5JsLRDgEwnDluyX+2eeCOlccgNhFpokR7yd/nvIb
         tf1t3F/VRyhgKCahDLipDjIB+wERW1X7WYyySBAAO6Mq77wGSnMRUE3D+Gy1vhT7R7YX
         EOZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s188-20020a375ec5000000b006b5d97d3afbsi9925690qkb.676.2022.07.27.03.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 03:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGeHJ-0006JC-9z
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 06:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGS-0006Ds-54; Wed, 27 Jul 2022 06:27:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGQ-0004VR-CZ; Wed, 27 Jul 2022 06:27:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lt92R4h7Sz4xCy;
 Wed, 27 Jul 2022 20:27:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lt92N6W5Cz4x1N;
 Wed, 27 Jul 2022 20:27:24 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH for 7.1 2/2] aspeed/fby35: Fix owner of the BMC RAM memory
 region
Date: Wed, 27 Jul 2022 12:27:14 +0200
Message-Id: <20220727102714.803041-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727102714.803041-1-clg@kaod.org>
References: <20220727102714.803041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=RDWM=YA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: Y6Juq1HFlK44

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

