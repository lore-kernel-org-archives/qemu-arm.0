Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4417186njb;
        Wed, 11 Dec 2024 15:05:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrtxcIwC9Lj9DdGKz/Dm4t8Y7VBt+DJk6je6i87Ubl9Sntp4yLZbLLokxe2a6HQM+4f/TD0DPsoqY3GA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJPEFu23QTe8V4PNv0xf/h/TpMADQmjlNG6C6Otldf2AFhV02q25R68TxEZbZdpLjK18I3
X-Received: by 2002:a05:6122:8298:b0:515:5008:118b with SMTP id 71dfb90a1353d-518b5cc35c5mr1520599e0c.1.1733958305050;
        Wed, 11 Dec 2024 15:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958305; cv=none;
        d=google.com; s=arc-20240605;
        b=Flk5LgcP2dPxhEqYF/xz1PP0/88SKSjKi0gNkXUW3zSgAndpij94Qu1kQKAeskMgJ5
         IRNL2Lf98b/PFQ1atCa9kcAKu+/piAmvsg795JrH7pdw0XlnqwX3IXZeCRTeMlV8ocne
         IB++vzS5Y2cB9/lDop3mQP/WY5PZc47uypbMLQiGWpg/A0R9G0LHco5axehzgSjodgFv
         aoLW2cGB9OpnFkZN/VU56TjFLdJkG/xkO22XdbZppaMYKX7EjU12nuhPgNJNzTkzio+H
         eDfTahivPNf7Cx53J6UvuVEFbD5qokbRT0l/7u67O8syWKB1xXPzanaE8MVBFJgAIxAI
         u2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i5TDVgq/CwukR+NJEtHbkNKroUN70sGumVux+smwBCQ=;
        fh=ecKPsnMX9WYJGI+IUAdVzw+EaDWfRvE3KzEYnaW3XUI=;
        b=QjFfZhDK6KPWq2Pi+ZQv9bb7+DLnSZKoLsTRrKAzZCkHzAlY+Awb8LHEkp9SWI9hwM
         ob4Fs5IP4cr41CitJLk5XBLTh3Ym3gccQChSwIV+k79cwAVXJy/hyO3nk18dc30mIxru
         VP2sFDfIr7nNmH10FAQRkaG2AjgnJWnXmAMhXEL2H9AnaqfvH4Dw4ovjB9L/jvXaNh6Q
         0uzWi/tnv3lpJ6ofBT3kJmuNF85VR/lcS/tgADAWp92zmSNtYPXMkhDDcnv8F/ojQ33Y
         msvlgEEwSPJJVCji4RYQxQiyqDMNt/ztaob/oZRezlaO5yM7xvgst1StQHtFfI+/kUfW
         J7Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ub7ilO+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-518886f3baesi1793643e0c.285.2024.12.11.15.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:05:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ub7ilO+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVlD-0003M2-Dx; Wed, 11 Dec 2024 18:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVl2-0003Ft-2g
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:40 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVl0-00029z-Bb
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso3338565e9.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958277; x=1734563077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5TDVgq/CwukR+NJEtHbkNKroUN70sGumVux+smwBCQ=;
 b=Ub7ilO+7J0750n7OF58vshIkm3AV+78t9nLKtlDukYpRCpPARfq/Wl3LqXEL8h7zQL
 Z+7b57wnVSRjPIj55Zo6aJjCYjDTFoTCmUR2flLDU6NTOd09KmRzPLgc0+D1cSvy0YGC
 lbrz0ihNzV+wYN32slUeDPyoYLmMWSKX7JzTSHG3X56LyEM0c1g3GnxIoywT34Rhj2Cy
 aDgQpNa3PZbLfNuCDNOCsJpCN8br+R6d1NHxgXrGueCzBjLQtQApSgosGOXkY41e45xm
 LnxTedqgzFjlOSnW2GVWlH3rWWJm0eefKNULxpeoqzADWhLUybTrLFtjrrOyoPdJHPcl
 PHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958277; x=1734563077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5TDVgq/CwukR+NJEtHbkNKroUN70sGumVux+smwBCQ=;
 b=wZBwa3k42hyQ0NnyWVIG3FY9/WWTCsLUAWkwPPN7TqbH/Nfg9cpM5cM26OOtOII14A
 wUvAblZT2JZSGMv3l9GREgaCYpMPXy/KOb8yoQ6gJFTRVCru2l1BsTPMCfTUUXaP1B7d
 8ex9UOZSEMYzqQTEYo8WMx72eF9Vdze8nXIQw3X8//MPk5+NvdBgDPOEFVAek0oHJVU3
 BG2HLM2K5St35lovlNim2kE8JEd78MPoXZ1PfDrw/Vl3xVLA+omjfdAGXGUbe/o5RPuv
 HRpwvegFly59Hzdgr/3TJk2WiKiS/MhRhPcnE6RivKFawXlsohbuCqij0u47Pq01G3Oh
 R8IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3radxSYiK+D2jxFNxoP2qfl1Kp8Vj/aLLryraTX/rmnOE2vJUeXdddVLNFM1wORuLLRYVPB++ww==@nongnu.org
X-Gm-Message-State: AOJu0YyAikvpr07s4IlUim3oGT9zK98w19m3I5XJVCk2E5Xxg4zhnarw
 Q/u7pk8+k90CvnThTlEvaVmK2OSPSylfKcldj32qjKFiTyoVa1KtstvNRzixqZA=
X-Gm-Gg: ASbGncuMCn19FGOxa0zro6C2XzwYSVug/w+Mwimp8IfVCTO0qwojDhtEiodURsBZfNa
 w+GFgb1FliC8dRGPLSglg11JW4ODXJGmpLH6ZRK4ABjgObvLT0+PCCs1U7Uw0YfmfcHdG6V60x6
 OoOu3P0JzkutZyd9CQWEPif5X06sQKyd6kvvD7KXLB6ICwagehwZXRMHegAqqJ8h/NuBwGIcZj/
 y1YAwIJAgYZlhhEBOs+QHQTTNDqmJPi6Xw55r+VzVyLmfs0FAXZ4/gXimVl3hBY+ncENMaWJnfv
 7CYmRBoakcez57r63C/yvgBkfwkZ2fGAMw==
X-Received: by 2002:a05:600c:1f0d:b0:434:a923:9310 with SMTP id
 5b1f17b1804b1-4361c3c5015mr37873435e9.15.1733958276747; 
 Wed, 11 Dec 2024 15:04:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514c06sm2341763f8f.73.2024.12.11.15.04.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/9] hw/sh4/r2d: Include missing 'exec/tswap.h' header
Date: Thu, 12 Dec 2024 00:03:55 +0100
Message-ID: <20241211230357.97036-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
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
X-TUID: NEhArTUIuhtS

r2d.c indirectly get "exec/tswap.h" declarations via
"exec/cpu-all.h". Include it directly to be able to
remove the former from the latter, otherwise we get:

  hw/sh4/r2d.c:357:35: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    357 |         boot_params.loader_type = tswap32(1);
        |                                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sh4/r2d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 7eecd79fcc1..e6cc156c238 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -43,6 +43,7 @@
 #include "hw/loader.h"
 #include "hw/usb.h"
 #include "hw/block/flash.h"
+#include "exec/tswap.h"
 
 #define FLASH_BASE 0x00000000
 #define FLASH_SIZE (16 * MiB)
-- 
2.45.2

