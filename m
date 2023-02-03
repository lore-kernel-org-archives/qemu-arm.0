Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1643618ejb;
        Fri, 3 Feb 2023 10:11:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+/OpV4svX2B6TGlcbrHmlIZFy01bnxStVDdHVuj2DxGzh5i27xrjfDIXOs69WzlKlxAL8m
X-Received: by 2002:a67:e15c:0:b0:3f3:541b:549f with SMTP id o28-20020a67e15c000000b003f3541b549fmr6112908vsl.32.1675447898031;
        Fri, 03 Feb 2023 10:11:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447898; cv=none;
        d=google.com; s=arc-20160816;
        b=XmX4oDmUdlYFvRPCWjiGFgw/75p2sWme/Zqz6WHpgIH7fuk2UBfxUPWyZD7GWFEkYG
         1wKZYhmCLAgTMhnkFm/e2qbBEnNZYOX+O3GWJyQp60tIHDRovSS85QubHII9lCjrKiSQ
         CLoodPzoUj4tL/a4/G8Sbx8aU/Y+sLYsgEyGZOTtBk1RKoN+Emfddid/JU+XWfUy/dlC
         VyAjSkGfOCCvrdFJ72YRdS8T0wzpachXrQiMRzYcK7ACPIApatOTbKEe6rkdf4SSFkBQ
         4jcphLFJpGRt3qLnKA+Aw3YnZKkJCRo48KJuwIS6QmXLeKGXoagHZWsjHtE05BX+7VBC
         mEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
        b=wxYF62g5sX84ncKHUZ6lFd642MwtGF/SzJU5RqVPtTmv9LrI68037agW0kV+jPSdOd
         rjD1qHQL8SOqY6JoDYy4+GowtSb+Rgb1Y2UxsDUvtjfFmpgmHllF5yAEnt92fhSJOQtB
         K2HMTPrrk/HspzMczR5fxiGuB1nc4MdXgTMe8QkQpGdeXsViQxBtdCaEy7ElsGv18/iF
         ENzGXiI6rZsXFUqiZywByt9tP7b9GPSuUCuqDUyFFH3Wyjn+aAKyR0L6It7Cnr1vjGOx
         NloBcp7MrWpdxjyt74Q609TNURR5lIQ6pjXeKkbbhZFlI1Wt2DVCDGVuacgMXa/Qbrqi
         C7+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rs57IDWy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a67d385000000b003db20da46e3si926199vsj.28.2023.02.03.10.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rs57IDWy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0WW-0003Hu-9L; Fri, 03 Feb 2023 13:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WU-00035A-B7
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WR-0000mP-Q9
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso4501917wms.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
 b=rs57IDWy4ex+nQZQeb0ZdIEk31Xy11/nJRW20rReogKUl4KeTcl3cc8D8LgRDr/zB+
 u1xu9JIMluXipYjm6yV9E/vCM1QV81BfzX0tAdIVcQnw3SCt52ft5tbmv43LCl6DvtTH
 +QXN/gSlICEsSY7Anmepv49+d8lBSk9UIxVr0gIISD9X1Ok3aWpRr7HtqqsuJSk7XLTn
 fVD6/NnMCZOT/f2RbzUvvj+eDfPcB+/4tofTKLsSRibABiwE6rlqpTGNK5Eo76e31gJO
 dbSu47RseekPIV/lwoCjG8G/2gpwb7R4RXsh7j//TXCxI5TY2cP0XC26agoEOcURnJlX
 nvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
 b=QrmDTRFVYQbMvgu9nh42caFcLCYE42FDUMiTqrxXnZFX+tPAx/MJqtXDd9a5CW/75Y
 H/DaCwD3yaJs9HWeNs5/2HuVXOEv3CV9IOY2GVGTE+rqXQ7l/Y+MWgf963alygnQGun9
 4nyelgACm1FGuQ+II2KDXXwPEfGwCopBlrO7oniUKRzLXw3R5qNQbPtA9gMKL88JuyUx
 Yybk6tLFdwdQdOLPWxQYzluM+yxPt1KOU4vrWjudNK6OLZuX01zIzTjy5VORrpOKD9hZ
 drtQarhKgiJ83Bu4YBVKC2FwjKLOFY2GTcx/ttSt/p2CGyvc30V+U67M5pnznWnMCcOl
 ujew==
X-Gm-Message-State: AO0yUKVW0LBspKuKXGRfxLtwaLc0n8NVUayOC3OyqebVbSprDg9YEY4s
 RcSfAuquMWkcV62oRSMtEUqRyw==
X-Received: by 2002:a05:600c:5543:b0:3df:5eb:828c with SMTP id
 iz3-20020a05600c554300b003df05eb828cmr4955707wmb.32.1675447850564; 
 Fri, 03 Feb 2023 10:10:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a05600c43d500b003dc0cb5e3f1sm3231511wmn.46.2023.02.03.10.10.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 18/19] hw/rx: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:13 +0100
Message-Id: <20230203180914.49112-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: g1B3/UHEazSJ

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rx/rx-gdbsim.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 47c17026c7..5d50f36877 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
+#include "hw/qdev-properties.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
 #include "sysemu/qtest.h"
@@ -99,12 +100,10 @@ static void rx_gdbsim_init(MachineState *machine)
 
     /* Initialize MCU */
     object_initialize_child(OBJECT(machine), "mcu", &s->mcu, rxc->mcu_name);
-    object_property_set_link(OBJECT(&s->mcu), "main-bus", OBJECT(sysmem),
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->mcu), "xtal-frequency-hz",
-                             rxc->xtal_freq_hz, &error_abort);
-    object_property_set_bool(OBJECT(&s->mcu), "load-kernel",
-                             kernel_filename != NULL, &error_abort);
+    qdev_prop_set_link(DEVICE(&s->mcu), "main-bus", OBJECT(sysmem));
+    qdev_prop_set_uint32(DEVICE(&s->mcu), "xtal-frequency-hz",
+                         rxc->xtal_freq_hz);
+    qdev_prop_set_bit(DEVICE(&s->mcu), "load-kernel", kernel_filename != NULL);
 
     if (!kernel_filename) {
         if (machine->firmware) {
-- 
2.38.1

