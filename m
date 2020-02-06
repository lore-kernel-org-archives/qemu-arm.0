Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1402098lfp;
        Thu, 6 Feb 2020 04:55:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsg0zO2ouTOufPsLTPzAP7Q4/ryrFdBM2+/98FJtJPDGUrE8Fm1tsycpAnvyfLGRbssqKM
X-Received: by 2002:ac8:6605:: with SMTP id c5mr2339026qtp.316.1580993704131;
        Thu, 06 Feb 2020 04:55:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993704; cv=none;
        d=google.com; s=arc-20160816;
        b=dKcMH7xnkQoyh8+dZoCUH02LCc5n6Ewx6AaQK2XceIakuikYchAqtdW8rkNWpG0+gb
         p6Udj+hOvTVjhRLL8RmOPr5cOV+Wp9RS+R3tQprDNEa1XZuJCQRSSL1/IB5Mt0V1IPux
         uV6oTtp2x7Bd+MOzkE/IyFmOdof/39I+coYSrEZUgObPnQAcbX0dlyf98VtF29eEkltT
         4ptmRdD+cHlV/0CM5ZeVt1phfC8gfoKEyjv6JOn/xQV1MLfpwZ3Q6uuIuyx99axe4wta
         8Bm+LRThZ1EnfaFdK3X6B/hQgSip0fsi7BxAEjMFdo3b0B9+VB1UGF0rJCC5BwhZvpyO
         cL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=XY6wTDKtpYukNVe/ZMxy+twDjEOe1O2VXYen+a6x9g8=;
        b=hTJEcl1/o2hhkSkhAhSdzrHFNuxKfaizU5X6gEFBWMyxsWy2WQGygBRKdaoioAwaxD
         opOcvfbGHfzGLHWFH17Om4erFJmuqjkigc7C9c6MtZh8x2jXNADZjt14/3JJaIm9Mbl1
         j29rEJVkeiLgfe2/DIWhch+e53/fZHC93GSDaZLtDJnkcy+acRy6TpIjE7guuRlUBMxm
         FJBS0J6LpTk8TWSb1mKA58EUilw4lzrv03TTKZOPO1xmKEZ/qKpqMfsERaT+9efN9dUp
         wZ0y2vsaYhY3XTp2IcgQ+4xv7KdL+z/HOPlJFHgZOcbISjCKziCLUH60x+cyLD5sQkG4
         +1sA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1402454qvn.81.2020.02.06.04.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:55:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izggR-00019z-GJ
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgco-0001hz-5P
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcn-0006oQ-3Y
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:51:18 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50523)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcm-0006lG-Po; Thu, 06 Feb 2020 07:51:17 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MC2o9-1intIs39fp-00CPsw; Thu, 06 Feb 2020 13:50:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] aspeed/i2c: Prevent uninitialized warning
Date: Thu,  6 Feb 2020 13:50:26 +0100
Message-Id: <20200206125027.1926263-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hsG0MoAZNDkAr6/dAbHU0b2Sd1vXTc5zUe651VUJg4XcNzZ/noC
 GyERr62exowH3kYsMpw9MdqVw7KaD1QQWEsvZcYMoDNAyxKlNrchzjPhnrV9ReKbkreXy8C
 cWvgwNp/Qq6946Q4EnrbtStnxh5bQkjSTfTYMcFz59IKpRMQXa1BrPI5YPKPXjd+swOlff8
 vVvwuO/qtFDx64Iz1eihQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fO6ol714BUI=:5/cYrGjiGI+7F/ekb3wmpR
 cryvZx6TRLRy7w3sjFNJDR40r9HuvwueWXLh5nCybya6LIjwj1aMXghCI5huPdqy9ZbJBZOCf
 KHlHcnaNw2IvAJ/EwbxOk4xUIW2z3aTNHZB2XR8+KXv32ExCDy2Ed56Rz/7DVUG6QcXhefjxF
 7mWLVLyBSjtYLqE+vx36em7JcDp4PMuCOnjtAXyT9IYgB4XAT94g2dddTrTrc5is7PxDoXJV9
 BP4ww0jYNyW8vYXB+Z5C/deWFZLk/WuNf/ueYxh9aAMmTtfYs99Xx11Uku8ayEkcEjXb8/oy0
 qOLZUi4nFv35zej+g0U/OzkXPawMUSeHaR0Y+WHmrF46+ZAL76oGKrLkiI0RQ6icxcckBQNTt
 T8mlhE/13BMzi7UTIWcoAoQ9+n3CkM/cL9HsEM9XpNc6ZQhHXU1j6J0YdUqrZCkMLNfv+dS2H
 RfupBT8Rp7JY6OOf20aLVAa0fNjIfKN6QPonxosGr/m0wcjmMmB1vRq1fQqEWk88ClFE8myUY
 d3ftJn6S85ct57UhTiFlQvem/CN0u4cPA0cS+sHlvIOr1G2QIzS/eMemHzdzvSijnr2r0yW7E
 8DGWrt5SFYB+zFefueSSzxR+/oGh7TCSajVoNjHijoHhgW2OdWKAAhlFTqTRY0JESC+ZKdhLm
 Y/71hT5TllPxWlpAKjekiyJmPR98d/WI+HyZW8GZVzCpYR1MfVR4OoyjXZOMndAKfkT3bLasc
 dpUbjxQjuMQBK66G1jx5GxBja5arIA9sR1Ylrd3DrQobJEafLSbMgX4yGQSEAnkg1+5SZ80Bv
 8YXJOtYXsBQ79kw7f/R5jHCGq0pHhKx9TuxA5MYxrpEObdH0+ncAUM5rqyeJxN+4D2nS1hy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fzIHxABWCHjK

From: Miroslav Rezanina <mrezanin@redhat.com>

Compiler reports uninitialized warning for cmd_flags variable.

Adding NULL initialization to prevent this warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <07957dcab31f65de3dd30efa91e6b9152ac79879.1579598240.git.mrezanin@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 9cda9685016c..fb973a983dcd 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -400,7 +400,7 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus)
 
 static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
 {
-    g_autofree char *cmd_flags;
+    g_autofree char *cmd_flags = NULL;
     uint32_t count;
 
     if (bus->cmd & (I2CD_RX_BUFF_ENABLE | I2CD_RX_BUFF_ENABLE)) {
-- 
2.24.1

