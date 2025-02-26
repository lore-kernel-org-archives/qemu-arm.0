Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp638249njg;
        Tue, 25 Feb 2025 18:46:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUe6UM2tJcqfS417tATb0qhqcMthio0hakINWnWCZV7YdWg/CxrhwxdPJjHEfB8qRIBK9BahYyra6W/oA==@linaro.org
X-Google-Smtp-Source: AGHT+IGMf5wex4CjkGj40ytLuc8DRtIb1nZbc34dKXX0yZfWMvmPqKrPH5bAWzrcHzZyYbbtHJ4B
X-Received: by 2002:a05:6214:d47:b0:6e4:4331:aad9 with SMTP id 6a1803df08f44-6e886870f2bmr22336916d6.2.1740538000026;
        Tue, 25 Feb 2025 18:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740538000; cv=none;
        d=google.com; s=arc-20240605;
        b=gQLIieOwVNr3ESQjw1tUUriVg24POLhkVnAudU0tRueXML4HRiTO0u3OQ2dn/ZOwki
         SiJQCep+0Qz18Caez0YHE2krToNLXaZSAKzxJBTJj5u7usI4RdTQKMJqRfWIQkKGkM3H
         8mUeyYXJSe2lUdpb1hni7lOqraetDTST1Fk4WjCF+2jqK1lOrFtAHPSg0ZQrkQBe/DWm
         24sfOp5SL5OmlwOh/q3XP5K/1SinNGStNNs6GZE1FggoNCdfh70EXq5dxkkABYzZ5Z3a
         47+4aVKAAo1hGvZbB3cd0IxYNS+XdwfUvQZg1xtOG+p25TXJZR+3ePsvlI/1xZ17BE9Y
         CSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=BDD10EWIJr8w7Wgp7k6xLR05vs09N/QbkM7e/fBevr8=;
        fh=06reTly3/y0KSuXbN7h/fSnQQGAl5A7W2/1gF/XbNp4=;
        b=MhTU9w5gOitKa5kLGlHOzmBKwWA/2V6OGjLEH4YYxAD0Ov2PLJLCgdgYkkkzohmvmV
         ejX3lE0D2JKEoFdKlj0Yhw1giGBk3GKuislnBvFCB3Xcw/WNBv2J0KHlsJ0kehv2KWqk
         NyhgxM2/UniQ3f7sWoGt3T0IQzbYm6OArl9Cluf89n/78mfu3PZ3P/pY6UW+pHgL9uSk
         /nBqZ9YZuipTpYALlpL66k2nG7w1LvyYdGo68LeQMiQXgf/vOiwK2XOlFkP9mEHJOdFc
         GacgfHREoQfNHBGZ2r7Lsg+stF54Gfi5Y9FKCe7J/vpFzJ+FT3e516vQeqmhdbQhqkr0
         mlqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="svFjc/2A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b11ad24si29199176d6.398.2025.02.25.18.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 18:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="svFjc/2A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tn7R7-00067u-N2; Tue, 25 Feb 2025 21:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3boC-ZwcKCK0iRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com>)
 id 1tn7R5-00067b-GF
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 21:46:11 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3boC-ZwcKCK0iRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com>)
 id 1tn7R3-0004XB-Vv
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 21:46:11 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe86c01e2bso246387a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 18:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740537966; x=1741142766; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BDD10EWIJr8w7Wgp7k6xLR05vs09N/QbkM7e/fBevr8=;
 b=svFjc/2A5rmonqrgYNvvcazorgf+aNhdHH9DePdimgIYQLn0cMCZzfpcBuRtm37cnR
 NjjSnwe3kDH/MVGmLmiGDlqnJekj0h1tbfb659jmkeNmWZNElik1A6VEqNd5srM0Awo3
 9+O/tJRQz9UoDvUj5h4IfvsNZ9WABJrAQSDSPFfwhZL1wXpUBLMXMZ2Q2/+MASSvYSnI
 nM29MVOymiZY9jMPUktrHpoU9U36eGrhByjb0l8B6OgeOsMVYD9iODbh8znjV/YUiVXF
 8U6fSw4ufaad1SD48fxsugVmh4vY+4LUv23HHkSvr87YyFtRD5iiJ5f1IRU/P/1N3uEF
 YQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740537966; x=1741142766;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BDD10EWIJr8w7Wgp7k6xLR05vs09N/QbkM7e/fBevr8=;
 b=NN41LIaDhlk2vNh51bnwt84leRBw3QGSkhax64YnzBh5dE9lzXbvwbgKQDyuHNEIVc
 dC78cYkOStMDNLQkJheGXWax3UNmB38PHIqx9aKleyokeXbuNz95HQDDYwBVnPmENrHG
 Fxrsu35EbLwVy7j+B+udtqbiM0FtB6Q1YoB/k31JQXi/53nbiZHPpVjzVmgOSnXyGWxA
 ktRffJNkZjOgRayEkE8YI1jkp+fYJUZuEQmAI2PMP5G/UCNtd+efhzaV6Cx87p4Dm/SD
 9jDqSq6AE85E6JnCdizbaBroOTrotCJIiwr5u1vdYGZOBKWEqr3ntowKQV4VsqsbtY8k
 0Daw==
X-Gm-Message-State: AOJu0YzBFubfPmvBWVcEemE6fvGp7JnTv9tk+Rvc2NTwUmFg9Sv12tdd
 zpiWaxeEf5Xdw9r2uttYeghmzds7jcvq96TCcyxiAcr+5mtnTbrl87pIhvxzEeu2wyXjoLPv8pM
 XIXRo7A==
X-Received: from pjz6.prod.google.com ([2002:a17:90b:56c6:b0:2fc:3022:36b8])
 (user=venture job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1643:b0:2ea:a9ac:eee1
 with SMTP id 98e67ed59e1d1-2fce86ae28amr32848930a91.10.1740537966579; Tue, 25
 Feb 2025 18:46:06 -0800 (PST)
Date: Wed, 26 Feb 2025 02:46:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250226024603.493148-1-venture@google.com>
Subject: [PATCH] hw/gpio: npcm7xx: fixup out-of-bounds access
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3boC-ZwcKCK0iRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 0534NNUZdOBH

The reg isn't validated to be a possible register before
it's dereferenced for one case.  The mmio space registered
for the gpio device is 4KiB but there aren't that many
registers in the struct.

Google-Bug-Id: 397469048
Change-Id: I2fb8d0d3d41422baab22e8fc7e9fadd0f2ee7068
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/gpio/npcm7xx_gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 23e67424c9..2916056fae 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -220,8 +220,6 @@ static void npcm7xx_gpio_regs_write(void *opaque, hwaddr addr, uint64_t v,
         return;
     }
 
-    diff = s->regs[reg] ^ value;
-
     switch (reg) {
     case NPCM7XX_GPIO_TLOCK1:
     case NPCM7XX_GPIO_TLOCK2:
@@ -242,6 +240,7 @@ static void npcm7xx_gpio_regs_write(void *opaque, hwaddr addr, uint64_t v,
     case NPCM7XX_GPIO_PU:
     case NPCM7XX_GPIO_PD:
     case NPCM7XX_GPIO_IEM:
+        diff = s->regs[reg] ^ value;
         s->regs[reg] = value;
         npcm7xx_gpio_update_pins(s, diff);
         break;
-- 
2.48.1.658.g4767266eb4-goog

