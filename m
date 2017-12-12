Received: by 10.223.159.74 with SMTP id f10csp3447401wrg;
        Mon, 11 Dec 2017 22:08:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBot+iXI/VvkJXvoTadIX8eK2L1bc4FhjtTGXpaNPaVfMw1GuW9MCVvYLo7ieQCc7VgS9MnyP
X-Received: by 10.13.220.198 with SMTP id f189mr2152721ywe.9.1513058931033;
        Mon, 11 Dec 2017 22:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513058931; cv=none;
        d=google.com; s=arc-20160816;
        b=pAYpVC0gBgQTixim2R33HXwIql5Vw2xgwyHX4wXYirKvSXTXc5nK7rC8q6+ZToXJqk
         2aFfP0albeSztk9t2Kq/U0diTQidpHQ8Xh0wmQXCkHCbLbkIQQsRlUt/VqVo7NGcz+/1
         0E8CfkVDFQUrZDMTM5cxPIqOcJkHL92pkT1TJOrk7or9xv9nE1M6fd8awClN6r7Zoss7
         W8P++21Nk72PCtyMdGwAUNuvcnaT53BZWGqBhdzrSUmG82QBnb2U1JMXn8amQ/AayV+6
         HOCI01MEo/dnXYZY2qqTEzgREpqIkmeeMyJW5VA0ULubIp1b8DvxFL1ib2vwJY8kNaGF
         XAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=ZwKXRT8jHGl+jyfbKKFwsgUgFha3Tz8Xzdxpa5Hj6s0=;
        b=Q0z5h+JWHe4xZwUCKGjayqFk0Adn6TNoOlu2uka3J2SkZG/ueeOgVZemAEIgWA5L1B
         JoforR189kQkthuDEQR4oXn1I/WO4lBcx0W0ePqXCMleg6oFlI6CZeXCghUWjXuuvtbv
         XCi3UqmrbleZ4glILGbLMHFh0S/8Dt2A86kH8hKH9yiDrAS+n6H3nuye0prXNxL0/Px+
         75/xXVgve1d2o3pd0300v0fLfk+99dZpJgJcRsxbQcafrF4KmiePMpLKPtyguhAPyBki
         TRnF9/PY7aSAEOefc0blru6xmsKooh5JaUMTv4s63FKrzdO6EnqIwavKSrOj79+sWW/A
         tweg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si3374406ywg.634.2017.12.11.22.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 22:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOdkI-0006O9-Fo
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 01:08:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eOdk9-0006Nz-Bb
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 01:08:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eOdk5-0004ou-CH
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 01:08:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1eOdk5-0004nm-1C; Tue, 12 Dec 2017 01:08:37 -0500
Received: from 172.30.72.59 (EHLO DGGEMS414-HUB.china.huawei.com)
	([172.30.72.59])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DLY63434; Tue, 12 Dec 2017 14:08:30 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.361.1; Tue, 12 Dec 2017 14:08:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 14:07:25 +0800
Message-ID: <1513058845-9768-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5A2F7260.0035, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9f9b3fafae10b3a21ffdcc10cc7adf2f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH] MAINTAINERS: replace the unavailable email
 address
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47DnqJgz1l5K

From: Zhaoshenglong <zhaoshenglong@huawei.com>

Since I'm not working as an assignee in Linaro, replace the Linaro email
address with my personal one.

Signed-off-by: Zhaoshenglong <zhaoshenglong@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0255113..45e2e20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -543,7 +543,7 @@ F: include/hw/*/xlnx*.h
 
 ARM ACPI Subsystem
 M: Shannon Zhao <zhaoshenglong@huawei.com>
-M: Shannon Zhao <shannon.zhao@linaro.org>
+M: Shannon Zhao <shannon.zhaosl@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/virt-acpi-build.c
-- 
2.0.4


