Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp491056njc;
        Thu, 14 Nov 2024 11:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8a1AdObbCem4HX8GrCTsX63n+q284rGN5iJ4EksJ9nhdYkSZ896VkqKAUXCHpAsYiAJ1xclv7Ddd6/g==@linaro.org
X-Google-Smtp-Source: AGHT+IHS7xS9HAcuRTLgNEBSnKzRg2ZiKw4zqSgUaG7IQVBaIEthXML9MKo5G/jfIQ/Mngvikm9w
X-Received: by 2002:a05:620a:1a04:b0:7af:cf2e:197b with SMTP id af79cd13be357-7b3622b6c12mr8559185a.21.1731611339864;
        Thu, 14 Nov 2024 11:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611339; cv=none;
        d=google.com; s=arc-20240605;
        b=D5u3HTSx1DV2s+wQvDqCdfR+hZ9X7zcwY6LSxNxIVU/StzGGBEZVzUkOEW0kKKRryv
         xtX6sDT5kE1XdnZ2Z7BkTrdlI6IhD/eIrh3meevGPaGGrnWOCsyHH4AJlpHxZ87SImGb
         cZ40oX4scPbOBEsunaUP7EJ3uQn1csZtEC8Gh/JpK5tk6d8YZ4BVvRH9ljokJfcN/TAR
         zve8vh/fW/EhchColbvhw/nuw+GUltLgpinbtvc5lZvJz2nsTnt3f/+w0sSC3mbBM5mj
         44t+ajdjYeATrIWw/+P3wsMuyCD+5Wu54gdrjPfktKXIMcryKr1HRjiuM2n4/kfy9AP/
         gNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yTK4l6Ykvzc6k9RKpIP/b45MtLRJEjbQSCPD8FRx8u8=;
        fh=CSz1eNhl4qLP1s9UxgCCgROeJzqWXK25IoBKX83csUA=;
        b=ii+woY2ZIb7hGfux8HkRiI5S+iaoxafIhi5t10KK3BjxPkBWtl41/VIZda9OEFa0fL
         DfZkyK4RGq8kr8clnmNbnEO0RHj5+8/8zfxDNXIP3f84JeYOMyGgwddOiAuOOF9JvrBy
         xdhkv2Yl0GR2LQI4Y+HvC9voQctk/MiZowlp9HDgn76IQnay+d71KnnLVHLDqhciVU0Q
         EY3w5b1YxxIkc+nDMCUgihLW2BHrm5dvGkHJ5+b3TL6XiAszk4wkv/1X7Ad6sLSkZJkf
         /RO1SHmfumenr1J3IbEiyvJ35jR+/cAjhD2c1luGlHGChsUe/CIj9KOVuy5CGwM+918m
         QHLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezAM2rTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cab2d4dsi171116185a.497.2024.11.14.11.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 11:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezAM2rTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBfCC-0004Uk-GD; Thu, 14 Nov 2024 14:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfCB-0004TK-Uz
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:07:59 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfCA-0005YT-FR
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:07:59 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d462c91a9so698548f8f.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731611276; x=1732216076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTK4l6Ykvzc6k9RKpIP/b45MtLRJEjbQSCPD8FRx8u8=;
 b=ezAM2rTg5pEXstch3YjJO60KdLwSiX4IKSBYMZnZjmiXKIjqJte8+tC/30BlRQpyOs
 dpCGzb3cchV7s/pVFc9Ex+5aH7G+BXLCL5n5YJL45tiSSwHT/gtE6IZ/mEPwMjzvHH2Z
 p/ovp3KAS4Mo+5cP8MRTZjn2VB8w78iLSXBljXe8ZxXtnvUboAutVDRC6c36AqnW2Uyv
 K5zcubeJz1GqDwvGyo3KCDmbu9LngOegJyf/2BqugZZXBi0Mx9B9lYLvEtG2m5N6WgZQ
 WZhGjvVjPlrnji3K8/EgfDnzF9CQSqFChxBU9w5ONKeJ6f3aAqQEYTTPDqusafEH3GCL
 sr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731611276; x=1732216076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTK4l6Ykvzc6k9RKpIP/b45MtLRJEjbQSCPD8FRx8u8=;
 b=nrldxwmQoWPnPk38/UTckB7LQGatvDcYteqMdadeVjBM3PGsnNLZY0aNuRCWKb1oz8
 y5OCJQBWHGkAokLULVyScs5QLi2bJafHhBYL1XPRfuwsu2LeLKr8kTyCJ4yf9JNqyTUF
 PQMK0wZ6Eo8FmqpYkqqs+QkUtDZ2aJ7oGm0mv2KzrQPzflv1mnxNR/YSnSIJjYvdicII
 1WOGN3w+q5g0Y3jomjq9tFgfG5QNrCEB8hkyOCRXGsjlbklPnj2u9a6bx82miC+u7cBB
 IFg7CLbMZK8uyQ19gu/IK48fZUdVHYBbGv3x2eABJ3WHElVJt9BtZU50L7yVxXa57ljU
 mzhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwIwOTk7NWAJj8GL6Ck5ceRwrcG/6UlNKimApjKpeXgToODMTvYDTRZsYO+MKDx8bJTY1DALEZ0Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy7xfiU3abjaFBB+QwddTusIcgT9LpdSNSdoXe11tGEww7+e03u
 GlOg2V/LaLJFXwjOErA7xUrIM2lxQ/niWKEbFErDwot56HXj9HtNRtP+1bbMtR4=
X-Received: by 2002:a05:6000:1567:b0:374:c17a:55b5 with SMTP id
 ffacd0b85a97d-3820810fdb5mr10354120f8f.14.1731611276643; 
 Thu, 14 Nov 2024 11:07:56 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae313a8sm2176218f8f.105.2024.11.14.11.07.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 11:07:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 03/19] hw/net/xilinx_ethlite: Remove unuseful debug logs
Date: Thu, 14 Nov 2024 20:07:17 +0100
Message-ID: <20241114190733.33902-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114190733.33902-1-philmd@linaro.org>
References: <20241114190733.33902-1-philmd@linaro.org>
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
X-TUID: +3Zfk/vhZ5hP

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index bb330a233f..2b52597f03 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -32,7 +32,6 @@
 #include "net/net.h"
 #include "trace.h"
 
-#define D(x)
 #define R_TX_BUF0     0
 #define R_TX_LEN0     (0x07f4 / 4)
 #define R_TX_GIE0     (0x07f8 / 4)
@@ -100,7 +99,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_RX_CTRL1:
         case R_RX_CTRL0:
             r = s->regs[addr];
-            D(qemu_log("%s " HWADDR_FMT_plx "=%x\n", __func__, addr * 4, r));
             break;
 
         default:
@@ -126,13 +124,10 @@ eth_write(void *opaque, hwaddr addr,
             if (addr == R_TX_CTRL1)
                 base = 0x800 / 4;
 
-            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
-                       __func__, addr * 4, value));
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
                                  (void *) &s->regs[base],
                                  s->regs[base + R_TX_LEN0]);
-                D(qemu_log("eth_tx %d\n", s->regs[base + R_TX_LEN0]));
                 if (s->regs[base + R_TX_CTRL0] & CTRL_I)
                     eth_pulse_irq(s);
             } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
@@ -156,8 +151,6 @@ eth_write(void *opaque, hwaddr addr,
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
-            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
-                       __func__, addr * 4, value));
             s->regs[addr] = value;
             break;
 
@@ -203,7 +196,6 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return -1;
     }
 
-    D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
     if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
         trace_ethlite_pkt_size_too_big(size);
         return -1;
-- 
2.45.2

