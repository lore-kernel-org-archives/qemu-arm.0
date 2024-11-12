Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7537818njc;
        Tue, 12 Nov 2024 10:17:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXKznSXK51qPsRbb5JNKcvWsdaYNIvXv3WsvgeG7yIHXecZqe2aZvvH0BUwwJkwPbAUw48TsW/IDwddbg==@linaro.org
X-Google-Smtp-Source: AGHT+IF5C8eRkoz61D5MXbiqzOnWJOMrEMCoCx6w4QKzSw4EWdPw02ujws2psglY+t0S7PCoWX+c
X-Received: by 2002:a05:622a:48c:b0:463:16ee:bd6 with SMTP id d75a77b69052e-4634b4fc7e3mr1309841cf.25.1731435435131;
        Tue, 12 Nov 2024 10:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435435; cv=none;
        d=google.com; s=arc-20240605;
        b=d+yrXlkakypsf3o2+w6c86dIy8Zh1Q5BmLYnf2Jvs0sR55Rq4j9f18MPQ/cG5NlTdU
         rnBtmaHNlI+WGizBDQurIc1Tc23WIuKIufg+ijnHsqFLkpFIDIeJGX5FSN5s7rrCVWJL
         +52Sncyt385TeVnQfvnUSUWCPXNI8od8ouYZF0VOSF5m2fNZEQ5dMVONOh6/94ajNSZY
         wuplv0CJKHsBgJRbtcWBgDONMOnyisPhTM8PZ6gNY4V2iJd9L5/sSBFS/aoGFmCksVN1
         0/WaPLMgyxnrmTJfQhoWp3eD6JPxbIGTd6bM+/hNq6YyHy7HZSO0Ud4STfhqzKDFP8C6
         uC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u/na/cFd3aGI4M5zTw4TKo5y0iNxB1Ymp8TI8i+fEV4=;
        fh=cyzEUqEXDe9FvuGW4PvvcLI82gtWVC2xBKHWgycGu6M=;
        b=XBtetLv7oXn/odGyrgvdmE84JmXdMRmBxALY9T4heBgHOnQ4vMiFZbx4ss6L3nGmEJ
         xCGLj5nMVYDnu4FAZiPLxGpNJAAgOA5pf5CGFjNLp6yrNtzqoNpN0HieoLlE0Ch/jiDH
         i6WoARwiEHWhx4Y8Q3vsSGi2BaX9fRQ+4fADsI9bkf2hoOXH80VzmxE2Dz4R7mPr8HDG
         62g9CwQAqE1QcnAvanelM6D2R+leO0K48pHhYwU7jSUdy773r3w6DmjLSGq4sAt7ifCh
         Nbx0oLqFFzMifyH7ZUuRqLYc8fPiQBWDtyQPFQkAL+CC/ytBsZrsn0CUuiQXt0GRHMi4
         dqFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mVAq81di;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40e71csi134199801cf.98.2024.11.12.10.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:17:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mVAq81di;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvNi-0007ym-LD; Tue, 12 Nov 2024 13:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNS-0006z9-9p
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:35 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNQ-00022s-Pk
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so4115663f8f.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435151; x=1732039951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/na/cFd3aGI4M5zTw4TKo5y0iNxB1Ymp8TI8i+fEV4=;
 b=mVAq81diIYIPsWNGD4GYQZVsLHBv29LZSXAZJYOz3Fs723pcHU1Mzw8pSGIZ2Bgp2v
 Zr4Q+LE9GkRNgVapqz3Q0hikuPEz7wxoltYnj9HiMOKB10NeIrZfAmzw+pqEAYXCmO7L
 OiB0qrKD3gCbsC3kuuRHLguIhRFoByio8pYbHmdHmIojHtOx0iD7fcf4U6TD8G38eLT1
 nLgj3rbOLiKXK6k1ESM1lY1wqj9hdLyyOBEaet8Tr/y5SqbVwwolCvawMkH4JNPvgnga
 uMYOSIMJqkiSINXZIWjuzds3tLUIFtKCfsxh6qS1SVeOIAZQuzA168px3Zg9nIgvL8AZ
 nrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435151; x=1732039951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/na/cFd3aGI4M5zTw4TKo5y0iNxB1Ymp8TI8i+fEV4=;
 b=evwMPtpdRoI0eogectu2iG2l1v+B0VMj3uwnYTQ9duL4PBk8BbbOSrO/QNa/4ivLLb
 GnclfBpKvXseeDpLquWiRyiJMY3XEMvk2nusKznsz2Gu7U8lwT7h77QtQdRB6JjqLlfB
 4m34ogHb9RDTNDTsoyEac83ko4MoMe0N/zF0aNENacHXJwnmJng3xJUKZ/sucz2hhQKF
 R6luxolP/2fVIXW3QQdZOvQPyTInh0FImDUNNrq4hs+58OaP4F7mKjFxfxph3PbDb4we
 4nTICXxeTPs3DU/KQ4JUewz6KE0g88fna4/5HzLMneXrcnM1Iz5Os+rUPMV/Vy8QdWmj
 YBMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1mQ2HbEDQw6Tb8SMYnaWw0L9eFdEnm1S5y/NEt2yZY315Q9/Vz7L1cQreF2qGLrDE1CoqvqbHcA==@nongnu.org
