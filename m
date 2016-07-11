Received: by 10.25.21.156 with SMTP id 28csp1437034lfv;
        Mon, 11 Jul 2016 05:13:26 -0700 (PDT)
X-Received: by 10.55.70.22 with SMTP id t22mr24005482qka.171.1468239205971;
        Mon, 11 Jul 2016 05:13:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y202si1858708qkb.170.2016.07.11.05.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 05:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ya.ru
Received: from localhost ([::1]:33381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMa5V-0003Hx-EQ
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 08:13:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMa5P-0003GF-Qu
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 08:13:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMa5L-0003Et-MB
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 08:13:18 -0400
Received: from forward3p.cmail.yandex.net ([77.88.31.18]:40664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bMa5K-00039A-CC; Mon, 11 Jul 2016 08:13:15 -0400
Received: from mxback6g.mail.yandex.net (mxback6g.mail.yandex.net
	[77.88.29.167])
	by forward3p.cmail.yandex.net (Yandex) with ESMTP id D35CD20728;
	Mon, 11 Jul 2016 15:12:59 +0300 (MSK)
Received: from web30g.yandex.ru (web30g.yandex.ru [95.108.253.239])
	by mxback6g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	DHvJszNlRY-CxEOKXBM; Mon, 11 Jul 2016 15:12:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1468239179; bh=v5v3fCsAkeuQhX8eGYfe2sSqbRd/XBHV6djpj/ehoRQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
	b=v8taZqwbAD2KKI32/R6+YonSUGJKLDL2z8Qdtg5bq8/HWXuohMji+1tY9XM3PVcoV
	pcw+qdtJPAH02eTcGLA0mM1XovS2uhyMFUAT2lU8F+Nfu02eBkygAJpUiUVzRMYswj
	fI5GztlxV9dzI9Y8zeYRm92Z6VaL8K4E9oqzm0i4=
Authentication-Results: mxback6g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web30g.yandex.ru with HTTP;
	Mon, 11 Jul 2016 15:12:58 +0300
From: Sergey Sorokin <afarallax@ya.ru>
Envelope-From: afarallax@yandex.ru
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Message-Id: <133391468239178@web30g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 11 Jul 2016 15:12:58 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.18
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PRK0AP1KLJ8k

ping

http://patchwork.ozlabs.org/patch/639688/
