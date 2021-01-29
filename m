Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1129596lfo;
        Fri, 29 Jan 2021 05:33:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjjONVGwLzDZSmCclwTiSwqtLK+bbE2XvNZRzLUUNumc57XrBhNNAnjqy6t7CQHob196N4
X-Received: by 2002:a25:8208:: with SMTP id q8mr6344757ybk.159.1611927216228;
        Fri, 29 Jan 2021 05:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611927216; cv=none;
        d=google.com; s=arc-20160816;
        b=TVoFyLknmy+ahdiNBTouKTuC3TGJ4exmT2Dsg/U1nSsBEUFa7m/+IJOEHLhlI6Brck
         JZiSkZ5v8ml7zhtPaud+uLeQv1/x+cwBSgFcHHPYEOlQUZ7QS7+NqpZnFr/6MRk372GO
         FDDjEdJUBhV9lHHH6Fx98MsQbS9u6NQSuTOcw+GxIRLqz/3/iHtrjEy29NePp6ZzOoov
         2TZgwYrqZ9ozEyu5vd9PCgcLoxGo9mG8tYxhmFjKJoJK2WTlbYFB2FyYsabLPlgsDzex
         iIdlsNMlhetiDKQuTWGgzu+NsB8wcLgmwRaLbmMjeP3KrE0baVaPpDy4AwqoZBr90/Io
         O5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CYYrdLg8vwL1EwiAwyU49IXmkoVufUhG59tZxDTUReI=;
        b=F+U60UQvaX9knI9R/YcFNZwuxBbK4PzYCVTWNGIwp5Hof6CbRweYf2ome3vYd/wA/3
         u9gvzUR8pYO0/PWJ9Yubo20U/i80rp9FTbLFppqKd78ukF+1HQoqb9kRvLeP7eJmbS7u
         TSbj/zzoJPNlO7x/cKkWe3+d5kaii2TyFuMv5CpJ3jdEj6uuIrcbMEEZmX0S0prOiTtM
         Z+CxCLE5ojM228RB8bDtsvWcluUhx76zpj1t1WZ99YvpW8RVxuf4g07sp3YKD5+cFQTz
         rapqWX2HyhB61Pl/nraIoFzOPP8v5u3XH8YI/pRvkSBVjQ7X+MA7Uhihj1do5ayV+TQb
         TAyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PMe3wFhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q206si2462901ybb.122.2021.01.29.05.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PMe3wFhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Tu3-00030N-CD
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlM-0004M4-GI; Fri, 29 Jan 2021 08:24:36 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlK-00087N-TP; Fri, 29 Jan 2021 08:24:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id d2so349483pjs.4;
 Fri, 29 Jan 2021 05:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYYrdLg8vwL1EwiAwyU49IXmkoVufUhG59tZxDTUReI=;
 b=PMe3wFhDhgPzoDfad4eKyVep97acC75SIQEExp6Jj+Vc3sqFul7qCtxdbCnfPAq9Ir
 78AvJJ44Lov7iaoW5cAtW+Ty/NX4VqLxk3XLgIDpVlT0rxF229no3Gkab29cSi00VZPX
 IYnXWbu7L6H4YwN6hQBya5RCUK/mwwUSIzuXTg5s5V+rUqGm/BHC8XD1Gk7f1z8u1F5x
 0Mt6zWdJ5Bh7c+cKdWw0/0Uo9LwRhHZcPLQl5FhZ/WgL4TerJucN4mJ7hvpqnhY/GPbA
 yjNhMDvAVSG8obxsIetjjoBqkSYQvOLo3fgJ5JfjHEnO/Sa1Ey7gDegpYo2lI3rDncYn
 5i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYYrdLg8vwL1EwiAwyU49IXmkoVufUhG59tZxDTUReI=;
 b=ReGpJLfR8ByHwcO+j76RHC2+FKwvWiJYQCLU8SFxyjx+l0jxTBsT00GfUzptWNI3cc
 8GBtlYwsfX3438xs90BQnzE3yScpSzqQBXAt0SBsxSNUd0I516AFHqfOYkX4XixlUkQD
 Kl4FHAzLlMH3It+r/h/Ltxw0hzs7Ilf4deZR3+rog97hw8NFXTQjgI9L5mwGnbUigJ2Q
 GO3umgv7mlw2/ChqvqAPVZ4VAzcGqT8X6xw5EH1ZqsuykVSl1z5KIDB2IV4NQWc67KTb
 nGZlDPRYZo9dRUIkGABhDu8uBCi6WZX3cd3p+8Atz4mQk+sQ/3kD46wolHZD8azJ5j1W
 m2BA==
X-Gm-Message-State: AOAM531k9fXaxdBYks0T/txGl/oSMWROYhnsHxIqGxzJ2/lELQxef7vE
 WCgNQq3CX/DXr9XQM/J24bA=
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr4558026pjb.166.1611926673237; 
 Fri, 29 Jan 2021 05:24:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 06/10] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
Date: Fri, 29 Jan 2021 21:23:19 +0800
Message-Id: <20210129132323.30946-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJrxXM5uedW0

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the block is disabled, only the ECSPI_CONREG register can
be modified. Setting the EN bit enabled the device, clearing it
"disables the block and resets the internal logic with the
exception of the ECSPI_CONREG" register.

Ignore all other registers write except ECSPI_CONREG when the
block is disabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

(no changes since v8)

Changes in v8:
- keep the controller disable logic in the ECSPI_CONREG case
  in imx_spi_write()

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_write() to handle block disabled

 hw/ssi/imx_spi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 21e2c9dea3..4cfbb73e35 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -332,6 +332,14 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
             (uint32_t)value);
 
+    if (!imx_spi_is_enabled(s)) {
+        /* Block is disabled */
+        if (index != ECSPI_CONREG) {
+            /* Ignore access */
+            return;
+        }
+    }
+
     change_mask = s->regs[index] ^ value;
 
     switch (index) {
@@ -340,10 +348,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
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
-- 
2.25.1

