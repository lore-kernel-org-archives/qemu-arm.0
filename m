Received: by 10.25.44.15 with SMTP id s15csp4194622lfs;
        Mon, 24 Jul 2017 11:46:04 -0700 (PDT)
X-Received: by 10.237.60.57 with SMTP id t54mr23455944qte.281.1500921964109;
        Mon, 24 Jul 2017 11:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500921964; cv=none;
        d=google.com; s=arc-20160816;
        b=hh/kaqagoqtQWD9SZg0xWV7QYbwfd0Xmg632XlVYG3QxE4n5bacBOnC6IxFOcRYoNE
         pQZ+AEeP50kJp1Pcr1iypPGdI0OZGB1VDAk9Mn0u9QmhJQuV62FsiOrCI3vq9XM6umJs
         QbmPoEpt3UuAyGbr/gqQTXjvxyozjdVoVYqT1OSWEyd3mA1SDDErLZ/BeqBHKyWIGRVG
         ZG4b/noyirCiswreSLgT59RNpCFosSEobTkRaIQf/Qp60hmz98zpkszxmaiW9GZHDBia
         sU28g2dJuhuL+HnbDmhTgL1D1qD5ThBlM3q7ed6A0nHS5J/xceLB/g5hau7nIJnzI5J6
         3Jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=UWSw22TstASCCRnAWr2GpU6Rn4GTeYUkN+RAWv+QDZY=;
        b=0FlcQl097p3DAK/Sj2MxFvbJ1CUAjGtOLPVWvjYyD0Y76jY9SQ/gSpbvyRUd+VXqKH
         MoZg/37IHvz3cmOy/SlwTPB5p34gIgw7hJwLcTHYif6a0RmGs/eXFSWeXIJehKr7dtJ0
         cu5zFcItl1SYbcrA4jTrPQ4nefBbfPaP530wbkOXP1l6ZpOd8rmYvKTxCAw486ToXicZ
         IGg7ZO2g2Mhn+cD6hUHHEh4paVOTT4by7K4DgfylIPRGuML813I0KRQENuc8dPhONpG1
         qXq4JfdsdiV7LN4W9rn8Md2QaqF5xNIPcjtqFDEGWGt1lS7DQ+hne9n9wwshInHxNZvd
         ezNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=loSK60Ke;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e32si8984553qtb.177.2017.07.24.11.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 11:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=loSK60Ke;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZiMj-0006Lv-97
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 14:46:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6x-0001JQ-B5
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:29:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6w-0005uL-Iw
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:29:43 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6w-0005tV-E5; Mon, 24 Jul 2017 14:29:42 -0400
Received: by mail-qk0-x241.google.com with SMTP id k2so3228145qkf.2;
	Mon, 24 Jul 2017 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UWSw22TstASCCRnAWr2GpU6Rn4GTeYUkN+RAWv+QDZY=;
	b=loSK60Ke2HcwAgqEWTQ7pZLTTBkf4FFUadFqC2Z6sHrU4fEJrBNsI+jtUmgVgjKZWt
	1ZwLs1PO8n58sI0EHr9W/N4avxmgdVHnImwqbXZgNlc2eVwxnh6hjaj98/chZlEcqdL8
	Fkbm6evBvFgS07QeVO5xttDNr5mKh36WNszn4IdLotdnBzGcmu+Xz0Yjao4n/tQlEora
	kbMIgwgTWfY7p6sOAgYh6vybT5ZlCKYX+oYlAxdq1l4CYBoCD1CKJ3caJctqfCUtWYup
	ZHGSvFUf7JBy6JgvIz/tRCWQQnagfMY9GMaLhk4BTgVfmngwrkQ7KDb2kzUjj99+N9LI
	srcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UWSw22TstASCCRnAWr2GpU6Rn4GTeYUkN+RAWv+QDZY=;
	b=LQ9m7romUSdnd9CcbwBP/YtBQx4+YRRE73SQSjx881sj8BccY7wQ5jju6+wJVBDeNE
	u0mJoRfsyD7wz2KSZZrqOXOd3YQjbGBgMzmYbAfUzbe858c/+ZAaUywwLCBeCvupMTbr
	u4pmlEoWUeAby/4JC+6qPdcAaR/fcQgFH69+KpoZWsSn2qy8NXfvMaRprBqaN7dA2Yjk
	pQekIaKx/CccnA+wpWPuIx85lnahM4jt/rynGd/t5HYYn2w/5etPETLLxDxWbPwmAhR5
	0eVhmNbCKjxBHm6rHu+w50LrSOelHv6Ed57Njalss81nkCNxqdjFzhLVQqJ3nImMuntp
	DREg==
X-Gm-Message-State: AIVw113brsE5SxGm++QZez353XkZ5hKqAg9Puc4mBp2lJ3KvksTaYwsk
	09Vv28WGer/Igw==
X-Received: by 10.55.27.145 with SMTP id m17mr22091361qkh.298.1500920981978;
	Mon, 24 Jul 2017 11:29:41 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Mon, 24 Jul 2017 15:27:48 -0300
Message-Id: <20170724182751.18261-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH for 2.10 32/35] timer/pxa2xx: silent warning
 about out-of-bound memory access
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +8TYsjFYbZkL

Unlikely to happen.

hw/timer/pxa2xx_timer.c:145:19: warning: Out of bound memory access (accessed memory precedes memory block)
        counter = counters[n];
                  ^~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/pxa2xx_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 68ba5a70b3..d47f463636 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -139,7 +139,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, int n)
     if (s->tm4[n].control & (1 << 7))
         counter = n;
     else
-        counter = counters[n];
+        counter = counters[n & 7];
 
     if (!s->tm4[counter].freq) {
         timer_del(s->tm4[n].tm.qtimer);
-- 
2.13.3

