Received: by 10.25.21.96 with SMTP id l93csp403lfi;
        Wed, 22 Jun 2016 06:39:15 -0700 (PDT)
X-Received: by 10.55.73.209 with SMTP id w200mr38206537qka.77.1466602717943;
        Wed, 22 Jun 2016 06:38:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z194si6240481qka.165.2016.06.22.06.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 06:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=ya.ru
Received: from localhost ([::1]:58442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFiMS-0000PM-7v
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 09:38:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bFhPh-0000Dk-OK
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:37:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bFhPb-0004uT-Rc
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:37:48 -0400
Received: from forward2p.cmail.yandex.net ([77.88.31.17]:54515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bFhPa-0004td-H8; Wed, 22 Jun 2016 08:37:43 -0400
Received: from mxback10g.mail.yandex.net (mxback10g.mail.yandex.net
	[77.88.29.171])
	by forward2p.cmail.yandex.net (Yandex) with ESMTP id A137221085;
	Wed, 22 Jun 2016 15:37:29 +0300 (MSK)
Received: from web8g.yandex.ru (web8g.yandex.ru [95.108.252.108])
	by mxback10g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	Th9vTSkmux-bR1GGrbJ; Wed, 22 Jun 2016 15:37:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466599047; bh=vpzhaCgw4a70hUxSzCM0xu2InIN0JxHWFNPdtUNOBbo=;
	h=X-Yandex-Sender-Uid:From:Envelope-From:To:Cc:In-Reply-To:
	References:Subject:MIME-Version:Message-Id:X-Mailer:Date:
	Content-Transfer-Encoding:Content-Type;
	b=R9uqPHXMN32n8z2IA1rNYxs8IAUAjhcsdnnMY3ThlpTL6sH1fuSLT7zQaQORfo+O5
	CO08r7sPCWAB4XVpljAU2baCEvXYudSGaScR6/yMvz9hk/Sf4rS85aL4AqblvjL3hk
	vGbsoMOxmR7GvJZfL6wOtCnB2TY05YXCzctYi8bM=
Authentication-Results: mxback10g.mail.yandex.net;
	dkim=pass header.i=@yandex.ru
Received: by web8g.yandex.ru with HTTP;
	Wed, 22 Jun 2016 15:37:27 +0300
From: Sergey Sorokin <afarallax@ya.ru>
Envelope-From: afarallax@yandex.ru
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <1466598806-3383736-1-git-send-email-afarallax@yandex.ru>
References: <1466598806-3383736-1-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Message-Id: <655821466599047@web8g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 22 Jun 2016 15:37:27 +0300
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.17
X-Mailman-Approved-At: Wed, 22 Jun 2016 09:35:07 -0400
Subject: Re: [Qemu-arm] [PATCH] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pjvP3nrF0/X

<div>Sorry, I have sent wrong patch.</div><div>=C2=A0</div><div>By the wa=
y, the second version of the patch was sent already.</div>
