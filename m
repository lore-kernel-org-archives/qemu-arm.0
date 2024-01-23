Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp135948ejc;
        Mon, 22 Jan 2024 22:39:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk1y4kfwiaBi7jaKVWthndlliC6b9Gu1BrMcjDI94r72VR6KMZIF7NKGyVzLbN0nUSqhtU
X-Received: by 2002:a05:620a:1988:b0:783:8b9a:243c with SMTP id bm8-20020a05620a198800b007838b9a243cmr7722265qkb.36.1705991970753;
        Mon, 22 Jan 2024 22:39:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705991970; cv=none;
        d=google.com; s=arc-20160816;
        b=d26Q+rel833WO9me2PzIMxx4tAUUJt+kTiZPrds3PmLJMlGCGNqH0ZmfjBEHNEbHNd
         jSO6mZ0TNfgkJj8uKKNw0gRP8g/r3mAWGr09idsx3a+FxnA/bV+pWf+3XDmdj2e0kzQQ
         owAZW1ZkCXKFersiPVFVlmRqfSEtzmCPmMlOacV3ImQgcUNuBNey6P3/t1MbwsjalZH7
         u8zhEWSj8IpmivNkPFe4Pso4ALBmxa4hSh9VkF7GCCEiK7m9uNqfOjj63kxcra4KIjp2
         iYl/gwoF57fk+UBesY4Yv18BdbeGPzlElZbDE/TtJ9TF5bjKdLbCBC3svAGvicjXp+0D
         bFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d2C77azz43915zIuIoKlnCQM/jW1+ruzYffMI8d4fYY=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=zhKNN7xXE8M6FZbA28nPhJs3+zeM2Sx0JXnKCb8xVUdGemQmyoClffH7iymu13EXmM
         lKulhJpy9kNXCIQAlOb+Fvc+esQICtlrHPhI+goVNwVYm0DDgpPUHdV+PrE4ZafS9m6k
         Tfy5JB1wbaFn2iwC0R/0eUzJxzF3/ALDsXmpISEvSS74BY2wiiGmbBnmciHW1nQ5iJuC
         C08OcEeVC2ERcMuLzdbdLz0haA0b606nNhnESvolNLTekg2RiAF3v3/FKQn6S2tkYuf6
         q1Cc6KdVsTBGU7e8q/ALd15ZhqIzUPGPLXYekpO67CUTXEHtFvuYA5qBAeSeC5pgeBSj
         UYdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rK18/Jg2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24-20020a37e118000000b00783aadb7aafsi702701qkm.517.2024.01.22.22.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:39:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rK18/Jg2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSARS-0003o2-3K; Tue, 23 Jan 2024 01:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARQ-0003n6-Kz
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:39:24 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARP-00086K-00
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:39:24 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2dc7827a97so424850566b.2
 for <qemu-devel@nongnu.org>; Mon, 22 Jan 2024 22:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991961; x=1706596761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2C77azz43915zIuIoKlnCQM/jW1+ruzYffMI8d4fYY=;
 b=rK18/Jg2pkaOJHGccEXn5j5jujHqc4prwNyUwF0uxEACcDZ3l56TDNuoFTjDNxa7uB
 XtbKI9uOApkA81oKt10uSpGDaEeuTSnunB7etdwAdMwjAda7ryBiMQpJlhb9SHxlg8lW
 SZxZKrFWogO7xET09dLKHCCN1/7+8XD+O9juGSh0ZzG4LKeXtXVMfAe8kZFps34RbJND
 +gE1XYebodIew67yVvx8gytg4NVGfKpvUaapj231sEn8lSZAQUGlLCTixz00fkpFZKCQ
 SumsevgH/UYeBbz9mdrp+TUMZYpqBRjFlpe+hM5a2J9MsiErJ/qyWBUgSho5bN3cHgQN
 gjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991961; x=1706596761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2C77azz43915zIuIoKlnCQM/jW1+ruzYffMI8d4fYY=;
 b=lwKG7h35nbXUuqYaVPBWfBH0PaZensJUQUIINQjEAVUH/5zpO0FGGYi04TYdPVO7Mn
 Xl94GqGDZttGcqJJ31WXTU2UeuLzmkgSeyl2NDXdHFiYw1heakJ912ng5Qz9Edb5Tuc5
 VJJwvSByTPxnRuCLkRuHHk19dJkeqvycXM5BnCR4x6ZMmz1Muufk7EShfDkXBkzfKGkd
 ehItlet8GOo2x7v9JFId52DSJJE0dzWcznQ8ZxGi8s/8OY3U/GhsYTMh7j8uwjkEqBnK
 sA/YUZ52jjzayVmzJZtHq7FEMAhQ2G2bsb5pNPAf7NKMZxDzgB3OujlPjrktD5BIFSLE
 u9iA==
X-Gm-Message-State: AOJu0Ywjvv1JJMTUQckKmL63Dn4LLZuE/5NGPSrp7x30jyTdXYwWsQ8O
 txCw1HyEeOxY+atjG7SAidpb87TujG1g9d8FEwtw2z0YvQVJnUOfx/N3jaqsrsDSyAwmvzeHQkI
 JyF8=
X-Received: by 2002:a17:906:4ac7:b0:a29:335f:4248 with SMTP id
 u7-20020a1709064ac700b00a29335f4248mr2660526ejt.45.1705991961146; 
 Mon, 22 Jan 2024 22:39:21 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 jx21-20020a170906ca5500b00a30d9c47f92sm16896ejb.15.2024.01.22.22.39.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:39:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/8] hw/arm/aspeed/2600: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:40 +0100
Message-ID: <20240123063842.35255-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rv800yIDmbAW

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index df627096d2..393c97d55e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1157,6 +1157,11 @@ static const char * const ast2500_a1_valid_cpu_types[] = {
     NULL
 };
 
+static const char * const ast2600_a3_valid_cpu_types[] = {
+    ARM_CPU_TYPE_NAME("cortex-a9"),
+    NULL
+};
+
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1373,6 +1378,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
                      ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1392,6 +1398,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask  = ASPEED_MAC2_ON;
     amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1449,6 +1456,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask  = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = rainier_bmc_i2c_init;
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1471,6 +1479,7 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC3_ON;
     amc->i2c_init = fuji_bmc_i2c_init;
     amc->uart_default = ASPEED_DEV_UART1;
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = FUJI_BMC_RAM_SIZE;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1492,6 +1501,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC2_ON;
     amc->i2c_init  = bletchley_bmc_i2c_init;
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = BLETCHLEY_BMC_RAM_SIZE;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1631,6 +1641,7 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = qcom_dc_scm_bmc_i2c_init;
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1651,6 +1662,7 @@ static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
+    mc->valid_cpu_types = ast2600_a3_valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
-- 
2.41.0

