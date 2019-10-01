Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8382850wrp;
        Tue, 1 Oct 2019 09:01:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxteMUtDuyiQtsvK2y64SON/p4E9xTa73DSi9tpqlIgtoE9BgqcPJHX4Gw/n0N5prHukn1N
X-Received: by 2002:a37:912:: with SMTP id 18mr6763325qkj.185.1569945665858;
        Tue, 01 Oct 2019 09:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569945665; cv=none;
        d=google.com; s=arc-20160816;
        b=Xz13XkrhUqb1nr2ESytWsq9FdTfSNczpMA6C+tIefmw+FHoPUFqmki0hu5EHMp4L6N
         s3kCIJ870J7emRMxNwgO8Fd4etiqkBFAjGb53zaSuNw6amOedWj2rOggynKk76+/wNh/
         g9kH7BdLssNjSwdqTVSZNEgyw0R1IH4gykTHkxNSQiMWMY9MmzMFVpb9UT8tuZmNZz9g
         1/TdwKifrf6irmzFSraI+Ypeywo8R8chbWm3JSGE74+j23Pf1Eb3JDlQuIxqiQMzdZFX
         77cIRy43mIvAUyvAxCzMSC5xlrKCR9IUuEsDqoo8kZGs6PR9kYYN88wsOR0krpUFbEET
         L4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2f4hQhSLnIjbo2KGSeXghk4NVGigQ4HZe266C/l1Yr8=;
        b=Mx+MJGd/8fsnslCKeF6pss1QGYKaQ8VzastGPrKd6Cfggm54pEImRxfyXuioQi0HAa
         3CQob40hXvmMNhRbGLuRiDl8kNAs8Dieuzrv9WW2QL8ccV8cHtsSH5ap5Wz/geEvw52D
         0Swx7KutCFnJOzEg6tQGq4cJDloRrDoU41yHsrA7SDYcKw4a88wWzo6Vexai9a/sunia
         80zXIwNH5yxzp8cWwPsN+hLbSa/yGrYuvOlZg8ZQMp6IQuglMUsOqJi2ZfTVzP8x/jP0
         ShDNNkBuUTrFWDCFtyBbueigP8b1MRQ4jEiASS9PiZ6fylozRyvnIA+G+FQMQ2LImhGw
         21ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n41si15503017qvg.103.2019.10.01.09.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 09:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFKaG-0006r6-IM
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 12:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFKT1-00083F-Tm
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFKT0-0006Y6-N6
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:53:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:38378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFKT0-0006WV-C9; Tue, 01 Oct 2019 11:53:34 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFKSy-0004xb-G8; Tue, 01 Oct 2019 18:53:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/31] ASPEED BMCs: Fix error_append_hint/error_prepend
 usage
Date: Tue,  1 Oct 2019 18:53:00 +0300
Message-Id: <20191001155319.8066-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155319.8066-1-vsementsov@virtuozzo.com>
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrew Jeffery <andrew@aj.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lsl9vKhnmZyY

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
Otherwise, this info will not be added when errp == &fatal_err
(the program will exit prior to the error_append_hint() or
error_prepend() call).  Fix such cases.

This commit (together with its neighbors) was generated by

git grep -l 'error_\(append_hint\|prepend\)(errp' | while read f; do \
spatch --sp-file scripts/coccinelle/fix-error-add-info.cocci \
--in-place $f; done

and then

./python/commit-per-subsystem.py MAINTAINERS "$(< auto-msg)"

(auto-msg was a file with this commit message)

and then by hand, for not maintained changed files:

git commit -m "<SUB-SYSTEM>: $(< auto-msg)" <FILES>

Still, for backporting it may be more comfortable to use only the first
command and then do one huge commit.

Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/watchdog/wdt_aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 9b93213417..a70d6dee63 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -243,6 +243,7 @@ static void aspeed_wdt_timer_expired(void *dev)
 
 static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
     Error *err = NULL;
-- 
2.21.0

