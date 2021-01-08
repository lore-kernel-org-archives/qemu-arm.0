Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp705815lfq;
        Fri, 8 Jan 2021 10:06:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKs4hbcgoxK+nHxlqXPIY6Cf+FZk91o86dfFZC36dxfJNRfZsWkbyS5R4Y04gOr6jWttnJ
X-Received: by 2002:a25:868b:: with SMTP id z11mr7317688ybk.217.1610129180455;
        Fri, 08 Jan 2021 10:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610129180; cv=none;
        d=google.com; s=arc-20160816;
        b=PX0hD93FFUJXjrEfM00AD0xYWoRGob8nPwvLsi+G1qCHdN2ikzdri1qrYYOXwmiqgI
         0x0hThFKgZPnGUTj0yUoA1+Cg7od/IyO+xHBvGtwgKI1OZS4vaXvniswN0bS2/Vj9Tzy
         4I5+lndsxgGkj/jDpRInkqiJ9b0qmzvHph+2eTNXbrVnHR7NFsV5MbJoCYtcDdCDchhS
         K0BAij79egXzWk7mu/sXtjJsMOjGU71ghSsHraqmbxi7xblDqfJxsy5Hn2QjV8l7vzqD
         7IOJHkoVfKqo2OViyMGeImHrn2flK+ZO26cru7I36gL0EkhpgBaIAUTMCUXW7EzJG7R5
         C59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5ppBHYzxmgl5hzoC4HlriYit+ub13d9GiK837Ur2BnM=;
        b=WQ+knKizwruyrlIE07KV/jQ8RJUK0AaIVYv3SE1j2gfEKhy36fMXarwN8AJQrs8j+4
         g98zBBT8f0g57AvgT+PvJZNQFM1j1kLYINxhv2C5l7afG889dA9vToR4/GLVR/9eb9tv
         hDOP8BCd2sngsJQMSB+ykn6gNY4feWh9Y/nWJj4Td3LN+3fL//RwfnN/iosnwoBHhJy4
         Ja+Lwsuzo+axCvRQMHxbcvZ2hj9xyPIfLZlNkcIpXQUaxikUDfNcqa+7uRzLurOx5ev3
         zlvjxiqkYL3SsxnR0R1aHaxXET5seD1MGnkgWVy6ma0BG8jjQUGguAqZLU1ECJgWMQEO
         ahQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYOu5ZhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si9521254ybj.298.2021.01.08.10.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:06:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYOu5ZhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxw9T-0001id-N7
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7N-0000Ib-E5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7K-0000oi-HW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so9866344wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5ppBHYzxmgl5hzoC4HlriYit+ub13d9GiK837Ur2BnM=;
 b=cYOu5ZhKgHgxLahkRk1JnxBaaA+Cae58P2KvgDh/HGo/HE0eDBuk8Y+iwi/y4invWN
 1J20T+rA5UpvgHJmaGQJewAgCnICg8ToikH9EDtD6gGbqJWuQ9X5QKZ5FGgXvwGkxbRt
 /avwownMSmBSUOp434ehS08Z97XkIpLGIsNvUQU8Vi53Z1/QezIOJXdPfq7YI102kPic
 Luk3/mV7r5YtRP+LVSivaqOSdLQ8zDK9oLduG4AWgQxo6ckS3qSdYWPbIaNtwkrU3p9l
 BS6/Hd6jJbP+6jbXwXj8WWFzKjP5sTX0t+WjqRKkveVYqSTu/qwOt5hpTiOSOPzG7joa
 2f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ppBHYzxmgl5hzoC4HlriYit+ub13d9GiK837Ur2BnM=;
 b=Msb0wqKihHGl5qAus6g+b5F4t7wVpn1XdrrHMP7HpUHhuWS/FmQV5DSLWyhvzMRL/R
 dhNi6vsKQf0lTcf+8nECW3hMB6c0dTRmyJxzKhdPqg9h4sH4uiwwYrlQxTiK5Fkr0zK9
 w47LMhj0d+65D2OEbzFFCw7K2m4VyFaeLpNx3apCXqzXHrjM39w7q0svSrXjJzlLdRYZ
 r39IPNb/UpKjJ17vmxxFFziG41qkMuTcC3+wZ+remNIyaLBnuSIq9XGBFWi7TFDQv813
 vR+1dovdfioHfM7YRZUq6klMgBraT8nhNqo5z5cl+vW3QlQA/88D1E9KQ0Eh6S+b5GZr
 cGLA==
X-Gm-Message-State: AOAM530j0Nfqjyil60CGqZ7xGbP8e97KVuAqPVji3nY6fD2T85CEPsCN
 avnJRLzdMsq7h6GZ0cIdndTk+23AJoVesA==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr4713721wru.219.1610129045021; 
 Fri, 08 Jan 2021 10:04:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s1sm13423029wrv.97.2021.01.08.10.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:04:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/net/lan9118: Fix RX Status FIFO PEEK value
Date: Fri,  8 Jan 2021 18:04:00 +0000
Message-Id: <20210108180401.2263-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108180401.2263-1-peter.maydell@linaro.org>
References: <20210108180401.2263-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tIi2xKTRilk/

A copy-and-paste error meant that the return value for register offset 0x44
(the RX Status FIFO PEEK register) returned a byte from a bogus offset in
the rx status FIFO. Fix the typo.

Cc: qemu-stable@nongnu.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1904954
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/lan9118.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index ab57c02c8e1..13d469fe24f 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1206,7 +1206,7 @@ static uint64_t lan9118_readl(void *opaque, hwaddr offset,
     case 0x40:
         return rx_status_fifo_pop(s);
     case 0x44:
-        return s->rx_status_fifo[s->tx_status_fifo_head];
+        return s->rx_status_fifo[s->rx_status_fifo_head];
     case 0x48:
         return tx_status_fifo_pop(s);
     case 0x4c:
-- 
2.20.1

