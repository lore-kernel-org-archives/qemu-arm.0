Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDCECCFA13
	for <qemu-arm@archiver.kernel.org>; Fri,  1 May 2026 16:27:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIqhM-0007Vw-H2; Fri, 01 May 2026 12:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIqhL-0007VZ-1O
 for qemu-arm@nongnu.org; Fri, 01 May 2026 12:26:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIqhJ-00081a-Cs
 for qemu-arm@nongnu.org; Fri, 01 May 2026 12:26:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so13148715e9.3
 for <qemu-arm@nongnu.org>; Fri, 01 May 2026 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777652796; x=1778257596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mmiMA9qK8lid2+4XBA9PvoBX50ox7NRv+ljhQLzau9w=;
 b=kf3+wbzTdaTIX4D2Jgr8+fL4IgHqUrqgt7CGQv2+FwtOYRtA8Ksmj4ZNVebAtsrHs8
 S3qB2zUBiV9kxIs/t7V+6nUz2QH/vWSBnqfZTDSzapfdPlcqB6b7PnXFjcZDDuuSpsaI
 R1dTkc9h5P2gMnbeYC+4qK0D/XKDpitAEilUNHMPqBCgsaII0cA3iwBahswC/XFNjeyU
 /qayJJAR+MlSMirvPuv9pNQ7/OrOXS3DavinsM98BxFs76CkDoeOer0RU6ncl2504rNx
 DhXTw4QN593I0eXqJg1Nt9I64KgyzYGDXuI0EUm0RyGhlbZ/1hfG5FiYqJ7aAaayhU7W
 pJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777652796; x=1778257596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmiMA9qK8lid2+4XBA9PvoBX50ox7NRv+ljhQLzau9w=;
 b=VGgoynEWXWn6x1T5Q2d0AACSW+Rg9RdK7WA4fK4//+g6j4jjQpnHn8FDK4dPjzru4z
 WI4w/iOkROVPnDhtFcvDREokLTXzG5JE9/MwB4ww5xDdt59Ozd/UuF/osW1pXDQLK6j/
 APJTfSUOkpWVa7w1U39Ot+SU2nFddP1yN913BBZdEDs+GJZQnv579qZ0lPbjPfBTIgq9
 y0ZaGOsLSR/Z9Rx/AEaOj1wUenfjw0u8AwjaKGNMESB81q0Emg4jMu+gQq5CVa86v+Ta
 PKT4vhgwoW37WKS8cMgbxGSfhap4l5DRo85dH3EuhzG4j0ua8FdliZfEewMzQ8i/L6+Z
 rEZA==
X-Gm-Message-State: AOJu0YyilCTmU1Zzmox/kC10lzNTlEBS5xh6PMjzteHuZm9/7EhO3vsu
 367TWDpU75wBharUedI3LnrR2q5IjYs32QK+8UtvPDzzljHbQSgVjqaDOglIIc95MvuoN1AntfJ
 RFikO
X-Gm-Gg: AeBDieuAHoi0K/nnFnYDhYZL2DPOyJsRPYC7fUoMXEQTayEEZnpp5n7+l39IeYrDVD6
 h+skw81+h2HFilbB6S1ByNrzIe+WSBl6ovfyOBJA7uN3PWfDlQ3uWdoerk5IQr2YBcmHYJwFV8W
 4Mlke+IFML5imoHN8MicjYLFonNvzJVAIfpQ/r8t4GtyE+Ypahj/fsaYHDq1NofHL438uMR/9fI
 CRHuW5EoyYfdbMtDrI2OoGwGs+wimzlNgY1ht5f/fycjlaiaERQPfdkv5/z1PRMccGF3amQeeUx
 skCSHc/3K57UZamFEsF1MLS3jNRuCu9qiOrZn1QLsigPGK7etOYQ7unBfH+r3rKmkzZNrR65IWJ
 zJq4o7sKmHrg89/1IKWalrCnuRf10qTP78nbvybzQo3hIU7L5z/XvrL69eu6KqDBEnBh0rslQXn
 iG7f8KJ2aRSrbsU8gmzY76Kzlsjx9iyJtUM3DSNRhWELtANZQOS+KVG+OnMy0qRSZ7b/ne4tXyo
 MPO8S8A6pXzl0zi7eTICAu0lBUKL8WJywpcmMvGEQ==
X-Received: by 2002:a05:600c:6285:b0:488:a797:f0ac with SMTP id
 5b1f17b1804b1-48a84485623mr137002515e9.28.1777652795666; 
 Fri, 01 May 2026 09:26:35 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a820c865esm129172755e9.5.2026.05.01.09.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 09:26:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] hw/i2c/microbit_i2c: Don't index off end of
 twi_read_sequence[]
Date: Fri,  1 May 2026 17:26:34 +0100
Message-ID: <20260501162634.4092394-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

If the guest tries to read more bytes from our fake stub I2C device
than we have provided, we incorrectly read one byte beyond the end of
this array. Avoid this, and instead keep reporting the RXD register
as containing the last byte of the "data transfer".

Cc: qemu-stable@nongnu.org
Fixes: 9d68bf564ec ("arm: Stub out NRF51 TWI magnetometer/accelerometer detection")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3408
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/microbit_i2c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
index 2291d6370e..d9689b6f1a 100644
--- a/hw/i2c/microbit_i2c.c
+++ b/hw/i2c/microbit_i2c.c
@@ -41,8 +41,13 @@ static uint64_t microbit_i2c_read(void *opaque, hwaddr addr, unsigned int size)
         data = 0x01;
         break;
     case NRF51_TWI_REG_RXD:
+        /*
+         * Return the next byte from our fake data sequence. If
+         * the guest keeps reading the register after that, keep
+         * returning the same last byte value.
+         */
         data = twi_read_sequence[s->read_idx];
-        if (s->read_idx < G_N_ELEMENTS(twi_read_sequence)) {
+        if (s->read_idx + 1 < G_N_ELEMENTS(twi_read_sequence)) {
             s->read_idx++;
         }
         break;
-- 
2.43.0


