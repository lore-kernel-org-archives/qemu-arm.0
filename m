Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3025472ejb;
        Mon, 27 May 2024 01:04:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmDdC4u1vUdoYpqYeQIxHLpvgF+MzarzrUiVhcZFaUZsI4Ck29MqQN9jYz2WHVrJF82tR+4QZjRWgQXVkI98UfTMHZPOnJ
X-Google-Smtp-Source: AGHT+IFjqEkqvcWWQP/PTMMvzhYrmlEIdiKll1/2KWcIrPR3E2ISZ6ywzuiRQi/eHARU6bWD+xWt
X-Received: by 2002:a05:6122:4103:b0:4d4:15d2:8b3b with SMTP id 71dfb90a1353d-4e4f0293533mr7964261e0c.9.1716797039791;
        Mon, 27 May 2024 01:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716797039; cv=none;
        d=google.com; s=arc-20160816;
        b=GMTkrNf559+xp/ePjSecSUKlEMyUDLbM3JdAeGkbD6aLA5oexWHBnywXdwtAu7GGMI
         iZljX5uqsW221V30v3iCm55vGy2DZlLF7fdU8Q5X9pIwM7HKkQrlGjGE1hGDJFS77Gmd
         llsMsWbbYV9eo1q/7BMsL0EsJ8XpbTyUA5IX6gAJWvm17fGspZzDghJKBdwLJtr5ydhp
         3eO24y0csDqjxfdlw57bVk/1F4RUAiWP7J7B4bYJ2z6uOvH4azI6dKGfI9Slj9xOpRGz
         WJsQYzjx2uP50kfW7IltHsv7dGhQ1zKR5UsoHt6btfJxAtjIyb6FIy4ay8xOT8yTJTMv
         BN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=H2XGJKKUrx/ByTXmc/nS0BQJr3kDnB2I+5AkWD8avIA=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=VgkRaODWhE8zoNUnv1b4ALkr6yB00dE6g/P/5MEXVdw3Ip96mXE08rf92j11AO42zB
         AzdpIIwNCP25GRF8lU9HjbuFn03aGg+QJcyRSGHekb92jpEUnVDxvpnI5ONTjHR83udW
         2XyvvPoNyQ6/AvSyiF44yqbYTWeUt0g6K246WTuKan0BHPV1yiRVjK4rfJTZkTxzRtc7
         U/p8KiHvtMyzXlyZ6fDCl7J4389TniMfM9T2coF6yhb9I2IHAwOSWE2Dom8/JRCPQNfh
         8L1Qy7clvpau9IToS+Ql52Fre19d63pkBdOkxKHOU6j/NBz8MaAYgTJ+oUql/FVw8HDJ
         706w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcc74aesi731641585a.180.2024.05.27.01.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 01:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBVKk-0001fe-F9; Mon, 27 May 2024 04:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBVKO-0001Kc-1b; Mon, 27 May 2024 04:03:32 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBVKM-0005H2-Ia; Mon, 27 May 2024 04:03:31 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 27 May
 2024 16:02:38 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 27 May 2024 16:02:38 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v4 13/16] aspeed: Add an AST2700 eval board
Date: Mon, 27 May 2024 16:02:27 +0800
Message-ID: <20240527080231.1576609-14-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MugvktImkwy0

AST2700 CPU is ARM Cortex-A35 which is 64 bits.
Add TARGET_AARCH64 to build this machine.

According to the design of ast2700, it has a bootmcu(riscv-32) which
is used for executing SPL.
Then, CPUs(cortex-a35) execute u-boot, kernel and rofs.

Currently, qemu not support emulate two CPU architectures
at the same machine. Therefore, qemu will only support
to emulate CPU(cortex-a35) side for ast2700

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 93ca87fda2..40dc0e4c76 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -178,6 +178,12 @@ struct AspeedMachineState {
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
 
+#ifdef TARGET_AARCH64
+/* AST2700 evb hardware value */
+#define AST2700_EVB_HW_STRAP1 0x000000C0
+#define AST2700_EVB_HW_STRAP2 0x00000003
+#endif
+
 /* Tacoma hardware value */
 #define TACOMA_BMC_HW_STRAP1  0x00000000
 #define TACOMA_BMC_HW_STRAP2  0x00000040
@@ -1588,6 +1594,26 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     aspeed_machine_class_init_cpus_defaults(mc);
 }
 
+#ifdef TARGET_AARCH64
+static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST2700 EVB (Cortex-A35)";
+    amc->soc_name  = "ast2700-a0";
+    amc->hw_strap1 = AST2700_EVB_HW_STRAP1;
+    amc->hw_strap2 = AST2700_EVB_HW_STRAP2;
+    amc->fmc_model = "w25q01jvq";
+    amc->spi_model = "w25q512jv";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->uart_default = ASPEED_DEV_UART12;
+    mc->default_ram_size = 1 * GiB;
+    aspeed_machine_class_init_cpus_defaults(mc);
+}
+#endif
+
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
                                                      void *data)
 {
@@ -1711,6 +1737,12 @@ static const TypeInfo aspeed_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
+#ifdef TARGET_AARCH64
+    }, {
+        .name          = MACHINE_TYPE_NAME("ast2700-evb"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_ast2700_evb_class_init,
+#endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.25.1

