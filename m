Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp549556njc;
        Thu, 14 Nov 2024 13:01:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVb04NAPvKJshFeSa/dhIwEYYUr+XGhXEt+ZdOVQB9kNDZtClZjtk0ivkh7VJl98HdKh9YFJerRBp3bWA==@linaro.org
X-Google-Smtp-Source: AGHT+IGSX1ajYjFQOymLRmiqbLak21RURXUD66IDePUTn7+j8DrlSF0rOjYn6gfMqdbhU0lyhSrU
X-Received: by 2002:a05:6102:3e8d:b0:4ad:4f81:792b with SMTP id ada2fe7eead31-4ad62d332f0mr656036137.21.1731618087088;
        Thu, 14 Nov 2024 13:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618087; cv=none;
        d=google.com; s=arc-20240605;
        b=XAM6iCtOEpKhvWQ7xClHzAAzWdoM0BCfEZ62htUMgUDuPYOyrtDPPrbesBtFOGV5WU
         4B6c77UI1m58f1KvrxpLSYez5s8YtXVHwANvyEZt3SkZhEIdriAdTZeLhxSMDPfL/7Sa
         5djeNxeat+dBzqcSM1pt3Xq8h9L28kMgpcBOMcmX1OU493St14c9P5i5UljeTKET82GX
         XpKr4pxQqUWcR8gIpWnRzLaP13OBcgww5FlwZKf1A1vkClkcP8DIaZiY7iPR90ZGbGD+
         HX6zboK+xHoRJGBYO06AVMO50E3lTyoLKaKFf94V1jkdK/Z9GUswNW5E9oK9MsMPRyS8
         dKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YlgtA2w+nkGpq6odlZPv7GuJkitbYlthMfvxp2Wzgbg=;
        fh=PEH/sJSgviEMFVsNbUMAHMPyqRXFYznnGPWdDGMGtt8=;
        b=RcVy0Dqwk+abu1WQmVuHSDiwwSTNxzBdTkoG5j1xO4uHOu2o9PXt26FhohaoTQZI/L
         lXt+WkbCSnrcIuEg3zqg8g3xjl/VJBFC4EE+tHJOMwh59NqFlsolnQHDloM6qhBhOJyZ
         3mjqFCRTz3f6sYKKdJclpR/Xap9Zk5I4TfQ4n0Pt7+6HFge821qs4guEzLZe/mh7nGLy
         W2qqyT9bFmDndi/4OqgDJZpkoBjXfW9B9IcnX8BFfB6J4uDSpLTyPMbICqSoLwkFNg3N
         MwXeJKLVl5q0tOa+i7LxnZtDVrb67oKOoh6xvwQaO9TgjMh/HOfpDTCeH75fwGYsv/vL
         Og/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zvaJYErv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ad6492ec06si3849137.680.2024.11.14.13.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zvaJYErv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgx9-0008GX-6m; Thu, 14 Nov 2024 16:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgx7-0008G4-Tg
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:00:33 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgx6-0007vY-9V
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:00:33 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so12142285e9.1
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618031; x=1732222831; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YlgtA2w+nkGpq6odlZPv7GuJkitbYlthMfvxp2Wzgbg=;
 b=zvaJYErv6yAaQHqckRPX1UP5Y7IdpEwqrsrbq9Ey+Obw9tvf5QuP6V1o0wki/qJCOZ
 rECy69YCd83DvWK1eq7Aq4Ebmi8dfD6zFi//piSW5QRY8+9DUNEwy8IXD8YGjbc+EYc1
 8JmDe7nXzNedO0WAEvaW6YC7skJ8BqmN7ovwdGuxPuY+mWPuiseDVs35BehWivGMX/MK
 0hbiwRchaqZU8rh/pXqG9oFOWVIm64zocaaoz0r5l8EfNMh2SqSir5+WmHvcaktxO4Fx
 oCHGOP3fPQA61yMJ3urKnnNA1EXBnTFWDJAkYa01TG3hXcFqZ8q/4brCWzOYdYjpO9/6
 37DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618031; x=1732222831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YlgtA2w+nkGpq6odlZPv7GuJkitbYlthMfvxp2Wzgbg=;
 b=lzgxT25KD3tnwv5ZPdbv4IfTX3RmT4aNac/Wc1YnA9anWyRdpppwHhLQbHq6aqhPaA
 RLlpodP81ENpldcs4w34H7Tvhctys9HYYLzQc5TVpvFflgwNUbX1JzPsP461uV0ldwoI
 anm+xY/zQqk+DrzoqXKxqNe8hR1h+SKdz+H6WWNjjtzbaLZ+eQNmX85efCP6DDmk8ed+
 9Jj14XaIdd8MPP5oML/0+gOFmZx5zDxxPkCWaNxXDY7CluGeoDLw3kDA6MMR3DeJVgGV
 e8p7GedILyMvvq7DCvsT7uZoLldzhbRjbNhNR+y9jvNTu0+5teResYWbkG2zoI3dF1/o
 0TvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF1twdkV7xYmJUJh1WtHmCG+AQX2alkfkq08iPJHXy2ojZtMTr0UpnFkVvf7/facqqtAE8dzoesA==@nongnu.org
