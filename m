Received: by 10.25.21.156 with SMTP id 28csp1433230lfv;
        Mon, 11 Jul 2016 05:05:59 -0700 (PDT)
X-Received: by 10.200.49.100 with SMTP id h33mr8849587qtb.86.1468238759122;
        Mon, 11 Jul 2016 05:05:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e62si2602647qkd.41.2016.07.11.05.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 05:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ya.ru
Received: from localhost ([::1]:33336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMZyI-0002wk-GS
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 08:05:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMZyD-0002uh-Ar
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 08:05:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMZy9-0001tq-1r
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 08:05:52 -0400
Received: from forward1p.cmail.yandex.net ([77.88.31.16]:50128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bMZy7-0001rz-Ly; Mon, 11 Jul 2016 08:05:48 -0400
Received: from mxback9g.mail.yandex.net (mxback9g.mail.yandex.net
	[77.88.29.170])
	by forward1p.cmail.yandex.net (Yandex) with ESMTP id A9453206A2;
	Mon, 11 Jul 2016 15:05:32 +0300 (MSK)
Received: from web30g.yandex.ru (web30g.yandex.ru [95.108.253.239])
	by mxback9g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	Xqw3uGs27A-5Vjat9a3; Mon, 11 Jul 2016 15:05:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1468238732; bh=4jg8qOO5I7ipAf4Et5ATMI6Jf2oS+rXHtra0xkILsIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
	b=XwGGeDDke5BTgQe6tYchw/Ub+lSxX2xhmD61YAsrGO8mqcUJ1FEiR/NoBFeae/nuj
	iueI6J4RXJJ7MR0Thumfr3G1i8FOU1NesZs5sMfwKyrMiQ/WyvsUXIiIjnTj2S5elr
	h2yvVGdcTQsxB4my2l+utwrcmUo2CqtVLTWPCx9U=
Authentication-Results: mxback9g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web30g.yandex.ru with HTTP;
	Mon, 11 Jul 2016 15:05:31 +0300
From: Sergey Sorokin <afarallax@ya.ru>
Envelope-From: afarallax@yandex.ru
To: David Gibson <david@gibson.dropbear.id.au>
In-Reply-To: <20160711015718.GH16355@voom.fritz.box>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
	<767251467993130@web25h.yandex.ru>
	<20160711015718.GH16355@voom.fritz.box>
MIME-Version: 1.0
Message-Id: <86891468238731@web30g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 11 Jul 2016 15:05:31 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.16
Subject: Re: [Qemu-arm] [PATCH v2] Fix confusing argument names in some
 common functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EZQZ5iU4eTp



11.07.2016, 05:18, "David Gibson" <david@gibson.dropbear.id.au>:
> I'm afraid your mailer has turned this into an unreadable HTML mess.

It was just a ping.
http://patchwork.ozlabs.org/patch/635235/
