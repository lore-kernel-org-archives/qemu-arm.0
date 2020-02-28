Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp629311lfg;
        Fri, 28 Feb 2020 04:54:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwl8E9WCFddRWEUNUqj5HD0XylzB58DTsnjFVVHQXfJqRU+TCznzGt0Zqa0/3/ZpBXRY5dx
X-Received: by 2002:ac8:7103:: with SMTP id z3mr4113503qto.172.1582894447843;
        Fri, 28 Feb 2020 04:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582894447; cv=none;
        d=google.com; s=arc-20160816;
        b=R690GouPD1F+pRCiKcuFV3zGTTgvt0MoaKVpJa4FKmaxkhHrkbtPdrgK+V7EzVA0Es
         AyP54kwmFg3KpiXzqLjeem7WOUqUEqpVa0pgUVbzf19zHhRY7F4Zp6LW+ZoH6b+5QXmi
         M3kGD4FfLn4ahTo8zfnoj4jIkwm1sSOdXdD5VMQqKcHZhgSmgF6bwEqzEKoA4ptM+XE6
         i/gNtKmWm1oDhfggnwaTSHJ2cLq52CSnrP1t27surkrzxnXIIoSbCo4E5WKG+7LIVqzT
         iKnXmX5Lt/YCIVOU92/ONxAarEUAXBhCCo0CZF0zX6Wz9dzowArd8mof0Eu+S4OKYAFZ
         Vyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=tQcQxO0mafeJcBrhpQ08m1da1xIhoRzWg6Hbi1jpjAM=;
        b=f+fe1i0uj17qLVOLJHShsgL85y+mUo3snIZWQSWCfciYuVNVM2glfdcRjrCf7Eoqtd
         ekL0EogszqrDVRqJmkf3SCNzkJPM6VyZNIlKThhqDaOhsNgQdeKyUT7StAp/5kujcSTx
         71/Ep1T6TiSv4CRXmIRwtVANeY39ZlhUldnwmZoEXP102puKLhokWgjZY3VTUFHj9ics
         chb8R/Y2TUE00Jh3haR2V4Bie3rlArDOYMWk121Dy43XKuwJVUJ+MPPHvaiF3DhpQkBp
         OHKe9TXG4lK9WI9aJnky2eKksFZ47XMAirIwn8Ep9Pj2iLC/Z7y/9wA6A37xRYb+RvrY
         ftnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P7NWWiU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb19si531090qvb.16.2020.02.28.04.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 04:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P7NWWiU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7f9b-0004xE-A5
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 07:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7f9U-0004x1-CH
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7f9T-0002mp-HR
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54296
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7f9T-0002me-EZ
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582894438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tQcQxO0mafeJcBrhpQ08m1da1xIhoRzWg6Hbi1jpjAM=;
 b=P7NWWiU58CdoJvYpUqfkl9OyBoL6t6aEL01kJrESA0osrqXjDM3VvThUvW7GDp1TNcrNlL
 FkLAc/NgF6kp9rwcgv8UUTrsKEi1BxyvaC/iL3hw8SjribcVmhqfRriJTJlYhER3HDcor6
 aRWriKbiAkJQMh6I1T7tsAL46YDDbAY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-wRe6DUeZPna17lgtbsXW5A-1; Fri, 28 Feb 2020 07:53:56 -0500
X-MC-Unique: wRe6DUeZPna17lgtbsXW5A-1
Received: by mail-wr1-f71.google.com with SMTP id z15so1302079wrw.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 04:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KG0eGk37oq+Ccl9b8PKNGyC9lzYSNCYQ0XyNSPhojuw=;
 b=ZrYebB5/z7L79pgYbr93ZOETt0xH9BUNZvj6gzRyM9+iqCo5gQnbAYHk9y6mMnrGsv
 SvW7GxfwxzecZKR6Ksg8NSjyrGMbH9zRtO3hjWq/IpcCXzqjhuNCg5PCXs+bEySGv1dp
 875do0aepdPEWXj+OkDYy3vf7TBHrp7Pi2U4fjS6PdN/sTR0ZBtupUnZlbjHonCnzouR
 Be2oUL/1/uRnx8hGW7qAGZJ6tpr9YWFCbnDygCpthmvzRLNoX+e1CxxdarO7CtTzcfHJ
 coyqPO9uzhb/1jx6knsGKMCFCWQ8HqNkRZvOZ331kULWExhN8wHBEjFqBHplH2sZSn7T
 jD9g==
X-Gm-Message-State: APjAAAUMIkEu9m6/pzXUrR781dZrDs4Tcx/1bgJONmomKx6m2qBvcP51
 XZUnyCyUL6kG0vaecQGkFh57nzzcKuOaq/zfQWsZdS2THTSPaIcmFhzq52E0JBjAWQVGEmB0C/B
 zdb+Kn3gjrhW3
X-Received: by 2002:adf:e809:: with SMTP id o9mr4687886wrm.405.1582894435495; 
 Fri, 28 Feb 2020 04:53:55 -0800 (PST)
X-Received: by 2002:adf:e809:: with SMTP id o9mr4687864wrm.405.1582894435139; 
 Fri, 28 Feb 2020 04:53:55 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id d9sm12398979wrx.94.2020.02.28.04.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 04:53:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw/arm: Remove big-endian checks on machine code
Date: Fri, 28 Feb 2020 13:53:46 +0100
Message-Id: <20200228125351.29482-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4SzLTOZKHGb

We only build the little-endian softmmu configurations.
Checking for big endian is pointless, remove the unused code.

Philippe Mathieu-Daud=C3=A9 (5):
  hw/arm/gumstix: Simplify since the machines are little-endian only
  hw/arm/mainstone: Simplify since the machines are little-endian only
  hw/arm/omap_sx1: Simplify since the machines are little-endian only
  hw/arm/z2: Simplify since the machines are little-endian only
  hw/arm/musicpal: Simplify since the machines are little-endian only

 hw/arm/gumstix.c   | 16 ++--------------
 hw/arm/mainstone.c |  8 +-------
 hw/arm/musicpal.c  | 10 ----------
 hw/arm/omap_sx1.c  | 11 ++---------
 hw/arm/z2.c        |  8 +-------
 5 files changed, 6 insertions(+), 47 deletions(-)

--=20
2.21.1

