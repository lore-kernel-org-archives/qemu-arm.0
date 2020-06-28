Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2196307lfm;
        Sun, 28 Jun 2020 07:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhkxTaUYdmuGQaPqj/fy+NTNwTFzc0Yqt2b7HpLgkcacs+Ujzh6LU2yVEMdLvxNtYIW2op
X-Received: by 2002:a25:686:: with SMTP id 128mr19451952ybg.284.1593354736096;
        Sun, 28 Jun 2020 07:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354736; cv=none;
        d=google.com; s=arc-20160816;
        b=VLNixpAGbfPs/PiMOffdgHLmBeKLXvxoLhcpJTNwcFAeJiG0EblktyY8QByhY1BoQF
         4S35DVvB6nZJgeTczNTDdC/eje8yqUZlEUJEZRXpJSPmzYFxIIl1foGiXXTypq/c3VFa
         yKdm0wySjvrcA5z7K1RnGLPTSgeTB0u1UYhm8t5PdilSWU0gqX5HoAsPmspUA+hamtcX
         Gg9rDsZEIk3UmNVnzeUQW+0YjuKB1wMzu44bEwylBzCeqij/L2DeOLgpsPccHZhRQvQA
         +KUVgplSw4ymPd0HHrMVnJHpDNxVDgog7ONfDRtCok9G97+NvAAxDwgRnknrVtGl7XQx
         4rDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=03unWo1zzivuM0us7q7fEwDLp9zh0qzy8bL3l2XLj/Q=;
        b=nho+UIDVJh3tB9DKjQTScpSWssGOC9TEBk23VwTdyqT4h2xBHzpYSL8PhEbdgnLfWQ
         HW9zT3Uw3v1N9VyQqx2JablMug8twWe+/QxZoSnhAQ8BAAzfSs712aHCKzvVJ4bX5F1A
         EFfCAhpKBkwka8zeHT5U1DbTNw9vLhl8AUzW5523zMqtu2P9pmfV+b5+mFUt3WPg09/c
         JFfRqaHBtoQScfEqH850NeYRP4WHCfjKH89s4VdgmiQyRdxw+LLyKtF87rxLcR7UWE45
         6HhAD6OhTR2SUddzMFqqvQgMbOuCU3S0X8VUUVsbVUp0ofvIDLQvJ7C65mOtOhIX3ood
         y7Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vIG40ChM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si13625182ybb.277.2020.06.28.07.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vIG40ChM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYLv-0001tU-BT
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEo-0006cj-8g
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEm-0004mv-JC
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:53 -0400
Received: by mail-wr1-x444.google.com with SMTP id z15so2774101wrl.8
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03unWo1zzivuM0us7q7fEwDLp9zh0qzy8bL3l2XLj/Q=;
 b=vIG40ChMwd+or/bA4R5r5eLZUe/PJkf3HFq4v0eQIabjB9atprSGbg9BhRFM7VJHZk
 Ym12zj0fkeq5PAxQAQB4KKKfwCBYpDEBYwRYuYucy5av0oqbVCG802ioymly1YZfkSZq
 TYXcan5ztzcuNYK/k3nNQRmvRd+dfwtuLQw/4ev0VuhT9iZ6VkjzHq5nSYkxVxg6JQdD
 bfxQ9hUiShCa4JG18aTorTT1Qfwss05aRkph+OMZuxwytnzLRnsyo264lvXI9Pueb6Z/
 O51cdc0W77/Oct0MAobp0KmjNgk0zer4JHHOXGUd953xZAxgfB2hizMNC8Eu7d9mNdsb
 0mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03unWo1zzivuM0us7q7fEwDLp9zh0qzy8bL3l2XLj/Q=;
 b=PaRZvrdUh68bd7KSuvSPSGFMtkHc/eSSyB5xml6G31SqRxYJZJEEGTM3/YW+lUvrHz
 sLLYW9NTEPQKuMfAeIXenb7IWShfNEphN4iPSrvjzye4qjFWPc383MFwUB5OcPV+FzFk
 Juno5po2cW2mFKYlpLu/DuNt/+XyDqGiyNUs0NQMPyGYacGWRuUoUYMJsNdIAQf6lLaO
 AHHG10j2OOY8dsmZqkvZKPV+lYK1PFC1ZAfzxkuFxKmsrqTqlrnwJB8wtWTO3Rsi3zwN
 b2iyQVc8FeN59RFlX5QyWErLwgwWf9eJMUD0BbauDVbvoeWRe8WBEW8rSkT4BNutA+Ej
 GvPg==
X-Gm-Message-State: AOAM530d5k4NJCdSfqcVGE5J1JPIdbD/LbWueW72YiloOjZzrfg3z5me
 tKaUPjuv15EjmHkVtp7GFbvtNeHBGqd4xQ==
X-Received: by 2002:a5d:4986:: with SMTP id r6mr12594556wrq.424.1593354291023; 
 Sun, 28 Jun 2020 07:24:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/17] hw/arm/spitz: Provide usual QOM macros for corgi-ssp
 and spitz-lcdtg