X-Gm-Message-State: AOJu0YwFAQLaCIkT2ak67Dc5TWTe3MsfxipcUCmuXRlBk1A/pa2FynJy
 anRuGH4cOldtYGgAVJwnOr7z2N+iHP+F6LxmY0YxZzJ2Dtl8X6CuPH+vkhdMiAU=
X-Received: by 2002:a5d:5e02:0:b0:381:f603:ff62 with SMTP id
 ffacd0b85a97d-38225a454ddmr179821f8f.20.1731618030678; 
 Thu, 14 Nov 2024 13:00:30 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae16827sm2464974f8f.76.2024.11.14.13.00.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:00:30 -0800 (PST)
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
Subject: [PATCH RESEND v2 02/19] hw/net/xilinx_ethlite: Convert some debug
 logs to trace events
Date: Thu, 14 Nov 2024 21:59:53 +0100
Message-ID: <20241114210010.34502-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: vbB9LJEUL77N

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 5 +++--
 hw/net/trace-events     | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index e84b4cdd35..bb330a233f 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "net/net.h"
+#include "trace.h"
 
 #define D(x)
 #define R_TX_BUF0     0
@@ -198,13 +199,13 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return size;
 
     if (s->regs[rxbase + R_RX_CTRL0] & CTRL_S) {
-        D(qemu_log("ethlite lost packet %x\n", s->regs[R_RX_CTRL0]));
+        trace_ethlite_pkt_lost(s->regs[R_RX_CTRL0]);
         return -1;
     }
 
     D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
     if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
-        D(qemu_log("ethlite packet is too big, size=%x\n", size));
+        trace_ethlite_pkt_size_too_big(size);
         return -1;
     }
     memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
diff --git a/hw/net/trace-events b/hw/net/trace-events
index d0f1d8c0fb..2b36cd967e 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -511,3 +511,7 @@ xen_netdev_connect(int dev, unsigned int tx, unsigned int rx, int port) "vif%u t
 xen_netdev_frontend_changed(const char *dev, int state) "vif%s state %d"
 xen_netdev_tx(int dev, int ref, int off, int len, unsigned int flags, const char *c, const char *d, const char *m, const char *e) "vif%u ref %u off %u len %u flags 0x%x%s%s%s%s"
 xen_netdev_rx(int dev, int idx, int status, int flags) "vif%u idx %d status %d flags 0x%x"
+
+# xilinx_ethlite.c
+ethlite_pkt_lost(uint32_t rx_ctrl) "rx_ctrl:0x%" PRIx32
+ethlite_pkt_size_too_big(uint64_t size) "size:0x%" PRIx64
-- 
2.45.2

