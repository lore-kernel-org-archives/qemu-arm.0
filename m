Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp136342ejc;
        Mon, 22 Jan 2024 22:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMUv7t490djOI+SDHe2D1CP/lZ/sT8OU+rNxQHVfSSIR0jMuOgH7wjVMLyzAOcExry2WhR
X-Received: by 2002:a05:620a:c87:b0:783:952c:8853 with SMTP id q7-20020a05620a0c8700b00783952c8853mr4697760qki.6.1705992037018;
        Mon, 22 Jan 2024 22:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705992037; cv=none;
        d=google.com; s=arc-20160816;
        b=IEYdxDhLpOW0No0r/ihPGTL5wlW1ENEL1gP6VtVWQT70mKJGgH8js1GaOm4kp5Kqdd
         zeGHj63G6g7gZSihGd+cyIAa6HC/Rrsk8SbqTnqb4Xuhkq26OKEN4iUX+DXu3UkY/2mJ
         Qr6AYAHXR20GlWSFk4Ukfsy/Vo0s1Tz1LzHPE9TOw7KRjSM5YSNKKW6hcTsNzqxUpmC5
         MoSmc14osok6UArZWsgw6LBpLi6uKs+ygtNBx8/NY3Tgtvwg2gW2kB6QRFQJFuH0L7mI
         7OYeQxfCz2Or0378MLeqo3i0vO7WQKXhYvC066fY0OU0SzxLsN7sTor1eaS+j/cxyFCE
         +FsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TGD5FLvwAQGOZbUBjumYjpCbltGmL2kWHmZW0fC4bQw=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=ZT1+GB/SK2Nsuo8fYLvptt6oQf+OZ103QgBHTQ+tqatmt47LEY6sAz0DTHCFrotkBD
         uEk4l57Gn8etJ/GSaWvJ3PpDIDLL/08mQQ0KwCvv+ac68D/Qcjwm6s6l8nVpxdDSEsvv
         R54Aqs3dpFOyJnBxoyhNJfeGwA38MLoCNa5YYOBjMGt8AOEL06+0MbB5TijHcBCOA+sf
         183LsukNJOPC0UxPY3rdoee1qWPq0A49TKKbAJlCaYUxkOw2qSLRLJmbHZrIg1VEqMeS
         8thGidd0R/kbMqoE++iKx3TYze9FIsVgXCSuktlUi7Bd7A8NXwP5IZkFJZuXwKBH64UU
         hDew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wx3QmEKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05620a057500b0078334092c60si7040794qkp.70.2024.01.22.22.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wx3QmEKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSARK-0003im-RN; Tue, 23 Jan 2024 01:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARE-0003YE-B5
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:39:12 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARC-00085F-Qy
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:39:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso5345209a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 22:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991949; x=1706596749; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGD5FLvwAQGOZbUBjumYjpCbltGmL2kWHmZW0fC4bQw=;
 b=Wx3QmEKNfmy5DWwig7dxnedD/Y67Z+1/RP6+05kDmz+x3XPwmMgDn6eRhP95++Mch5
 tGkqY6OVS4SWk1M2XCCvJi87c+qje9O4bNGPFWkyKeyd+naSN22w4SwAfsKruQD2xe5F
 bCk7J6V8qKGnn0p5Gb8ErCEku6rtWCzccqdg+cKChc8fg6CGBudxyFcrAzyQwho8Quy/
 aczH9Lu7Oo3mXwbF17oODeyPh0eIkOCmDmgNZkg8M6b1Z8KcUHRVCsvzVNY/aMmGE8QW
 EOz5rppqAlf7dC8Pn0JC0AbhLsB8JmR9K2irBHbfZoXyHam5BdeotwZr4ctYWrql1wGj
 8fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991949; x=1706596749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGD5FLvwAQGOZbUBjumYjpCbltGmL2kWHmZW0fC4bQw=;
 b=DmE6wMwnoZFq8bVL8EfJbJsP+ETdP48U6cmbh8QEVDxzm/0nyRIZ8YyqwYavK2ixR7
 DN22MrO4RXnq7XcYhHGYa9v6JT7JLKmn6o3LZcF/k4vk1x7o1ANmS7cEaNKrW75Qcuk/
 k4w26JXSMHDBJYR3Cw1a2P7mzlGXBA3VKomyg+LZkEIWLphBpZo3+lCPVOUvNvrBGHqR
 Eyy7GmIs9r1kcbD1WAW6Rsre2Ex9RWkmA+3vHJoX+rEfeUWzNx+QZ7TQC+nwM7kBwBtV
 z5rJBXgos+L1ZPJdL8UarEO/rVGbasokWLOWRywL1t+LaSqY3a6C5Q7hIYbAKXmzOCMV
 zswA==
X-Gm-Message-State: AOJu0Yyqnu+Uf27OVM76g6BNSes7bwwINowRWa6WVldEwT/wbdXAT7Ff
 hOmSiYkVbhqsEluqSBBCQO52LPo95QT2bW4F8eEU4WmhjgkTQZJjrvXSf0fVbrshqu/QjwqHN2V
 MKcw=
X-Received: by 2002:a17:906:1748:b0:a28:d1d7:c255 with SMTP id
 d8-20020a170906174800b00a28d1d7c255mr1280066eje.204.1705991949062; 
 Mon, 22 Jan 2024 22:39:09 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 tj3-20020a170907c24300b00a30982ea105sm796938ejc.42.2024.01.22.22.39.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:39:08 -0800 (PST)
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
Subject: [PATCH 4/8] hw/arm/aspeed/2400: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:38 +0100
Message-ID: <20240123063842.35255-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: EuanarAivIg+

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc59176563..e0e0877b1d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1147,6 +1147,11 @@ static int aspeed_soc_num_cpus(const char *soc_name)
    return sc->num_cpus;
 }
 
+static const char * const ast2400_a1_valid_cpu_types[] = {
+    ARM_CPU_TYPE_NAME("arm926"),
+    NULL
+};
+
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1175,6 +1180,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
+    mc->valid_cpu_types = ast2400_a1_valid_cpu_types;
     mc->default_ram_size       = 256 * MiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1192,6 +1198,7 @@ static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
     amc->spi_model = "mx25l25635e";
     amc->num_cs    = 1;
     amc->i2c_init  = quanta_q71l_bmc_i2c_init;
+    mc->valid_cpu_types = ast2400_a1_valid_cpu_types;
     mc->default_ram_size       = 128 * MiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
@@ -1211,6 +1218,7 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
     amc->num_cs    = 1;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = palmetto_bmc_i2c_init;
+    mc->valid_cpu_types = ast2400_a1_valid_cpu_types;
     mc->default_ram_size = 256 * MiB;
 }
 
-- 
2.41.0

