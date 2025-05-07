Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3695514njj;
        Wed, 7 May 2025 03:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEQ4mI6ptQIxK49LgrJTnvd1nRCEm+z4fyfa5UluSIp3FBJOW8qPtj4CVr7/eI7Aw+YIyvynxX2WnEmg==@linaro.org
X-Google-Smtp-Source: AGHT+IHM+FVwnJyWaobvp/bHeB5xaZCHTCU7Ik15jz7POQ89lg/CEAH/xh3ldoGNys5iIjaSYo6P
X-Received: by 2002:ac8:5ad5:0:b0:476:8d3d:adb1 with SMTP id d75a77b69052e-49225a42445mr32573821cf.21.1746612672409;
        Wed, 07 May 2025 03:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746612672; cv=none;
        d=google.com; s=arc-20240605;
        b=XqllgenpR/y5XMe36iy+XNcYmglk2nCWEJRc4K/D4uxciADhsaDbjp1Er9NGjQ+ClF
         9QnMvGyoHFYHumOpZH1rZytxZuwvbmyqGxST6Ajcqu0zNXx9XOEI/hFZ5X1EpaL6s+Bp
         mJj/49LXmqqD8PQ9hmP5iFQ8MIncFDBpzo/LH6yu55MndzJLg9qE4A34E/6lJ65qO1u6
         y8IdjdXavWC60Aw4ZDewYr8yNNSljTjjsu+BYKzGnvSKIMN6NH0mV2YNdkOQNQ4I64Vb
         6DVwyxvCXgpVrQksdFvNIBWGwfH/2efjgcWj1FldNyCS5AZgmp/yTXaDzkZKr//0iebV
         R9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3OKRlHP/e5cadnmRAHk8uRZcUNKXM48P1OFzRTTd7aM=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=WX6jsqwhGcfUBfvSXaefDCYOg3zynfdt0qFPRiZ28NKMAsBlpc/buqRe8+/e2/AiQX
         nAq2leFj4a4XKYr77TDUqIE69akzwPvQL2HOYMMQUKAYQ2RGHzmXlN3Rz95BRp6Ak8ja
         uz24fQU4gAKl9coXAzQpQhfrxDfyP8Aaj5yTYfiTlWDsAjbajNqLsR7hXH/hUgwPAmk7
         9IJ07Mg7UF1h1L2RUADqYv1JiOppVRLDedHu+DJDgzvv0uUKrzfYnA5nT7cVdTRj0zeu
         BGAr2QBGNtDu23uuKp3ky+s5nKu9r+tErZnMiXA0k4fFsJpXp9RmA9k818vOok2CrIga
         iULQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49222f8b410si16401031cf.442.2025.05.07.03.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 03:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCbjH-0005eV-9f; Wed, 07 May 2025 06:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjF-0005Zq-N4; Wed, 07 May 2025 06:10:17 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjE-0004CR-34; Wed, 07 May 2025 06:10:17 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 May
 2025 18:10:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 May 2025 18:10:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 1/3] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
 in ca35 init
Date: Wed, 7 May 2025 18:10:03 +0800
Message-ID: <20250507101005.1474823-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
References: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gp47s2z5SPD7

Clang's sanitizer reports a runtime error when booting with
'-net nic -net user', due to a null pointer being passed
to memory_region_find(), which subsequently triggers a crash in
flatview_lookup().

The root cause is that CA35 memory region is not mapped to system
memory. In addition, unconfigured NICs (due to missing peers)
lead to a cascade of warnings and possibly misbehavior.

Fix by:
- Reduce ca35 ram size to 1GiB to match the ast2700a1-evb.
- Map ca35_memory into system memory
- Add nic configuration in ast2700fc's ca35 init function.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Id9c0e6f16861c64a11f6299afb6ef02eb4086041
---
 hw/arm/aspeed_ast27x0-fc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index 125a3ade40..ccba5fc8a1 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -48,7 +48,7 @@ struct Ast2700FCState {
     bool mmio_exec;
 };
 
-#define AST2700FC_BMC_RAM_SIZE (2 * GiB)
+#define AST2700FC_BMC_RAM_SIZE (1 * GiB)
 #define AST2700FC_CM4_DRAM_SIZE (32 * MiB)
 
 #define AST2700FC_HW_STRAP1 0x000000C0
@@ -59,6 +59,7 @@ struct Ast2700FCState {
 static void ast2700fc_ca35_init(MachineState *machine)
 {
     Ast2700FCState *s = AST2700A1FC(machine);
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCState *soc;
     AspeedSoCClass *sc;
 
@@ -68,6 +69,7 @@ static void ast2700fc_ca35_init(MachineState *machine)
 
     memory_region_init(&s->ca35_memory, OBJECT(&s->ca35), "ca35-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ca35_memory);
 
     if (!memory_region_init_ram(&s->ca35_dram, OBJECT(&s->ca35), "ca35-dram",
                                 AST2700FC_BMC_RAM_SIZE, &error_abort)) {
@@ -86,6 +88,14 @@ static void ast2700fc_ca35_init(MachineState *machine)
                                  AST2700FC_BMC_RAM_SIZE, &error_abort)) {
         return;
     }
+
+    for (int i = 0; i < sc->macs_num; i++) {
+        if ((amc->macs_mask & (1 << i)) &&
+            !qemu_configure_nic_device(DEVICE(&soc->ftgmac100[i]),
+                                       true, NULL)) {
+            break;
+        }
+    }
     if (!object_property_set_int(OBJECT(&s->ca35), "hw-strap1",
                                  AST2700FC_HW_STRAP1, &error_abort)) {
         return;
@@ -171,6 +181,7 @@ static void ast2700fc_init(MachineState *machine)
 static void ast2700fc_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
     mc->alias = "ast2700fc";
     mc->desc = "ast2700 full core support";
@@ -178,12 +189,13 @@ static void ast2700fc_class_init(ObjectClass *oc, const void *data)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->min_cpus = mc->max_cpus = mc->default_cpus = 6;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
 }
 
 static const TypeInfo ast2700fc_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("ast2700fc"),
-        .parent         = TYPE_MACHINE,
+        .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = ast2700fc_class_init,
         .instance_size  = sizeof(Ast2700FCState),
     },
-- 
2.34.1

