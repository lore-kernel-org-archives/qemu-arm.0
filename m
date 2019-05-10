Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp95792wrg;
        Fri, 10 May 2019 10:43:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO5L4yi/3wb+MOY2UhHEUVxjGL3/PzwaAvbaG7DeOs+npnuK9ToDooveopKnPh0AgfVp52
X-Received: by 2002:a50:9d43:: with SMTP id j3mr12268383edk.59.1557510188650;
        Fri, 10 May 2019 10:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557510188; cv=none;
        d=google.com; s=arc-20160816;
        b=EugdifD1AfGdmKBlk3POru+XZdPK6uqZhezTP09fRiFFrIRQ3s4YO7RIDNCM81G64H
         5ASz1Qc9wJPe8BnJ/F71nNKB+MKW8I7IcK7JOVKTaQWCdrAnK4jbWTb6ha8SGSZ9kUNU
         wXHyLgNC08es849ftqUE5aDug52NpBa9yvDj+WPN6pcICb2IAA3UQwmdsrQK7oZ9n5uv
         9am2NwwFJQsSOXDtKpRb7hqAuMm01+o7PRIZgPxzI5RuxB/8zUcNCDQGGlTt6E9pEY/U
         wP/58Nwo5OhqoJ9oZxcyU5pOccajawFoPjTZcO9zpS6JCGY3ejllmH8P8pwmd2lkuGDs
         /6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NqFQGLUWEK2q+OruuYLxByccY86fvPfXVx23TDmISjI=;
        b=VdGPBLzPVcqsnCLOIyEt8GnXwuclvveig5no11GBVEa74fk76VQJvlkkp1vqSuSLn+
         jN7E710+/aB1/Cba5oe6Zvq6ADo1HCs3jlv48vKzZshfFw4S1wHbOiuJ9ycjNogTVE7N
         McYprq1F8N2gp9RRn7ZvZFewsDf74zcYfri3dARjhpWFnleNaIbmI7dKHupA5XaW/j6/
         NEF52Ur/6nmgqVYHEaqCeQ15ioBDPtlsTaslyVqxTaaFGifMyUp07AIG6WhYY+mALN6n
         3TXZ+p/gJr85cQsvGengYawHiJlk+26VhyGQrL/TJogvrW19pUK/sWhd4cJ5SMTcVarI
         4jDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zu8XjrqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si3514703eje.251.2019.05.10.10.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 10:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zu8XjrqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hP9Y3-0002gW-L1
	for alex.bennee@linaro.org; Fri, 10 May 2019 13:43:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP9MY-0007Ul-Ev
	for qemu-arm@nongnu.org; Fri, 10 May 2019 13:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP9MX-00069P-B2
	for qemu-arm@nongnu.org; Fri, 10 May 2019 13:31:14 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44171)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP9MX-00068v-5Z
	for qemu-arm@nongnu.org; Fri, 10 May 2019 13:31:13 -0400
Received: by mail-pf1-x441.google.com with SMTP id g9so3565078pfo.11
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NqFQGLUWEK2q+OruuYLxByccY86fvPfXVx23TDmISjI=;
	b=Zu8XjrqUMrWf6XQgZqoSlfd933QyJLsMUJQuNdp2L7GFynd9RDOEw1hWF8yxnOzvlw
	i8NC2LAfv2ISDvMhlXDqvvmU0yyNejuABQKu/L5M05RTWlIlo38v5VuKLPD1Pu/RCtBH
	c8dlidgMdExoOB95L+z/Yo/VhCdJBDf1HUUwfs1nk7FBtaqp5MVzgz6x4Yms4pd42Ry4
	gd9bqMWeqHjidCpR3gO2ShzKlVYfr5Cg6IS2TAVFEtwPplwynNDJ4Lku7nltwjQivkUN
	qUaOPK4OXKwO3LMyBGDkF6Cr41X26Ya1fWH0nf++KBfnx5554yDEFiOn7ls3xwUHcPRu
	QFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NqFQGLUWEK2q+OruuYLxByccY86fvPfXVx23TDmISjI=;
	b=r9GG8oYkliU5JqY3eMCglG5/o4UK/+pkHoAR5YQtG0Qcid782EiERwMcql1C8CozNb
	1w7TLIohmiXkgEaIgxZKy7fvYP4mCHCggrrkLqEoQtHViskzxKEKILV5CWjruxV9BaC1
	1g3WsoH3IuoQ5jctJJPHYBymjNCY2gmYiA6XT1LqCuP6uy2Gzu9Yrd69J+7Ib7CRk3wb
	+9FFJn0SDNeiZXKZYmk7yElwTAvtxZrG8Wfbz5AR4IkqLmxl+Ep5As7Wz2c9kc2JMlQ6
	XBQCaZprhoIDoqlG7tKf4mYYzuErSZWH1Gi5jIIZZjC72JXPLnVKkqtiV6mntYxKfKEZ
	o0IQ==
X-Gm-Message-State: APjAAAVcodcgMXOwbiaHqp3v1QvnSvdB4J3tfhALPjNGWzAIaqSnwZx6
	LKzwnsFvHPamQo0ieYC6FtSdWQ==
X-Received: by 2002:a62:4ece:: with SMTP id
	c197mr16128216pfb.139.1557509472366; 
	Fri, 10 May 2019 10:31:12 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	v64sm7936792pfv.106.2019.05.10.10.31.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 10:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 10:30:41 -0700
Message-Id: <20190510173049.28171-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510173049.28171-1-richard.henderson@linaro.org>
References: <20190510173049.28171-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v6 17/25] aspeed/scu: Use
 qemu_guest_getrandom_nofail
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlEHsAYzosuj

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of rolling our own error handling locally.

Cc: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/aspeed_scu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c8217740ef..ab1e18ed4b 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,7 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 #include "trace.h"
 
 #define TO_REG(offset) ((offset) >> 2)
@@ -157,14 +157,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
 
 static uint32_t aspeed_scu_get_random(void)
 {
-    Error *err = NULL;
     uint32_t num;
-
-    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
-        error_report_err(err);
-        exit(1);
-    }
-
+    qemu_guest_getrandom_nofail(&num, sizeof(num));
     return num;
 }
 
-- 
2.17.1

