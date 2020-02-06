Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1782681lfp;
        Thu, 6 Feb 2020 10:33:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtnukhU6wGuutHvsZAmhshXmz7hxuE6/YDMn0hwLg+Wv2Qrva09nkhqZkOIpHhFEwnWIKj
X-Received: by 2002:a05:620a:1333:: with SMTP id p19mr3828169qkj.73.1581014012830;
        Thu, 06 Feb 2020 10:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581014012; cv=none;
        d=google.com; s=arc-20160816;
        b=YRE7Y5ZyOt+7lzkd8NzvV7/+iVkVpEWHYnUJTWpq+e89fdL+PAEMqxqj78DSdemm6T
         d+X3cmR/HSJkbRdOBKgqOWICYG1XvjiwdUJX09sivUnMkkeZCLUGuCvyIcPWh/etr8sf
         y++RtpvMnSHNSowMh+OfAdEKxctxZi67yNT1x5XohJoL1H0kKw8wO3nNu4gBFxMquBOj
         OiqUtHGKfnYeM8H0Nhx/RUSw+cRpANzFJzWOgBIqP9aAD0uCU98OdR06EBvRUlnUrUyz
         4SLJ5KU6NrqevJ8fKRyxgmHT/OqhI5BCOCTrv2Wl1XXnILi8ST/dHOSKNufdMvZJgsq3
         33kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KHa/YBhZFNQ20KTVw/CmGFo4SlMalxgAEPAvIgaPvrc=;
        b=TIA4BSUo4s1vY85K5hWyx3nND1eubLdPqt/TDXuADYeTe/KByO30dwbzQq3lJQY/wE
         8w8HyUEfg18Caf/QWTWYyyBkh9KTdLuWH41Wxix4EaTo6T1Ha40fOX2wd/iop2qdcCgD
         4t7rAG3QzKokVWxv6mGa47vSIz8KXoQekmaOxNxwbNHn5zxsyilcJCrCv6DVykZqyWef
         ui8nhjtTydQUnJP9YiIuJP8V+GAf4Z+DN/rwRRA0MJcvxqoSw31P23MsgGdbao3PK1Uo
         HiVo+XEtyco/ARfT6AWhgaUfwyvZliWUesAt05NBXoZc7W3p537rSjFyaTZUkE2Fkm93
         T4IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LFNVvlMm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si138473qtn.359.2020.02.06.10.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 10:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LFNVvlMm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izly0-0000IR-8e
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 13:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1izlx0-0000H9-C4
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 13:32:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1izlwz-0002nH-Cw
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 13:32:30 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1izlwx-0002Tv-1U; Thu, 06 Feb 2020 13:32:27 -0500
Received: by mail-pg1-x542.google.com with SMTP id j15so3167053pgm.6;
 Thu, 06 Feb 2020 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KHa/YBhZFNQ20KTVw/CmGFo4SlMalxgAEPAvIgaPvrc=;
 b=LFNVvlMmrLf25rNwrNDR82Bs347osXagmjsWDE84qnVj8iGW9+k4doSQhtsqymM7Rt
 lZ501LnnDaOxSX4aVyu+LrdQYg94ZO8b1WmlRQvKjU9mCbJrEmxC8LgKrJUrGXid6BCu
 wdiJuKQwdYisJl66WezpTkUUpcqwAE6UFaoVfCSVxwwwWZKxRQ+2ekSPuTiu/3rkQzpD
 Us9IJYTlJ5i0Ha3ELkJfIvNNTOeKxuezooJ/X6dGk4kGhgGH+kUiU/5PpT4KSL0LhtL0
 H0NaBdrfYzloxDzcb8aJrX0Xh4XhieWLA+tOJIY4/l0qRkUIPJMXXfrIBD6yY5XozU0k
 3BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KHa/YBhZFNQ20KTVw/CmGFo4SlMalxgAEPAvIgaPvrc=;
 b=dDQjF9ZPwuP+vznup3sivIUEthyMYXYra0X0YEZ1CI/eFQI/uLuFBWbMtR3+oEmqEL
 pEQGVDtckMv0UI4S8jYY+YPHvYTwPWHu+qPFrHR6eXpzrNBb3+q9t1xIlIp22L1RSVAt
 iy+ORmwI9AVGsorRkkcOtQix6kUBmsa+eEBUvV0vIWGoWuK3F+5GjObWhXvGdX6wDHEq
 PMBTeP2L8NWlDaeY4DLJVElnBOC+zuFwhMu0ixntivolrAHSUW0yOLAiGKC5entp4o9e
 d3i8P1UkLcfq2n8XYCU09D2vxigl5Q2/NjcJbuNOZKd/kASpI0BlENF3gGo3Kzgdl1cT
 f2nA==
X-Gm-Message-State: APjAAAUSxlIOmq4JjO/VA2wCqOdgl2iIwfgQv6OWb0PQZbw/AF6XPHbW
 iovv7IWbv3dwolmSGCy6lTU=
X-Received: by 2002:a63:8dc4:: with SMTP id z187mr5255950pgd.68.1581013946160; 
 Thu, 06 Feb 2020 10:32:26 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id i66sm106167pfg.85.2020.02.06.10.32.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 10:32:25 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair@alistair23.me>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 2/4] m25p80: Improve command handling for Jedec commands
Date: Thu,  6 Feb 2020 10:32:17 -0800
Message-Id: <20200206183219.3756-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206183219.3756-1-linux@roeck-us.net>
References: <20200206183219.3756-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 34cNTyFAbnNA

When requesting JEDEC data using the JEDEC_READ command, the Linux kernel
always requests 6 bytes. The current implementation only returns three
bytes, and interprets the remaining three bytes as new commands.
While this does not matter most of the time, it is at the very least
confusing. To avoid the problem, always report up to 6 bytes of JEDEC
data. Fill remaining data with 0.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Split patch into two parts; improved decription

 hw/block/m25p80.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 5ff8d270c4..53bf63856f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         for (i = 0; i < s->pi->id_len; i++) {
             s->data[i] = s->pi->id[i];
         }
+        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
+            s->data[i] = 0;
+        }
 
-        s->len = s->pi->id_len;
+        s->len = SPI_NOR_MAX_ID_LEN;
         s->pos = 0;
         s->state = STATE_READING_DATA;
         break;
-- 
2.17.1

