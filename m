Received: by 10.25.85.209 with SMTP id j200csp74820lfb;
        Fri, 10 Jun 2016 09:37:07 -0700 (PDT)
X-Received: by 10.140.104.134 with SMTP id a6mr2793443qgf.46.1465576627514;
        Fri, 10 Jun 2016 09:37:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d30si2062121qgd.79.2016.06.10.09.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:43343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPQg-0004ZT-Ub
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:37:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPQa-0004XT-B2
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPQV-0001Ye-04
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:36:59 -0400
Received: from forward2p.cmail.yandex.net ([77.88.31.17]:38661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bBPQT-0001Xa-Lk; Fri, 10 Jun 2016 12:36:54 -0400
Received: from mxback5g.mail.yandex.net (mxback5g.mail.yandex.net
	[77.88.29.166])
	by forward2p.cmail.yandex.net (Yandex) with ESMTP id 9930521052;
	Fri, 10 Jun 2016 19:36:40 +0300 (MSK)
Received: from web25g.yandex.ru (web25g.yandex.ru [95.108.253.234])
	by mxback5g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	toO55PNhPM-addiAbhR; Fri, 10 Jun 2016 19:36:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465576599; bh=WxFI+KKFaBId6h56R7e6voo3ZFwBcKEbB39llyVvtYg=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=Iw4ZxvUhHLL29pjvPvTqOM9qOlPPdfPBLZgnoUTRpNInKLLz53mDLQ4Yc/n0n8OV2
	RwTNmE7umBKrHnihyybCKke5ZYV1f5o8QzRQQqS9GUPmWnwaWSodBwIHmsc8bPm7iO
	B5vRzSV7RQPS1OwnQd7loOWEa89ZK/U01XHWwHmw=
Authentication-Results: mxback5g.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
X-Yandex-Sender-Uid: 15784356
Received: by web25g.yandex.ru with HTTP;
	Fri, 10 Jun 2016 19:36:39 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
	<CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <4497831465576599@web25g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 10 Jun 2016 19:36:39 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.17
Subject: Re: [Qemu-arm] [PATCH 1/2] Fix confusing argument names of
 do_unaligned_access() functions
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
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lrSlBff/X6uG

I agree

10.06.2016, 19:33, "Peter Maydell" <peter.maydell@linaro.org>:
> On 10 June 2016 at 17:26, Sergey Sorokin <afarallax@yandex.ru> wrote:
>> =C2=A0There are functions cpu_unaligned_access() and do_unaligned_acce=
ss() that
>> =C2=A0are called with access type and mmu index arguments. But these a=
rguments
>> =C2=A0are named 'is_write' and 'is_user' in their declarations.
>> =C2=A0The patch fixes the names to avoid a confusion.
>>
>> =C2=A0Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
>
> If we're going to touch all of these then we have an enum type
> we should be using instead of just 'int' for the old
> is_write argument: MMUAccessType (defined in cpu-common.h).
>
> thanks
> -- PMM
