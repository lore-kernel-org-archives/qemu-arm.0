Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1444086ejb;
        Mon, 4 Sep 2023 09:14:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/0ZF1yZWsBUIetUa8OqBTmA5egnQT8r7ehCdfJvg7POS7iBurLgnM9vMge2CI5dPdYt/s
X-Received: by 2002:a54:4e81:0:b0:3a7:96e5:6a58 with SMTP id c1-20020a544e81000000b003a796e56a58mr11975961oiy.18.1693844051138;
        Mon, 04 Sep 2023 09:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844051; cv=none;
        d=google.com; s=arc-20160816;
        b=fvjdZ3NYzaB3C0YM5CSqXSV2Yo5dMD4gFX08QABxvD2HQVKcpxrbaBsv77Q1WzIaZJ
         LpmCek4Hr0DgDloOgB8jiOQRVmI53S3By0cRScddztjKa6VkhnT2NybYLZ+0e70sx4zh
         ZNEDH1dAsAXWIgxQifHZHnrbdXI0QvsL5gvswwqXqBfFuQCdhAzMLKKPx0pQIiUHInyp
         EsffaT3PV0bUKNS/rBMcgbE7VXnAqgj5OOSLPzJlBpBGTvmUyy8iGrpWvWn4i1FmF+Wg
         5zokEMC97g0bZ3yqa8YKiVp6u9NrP6wZKcxfzMNa/YJ7JsaMKkHT4YUbNGQekkwbYmXz
         jXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F0uZGrdkSgs5HoqGdgWfurGjAeEUVFxD0ugElwq2vSc=;
        fh=6XvMCXPGpY4BYBr5ITls9/XOWCEa37AzUDKi89HVoNE=;
        b=cxUhK/iEnZuWoYCRmbSPT8+duK1pfh/wiPM9z1e8GGb2hXiJaB7/oig3/lYRYk76H7
         P5KaDTuljdtB0Fh7sDI0eM2BwmIDN4ERQiG5FLXdgcWhAuBhms7ci99XvIgIZW/P4T/E
         DCt2JzWzUEdVfP5S1TgvHTJU/K/QI5BMS9HeFwh9LPGh+LC37gzA7NhB3jeMdyTF51G4
         MxgFCvUKzyhlTMNlHFPmGms7PDrrhdp5y+VtxvUttKR0iRhWxpgGQg2Jig1vnrFG6ygF
         H04ldyiFQ8jpwjredubEMJeNrdTE+IVTjiL9K6t6aslAb+cnlVY+GbE3Gn/asiQiFJ/h
         Nzag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fGaeBDz6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8594e000000b004081bb79850si6696670qtz.367.2023.09.04.09.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fGaeBDz6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCCo-0002sY-05; Mon, 04 Sep 2023 12:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCj-0002oU-7b
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:33 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCg-0007Zv-Eu
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:32 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52c88a03f99so2026632a12.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844009; x=1694448809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0uZGrdkSgs5HoqGdgWfurGjAeEUVFxD0ugElwq2vSc=;
 b=fGaeBDz6BeK83pMOfPUigZjh5JMCFiUrnDcZu91OGQVK3L9LfOqh6DDuR9eICEhjii
 9o1EgJqhSmhbYWJpN/93/gPIGGDsRubRsB9/Xeclw8YMaBaQL7vr78zXc7TJh2aqJT4N
 ZcRbbLNAG0pOEm6mfmnOw1YtrXaNKI484PrMtc5JO/aEhvlczf0LLzyxn9+USTW1k+jx
 mDbxcU+O3wUMpKPMvqwEB56UjMDg/vFSShhjTWqr5bmHPkVvHSpq+tSjO0+6y9HHxNlT
 2sPqmqRbn+wNgaFwG92uoyJYbjtEuxe2foR9/d9iZ+Dhu02sVfo1sdfizVw61yy39wtG
 j6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844009; x=1694448809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0uZGrdkSgs5HoqGdgWfurGjAeEUVFxD0ugElwq2vSc=;
 b=E+AG6geAQ6OxCTCPn1tHGTffP5pSrZ6kxNX7QxP/C80hYoJwDlFulEIFlvioDPtG8O
 K6nfxCt9wcgYd3ZZCLhuQA7VGo0QOWaprT3DGjauOh0ZMFQqQZF5Vy6h4vvKkb7xARZ5
 RpnqbeedR7y5T54gqobp/C7/6dOxyu5Vbt3xjXArHQ9QhYSKb+PlzGlrc98TQpabnpt7
 TFE13/BGBQKxV1M8RzSNdIZWrBs/MqP2lmhVYgZTTpRwMsHDOS4jKTIPu4j6S/tN+0nj
 63s877S+LM13V9/Lhm7yvfXRAVitr6V/v3VGf1YL4DEObO7eal87zUk2Zd1GWRi22J/0
 l9tA==
X-Gm-Message-State: AOJu0YzGvfFp2GHW8QslRQZS/Dm9isJK5U9c4kyYN3p+cwoKH2vMwxb6
 RoDodUOI9X8r8CfR9wJO1OSITQ==
X-Received: by 2002:a05:6402:2b9a:b0:52e:585a:e94 with SMTP id
 fj26-20020a0564022b9a00b0052e585a0e94mr464702edb.2.1693844009181; 
 Mon, 04 Sep 2023 09:13:29 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a056402074b00b005231e1780aasm5959553edy.91.2023.09.04.09.13.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 09/22] hw/arm/allwinner: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:21 +0200
Message-ID: <20230904161235.84651-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m1BdbN+yjwgX

Fix:

  hw/arm/allwinner-r40.c:412:14: error: declaration shadows a local variable [-Werror,-Wshadow]
    for (int i = 0; i < AW_R40_NUM_MMCS; i++) {
             ^
  hw/arm/allwinner-r40.c:299:14: note: previous declaration is here
    unsigned i;
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/allwinner-r40.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 7d29eb224f..a0d367c60d 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -296,10 +296,9 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
 {
     const char *r40_nic_models[] = { "gmac", "emac", NULL };
     AwR40State *s = AW_R40(dev);
-    unsigned i;
 
     /* CPUs */
-    for (i = 0; i < AW_R40_NUM_CPUS; i++) {
+    for (unsigned i = 0; i < AW_R40_NUM_CPUS; i++) {
 
         /*
          * Disable secondary CPUs. Guest EL3 firmware will start
@@ -335,7 +334,7 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
-    for (i = 0; i < AW_R40_NUM_CPUS; i++) {
+    for (unsigned i = 0; i < AW_R40_NUM_CPUS; i++) {
         DeviceState *cpudev = DEVICE(&s->cpus[i]);
         int ppibase = AW_R40_GIC_NUM_SPI + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
@@ -494,7 +493,7 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_EMAC));
 
     /* Unimplemented devices */
-    for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
+    for (unsigned i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
         create_unimplemented_device(r40_unimplemented[i].device_name,
                                     r40_unimplemented[i].base,
                                     r40_unimplemented[i].size);
-- 
2.41.0

