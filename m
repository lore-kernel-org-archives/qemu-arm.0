Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2192048ejc;
        Mon, 9 Jan 2023 04:04:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXudZKTis4sqyQSbKPathXYS3RsgB836C9b1nm4n4z8YQioI9H7JA1EClPleeDIjJmRpODyu
X-Received: by 2002:ac8:4a88:0:b0:3a8:15e2:a068 with SMTP id l8-20020ac84a88000000b003a815e2a068mr88735501qtq.4.1673265862854;
        Mon, 09 Jan 2023 04:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673265862; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLAdgZjbqtnDrIjG+O2qV8HYMPtxMdw8eflMBgwP/1Fc3oQtDZ9WMUDN3xizPwQq+3
         1MO0G03mfd6J9a0tbL8Nbd3HZHfJ2dVTEnYflYt0N3x1VaFhiHSgo7IOQW83zA17/Dwh
         c8015bBliXvLgM2ob4OYoMPhLsHYs9plpXK9aZDvcSQ4XANqQiL4jOqeUKXRtnouMtTX
         9GG814CBPSlJGo92gHLdJtPAQB+m7U0LXD/crImyJs6XhCGrrwjCpckTU4Eht69jE4na
         pnrizhppZiXdrsICC06j6fmmcWWU4eFyBz9lyVXP/JS8jDQ9Y5DDEOlXgfwJiB/qjdJt
         1sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FDVaRNcO9+ny7tdAgMwhPc41lYorsN/VnELvXWwWtQM=;
        b=j7s02lUlS3lGg90gcIomynhtxSpEeRshX0S75RAA0YAiv0ix68Yn/SMllr+YmZ9d1H
         BzGZPKMKpHvvGZz3kBG5bXQI9itujEfIhva5f/cd+sAV7dcuv4L9BzseaHh75nmX2pq7
         7ZsPxUE6SneJls9GHH0jFJ6ZbNEBC4GP+jGjsXHzCG6hqDq+iqq1sMtLTVe/t6rTf4O3
         3zCYNAJ5keR+03ps/o/fcW8kt1EBhCSEZj2ez3sYIvwNitNWhA5MQoFA0/UmcjLq/tbg
         NiHZ2RYmPW8hCxdfx6ZkTb3xEgbB17KzaSXN9fX5/qKTkn4QxKMYgB4u/CK8xus4iM/n
         SA9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2xUZEX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020ac87285000000b003445b710d98si4332700qto.350.2023.01.09.04.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2xUZEX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqjL-0003ME-LG; Mon, 09 Jan 2023 06:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjK-0003LZ-Ab
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:18 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjI-00085p-P8
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:18 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso3510248wmq.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDVaRNcO9+ny7tdAgMwhPc41lYorsN/VnELvXWwWtQM=;
 b=O2xUZEX5hwRpCQ3t3VFkygUGb2Tt5aept/9DhS661DHH0Zr5tiQt9VzVxmWQTJQIC5
 rsKgfFO9kAY5W0VpjyIucaFalJziGQ4ZX0SvL+KfAt8pu14H9VRRCLgVGQQHJili1+Sr
 TgkePgcCvgxIbUXNpW/lnjOlxJMo9HqwdY4IRTMHjCwj/qYvwIN/xd6vxCk5ExpyoJYZ
 bxvm6JZzxeqOrDeia6VeRQCmGYfGaSgVg1uODZViTwHO0eDk8n7wRpinYNHeXLQP0PsC
 bxB7ow8c019+eOqs2hplaHHnDI/9XXGyhMJmUp+gVHEib+POerWmcP7VR++vMr0xFQou
 MygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDVaRNcO9+ny7tdAgMwhPc41lYorsN/VnELvXWwWtQM=;
 b=YXZ80ngDeZ45pNBSwutaZWby7CwVeN5gFBxAq8ObAe0USQmkdyyz79YD8lqaDMCI+n
 eJ6TMXxRS3XuMFucwraQNVzDW3LNHols7glu3uEDLUcS/ZqM0cWElaxa1TS6YFokdILV
 15jIoenfTK/1Tr0EF7l7tu1nWvSbn6V3wjQ0c2gC+I1mUlRLSoJayjWAcelQ/6naW7EX
 3IBwMEG7BN5jIb6DujoV/dhJDjXT+5c5hiLlSh0rdYGE9x1SFd9lhg7bAq7VcH7pTj71
 jWbtNswS3ZLltc2dkvoUUWZXmN4ryAmU+YzmwFa67rTyMes2G4vANEIiFoQRBSsCXVSR
 UeWA==
X-Gm-Message-State: AFqh2kq0Q87lSaKMlMbBHniAOEuXWNnDnuK1LgV/oXeGFJv2jwvj8SXl
 cYj+Rmz/wHV3QuEl168AMvNhKQ==
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id
 s5-20020a05600c384500b003d1caf13f56mr50679684wmr.9.1673265256106; 
 Mon, 09 Jan 2023 03:54:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm5158895wms.1.2023.01.09.03.54.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/13] hw/arm/vexpress: Remove dead code in
 vexpress_common_init()
Date: Mon,  9 Jan 2023 12:53:15 +0100
Message-Id: <20230109115316.2235-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
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
X-TUID: mpXWgSpV2uk8

Upon introduction in commit b8433303fb ("Set proper device-width
for vexpress flash"), ve_pflash_cfi01_register() was calling
qdev_init_nofail() which can not fail. This call was later
converted with a script to use &error_fatal, still unable to
fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae6..757236767b 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -659,10 +659,6 @@ static void vexpress_common_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
                                        dinfo);
-    if (!pflash0) {
-        error_report("vexpress: error registering flash 0");
-        exit(1);
-    }
 
     if (map[VE_NORFLASHALIAS] != -1) {
         /* Map flash 0 as an alias into low memory */
@@ -673,11 +669,7 @@ static void vexpress_common_init(MachineState *machine)
     }
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
-                                  dinfo)) {
-        error_report("vexpress: error registering flash 1");
-        exit(1);
-    }
+    ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1", dinfo);
 
     sram_size = 0x2000000;
     memory_region_init_ram(sram, NULL, "vexpress.sram", sram_size,
-- 
2.38.1