Date: Sun, 28 Jun 2020 15:24:28 +0100
Message-Id: <20200628142429.17111-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xX/N1zIyJnFY

The QOM types "spitz-lcdtg" and "corgi-ssp" are missing the
usual QOM TYPE and casting macros; provide and use them.

In particular, we can safely use the QOM cast macros instead of
FROM_SSI_SLAVE() because in both cases the 'ssidev' field of
the instance state struct is the first field in it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 49eae3fce4e..f020aff9747 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -579,6 +579,9 @@ static void spitz_keyboard_realize(DeviceState *dev, Error **errp)
 #define LCDTG_PICTRL    0x06
 #define LCDTG_POLCTRL   0x07
 
+#define TYPE_SPITZ_LCDTG "spitz-lcdtg"
+#define SPITZ_LCDTG(obj) OBJECT_CHECK(SpitzLCDTG, (obj), TYPE_SPITZ_LCDTG)
+
 typedef struct {
     SSISlave ssidev;
     uint32_t bl_intensity;
@@ -616,7 +619,7 @@ static inline void spitz_bl_power(void *opaque, int line, int level)
 
 static uint32_t spitz_lcdtg_transfer(SSISlave *dev, uint32_t value)
 {
-    SpitzLCDTG *s = FROM_SSI_SLAVE(SpitzLCDTG, dev);
+    SpitzLCDTG *s = SPITZ_LCDTG(dev);
     int addr;
     addr = value >> 5;
     value &= 0x1f;
@@ -645,7 +648,7 @@ static uint32_t spitz_lcdtg_transfer(SSISlave *dev, uint32_t value)
 
 static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
 {
-    SpitzLCDTG *s = FROM_SSI_SLAVE(SpitzLCDTG, ssi);
+    SpitzLCDTG *s = SPITZ_LCDTG(ssi);
     DeviceState *dev = DEVICE(s);
 
     s->bl_power = 0;
@@ -664,6 +667,9 @@ static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
 #define SPITZ_GPIO_MAX1111_CS   20
 #define SPITZ_GPIO_TP_INT       11
 
+#define TYPE_CORGI_SSP "corgi-ssp"
+#define CORGI_SSP(obj) OBJECT_CHECK(CorgiSSPState, (obj), TYPE_CORGI_SSP)
+
 /* "Demux" the signal based on current chipselect */
 typedef struct {
     SSISlave ssidev;
@@ -673,7 +679,7 @@ typedef struct {
 
 static uint32_t corgi_ssp_transfer(SSISlave *dev, uint32_t value)
 {
-    CorgiSSPState *s = FROM_SSI_SLAVE(CorgiSSPState, dev);
+    CorgiSSPState *s = CORGI_SSP(dev);
     int i;
 
     for (i = 0; i < 3; i++) {
@@ -702,7 +708,7 @@ static void corgi_ssp_gpio_cs(void *opaque, int line, int level)
 static void corgi_ssp_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev = DEVICE(d);
-    CorgiSSPState *s = FROM_SSI_SLAVE(CorgiSSPState, d);
+    CorgiSSPState *s = CORGI_SSP(d);
 
     qdev_init_gpio_in(dev, corgi_ssp_gpio_cs, 3);
     s->bus[0] = ssi_create_bus(dev, "ssi0");
@@ -714,10 +720,11 @@ static void spitz_ssp_attach(SpitzMachineState *sms)
 {
     void *bus;
 
-    sms->mux = ssi_create_slave(sms->mpu->ssp[CORGI_SSP_PORT - 1], "corgi-ssp");
+    sms->mux = ssi_create_slave(sms->mpu->ssp[CORGI_SSP_PORT - 1],
+                                TYPE_CORGI_SSP);
 
     bus = qdev_get_child_bus(sms->mux, "ssi0");
-    sms->lcdtg = ssi_create_slave(bus, "spitz-lcdtg");
+    sms->lcdtg = ssi_create_slave(bus, TYPE_SPITZ_LCDTG);
 
     bus = qdev_get_child_bus(sms->mux, "ssi1");
     sms->ads7846 = ssi_create_slave(bus, "ads7846");
@@ -1220,7 +1227,7 @@ static void corgi_ssp_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo corgi_ssp_info = {
-    .name          = "corgi-ssp",
+    .name          = TYPE_CORGI_SSP,
     .parent        = TYPE_SSI_SLAVE,
     .instance_size = sizeof(CorgiSSPState),
     .class_init    = corgi_ssp_class_init,
@@ -1249,7 +1256,7 @@ static void spitz_lcdtg_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo spitz_lcdtg_info = {
-    .name          = "spitz-lcdtg",
+    .name          = TYPE_SPITZ_LCDTG,
     .parent        = TYPE_SSI_SLAVE,
     .instance_size = sizeof(SpitzLCDTG),
     .class_init    = spitz_lcdtg_class_init,
-- 
2.20.1

