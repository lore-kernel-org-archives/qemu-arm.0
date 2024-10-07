Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1990830njb;
        Mon, 7 Oct 2024 07:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7TPqWh9BFkLN8DW/seeN0mx+/tfvax3OLyCUTus6ztK1aD7y9Ye53b++iZIf4mkaST0WatxAqpOQFGg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+IZc6q7YWJuUPI+RhhcO13/elvJAUK/bl9pkY3uocrs5mphc7zUaPT3VgoKxtPR4Ty9nL
X-Received: by 2002:a05:6358:1081:b0:1b1:ac2e:af69 with SMTP id e5c5f4694b2df-1c2b83806b2mr400369455d.17.1728312469842;
        Mon, 07 Oct 2024 07:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728312469; cv=none;
        d=google.com; s=arc-20240605;
        b=k8LYqjrp9YwVl18kCuIzauGIehNOCJN83bXQagT8FnZ2TfjDmhf+PtAD855iumLhzm
         jAMT1O7nLxIpapFluWJGhCrmII3xlGwtodlNxm8yEcp55xK2AL7jTO6luV31rORW4GB8
         LksQ8+iZ4Ob8KkxqrpHJZcsMvo5URveTYH0I8UVs9Kplomgu3swKoyM5vivg+gXvRzqi
         2o8hfwo4dZIO9kLpmCm3PplZr5yz62jHclI5zLV/E/E1VIGaAxSuahpoqoRa91dFjL6N
         Cx6af67EHJ1/Mh8YzdAKoHbAq4z79Hgc1He0jQ15sOigwb6GwQzuNtI2Kor64kwxuZ6i
         dZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=A1fr/rYlw9AI2M0g4JKjOGpNkbuvuDWs4lHkTXYOIYU=;
        fh=FyZYyQ8dYMXkcigk8u8CkYZdd69OAlAlE1SuwUD7/gc=;
        b=UdhaRXM4e995sDgaXQP6ZTTu+WHfUTcb+vzoROPfKNHJ1/I2kEqDMyF7LQCldTdvnQ
         1/bN0uAoFFY5pyj4cysiq+diQ1oZi4agy75hBINNZ0dv2Vx/Jfrf6vI7M29qki43qEnK
         AJLhYEJnISZ6q8hl1KJVfHJWU/ezq6+XVV7jKaK//cWNbSto9KF757p7s2LRdd9UWul9
         pLj2wjCDm6aErP6nGp7j9qd8GArjUo7jArgnLNYkPrfoj4KpJuD6grjfckAvfk1dy20+
         TxAq+90oYhHMPWSQoWEGDfWzKfyGwJSMC3rCDSBauXX3Ui9qkCPcci6h+fYKj9lqdSzg
         ElnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FZ5vnJ/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75764fa0si610529385a.509.2024.10.07.07.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 07:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FZ5vnJ/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxp1P-00071M-BI; Mon, 07 Oct 2024 10:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sxp1N-00070X-Mw
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 10:47:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sxp1M-000461-27
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 10:47:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cae102702so35822065e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728312454; x=1728917254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A1fr/rYlw9AI2M0g4JKjOGpNkbuvuDWs4lHkTXYOIYU=;
 b=FZ5vnJ/73BblFeW7EunOhMMTOwAMpxOJSbc22RumIQpeAiP3X7MNjjCgGM2oS/dNSK
 kS1CEk6nhJA3QV9INrxmN23buH0Q6S9wP8s2buWd90XKsypx1NR/rbnpv9bKjctYsTAb
 Qp0y+/FzthR9knIjgTYOFzXM6VeD5DXZUXXN7T3Vh/sSk05ofRyUwpHSEbUaWrdpS2s8
 xkQt7k16vZGF8cEtKIN/zGWOXN3NRzyhzGOOT8OcqKxieWfWJaA2T82gcWAQa62Dc4FW
 +rMLc920aqYU7LL53cYfl/HPxEuw88Y4fZsCvsM3ES/rOdozOSjLEjpCaBtOi4T8SWd9
 IqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312454; x=1728917254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1fr/rYlw9AI2M0g4JKjOGpNkbuvuDWs4lHkTXYOIYU=;
 b=AHT5G9mPFLKkdoglL8UUaycYJOJxu1+5PnkKOKIrvDVqtnchPLjQ9gdFr6DG+ZaQ1t
 Yiyi61Iw66YH6JsSPHENy8gDW3t5lnzlXTrwd5Wq9WJYkG1QnbxpshX2WaFOpAhGKHYs
 38s8HRPw1J0KpHm3jEJ7VCrRgXh5ABgkhmnsvbE6MBC4F8IOC2YZFYj9iESgE8ZrDFDM
 9UsbZphF1Y0dyoL/y/H2cFcto1Q9e9+NIhWgjZSLvq+Uw+sBBlZuYfXrKGCE6mt22azU
 JFZ6P1dMpjK4F5JMOeZQO1+jxaOT+UbzJeYVEA89jBmSueZtCbt3r8sGLQudIX9IxDW3
 wZXA==
X-Gm-Message-State: AOJu0Yy2XDRAmGOY3a5twmg2oWwJ1bSTpvbMcmcNougDXe2afs9YqiHx
 hLy1ihv8i2jXoK0oQO2DR7KBryrRv8fSPHyuZsfdt0DC+fqxU/cL9w7IG8A7h2yQBMiImTR/eCY
 n
X-Received: by 2002:a05:600c:45c6:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-42f85abebdcmr78276085e9.18.1728312454342; 
 Mon, 07 Oct 2024 07:47:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86a20393sm94252435e9.12.2024.10.07.07.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:47:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	qemu-stable@nongnu.org
Subject: [PATCH] hw/char/pl011: Use correct masks for IBRD and FBRD
Date: Mon,  7 Oct 2024 15:47:32 +0100
Message-Id: <20241007144732.2491331-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: bFP0C1r/OZ2B

In commit b88cfee90268cad we defined masks for the IBRD and FBRD
integer and fractional baud rate divider registers, to prevent the
guest from writing invalid values which could cause division-by-zero.
Unfortunately we got the mask values the wrong way around: the FBRD
register is six bits and the IBRD register is 16 bits, not
vice-versa.

You would only run into this bug if you programmed the UART to a baud
rate of less than 9600, because for 9600 baud and above the IBRD
value will fit into 6 bits, as per the table in
 https://developer.arm.com/documentation/ddi0183/g/programmers-model/register-descriptions/fractional-baud-rate-register--uartfbrd

The only visible effects would be that the value read back from
the register by the guest would be truncated, and we would
print an incorrect baud rate in the debug logs.

Cc: qemu-stable@nongnu.org
Fixes: b88cfee90268 ("hw/char/pl011: Avoid division-by-zero in pl011_get_baudrate()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2610
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 15df7c1e1ca..0fd1334fab4 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -90,10 +90,10 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define CR_UARTEN   (1 << 0)
 
 /* Integer Baud Rate Divider, UARTIBRD */
-#define IBRD_MASK 0x3f
+#define IBRD_MASK 0xffff
 
 /* Fractional Baud Rate Divider, UARTFBRD */
-#define FBRD_MASK 0xffff
+#define FBRD_MASK 0x3f
 
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
-- 
2.34.1

