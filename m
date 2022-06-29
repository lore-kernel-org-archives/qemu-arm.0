Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp416420lft;
        Wed, 29 Jun 2022 05:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlu+dF9B6lUPXk1gzId9HFozaEmxpENSJhbe5XTeMXsU85wvEouE816gXXbKS8CIWt/Pb1
X-Received: by 2002:a0c:90e9:0:b0:470:3c64:668e with SMTP id p96-20020a0c90e9000000b004703c64668emr6426507qvp.124.1656506790710;
        Wed, 29 Jun 2022 05:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656506790; cv=none;
        d=google.com; s=arc-20160816;
        b=tBx/0Olmsc0z6Lte2zpCI2zUNOD2JAu9Jkt/4jZZbWI2aF1pOpELwY4scycS5UJbJ6
         B0D56Yz1cYKihV0p/ZExTdLSyi13JA5QFU+pm42bLqrRiWCo1nQfqZeKMV1LAA5Ek7OG
         SAt+mTx7yeXDQd/UgcC43fRBBbdw8itxYwG2LBId4hsSMMXvQm4dz/649q9aKu4Q7G/s
         /Vo67eL5cmt1cwEpv3wP+5bainJmSSHn6Avoj+hm07YxflTq++sGKXta+SkufPesMLEr
         Q8INskgvISTZGPb/pugzuAfZCmlD5aJmWx5LMfsFQU6+7PPSn681Z7gme/23dJJwhN7n
         +f5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XWxdtZa/vHPWbxGBr/IVfvv+ogEgTzFX5DW2i2afdpU=;
        b=YFtzZ+n3Qw9vnGfC2xgobVGsDI3Yjus9YStmu3IUnS7hYE7bPPRgK6yZ9jVJuRWp32
         eC/weHSsPYYDsXseX5IDDXmgw6we9m8Lfg9mwdEAwEB+Cm9hSM1xojrMK/Y+Kb9AJuQu
         4ArLAwfViZI0/mFAdVKgSlVX7mPwE4VlH8/ciYV3W1qdlxoNo5kgzN9Wr7NP395e6cdY
         7aMd1SiZIv8CYHzVwySWTiYrrGE4SJ7AEWZgtHAwrbzQu3AS6teH5n4/5tIa1FAyXp95
         bHuYw2lHet28fh0EO05ubpubWQ8va9/4KM3nnCZeTllElYsIaFPWlPOiqUTXDPRH4NHi
         g/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="x9DxHN/I";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq18-20020a05620a469200b006af48a7efa2si3357180qkb.560.2022.06.29.05.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 05:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="x9DxHN/I";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6X5R-0004Yf-W5
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 08:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0B-0007cc-19; Wed, 29 Jun 2022 08:41:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzz-0004co-PY; Wed, 29 Jun 2022 08:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWxdtZa/vHPWbxGBr/IVfvv+ogEgTzFX5DW2i2afdpU=; b=x9DxHN/IUpo3x9S2nAFfU7GVA8
 13o4FBa73rMReBEdOs5OGGBO7C49TwRJPqlJzmvP3ZC+RDr7tFexqwh9XOIQRcX6op8HEVsbe6hbG
 +E7rjGQROaLThkHy6YSxuKn7qbjLSOwk0XrXf9z7QU45DVrLq0Oga8xhtZrjCSEm1rH/43+9+/FsI
 uKfKl15nDPkk92fF4Q2pnaYEIUbH9mN7gO9QCvy3L3KT4TPp6nOGYExDVrfR/xgMsXX5/5qWiyyoe
 NBUfXmrcPIxJcJbXNg2Y0IA/3UNFUsaSJSJhm/cxXEq8KQ1ANXu93FKQUnWsiZbOSuqFcj5Cj3MQm
 pRP24+yZByqWCkwSNK9YUbRfD21PKBv5nSZe7XaNNQIYnnsCKP//aGdv0I6BvbS4prbzUyyH9rRkG
 WJvwrArHh8K/afNSLUKQCETHHDPEM13SW8R+W7rq8ITgaWkQJZpVZaFciYN2Huz+wZcyxxZ+pF8QD
 x4b3Y0aejrqdatcx/xK9T8HHTknqT0GWfLZla3MQFe9L3T1mj9vKgzXw8cheJJM9MfLIr33dlLDsi
 cBYZS5nyqKvAQ5VvRS4rbLWWEYLo/HRzPMaaaNgr/TDNo8jHIeNdjT23rCCuPn7zLcdjrmJHedHjO
 cR7LP0AmcyXNw7Zmis23/Cx2pZUYVvTh/ztqRm8aQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wye-0002tZ-Fs; Wed, 29 Jun 2022 13:39:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:48 +0100
Message-Id: <20220629124026.1077021-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 02/40] pl050: rename pl050_keyboard_init() to pl050_kbd_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ouxgUmYKFVdE

This is for consistency with all of the other devices that use the PS2 keyboard
device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index c7980b6ed7..8e32b8ed46 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -166,7 +166,7 @@ static void pl050_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
-static void pl050_keyboard_init(Object *obj)
+static void pl050_kbd_init(Object *obj)
 {
     PL050State *s = PL050(obj);
 
@@ -183,7 +183,7 @@ static void pl050_mouse_init(Object *obj)
 static const TypeInfo pl050_kbd_info = {
     .name          = "pl050_keyboard",
     .parent        = TYPE_PL050,
-    .instance_init = pl050_keyboard_init,
+    .instance_init = pl050_kbd_init,
 };
 
 static const TypeInfo pl050_mouse_info = {
-- 
2.30.2

