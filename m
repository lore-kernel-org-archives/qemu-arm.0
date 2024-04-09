Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1912055ejh;
        Tue, 9 Apr 2024 06:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkndPkcxjN/8up1xTX6woF0iopn0RnidheM7qFsY7igzJ0dZJ56/kTGpLgPA6AolqvwolrPlArj72GiZCAYmG2+WV8l4I7
X-Google-Smtp-Source: AGHT+IG6fooiltGFUmbjKcfZVKVg1T16WX+XmSCBvcVPaOB88N3G1/tuwYVri18CtGfRS7F4kXzi
X-Received: by 2002:a25:aac7:0:b0:dc7:140:8c0c with SMTP id t65-20020a25aac7000000b00dc701408c0cmr11389826ybi.23.1712669982612;
        Tue, 09 Apr 2024 06:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712669982; cv=none;
        d=google.com; s=arc-20160816;
        b=BC6BIj8rC1Ms+e8ogfWGaPi+BfW947Vu3jTqHFUfXHNQwNX/Wh4nmqZulAZdVeOYP/
         Xjv6d2yanFLwP8oqTzPuWezSktvs831i8Reyf5miA+9ucB2Gpexn0+DEJhpndZjOhqiT
         edI/ntA9Zvmn/wFqxf106Ml0UW1nrgq/sw4ObjhT4rs3xynpEMcZVW+mKKpuUUV9e4Rz
         DbmJgtMA88FSslTzoKIHQ7AwVCWo6BcbfAeuhgXiXTe5kwWY31jXyQ5LNUaRwmZckUhk
         Gap6Hcig81rispA4rQ0WBbbth9XoEP7Q8vp7io+/Zro4D8wn+XU9q0hJ4gaSFbvWglT7
         A9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gF6HIIw6B4sYh42vGN4HzBKkT28PHylGD41Sq3YKysg=;
        fh=QOl9Xi9nQ721K4qxGgLCqy+fNk/yfBHdpOYFmb4mu2g=;
        b=UXRVJnRXOQo6nslC2H/CuGppOawoq7fy2SmDzXVbM7gwu13LgCZ4FKyIUdgEDqlAw6
         upQc7ahcHVGg20l83J4u3uBwM70R9Zjb4wC1QtIX82q9EwZ+9kKWP+YiAI8XWONCiuyA
         tPZOnhgsb2oFPR7urPFZjr8P+bSSpAqWVeUmdK7I5Z3py7VVAw3282UBr+QTH4aA802+
         R4hHCl3pYRQlqY0Lyan1i09sWxUotHV+hqJTxv5NDaymofFnxVNJm/a9qThStA5kLe3x
         9G1jCXWXIJT+zCGoVaoQ+BwcU2qfDgYDn5Si5FxzgeOn9jIQI9nc+pMKI/4+vuQ7qq6Y
         fzIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8FpbpF7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a061200b00432c730fd04si10928363qta.746.2024.04.09.06.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8FpbpF7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruBgt-0006NN-Mx; Tue, 09 Apr 2024 09:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgH-0005yG-P2
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 09:38:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgC-0008EA-3E
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 09:38:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-416b7f372b3so1963045e9.3
 for <qemu-devel@nongnu.org>; Tue, 09 Apr 2024 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669905; x=1713274705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gF6HIIw6B4sYh42vGN4HzBKkT28PHylGD41Sq3YKysg=;
 b=S8FpbpF7twbylfVlLu54c/YC69uDLbzg0pP476agLBBvdIKBMmCWTgyXahoachl3Ys
 7nZq0VV+H/KjA35lgZISJY+T53ras3swDGGHGCduHrSiXd5IoYetFmm97AqKSvIifvUA
 9XuLk2I+8BItERRWPANmPtkBwzxBsMUQDSNNVULKEmQFyeJmHltoxuRJCtjLb3+VxPXk
 we4D9R1n7KLZcOu7c0E8K8JN33ibFTJ10Qcjhvma4TvNDg0Hni9jsNhpqHFPdBM21rIW
 lfuMdWKXse2KfXM+5RQObW1S1ARYd1qwjKN9exmcwmFWRmWTEQ4sFDW+JrSep6meEGQf
 cgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669905; x=1713274705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gF6HIIw6B4sYh42vGN4HzBKkT28PHylGD41Sq3YKysg=;
 b=og6LixhW6y3toAEHn3B68/A2YXcNriHS++uX7WtHqCX25PR/4W1bjXpCdtbMVZvRmg
 vDS2CXS+9F0JlYCUnSHay6IJy7C9V9P8rUTQK8/85t/dy3n00Fnx5ljbm5lUZXcSOXIR
 pTTNBmB1j+B68lcejFfCyALaWnByAJnUoyjWeEiZ2EHPG12WaCWdsqcHS1DI1xVp4Ojq
 xD70kpiJFuVU2Wf/FARsgfX0hUuWwIZoU7gHlfLyv85Gy9liUVezeW5kuj1WBlI7yvVp
 E1DmXiSY7nVpSU3V/Fa9opDt++94x9cUoStfpsTSSDwbBpTLStQBI+NOAz3i9UAO3Sh6
 nyIg==
X-Gm-Message-State: AOJu0YyrQk/6L9WlesPFRIYpeo1oV0E+K1WEfByW23lUmHR+PcG1Rai7
 pL4b0bC/4nR2rA/7rmt2yNWj0QhPwZgXkA2n40Qh9entulSumJR1/F/Xxv/BfzmzxlNa7di9P1R
 B
X-Received: by 2002:a05:600c:4f54:b0:416:6abe:2975 with SMTP id
 m20-20020a05600c4f5400b004166abe2975mr4221251wmq.15.1712669905261; 
 Tue, 09 Apr 2024 06:38:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b004162b578d8bsm16974787wmb.1.2024.04.09.06.38.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:38:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 04/11] hw/net/lan9118: Replace magic '5' value by
 TX_FIF_SZ_RESET definition
Date: Tue,  9 Apr 2024 15:37:53 +0200
Message-ID: <20240409133801.23503-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
References: <20240409133801.23503-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: n4q0FUFY1ddh

TX_FIF_SZ is described in chapter 5.3.9,
"HW_CFG — HARDWARE CONFIGURATION REGISTER".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index d6f0e37eb1..a6a869de32 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -71,6 +71,8 @@ do { printf("lan9118: " fmt , ## __VA_ARGS__); } while (0)
 #define CSR_E2P_CMD     0xb0
 #define CSR_E2P_DATA    0xb4
 
+#define TX_FIF_SZ_RESET 5
+
 #define E2P_CMD_MAC_ADDR_LOADED 0x100
 
 /* IRQ_CFG */
@@ -435,7 +437,7 @@ static void lan9118_reset(DeviceState *d)
     s->fifo_int = 0x48000000;
     s->rx_cfg = 0;
     s->tx_cfg = 0;
-    s->hw_cfg = s->mode_16bit ? 0x00050000 : 0x00050004;
+    s->hw_cfg = (TX_FIF_SZ_RESET << 16) | (s->mode_16bit << 2);
     s->pmt_ctrl &= 0x45;
     s->gpio_cfg = 0;
     s->txp->state = TX_IDLE;
-- 
2.41.0

