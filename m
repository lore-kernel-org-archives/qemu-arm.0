Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4237207ejd;
        Mon, 22 Apr 2024 05:59:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj1gPPnSH+TEtnoiniVWwcKgoJ6jHPpnc7G4q/6X02RveUMsnUDGXHQjuLZ58jDPAoAKyL9Vjjb7wWnTDOYKmhcPX3vZb5
X-Google-Smtp-Source: AGHT+IGagA//YhMHZPo/dxyPBWh8mXy7jfG+/Cb1dUvfirNLD9ReqY7HMhhRV7QY+xNSqgR0JqQa
X-Received: by 2002:ad4:4d47:0:b0:699:2243:2948 with SMTP id m7-20020ad44d47000000b0069922432948mr10370155qvm.35.1713790749941;
        Mon, 22 Apr 2024 05:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713790749; cv=none;
        d=google.com; s=arc-20160816;
        b=We7sxOs8TKmhqz/EjRsaSmLcSMi2gS/lzsG881QXC5Bzfy3dm/rh4OJDy8+ZhzgRWC
         NHk3wcyNTxQ7OLYQLbvkFleghGhxPrMXdYHx5fuGfSYIbnTkCAT88YYMQjcbX5+Rqu9j
         iRH2OJVvEUR/M91FeRCrZ9JMZeHN1C/rgHhTNnP7e6e+daGqtVHZRNsEWqjgafXARTbY
         eKvanSn7nhMwfYWoMn8FVALOix9jyZAWen/U/jc3iNMqa8I/h0W0p82bK1wnf/yX10vp
         jEgxDg6kfGOiajShgS2YUIBMEx1EhEdxB9euT6yzaKhXE+YqbasR8vFbjNGHR87tnP9/
         biAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SEB7rrTLtp3+E0UWx6azHIwaCjR17UZYQGWqmUBhvzw=;
        fh=KJA9dtBvSQmy0qjjaw8IMZj8n0EQELM+xTZmwB2HdYc=;
        b=juew04j8K6KwWhvYT1MYPjQPiAY0KDqTuAV0P/yzD3fpBVon0XZDc+18whpTPIyenx
         ad1TyCxUG6fekdqzzcnS8EFOEDzjh+G56mXYBW+HStlUoIxaT8HTiBazGZvME3gxxRzR
         KQ67QN83XMyJ9siO0OH4tD2ldI6B3j3fjFzqQI0aHhDfBrDZd/KEsKTPsm/x4qXPmj91
         hwKem5qov7FzHT1TyTkYhjOuhDxGJCimHB0QCWhJ0YxxrLwNMcpHSr3kIFQPCKeKJ34O
         mx+DeaU2fUSAPR5J5kUFaku6DwYhboxQFfS2WYGcGaDHdHRriQwc6iMnINSq8Eht7618
         ZvQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mOxaxiE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020a0cc992000000b006a05988b906si8631735qvk.129.2024.04.22.05.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 05:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mOxaxiE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rytFV-0007Qb-Dc; Mon, 22 Apr 2024 08:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rytFS-0007Q9-5G
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 08:58:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rytFQ-0007Vd-GE
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 08:58:17 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41a7b6f22ebso5791175e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713790694; x=1714395494; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SEB7rrTLtp3+E0UWx6azHIwaCjR17UZYQGWqmUBhvzw=;
 b=mOxaxiE1YbQaLIU4pvvpNU4az2GTwO+gwfHQQHRfD2XWsvZNRc22Nx8W5KYupf321H
 FBw4uQH8zpdCqLzBUQCPhSo6FuqJsE39FEDO/reDhzRaxNNIY5Mjq1Pwr0A1+o6RBmU6
 UK4FybkYWE3Z+8+mTw6+QhBzFDNsgXc3Wwgryl9Nltf/1lb2xA3ckqdnM/uu4FKmV/Tw
 4l4svqzX0KU56vR4kHgve2sAb8FfMEsZgPaZru0ZW7jN6b21GEdk9dosmwMby5dXtFlX
 h1pu/htsaY8UhgfeAKhZrZx6DzI0rCMK+zOwOlM+nBqmHAYBa9V3qiYXQ8oyss/hAAR7
 +6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713790694; x=1714395494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SEB7rrTLtp3+E0UWx6azHIwaCjR17UZYQGWqmUBhvzw=;
 b=ggL8NxR5v5qAUbq8GHiU5jSlpdgAqMLHf6xkxujjgM0o+iTq2HI3qKPXhWsM9PMfIo
 i/9RpFtNYknECv95g46DERKvAMYHWvrVRCcudogYCoqZDUdEKrxaV2uATTeYa3CwgJv6
 HOacwrVprgeyZWnuD7vxM5lGTlQOrP7fbJlu+RghZkA0ARMSX3qD8D3RukOtELm0pTR1
 nlrp0BVH1a+UtNs1Z7y+R7MLJsF6rQnDLt23F/zO3z68YWfBds/4Ow8nVIDHQTuHhG5C
 Ng+KUitEBZEw04ckQasfA5XJQbNiOOGU+kLCpduYH5USV4WDwCY/9Yz0/kL+KFVlDGLS
 xM7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmY5A+2KKW+lopXEvJMk4LkbDHuhhXYUzATQ+JQYga51bp9CcoDZF4O3A2tP+rPeKt79wTofmtKnfLSW221tC6BZ5/
X-Gm-Message-State: AOJu0YwfHQeyo49C2t7NKGCiBUntXHJ3IISHUmA08eFdufQ1k23ZjkZm
 KYDob9huRGsFoySIe6vEVbo6trZz+WqSaQaeEak745ugP9KLvIaKv4JpQunDHyA=
X-Received: by 2002:adf:ce06:0:b0:347:f94b:94d8 with SMTP id
 p6-20020adfce06000000b00347f94b94d8mr8864659wrn.62.1713790694546; 
 Mon, 22 Apr 2024 05:58:14 -0700 (PDT)
Received: from m1.home (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b0034ae73a8b25sm4166840wrt.37.2024.04.22.05.58.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Apr 2024 05:58:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org, Avi Fishman <Avi.Fishman@nuvoton.com>
Subject: [PATCH] hw/arm/npcm7xx: Store derivative OTP fuse key in little endian
Date: Mon, 22 Apr 2024 14:58:12 +0200
Message-ID: <20240422125813.1403-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
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
X-TUID: 2+xeN1DZDP0I

Use little endian for derivative OTP fuse key.

Cc: qemu-stable@nongnu.org
Fixes: c752bb079b ("hw/nvram: NPCM7xx OTP device model")
Suggested-by: Avi Fishman <Avi.Fishman@nuvoton.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/npcm7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index cc68b5d8f1..9f2d96c733 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qemu/bswap.h"
 #include "qemu/units.h"
 #include "sysemu/sysemu.h"
 #include "target/arm/cpu-qom.h"
@@ -386,7 +387,7 @@ static void npcm7xx_init_fuses(NPCM7xxState *s)
      * The initial mask of disabled modules indicates the chip derivative (e.g.
      * NPCM750 or NPCM730).
      */
-    value = tswap32(nc->disabled_modules);
+    value = cpu_to_le32(nc->disabled_modules);
     npcm7xx_otp_array_write(&s->fuse_array, &value, NPCM7XX_FUSE_DERIVATIVE,
                             sizeof(value));
 }
-- 
2.41.0

