Received: by 2002:a05:6214:c86:0:0:0:0 with SMTP id r6csp1062836qvr;
        Wed, 16 Jun 2021 09:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeksT25ZJV4oIAWwWRL9+ssnixTRC2rEAHbqP+yv0Pui2V6CFCXCZmxi0IYw31vmsOyS0f
X-Received: by 2002:a67:e45a:: with SMTP id n26mr1065066vsm.3.1623860835824;
        Wed, 16 Jun 2021 09:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860835; cv=none;
        d=google.com; s=arc-20160816;
        b=RNXGIFHyxq8AyM32rVh6HZpU+PeJboqSGC+4rIzNGW9aDFkhCh17bJxj2o9Jlf/8Ex
         hYsQOm75GcaayHkUdSjP5CM8JhXeOcFRgqVhQycK5hRoegFKOSx60Hf0MJLI2mrecCd7
         Gni9TiDyTqagHT5dzRqRzJhnRr33r9qHkjMn2RJ76X6Iy4itiPbnRKqLJFFqRGO1pzXq
         okc6Dp/B0GTyY5czF/6IlWnlO76f65VWKs1U8uinh3pEI+MIoYdvcqtzl2ZTaAvgAdtN
         LJ5R7Ex7PQuxCUjkONWTwuXc+8ukWytR1FWDlkz9n/OGKjTFS3zPFvagkyRuceqLvKtp
         dDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6lt85/6Ab9aS88Gelb6VTdSzWi6Pxv6OIgfdzzi0PC0=;
        b=aENuNdOZU/Vl9nU9PwqDNsvRHZmBcAz2ljXQaGQ3dKyktQG3sNqxHb/2KReQaI6L27
         yFf6/u67BS091509+ft2hECfXfkwLmLeRe3uRNcE+EyJujiO25KgnD5vZr8CB2Hsu35a
         PDWGDu4PbkM/XYWT46UOB1qYbzS0x1FcfIvGTv64fGeyC4Qu9VuIqHAvx+rUFjZSk9/G
         kPB5V/QTDwecbvlsWB3dHj1lEHz+Mm8yGQNMFdckdVAWWS8pjMBRW5gKhFrYXjf79zlS
         2ZSHFLfYpD/vh1E3Ql2eeG8OUIcaBgEYxMtb5OcvHgi3juBCAfbH257j4ctXSevOotbj
         HRMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AFjVHlJk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si1970528uam.187.2021.06.16.09.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AFjVHlJk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYNn-0002Ad-72
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYCM-0003r4-JV; Wed, 16 Jun 2021 12:15:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYCK-0006J8-WF; Wed, 16 Jun 2021 12:15:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z8so3300828wrp.12;
 Wed, 16 Jun 2021 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lt85/6Ab9aS88Gelb6VTdSzWi6Pxv6OIgfdzzi0PC0=;
 b=AFjVHlJkrDVEUb2KrSgl5Mmxj5uGBUpgzArWtbqy8il0tszisGmBW7ohXMW0q19169
 FWv8Hj/hCo0jrdA3HYI19GsPehjG4DDmgKhwggMt2U9CCoIAPfR0P2oEuilbhzuJTAiv
 jcUjg5FFmrLIIUiXrlzGYLD0x4wSutS1nAACUcAxx5gwJi0/Xw2fs8eSbLS5qpnZXJlc
 LQsU/ccElb40L5hcOi4Z32Lz6ZbKLOneeajUF0w+5JZx2Hi1qIpWiolx4qQLDJKRZD6S
 r/ACAwPVOSzsjinjEJbUeFTllcSzcbfNzba0/h+3n2wQmYWdE27JU5C+bEZBtRulSTCH
 rBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6lt85/6Ab9aS88Gelb6VTdSzWi6Pxv6OIgfdzzi0PC0=;
 b=AONaIbuv7PhDVZ32gIT1h5Y1g/0f9CYuzFKxH+05wNlS8HExmQxbkTagSJOQ0EUgHp
 Te4w/L/MuvBA5f9eFZiTLKtiONOuvUlU8TxJUp8xcJ48/oaUL48VlKrXbksa3NFW5zFP
 IU411oh3IVcYpOqEt3hDkCSyxJfG7B4pBe1Fhvrw1M06qKSbptt8Mb+OdBpMK9zo2Ezc
 lpP3d9BKhuMmvKEXOZMzSj3CXe09co14xBKZepb+tUcvJhvn0sMa/wRG9ftEKQMkhEpy
 x53TOVYbDS+GYHyizt49JvUABc0k/nzVBwFk/7iYemZe2rfSSJxZditseJTTh1fBFY8m
 PlbQ==
X-Gm-Message-State: AOAM530gKVK0dbL6PA+VKE5N7lwFBeSqcEZuI3U8Q1Zatm7rXEgbtCU2
 HN0lT+4cGtfQWNgxnSLEGTuGVn3qTpkhLw==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr193752wrb.259.1623860122762;
 Wed, 16 Jun 2021 09:15:22 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j34sm5190601wms.19.2021.06.16.09.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:15:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/13] hw/i2c: Make i2c_start_transfer() direction argument
 a boolean
Date: Wed, 16 Jun 2021 18:14:18 +0200
Message-Id: <20210616161418.2514095-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0VfJw8Ln06Vp

From: BALATON Zoltan <balaton@eik.bme.hu>

Make the argument representing the direction of the transfer a
boolean type.
Rename the boolean argument as 'is_recv' to match i2c_recv_send().
Document the function prototype.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20200621145235.9E241745712@zero.eik.bme.hu>
[PMD: Split patch, added docstring]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 11 ++++++++++-
 hw/i2c/core.c        |  4 ++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 2adf521b271..5fe94c62c00 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -80,7 +80,16 @@ struct I2CBus {
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
 int i2c_bus_busy(I2CBus *bus);
-int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
+/**
+ * i2c_start_transfer: start a transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ * @is_recv: indicates the transfer direction
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 6af24c9e797..6639ca8c2e0 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -115,7 +115,7 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
  * without releasing the bus.  If that fails, the bus is still
  * in a transaction.
  */
-int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 {
     I2CSlaveClass *sc;
     I2CNode *node;
@@ -157,7 +157,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
 
         if (sc->event) {
             trace_i2c_event("start", s->address);
-            rv = sc->event(s, recv ? I2C_START_RECV : I2C_START_SEND);
+            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
                     /* First call, terminate the transfer. */
-- 
2.31.1

