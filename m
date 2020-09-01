Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4465210lfc;
        Tue, 1 Sep 2020 03:45:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwXtDjVnafiVO0P38pU0L5LP9wKJzDSmpf2lZ3642Ban9+IthlS0xRivGiP1Q/kk+H5zWB
X-Received: by 2002:a25:d4e:: with SMTP id 75mr1661187ybn.480.1598957101763;
        Tue, 01 Sep 2020 03:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598957101; cv=none;
        d=google.com; s=arc-20160816;
        b=RnWkKCAwZSjMdEYnuIWTjj2uu3NpwkQl80iZzSFEnG7KmfjEfN+84lBVUYOX2rllig
         apr/jqXIm4i6D/UArGU7IPAJn74UxtQXfJ5aedrseT16MTZIrq8dlHroUIrlDEXBDHN3
         CW/Jtk/nU3PKy5I9/OrQ9DjpMynnB5cXVMg5n26V2e9sNIgDZ31+w7vshjUW4ImbweLD
         4V8dza7BxQcz43P9L58biEr+0v8oabBIVv52ZgzHBlTsUtMnUv+24+mIE/8ra/fYrgLE
         SPdPoV53jm2IbUbMxHcWj5oS5QuV7RWvedgZVd7m1LG8qvZyBc87ko0I6l8kb5AH0LWo
         d7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fqHTEPlAjV9bvBkHlzkr+R6J+o6iCqiuHYjcb5bwgeI=;
        b=vmdfrzYr+cqYM72U/VM/WtigU8stja7Ck10x2/klYHEvBdz65jJYDbgTgpI8meMDqz
         4GPA4Kvbj/9uovYlFVP2cLbiS3JyG83Zgn5ro2qrrYV793CP48TLAOviVFRYEykBSnS6
         0b+/FX2Wb/OnwZo1YkJMqwMDjJD/aV+sFECf/hlLSeOpYmtLuYCeaiWQQf2PhFI3XKHQ
         f4Uj4EFQYZHbbTwsvQNlIK6NMPoVrypymrgi4pNhrYo6q+dg7e+2vWdkQR76epwJT0zA
         Lir2zsiMUlA8dJ7qJVBYJjkNQFSUouiqMhtxR5q6apAJu+d8vLxZFi8V7s19MblT0/a8
         PbwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q7YmGjHf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si829677ybt.408.2020.09.01.03.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q7YmGjHf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD3mf-00035v-1Y
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3kR-0008MQ-QJ; Tue, 01 Sep 2020 06:42:43 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3kP-00024W-M0; Tue, 01 Sep 2020 06:42:43 -0400
Received: by mail-wm1-x341.google.com with SMTP id c19so679320wmd.1;
 Tue, 01 Sep 2020 03:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqHTEPlAjV9bvBkHlzkr+R6J+o6iCqiuHYjcb5bwgeI=;
 b=q7YmGjHfJ1jHHFk7ho5O78GGMi5CDWGeRX6lG0mOAkHD7+r2TAU5O4bFLJ9lPrxJob
 8GcLl5JHVEWbr0qDkxtTjtGim1VffAmgiS4k4P7tMUJ/Di6qtiKvj8KdSmzkwykHXe9k
 W9hORW0EUHyd4EMHc4g0I+WznXuOC4WSmfGxhfaVBZPEsAoKDeT6i9//p87A2bhMCQUM
 6MpUFcaBzT4WVD1Lv5OXUBqMvSfjRmzuG6t19ngd1AR5krTotVRQNOA2SxoMmpQEXDj6
 0loiU0pXbaTPXrD3uKl0HqDzVg5f9H2W4CDbHv7V+4lpvNETZbrLmz9Ez9sUkDIfTavv
 rOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fqHTEPlAjV9bvBkHlzkr+R6J+o6iCqiuHYjcb5bwgeI=;
 b=lvr8mwCpS4KY2v7v64X1+0BkM6AoSkly3q97OoG3t8OEe0v6GM+4a+KWtZwIfEWyVP
 QnD93sv7EzOjD11xFDDw1JGryjnhKCLNgfhsE2BQmHq3PgdRgQEjPeiuueKlT+Givmsy
 BGoPfTjeA8LjGbq4snl/PvvqQpRCO9lWbUZ3xLaLMMSDxmOvbaSODfvVYyehmZ7Y+kwH
 xjifDjP1xO9zS0PnGpszogCuvexu0xX4ms5Y+u8vuWRV0TKG84MEiBwq6A9tadr9tiVP
 SCFGckZj1PS3SM8GNpbIJz+l5lltqzoy4tFivDZzUgglh+BO4DbP8qOqAX9rAnJuJcoQ
 Zzlw==
X-Gm-Message-State: AOAM532OphNEugdiRUqkCJt12PmyZOPM5HDinLUPy2moH+rnTaVze1PG
 STQcn4UwH0hdUISPxe4ChzJbrdYq6q8=
X-Received: by 2002:a1c:6083:: with SMTP id u125mr1122066wmb.161.1598956959216; 
 Tue, 01 Sep 2020 03:42:39 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id l8sm1693217wrx.22.2020.09.01.03.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:42:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/gpio/max7310: Replace disabled printf() by
 qemu_log_mask(UNIMP)
Date: Tue,  1 Sep 2020 12:42:34 +0200
Message-Id: <20200901104234.92159-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901104234.92159-1-f4bug@amsat.org>
References: <20200901104234.92159-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ko0o/XWGKRD9

Replace disabled printf() by qemu_log_mask(UNIMP).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/max7310.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index 7f5de189acf..c58a1996418 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -11,6 +11,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 
 #define TYPE_MAX7310 "max7310"
@@ -69,9 +70,8 @@ static uint8_t max7310_rx(I2CSlave *i2c)
         return 0xff;
 
     default:
-#ifdef VERBOSE
-        printf("%s: unknown register %02x\n", __func__, s->command);
-#endif
+        qemu_log_mask(LOG_UNIMP, "%s: Unsupported register 0x02%" PRIx8 "\n",
+                      __func__, s->command);
         break;
     }
     return 0xff;
@@ -123,9 +123,8 @@ static int max7310_tx(I2CSlave *i2c, uint8_t data)
     case 0x00:	/* Input port - ignore writes */
         break;
     default:
-#ifdef VERBOSE
-        printf("%s: unknown register %02x\n", __func__, s->command);
-#endif
+        qemu_log_mask(LOG_UNIMP, "%s: Unsupported register 0x02%" PRIx8 "\n",
+                      __func__, s->command);
         return 1;
     }
 
-- 
2.26.2

