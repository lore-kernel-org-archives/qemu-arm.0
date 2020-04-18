Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1488585lfm;
        Sat, 18 Apr 2020 01:52:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIz3dsiMBEhIPGk6PLdg8a3h4b+ZgsxLdjO5JzMncdbfolub8Vh1NJr9nK8K9gD5ALbBnas
X-Received: by 2002:a0c:a8e9:: with SMTP id h41mr6578028qvc.235.1587199954173;
        Sat, 18 Apr 2020 01:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587199954; cv=none;
        d=google.com; s=arc-20160816;
        b=WfvnHwF2fyK8XS6SrVkypUpbCHXnbLFY+DlOSPA5dl0uEbSFj0h2INlY7GmmfEN1ry
         HEfhi5jlqzDUOpnKVHpKxvAsii0hMqcQ3GjcnoTzFREDwuj7P2asiZxWojovb9cb0TNv
         lqi4cNPa6pGItETFYkAeZ9cYY1jCLIgr4PbDAlD6ydaF33Qb4CRQ61Ildhe4s/5Wfk8R
         ufKqsjTEpH/1ME1scU0Es8lVHOSOhU/jRknKad+Dp4P4kKGnLVJFl+s8WAHyQ66b9Uof
         USFUoC4TCqS9EalFe+b4Z9hEmJFI98NMEiFCYYblRaNPX8LXCkQp22bYVBK9JtpC4RCb
         Sgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=DVmUkRypS4yJb7fuz5VWblU8qv2S4JA+/u3qEKCQZHM=;
        b=M3lexA2NXG5Q3EINrA04y5p0j9T8P90+R64wWRxuzIuhKxlpcnA6ka76LZsEPp63gF
         Xvm14bfGv5TjvHX7e+/6yuCVM8H2GwMlP+FjRJl9203V2qxuJxiHgTPNctrYHGeagGSZ
         l6Bewo5IxeR4W9MdrUKDEUPjFsk9Y6Z4WzCfWg8rDRJsl/1B1FuCE8QEBb9ktd95s1AF
         abSEzd8wYDlCXdsuGV9SNyx2u2TAbtWCdjAt09/tWc1285iijV7AZPy61OppdxnLLE77
         Yq1Qpoq7aXu9LRzhPOm9HvZcTqX4Sy/JAwcLSNfSdWBGgLROyQefymCn1YheEbZhmCO1
         wOvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WpbE5lcp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si14335459qtg.314.2020.04.18.01.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Apr 2020 01:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WpbE5lcp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPjDF-0007S2-JF
	for alex.bennee@linaro.org; Sat, 18 Apr 2020 04:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rfried.dev@gmail.com>) id 1jPjD1-0007Re-A8
 for qemu-arm@nongnu.org; Sat, 18 Apr 2020 04:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1jPjCz-0002zi-57
 for qemu-arm@nongnu.org; Sat, 18 Apr 2020 04:52:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43774)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1jPjCy-0002ni-VS; Sat, 18 Apr 2020 04:52:17 -0400
Received: by mail-wr1-x444.google.com with SMTP id i10so5639368wrv.10;
 Sat, 18 Apr 2020 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVmUkRypS4yJb7fuz5VWblU8qv2S4JA+/u3qEKCQZHM=;
 b=WpbE5lcp2LmiFfZUub8cHiARORuIc1AmK5OwVi6DQbT+dgfKaVYeivVOSn00TqyHwa
 eXLrdE8FCxU+0bGHTjg7ew7xy1Q3BRTbf3dPBd3BmPw85EoeOU2fnB/UgP8R5vJ/FWuR
 o3kv7GDIx77lpaj9cw9oa5MgrLPJUH4KTmVuF6/g2issZ1o0dt2aL7f3UUVHHnT1AYk5
 wGTCif/9tC7inlWAIXyp4x+nivyRz4g7fnqtF1DF4W81CyzVaNamz/EXsuR0YuFX8HLJ
 L2q5wg5E3ufJz9Ha40McPICSbEI2e6bVP38S1et+LK8QAxQdsp69kBC4MauYbqBnN9mm
 g8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVmUkRypS4yJb7fuz5VWblU8qv2S4JA+/u3qEKCQZHM=;
 b=nEC0AvmHUtlWSzgL4qxE/a/HupkOAQS6gBxjR3pobWuCmPyKXy77nT+JBw2bAW3Axz
 uCz1o4gRhZHwmqVRCqozvlCvtY3AxLrfHEFQ3m6RWgX0TdQcF5shN/omRDRzu9eLz4fR
 HVC2+2jkJIErADSg0YEafzF6wZTJwWf+EZiA1PSGUPLeXjFqRHzDPt/His4AxXVXCEaa
 G89Pqz7ZZnWevC0o9Q1IS3AvzdcdAHtS7gOZC6feG1dLaHzF5qDXYUz6gWx1wFMyaSGa
 5QvI7rf72lZHGEwW/HXVP5ojFQVYAfam+0YTRz2r3cPjIPh5hZzrVPwlY/KuPYKB+wmK
 RWcw==
X-Gm-Message-State: AGi0Pua+5SKNqVIYiIaAxZ4oTguD4dAhF49HwaG6dCO8GW0gIgvZdbH9
 yatT43/zqYkr6rStXIwL8sQ=
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr8368414wrx.239.1587199933676; 
 Sat, 18 Apr 2020 01:52:13 -0700 (PDT)
Received: from localhost.localdomain ([37.142.6.51])
 by smtp.gmail.com with ESMTPSA id q8sm10790461wmg.22.2020.04.18.01.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 01:52:13 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: edgar.iglesias@gmail.com, alistair@alistair23.me, peter.maydell@linaro.org,
 jasowang@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH resend v2] net: cadence_gem: clear RX control descriptor
Date: Sat, 18 Apr 2020 11:51:45 +0300
Message-Id: <20200418085145.489726-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
 Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4xhborndDqFH

The RX ring descriptors control field is used for setting
SOF and EOF (start of frame and end of frame).
The SOF and EOF weren't cleared from the previous descriptors,
causing inconsistencies in ring buffer.
Fix that by clearing the control field of every descriptors we're
processing.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---
v2:
  * change function name to rx_desc_clear_control as proposed by
      Jason Wang
  * Move the function call above the comment, as proposed by
    Philippe Mathieu-Daudé

 hw/net/cadence_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index b7b7985bf2..22a0b1b1f9 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -411,6 +411,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
     desc[1] |= DESC_1_RX_SOF;
 }
 
+static inline void rx_desc_clear_control(uint32_t *desc)
+{
+    desc[1]  = 0;
+}
+
 static inline void rx_desc_set_eof(uint32_t *desc)
 {
     desc[1] |= DESC_1_RX_EOF;
@@ -999,6 +1004,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
+        rx_desc_clear_control(s->rx_desc[q]);
+
         /* Update the descriptor.  */
         if (first_desc) {
             rx_desc_set_sof(s->rx_desc[q]);
-- 
2.26.0

