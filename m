Received: by 10.28.71.27 with SMTP id u27csp998592wma;
        Fri, 26 Jan 2018 10:10:04 -0800 (PST)
X-Google-Smtp-Source: AH8x225V0V5iF2r1nrCIH9c9nYdnLnFRc3SX0lPpTnnlE3GxnoNramTfzJeaw4GsSqh2VY0fY652
X-Received: by 10.129.73.142 with SMTP id w136mr11734350ywa.437.1516990204461;
        Fri, 26 Jan 2018 10:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516990204; cv=none;
        d=google.com; s=arc-20160816;
        b=KRWkPoy1GNlzPjHU0QRre2psnNo3uuk/dnORK5qrcsMIhbA28QYBBwezMqyIWq62tk
         ZOEUmUlIKSFdsx1MqEG5Ma0HCJDrIxyFKH7MYo62AeojYzqKBO1lMTEaKREw1Bs24GJg
         Jl3NQvv4t68pzaIflNa+75tiDDhuwhHloo19pbGqJMz22ftUK4HHzBLURSvcuLu9U/2l
         veDV/ZAHz2FspzbEfrq02/iu43lBmdhxPnm23kqwCm7Gu4+Y/GqZpv6RaRN1ReyvxNkC
         p2wDoVjFdqTo2NIO2zswhaITAuBsCQ3DoH0yRxAswvuGTfcE7//5Xb8J9Crg+LcaQIdI
         6Qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :from:to:arc-authentication-results;
        bh=1Q+Ay3Uc8Jz9eSDUFgsIIjdhm6rtRpGq9DDiLJnORO8=;
        b=WdHZrkdUU5pbqCI1l4cTNpH86wrDIVMkLjfiHdo/qnfC7lnbTDIkvW/yyAr++JVTHe
         GyIjiUDNtEowWuAZOtA03GgmYOdn6Trz8f4a6OR0lfF9iRTcwecLSHNZqIWjXxRqu9Wf
         a7KUpTyrNcRtACP8+QRuTBRghHvpTaAcTqH6U85kHSlhlF2bKtN86OYA9K9zZnFQNaCe
         IFHISppV68GCrNiw8ansziqHgrdP0M+u3ERFqcuyMD5ldU6s9y1C0F9FBEwrPGvd5gZQ
         qPNf9n4Kjg3y/KRSTdlCrjPAeY1KBijMHoBpmcWPAgwGjh+TM7pELWcD2UrcYoy/GZ1r
         l6Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q74si3716974ybg.131.2018.01.26.10.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 10:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8Rv-0003So-QZ
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 13:10:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1ef878-0001Pz-0a
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1ef874-0003j9-RD
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:48:34 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2082 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <xuwei5@huawei.com>)
	id 1ef873-0003dj-OQ; Fri, 26 Jan 2018 12:48:30 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D6AAE7EFE6CC1;
	Sat, 27 Jan 2018 00:00:32 +0800 (CST)
Received: from [127.0.0.1] (10.202.226.123) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 27 Jan 2018 00:00:27 +0800
To: <peter.maydell@linaro.org>, <pbonzini@redhat.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5A6B5091.8030601@hisilicon.com>
Date: Fri, 26 Jan 2018 16:00:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.123]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
X-Mailman-Approved-At: Fri, 26 Jan 2018 13:07:09 -0500
Subject: [Qemu-arm] [PATCH] pl011: do not put into fifo before enabled the
 interruption
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
Cc: Rob Herring <rob.herring@linaro.org>,
	"Chenxin \(Charles\)" <charles.chenxin@huawei.com>,
	tiantao6@huawei.com, qemu-devel@nongnu.org,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"Liuxinliang \(Matthew Liu\)" <z.liuxinliang@hisilicon.com>,
	qemu-arm@nongnu.org, Daode Huang <huangdaode@hisilicon.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZQqq+71LpOMr

If the user pressed some keys in the console during the guest booting,
the console will be hanged after entering the shell.
Because in the above case the pl011_can_receive will return 0 that
the pl011_receive will not be called. That means no interruption will
be injected in to the kernel and the pl011 state could not be driven
further.

This patch fixed that issue by checking the interruption is enabled or
not before putting into the fifo.

Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
---
 hw/char/pl011.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 2aa277fc4f..6296de9527 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -229,6 +229,8 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;

+    if (!s->int_enabled)
+	return 0;
     if (s->lcr & 0x10) {
         r = s->read_count < 16;
     } else {
-- 
2.11.0

