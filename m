Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4729587lfg;
        Tue, 23 Mar 2021 10:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAo2zm5NKcrpfPABNg4rQdV3YhFL9gANPWGmTST1XbLRPqns5eS+zaQE3r4P/QKl42RT8S
X-Received: by 2002:a05:6e02:219c:: with SMTP id j28mr2748244ila.229.1616519409338;
        Tue, 23 Mar 2021 10:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616519409; cv=none;
        d=google.com; s=arc-20160816;
        b=lOZAG5VnpFfbQ+1PCHAoXLdN1HMjUxARlaDajoZ7eRH5p9djWl93l9Eib6fwRwNXre
         jTkIcM5m7YvpnDmqEEWIzEva5n7Y96cplCjm0Zsi8CdPs4Nn+qe+ZeLPtrS9y55Qyru4
         XdBbLQnTZMlqqONYG9aRUqAiMu9w2n2qorXg4kAfMm+8CoR5y9iY4HyNb+C8ef9DRlKk
         8P/HP4qc9QqWeZLPezqj8u3SKUp6duNLDjj+88iy1g2Y9UCheVGK+IbZu2uTHw3M5XXE
         SyrwbR+QwnYW10E1MkANOlSvWA2yzcOhuKKIqGrqgucwiQB87mfNU1w6692d3pXyIH1Z
         FYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HbrBNw1rZqrHPhviLRhW2PghpzAbcjm/RCgXT7DkNTE=;
        b=lSzcQJfuneQxUcENkjSH2qi4jIDBRjQkPJDB1b6bk/Q8vD3BkIg0HtNFd8VxGYtss4
         dSJy0OljmYeIfUVXFVVEnqYWagpFDoZJmXyUhxQyS+kZ09aj48Oz3asUt8H9OVvGmztp
         BjL2X0I3ysYnzN2q3KZX3I99R+GkMZ8IOynubR5dnLJgRusmwWDaAlKFHSEfutNvK1Hj
         6ew0U5Uu2ksGGSd8XVHsADffWG9iLi6XhDljvvNe1LfAn7EHTyc7xce42Jn6w6sDkKZz
         JX75zI7Hmpdm1IwWDsSCTIEp4xX4tgxmi4RfQYunIrCvxAGbHiNbE6XJRMj69yr5m9S7
         zU9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ksj7LqJz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si13041380jat.122.2021.03.23.10.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Mar 2021 10:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ksj7LqJz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOkXg-00049O-KY
	for alex.bennee@linaro.org; Tue, 23 Mar 2021 13:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgP-0005U5-To; Tue, 23 Mar 2021 12:15:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgM-0007jb-Hp; Tue, 23 Mar 2021 12:15:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id p19so11375800wmq.1;
 Tue, 23 Mar 2021 09:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbrBNw1rZqrHPhviLRhW2PghpzAbcjm/RCgXT7DkNTE=;
 b=ksj7LqJzTbHlc44lYx65DgjFFrEo0PpNto6KWjJ8hJDLOo8wT6DD8kTDuJx6Sz7EDC
 kYHDZkngJ3w9e02yYndhWgb7dEf/UqoVGJyUz0rY3qthShyKukGfQHqTwl7u0LqSH2u5
 2JEObyuBt1hx1uB5+LcU94FCSs9Q8a88IeNGFW2aX4y9ZwIaGqmhZiukbSo3W+Avh0Hn
 JZt64uo1ZFLX8GLQIq6L7qNhHFGM77OQY8/iTdIl8ev6Q6tLVuEKhv+opHAZ3f2g32O2
 WsUc3pyqrCkwZNtwNl6A9IV5rVtp/FJntZdn7yXvME4rV1O5MvE3DbPWfAg8ntB6JXgz
 QGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HbrBNw1rZqrHPhviLRhW2PghpzAbcjm/RCgXT7DkNTE=;
 b=tcS0WwrI8QQlB7lF/SfFHXE7NzyFVsuYW1eZVclTq54FR4jN2NkBF9ucVnD1WI8ITH
 YsdHqEvZYieG0s5PqM+u1fyYb05rO5GEI8dKR1aESMwzWeigQ27xvrTGh4mWtLUPhPTN
 Vho2/cKiGobFopIEW+IawjGPlstpYEyB4JN6qzyCLoL+PiBoW/EcqIj5V8XhFvyCmsFr
 aL7g133qonTwqZEUbHm+wUVkQnWIq6W1wzghR9s2fmOus/1txztVSeJDlzporNTWkn9g
 T9VT/GQVbdQjJO6ajqW8N/oOSZnCLE1Rw246gjWKqucSqJih4gImLBFs/dIN1Ba1jQ+W
 bhrA==
X-Gm-Message-State: AOAM530OCh/oevVJ/F2354IfbuGxzr4nBWURarC4A8ERJRFbFl9iMjr+
 zJ3/UsTqNmDiR29S4nKv7nYaUoCf9m0pjQ==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr4120750wmc.59.1616516100617; 
 Tue, 23 Mar 2021 09:15:00 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm25364270wru.85.2021.03.23.09.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:15:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
Date: Tue, 23 Mar 2021 17:14:43 +0100
Message-Id: <20210323161443.245636-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323161443.245636-1-f4bug@amsat.org>
References: <20210323161443.245636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J5vOIS5ewIjX

When QDev objects have their DeviceReset handler set, they
shouldn't worry about calling it at realization stage (it
is handled by hw/core/qdev.c::device_set_realized).

Remove the pointless/confusing bcm2835_fb_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index a9c2e57d1c6..d7a44771c44 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -421,8 +421,6 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
     s->dma_mr = MEMORY_REGION(obj);
     address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory");
 
-    bcm2835_fb_reset(dev);
-
     s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
 }
-- 
2.26.2

