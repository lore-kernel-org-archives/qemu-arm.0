Received: by 10.25.85.209 with SMTP id j200csp1164836lfb;
        Mon, 13 Jun 2016 05:10:25 -0700 (PDT)
X-Received: by 10.140.41.178 with SMTP id z47mr12791242qgz.25.1465819825799;
        Mon, 13 Jun 2016 05:10:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k137si14978631qhc.67.2016.06.13.05.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 05:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCQhF-0001pS-3j
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 08:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCQaT-0004VT-7b
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 08:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCQaN-00014G-FU
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 08:03:25 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:50171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCQaJ-0000mY-1R; Mon, 13 Jun 2016 08:03:19 -0400
Received: from 172.24.1.136 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMC27162; Mon, 13 Jun 2016 19:53:04 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 19:52:57 +0800
Message-ID: <575E9E28.3070208@huawei.com>
Date: Mon, 13 Jun 2016 19:51:04 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-22-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-22-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.575E9EA9.010A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 922129505dbff6b9b9beeaf45dbb566a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-devel] [PATCH v2 21/22] NOT-FOR-UPSTREAM: kernel: Add
 definitions for GICv3 attributes
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zjMHomd2ZWYB



On 2016/5/26 22:55, Peter Maydell wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
> 
> This temporary patch adds kernel API definitions. Use proper header update
> procedure after these features are released.
> 
> FIXME: not-for-upstream

Peter, What's your plan for this patch and next one? GICv3 emulation
doesn't depend on them, right? If so, you can consider put them into
another series. So this series could not be blocked by them.

Thanks,
-- 
Shannon

