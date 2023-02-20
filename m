Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2197975ejb;
        Mon, 20 Feb 2023 03:52:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9HaKyAV9lzbyaPiXDhYPrtfxvXfaDu8NsYzZyyooKB4Pt20BIseg4F/KDoZmjOMBX9qB4F
X-Received: by 2002:a05:622a:1104:b0:3b8:6788:bf25 with SMTP id e4-20020a05622a110400b003b86788bf25mr207437qty.23.1676893923348;
        Mon, 20 Feb 2023 03:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676893923; cv=none;
        d=google.com; s=arc-20160816;
        b=kcOEtClC5NCOLh7RMUFNYtyDB5PacwlqUvYQxVWju+eeHykhwnFqA03vKBT8y2CIwh
         hMuQZ8i/obkSePk73yr1FrbQqY7NHWEu79Bo+WikOl7iQkQaDC+PLeWXF3ocDIG7IKez
         NLqvE4/5Yxp/xyc5WioIBvRgtLPELMgjNAsLK3E1xygCnqGCPb0UQlc74vjQleJw9cug
         n1Mda9MHn9TirLOTeN4QZE4DI03DwcvT93QdUFaCzwAiXJwHCT1I3K8c6g/ZRF3B2eJa
         EGoCtKL5yp6vXz20r3MHhfe0peQFbY/57t34QCrcI+u3IRTXw+JrO3ZEF3Ct6EJlw2ad
         rNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wg6knbur2mmJV8L9g7D6SKJ7/ERhPsRC33COYh3Bljw=;
        b=aPv34Q29WuxcHXv+9IHv0V6GTNkEFmCrRYHLSixwKH9BR2bs+xP6euKs4c0dBCiOg7
         uU3h3AdJJroDaD749bJFo2swYFjj4X5rbRs4jtuF7nK33lDL2LYNcrrOugFVz0J77dfO
         a3373GRPkuF0va+IakPGqs1D9kNYwB72fQiwVWFs7JMJ86Zibfb5NSxSbf53id/9OiD3
         5inbS5U5ifT6pJUktRk58s+x82nVSbCwtAB0hsDrTdk6a0TzOqHCUcfEWNibpNK9qOkd
         Yf5fxbeo0RyMmRv+N1U9Jwoq6TXhMJ580gAHXvMaME3MRn6dAX58TYbAG86onSctZEm+
         nzrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDZ000fo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a05622a044c00b003b9b4ba1b52si10139890qtx.73.2023.02.20.03.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 03:52:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDZ000fo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU4hj-0001ik-Jy; Mon, 20 Feb 2023 06:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hi-0001hy-Ix
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hh-00056O-0Z
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso844955wms.2
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 03:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wg6knbur2mmJV8L9g7D6SKJ7/ERhPsRC33COYh3Bljw=;
 b=VDZ000fopMnMKslEBLL9pEqrmVFf6Xs+q7tczg18RLnpAu5FoBKA0uFfeC37vrT2jg
 SN2ndwkQHgN/DevtloSzAbEot55W2BfIBGZCthMfcJTNzuOfxJSOQECx8gNwhG0ijIDp
 Rf6mvFysejO1GmNcFGdhh2UPPxKJ5sCOLdixtObDrSk44krnxezNyqwgDnd0g+YKUD10
 K1PQBKDMbx6l1y/WMM4/Ux6YgtbfClWWKL9H7RaP610wjjUDFLI9W0NAIvB43cdBhHju
 Pkmcnmhxmp4Te5xh/0Fn6TmWRWIJWSqoNnvhJn4GPcmYpJYMZo9z4hIvRHzmIwygacUN
 i1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wg6knbur2mmJV8L9g7D6SKJ7/ERhPsRC33COYh3Bljw=;
 b=I4qnD+Dd2o3UNG7v5qIsVIjI9nGBI9LEf39JJvAaKIDfEfg3xIfqk/xjEagw5DGJC8
 q3evJSF2MBr69Yx1J3XPNGSVNR+IZhbZEushR3/q510j93WvsTEk9Y1sIaa/V3XCpWFi
 9i7M1jWL1+fAgNhgRygsZzGiKNJKu4E2rI8Ke9eKWtlzd3E1przwH5CEje8EcSUhfy+E
 tG3+XS4XI3JN/g7GItC4W0hbKbtRx1veTgET5BFJq/Jl8a09TPaSXp3N73yRKvqr+zYa
 7ZZ638gYoPJXctT7DidkqXyxynyAIk5svLcFWmXOciq2LH9Lt/jBLyxs5uiXiJvWEPLy
 /BaQ==
X-Gm-Message-State: AO0yUKWR4e29X7m+xuXw2VFNsWWlkLLqOaR3MnZWqGdmvkNPHbGGYgi+
 xnZb71yzlC5uvA7M3JDT2xde6A==
X-Received: by 2002:a05:600c:1895:b0:3e2:589:2512 with SMTP id
 x21-20020a05600c189500b003e205892512mr780466wmp.21.1676893891694; 
 Mon, 20 Feb 2023 03:51:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003dc4480df80sm89905wmc.34.2023.02.20.03.51.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] hw/char/pl011: Open-code pl011_luminary_create()
Date: Mon, 20 Feb 2023 12:51:09 +0100
Message-Id: <20230220115114.25237-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: sE/Ag6EvQdTJ

pl011_luminary_create() is only used for the Stellaris board,
open-code it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c      | 11 ++++++++---
 include/hw/char/pl011.h | 17 -----------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 67a2293d35..f7e99baf62 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1146,9 +1146,14 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
     for (i = 0; i < 4; i++) {
         if (board->dc2 & (1 << i)) {
-            pl011_luminary_create(0x4000c000 + i * 0x1000,
-                                  qdev_get_gpio_in(nvic, uart_irq[i]),
-                                  serial_hd(i));
+            SysBusDevice *sbd;
+
+            dev = qdev_new("pl011_luminary");
+            sbd = SYS_BUS_DEVICE(dev);
+            qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+            sysbus_realize_and_unref(sbd, &error_fatal);
+            sysbus_mmio_map(sbd, 0, 0x4000c000 + i * 0x1000);
+            sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(nvic, uart_irq[i]));
         }
     }
     if (board->dc2 & (1 << 4)) {
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index d82870c006..d853802132 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -57,21 +57,4 @@ struct PL011State {
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
 
-static inline DeviceState *pl011_luminary_create(hwaddr addr,
-                                                 qemu_irq irq,
-                                                 Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new("pl011_luminary");
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
-
 #endif
-- 
2.38.1

