Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4239642lfi;
        Mon, 6 Apr 2020 10:52:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypLvqIdU4i9/3z0JBsHFtMEzWbILW1erBuWhnkxCxmXuyxbMqXWpqFUdv4Ji9xbfbuU22RbT
X-Received: by 2002:a05:620a:15a3:: with SMTP id f3mr3333491qkk.15.1586195522342;
        Mon, 06 Apr 2020 10:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195522; cv=none;
        d=google.com; s=arc-20160816;
        b=KH0cYNuhh/dEZSRTtUvf6ZfOhqy2U/9vB6uSd3uCiFqnobeA/o14vGg3ZAGh1MIuJo
         fxXciXAzqYGhPngoATHpiwL3/V5+2Op4w1AvorkyQ0FYJpIPDzm6mh/pDcXS/hFdcOo7
         jOp/0WfCTUKK6ImsGpfXmqmYxJMt+ApOl/I3MR6fW+bPJOhLH9dg9ssTfxhZjQ9OXj+n
         KSYvA655Jk1t4Nl4Y+4v0q4WmcyV9TTIYpt+oMa1AfK8/mtHIFDlJqMwy1bryQICtn6v
         kFntKJzBR9yn8eNq0F3dzdX8gmR63pgWivajNl4Qggqttk5M5Phyq/OM7MoVhywYd0NX
         MBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xfGcmES3nPX8YvO+/YU0EwpyXu9u+QJWTYG9rfArCpE=;
        b=cBB34KJtNW6jrK7wg09UUJ7wu9c5ocfVCoQQUeAKPxorQPLYFfIEpJLENKDDJkN/7l
         FAJFHOMkkfP7iUfpVjDnHgdb22jERkTAlxAYXvVZCwnR3Y9U+CK7I2D+yiPCtlauJeoh
         j4frWFjcf74oOSgCyRxUihqk+GnSG8pMsL2q9qH8SKLnqjfZ7qEqeBV0pBWlYRWZXKt6
         MlWtg9znLFNVdX1bhdl3VMOl6tKN0/sTlKpT2/7yTXPOYZviAiV3tgSYaEOgxCgWr0Yv
         RTkw+d9anBlrDXrm/RgfQyiO23+O79ZUiWWQskpec3p1T5PW9OSt42ABc/+wqo0+N4Y7
         8kag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mSQH5bdY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r44si188062qtj.157.2020.04.06.10.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mSQH5bdY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVuj-0007Ox-Nh
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqs-0001cS-2s
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqn-0001bx-DV
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34532)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqn-0001bU-81; Mon, 06 Apr 2020 13:47:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id c195so139073wme.1;
 Mon, 06 Apr 2020 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfGcmES3nPX8YvO+/YU0EwpyXu9u+QJWTYG9rfArCpE=;
 b=mSQH5bdYJwZO43gz051i5YGQvv7jfuiRVqkOL0va9nYORTZVaZeSHTMTfs7AjdAEiA
 uzD1O2sYFsWAhRzUwefyD9H+uCwloAapePGsZc9bI0qQqZRaTp26x3HUBFWfMHVyPXVx
 1h15gJrk5p3zF90+mue76guNwgtL38DTslpEUZASG4KQAiwAEbg1XksGXXjRfRDkobQW
 DVC7MyKKiVhdEe5DAxIj6sWn0qMhY6ZUsFeM3vQLvwucIMm8FaioDIvmMZypzA25d981
 /vKZKDlE1km3FzFKazhiF+BWPiU4A3sQbTLAgQM3TK8t4hNG/JiOg8dO8FgDa/tXiDNU
 n49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xfGcmES3nPX8YvO+/YU0EwpyXu9u+QJWTYG9rfArCpE=;
 b=fg8YRbTR3a1SMDKQQADg3FZy2dcYiVz1d0XWlc6mdCLjQEbxhX/uZ+SCD1CZtJI/9S
 WcL6CkTrZ0clcmmt0DwGA2bv0rQbzMi0jOX0zjMxw88JoBCbFRnI1MbcITZ1oEDe+Gmx
 YxBviALW/13AhdtaQuxfg1d9tJiIFTjDSX/Ru96ByVSsRCJeHvYgNC11U2lZKndqv9jM
 KczubSXpcW/Z5fOSUEvFFq2f8Ki7SJtHF2+HWpCOKTNMmFLDfUntDZ7UVoxN6CXoPNQr
 mm5JplYyIhTF6deFpW3w9PHTr7gK7zw1rJ8Zl7gUuSfRIjo5SRc4Quo1Jruz7a0iPre/
 aXTA==
X-Gm-Message-State: AGi0PuZUan3UUShGBlhIDK5RVbDiBHDGZD5XYqJft9BVSkALgtQF9FcC
 I6sZWNnrDMpYtQFGm3aZPlnRyvUvhQI=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr205469wme.20.1586195276046;
 Mon, 06 Apr 2020 10:47:56 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:47:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 07/54] hw/arm/aspeed_soc: Simplify use of Error*
Date: Mon,  6 Apr 2020 19:46:56 +0200
Message-Id: <20200406174743.16956-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VA6b79BMHwCj

In the previous commit we noticed we don't need two different
Error*, drop the one less used.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_soc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index debd7c8faa..aa6d739ad0 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -234,7 +234,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     int i;
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    Error *err = NULL, *local_err = NULL;
+    Error *err = NULL;
 
     /* IO space */
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM],
@@ -413,9 +413,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+           return;
+        }
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
-                                 &local_err);
-        error_propagate(&err, local_err);
+                                 &err);
         if (err) {
             error_propagate(errp, err);
            return;
-- 
2.21.1

