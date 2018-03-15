Received: by 10.28.91.67 with SMTP id p64csp1791232wmb;
        Thu, 15 Mar 2018 12:12:26 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsaVzGyOJvNZl0sJxCnJZrcmnTQYhptcs7Jv3b7C8zTC/+Z7UihdKl37+TlFOpQHbPFPx7q
X-Received: by 10.200.42.15 with SMTP id k15mr15233135qtk.101.1521141146874;
        Thu, 15 Mar 2018 12:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521141146; cv=none;
        d=google.com; s=arc-20160816;
        b=S0/AMq365CNx3Ytt4q6E2IV5CGclcqZtb2CvywfPNzJsLKi0OkC0z2lGjNLJ3tB/Ze
         hDzvoUOv3Tbsl8zYat2bM8KO98yDoRz7oIyJi2X2VZjIymlRKHzMXuSx6cJp+gwl5RKo
         wMsNAb8rtLNPYRHuEL5Lj0/xT7V/xCrPp13bncmETN1Jye7qubXRoXgs624VQ3t5cbwl
         Eu/RLGn4C2WG9qg/c/w+mGk+by7zCb0KiKQX23wKGfvApUY7tcME5FTo221LhUYQRu95
         AYXvNd6z+Agavz8n3ZvoxcIZJ55kICP0PGLNQLuSG6GFmPK635f1e2iSVadEQv+HZQM/
         ZRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=RkaIeRtgKf688HIBcHOV/axbsXxqZOAceZKQ9jD2Tas=;
        b=aaYVNC6+DupQBjAIEnD4/z8i68+F9vA/XqSYGfaHQNx94nL+OJMhNb8te+OVGK9MJ+
         X/IreT8HbgklIbwPYyIwlPmrxehOQboPwuowHtgAVkj7dJn9gXVZM78pW1iJczhwozcf
         sDONk6PoB1C47B2VXpbaJrVv7cqZtAQ7lyHkgsWrQmqMe3em/IP5xqL5NQ8Gfkbsbq+N
         ganxtmQpbdnviWDRno4xpTTFUZW2XngsK0xVBbeAvMzqkVyJFElTBlabP+lSrMly9N5m
         8CRq2WAHM6kRt5xxfzdBnmYmbVC0HCr9wg2PB5DaUnsfIzvhtkoiewc3o0Jz62VNOmTZ
         8Ztg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uxkb6Uhs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m15si1806780qti.261.2018.03.15.12.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 12:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uxkb6Uhs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewYIc-0005zm-Ce
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 15:12:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ewYIE-0005xS-75
	for qemu-devel@nongnu.org; Thu, 15 Mar 2018 15:12:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ewYIA-0001a6-NE
	for qemu-devel@nongnu.org; Thu, 15 Mar 2018 15:12:02 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ewYIA-0001ZZ-Ga; Thu, 15 Mar 2018 15:11:58 -0400
Received: by mail-pf0-x244.google.com with SMTP id y186so3199312pfb.2;
	Thu, 15 Mar 2018 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RkaIeRtgKf688HIBcHOV/axbsXxqZOAceZKQ9jD2Tas=;
	b=Uxkb6UhsxA2vpF73fAkSrmWYk0qLeJPOMz+hCCEMcwj0VB2FiafAIog7TPOjCg8X7v
	VB4/SkLMrtuifcUOBq/WSc5MGHooHyIzdvq3l/yKlw61Ilgw4PycPV2/ZJcWZgocHyVZ
	oGTVOYyjRPgIOUEVoeo6Vf6JGtaUXHTo21aN2EuI9GS9TvSF6hGbyhcNf1Yin0ciRk5T
	Da1No3UVnCN1d1uGcQJi5KOgcXXXdZUJCNWuwotan3fFNDD43baadl4V1aT7twqPwI2G
	J4Oi816Sd+U2kEOXChiJR8W1aaT6rnILqqLxLllhQ1T1kiuAJO8Szq0+DXd4+w4faKAG
	RjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RkaIeRtgKf688HIBcHOV/axbsXxqZOAceZKQ9jD2Tas=;
	b=K5WJwlJyYthSX1vNS0yGwvaXInVFHx+RTErLlz/LWuc37+JPGOkr7hoZ/8oOSFMW54
	DInQom3C+x2Bqhfmnulc87xGqUnBhIFpyET77NY9JJ3aaZubl2jMsL3XUYv9TsJsIwyH
	rZ9j3G35xh7jxSY/nf5RTcpWgAY0jVqkiQdqFMddne+8ZLkZpcikyo2Ym0NSUpuHKnaF
	1JAUW+nhh8moL0/EynzR/3FGkzjTHEFyEuF6TfZWXREPEVEsKR5r/i71gNiP6rCye4F0
	by5QT52bdI0b1i3lvmjne4h2/eqjUqmQHDlCGxCWGwjbcOKpI+4pjF8atXZXcUCoGO2b
	iy5g==
