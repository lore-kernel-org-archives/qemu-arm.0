Received: by 10.223.161.27 with SMTP id o27csp235014wro;
        Mon, 23 Oct 2017 13:18:43 -0700 (PDT)
X-Received: by 10.129.166.9 with SMTP id d9mr9418288ywh.108.1508789923556;
        Mon, 23 Oct 2017 13:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789923; cv=none;
        d=google.com; s=arc-20160816;
        b=PzzkPHNQptLJM+jDsf/u8djhs+4pU7qFhWNtFLsO6vEcn+uRcXkB784EaCdgR0mrE3
         45PB7+qFuuBVxQMhjczf5otmb0ajGkEu7QGdFEDl9z8hDnKJpOvWk3VZ/XeFMMg5Dwg9
         ClaOHKw4n2q/zdNRCnBKhKsU+2CCPq8MLrxjUhjToKvn12N2cjduzLa3VggliVnKCD0w
         0jZ1WXOiD/Zq1jS8xIEUZ4gDLdwg1gJAJD4ww7rtpwZGtl29Sns8LtWfH1IYOxfbPpeV
         qgZtBNKqbhKjLaVN352Lrqc7+IqLpSg9+X6rB14FTD9agMFGCK3sxK0Ss47S1sCgNm72
         Q/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dNGvupyMiZVhyGQSo3di3CxFe/wwnmIFaTF8dl3LS48=;
        b=Ylyide4KWMp6f96u//vZZ42zCz3bFTjMlm6ujxJDN12lJZTJeGpFTL7bsHaMwTxXTV
         Rki4VevCOmTmntasYKcQ0P+4VrVD+sEV4jKqD6BCxlsv1zPmSSqyVtMnnPcM7YUnFVYS
         6SiSs2SENh+Ciw7BjjspIQqVUKMe9fnUab0Aqd3Hw+zGzZ0Yv0PwMTBSG9SKFgDLG4D1
         rYu1iTBMOB2SkDEFvgUL9JnhzdP/EZHmvtZJpEZKnUGMCKezrYrvSy7N+C6yagoHr7Dw
         s8b3utjaAUbv4g6N1UkBmRK5aBODCa4+TLUn46Dhku5hz0tnYkKODEnhh1MOU4yTtxoj
         1H/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MVsgNO9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si1360458ybd.526.2017.10.23.13.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MVsgNO9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jBL-0006F3-07
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:18:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4M-0000IZ-9n
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4L-0002Wa-Gd
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:30 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:53241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4L-0002WE-B0; Mon, 23 Oct 2017 16:11:29 -0400
Received: by mail-pg0-x241.google.com with SMTP id a192so12620202pge.9;
	Mon, 23 Oct 2017 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dNGvupyMiZVhyGQSo3di3CxFe/wwnmIFaTF8dl3LS48=;
	b=MVsgNO9AVGYp2RmAxXXRFp9E2yW3jjETJ5EWNbzjlunRH7n4d/q/gW/GejQ3jRui5z
	7w70aUjXQLxqHvqvJ7oZH7O9zpreZBaICfuceHOre9ahRTYsrJKiwLFsfnxCrljQui9o
	zG5CnPp19+K33WoG/cYgu/A/toeySgtbh8L4YYLVzDJbQO/JWboaNfGccGloD7qL/ebA
	L5YERk+yhiTlJdFyKPZqWIn8+obb/EdFZu1mjIS90lWQuVdc8jvvLcd+rbZHQzf2I8ng
	l3848vGsnBxszXDC79r+pjHNDp6fHWqSACB/J9DIsbkPlV+W1396Fc2D5L7tyf5coMYt
	7plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dNGvupyMiZVhyGQSo3di3CxFe/wwnmIFaTF8dl3LS48=;
	b=J4h0jcwx7t4Y1uMb7oDnPeP/GqmEkIAwd6MiaPW6jeCQ2ETC7O9/imnpl0+2K0cnTz
	37hBh8FkvzCZhBAJUhgsx8ZiNDhc9QNNHN83UeVDW+aGaZe1ZsVEsKMYm88UVKZIC/vi
	Zq+N6ssuChBjwFHPbFj8k6sNdF2dVsJdnxK1t7mBk5gI91czF4J30puGFZabYcAOuzGF
	1gQHQptx0V0Q2zzFvaN5jE5DESGxjqriLAjwVX9gQxhl/VilBeqsILRkpuwl99PFbkh5
	hgUnvoAmEA6i/wpYvgArEldYJ59qJn0k9ep5Ab2EYRFkdKmI3p/EI0hTNUxJCrDNz8wt
	lLZA==
X-Gm-Message-State: AMCzsaUMk+TQFog7ETfZEzejkYQUQfGKb3+iS749W60T/iibw4JcBT+N
	G3unIGfMUnp0a3+VOW47kiP5z+YM
X-Google-Smtp-Source: ABhQp+T2x3HtpwLBhmedQ1jyHzn+dm9ZNBh+V4f2Uidnuowi3T8KQLhEBMnDavY6sgYVv5KjSufxxg==
X-Received: by 10.98.103.206 with SMTP id t75mr14148540pfj.173.1508789488293; 
	Mon, 23 Oct 2017 13:11:28 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:27 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:40 -0700
Message-Id: <20171023201055.21973-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 12/27] sdhci: Implement write method of
 ACMD12ERRSTS register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q+BJWDCOPAEB

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f561cc44e3..53e5e011a7 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
                 ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
         break;
+    case SDHC_ACMD12ERRSTS:
+        MASKED_WRITE(s->acmd12errsts, mask, value);
+        break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
         s->errintsts |= (value >> 16) & s->errintstsen;
-- 
2.13.5

