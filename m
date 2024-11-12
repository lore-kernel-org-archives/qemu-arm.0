Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7538053njc;
        Tue, 12 Nov 2024 10:17:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv34mWmywYxJvsu/Rj4ckYE+k8D/GC3NpF5b3OypBVrnHLkqp8v50RVAmDc8dQuZ/Hpw311DjWDcXMWw==@linaro.org
X-Google-Smtp-Source: AGHT+IEYW5TU2GMk7PPaTrACtB3n50YYgNSDLW/k/svx8N6vmcZ8irxcX81NxfIWjF/wT6s65zbD
X-Received: by 2002:a05:6214:4a8c:b0:6ce:ee:dbb5 with SMTP id 6a1803df08f44-6d39e10947bmr255489696d6.5.1731435457741;
        Tue, 12 Nov 2024 10:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435457; cv=none;
        d=google.com; s=arc-20240605;
        b=XEA/6ErN7PKgYzHupXLZMA+4u8++AzRUD39dPLjSeVWfs5/qSLagM34zMuYtbQHmSs
         3nPSCJtdPUX+hZawQ46lXP0t9uFzsrsGygVCyhUeVBGsoNoqikw1h+Zw8GibwPCdj9/9
         BTCVYGr+/e6TUrbUWgXzuvBwpQsD0wiHGY/lPeF1HhoaBUJtgKyusLUxZYgyxRD6uvZ8
         7Cj4Y6bHzrBlr8Q/Lz6wT0zdn7XSRyH3TD9DzeeGHgJltaf1Wlx5zzz+9WoTHbbp6Tq9
         dAvYJe7joAm2v8T3QGXwICwLZ4DGkatisAsIvq2fW2FqkYv9PYjN4/jpz7A+bafRw7w+
         f90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S0A+XO8SEDEpUXfiyI42zPsZnM8n4BbkRd6mjrTW2c4=;
        fh=o852A3XjBUTHOvdSNmZiHFp+fT0hMGoEiJLR+wY2M6E=;
        b=Rwg0J4C4JAgb2Lo1fdILuwdFHQqkf45xAW023LRs+Gcbq6p04CcRJjSR6GMZpgRtpy
         4EJjhWoCI+odI/QxuTbUXk1IoALHGPYVkAX6CCiO7FKYNHIg0PzEGmnxAgso7fUdXdAe
         sDhAritTkSu5ea6jDQOfx3qk8rAIXlib8TI0thcZhuLFuRQ5x4T1XLOetNknwqGOjQBy
         HdjLA8dxk8Cj0kOw5FG6vRZWQSTLMxTOt5jMv1Ij6ocqPe06GbOrjebw0JN+btZvFPMH
         yKWXEzh8Ul9FvQBnINgkcV7/G4vAz6SUJ9z7VkJqogm6uw2DGxgz8omeh5KjJTXI5XJ8
         U+2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqNcY8GR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b0f44si143205336d6.469.2024.11.12.10.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqNcY8GR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvMZ-0005A7-UL; Tue, 12 Nov 2024 13:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMV-00054j-Hh
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:36 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMT-0001vq-ON
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:35 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so5844883e87.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435092; x=1732039892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0A+XO8SEDEpUXfiyI42zPsZnM8n4BbkRd6mjrTW2c4=;
 b=xqNcY8GRY/9EYPcLNhmwzaEMNRPkvyvvAMy8c37per7ygQ5pI4MURCKpYq9qJh82y/
 YJ7KI+jKybXshCZEYtem4m72u1RTakX0+QAMsGsLxfAkl1MeKtLcoktghFUA2Ufmp5WD
 fo+/l7dFxU8D5Vv9FUSTO2vM9jkT9TlJbHYSwC1+/LrtviSE5Npgq2KjNvm4do0QvRXO
 UzSqIlAKX6qsKRKpqznkpVyHVtmaiL5hCDyL9EUxAgdwy/hvUk1wKMVP8jBOha5mj74+
 bt2GmDJwIBloKfj+Yel69xlBnZvZvf28G+xmsbg7g1hfxoAGPwo2v33AjKNDczrzljZN
 8P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435092; x=1732039892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0A+XO8SEDEpUXfiyI42zPsZnM8n4BbkRd6mjrTW2c4=;
 b=Cs8OS3yPKtfEW8x0jY8TqOkMNL2W9lTD7jlvg5DIkcCgCcc26BGWtMwuLj88mLukfs
 QEfS0GkfrK+wU1whXjn6gTdUgX7K5bhPWWkJJSJrG5LU6MChtPRO3+UX+kjCP7tNZddR
 uDqjHjPk4gl3suAFWEN4gqol3Qe7yCU7iM35iuCSWFdzA6/qwgRb1zEuNtISHgOTgdrL
 nXsO7KoTdSKi+a7wZdYMMdAVmrLxaFW5JGbtMfztfuY4X/MNXMz4EASv8drZNfhGjg3s
 A+KpX8nnSqEqmBWMGgBmtuvoOIUMUbNyH2otPv/b0zgRKqVELlBoHOOKftRONHJpwtwl
 TkVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUufwxVFaP/99mlZihXemedVbCPBuBEoIheRwBTMsbxUzKah3bAy/BDluv29D3OfFvnlIRbDs+kGw==@nongnu.org
