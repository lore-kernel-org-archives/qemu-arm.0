Received: by 10.223.172.38 with SMTP id v35csp4139077wrc;
        Mon, 18 Sep 2017 12:53:50 -0700 (PDT)
X-Received: by 10.55.32.138 with SMTP id g132mr22120751qkg.122.1505764430005;
        Mon, 18 Sep 2017 12:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764429; cv=none;
        d=google.com; s=arc-20160816;
        b=bp+HLnS1FtPtPPve+SNwHhDGgwa3MNwz7D9y/qJnTYoMEGY/NxaoH3nkzuCOCs9qQn
         CwZ43xqB5Xvyj6FBoJauo67bEeRO7qAd6WAILaoMECjhFUVL/cZrd9a4zEw8/OV0M71T
         JOuNCsHV/CizgfMaFxy2pJ4yO/S3eFNjURyTfX3Dg/dHXFg/0ovfuJ17jo3AXCVUt+rC
         r9jYeOGksVYHRmVaT1G0EEKMb8SLg2xC7h5F1FX2qpy9sfuw7Giwi3iZEFO11lRsorPk
         JmAKjtzJrXrap7TQ4ZjRRkHnZpxyWPzS5TX2XYqsbvIBUMmCedTLEtM4ZKEvoTvVSqeK
         cqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=piLssSvPtzQ8bolhFAIMo3F7SGGBlrixXybpM9zgRDw=;
        b=FmPGcBp5qug+YD0elezyHBRJk7SiU+xiv6dxk1tRKDAMuL+DeS5WXFevziwgBP8mHP
         BFvp4k4H2TKI+IbyE0qsGoEw0cgKaJDHPUgozQOUaI8qWqQp7aClwrHdKNWlAK6ZXxJR
         iLKkSurbmf4myIQ4SAd5iBeL/DJLXDzjCGvJBz/Y6QLR54Apy7BfITj8Gu871MPf4Wtb
         rniAuJrHveMs2z2hNSVUx7y7w0WiUge4o5VrkunDVkEu8oFGcXIj6XSbSSxFPdmzzvME
         9wYnyt3uCHB6NdLyzoh5kc9wkkRxywItKK8ivSgBBpvNy38L3102DYb8GuBrDgb0fo6d
         O/Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LR2Hksjq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w30si7763413qtg.81.2017.09.18.12.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:53:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LR2Hksjq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du271-0008NV-NN
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:53:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24x-0006tL-BH
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24u-0006Jn-MG
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 15:51:39 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:33827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24s-0006IF-PC; Mon, 18 Sep 2017 15:51:34 -0400
Received: by mail-pg0-x243.google.com with SMTP id u18so658701pgo.1;
	Mon, 18 Sep 2017 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=piLssSvPtzQ8bolhFAIMo3F7SGGBlrixXybpM9zgRDw=;
	b=LR2HksjqiA+GytS7SV93rglZHPE97FI/u98yIdPpc+rSoGRgSTVEfzLvaK4OpBgFn4
	tW7fh7OvZLSYScqX8jiOdwe7G6qONtVjb66Qvd8JY4su2o+IXJu/7/DQlRLXe0iCBh6k
	snIHKAoCSPz3xQ+/sXJBgIRjiTiBi4Lld2KFbsj712I2oY/9P7O3Po70W6doAEbYXjpe
	JuzJBL3DfpjrSq7Jv89dHy0vG8gRiKcQMxivctgt/CyLD0H1avKhURDhHDve0uqTIOQL
	hWxz6oLI3W+BLNgHJOLIaPht64HjvlvhOiwRe79o4Un6uYRcdwCW9nD0452iFZ6oRajd
	aZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=piLssSvPtzQ8bolhFAIMo3F7SGGBlrixXybpM9zgRDw=;
	b=l7A80Yw2C3ZCqTKu449wE48A0Ry3NXQ7RNvJkUSqQ2mUgWLrSGxMxzVqxxhWAxP30q
	lGt9+KQgkUmAHTn+8LhgXNpWVRkumdlECxkEk5UBoEYVwfUyuUwReE4wMB0w0s/8ifHV
	nq4NGdMTvezULepa+bfYX7mo+K7zitB9vgZZnRAVgLcMAiTM7jL1GkZp4GITWy3SO2xS
	3fKWjXMYG8pnRlBs8TXMqNabxVPmeo/2G93dcCfXLIHX8+D4lcp3+bAuivTbeeF43d7Y
	D+rh5sg7ccIMUcVcK+Tw7E3a9kdnmdDJbbYMIeTyMWE95n468Qnox9Yx0ZgUHtTmIV6R
	lRNA==
X-Gm-Message-State: AHPjjUiBzpqmDbC0KKKJAw0C1wo/g7jGYFRHAQ8G8EOEaqN4KPB5mcCb
	oMm4HRqTpE81w38EE1c=
X-Google-Smtp-Source: ADKCNb7HBghnFQd+UlZFxqdTHWYiNpYmoMug6oNqpI/LxWgAGqj+51vptJkj6q1N+vjQ/X21SSOkKA==
X-Received: by 10.84.148.203 with SMTP id y11mr37186828plg.277.1505764293526; 
	Mon, 18 Sep 2017 12:51:33 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:32 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:52 -0700
Message-Id: <20170918195100.17593-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH 09/17] imx_fec: Use correct length for packet
 size
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8KoEvwjm7F3H

Use 'frame_size' instead of 'len' when calling qemu_send_packet(),
failing to do so results in malformed packets send in case when that
packed is fragmented into multiple DMA transactions.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6045ffe673..c45b9648d9 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -532,7 +532,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
                 }
             }
             /* Last buffer in frame.  */
-            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
+            qemu_send_packet(qemu_get_queue(s->nic), frame, frame_size);
             ptr = frame;
             frame_size = 0;
             if (bd.option & ENET_BD_TX_INT) {
-- 
2.13.5

