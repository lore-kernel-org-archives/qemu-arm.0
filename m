Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp550790njc;
        Thu, 14 Nov 2024 13:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEfVay8X6GbdKbbL9iJ1dDcJ+ggTFnM1AcymsMtvmo4Ofgk4pmGYMagnIbW4YNLb4y+PfLF0+a8XBhmA==@linaro.org
X-Google-Smtp-Source: AGHT+IFzK1M0StBrcJUFwkyx7V9b43TdeNclN2Kg+o+i0Sgckght217d3kU6cBcVutzcJXBfOsWM
X-Received: by 2002:a05:6000:a11:b0:37c:d53a:6132 with SMTP id ffacd0b85a97d-38225a8589cmr190348f8f.31.1731618172534;
        Thu, 14 Nov 2024 13:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618172; cv=none;
        d=google.com; s=arc-20240605;
        b=Oi/kRhLaf+lhwwBj+SKA6GWcU62jAWh0zZtgY4bGf2TMpl0PIDSH5UTuol8egLhtMK
         rZXaY1HZOpg73mJ6mFiTCiCGjtLhEXz8N6mUY27Wxc4/hYB2H+kHSA21TfWTNdPggUjI
         XGlEureZU6rGaSPMgxYgk1TEQKI+Z6TCfDWgpVXbgmURdvUXTUjAAh4/aJEQY1A0qaN7
         JFHo8djpENlATZHjz1iD4fougq3EcmDBLOgN+U7KhhqCAk/9Xg4SGZNeixjWCeuZueDr
         Ide0AKB6jjgtmJBYJL3RgC4NEzoZzbmgB2ZuG56YZP6tnnJ4TWvau04T2Rk0jvO8KO4V
         ZMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0lO9X8AE/ryeO7HxuWic/CLRGMSwtdVOkVYKrQN4QhM=;
        fh=VQq6cT7k13THr9dx5tQxidwYd8fgp/vGsO40/ASi1MY=;
        b=Jm2o7mO/rnF1WEWFIjDZ05b7a4PTmt3uC9tUH0vEhiOrS+C6xHVfjAkwNesSnFHHmY
         OjICU7r3fuVH2AWmkkN74U1TISWIb4RlIju+9KJBeDwsN05KpZ75PYdYZg2t0mZQRHN+
         pEUePXZe5edYKHW82hwizojyNbbTFFry6Kb4NrCvQuSpPNzhDA3+VqGrAgEYYi5W097e
         JMMMebE0FJ6aC7NyAcrYNw2Shyg8A+YsIRD3toqYYi6fw9lFgcleeN7g0Atx/ftdzrDl
         zUxmE07gvmiGqZZ7XIyMpUfLcLCPtYfDoy/ctjRhCa7YuiWEd00FuktmAytrFyIYIxN1
         mHYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uzW0K7gJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3821ae32b06si1269487f8f.637.2024.11.14.13.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uzW0K7gJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgyT-0001mp-6s; Thu, 14 Nov 2024 16:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgy6-0000zl-SU
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgy5-000849-C6
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso9152445e9.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618092; x=1732222892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lO9X8AE/ryeO7HxuWic/CLRGMSwtdVOkVYKrQN4QhM=;
 b=uzW0K7gJAgWh3T1E18wJjujQuRgvut0dAt83GUssTjWJ9JmrGPpCKF3b/IAEGJhqnD
 eRx02FtOCbqlMNxneES+ne3xPmdQOkrTy91tnNDB6TY6Rwiq25Hagnj7zTJqroSz8q+S
 DTv2U0FrsPg6jvMFjhWf9povc3izq54z84MUV19PaelUICOpmmlEK8uvm7eWcLCfh1QF
 BiCCnw8VMaz8vers9M+rflg7vVrsyp7cSTP/1URWBNLfSfcIc94GXimyEdZE9ZeoB1kE
 aWHbPQwkyJwu+jDO7nD8SuSqcgQTVGMpn4Qr8TTYlD58GCVi1rm2EviKnmGYaJ3NIDzG
 8UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618092; x=1732222892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lO9X8AE/ryeO7HxuWic/CLRGMSwtdVOkVYKrQN4QhM=;
 b=mvBsxwl1MFl/UklAvwhNOfovnrEMijzfWoj5UMrZsBItPxJSViHXUJ5xd4gOJx4R0A
 YxFyDo0C62TPg9HRA4PyeXUiM/VK484AKX9OjDTISpCNgy3WIr++IY3d6nU575sMIdVs
 EOimkVVOFuLke98pZuV42vVQyi8m+FhLvu5yRZH8TCOEpy/PwzrakKepWhWhcBvNxhYB
 EgmtzY8sJFpZdpdlph/K7ld71ANzBtmwJMzpsolSq/XcFneWPcrCypIYj9Z01qfZIBKp
 tyYHNgo89HDzCRoHY9Qoj4y6OWOzBru7eG8rfo2bO+Cft47tlU5xEkYwoBSGKldH0CD9
 XGdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYDPy9G2V+LYX3gExrvo/xxVTovnp+H3Ep9Nq2EYpjyywHm7+kSQ1VoU2QOicjoYwTcEXNSuBgFw==@nongnu.org