X-Gm-Message-State: AOJu0YyVYXBjpaPu+bS8n6Iu12AfReEjf4yc9htECgu8oXCJegkMD9FB
 aK3TFtuEFc2HmQwdhJZ+KI4kbJJvxqGf++QrUQ2QwiNjhTr2KC63ORGFvSKSZQg=
X-Received: by 2002:a05:6000:2d11:b0:381:f443:21e9 with SMTP id
 ffacd0b85a97d-381f4432614mr9957024f8f.0.1731435151389; 
 Tue, 12 Nov 2024 10:12:31 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea3cbsm16209684f8f.74.2024.11.12.10.12.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:12:30 -0800 (PST)
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
Subject: [PATCH 17/20] hw/net/xilinx_ethlite: Map TX_GIE as MMIO
Date: Tue, 12 Nov 2024 19:10:41 +0100
Message-ID: <20241112181044.92193-18-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: acz8MiOim/bN

Add TX_GIE to the TX registers MMIO region.

Before TX_GIE1 was accessed as RAM, with no effect.
Now it is accessed as MMIO, also without any effect.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 159b2b0c64..f7a5b1620a 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -39,7 +39,6 @@
 
 #define R_TX_BUF0     0
 #define A_TX_BASE0    0x07f4
-#define R_TX_GIE0     (0x07f8 / 4)
 #define R_TX_CTRL0    (0x07fc / 4)
 #define R_TX_BUF1     (0x0800 / 4)
 #define A_TX_BASE1    0x0ff4
@@ -55,6 +54,7 @@
 
 enum {
     TX_LEN =  0,
+    TX_GIE =  1,
     TX_MAX
 };
 
@@ -140,6 +140,9 @@ static uint64_t port_tx_read(void *opaque, hwaddr addr, unsigned int size)
         case TX_LEN:
             r = s->port[port_index].reg.tx_len;
             break;
+        case TX_GIE:
+            r = s->port[port_index].reg.tx_gie;
+            break;
         default:
             g_assert_not_reached();
     }
@@ -156,6 +159,9 @@ static void port_tx_write(void *opaque, hwaddr addr, uint64_t value,
         case TX_LEN:
             s->port[port_index].reg.tx_len = value;
             break;
+        case TX_GIE:
+            s->port[port_index].reg.tx_gie = value;
+            break;
         default:
             g_assert_not_reached();
     }
@@ -233,10 +239,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
 
     switch (addr)
     {
-        case R_TX_GIE0:
-            r = s->port[port_index].reg.tx_gie;
-            break;
-
         case R_TX_CTRL1:
         case R_TX_CTRL0:
             r = s->port[port_index].reg.tx_ctrl;
@@ -281,11 +283,6 @@ eth_write(void *opaque, hwaddr addr,
             s->port[port_index].reg.tx_ctrl = value & ~(CTRL_P | CTRL_S);
             break;
 
-        /* Keep these native.  */
-        case R_TX_GIE0:
-            s->port[port_index].reg.tx_gie = value;
-            break;
-
         default:
             s->regs[addr] = tswap32(value);
             break;
-- 
2.45.2

