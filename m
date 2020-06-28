Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2196026lfm;
        Sun, 28 Jun 2020 07:31:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKcHhYSTJfnDtWOFqnQTXSNiF1pt5sdQHUy16z2k1e1CQnSTID55n4ZI+ekqZ3kvMU+ubp
X-Received: by 2002:a05:6902:6c9:: with SMTP id m9mr19855787ybt.372.1593354708965;
        Sun, 28 Jun 2020 07:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354708; cv=none;
        d=google.com; s=arc-20160816;
        b=PnXw9EdRCx5jWBrqilLfpk7NVReBWSCIqfBCE0Ry/CS7AAszn8CvFRioOJXwwZnl8S
         9qgLQf21Y0ai312RHUQf29BQc7Z7s7CQ0UvhjZ0rATRZCcDGL7NPMnXHlEt5cswhggGK
         5448Ig8zcUlA/Xu9JdsxLHD2RiXU4xybJB1UFMl9jY2ymcnenVykDvCb16evX2MSM44s
         VeQkEqpv8oTuWH+/QuLXIfrudYVbO100cYgBGt9CmUhOnH9+RVjrKqwKp0T0mhIcQzMT
         Ppj48x5ECVomjpd+i57VCOFYLDJDrf5yd5L4MS/75umgqlyNHbH9cDp6xBmOoU+FzEs2
         jPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fwBSY0MsI6h8FbtVujLNC6mJpu8V4peKWaK9z7XDiI0=;
        b=pNl0/tINajajebWK+2YmbhuFWC5yt1qziFIVByCUOkxvia2+UPgVyCftTo0ft7+vh5
         OCfoS2SV783ypG4CJeNwswLaZAZDCWGNIeHxyq2asZUZSH4sNrDbOP32ZkQDxyEKbLcH
         BUARXcgwQsAqN3tuHKrMbrisNb9HpmU+sdYh2Hh93PLjtyKUV42kPmuTQdAxZ6HlVkfB
         FP88wWVyaZromm61NoRXAnOzffJizsq+lRwnnjksqIp5RWDY4nRLiyX+0+HpjGvf6eSk
         tN9vhoVbIWLXWJWnEM45ixrmGkZB4ynLYeW0FWgFiXN6pEvCkqXfnnTJgd1bhYGW+C3H
         8hbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rg7325tu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23si29214873yba.275.2020.06.28.07.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rg7325tu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYLU-00015F-Ah
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEk-0006TK-TP
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:50 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEj-0004le-8e
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:50 -0400
Received: by mail-wr1-x441.google.com with SMTP id r12so13991500wrj.13
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwBSY0MsI6h8FbtVujLNC6mJpu8V4peKWaK9z7XDiI0=;
 b=rg7325tuDYm4hUluuyLxFpyBeffHXylA4vO7YVE+nBUruGnnIL7GDbNPBPROrBMHDq
 SZwkDsEWqsPO0Nh8foIzHvMmvUEt5rXLSW/C1FOkdXGoxJILdMd3gXAtuH068iC3vvOT
 w8wbeCN1qWkFmSWVzrcTAN0xgOYcZRIt0TmS4OaGwTW3Z7x0p+GdLzfHJ+ileI1FJuOy
 JeQKmiW0uC1KKQadVkcMS5tVticI3PDxrrjUz17cHupg05Ri8nPN37aI6dgoUW8GVXrG
 PFBxUNdrf5YRB7wd1O3kOJhTY3Qko9ODCBsnBMeA7MWKjHROYUzcww7omiMmCipT3ie4
 SIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwBSY0MsI6h8FbtVujLNC6mJpu8V4peKWaK9z7XDiI0=;
 b=SogmMTRy4uI62fY4pnb8QWTpVRrrARUfX7gqx1Y9GzhBYw2+WaEirDcluQh8sXLBN1
 c1+f/2ZcYylpPT+kiHswG6M31C1djwyAZkK3G/58Cv/RAohb8Ub1ock69cfM0NFRTEEM
 HHDE8HcH2sHhSOvA7eCcZVap7x0agJPHohrD74Vs3Ibo6gxSFrG1hv+3FWa5voog4A5i
 h3niktl5jU2s4aHc+11pP9+XSnzYzkddPJ02MvdL9fvA44Fje7JqKdYN1sQ/sMFwpfaD
 YA2eaKiHWQ6aLvif+bBZsA6HjZmQ8PrePqN8N2AKC1rIZq0jXmv+hhrqQ4CpaNJDk5g0
 GgBg==
X-Gm-Message-State: AOAM532QQEYMwzCSRe44KuK/qWm9fxhRS3aOxlr3CEf5p2OWIcScMF4Z
 AzmqemIkxViYPf1k1lqQAPF2d10mA40mXA==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr12770328wru.411.1593354287667; 
 Sun, 28 Jun 2020 07:24:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/17] hw/gpio/zaurus.c: Use LOG_GUEST_ERROR for bad guest
 register accesses
Date: Sun, 28 Jun 2020 15:24:25 +0100
Message-Id: <20200628142429.17111-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yPAPxJqpAQLB

Instead of logging guest accesses to invalid register offsets in this
device using zaurus_printf() (which just prints to stderr), use the
usual qemu_log_mask(LOG_GUEST_ERROR,...).

Since this was the only use of the zaurus_printf() macro outside
spitz.c, we can move the definition of that macro from sharpsl.h
to spitz.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/sharpsl.h |  3 ---
 hw/arm/spitz.c           |  3 +++
 hw/gpio/zaurus.c         | 12 +++++++-----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/sharpsl.h b/include/hw/arm/sharpsl.h
index 89e168fbff3..e986b28c527 100644
--- a/include/hw/arm/sharpsl.h
+++ b/include/hw/arm/sharpsl.h
@@ -9,9 +9,6 @@
 
 #include "exec/hwaddr.h"
 
-#define zaurus_printf(format, ...)	\
-    fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
-
 /* zaurus.c */
 
 #define SL_PXA_PARAM_BASE	0xa0000a00
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index bab9968ccee..6eb46869157 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -62,6 +62,9 @@ typedef struct {
 #define SPITZ_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(SpitzMachineClass, klass, TYPE_SPITZ_MACHINE)
 
+#define zaurus_printf(format, ...)                              \
+    fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
+
 #undef REG_FMT
 #define REG_FMT                         "0x%02lx"
 
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 9a12c683420..258e9264930 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -22,9 +22,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-
-#undef REG_FMT
-#define REG_FMT			"0x%02lx"
+#include "qemu/log.h"
 
 /* SCOOP devices */
 
@@ -104,7 +102,9 @@ static uint64_t scoop_read(void *opaque, hwaddr addr,
     case SCOOP_GPRR:
         return s->gpio_level;
     default:
-        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "scoop_read: bad register offset 0x%02" HWADDR_PRIx "\n",
+                      addr);
     }
 
     return 0;
@@ -150,7 +150,9 @@ static void scoop_write(void *opaque, hwaddr addr,
         scoop_gpio_handler_update(s);
         break;
     default:
-        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "scoop_write: bad register offset 0x%02" HWADDR_PRIx "\n",
+                      addr);
     }
 }
 
-- 
2.20.1

