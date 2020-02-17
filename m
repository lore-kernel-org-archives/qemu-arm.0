Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5418923lfp;
        Mon, 17 Feb 2020 12:48:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5mZhhTgWKOHpRaimsZShrjJ+8dNo29z2q141vhtj9HmbG7wZfgmgfhK30lcVkIdfY32G7
X-Received: by 2002:a05:620a:1273:: with SMTP id b19mr16147949qkl.482.1581972527013;
        Mon, 17 Feb 2020 12:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581972527; cv=none;
        d=google.com; s=arc-20160816;
        b=T5uVlDDk7TLxocvRvxwoLPwrgZ9hjdNi2zVlDQ2A4p6t33mYvqFhwQz+V6zOpgwRUm
         LpUWKPh72dJ30myesE/SNf0l/caKPb5uy14IwScJTOeIBCHO0rgwOe71Mwp7PjbaYHYK
         +NZDVVBngu3DGoBA1DP8MGT+SkXcchV/7uuQPLyUtDzlxQj6mngLklBMz9ww9gU/deK+
         l8gh0tRqmP0Cg3EzLy/X0kQ49OPdZKFFu8/IyXScnTxkuw9Na1DSkKVIA13n1yU1f6n7
         0DLVvNu7NUMpW3HjYhWgVfr7WDPTABRmThrlO8MrILOVLVkIRRMhznFhK2rbaPrslEHm
         osQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=hdyy5mzVQwTZ4ysWQDKS3IsSlEm90LXUWXOGjwvknKU=;
        b=HVRnB1go2QrPuIVa6bQRe3WVx6jrx7QaN45OArgpRuHddFwxwSE2mVrI9geC3cW31H
         lSHYSDVTAfovUePxh+RBJT61rmYjFpx/X0UB15E2QbY6NN86/56XS/uTst1OuPIZ6TLG
         eiaIfBu6/+A4SjxBCipBOC1T+2TqUMpMdZuwPMiNcL0+L3+txrCPOxwEe55t3khWxavL
         ylg1IbJ+OWtw/B25LtpvMglpZhXkkNcFy1T9UCB7Hh2VAAUEoHfYHpqOHfcTB+sXZt95
         wdrsxx/7HmFsV5pyiefeJdmBuQ/Ve7ulqoze5hpPsuwyruY43J2RKkcmW4c2cWo6VhIL
         8Nsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W41gQYMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si855376qkk.347.2020.02.17.12.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 12:48:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W41gQYMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3nJu-0005tp-Eu
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 15:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3nJT-0005Xm-Jo
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 15:48:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3nJS-0007Qa-OX
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 15:48:19 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43827)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3nJS-0007QG-Iz; Mon, 17 Feb 2020 15:48:18 -0500
Received: by mail-pg1-x544.google.com with SMTP id u12so9468965pgb.10;
 Mon, 17 Feb 2020 12:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hdyy5mzVQwTZ4ysWQDKS3IsSlEm90LXUWXOGjwvknKU=;
 b=W41gQYMP8CCoDZzt0wEPFrUIZf0A9EEcS/ZLfEmAmAilOMFypwhhwzGb8PXJVBuUFz
 ZWP67I6EBb10VR+SkYJpH7oYbrkupGeXRP1OE9sA3GsA7zgvP3Bqa0sVa/gRnjEHEAmd
 foDdK+sstX+rARtHAnU/xcbnRy529JhSMf+WafNuHQNQVTw07ERH/bSf7fbYZOJ5c6Ny
 Y2UKkdLQxxltqyLIXzc/a4Vm/do5tcgnjgzpK59UDYcKWYi+SBe/0D5zWDg0s52nj1f5
 UhXt9R3TTdKUR0jnEQpK+gaD61djgqddeZasRIuX14fCVT/FV1+7AqrgY9R8kZLMgMYc
 AW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=hdyy5mzVQwTZ4ysWQDKS3IsSlEm90LXUWXOGjwvknKU=;
 b=ZXUOIu6vDgf2Lakn2CqIbIBrt8qYfpVocP5Gp9J7gVxOEovwLIJCUAILaC/jBlbct5
 rfdtKrsV6ntWuzQpwbn3cQXsaghZt1m5Dvk3017yiyRJYrU2Ob4UvIPPM98oer54NX3s
 qZvSS2oNlKU4kaEENr5FMx9JkWz5GV4Ts7RvCejz8MVdvzR6C1uKpdbkKwXPMOrwaUgy
 QjaajW3wBZ2KgA5sbY7oudMC4rZdJoGJ0cwmZ6s4etRJP3WcMykDsC9yu6lgCOGrMQRY
 CG2A65MCuto+u3FBU60CBvcLAvDVSsv/CGDJHcRARm09E7jBZkrVxJass5aS/SP+XlAL
 Vhtg==
X-Gm-Message-State: APjAAAWcm9hLwJ6xxl29AL2Y54vpwAJ1B2IrAIWHW+XGA+Hvvs2q4ECu
 kcy96VmREKn5HTg7Aho9RD1hEXJy
X-Received: by 2002:a62:7b54:: with SMTP id w81mr18183240pfc.127.1581972497734; 
 Mon, 17 Feb 2020 12:48:17 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 144sm1409481pfc.45.2020.02.17.12.48.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 12:48:17 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/3] hcd-ehci: Introduce "companion-enable" sysbus property
Date: Mon, 17 Feb 2020 12:48:11 -0800
Message-Id: <20200217204812.9857-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217204812.9857-1-linux@roeck-us.net>
References: <20200217204812.9857-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAAI431Tv0Ny

We'll use this property in a follow-up patch to insantiate an EHCI
bus with companion support.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Rebased to master
    Added Gerd's Reviewed-by: tag
v2: Added patch

 hw/usb/hcd-ehci-sysbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 8d4738565e..b22fb258be 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -33,6 +33,8 @@ static const VMStateDescription vmstate_ehci_sysbus = {
 
 static Property ehci_sysbus_properties[] = {
     DEFINE_PROP_UINT32("maxframes", EHCISysBusState, ehci.maxframes, 128),
+    DEFINE_PROP_BOOL("companion-enable", EHCISysBusState, ehci.companion_enable,
+                     false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.17.1

