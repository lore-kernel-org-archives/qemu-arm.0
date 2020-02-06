Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp813080lfp;
        Wed, 5 Feb 2020 17:21:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/5KrORd8jQGxlfKZVBWiiiSDCeK228Dxo+L1EnJeAQUvliLwIuDCFVbeVlXXtI5A7fLIH
X-Received: by 2002:a37:b82:: with SMTP id 124mr509757qkl.18.1580952117267;
        Wed, 05 Feb 2020 17:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952117; cv=none;
        d=google.com; s=arc-20160816;
        b=tPst2XtI+IQiY08VXSuc4Tr+dJ+Y2SYK9oNO94/jbS42RMT9eIeqbQSbPO9CNjImRz
         roU8Wtz9R7KS6NGcO3jrGcvMgjle4QgqiS26XeiT6VmB/2w+Rge4KkSWRzMbYL2etic/
         phbw/paa8nABx+Ih4MZf6E8kVs6zoetbiWKZhyLksTrapTL8HYNqf5T7ubuohikf6Igd
         B7bzG5Bf+444dPS8Ln7LMlLLQ7sjdqwxmbVH8laxBJN506ZDMaKSVt4Fw7+hnTDtB9+o
         7rM4dcx9CELFX6X6JhOIJP9R45ZVNf62qhmm4duK6NL/1unE043nC++U9xDKhqlWqpig
         frWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W2XB7avCzY/On5eAKW5ymwIRtI2E5aDh8P+f+vF2jdQ=;
        b=RT5kKjkygAZ6w7ZJMfoiHBitAWN0QrFuaLq93PI0ckWstl9tTWB5Nu8dFLYNdP0cZE
         qA7nIr8guRcbbMpuaJMJrNGbh39+7cn0PX0qrFgbqKC9zQPVIG600MyorBo69+v91m9Z
         CLA6fewuYJtNAUCjd0adcB8wxdxkiq8xwS7UNbF/9uZjsi1NMr5lGuoG4kIiSsD1sljH
         hFICIt7XaK3f53HpDR9eSy79JjCtE5N1Y4uEBjV1tBLxpKREtxyHeokuV3OT8E/XQgTL
         /pHoaEwkyJ7BBVLnquLw9zcnuYpRs+8MGPxAaGDm7o91xdIc8vBCh0t78nAh6oXpHIZ1
         TvQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jyc0WFcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si803818qkg.63.2020.02.05.17.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:21:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jyc0WFcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVrg-0005Ym-Jp
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoA-0000P0-Uk
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo8-0002MM-US
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:18 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55406)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo6-00024a-Na; Wed, 05 Feb 2020 20:18:14 -0500
Received: by mail-wm1-x343.google.com with SMTP id q9so4473833wmj.5;
 Wed, 05 Feb 2020 17:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2XB7avCzY/On5eAKW5ymwIRtI2E5aDh8P+f+vF2jdQ=;
 b=Jyc0WFcrxYoKMiOxbcPKERxqQug5mK3/ZyHPNMIW3WFOT8LxPxDcBO17kVpLJlFFIE
 4hy98q/k4tobPbyxRmDYCWqVd3AxL+HNRy2kLrN4aGUITPthE4J2AZtFqdOFaZaJsqMp
 YY48MZOeKrlqYc1NXqgfM2OvT1RfwQGbdeMfyJk75HBvYkmvvHwXhpBfmuEBSfS2FOdt
 dldFCXO47BnmcK/55UWFP/oo1i7W8qY2cWV73FrXLRzqmmXdG2k9w6otEy7jIN6wSWPA
 o5KpxF355R0rFOmcgP0u6dphHQ2iPGPfg4T7UfCrGZnFkHoGUvaCk65gzNTg9APHTDqW
 fGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W2XB7avCzY/On5eAKW5ymwIRtI2E5aDh8P+f+vF2jdQ=;
 b=Res+HPN/vS/iPwE9GvYW1SX5NhA7o4lYVKNHHxmWBQHiQuRtXR0W4bQ0UPGaENIFFF
 r+bF7BQJRg7bfPrjMXqNjgCtrAY8PR0s3N62Mi2HMksA0syHG4rlv0Lo90ft1eGR6y9d
 IWYIs48t++rVTm7AknrvpwpEns6fdcmjDoGmykKjIAkxXuFqFzSa/rIKAjQON0WlUmqT
 fHY7JFW3/qXqmlmzmmd4AMO1Lz1hfxErbjDKPIkpo3lYYz76fnmYiI136ES3+NqgiVdK
 T76jzl8VQXytdxXCd5mg5zPxInrrcdaKWrnF51+kBbpE0XFxe7+pi2dfXv5rkSX9uB6o
 p6Ug==
X-Gm-Message-State: APjAAAXCu5JIvlvKgezNJGNAroQURNQlad355xSPb37ZM2PYNvEVWq0o
 aFKW+dcaWrbu2Ydw+cYMrz1HmLdj
X-Received: by 2002:a1c:e488:: with SMTP id b130mr606177wmh.108.1580951893551; 
 Wed, 05 Feb 2020 17:18:13 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/30] hw/arm/raspi: Trivial code movement
Date: Thu,  6 Feb 2020 02:17:32 +0100
Message-Id: <20200206011756.2413-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, Esteban Bosse <estebanbosse@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmo7U5rzbDN7

There is no point in creating the SoC object before allocating the RAM.
Move the call to keep all the SoC-related calls together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 20195227eb..fab361939c 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -226,9 +226,6 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
         exit(1);
     }
 
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            board_soc_type(board_rev), &error_abort, NULL);
-
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
                                          machine->ram_size);
@@ -236,6 +233,8 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
     memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
 
     /* Setup the SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                            board_soc_type(board_rev), &error_abort, NULL);
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
-- 
2.21.1

