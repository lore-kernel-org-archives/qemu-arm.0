Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2522074lfp;
        Fri, 14 Feb 2020 16:13:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpR0MMQadtDranFlGRI8V/mwedbj2fit9kT+GNXXOcXDigdXRraDjZYLzjXKHdKJUJN4tL
X-Received: by 2002:a37:7746:: with SMTP id s67mr4844321qkc.127.1581725605367;
        Fri, 14 Feb 2020 16:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581725605; cv=none;
        d=google.com; s=arc-20160816;
        b=X9v9LeY7kqm6+UrbjKGtVojOiomYuO4ViNodRQE6o65tBU4V21U49dR97Ii/ga647U
         m1a8cGdX5c2+ofquOK0+HSs4McI8T4qaIaUjkcIwXMoLKNPg7iUUAuUC0v6kjTe4MdOZ
         p4aPbAcBUnY+TLJCO+agZIgC22nt5TiKCqd5Bk1wxQ43xKfLMdzDhAVc59JgeEp+lCEM
         Ef6n/br19kCaDdt2Uywi7eO9rd9og03AQ7AoJyXz6j45z4mmyHlZ5LNzUK5wXcVdFb4/
         g17p/d2U2n7vbzwUuTxmtyqlUzhOD6WXYMfzBe2a7DqiueGyXqV/oSYSsXmba6nYvvfb
         fXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=hbeVP/BW+IaFARdpXG4HDpnB43Wxr9sq7+fPSUPZvsM=;
        b=Ar2wGaWt8bBWgcRfLL4dzUwQkyvrD8Eqj5Ga/9NDkvprDIB47CY2Q/XgFO+ndkFBH5
         gwKKFL0HnPbzjUI4E5EbuodvfTkMPCy9J7D7l1itQem+DXdGaZ5XLBwUQUwWfv5rwqNH
         PIqmvF5XVfrXq7tsrMi4/7ORXr3qEhdp3g14jtS79umsWeK0KE3J+xoQ093tc47n7gUv
         f83gBygtZSvIx6iB3MDmeGhB4NZKQLqg/rLfalqLmW4ah4pd26YXoH0qaR9PzbG/P3JU
         +W9ofRcptRwBN4Zx+g0LQntLOpbYWtavUfTRysStvN7y3AB/LWWpEOKi6335lZCQeTj0
         mSVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FcIxJxJb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si3733664qkj.14.2020.02.14.16.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 16:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FcIxJxJb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2l5I-0008Na-RB
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 19:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2l4t-0008FP-2D
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 19:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2l4s-0003BT-5G
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 19:12:59 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34372)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2l4q-00036K-8G; Fri, 14 Feb 2020 19:12:56 -0500
Received: by mail-pg1-x543.google.com with SMTP id j4so5746063pgi.1;
 Fri, 14 Feb 2020 16:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hbeVP/BW+IaFARdpXG4HDpnB43Wxr9sq7+fPSUPZvsM=;
 b=FcIxJxJbxQ80ZNP3JZjFhtw0vGua8ZGcSIWcBBllDo2ahg2vwRfrxqE6CU6jlo5ISR
 naPkleDMMnZ2agi8xrwGx8k8InWJQi2DOnX+fsFiZxIx/jbhqZJz6UAML7IXOykyh/ni
 5B2UPozbvWZNH1YZYEBi3SiziMCGbW+nl9n2uRWtCKYtWQ/Ws76YSP4WU5i/fzpt+1pU
 D7CHlPOFM97yd07sZaSYc4vW7xbFiCOwdxWKf7+e3FxruQHzWFUWfVUZ5GYn7bvhYgbf
 2AnxsbNGhm9ojPNIsOvJF/dm7XUGIYcSX0HdVjjWg/3SnGBbwuZi6sqeFipjmoYJaojf
 xeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=hbeVP/BW+IaFARdpXG4HDpnB43Wxr9sq7+fPSUPZvsM=;
 b=I8zb/5UvLMR4O+nRgZyYHSkp0ahL1zrDM9TqeyM9vmrCeQfSY0NItzuV16Wp1zykY3
 atbBL+GgaMjNdzCYiHtwzzy9ESQ/SF81FGIEQcBkjb71Wio/CNqVmjovC/pPoZi60Nff
 vcJbeU0VIyh7AgtxUf4Und+uZNB0bSD0PdsZ/yJQ0dcjp2uoA3VeYhMtr9kjuldUtylJ
 gMJ4Pm6OSDzVFWGAb91hU5ceIO/zgzkfrfWHrLi7peW+CNjqpGy+mc1KoaWsYjXKpJLl
 L4jCV/YNf3JuPpZKxM0r+ZUxqDqfMgz+mqudg+eUGJ+BjeT6RnZd5XmYs5+93UhmhboB
 RgkQ==
X-Gm-Message-State: APjAAAUNHA95buxKkt7uS4/jfwviyploUNWAws874Z5cQ4pdmeCL7zlF
 bpkzpmKtI7JhmMLmA2y9O3k=
X-Received: by 2002:aa7:8809:: with SMTP id c9mr5802564pfo.238.1581725575362; 
 Fri, 14 Feb 2020 16:12:55 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c184sm8431141pfa.39.2020.02.14.16.12.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 16:12:54 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 2/3] hcd-ehci: Introduce "companion-enable" sysbus property
Date: Fri, 14 Feb 2020 16:12:47 -0800
Message-Id: <20200215001248.2642-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215001248.2642-1-linux@roeck-us.net>
References: <20200215001248.2642-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I3LMIXizvOmR

We'll use this property in a follow-up patch to insantiate an EHCI
bus with companion support.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added patch

 hw/usb/hcd-ehci-sysbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index b5a014f968..014ad3d552 100644
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

