Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2425597wrp;
        Thu, 26 Sep 2019 10:36:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxizu3lMQnFIXFBvJdNsuq0vQwHtLVeinIBLKrEgY76PVQHui+oOdDUm6/+fCVLrHiqBWO9
X-Received: by 2002:ac8:2fcb:: with SMTP id m11mr5246861qta.280.1569519371420;
        Thu, 26 Sep 2019 10:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569519371; cv=none;
        d=google.com; s=arc-20160816;
        b=QPjc3gd7txO90zB5SM7GFng2uCTCrdZ6ehTBxLJS0805XMKooxMW23UmdjiP8Jinkw
         +jS6jSGoixz0jwffNqSJBOiHClJigETMWJFhhgMg5IFFaVriybaJHWYposC+PJUn+8kb
         4iuALJLqANqJWXq3WjiOnxJ5B5m4eLGxCKUEqRYci3xXOmJ91gouee+zS6n95fT2OGu1
         hhHlkOQgZqa+947yA1hO4aOgqsapaeVDapBIjrU3ALrJTK9k9SOM3yJcucgmgB5mOcjF
         we9Y4e5w7zi7emJ3wwEFf5zrZ8z2+sjvmoE1TH0FTCUJhXik9/it/kMX5d4gPxj7KhKq
         TO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=voiG7DWCSdFTStaEL19HrjsIseLBzBfq9/zOs+pAh+4=;
        b=tkXer4VyHNycwxx7u/xZDhuZoyPleKj9l6Nlma6x6H4cEZXSMFZbHRdEqVdGh4uUyE
         AYw3dk5h/QkXRWAKX+Zt8k0ahd7KEgq4zWxqequfM2N3JxTXTBLbZG6JICkeiDtiaxvo
         eJVN2iAGLP0bgjypCNA0LFMtqDYVA1xA6zIw6m3Dic9wXsvgdqpIwDK28qXHJpKD5BwF
         BiE8Bmba0EImqg3skhsXmbTaTITXcdRhnmSI1toV9he9Zu5ng9bSkPocdFnnK6otscKT
         4mZqLz2BJlQ+l5XL8e1r2YqbLx0jG+iZmT1EZbdaxbjomOaEa/DNMLCvHe2mLPllHM1a
         xFug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="uu/CHPKK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si2204628qti.6.2019.09.26.10.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 10:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="uu/CHPKK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDXgX-0004J4-VP
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 13:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXg7-0004FY-3w
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXg6-0002mP-3r
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:35:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38978)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXfz-0002dh-VS; Thu, 26 Sep 2019 13:35:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so3712987wrj.6;
 Thu, 26 Sep 2019 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=voiG7DWCSdFTStaEL19HrjsIseLBzBfq9/zOs+pAh+4=;
 b=uu/CHPKKHr5AgZc+QvoM46VVMKRFdKrFQYddb7i+3Ff/325da3M2zOhOOypeXbLKcs
 zo1M0UojOM6gk/UkIfLNoifogrWd10rlDHYeJXOVVi29NshhibQjImApnHj2B/u9kxzh
 oJDFyEYbSdD/XBGbsK3Ixq9dAlPBmMjiIsqz4C4StLd4DWOdkI2HAIGeXKcdyBzhW47z
 83v9xrGxuNAg9vkF1PTvih2fumZXmjB4qDPaWv17347MjpmYt3ztNnd8oASnosazSYr8
 51JmXrUwojq2l9AbdLQY1L7pElnKk7iw7huyVthKcwNZKXXOlAbiqrqtFN6hIc4XqCzM
 Vfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=voiG7DWCSdFTStaEL19HrjsIseLBzBfq9/zOs+pAh+4=;
 b=cLe093rgP1LfkTBE3uQRMsxqz0EklHM6hWRyXgKRJXIWf4d4X+qDk6h/hP1IbmJs3c
 jOnUTT7M6p7sC/AU020mK/L/3ywtNB+41gixBI/QhYVOkTQUsIaHJTrQemXePJOSEs7J
 Qe1pPCTSDZmnynawwdaKJQW+IMvMpMK6oc64fvwnQlrPGwCsf33EydIq9SIAzpdKZBHh
 Fmveh+NuYXZGG3i1Uc/EXXm0vgr/wroVaqkQO7eu/0ab0VKOLi6kFuqhx9CWYVooRMej
 DzqxrMYzLh1pB1r2agIi0C3/bL0OdZUCGAm3w8uliRfJZLhQZnqnVdubsub2t31zHFja
 jIJQ==
X-Gm-Message-State: APjAAAUoxvBicI6w5CVLfY0X4oFjIU7pmcbGImRwDtN4mqGYZRwHq+3h
 mBZatpesaI1hTd3RYaNe6ZuP6g/FZWg=
X-Received: by 2002:adf:904f:: with SMTP id h73mr3943294wrh.128.1569519273793; 
 Thu, 26 Sep 2019 10:34:33 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:34:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/19] hw/arm/raspi: Use the IEC binary prefix definitions
Date: Thu, 26 Sep 2019 19:34:09 +0200
Message-Id: <20190926173428.10713-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
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
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 91EFi1DMaDYJ

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 74c062d05e..615d755879 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -230,7 +230,7 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->default_ram_size = 1 * GiB;
     mc->ignore_memory_transaction_failures = true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
@@ -252,7 +252,7 @@ static void raspi3_machine_init(MachineClass *mc)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->default_ram_size = 1 * GiB;
 }
 DEFINE_MACHINE("raspi3", raspi3_machine_init)
 #endif
-- 
2.20.1

