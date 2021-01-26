Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1644819lfd;
        Tue, 26 Jan 2021 11:33:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3gTaHzEYiMdZtTMocArUMU58xXrq0a+hQMRnvIpInTn9ongtJT42UsT4iom5+/Ohtg/1n
X-Received: by 2002:a25:4216:: with SMTP id p22mr10227431yba.266.1611689627718;
        Tue, 26 Jan 2021 11:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611689627; cv=none;
        d=google.com; s=arc-20160816;
        b=T2QxjRq83ETCj7Cg6gMdEXSHPdCDv1GTW+G7yMfLyoWlCJl4dnb2OGB9mH/g/5DQ9W
         Jvxc1v/4lhmULBL84DYdLvlwU/KpBCK2+jHgqmQKV2JAZxlk/Mj4D3wUGwG3KOyIzyDH
         RdhSLFN0y8JotFfkUeaQFc1Doz/c5v/ofGLijZoxtzedFZdhglqPqRsDc7qVCHfsD7GY
         InnI3liUnsVB2Igt/M4SfzvZd756F6EMSq3QdzZZ7vPt0ajj9cr/BdrL4j/nhmybeI7p
         A1W4PpvNk8lDqrvjs8Wfy+0JnUl/2wLPTkJiq5b6HmzWzgvc2VM0hBf8UwBLgxx6TlsK
         1XSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
        b=u4T/dIAwUAzzX9hEh1Rug/ll1wonhhY+jvrQ7R+rsmMKekTO7Q3PPDsLoapeUj3qHe
         b0ZRVBIxLnR6BIVzoyN9st12r3EC8cZKAiTO74vxdNx59NyKQyKEFXt4OL7lNKWJMw3T
         CIVfu20IgxIZBdLXsGjbeLeHM4LVHgXh2Ivb8CoHvKJ90vNWz2KOtl32AdA4UlXzTqM1
         wv7ch0Qr7CYPA6i5VKBID0bpao/fijP7Ty7I6VqAjOh9Xfv0ul0C8AWqTLYw/FI/Gjzw
         fnRE1ti6u8B6nEaTbaBRok5NqvbJdQC/dw+Lwew9RO57onou0xARXQkgpt4tSjj6ye05
         XlUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=uU0WUUwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si17915428ybt.163.2021.01.26.11.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 11:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=uU0WUUwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4U5z-0004X6-0D
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 14:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZW4QYAgKCIoA8vo276vu22uzs.q204s08-o50121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5G-0004VZ-Dg
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 14:33:03 -0500
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:51527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZW4QYAgKCIoA8vo276vu22uzs.q204s08-o50121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5C-00046C-CU
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 14:33:01 -0500
Received: by mail-qv1-xf49.google.com with SMTP id h13so12178348qvo.18
 for <qemu-arm@nongnu.org>; Tue, 26 Jan 2021 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=uU0WUUwpdX3IZlYrrj1mvLpU5jPBGleS0tjUfD9ccfsMVIzHNWrQ4+unNqiyKMfFyf
 wmUrAaQ7tBG328TbAIVVz0lmUZTF8CEmdAPoTp11pt+eV/4LXItPTRo5b0XIVXZRrNIx
 poD9iliNfKc5VvMOtbn5lXkRkTmHJZrVvNV5XZHgb9mIEr+SF2c+r/UAKAELs1Na8Vw2
 WEiuejXlLnA4ftPZDBGvsGq7bdLxzuFI0vpdVWtM0eQCiiFGWzViErbdCVvOVnsbBYXJ
 iVOLyQgl5xshDtBEH7Oi3wg4CHf237BsLi03eUF/OL0pmQL5qDDjxMRGYPwwk3vk+u5r
 KVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=O4SVWvTRppR7hGkOcCmkb78sBBIVFPQX7Ert0D+wR2b+JrmGEhLIDLhgvsbw7szWrg
 zOM6XqvWJORAhKHOiLwXdsNLytVL1rNUCPz7+aDEHXeV0HQUpbrHLMZjJFzDcjV5KRBV
 ruC4bReRDbyct2cXZC6zP5OyAF5ElDKEHwm8XUjTAQFUvBY63EKaX86bHdKr2OJkcJ6K
 2iKE6CB14YMEW7pTbGFkMTols3PZOtNeXljcnXjdjFlDe73M9AN9KwVLnZl2X+MmkQUP
 RAYd6Dag8FzeIgp4O6hp44jV4wjC+RI78mEFKjcLXuvHxFH1l4/MAO1J7cjFr/oROuh3
 7Wbg==
X-Gm-Message-State: AOAM530oH2Oh5hcdbUg7qthowtivgGzXusXnA8CCG8fMqh2aiTRmQ7uY
 nr/+DdTTmCPeTqplv5AHr1wsleRpxMGiSw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:ab1a:: with SMTP id
 h26mr7122375qvb.26.1611689573821; Tue, 26 Jan 2021 11:32:53 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:32 -0800
In-Reply-To: <20210126193237.1534208-1-wuhaotsh@google.com>
Message-Id: <20210126193237.1534208-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 1/6] hw/arm: Remove GPIO from unimplemented NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3ZW4QYAgKCIoA8vo276vu22uzs.q204s08-o50121u18.25u@flex--wuhaotsh.bounces.google.com;
 helo=mail-qv1-xf49.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: zEE6kuLJsiod

NPCM7XX GPIO devices have been implemented in hw/gpio/npcm7xx-gpio.c. So
we removed them from the unimplemented devices list.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu<wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 72040d4079..d1fe9bd1df 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -576,14 +576,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
     create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[2]",      0xf0012000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[3]",      0xf0013000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[4]",      0xf0014000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[5]",      0xf0015000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[6]",      0xf0016000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[7]",      0xf0017000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[0]",     0xf0080000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[1]",     0xf0081000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[2]",     0xf0082000,   4 * KiB);
-- 
2.30.0.365.g02bc693789-goog

