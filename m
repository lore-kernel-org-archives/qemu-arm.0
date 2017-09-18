Received: by 10.223.172.38 with SMTP id v35csp4140205wrc;
        Mon, 18 Sep 2017 12:54:59 -0700 (PDT)
X-Received: by 10.55.82.194 with SMTP id g185mr9695013qkb.282.1505764499151;
        Mon, 18 Sep 2017 12:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764499; cv=none;
        d=google.com; s=arc-20160816;
        b=VKUHWRDJk29CM+vJMkKmoNxoFHstCj0XQeKeV/s10HF0Rb9YbJ+Kd0lCCfub67cHMX
         eHCwhrdipFWm0a7j1iEZIz2R2Tb1yIPwBYgvdtEgVrMhk8gbPx6sHYx5yAdZFrvUUnMQ
         diM1FDCfw0266fvcWLUCMN4XaNdBtqV05Gpi4Yzf2DKphBLZcMj8gJiupRdLNJqp1mpb
         6klMrHXNeqYiEml4j2YCQTxyXnK899w8zL4Q1c8+MQ65YV0bF4mc1jRx0TwCf+lWXnmb
         d0RQY1dyDzIHyJ+sOxXAIYdJhg2ICa84FnfmayMhsTg2jisX/NRTpTjvuIb+LKL4I6pO
         P2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HQ958ER2hrScn+TIeN3g4iCb4dqKDWOI7wizkj8UUoc=;
        b=ilohTMCA61IDzw+zZlNeTPGbb4Oye1A59O2TZCbtzKKLuimQQxgagCrdfxirDfr+9V
         OpNUsIbf1m4AOhXNXciewBaXF1dBusuhddobJgBtffjMHDbfVWMqGKC3GLiQJLp8bsA6
         DntGFK8fSKS2xHQ9GEsZhk9p0g85cASeH9sJ1Igcy487LCVjI80TGAGOHplGvN3uJl5K
         jMab/RXwC9Kul+sY4pF+VGyVvRnHDyVMEHtcQHCu8XELwxCMiM88wN+CVF91qDmXZvR6
         yXT8gf4ojQrMMCtaO0v+3/OUpI38Z2uF/JvIlyzzGP3RiciO9VZM1TTF3ygIjIZP9NRg
         aTJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V+NhDcHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u79si7548592qku.7.2017.09.18.12.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V+NhDcHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du288-0001Fo-O1
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:54:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24z-0006yb-N7
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24y-0006NF-OW
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:41 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:34994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24y-0006Mu-JE; Mon, 18 Sep 2017 15:51:40 -0400
Received: by mail-pg0-x243.google.com with SMTP id j16so775373pga.2;
	Mon, 18 Sep 2017 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HQ958ER2hrScn+TIeN3g4iCb4dqKDWOI7wizkj8UUoc=;
	b=V+NhDcHoxm637VHw7qxSMxN0NGFUoj8mfQK6GjxMbNHZCA8efx273c9UQW6Cg3OS+e
	h9cFqUNMat113HRnS80cWmSG3UkAA5ijvyjHdZaK1BOO9S79dVsvmOwezv7crmROqcBV
	WkkxLWyDin08K7Bj0xgFfJKSv9fyIjhtJ8PeXBd1ggMuBtLAhFebWkThwXeWvyiU+J5/
	4b5BBIGDqcmxmUIjKDq+8qt9dONsAsvXsA7g9a+i3HJe1j9wX7RjljM1JUdmjp0YAsZE
	uyh5VnqZcH0kXG7kNF6LsLRbgsimq9oxO+YnCqjg9nIFfswEbiioUrLzlC6IuF9MWyRF
	JYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HQ958ER2hrScn+TIeN3g4iCb4dqKDWOI7wizkj8UUoc=;
	b=Ah94qBB+rLcCQiWKs4dtIoROhGZU4pRdltybJ26Vq9av7CEMycIvLjPvD7vtKCaReY
	olCQWXpVRdy0123brwwYHZYNr5i5lYT4tkWJjXSE0R4G5B4MAHhFe1aQpHj85y3F9Dbk
	U5/g68CPYXErRWvXPq4hH1puICAAhEeS6a1bH7Q3Um00F5Rwh6XDIkOWZBpX9qaUccwO
	QRn7Nlity7OvgvDHX3RTbH8nuFFFUCrh0PDcL1x3bAqjxTtXkI3QmDz9jKvhVeMw8LoT
	kf3JV+hnoI1PZPgRcP/AUoSI2etEjl8cTS9jZItH0G2upA7v8rwgTaBaRWLWrz61dIaA
	j8UQ==
X-Gm-Message-State: AHPjjUgL055BhVlQ0RoBMwgdbRyHDaTJXXkVWCD+7IADFCCUP9NqgmKE
	zuj95ZuPKdWnF/GkEyw=
X-Google-Smtp-Source: AOwi7QC2Z0Hq1WEF88ZOXzkVJcaxeZatV7/OuXoL1MOQVBAXshQGBAf9gFSB5KWPid6a3I0g8b5mcA==
X-Received: by 10.84.233.66 with SMTP id k2mr14943254plt.134.1505764299390;
	Mon, 18 Sep 2017 12:51:39 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:38 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:58 -0700
Message-Id: <20170918195100.17593-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 15/17] include/qemu: Add sizes.h from Linux
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGYW7lD1HSUS

Add sizes.h from Linux to have a more readable way of specifying
MemoryRegion sizes.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 include/qemu/sizes.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 include/qemu/sizes.h

diff --git a/include/qemu/sizes.h b/include/qemu/sizes.h
new file mode 100644
index 0000000000..9aedb9f8f6
--- /dev/null
+++ b/include/qemu/sizes.h
@@ -0,0 +1,47 @@
+/*
+ * Copy of include/linux/sizes.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef SIZES_H
+#define SIZES_H
+
+#define SZ_1				0x00000001
+#define SZ_2				0x00000002
+#define SZ_4				0x00000004
+#define SZ_8				0x00000008
+#define SZ_16				0x00000010
+#define SZ_32				0x00000020
+#define SZ_64				0x00000040
+#define SZ_128				0x00000080
+#define SZ_256				0x00000100
+#define SZ_512				0x00000200
+
+#define SZ_1K				0x00000400
+#define SZ_2K				0x00000800
+#define SZ_4K				0x00001000
+#define SZ_8K				0x00002000
+#define SZ_16K				0x00004000
+#define SZ_32K				0x00008000
+#define SZ_64K				0x00010000
+#define SZ_128K				0x00020000
+#define SZ_256K				0x00040000
+#define SZ_512K				0x00080000
+
+#define SZ_1M				0x00100000
+#define SZ_2M				0x00200000
+#define SZ_4M				0x00400000
+#define SZ_8M				0x00800000
+#define SZ_16M				0x01000000
+#define SZ_32M				0x02000000
+#define SZ_64M				0x04000000
+#define SZ_128M				0x08000000
+#define SZ_256M				0x10000000
+#define SZ_512M				0x20000000
+
+#define SZ_1G				0x40000000
+#define SZ_2G				0x80000000
+
+#endif /* SIZES_H */
-- 
2.13.5