X-Gm-Message-State: AOJu0YxPk8JOX4Z26fxX4fQ/WcQc7WQc6dOUT3hlU1jYgfbbIhjLEoFm
 r7iJn9mAh395vEIE2ITBXLqm1eBsYbT7OiZcAc3cDH6GPzakBXV7axph/NU4+bY=
X-Received: by 2002:a05:600c:4589:b0:431:52cc:877e with SMTP id
 5b1f17b1804b1-432df77a843mr1346225e9.20.1731618091829; 
 Thu, 14 Nov 2024 13:01:31 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da244cb6sm36527525e9.0.2024.11.14.13.01.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:01:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH RESEND v2 10/19] hw/net/xilinx_ethlite: Access TX_GIE register
 for each port
Date: Thu, 14 Nov 2024 22:00:01 +0100
Message-ID: <20241114210010.34502-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: c10nda0oytMC

Rather than accessing the registers within the mixed RAM/MMIO
region as indexed register, declare a per-port TX_GIE. This
will help to map the RAM as RAM (keeping MMIO as MMIO) in few
commits.

Previous s->regs[R_TX_GIE0] and s->regs[R_TX_GIE1] are now
unused. Not a concern, this array will soon disappear.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index a993cb8bb9..36ac8097af 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -63,6 +63,8 @@
 typedef struct XlnxXpsEthLitePort
 {
     struct {
+        uint32_t tx_gie;
+
         uint32_t rx_ctrl;
     } reg;
 } XlnxXpsEthLitePort;
@@ -91,7 +93,7 @@ struct XlnxXpsEthLite
 static inline void eth_pulse_irq(XlnxXpsEthLite *s)
 {
     /* Only the first gie reg is active.  */
-    if (s->regs[R_TX_GIE0] & GIE_GIE) {
+    if (s->port[0].reg.tx_gie & GIE_GIE) {
         qemu_irq_pulse(s->irq);
     }
 }
@@ -127,6 +129,9 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
     switch (addr)
     {
         case R_TX_GIE0:
+            r = s->port[port_index].reg.tx_gie;
+            break;
+
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_CTRL1:
@@ -191,10 +196,13 @@ eth_write(void *opaque, hwaddr addr,
 
         case R_TX_LEN0:
         case R_TX_LEN1:
-        case R_TX_GIE0:
             s->regs[addr] = value;
             break;
 
+        case R_TX_GIE0:
+            s->port[port_index].reg.tx_gie = value;
+            break;
+
         default:
             s->regs[addr] = tswap32(value);
             break;
-- 
2.45.2