X-Gm-Message-State: AOJu0Yyfhdo29VftL5Jww0PCV+jRMdatQOBx19GeF2wbet2MEIEdw/D7
 uRQSaaysoSRXQUh0V4ZRxFTS/1hJZu9OEcpLYVEE1Mo02mMDtYuJptMtopHap8o=
X-Received: by 2002:a05:6512:4024:b0:533:3fc8:43ee with SMTP id
 2adb3069b0e04-53d862c6b7bmr9259602e87.13.1731435091801; 
 Tue, 12 Nov 2024 10:11:31 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa7397e4sm252183635e9.40.2024.11.12.10.11.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/20] hw/net/xilinx_ethlite: Rename rxbuf -> port_index
Date: Tue, 12 Nov 2024 19:10:31 +0100
Message-ID: <20241112181044.92193-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: XpWpnNlgTusb

'rxbuf' is the index of the port used. Rename it as 'port_index'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 76b1e7d826..20919b4f54 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -72,8 +72,7 @@ struct XlnxXpsEthLite
 
     uint32_t c_tx_pingpong;
     uint32_t c_rx_pingpong;
-    unsigned int txbuf;
-    unsigned int rxbuf;
+    unsigned int port_index;
 
     UnimplementedDeviceState mdio;
     uint32_t regs[R_MAX];
@@ -183,7 +182,7 @@ static const MemoryRegionOps eth_ops = {
 static bool eth_can_rx(NetClientState *nc)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
-    unsigned int rxbase = s->rxbuf * (0x800 / 4);
+    unsigned int rxbase = s->port_index * (0x800 / 4);
 
     return !(s->regs[rxbase + R_RX_CTRL0] & CTRL_S);
 }
@@ -191,7 +190,7 @@ static bool eth_can_rx(NetClientState *nc)
 static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
-    unsigned int rxbase = s->rxbuf * (0x800 / 4);
+    unsigned int rxbase = s->port_index * (0x800 / 4);
 
     /* DA filter.  */
     if (!(buf[0] & 0x80) && memcmp(&s->conf.macaddr.a[0], buf, 6))
@@ -214,7 +213,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
     }
 
     /* If c_rx_pingpong was set flip buffers.  */
-    s->rxbuf ^= s->c_rx_pingpong;
+    s->port_index ^= s->c_rx_pingpong;
     return size;
 }
 
@@ -222,7 +221,7 @@ static void xilinx_ethlite_reset(DeviceState *dev)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
-    s->rxbuf = 0;
+    s->port_index = 0;
 }
 
 static NetClientInfo net_xilinx_ethlite_info = {
-- 
2.45.2

