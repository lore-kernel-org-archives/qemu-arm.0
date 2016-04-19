Received: by 10.159.53.12 with SMTP id o12csp2037615uao;
        Tue, 19 Apr 2016 11:08:12 -0700 (PDT)
X-Received: by 10.140.96.137 with SMTP id k9mr5398094qge.23.1461089292876;
        Tue, 19 Apr 2016 11:08:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b31si30980984qga.38.2016.04.19.11.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 11:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:34222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asa4J-0001LB-Rv
	for alex.bennee@linaro.org; Tue, 19 Apr 2016 14:08:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asa4H-0001JA-GV
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 14:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asa4D-0000zb-6B
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 14:08:09 -0400
Received: from forward9j.cmail.yandex.net ([5.255.227.110]:58256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1asa4C-0000zU-SX; Tue, 19 Apr 2016 14:08:05 -0400
Received: from smtp12.mail.yandex.net (smtp12.mail.yandex.net
	[IPv6:2a02:6b8:0:801:1::11])
	by forward9j.cmail.yandex.net (Yandex) with ESMTP id 89FBA20F3A;
	Tue, 19 Apr 2016 21:07:53 +0300 (MSK)
Received: from smtp12.mail.yandex.net (localhost [127.0.0.1])
	by smtp12.mail.yandex.net (Yandex) with ESMTP id EF0B716A1024;
	Tue, 19 Apr 2016 21:07:52 +0300 (MSK)
Received: by smtp12.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	WNad2B8dFm-7qBqt3xj; Tue, 19 Apr 2016 21:07:52 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1461089272; bh=z3pzHZcCkOaASiFbZIyrADbanVY4U4aIU56JLRtj9Hg=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=a0M5KI55zQRqUwnljvJDEXq7uR69b9uldTeTW/ngMdLZ3p3D6nZbRlIOL+vxq+E0w
	KY0bDY7pyoTkvo778YMdBaGpULt5jSJa2rPOxEWkGnVOtzuHfvD3u6YFUOQOkbO7AV
	RWk45alBRSz++6aAycEY+i4x8ydA0ednEznXo2NI=
Authentication-Results: smtp12.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Tue, 19 Apr 2016 21:07:16 +0300
Message-Id: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.110
Subject: [Qemu-arm] [PATCH 0/2] Unify and fix exception return in AArch32
 state
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IAaPkBPLR8su

There is a duplicating code in AArch32 exception return implementation.
Also there is a missed exception return on AArch32 instruction ADDS r15.
The patches rearrange the code and fix these issues.

Sergey Sorokin (2):
  target-arm: Unify AArch32 exception return generating functions
  target-arm: Fix an exception return on AArch32 instruction ADDS

 target-arm/translate.c | 51 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 18 deletions(-)

-- 
1.9.3

