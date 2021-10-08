Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1961869lfp;
        Thu, 7 Oct 2021 17:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww5k0hMB245dJQkJBht7gshLKIxnsDlm7etBO1pY61rvlNJyPTXZ1vhWxKSAtRXxpIaRMq
X-Received: by 2002:ad4:45f0:: with SMTP id q16mr7523784qvu.4.1633652840786;
        Thu, 07 Oct 2021 17:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633652840; cv=none;
        d=google.com; s=arc-20160816;
        b=LvsH+aMOMgRzF7+F2uNqO27aULwc0OhJdrneuPlkaj8b9dNqF/0L6LpMwIKihx79IH
         gwvCCYrizQvM7RDfk+khLmcvLfQktYq+wSGFzVyfbjCgSm6etVl2XQ9NnIa3ss7HEkmT
         0+uoWOxQ2DBRYr5RsrL3bL9gbXbdXFqTvpI0V40Hhm9HVGXyNu7fTDOruEp4FfHbOFtN
         thpUSxL3MKhiQif8eMUG37DyfG5I1sgvq5VA0eGA0acp1IJyzie0DiQWrgsWAzKPB1pL
         DiUXUldYs+njW3RI6JZZLQFy2jGbnTsB0snFcGIfCahOK84N9v1K6nfiyrgJxoH8T+d2
         nf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=rEeP2b49EvWZof6Fv/RhovI0fLSmlZy99n+P5p6YrW0=;
        b=r7ZrSQAk8BZyoJWpWjbkgUVnD33GBTWzx77ltij/LOSGggHq/Eu4469dvU6xyjOuMG
         1rcK5BhNA+FAN7wihpUU6NddyqiYdDO3cQDOVoyePXlUzNzUfmyqFo/9boJ2mgFw51Qo
         YBR/7Hg+creBTaYH6FJFvKalOx5XZwHkCwMQkwDvo7g7gHwbtCk95nrs/7BqnbDGHsLw
         dYq5J6xZtlTKOgoe9I2pMFFoHNgzG30SjDl2vzRPnNOMpUpXxSrtaSXNet8/ECMcBFsB
         FoutH6oJ7d3XJ74K/u42YTT8eYAjfIqk2XQLTrfwdFLT9VdRxJWGv8SUvb6qytZ/03lD
         hnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=qhyAbzK7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si853323qkp.58.2021.10.07.17.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 17:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=qhyAbzK7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYdjM-0001Dv-8I
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 20:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3S5BfYQgKCPoywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1mYdix-00017M-QE
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:55 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:51722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3S5BfYQgKCPoywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiv-0004Ja-FV
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:55 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 c2-20020a63d5020000b029023ae853b72cso634062pgg.18
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rEeP2b49EvWZof6Fv/RhovI0fLSmlZy99n+P5p6YrW0=;
 b=qhyAbzK7XmpR5p+7c77HWe8kcAQmVNkugLXKw8eb1uGBlcurJSH6EN5u3X4Z9S+Fnc
 K0tDgugShv0Zb1ZVr4HVw3f6F1M5fbXYw3ZtwFlfdRAp/wZDDRcJvzbWd2gCaPCFMrkn
 h0Uy+L1TQ1CVr5lMb2DkkUZl2O6d+Jm5yFPWFK3tlUXF+jscmVDBfo3UK1neFSDFvIuQ
 mqAf7/UVaFxcTtiYYnaaALPl3Rv0pP8gItvWlTJnG+0bkSlBh0abW7wgYVWqfz1FpIVi
 zrQwZHHob4bXnecUP2IraRZF4jn3fr8U3trNtV5g+2mGJbaJFB/PzrKt3oAcONZ7avEj
 5+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rEeP2b49EvWZof6Fv/RhovI0fLSmlZy99n+P5p6YrW0=;
 b=Jjk6dPOanWpxnHEYEZNqH22ohNB5zu/qTnbOrVJeEaiPP8GX8M2KkEZg1x2OsfYMdM
 chlH6dzN4tQw3l5Psv7XxQ99tlkXgoU2vqRr3qSjFdF3g1s+UtGz1WWaXx+HjUcsffgO
 gfJNYB8awfuq5smCEyggm7KTwj3ZHA3SMqfBr1vNH0gNKU7MAnXAy6nQuW9KgMYbd6Rc
 f3N/Nr+zu/53pscyEhOyFMtVmRXLcd1zuUu5nZ+qTsNNwiuu2ZOp/RuQ4U+8op8fPPqa
 2zIjPvhdy9BREVv3hk8d4ULR+ls8YRvTYbSuIQPQUlVTZglgKsBE+ouxe+XfdcCvr/VY
 53FA==
X-Gm-Message-State: AOAM531PAtUP9m4YORmeAUGFP0mJ0EJZ9gvCVwNdH8Y6UNWQaV7fuqVx
 akBzxCsYUXOINzhRNY9fsSUA3s3hmjm6BQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ea0a:b0:13e:8b24:b94 with SMTP id
 s10-20020a170902ea0a00b0013e8b240b94mr6714454plg.45.1633652811113; Thu, 07
 Oct 2021 17:26:51 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:26 -0700
In-Reply-To: <20211008002628.1958285-1-wuhaotsh@google.com>
Message-Id: <20211008002628.1958285-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 3/5] hw/arm: Attach MMC to quanta-gbs-bmc
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3S5BfYQgKCPoywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DVrDgcPNYaNs

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index a656169f61..dec7d16ae5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -27,6 +27,9 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -81,6 +84,22 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
+static void sdhci_attach_drive(SDHCIState *sdhci)
+{
+        DriveInfo *di = drive_get_next(IF_SD);
+        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+
+        BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
+        if (bus == NULL) {
+            error_report("No SD bus found in SOC object");
+            exit(1);
+        }
+
+        DeviceState *carddev = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+        qdev_realize_and_unref(carddev, bus, &error_fatal);
+}
+
 static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
@@ -355,6 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.33.0.882.g93a45727a2-goog

