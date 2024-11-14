Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp551083njc;
        Thu, 14 Nov 2024 13:03:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVAqT3iuJ+4ia/2mjbIvTcFIupZpuvf5dItjwYh9AVA788cmJPiCNaLmcxPijf5uVzvmLch0tMrddbdA==@linaro.org
X-Google-Smtp-Source: AGHT+IHNvXUvnERRxnFt9BarqSQg9qkmkG0qQnIcFIV5F1qqRd8Q26eYG4zEup4ILB7NJtwVhRDS
X-Received: by 2002:a05:622a:5405:b0:461:43d4:fcb3 with SMTP id d75a77b69052e-46363545e62mr9547651cf.13.1731618195691;
        Thu, 14 Nov 2024 13:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618195; cv=none;
        d=google.com; s=arc-20240605;
        b=Qfzvxv6mg47Sc+adI7RTIN3lzF0A376B/QwqZRHSlIyZLYHhs1ZQ3a0JJy6clKXcLc
         R0kl81SZfWwnqyrgaQEyb0tKRLzlAmW9y2kT23JhPIw8YsmjIwi0tAog4seM8SJkA9y/
         cPeOHKIVqgNr5faijnsIqt0nP/oR5aybW2efNnfIxKYv7Jfh+pJxiiGXv0697YhXjfwH
         OHa4IYkV123MJ000wREH5/9nTd7o0uU108R0VWa3riNtVE7+H+u0eSibAsO+IhaKdFJU
         6pjxv+DcF5dfUqC6esTzgjUeSPPF2ZBt/BSCc7yJUSO6rnRF4Y8uRYMiTYTXAbi7/YP5
         tFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w7oaVYUllzOyksXJ6qk0wfeCGOBTZK5l45Wvi+e1fAY=;
        fh=IRuGWMvTeecxgxjKSI7QmRflMkYktes0sVu/RVhAZQM=;
        b=gJ8Qicf+wUEnmUe6RT17otkvhnXNVg571EcFode+HkrLQTodlXPeEsR9hcbUWZkPpb
         gS4MHI4ocGUfFkEh2OCIU3MVALyiU5zUnRTqdMzCOF2V9YR14Mb7Tby0RAAjvyqNQz0+
         W+qPlXB6WaWVQ4bBRXV0HIG0ABRH6lgvx7+g07Lk+MNwBBwW4AKkoRhT2bQAxfYUacTv
         7d2iHiRUcefui05VfUN0j8jU09pBfRDLOLVH+3NZMoMJRys/sVryvLBMHQ7ch9KyBwvF
         Tr7VCKrlvH/udiOf2QEzh2KI6WVVuQVMTMeh4+Fklsf66Zy0LaeRlzu0S5LmNFFgVbEl
         i5xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SQdtn/DO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635a9c81a6si19092331cf.202.2024.11.14.13.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SQdtn/DO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBgy7-0000pc-RP; Thu, 14 Nov 2024 16:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgxd-0000ZR-Vd
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:01:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgxc-00080P-DM
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:01:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso130685e9.3
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 13:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618061; x=1732222861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7oaVYUllzOyksXJ6qk0wfeCGOBTZK5l45Wvi+e1fAY=;
 b=SQdtn/DOCu4HhcM4Zfw5Au3sWhe9VKBJIDA9iK3KcfzRGq9OQHeDip868oGqKFylXH
 T8aXTJ0/l16tDBlmHX7Wuvw22PH7+E1BePuL2k4SsPfAzuTOaQkxMoY8XRYQU2CT7Kew
 xuKb3S6cjW8pb7X7te3WaJMDhXQ5ERjXmyBEUk6O0BxG/Yo+WqIfIMsGb3sa04b8SeOu
 nuPz+ORei0gVE+S5d4UaZWFVoH0WRZIJIpSAngZzKdbeqDmgtbdlzVepXCinfMESbeLM
 TYEAk/NEISh5DBSHAtTcoZaXe3S41CYMyUwS9VwxJtYOXa6s4jT49lOQ5t2CK1NGzZss
 I0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618061; x=1732222861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7oaVYUllzOyksXJ6qk0wfeCGOBTZK5l45Wvi+e1fAY=;
 b=rBrTHeUWhsE46Fc14SqzOJwqENF+h+1N50Z1Jsc7J9mWEatcb6BO9zm6H8Ar+ibC5j
 0klThYDKPwEvvT6JAZbSi12WOxugt6WvbN+q9b5acZMTrONq+hftX21mp7zo80SzypY1
 BBEq0/KUdIptC9I2h9PJPK472OsIGLRKmb/YzQDRRhHdPRVhxsOlENSQtxbiTKezMMvd
 lUgbGQakYj2YeLzdBlXLwwduKkBJCZO26JhU2bQ+W4A0eCPPc8vekMfub9O1ZKg3uxwU
 +3srKTTk/HeonNA/5JJ5GR4XJDoZ7W5xNm83Ur34OZL7mBRTEWAWPqJSIfjxmsu8UMAF
 uEwQ==
X-Gm-Message-State: AOJu0YzqrfUEIXYEHLZhCU5k0qjMfziPZgfgDxO731uemjzp0WxcBM+E
 5TWze/NE3V8PtnV1cu/NzvcuHnUIV+SUfc90ty9IET7pRdI4iBD82Y3j0LWRu3cEBnQ9nzuVJWz
 l
X-Received: by 2002:a05:600c:3b03:b0:430:52ec:1e41 with SMTP id
 5b1f17b1804b1-432df74de50mr1780655e9.17.1731618061061; 
 Thu, 14 Nov 2024 13:01:01 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac1f94asm32089465e9.39.2024.11.14.13.00.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:00:59 -0800 (PST)
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
Subject: [PATCH RESEND v2 06/19] hw/net/xilinx_ethlite: Map MDIO registers (as
 unimplemented)
Date: Thu, 14 Nov 2024 21:59:57 +0100
Message-ID: <20241114210010.34502-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: NIkn7cV+yE5p

Rather than handling the MDIO registers as RAM, map them
as unimplemented I/O within the device MR.

The memory flat view becomes:

  (qemu) info mtree -f
  FlatView #0
   Root memory region: system
    0000000081000000-00000000810007e3 (prio 0, i/o): xlnx.xps-ethernetlite
    00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
    00000000810007f4-0000000081001fff (prio 0, i/o): xlnx.xps-ethernetlite @00000000000007f4

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 0df962cd22..8de3131408 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -28,15 +28,18 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 #include "exec/tswap.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/misc/unimp.h"
 #include "net/net.h"
 #include "trace.h"
 
 #define R_TX_BUF0     0
 #define BUFSZ_MAX      0x07e4
+#define A_MDIO_BASE    0x07e4
 #define R_TX_LEN0     (0x07f4 / 4)
 #define R_TX_GIE0     (0x07f8 / 4)
 #define R_TX_CTRL0    (0x07fc / 4)
@@ -73,6 +76,7 @@ struct XlnxXpsEthLite
     unsigned int txbuf;
     unsigned int rxbuf;
 
+    UnimplementedDeviceState mdio;
     uint32_t regs[R_MAX];
 };
 
@@ -233,6 +237,14 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
+    object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
+    qdev_prop_set_uint64(DEVICE(&s->mdio), "size", 4 * 4);
+    sysbus_realize(SYS_BUS_DEVICE(&s->mdio), &error_fatal);
+    memory_region_add_subregion(&s->mmio, A_MDIO_BASE,
+                           sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
+
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id,
-- 
2.45.2

