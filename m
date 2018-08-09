Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1873449wru;
        Thu, 9 Aug 2018 06:03:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxuqQiRypbrwJ8zWwUo4Llh0Lmq6EELzOxWxBjWNVid4CzpMPXCokeE2E2N8FeY24xw6Aa+
X-Received: by 2002:a81:128f:: with SMTP id 137-v6mr974849yws.320.1533819786722;
        Thu, 09 Aug 2018 06:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819786; cv=none;
        d=google.com; s=arc-20160816;
        b=BPXM3Mp55en90CWJm65HhmPJnMpLskjO3aXNGzfx7p3z7gWGNo6sfNBe4YbA3cjdCg
         /E/WCht+0q2V2QKYNwxhwc+YMlSXjjAQHmnv106DRNCE7OLiGBHIDo0OvZDb31rDJ5zP
         NxzGKjBnyJUHiWQ9Des34v8Tq99HTaaD2duVD7uCfyHZrL6n570BRYVCytKVMT+YRCYD
         hyTiN8OSI8aVE8iwN1PaaT+iMrzYrvK+Tuzx+j0HlTVN+byCLjg3fjr9dq8rHtOCZ5Ui
         msTfhqiClZeSFoqMxYb8dDC+uuX3JlKbLhzR3CC9LEG2FG137Z7UGV31YCukljdNW+FR
         0CBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Yzyxy7Xpo00yGZboOw0i4+IUCwfO9/1H4A3BAfZwREE=;
        b=dTeTB3yrJAwQD7VBufq6COVH7t9Ihu4DZqG6pTxsAWAQFIqZvDdqGZDe+YcCs/H1Oq
         aVqP1o4IfDBOcCf2Q4LVECK04fRWby2hX2g3Cq72kT+cs9wP6AdTKmEcQk7C5IpoSWdC
         9HmgtHS9PrHF49yFn2o9+gFfDtOiQ2C/2oVUsOquIlhv9oLCFbtl9O8ui7tr7/4eWfZl
         J73D2Rw6CmvSYw5Z3FFR1s7HTyzeVJMj7KiPoJncrxaRL5OCdZBYH0tlX2c5/k8vNf9v
         8eXWgq8YrAkqv5cv9up2lckcfxht02cpfxM6ThjXxGvHROuDv544EVvVI0H3XBEFRmxN
         W8xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1-v6si705583yba.94.2018.08.09.06.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkao-0006iR-2D
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:03:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZM-0005vO-SZ
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZM-0003M2-5Z
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZL-0003KI-V7; Thu, 09 Aug 2018 09:01:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZJ-0003Lt-SY; Thu, 09 Aug 2018 14:01:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:14 +0100
Message-Id: <20180809130115.28951-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/16] hw/dma/pl080: Remove hw_error() if DMA is
 enabled
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RTyFx6sk71ja

The PL08x model currently will unconditionally call hw_error()
if the DMA engine is enabled by the guest. This has been
present since the PL080 model was edded in 2006, and is
presumably either unintentional debug code left enabled,
or a guard against untested DMA engine code being used.

Remove the hw_error(), since we now have a guest which
will actually try to use the DMA engine (the self-test
binary for the AN505 MPS2 FPGA image).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/pl080.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 8f92550392b..ef15d3e628d 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -110,7 +110,6 @@ static void pl080_run(PL080State *s)
     if ((s->conf & PL080_CONF_E) == 0)
         return;
 
-hw_error("DMA active\n");
     /* If we are already in the middle of a DMA operation then indicate that
        there may be new DMA requests and return immediately.  */
     if (s->running) {
-- 
2.17.1

