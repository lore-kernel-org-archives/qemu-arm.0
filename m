Received: by 10.25.85.209 with SMTP id j200csp77039lfb;
        Fri, 10 Jun 2016 09:42:36 -0700 (PDT)
X-Received: by 10.140.93.97 with SMTP id c88mr2726938qge.64.1465576956321;
        Fri, 10 Jun 2016 09:42:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b68si6740806qkc.44.2016.06.10.09.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:43378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPVw-0007cQ-Mm
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPVr-0007aB-8t
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPVm-00030u-UZ
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:42:26 -0400
Received: from forward4p.cmail.yandex.net ([77.88.31.19]:34337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bBPVl-0002zd-Jz; Fri, 10 Jun 2016 12:42:22 -0400
Received: from mxback6g.mail.yandex.net (mxback6g.mail.yandex.net
	[77.88.29.167])
	by forward4p.cmail.yandex.net (Yandex) with ESMTP id 37C8C20C43;
	Fri, 10 Jun 2016 19:42:03 +0300 (MSK)
Received: from web25g.yandex.ru (web25g.yandex.ru [95.108.253.234])
	by mxback6g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	jA4FVKpaYN-g24WlDxm; Fri, 10 Jun 2016 19:42:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465576922; bh=Bs8slfZdrlogpRQQs5ShbJjxtJV2YqKkB0TQby2Zm58=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=co3zYuTtYmbaf4YwM3A449aLT8s2VpBzp0YmAR56096pVuACa7K1HICzK2qgB4NxA
	9Z7Kgx4Ass0slPGwEXmfka1Pk/GS5/CGi7AY8aGT3+G1iBezWl/FdJ+BBWLW7Ly3YL
	d4Iam3zS5UpdCClBWI5vgljCr1jETk88kDsGgPfY=
Authentication-Results: mxback6g.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
X-Yandex-Sender-Uid: 15784356
Received: by web25g.yandex.ru with HTTP;
	Fri, 10 Jun 2016 19:42:02 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
	<CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <4506161465576922@web25g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 10 Jun 2016 19:42:02 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.19
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
X-TUID: DdiIgBPhFVfR

What if I combine both patches into single one?

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
