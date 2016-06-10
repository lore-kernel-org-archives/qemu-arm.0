Received: by 10.25.85.209 with SMTP id j200csp95407lfb;
        Fri, 10 Jun 2016 10:26:43 -0700 (PDT)
X-Received: by 10.237.40.68 with SMTP id r62mr3110220qtd.66.1465579603714;
        Fri, 10 Jun 2016 10:26:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a62si6819591qkb.264.2016.06.10.10.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:43566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQCh-0003JL-5d
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:26:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBQCc-0003J0-Ce
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBQCY-0005HM-7n
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:26:37 -0400
Received: from forward3h.cmail.yandex.net ([87.250.230.18]:58733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bBQCW-0005CM-TX; Fri, 10 Jun 2016 13:26:34 -0400
Received: from mxback12h.mail.yandex.net (mxback12h.mail.yandex.net
	[84.201.186.130])
	by forward3h.cmail.yandex.net (Yandex) with ESMTP id CCAD621207;
	Fri, 10 Jun 2016 20:26:12 +0300 (MSK)
Received: from web25h.yandex.ru (web25h.yandex.ru [84.201.187.159])
	by mxback12h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	gkfoKlkTXG-QCHaOeeF; Fri, 10 Jun 2016 20:26:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465579572; bh=3LGpJsOpR83K1TBhVfCOGgbkUBnvbGcV+xxG/MUa3i4=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=AZ1CIf+4eQItHCWu0FSv0ny7psPqTUf/b08w6EYVVCXenE2ZV5maezD0PfKzhbNTK
	qq8UDqu1OGrOM9PNU2vjlRC8vCPyrUJr9UZPx9XdpweCHQZwOAkUrEOffP/VmuyRCZ
	SrmKckKc3nwLJmcI33reHB79r/UePcUSjQl1aQyo=
Authentication-Results: mxback12h.mail.yandex.net;
	dkim=pass header.i=@yandex.ru
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
X-Yandex-Sender-Uid: 15784356
Received: by web25h.yandex.ru with HTTP;
	Fri, 10 Jun 2016 20:26:11 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9wU2=jsfAqDOA=ZhOkAZ2wxmkYFhGDw=OwKFM6-04=tQ@mail.gmail.com>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
	<CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
	<4506161465576922@web25g.yandex.ru>
	<CAFEAcA9wU2=jsfAqDOA=ZhOkAZ2wxmkYFhGDw=OwKFM6-04=tQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <4790101465579571@web25h.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 10 Jun 2016 20:26:11 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.18
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
X-TUID: Z7/3jJUut044

cpu-common.h is not included in qom/cpu.h
what do you think? Should it be included? Or may be MMUAccessType should =
be just moved into another header. For example into exec/memattrs.h

10.06.2016, 19:44, "Peter Maydell" <peter.maydell@linaro.org>:
> On 10 June 2016 at 17:42, Sergey Sorokin <afarallax@yandex.ru> wrote:
>> =C2=A0What if I combine both patches into single one?
>
> No particular objection.
>
> -- PMM
