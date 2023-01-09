Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2188637ejc;
        Mon, 9 Jan 2023 04:00:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsziM52p+RllvhKyGwYwYySZsTuyBDoLFRNSgiVKEkP7+AqbD8cA6OZraMnFxMux1viJii9
X-Received: by 2002:ac8:4153:0:b0:3a7:ee95:cc44 with SMTP id e19-20020ac84153000000b003a7ee95cc44mr91319745qtm.43.1673265601601;
        Mon, 09 Jan 2023 04:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673265601; cv=none;
        d=google.com; s=arc-20160816;
        b=TMoY/Bz0RGz4zeMo/UPBXohc7w0G+qHbTSA3VP1+Hi5bEL8klJ+nUBnNyFiuvJhsfX
         lzkmgupYgtO8AVlqeHBig34GkvIlCTuyg87RfuGtJJLWE5Y1QUs0nwk0dUHPPcjGh8tT
         trTGUewuDnsDjRUYnhvB+EfwZtE3leHAAHvQPR3scLDePjC+b52NWMTR7sr0pxO0oUo+
         LwsPzBAjOQa4/fQT6xP1wq40M3nVTpB3FEK+fkCpCWb/CQ/SMW5q7nCC586twMShZSxr
         aBkZ4YmoJ6XdI0KgQBRCj8Xh0RW9Lm/eNElnTEAR9F+dgsxRMq4119bN0+hAaJRbAhEy
         bEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=arGDJqPATELoiqCitRXAST5VMx8cy/N7Kqb6K/IJ2aQ=;
        b=PjGc6Pu6eYwDDaY+jww/KIrC4QT2bMJtXyGk9580LWqAZbX0aB2FvM3QTySQGvsAlT
         4CG/J6ZrZ9u15prDjcR31YuXmKArq+vz0oTr2Ct2CbBWvtTKc39/6baTo0lZmC0hMN1P
         T+AVALAA4qBqV89zeMuCgs2YQoBhXD8Pk5k/5fRJeSJV+vDWwxSG/pqCRopUcwgodkID
         n32clf7I2SWpuih5KNxNF2KA3VcpCFcZfXCNksp1kD+Fd1a4EuUFrTuJBl7sPWeg+N1h
         nbzGFc+gk0eIeb20IZK64UHMSRblOexzGOTHFP8d4PjU19HZSf7f1sP9MjlgSa/mEL56
         y0OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y8zzCrgT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q24-20020a37f718000000b007049d89b119si2332368qkj.164.2023.01.09.04.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y8zzCrgT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqiu-0002wq-KZ; Mon, 09 Jan 2023 06:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqih-0002sU-Rc
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqig-00082Z-8s
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6480506wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=arGDJqPATELoiqCitRXAST5VMx8cy/N7Kqb6K/IJ2aQ=;
 b=Y8zzCrgTut6jgjD+2PJJkoxwC8GTlfXoG3Y6pHmori7AkAM9EIXts79gGfuYdKWTnM
 Lp4IfJpjqJ6ygvjqPHSf/FrlJYQ0VTUbWLjg8UMsHdRfLMq41uhL+Vy8KMxCjafgV3l2
 nn2EeN4u+ET6PQaj7MNOoRaea9dmORXobnGLJcHRlV200nrIDq4mRQQTuJ8EhcCTcs/x
 P8L5WuWUPzj7Ri7gVD2iuT68cyjV6CUIhm2utjEzFD6xdlqmOiHYGf5ZOTyPfxnyOtYL
 8zjkVr425b44r+EmKsJg/RdE7u/gn8ZZl8OaG+Q6I/RutHUHEnEg18WRmGh7HT2NYQmn
 6YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arGDJqPATELoiqCitRXAST5VMx8cy/N7Kqb6K/IJ2aQ=;
 b=U2oPdQbICErce7QJVvqXweWbWzdH+JKDi0shxj1FcEZ6sa/OZZOSljJ9pNcg1NVekZ
 dDH+ehcmXewWblN6FY3ICKZbIhVO964eIeTXtbPPTEwkz8yBx826cJGlD/7UmsLf/1my
 nVkutypjUlolmLv1jMXPS1munA7N8QE1/D/gFaios54Xeidrv7LjTEXPAPMXJqh9j2ha
 DVDUjBrKfe3bjBF6iqQmNJmkHjWbfZBHsyg/ewLvEWbihydbOmKCNL8ZYdjt1pixPkrF
 iUNNK9oRRMHCnxp8FEIwD7/XAI58+tbfNgSzWX12PD3wU9+bn3V4isqUSbH51X3MpJyH
 OGZQ==
X-Gm-Message-State: AFqh2kra7xMN+fUywgn5hgWUJGwMOdnyJpWvN4NzGdJBDh10bf4id9zx
 l+BNSUJqpjxH5Fq5RgU4o24MH0cB16f5xsdt
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id
 m8-20020a05600c4f4800b003c6f7ff6f87mr46835458wmq.11.1673265217427; 
 Mon, 09 Jan 2023 03:53:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b003d98a7aa12csm17525389wmg.16.2023.01.09.03.53.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/13] hw/arm/collie: Simplify flash creation using for() loop
Date: Mon,  9 Jan 2023 12:53:07 +0100
Message-Id: <20230109115316.2235-5-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +vF9O++1/Q4t

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index d59c376e60..9edff59370 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -40,7 +40,6 @@ static struct arm_boot_info collie_binfo = {
 
 static void collie_init(MachineState *machine)
 {
-    DriveInfo *dinfo;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     CollieMachineState *cms = COLLIE_MACHINE(machine);
 
@@ -55,15 +54,13 @@ static void collie_init(MachineState *machine)
 
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
-    dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", FLASH_SIZE,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
-
-    dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", FLASH_SIZE,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    for (unsigned i = 0; i < 2; i++) {
+        DriveInfo *dinfo = drive_get(IF_PFLASH, 0, i);
+        pflash_cfi01_register(i ? SA_CS1 : SA_CS0,
+                              i ? "collie.fl2" : "collie.fl1", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    }
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
-- 
2.38.1

