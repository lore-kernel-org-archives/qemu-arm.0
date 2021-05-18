Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp719479lfm;
        Tue, 18 May 2021 12:42:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfEW8axFWGIijmNhCJ/A5I8dr31lm4NsAuehjKNFcNDtnGFoOQ4dEpiV3IT/8G1st378Np
X-Received: by 2002:a6b:690c:: with SMTP id e12mr5752556ioc.69.1621366942827;
        Tue, 18 May 2021 12:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621366942; cv=none;
        d=google.com; s=arc-20160816;
        b=GB92OdsyDOUo5q5EnYvKB44As8vtLgXvaTddiFOt0NJQPG5EgEEp7C8655uJ+9W/i/
         A/LJWZnOohLRb3ovVzY9nAH0JL1kppJQ7pg4FsL6R5NgIqv3NJd/yhKlwzHuajahSbr1
         SqvcjIS1OGxxDdyEV5gRFEZNx50WOf/Fr+Fa3MA3kLOlgS92pgWjoh+r/xHmGpgicIys
         NslfvgcmIaJ5ZstA7pM/7j0Qq6m2zxW3hosuak3apPXI/pGmYukM0YnpCWMu6eSQACa8
         4LKr5jQx0m/6tSC+XyN8h+VgqjfGjs6zobKh9BPB3MV54awEtFFoueIu4nq/7qOV4/BP
         1aIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=dOyxWuIBx/Xq8N62SLAFrwjy4K72LHjzmIiChhjukB4=;
        b=T4N/FffDtmy3vP9kpT7XYvceahpPwJaZcZUMIqDzgOa2D9PAY6Z48BC881mtNTErwP
         NxWq/M5LF4S1luG7O2vZ6azJa8n857f1tMdTHkY8d/IxSJh8661EIuCpNBTyhnZ2w90v
         k+K7xh4xQMAQg15u5J6uUqk113P466jjXKh3bLtZVgI7OTAb/byiwGR8r+wCJaEEIfj0
         Le++gNLlKxy71ymU84GqtX+v6BXWoKNpjD2G4pWezOuzh7AcQk3kGfpCLIEFRIIPRSo3
         DlKWhWxbZrRpoqeikDcwORTtQvtP1QuBLdyO974lpv6sBwOe5q8beO6ArRGTaLIrak1c
         tP4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=MemlwoHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si21961617ioh.94.2021.05.18.12.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=MemlwoHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5bi-0007CM-4h
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3bBikYAcKCDkqZiopmZbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--venture.bounces.google.com>)
 id 1lj5ax-0005pE-Uk
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:41:35 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:54819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3bBikYAcKCDkqZiopmZbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--venture.bounces.google.com>)
 id 1lj5aw-0003aN-E9
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:41:35 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 n129-20020a2527870000b02904ed02e1aab5so14824822ybn.21
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dOyxWuIBx/Xq8N62SLAFrwjy4K72LHjzmIiChhjukB4=;
 b=MemlwoHfXUz/49Tlljb/Zxkafax0rtWVgl8vgSuHj7jRp+QET/GHWHAuXKaL94U0IH
 WdbI8/uFqe4j5mDcHFu9Eq4NzmknuF5Vfg7bfQVAd7qgledlo21q+c/DZCHe+Bb7IJw6
 KhP/q5WJkdZFkpD/HeZXVpOrt7O/25B/VzA2N5yQCVxBW7a+COFuilaB/8QWsyxZQjbI
 WvCAIGaoT4dNPUYMkZvFN7SDntfOodxzEM6eIKLpK+ZyXvEbuvWNuSaqdE991KBJ/Zjw
 RWlBmHjZD94BYcO+4JrVfGYJ68lFmeARbiOWf39lx4yiyvdhVDU4OEFEmEFwq8IDNgLA
 EAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dOyxWuIBx/Xq8N62SLAFrwjy4K72LHjzmIiChhjukB4=;
 b=T7guamSorVTftk60mZXG4UuJPfbLhtSFLpfY77571NKJ9XdyG7OPgyPvDddIZYeFXD
 gMsbuSzQEgomipJkYKwlddoMVq4cE0+kEZQflU/81GiKtvsUNVnMoykiRJo89FJiE9VB
 kxXOIqcKwaOnvsA1GtCBfLDaqTKTWKvECukZs29SAQrHmQqoZKJu1VamoUKHyFZvkpFf
 sc5TE2wERHg2fmrDlvwDi6Fk1huEHQR+gRqMqd30fmzpFGYOJk/7VWLKDjFGr7EzJjdc
 KLn/Xty1qCCLV4bO3GN+tUGQUVj66ia/B6sGLQWthbMlAZq8dVgTeCgpzIcsc6+1N7mI
 zxPA==
X-Gm-Message-State: AOAM532uMuXGQSrtLC1cn7FTqkktxQOi0KVda5U2KvedpQmb8K2hHw3p
 z3J12o0bNCUXvobKYjgw+ZSg6xDyS/x1
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:883:: with SMTP id
 125mr5487570ybi.523.1621366892306; 
 Tue, 18 May 2021 12:41:32 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:15 -0700
In-Reply-To: <20210518194118.755410-1-venture@google.com>
Message-Id: <20210518194118.755410-2-venture@google.com>
Mime-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 1/4] hw/arm: gsj add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3bBikYAcKCDkqZiopmZbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 1rBDLVOB/4c3

Adds comments to the board init to identify missing i2c devices.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d4553e3786..9b7a7cd201 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -220,7 +220,21 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     at24c_eeprom_init(soc, 9, 0x55, 8192);
     at24c_eeprom_init(soc, 10, 0x55, 8192);
 
-    /* TODO: Add additional i2c devices. */
+    /*
+     * i2c-11:
+     * - power-brick@36: delta,dps800
+     * - hotswap@15: ti,lm5066i
+     */
+
+    /*
+     * i2c-12:
+     * - ucd90160@6b
+     */
+
+    /*
+     * i2c-15:
+     * - pca9548@75
+     */
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
-- 
2.31.1.751.gd2f1c929bd-goog

