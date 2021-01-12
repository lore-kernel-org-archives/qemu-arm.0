Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3790469lfq;
        Tue, 12 Jan 2021 10:41:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTnyPeExl11NHY7mJRyGVk1gqgJYmJxHkkHVa+H7oSZW/z09cnzvvnYyFRhtBX8DdLtrCB
X-Received: by 2002:a25:2d53:: with SMTP id s19mr1251436ybe.188.1610476867582;
        Tue, 12 Jan 2021 10:41:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610476867; cv=none;
        d=google.com; s=arc-20160816;
        b=A2YgMtgRfN+G8w7RXQKTPEj1dGKpttvyAOO197RrjtthPCfKm6PnPVSZEml26pJdpI
         e/gBdsMkiUziJhjQ2Dtq820nOZsOjP991keKmk2oyaFZFmAd4z6/FJTTi8sHGYs4KhwR
         7h7fG0bmUEyMqYSC7V7ACt8woR+ZE2GfmHEgzujUvTUoQsffOtxOyhlao04DsC5FSVHA
         uefgNL6BAQQSNQ4DRW2xVyghqO2VKlwZ0oh2yjtj+GpGQ8fe4oleiL9kkWzWLZGAYrix
         U7HORfBKEgWf2k0HGx8Z/+wyc14ND+B8Wf47CN8pRzwP06R82E544ocM4gm3Gj0RT45X
         aVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UUrqq49b0H8vT1YH+cv+uaCjRkYF+aPQPM0uhg4pceE=;
        b=V671tJS4dQlS9tYIGMx63FMT6MYSyoFlaSmb/s6Odn3RV9vDcJovJhqqlVDv/YoA5d
         6kwe5Ofe8fPL/xRZep1KRVZjsTYa7WCFJMYFOThBfGK1mQm8upgJ+o2z0m0Botd2bd/w
         eRgOiYOrXfxepx65DCrDdiicexGb77Y7493i7UV0vvpeQiW4JdOI5xuW47B509E70qEx
         DDSnFC+SOPxrFz6D6yoIq++5D8V/dSFjvgWRZcWyqkzpmgNQnX9ayn+z+hh4twQQtDSX
         un8jLO/06nJdwkMYaQ86g6wseJK32Bqrysrh7ZSH5/I/xR3KAuNWEvG4jgjhZTYx7xWH
         dfiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EJJMRxbb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29si3501768ybt.474.2021.01.12.10.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 10:41:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EJJMRxbb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzObK-0005pt-VD
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 13:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWq-0001oR-Bv; Tue, 12 Jan 2021 13:36:28 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWm-0007UX-Et; Tue, 12 Jan 2021 13:36:27 -0500
Received: by mail-ej1-x629.google.com with SMTP id f4so3840454ejx.7;
 Tue, 12 Jan 2021 10:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUrqq49b0H8vT1YH+cv+uaCjRkYF+aPQPM0uhg4pceE=;
 b=EJJMRxbbJxh8UJwD7/C898SYLP5gBXoO4/wgs1dvDaZnTWJuXj2ATH9mQEW4gy7pAW
 EsE4BG1osS3BWvEDnKmmVpsJlm5PkjrhCkD8pNTcHfG8MpleSoWlNBrG7/fYEuuOkayV
 p5CGVDXtiB/MWb0JF2hkkau8XqI7lTFAc+TyMJJ5Fwv2XPOR6Skpt3o41isDM7Xt2ztt
 Egkchq+1lLr1RLF+K7HD/ajsyudnSufvwgtHHm8CqrvXh+r8DgkZ0UdL46srdnOj49lg
 HHPsdVpRc3tNSz5doC4fHaFD51nIVYrlYbXMJEoM8kWt/Diroi3njSvErLYqO1/0y2iO
 kujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UUrqq49b0H8vT1YH+cv+uaCjRkYF+aPQPM0uhg4pceE=;
 b=qiseRPbuUMHtXZkeDooCq3ZC9EX02ZQx1GRxfdM3zipWFYbHkPxu3zuXl7qL/cNoQL
 gU/9IQOjsfXUJVeeUTsOyN/X3dCaWrY0/HIjNb0wbgB4s24vIqHoh23xdYNmdRMNr47n
 ScgT0eiM8Q68fY1aOV11BV07SH+7p+zqrv4aTfLtDx8V6ozthHOPWhDbniLZ5NRHhTns
 D3yLKyKZGtK6B7kM6+KpHt8uptOYvlSCvKA4AAq9tcDFx921luHkttDIkx7BzAKFYj1/
 PjuphdqB630QyzEBKV0yM+t73u+SqzmpzvTZiZJ+etQzJeatVlaJCGSrPNQ3JJqw1eUg
 2Xcg==
X-Gm-Message-State: AOAM531V9k3VnXxRnK08C2ca/xo6aC5ZSzbdOcgVLQuTvOnlBWzfrfvV
 6+eMuDQd6uawG1XqF1FqYPo=
X-Received: by 2002:a17:906:878d:: with SMTP id
 za13mr98547ejb.395.1610476582574; 
 Tue, 12 Jan 2021 10:36:22 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id r21sm1779423eds.91.2021.01.12.10.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 07/11] hw/ssi: imx_spi: Rework imx_spi_write() to
 handle block disabled
Date: Tue, 12 Jan 2021 19:35:25 +0100
Message-Id: <20210112183529.2011863-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owV99DSRzvGJ

When the block is disabled, only the ECSPI_CONREG register can
be modified. Setting the EN bit enabled the device, clearing it
"disables the block and resets the internal logic with the
exception of the ECSPI_CONREG" register.

Move the imx_spi_is_enabled() check earlier.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 7ac9da0f1d2..801daa5cbfa 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -321,6 +321,20 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_imx_spi_write(index, imx_spi_reg_name(index), value);
 
+    if (!imx_spi_is_enabled(s)) {
+        /* Block is disabled */
+        if (index != ECSPI_CONREG) {
+            /* Ignore access */
+            return;
+        }
+        s->regs[ECSPI_CONREG] = value;
+        if (value & ECSPI_CONREG_EN) {
+            /* Keep disabled */
+            return;
+        }
+        /* Enable the block */
+        imx_spi_reset(DEVICE(s));
+    }
 
     switch (index) {
     case ECSPI_RXDATA:
@@ -328,10 +342,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
                       TYPE_IMX_SPI, __func__);
         break;
     case ECSPI_TXDATA:
-        if (!imx_spi_is_enabled(s)) {
-            /* Ignore writes if device is disabled */
-            break;
-        } else if (fifo32_is_full(&s->tx_fifo)) {
+        if (fifo32_is_full(&s->tx_fifo)) {
             /* Ignore writes if queue is full */
             break;
         }
@@ -357,12 +368,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     case ECSPI_CONREG:
         s->regs[ECSPI_CONREG] = value;
 
-        if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
-            return;
-        }
-
         if (imx_spi_channel_is_master(s)) {
             uint32_t change_mask = s->regs[index] ^ value;
             int i;
-- 
2.26.2

