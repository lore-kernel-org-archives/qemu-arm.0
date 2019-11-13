Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp3426965wrr;
        Tue, 12 Nov 2019 16:53:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkNknMtrszRMDH9kT4JfmnMCNSZqAdb8yeFvpLo1HJzSWLmceFwqtLYqcYPlwWVtIyqiEg
X-Received: by 2002:a37:4ccb:: with SMTP id z194mr302098qka.128.1573606390736;
        Tue, 12 Nov 2019 16:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573606390; cv=none;
        d=google.com; s=arc-20160816;
        b=mIuNfxOl7baPwm2/tkGlQAICWsQFEmlIwyM8/kDfg/TYLg0Q+Ng6QbW90xpo8vT5rL
         7tsUmgm5X8XVejFUfZCYnMrEvC5qz0kvM1NtbMvGcCl2DBaiQv+V3ks9VNjRuIaFu/gp
         NN7s0d0UMeF6m4a73KYgquOuJcWzPkZd8TAkqFfFhnagcYseescHmJtQ6rb4WXDiq4eW
         aXp8O8pP3Cda3ej2ijDGkyGvmX9xUVWSsv8vI7n0VAaF5fVCcOclBlPq84udIdHfQIkT
         HYe4+Df+NWIcZTpCJEJEmxBKnSslXAxf06HAMH16HEpG+Ag63D3ioCVVB7WJVfdJWUJR
         2pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lmFvZZZEGHi/jNPzB8Fjz4VckveQEY65n8jFgmWLQrs=;
        b=FMerweGkC+Jo9pQbMy2t2gA9fH0i9tr7sNg7XqRj+rCw5JnTVYJFZgWaL3q95xS6lL
         Lw3LhM4vDc6V5dTAXgs12QiJNZUWCG4zfnwwE7WhXWxa/okPF/XH7GIxe9N8TKijg6S3
         0m7svVLK1Fnfu66Np7M+Hm/B9pXA76TeAYqLeHEEQHni9FagQLGBJC7oBfsJr3V8+Qqx
         ZU3NoM+ehRAxZEDdVvCa46a+EBKlRo5B8Sogs3D8L6LwZCV4nehj0mbGWtJrBXqqjHSV
         dmBCPl51byNzcx+18nGKuy/73V61KAu5AMdEWX9RplfeU7yi95oF8NLfwzph6UgPZOP5
         VK3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cjZLePDo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si265628qka.21.2019.11.12.16.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 16:53:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cjZLePDo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUguE-0001v1-5g
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 19:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtM-0001NL-1u
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtL-0005Hh-4U
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:15 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37720)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUgtK-0005HW-VW; Tue, 12 Nov 2019 19:52:15 -0500
Received: by mail-pg1-x542.google.com with SMTP id z24so172447pgu.4;
 Tue, 12 Nov 2019 16:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmFvZZZEGHi/jNPzB8Fjz4VckveQEY65n8jFgmWLQrs=;
 b=cjZLePDojxTtnAfrXn6gz0h083D/nJMCELvufI7vORDlrOAy0wWlMh6k2DjlsgGfQn
 ZXEFkMAKYM2JmqLMdNbYcJ0jFRryIRyXMlMOr2nqsn6hXUB2OlK1xYQcDZEoU9UV+oTq
 mcapQVvF1cfnOsAzCrQIm6IJI4irBOZGPcJXqNLK9ax3gbEtKOqrs+mdJcaIUDU7npIt
 zBRFypimS5uj00visXxZnnrlqVrf7kXksV+Y0XA4rXSgK7zccKIfSk3qlLizi/3vbFi0
 MtHxsfpJkDYZQDcF+viTfyXZyV81fNKE048APNTy6lWFTswCL1iNh5ym165ujTExXiLI
 Xn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lmFvZZZEGHi/jNPzB8Fjz4VckveQEY65n8jFgmWLQrs=;
 b=ezetE7p+GxlOL1xf/yNrNnQKuKTpweSEBWbWDrYoyzEHEA+IaRILmDx7iB0kAOfFxU
 T65jqHHOZtPsnJtGC9PoL1xJpy3RnzUEnjOj1Tc4Hy5rfkHNrtkBLLxgHIpG4zO9sUMb
 dvT4fGPJcjrGhHDoud5bjGHI6sNi0HYP5l8vgcTU7YfyXTa1apOzzJaZEV48Zx0PKxf7
 Bd19KX0aozLJCHM+e0HBdI99IEyrenwzL31aNxDaeUQmyhs9a0KlxTscX30W/Gt9vZbh
 PXdDTc4ECNZd3adyj+CwUVeoOcHHMkgHkOLsJf3zylmwUF9xzpgXgCyuc6xa/iKi7ZMi
 HLmw==
X-Gm-Message-State: APjAAAUam6bSoelSHfamNAdnB3lyAlrjfHMoU9Cs9dPO2XxyConatHzh
 e611UT8ybP/oaj1VQOqxKSQ=
X-Received: by 2002:a65:5542:: with SMTP id t2mr478788pgr.74.1573606333758;
 Tue, 12 Nov 2019 16:52:13 -0800 (PST)
Received: from voyager.ozlabs.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i13sm169848pfo.39.2019.11.12.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:52:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/4] aspeed/sdmc: Make ast2600 default 1G
Date: Wed, 13 Nov 2019 11:21:58 +1030
Message-Id: <20191113005201.19005-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113005201.19005-1-joel@jms.id.au>
References: <20191113005201.19005-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I/guhBXxT5CZ

Most boards have this much.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index f3a63a2e01db..2df3244b53c8 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -208,10 +208,10 @@ static int ast2600_rambits(AspeedSDMCState *s)
     }
 
     /* use a common default */
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
+    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
                 s->ram_size);
-    s->ram_size = 512 << 20;
-    return ASPEED_SDMC_AST2600_512MB;
+    s->ram_size = 1024 << 20;
+    return ASPEED_SDMC_AST2600_1024MB;
 }
 
 static void aspeed_sdmc_reset(DeviceState *dev)
-- 
2.24.0

