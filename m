Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7534796njc;
        Tue, 12 Nov 2024 10:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXa1suVC8kq7QHepmL90sTcrx5ur/3vEuyp4L1JyRhI9dLxtngEhZstSPCWPwkQomEDFRZjQ1CncrUveA==@linaro.org
X-Google-Smtp-Source: AGHT+IEQH+i201iVCYm2V5cIYsVzgyB8ZoL1AKe3E00DYMqhxofI6vyEBYwQ8HwmExxCN+U9NrfW
X-Received: by 2002:a05:620a:c4b:b0:7b1:50ba:76e8 with SMTP id af79cd13be357-7b352921362mr6801685a.23.1731435165499;
        Tue, 12 Nov 2024 10:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435165; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7RfwFh5nwAyrIPCa54xfzrB7tx9cvTQy5M0WM2419onunk+oifszdWwvrqhKuo86u
         2NCoAxk1LBdouo2R8kwKLTjztDpfEcETVBY9fWAmStGQu9BitLqsmqB0Z/KwDyvu6/Za
         FeOOwgjBCNBNbGc/3WoJwZ9M/NwQAcgmOrScP4XBK6Dy5gE2bqzowLl1/uy2Uf7CyJCL
         wimAmoOzYFn+Fkg5zj+fJfj41NBAAkzfXCVygo9ay5fQMhuTuKL1W0L0JDnn7WHcc23e
         4O1Hkozu/Xb/Ybzo/5JJKz0ibN+PzLEitlOSeJHU6NwbN1dXw7mfvY03ymgxwdMN7ksU
         wGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xM2ZSeJRoX/j6Un6zic7nNQ/NMvb/n81U1A/iot7Isw=;
        fh=xm8x8CrqHQCI6ibobVbBIzlkdqB/Ei/DsGw94rzaNxQ=;
        b=KL+XxlnPH2lK/SSOm5Hr9Cbd7N2AYTUTq1nwXOf+zBH3IWA+JMGk3IFuCvZzdTwtdU
         csUE11i/vy1QLh2ClrEgJOZ8wmrhlp+9x9ITdrJPKPWbpfQlCleD71AacctPldEonTh9
         qWvY3xLuI0I51Pd7RS1smvdB8YiPp2DnJk+pOqS0P5IlfqH+P6RnuOTDErEegJcQf1Qg
         60Z0mrso6uAb/sDyIcD7g74zguF+vROygkwNvGUbzyyCiBrRA+5Y3Z7EKLOHi/Qgo8Or
         4sVahD7LnPGtkzsjsAFEpsg3TbJiWZJa5/WPFr/KN878zNvcepHoMnyN4BA413Y1pPY6
         Nbhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyRe20Br;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad10b20si1457177385a.551.2024.11.12.10.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyRe20Br;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvMX-00057U-A5; Tue, 12 Nov 2024 13:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMQ-000528-7A
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMO-0001v2-5L
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so4034343f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435086; x=1732039886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM2ZSeJRoX/j6Un6zic7nNQ/NMvb/n81U1A/iot7Isw=;
 b=qyRe20BrCStj5hbduR5TLk3vYh4Ma3XGSa817nf0jT0YlPgUUJ+bycGaqIDIFxjESL
 hJj+KI7r8J8gPpL0xot43Bq1kWIGWUg0LxWSjlgSo8SMDr4adh+vYhnZvh2TY4TWgpTk
 Ih3W/DUJNksr2c9GIYudxsT4ntUMtsvS0aJUd1giIDjp6i98utZ8ipPixFf42dSlGCaj
 epXuFNcJ7jBYEgivhvlGlzX4TJeTJeUjjrmDADzmZXY8wqr00c+zCK9ixjN6dczW5sKA
 eTpRM2qPhq9B99DRgribL7+hu8BYfPqJjFYy/Yf++Bd2w1MQtoSATilnEtZz8yFjCdzt
 vq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435086; x=1732039886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xM2ZSeJRoX/j6Un6zic7nNQ/NMvb/n81U1A/iot7Isw=;
 b=TalnZQsgEZybOMmgaGp0cDJpM5KlNhFRxdALCYOG/ALBWwqMtInrOsdqvTifg3NfeY
 MDpF0VlSMfOmbWtm4CGEX00TzpB0OO1BGuOccjbp/W18jDoKb16ptldEzgaJXFplmAhp
 0YZtsjW2/sME/9NKW12E0/bl6yZbtEqlUyCTdGybt14vZnl7j5BaAzylSKkdPD6ZI3NG
 exhhuT4NuWMgoKq8KUgdlDmjAeRCZHLOuwYRnEUvjlZvt+TxKN+uaaCN6eazVJkkohSU
 RcMZayv2v+tHFzbUD2KjWJ0G62LrGTzHLQHtfgRsXzqdMkSEbDmwx0EAhsTsNts3EJPE
 GtwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfUe7vVokp7f8N0wL20GKrMjsAl2IcijrI7uISvkLLuF4IDKuGIzryj04oJBDCOsMenelLfGptLg==@nongnu.org
X-Gm-Message-State: AOJu0YxSVJGLMizXtKHmhWPNPq5neo1JiOak8BivaF/35OPiATx/n/hz
 GSXfptofFuhpSmkiz6zJpjB2hYCCq7oOBygx8sAmt72Dc4J3SOzQEIxS+GhAoN8=
X-Received: by 2002:a05:6000:712:b0:37d:4ebe:164d with SMTP id
 ffacd0b85a97d-3820df7ae61mr55661f8f.47.1731435085814; 
 Tue, 12 Nov 2024 10:11:25 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda1433esm15896532f8f.111.2024.11.12.10.11.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:25 -0800 (PST)
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
Subject: [PATCH 06/20] hw/net/xilinx_ethlite: Map MDIO registers (as
 unimplemented)
Date: Tue, 12 Nov 2024 19:10:30 +0100
Message-ID: <20241112181044.92193-7-philmd@linaro.org>
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
X-TUID: TCrLELLIbJ8V

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
---
 hw/net/xilinx_ethlite.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index e6f6179fce..76b1e7d826 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -25,13 +25,17 @@
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
 
+#define A_MDIO_BASE   0x07e4
+
 #define R_TX_BUF0     0
 #define R_TX_LEN0     (0x07f4 / 4)
 #define R_TX_GIE0     (0x07f8 / 4)
@@ -71,6 +75,7 @@ struct XlnxXpsEthLite
     unsigned int txbuf;
     unsigned int rxbuf;
 
+    UnimplementedDeviceState mdio;
     uint32_t regs[R_MAX];
 };
 
@@ -231,6 +236,14 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
+    object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
+                           TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
+    qdev_prop_set_uint64(DEVICE(&s->mdio), "size", 4 * 4);
+    sysbus_realize(SYS_BUS_DEVICE(&s->mdio), &error_fatal);
+    memory_region_add_subregion(&s->mmio, A_MDIO_BASE,
+                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
+
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id,
-- 
2.45.2

