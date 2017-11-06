Received: by 10.223.150.237 with SMTP id u100csp2789544wrb;
        Mon, 6 Nov 2017 07:55:49 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SI2MP2g2K3QUienbUlNSarpkqei5h5Gk1+kY7e/0btU1wNlRuYU647ei9gfPeWeIuV9HKP
X-Received: by 10.37.118.193 with SMTP id r184mr10126546ybc.422.1509983749186;
        Mon, 06 Nov 2017 07:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983749; cv=none;
        d=google.com; s=arc-20160816;
        b=zMJR4YAd+Qf+hIqa9/GEGFzhd58Qw0htdBDZm+g3rdElVQW1y/IJWtKE3GPKS98Szn
         5a6HBKKRIskQDT4Pd+w2Mhf0c7Uf1JmrVFyAbjisB034L9GfSoQO8VgeLoYE8koiN8iK
         b+0FsYPToBr9Hu69BFtg5/aT1NZdk5hMtJg7Nj/WrJdl6Uv0Sv0bI/r3aztJnAH1jwih
         /pNa2EDMQ8dIC+KIhCpx9OoLaQ45MefRV0jTuO/X3Bwnsm4ttGiJ8wTJua3CQ51/y4kA
         YQZB1j1zkrl4UCAuf9KcToUMAHbAWg/KevCRuT77vPnGIPPVfMlW4x8MDYWzdrVmyh3H
         JX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jScNC3NFNoEqxEt3GK48pSNWLrAousR26B/oIogoBTM=;
        b=jQB9ZMyJ4sq7a7LLxIOUcAtIXny3t4B2RKDn0Yu490A3u2417QKvaz+xsISIEcbM5L
         37XRlLYscaBc6HU38xUwgSqIo0ZJjAJ785w9w/WXSt/y7VuOFkaG1kvVi6soEVq8IjxZ
         GmxjUYT+0oEicdCQsXkZvD3JNIWVvOTS1lORwQDEBeaA2KmjKn8ydmWx7qAjNLg8GHSs
         V2159cG9KQZYAPSC8O9sdFN4+Y8hec77Fb0tZJCDRkyvDFNoDYOZWiBCUNaz/0KskZMs
         XuwjqdDDB1KZ1aSXhmmjW49BO+U5yDCOYqgrvVDB+6SYuiFOpC1NjWGfQII1I6TNzgb0
         terA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AfGg6swH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g72si2824220ywe.35.2017.11.06.07.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:55:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AfGg6swH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjka-0004nU-JX
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:55:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdj-00079w-Ng
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdi-0000Uz-U2
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:43 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:44213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdi-0000UH-N2; Mon, 06 Nov 2017 10:48:42 -0500
Received: by mail-pg0-x241.google.com with SMTP id j3so8525342pga.1;
	Mon, 06 Nov 2017 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jScNC3NFNoEqxEt3GK48pSNWLrAousR26B/oIogoBTM=;
	b=AfGg6swH0yzQxJajrhTe0rmWlL0VmqmyPFnYJ98D9pRrJedCRr0JvPbe6OQYmt41jL
	YAGkLMEgZ/IDz3Dk5LPJAjJFXSm190DXnu4F8hJS5atActvfUC+dsd1faGes+MZ38RrY
	DLxohRaJnigbSvZKW3tP+h6OAjSz52/KdiDS7bsMaDIJYZycesCMEenh40KEo2z7a/Ph
	c/IAAe7TaDe8aev1NWb+NDv+ii1Ed4ZqFx7rVtEmpwf65sB87/RjIdp/cQVo+E1GH9lN
	NToE/IKhfS5sOR6l3ATamJ11zfWUiq6VlbW3p6pPyjMwA5btygiwszT4Mb/i3Bgx3DDR
	89kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jScNC3NFNoEqxEt3GK48pSNWLrAousR26B/oIogoBTM=;
	b=kUJ1ED6yBl5RdfteoWSdxxK6I/3qf5eIF/ZvNFUic4oK9ycDK4b78uNYpQwKqw43TO
	8+6CFDgwFIXjpGEudAnkuXBnJQEZMenei11Zhfwx64SscT/p35rL0o3xMs/Q3cpuet3K
	UAFrLfXqTA0nWUWrr95LfNWWhXNVDk5AVh9ZzEAoqxm7Py0cKDbM09NvidI1ycxatXcs
	Shw2nuyBuiuzIf7aVcksVdoRiWwDf4F9x3el7Cqd90QEBLGHOeqen3C9zQFz+9Xah+0v
	Kvka/JEbJGOtubgIyUzi6vb5yUiJgHyI2jZSiHEz8XaF+m/ABh7LCVnttWO8gZB5ePLT
	Pupg==
X-Gm-Message-State: AMCzsaW2g/A7eCxwpCMG0YUQRGKxCcmCEHIuZxsiBZKLe+yO52FuzCgb
	BccJSzRaCPZW4Qlr/Ke68J4hHlVTjpg=
X-Received: by 10.84.132.66 with SMTP id 60mr14820733ple.225.1509983321512;
	Mon, 06 Nov 2017 07:48:41 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:40 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:55 -0800
Message-Id: <20171106154813.19936-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v3 12/30] sdhci: Implement write method of
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
X-TUID: 9ZYKrUnZzAyK

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
2.13.6

