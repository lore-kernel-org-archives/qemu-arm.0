Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7535298njc;
        Tue, 12 Nov 2024 10:13:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVU5uyMEf+C+pt72xGnD9gNGkXsAlQ8NaXq5BSFxvKkuxXqBGaFfBgvica3ncZmX0Plvu47JTWcE8zxcA==@linaro.org
X-Google-Smtp-Source: AGHT+IGTMLfWR1tKe6A5T4MJ59N+F7GtwCXzeVwkLr4zd/Kxzj6ap0ZGdz1Lp7/DS8w7nrjdaKrp
X-Received: by 2002:a05:6359:4195:b0:1c6:3661:e010 with SMTP id e5c5f4694b2df-1c66f23584dmr236690655d.19.1731435212857;
        Tue, 12 Nov 2024 10:13:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435212; cv=none;
        d=google.com; s=arc-20240605;
        b=S3MbjK9n8GiMJwabFI4fhHhkaFNHqgG1YzeBVwYKgXnUIkORyHOPOlY6ExXG5YRWES
         v6APBo3/+39s0dCUotFGZ7cGrG6XHU25y1wa8OE93oq5XtDyAqSVW9+MkScHDy0Hr9ys
         uCmAt46Wpu4cSFb9vi7Ll7Tnc9aUMM+W+FSdy128Vffww2eIHGjdyklQ+6U/cZPbyj16
         Ayo3rSd3Oi7dSW5txv9WG4M+MzE9cfoeR7RBPC+j8ypDkkCJgCiczm6Opn66OoNwrp9+
         Owmmpf6HsNPNZ7WbGNbPpA51a37NTjIaGhWlg/STT6lVMEB3fd+XfMIoeIY6BWvKiYyI
         d6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o5EaUAp0FQKhEfz/Flp6sGp3H9rqfBlFSfz8Y3bBsgY=;
        fh=qmVcbpKGT2NGruxhf8fgQHnlhHRaRjD5ibgD08FHYfA=;
        b=EaBvrqgwiNevqOjkGF0VTkA2z547CcqdGEzKB8fZHJPz4hDqfDYvVmWS+DwWnz6iOH
         SRbWbNT7OCjXl0f1oLN+qJm+yAmITwiPkNKqYxcrahDtUCEz09Q8S+mdXQvsLEyS8/uO
         8UmCKaDV94z1iPELownEreq1g1nV0byV4So1P9DMMp9Q51hrMrQ+33kKlGCPjZoeNWY3
         S898zQwaDtxfuPI497f05wWgPxCiQ75Rt4j0ui/TYNW6Q/jlpMMJtGe0o1FLT+AR1tJp
         RSgyhTo47xgf/WGyCHld4kFOQrDTTr3A2a9z4APszFH/zVqEpUeD09/fOC7s96fgMGNi
         8zdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eTmcJfwc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-856557b40e9si3238533241.174.2024.11.12.10.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:13:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eTmcJfwc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAvNJ-0006RJ-1u; Tue, 12 Nov 2024 13:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvN7-0005jy-TL
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 13:12:15 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvN5-00020D-HF
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 13:12:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso47654405e9.1
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2024 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435127; x=1732039927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5EaUAp0FQKhEfz/Flp6sGp3H9rqfBlFSfz8Y3bBsgY=;
 b=eTmcJfwcJcM6d2xCIH34cFFA3vS3hNbR5L6BqS4hG15v9bbabiv7CIt665KUh8BOTu
 3HHO7lrkkl+Xtzwcu0umi8hIYkvuxSB2FNF0WkkN3bdDXXucXVg/2ED5U4EIgZC8e9Pg
 uokg7ISLVDq+5l2lNEv5vUYDOWyqOsvgMSYo5XWumMeDqjuJlrwyrGIZGxc0F6jnusLS
 wQD7g1gg6A1F2K+QKhezJW0EzoEMH3i4pcHEBes8XP/X5JGAfpgC7PO1w9VqMDF6LL+N
 jDHagR2LLl5kp8bJS2WEnGOnJXHvSpLRlpzFLQR07EpwNRPw+iCY5b5CdZc4omRW/2of
 PXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435127; x=1732039927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5EaUAp0FQKhEfz/Flp6sGp3H9rqfBlFSfz8Y3bBsgY=;
 b=wFdPC+jeM9T/XXhr6WI7z3VYTKxMqkE6Hw6QKpcAdHvLEIMZyn+S+9SztIHlJPf62X
 tyQPCushIB4p5818Akk1ZsB+EAJM5GEDmiKD8ifeqS8jevH8oODnQznKYxeWWF+MV5kS
 9R/3JDcKlG1FZuEG/P10ADoiyi7czpFxG/HzEIRKClghg1cCR70THnWc7PKuDbZRMrpl
 5VF4Gth6hQ72mBlTjcylijNDMg8lbEA7wIiuUAi6qGT/7bzC6+Ltiw07zHRCvfXdGP8B
 qzv1g5q1gO5Y9qd9jgiQU+Sy1byEooKMgxqm7JYZ9Yw3GtTBUFbejgPhA/9hMftX5lJ3
 u9rw==
X-Gm-Message-State: AOJu0YzFo3nAeKnd7haaERtD2vU0nJcvEqAoQJFjNLlESlHKBrANkL10
 9a6j8fFSJTut/oXQTMr66VStAcpwaz6pBE1tPdYufxN9YQo9yiUxzJ9Pyr9RscgaOEr+FpJ9I39
 J
X-Received: by 2002:a05:600c:6987:b0:426:8884:2c58 with SMTP id
 5b1f17b1804b1-432bcafd113mr122514195e9.4.1731435127388; 
 Tue, 12 Nov 2024 10:12:07 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053069fsm222425585e9.4.2024.11.12.10.12.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:12:06 -0800 (PST)
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
Subject: [PATCH 13/20] hw/net/xilinx_ethlite: Access TX_LEN register for each
 port
Date: Tue, 12 Nov 2024 19:10:37 +0100
Message-ID: <20241112181044.92193-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vYabBxh+eloR

Rather than accessing the registers within the mixed RAM/MMIO
region as indexed register, declare a per-port TX_LEN. This
will help to map the RAM as RAM (keeping MMIO as MMIO) in few
commits.

Previous s->regs[R_TX_LEN0] and s->regs[R_TX_LEN1] are now
unused. Not a concern, this array will soon disappear.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 4cb4781e70..1a3b295b4b 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -62,6 +62,7 @@
 typedef struct XlnxXpsEthLitePort
 {
     struct {
+        uint32_t tx_len;
         uint32_t tx_gie;
 
         uint32_t rx_ctrl;
@@ -133,6 +134,9 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
 
         case R_TX_LEN0:
         case R_TX_LEN1:
+            r = s->port[port_index].reg.tx_len;
+            break;
+
         case R_TX_CTRL1:
         case R_TX_CTRL0:
             r = s->regs[addr];
@@ -169,7 +173,7 @@ eth_write(void *opaque, hwaddr addr,
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
                                  txbuf_ptr(s, port_index),
-                                 s->regs[base + R_TX_LEN0]);
+                                 s->port[port_index].reg.tx_len);
                 if (s->regs[base + R_TX_CTRL0] & CTRL_I)
                     eth_pulse_irq(s);
             } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
@@ -194,7 +198,7 @@ eth_write(void *opaque, hwaddr addr,
 
         case R_TX_LEN0:
         case R_TX_LEN1:
-            s->regs[addr] = value;
+            s->port[port_index].reg.tx_len = value;
             break;
 
         case R_TX_GIE0:
-- 
2.45.2

