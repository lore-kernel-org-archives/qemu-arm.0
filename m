Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3054721ejc;
        Mon, 28 Aug 2023 07:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXnLe5TblwJBEtb+M3pH/t6R9NIv6sMy0jrUlgNEOKYMLJDcsfV95qYJNBIKJVCapVrqOC
X-Received: by 2002:a05:620a:2951:b0:76f:10ea:e92a with SMTP id n17-20020a05620a295100b0076f10eae92amr4118058qkp.0.1693234666554;
        Mon, 28 Aug 2023 07:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234666; cv=none;
        d=google.com; s=arc-20160816;
        b=kOF8NZqWNEUBuaepxszFhuTimHoq0wAaZ5d2iuELaKG80AczUkbhD9gXxlIMx96ReL
         N4ufhAhQIYJkTYODTYiFAmrY/sIAlMDLXx4ZbJUDqf4S75dB/Kvgizx2XFOhywglx7/t
         8VZVWQB29NXU4EqyoGLynXMTy0/YbbopZ+oBdoqgm5QnOzRKUrVl4Iz0cXsYBVmCWMT9
         BwywBJy5RNFX6NWtx1JFtgkXs/dMPeuTCvg21gZyzHkysfxE+r6AaLACgAen6kjdR/ud
         pbr/Hu62Jhhyyq0OJmKI5yYG/pRQPYAdWHTn5rK52E98mehwQF29c91RAWjVQEfM4Z/m
         SZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=RpfkQlWtlC+iYDs4ORzXc4WXJ+pjXlA7AAq20KolEZXPyPECEPJL4pNyciiGxvRdzR
         dTPTzsS7V+jNIMx88Cx0dSe3RR+72+gHupHMtGcbx8WjKAHKTo9XmdFQgLBdHr/3GC7b
         M6ZdpJxYmY0Ku4s157F/ZjBxhrwwzUmFQ4w6nODjNhF6F0QR5eL4KsVQEbs/9deUaaTh
         oKIqUeCF0tfPvqd5ZyYMYrOZAbkqSSNni/vgHGp7f303k+SJ2LaZ5Q0gfuCX1jbkIHkh
         s653Waq4b75lJc3j9Zu0wR4hC64N9LCHUMLZYeKe+YHx5+ZNVAuxFcyg+eqbZK8YWffZ
         HC6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uCSFkD5X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05620a204d00b0076cd007b54fsi4952859qka.183.2023.08.28.07.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uCSFkD5X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadew-0003LH-AU; Mon, 28 Aug 2023 10:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadev-0003Ji-Hl
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qades-0000dj-05
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-400e8ca7e38so28459665e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234560; x=1693839360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=uCSFkD5XYs+JG7QevWUjwPqUs+YDJlAC0VDk50eqnjdwrUIj1qOTjR/1oKNiZq2zEF
 NgHOFpOtrkh4rxtgVZ6n2rNBFJhzXxwEyzLYL+YcGN2gv4SR9kQQaZ+/QvIOn/ZsK+yH
 W9LAcAOH1mGBWQPB5gh6j+RuKSOcANjzttCYDJiPPa0Dvwl2topmI2jnCS0h4iAbYyO0
 SOi9bfIbqJ+yxCE6lQKtU5/o2VVYisy0SFGgRAd3HRSaJyEElou1GYE2Wqs1TvL8vh3L
 ZYMfZxTSsyKhp3k5OZutWI0X64LpSxM10MfA69i8znvKG76sOyyT4BJ4WtZv4isg2yyh
 utsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234560; x=1693839360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=V8ZvjokK041amrtUhCz7sSboZRnOokbrijwJJXejmSGEO0hkiG0xjlHtOFR17RA6se
 zROn7uzPsKosbNUWjKPQ9tcsGsqwhocQyYdKgblBNMwRspdcz8wCvP2mUqnZvVuZkazq
 qSvCX5QOwa4/77B+BKUimQPVnrU1OE4xLJDADoRU7WFe6WAazOVDCpDdfcW2gqgy+bBv
 QUGTWZXxf+Z53z9wZa5r1fR1M6EQIs0aHyZYmrRYaZ+tJgU7nOlvXbmGfscjCs/ms7Vz
 MqOrpbZn1Qg24cSEyK1cb6qrFkTgcljF1j4vBKMJ65DLUcIKB5Q95fH19fdg0TmC8keQ
 HdzQ==
X-Gm-Message-State: AOJu0Yx3r4n6DwRE67GYB+JrN5DiY39fMoiOH58qEqGNmNBaWjfEWKYT
 OCfJ5ZR+1s2ginUUHQZkzlcRuVTv4F0xSi8Pkww=
X-Received: by 2002:a5d:4988:0:b0:31a:e6c2:770d with SMTP id
 r8-20020a5d4988000000b0031ae6c2770dmr17008877wrq.36.1693234560409; 
 Mon, 28 Aug 2023 07:56:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a5d5090000000b0031432f1528csm10721106wrt.45.2023.08.28.07.55.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] target/riscv/pmu: Restrict 'qemu/log.h' include to source
Date: Mon, 28 Aug 2023 16:55:39 +0200
Message-ID: <20230828145545.81165-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: J847SL+gsr0K

Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
reduce it's inclusion to the source.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/pmu.h | 1 -
 target/riscv/pmu.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 0c819ca983..d2be06a133 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index db06b3882f..36f6307d28 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
-- 
2.41.0

