Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2337837ejb;
        Mon, 3 Apr 2023 05:51:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set/HDBMbXgstpYcsQPGTggsdD5iVMX0CHRQ0dDtPJwGcRxhIPbp/RIgYtDRKQANxxtmKNrM3
X-Received: by 2002:ac8:574f:0:b0:3c0:3b08:2d80 with SMTP id 15-20020ac8574f000000b003c03b082d80mr56882286qtx.63.1680526275772;
        Mon, 03 Apr 2023 05:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680526275; cv=none;
        d=google.com; s=arc-20160816;
        b=h/BSrCrbrYUOLJER3kx1LB4bzt5VzVnG9BE9TstzYumoOvTvqkkH7JAP7ulY4fXNE0
         ks5wKjpAVTQIH1SJsfFIdajzyNbH4IXeNSe8qJNYZqJ5re2OnCQmbTs2OGQk+DXiU68J
         NyLhwf85oBHngziKd0LxqEbd9aYusPAVWdMVHeuLwP/xxdHOd9dgBDBIbzkXXp4NpjwA
         +PscX4eNE0UL3KgMLamuBIY5Pnha0lGHfuOIAMcQhEYtwNk2Onirwj9Q/eSn9cvIFEsR
         MwsFNqM+CTFkFg2RyXJWDla9XhrDUBz9gqUMg5fx5A6bSPJbZXI9ouYOQw8cP70Xq8ON
         dWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=M4IFfRe8PQ6VLfXsmiDheCNGi4mliEL8F5Yu8vEXZhI=;
        b=u9jSoC0c5vM5jh/gf2aZwMNmN5u+Sn8A7UYXxHThQD5a2YNBihEKq8Gm84hXJuihSs
         +N2LNcskXvLiQ+ExcIGL8JmtmdOQ5XizoHYy9/Y8NAWto02reKCLsGiTz86EWNhitR6l
         Kv3pL7bKtntKhGnKlpKWIPS/VhAKbuak4NR3FjCy9QmyahpIwbjRPk6g6ychhibsVU/c
         boUty6+2DK7rreTpwb7Pn4vb2QYFtFmksp3bCP+jv5EZ3uoG1DkQF28IU13jgc1HxmsS
         fmhlYDAtR535jN3idPtQUlVJ1yiYNHUMBTqjU0+ChuVMAGcDxcvJwe5G5IUjCgiEodWR
         40tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pjecoL3w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q40-20020a05620a2a6800b007485bc3c2e1si5912601qkp.9.2023.04.03.05.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Apr 2023 05:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pjecoL3w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjJeI-0006yC-A9; Mon, 03 Apr 2023 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucasvr@gmail.com>)
 id 1pjJ6G-00036c-G2; Mon, 03 Apr 2023 08:15:52 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucasvr@gmail.com>)
 id 1pjJ6D-0000sC-Ku; Mon, 03 Apr 2023 08:15:52 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-177ca271cb8so30530825fac.2; 
 Mon, 03 Apr 2023 05:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680524147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M4IFfRe8PQ6VLfXsmiDheCNGi4mliEL8F5Yu8vEXZhI=;
 b=pjecoL3w8l6uQUtqaVGG51XHjRdV68wyM0V5py8befQ+19hjrfaY2EEF0kqaAYuT6x
 AxyYFzofiVLyf7eIFr9RT+ehKpEwEmkm8Blxy2s7AVP8kiIFgq/1wyEG+F42mCcNzkUU
 Mw3MxFBp6njy11Y0D50r9u3/j1zj4GOkWpDZNlsMXbyPtL66mcRi6IO4YsMZLspMc9QE
 Efxp+fQNno/P4b7TJTKB8Ov9IdaooBPZGyT+kDX2JRoIint25H6BNgIr4HqgNZuFmPfj
 bqOD4iD/sEAy53xPcS+3iheDH0ixbTJvq7nm3lt0dZarQU4bJXA0C4PyLPFBc7sbgENi
 IgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680524147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4IFfRe8PQ6VLfXsmiDheCNGi4mliEL8F5Yu8vEXZhI=;
 b=fCYPqFfPe52yq/firJ/PBaQ/qMKuurzlofQInKe1lvpZLOOQspioK8xyWl3sLWlCyc
 8tTfVV8bMCs8D4Hq1fkKLZN6ul2DBs5ZvRLHCfzvIVDCYmovu5ZgzSI+RKXOZBm09gXV
 QNNFIurx6wZYyu4FeBRlY5xz6qrX1xCy4HI+U0WucvN4tdlfpRW36LTaWK3mf+Ka9TF7
 7lGiThmdgWFxb2NdsipZ9SzPiU2v9pJ63rL1WJL9jxG56bwdiSFjveLv6W3lmDzFhjea
 jTVavOSqawYzruR+0fjJQ+sq9eNi1QAvn96mrK/3kmglZRb9uX90fc5sCR4smq9vQENw
 lsHw==
X-Gm-Message-State: AAQBX9emz9hcGgCarZ8d1zJSHT9D/KvOCR3+0h3if0/+AYjHrGVdN9cs
 IhgRV7YcHcR30uqfPYQmuamvysstLU8=
X-Received: by 2002:a05:6871:401:b0:17e:a4d6:5e18 with SMTP id
 d1-20020a056871040100b0017ea4d65e18mr23406483oag.45.1680524146791; 
 Mon, 03 Apr 2023 05:15:46 -0700 (PDT)
Received: from Zero.lan ([186.231.147.88]) by smtp.gmail.com with ESMTPSA id
 sz5-20020a056871860500b00172428894e0sm3442342oab.28.2023.04.03.05.15.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Apr 2023 05:15:46 -0700 (PDT)
From: Lucas Villa Real <lucasvr@gmail.com>
X-Google-Original-From: Lucas Villa Real <lucas@osdyne.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	erdnaxe@crans.org,
	lucas@osdyne.com
Subject: [PATCH] stm32vldiscovery: allow overriding of RAM size
Date: Mon,  3 Apr 2023 09:15:37 -0300
Message-Id: <20230403121537.71320-1-lucas@osdyne.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=lucasvr@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Apr 2023 08:51:00 -0400
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
X-TUID: gQsqiJsRtLUi

stm32vldiscovery comes with 8KB of SRAM, which may be too low when
running some workloads on QEMU. The command line argument "-m mem_size"
is not recognized by the current implementation, though, so one cannot
easily override the default memory size.

This patch fixes that by adding a memory subregion according to the
value provided on that command line argument. If absent, the default
value of 8KB still applies.

Signed-off-by: Lucas Villa Real <lucas@osdyne.com>
---
 hw/arm/stm32vldiscovery.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 67675e952f..7ca3ba029e 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
 #include "hw/arm/stm32f100_soc.h"
 #include "hw/arm/boot.h"
 
@@ -42,6 +43,9 @@ static void stm32vldiscovery_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
+    /* Allow overriding the emulated board's RAM size */
+    memory_region_add_subregion(get_system_memory(), SRAM_BASE_ADDRESS, machine->ram);
+
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
@@ -60,6 +64,8 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
 {
     mc->desc = "ST STM32VLDISCOVERY (Cortex-M3)";
     mc->init = stm32vldiscovery_init;
+    mc->default_ram_id = "stm32vldiscovery.ram";
+    mc->default_ram_size = SRAM_SIZE;
 }
 
 DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
-- 
2.37.1 (Apple Git-137.1)

