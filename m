Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp714067wru;
        Wed, 15 Aug 2018 06:56:29 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz1QjIOikDUzt4SIfEOfvpAWQ4GHoCvx5jBikuHnABiKSUJd8qThB989G+Yzm2TkvxtSiGa
X-Received: by 2002:a0c:bf49:: with SMTP id b9-v6mr23064778qvj.65.1534341389859;
        Wed, 15 Aug 2018 06:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534341389; cv=none;
        d=google.com; s=arc-20160816;
        b=EL0jfBJyGy22x5KRQtHWKuAAjV6+xKHj5ZD3XsvR4rfAGxAwQLYSVQl3/ZUmjF+td0
         MLXVRPtOcIW8VIYr0mrx7WRoUTSu1PGxHcI1urXMof1cg8UQxuyItrWvE8OBQd1Ha/JI
         sPevdFv+CU6zAvmzxtNTnfzG4XP0So7M2MJVpfnNw7ic899O2niZmmJ0cJ4J6V925scH
         Pmg6T97djt0QlHlsnJda5XsmU8QFzmHu+75dIy848EWF1P0dIKGcrlHNhHf1BB+XVvma
         6O2uIn/t4gl+KarxlVOXDXYqXvAs9Cs6w4Nj4Jr5fILzlOqGpwVSenm+0AII+RbTTIdt
         UY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Kb7aWsu8zS2IOeSg5ko2TIUgTzGM9dkgU/rT5SsqMLM=;
        b=oxz5/UKmhRG/iOON3ZNNCRvFqqWoO4yGg5S4lOpnmBRjSqNeLjrR+DgbUihHl+w9tk
         Rw03iXkM4nGvTXdHKoFrXbxj4PNiBnCmlbCceYz+eg4cev+rNg75V64S13/4PVYjhmRs
         77pOil9vIOYTgf4XYp76aZpynaKgMk3hEKEaUew/ntrOo7hsdDrXtSWwJ0labhdEAJN/
         /2ddXf9YzoX1jyNa2cTmzOlijRr6OfDZtQlm6aRxmp4jVFBZrKcy6gBljSMWTDc1eMrj
         mJky4zuFuzv6eaL8mMpm56MuFR7Lit+cJdX07nN4ZaP0Qxh8w4TVrZqgnDQNRpaFH28j
         b4pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rt-labs-com.20150623.gappssmtp.com header.s=20150623 header.b=MhD4+XCQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si5908320qtr.222.2018.08.15.06.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 06:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rt-labs-com.20150623.gappssmtp.com header.s=20150623 header.b=MhD4+XCQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpwHl-0006IA-FF
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 09:56:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fpwHW-0006Hw-F6
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 09:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fpwHS-0003xM-VA
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 09:56:14 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:47040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hans-erik.floryd@rt-labs.com>)
	id 1fpwHS-0003ns-AM
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 09:56:10 -0400
Received: by mail-lf1-x142.google.com with SMTP id l16-v6so923294lfc.13
	for <qemu-devel@nongnu.org>; Wed, 15 Aug 2018 06:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rt-labs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Kb7aWsu8zS2IOeSg5ko2TIUgTzGM9dkgU/rT5SsqMLM=;
	b=MhD4+XCQj0BrIes7LClbQxbrP/ngDMfp7Rbizj13fpbfCB6EIsrEe+IgmXzeYpMfYn
	OHsPCJ388iy5hr8CcZ4sLTo5fZzwC29EwrYSZ3mbZLRe7us1EQKe/fGcIaEBDzqFfps0
	MyceSAVmvI9x0GXfnLzcYGLRlgE3/vM9T8NaYuvuSYh2o//TXi53MPqyffcZqCoJ4KP/
	7qjfsBLfoVBk2YM7qWs2tmap6Dudd3FbGUPvuDipesLjc80oVj4Tbkp/3K9qL5QL6dXd
	wYHIJaxI29lml0wli9dv6uZIGP8hMUAn2KpRlDWNLgXg+mprN13I6XcIQrte9c7nsJvA
	nv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kb7aWsu8zS2IOeSg5ko2TIUgTzGM9dkgU/rT5SsqMLM=;
	b=CwZ3OHcgBNn8MKSwKXQHE4AX+4fFZqN227BAey3kVBF5X0ymla3h/9RT4qWuCTSAKs
	ItOsE/tGbaKZuGobhAjHTNcsIPJ3GCX/um3D7wv0JqbM9ke6e+Jtbeb0ii+ZNNF/ggRC
	p9kAXySTK11SuplhQm0B/RgEh6T1ocbfIKv2TiUzjApfs6xX1fyjA1QvL06h3XiVWOQr
	dJgygnrNxCvln0QGvYdaegPeESTo/v6IRHeYti5ncw9gXShlCyzU1jsVJNx4dwJf+d/2
	/sfebwUaxBpmaUZ2WmW3Xbysg2wBUKoB8dxpzmtysxPLxxwhVHawF0Wybiy8nX7d3DPh
	68cg==
X-Gm-Message-State: AOUpUlEN2xSvv182PcnNJwrvdYvwp7n4IAv5nsBeWMYdT6iF3RLFPsdc
	dM9TPZ+cmkeYtv3ZlV5Xi8YPWw==
X-Received: by 2002:a19:a705:: with SMTP id
	q5-v6mr17832662lfe.148.1534341368484; 
	Wed, 15 Aug 2018 06:56:08 -0700 (PDT)
Received: from rtlap25.rt-labs.intra (h-72-195.A137.corp.bahnhof.se.
	[212.116.72.195]) by smtp.gmail.com with ESMTPSA id
	d4-v6sm339900lfc.57.2018.08.15.06.56.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Aug 2018 06:56:07 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: qemu-trivial@nongnu.org
Date: Wed, 15 Aug 2018 15:55:54 +0200
Message-Id: <1534341354-11956-1-git-send-email-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: [Qemu-devel] [PATCH] imx_serial: Generate interrupt on receive data
 ready if enabled
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"open list:i.MX31" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBHjXNwSut3h

Generate an interrupt if USR2_RDR and UCR4_DREN are both set.

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 hw/char/imx_serial.c         | 3 ++-
 include/hw/char/imx_serial.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 0747db9..1e36319 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -74,8 +74,9 @@ static void imx_update(IMXSerialState *s)
     mask = (s->ucr1 & UCR1_TXMPTYEN) ? USR2_TXFE : 0;
     /*
      * TCEN and TXDC are both bit 3
+     * RDR and DREN are both bit 0
      */
-    mask |= s->ucr4 & UCR4_TCEN;
+    mask |= s->ucr4 & (UCR4_TCEN | UCR4_DREN);
 
     usr2 = s->usr2 & mask;
 
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index ee80da1..c8b7428 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -68,6 +68,7 @@
 #define UCR2_RXEN       (1<<1)    /* Receiver enable */
 #define UCR2_SRST       (1<<0)    /* Reset complete */
 
+#define UCR4_DREN       BIT(0)    /* Receive Data Ready interrupt enable */
 #define UCR4_TCEN       BIT(3)    /* TX complete interrupt enable */
 
 #define UTS1_TXEMPTY    (1<<6)
-- 
2.7.4