X-Gm-Message-State: AElRT7Et2+QwQWEOMbZFYCehT44uHSd9hmY+9P4wlVg4O4iCXlkq3ITA
	02FLUw8Pbc1sE7C47OTiNsI=
X-Received: by 10.98.18.70 with SMTP id a67mr8603430pfj.213.1521141117048;
	Thu, 15 Mar 2018 12:11:57 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d193sm9732665pgc.30.2018.03.15.12.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Mar 2018 12:11:56 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Mar 2018 12:11:40 -0700
Message-Id: <20180315191141.6789-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH 1/2] char: i.MX: Simplify imx_update()
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Bill Paul <wpaul@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NAL7Cv6XEm/+

Code of imx_update() is slightly confusing since the "flags" variable
doesn't really corespond to anything in real hardware and server as a
kitchensink accumulating events normally reported via USR1 and USR2
registers.

Change the code to explicitly evaluate state of interrupts reported
via USR1 and USR2 against corresponding masking bits and use the to
detemine if IRQ line should be asserted or not.

NOTE: Check for UTS1_TXEMPTY being set has been dropped for two
reasons:

    1. Emulation code implements a single character FIFO, so this flag
       will always be set since characters are trasmitted as a part of
       the code emulating "push" into the FIFO

    2. imx_update() is really just a function doing ORing and maksing
       of reported events, so checking for UTS1_TXEMPTY should happen,
       if it's ever really needed should probably happen outside of
       it.

Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: Bill Paul <wpaul@windriver.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/char/imx_serial.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 70405ccf8b..d1e8586280 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -56,16 +56,24 @@ static const VMStateDescription vmstate_imx_serial = {
 
 static void imx_update(IMXSerialState *s)
 {
-    uint32_t flags;
+    uint32_t usr1;
+    uint32_t usr2;
+    uint32_t mask;
 
-    flags = (s->usr1 & s->ucr1) & (USR1_TRDY|USR1_RRDY);
-    if (s->ucr1 & UCR1_TXMPTYEN) {
-        flags |= (s->uts1 & UTS1_TXEMPTY);
-    } else {
-        flags &= ~USR1_TRDY;
-    }
+    /*
+     * Lucky for us TRDY and RRDY has the same offset in both USR1 and
+     * UCR1, so we can get away with something as simple as the
+     * following:
+     */
+    usr1 = s->usr1 & s->ucr1 & (USR1_TRDY | USR1_RRDY);
+    /*
+     * Bits that we want in USR2 are not as conveniently laid out,
+     * unfortunately.
+     */
+    mask = (s->ucr1 & UCR1_TXMPTYEN) ? USR2_TXFE : 0;
+    usr2 = s->usr2 & mask;
 
-    qemu_set_irq(s->irq, !!flags);
+    qemu_set_irq(s->irq, usr1 || usr2);
 }
 
 static void imx_serial_reset(IMXSerialState *s)
-- 
2.14.3

