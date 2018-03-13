Received: by 10.28.91.67 with SMTP id p64csp852489wmb;
        Tue, 13 Mar 2018 08:38:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuINwsv9P9Mc5v5oLbCe6sWU+zC5J44gd1TJNfb7Xwug+CHcfSURavyOTjZQOAX2ERDDOTi
X-Received: by 10.13.193.133 with SMTP id c127mr869445ywd.291.1520955538831;
        Tue, 13 Mar 2018 08:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955538; cv=none;
        d=google.com; s=arc-20160816;
        b=xkFhwtNr7qEcWnw7uRWFR1warlJXoVs1VZGaFHtZprXqw2ozVJhogw2rM4rucaA/Lq
         LXKVOe9h6vJ5eMg+bzz+BNwsEz59HA8HQ1D1TiEqGIY8J1skYtmrKUh0CZhhAV1U8/Nr
         lTYXkLrQh90A82ec254/gmcsL25Hhddp4On3zbjqScB1KdXZlTODETFkH0cxphWpy3u/
         WN5XUTbYY6MA7602rovpQMR0yI09vGQNXQmQgXwkRr9zZrrHtP7tFLchY2Y/kjPSykJm
         msCQiERoA2I8QZB4X5Mh6TXqpyViNcW7Zv8CbDWtw3SOkoLKwQk4Eg+myN+lH8fh7Uj1
         iZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7q/S/h/s+d+0rvFHj5+iyJEKE2u2/qG5rNt6ixZ5Qrg=;
        b=UGPsA0NMLPutASiV6RaI219FHPQs6nE2Xo/GZHA1g7buqk6K5R+UBgGyLhcNKM/LeI
         5iXsPFHaOt8p9Ixx7uD4zhYQ4LYX2gE+134j1eM8bop6Rdho0g47aelmyvCrG2tpizdB
         Ox16kDgHCds9cyVVc0nf2CaMSt1DGv8YE4sIBxTMqPlR45IqF2ek7SRg1+98byU8dXlK
         4DDL+tE4xIhwo661sP2Q4xGsG1boNbers/1gTgWE4IXhWSLw226ci7RwULd+mXGqyn75
         q5fZb2TmmNXBhQ9xOX8IwxvMfyH/hhAKFGjw5MV73ISMYMYv6HEGdEofkDRJEfSFJwSH
         wXng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si496096qkg.404.2018.03.13.08.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm0w-0000RT-6Q
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:38:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxV-0005bc-3L
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 11:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxS-0005zw-QU
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 11:35:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxM-0005j0-Rx; Tue, 13 Mar 2018 11:35:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlx9-0003F5-S1; Tue, 13 Mar 2018 15:35:03 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:53 +0000
Message-Id: <20180313153458.26822-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 4/9] hw/arm/bcm2386: Fix parent type of bcm2386
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95BBWQvnfzYw

The TypeInfo and state struct for bcm2386 disagree about what the
parent class is -- the TypeInfo says it's TYPE_SYS_BUS_DEVICE,
but the BCM2386State struct only defines the parent_obj field
as DeviceState. This would have caused problems if anything
actually tried to treat the object as a TYPE_SYS_BUS_DEVICE.
Fix the TypeInfo to use TYPE_DEVICE as the parent, since we don't
need any of the additional functionality TYPE_SYS_BUS_DEVICE
provides.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I noticed this when I tried to make the type into one which
has its own class struct, because we hit the assert that the
child's class struct had better be bigger than the parent's.
---
 hw/arm/bcm2836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 40e8b25a46..9266f27c14 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -165,7 +165,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo bcm2836_type_info = {
     .name = TYPE_BCM2836,
-    .parent = TYPE_SYS_BUS_DEVICE,
+    .parent = TYPE_DEVICE,
     .instance_size = sizeof(BCM2836State),
     .instance_init = bcm2836_init,
     .class_init = bcm2836_class_init,
-- 
2.16.2

