Received: by 10.223.134.117 with SMTP id 50csp12243818wrw;
        Wed, 3 Jan 2018 10:44:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotNKCfHF8Ju5GwUXLKYQBi/zDIKbXmMnhQimQiiq6FmnEB5vcIVlLZ+UNbd0FlY85WCv3eF
X-Received: by 10.129.119.86 with SMTP id s83mr2241866ywc.302.1515005041209;
        Wed, 03 Jan 2018 10:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515005041; cv=none;
        d=google.com; s=arc-20160816;
        b=ZmDv4iigBDZ9TmBr7Vc9kHNWtmd/aeKzZPL2F5GFsgKLqgG614ke4XKZA8jEO6VbER
         jhaLkkg39zgVv1LbADV1S1WyAFBpDWAeUBkCK3fsbx21dLuUw9+AATntS3tZ/7SGQtKb
         F/hvkjA/YiCuGY24IUGMwOq/iFwqhlgCE5ZW91TwLOyuKlS0kjrLQMQdMnIQQgKMOr2F
         PZy/NU/hMBA6qzHkvTgsGUmAnrhKhENJN9MvHPTWW7j5zGG4EX64INOJxlvzpws0y41y
         u5IdP0H+xXm0Cdd6elb/u+g77/apD47TjUP9iUEkA22jgXdUTugTHYjOHWLkmi38dAvr
         cdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Mf5sMfrAQgHlXLJqlurRhi790VW5gkg89w7JnRZuUQA=;
        b=hnEHP5wJiu4xaMwqVNTc1JewkwxBHDA5EeVeFATZBHIP6zV+RD1sjOhKZ7hezrLPLb
         c1BrqVBbuefGiaLbSa6XgaBWwMnL9hgF1AqnbK6Hgxj86nEd80cQpSn80OtvoD9TK4EU
         JEKgVaRxWZHrfDJcT9ULCjJYpM/+lNo0uD3O++Ix0a4tR9XxqBgnyy0FZon9hlQVufbf
         p0q5IIaMPMfTp1XtSt4H5d9Nad+c0i8fNMHolaxSGnZl44XG7VD2Oi3SWEjy+w+a7nuN
         oa6VqdBTglDzq2oP1GvBhxzKha0EZLIUAX4IXla+UJ5TatRcYqmmelx9tIlxl0//rsGT
         kgxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FzNvuOea;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v188si340305ybv.688.2018.01.03.10.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 10:44:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FzNvuOea;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWo1A-0003YT-JR
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 13:44:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsj-0003dO-KE
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsi-0007mn-L2
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:17 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:42486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsi-0007m4-Fi; Wed, 03 Jan 2018 13:35:16 -0500
Received: by mail-qk0-x242.google.com with SMTP id d202so2655890qkc.9;
	Wed, 03 Jan 2018 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mf5sMfrAQgHlXLJqlurRhi790VW5gkg89w7JnRZuUQA=;
	b=FzNvuOeasul3C9RYEKKvWomwSL+3ZqtTmfwXyYgzDMSPgW5WUwiSwzBht13xDd0Lvi
	+KVzyIeax8Upy7O0zfQYfB4DLH3YkmOUda1OaB/9c8wfRRfxGpMyHaOZtcpqEb8qOr8y
	ORoA2u+eQjM2T+y1mfFiYMgsam14UtMlz6MvHbKawfRWHC1g/OB8NUQxAZdA5Xl4ZhSX
	RlJVyshNl4QAg+LRfeToovrL+zzT0WkYSs4yzEqmrnBQeQNtjg086SRuwSfkwQ0aQNRF
	hy//C5SQrghnEvYV6kRDsNU3O5VjwVZK6iUwhC76setoKHiShsC0zgrhiAEN73BcZV+C
	dlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Mf5sMfrAQgHlXLJqlurRhi790VW5gkg89w7JnRZuUQA=;
	b=Y39/HXVyAzpL/QAwQET+CPpuff4wFeUrLODun15cCfzKPQCkWI9MGfJlSOrQ7z6Cui
	+6dOQ2apkhrnQ3bOLIThdIqcIMUoJ/ZYiwhnSaCSJWlTILc63hhqIoOTpx6x5Uazwik9
	CDPcdVc9cGt4Nm94k/IQsxcznXbw+SjmI9PMDdIFw3dHntXWaP/+K3ZovRK1wWM/MHOL
	1gjTNx5/OowhKv8JDecONNUqvom+tn1aNUfXAYZAKm19mqLkCtD+Jz8KysExaueHtOqu
	FFeF/Sb6+B1uozI+uXs//4cVS6CQIh2V8GCxhLq/U6VIMBauE0b4VA1svHp+tMayl1bR
	I+IA==
X-Gm-Message-State: AKGB3mKxY+fvX3srOhI3pCWD+GfpaCysdIezG6FUjZ+y1x1jGTc0ndmN
	hwwErOA+jNKcsjTsSDEausg=
X-Received: by 10.55.147.68 with SMTP id v65mr760854qkd.70.1515004516008;
	Wed, 03 Jan 2018 10:35:16 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 185sm992854qkd.1.2018.01.03.10.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 10:35:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Date: Wed,  3 Jan 2018 15:34:10 -0300
Message-Id: <20180103183418.23730-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103183418.23730-1-f4bug@amsat.org>
References: <20180103183418.23730-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v4 17/25] hw/arm/fsl-imx6: implement SDHCI Spec
 v3
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: slccpodFFH2X

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 59ef33efa9..d4de428dbc 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -348,6 +348,18 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "timeout-freq",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "clock-freq", &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "adma1", &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "1v8", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.15.1

