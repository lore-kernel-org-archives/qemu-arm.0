Received: by 10.25.21.96 with SMTP id l93csp46841lfi;
        Tue, 14 Jun 2016 05:03:45 -0700 (PDT)
X-Received: by 10.55.167.133 with SMTP id q127mr19683490qke.95.1465905825569;
        Tue, 14 Jun 2016 05:03:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b68si13651489qkd.282.2016.06.14.05.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 05:03:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:34601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCn4L-0007fQ-0s
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 08:03:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bCn2z-00064p-Ic
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 08:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bCn2s-0007qZ-Q0
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 08:02:20 -0400
Received: from forward11o.cmail.yandex.net ([37.9.109.178]:41019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bCn2r-0007lH-EW; Tue, 14 Jun 2016 08:02:14 -0400
Received: from mxback7o.mail.yandex.net (mxback7o.mail.yandex.net
	[37.140.190.21])
	by forward11o.cmail.yandex.net (Yandex) with ESMTP id 1A1542120F;
	Tue, 14 Jun 2016 15:01:44 +0300 (MSK)
Received: from web22o.yandex.ru (web22o.yandex.ru [95.108.205.122])
	by mxback7o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	o3Jczy3bIC-1duamwKw; Tue, 14 Jun 2016 15:01:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465905700; bh=qJu0YCZBL0oNcWFOzaYOAW5BxZA4cE0A5RX7TrpMZS8=;
	h=X-Yandex-Sender-Uid:From:To:Cc:In-Reply-To:References:Subject:
	MIME-Version:Message-Id:X-Mailer:Date:Content-Transfer-Encoding:
	Content-Type;
	b=r20bHlNw0sPV+R+2aAc73AVCZ2fAdHqtQ4jyIdWT0E7Oj2f4HoZaupyS0L5koThO0
	4aBxwnYWHx8Wqenh6+DcFxHXAkT2xMzg5qn0SZaiAAGSMdx/WDm0Gsh3mqiiADx/Yx
	8C6FPk+QIZ3dkpUuLwzQuhRvantioKv1dmfywaGI=
Authentication-Results: mxback7o.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: FR
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
X-Yandex-Sender-Uid: 15784356
Received: by web22o.yandex.ru with HTTP;
	Tue, 14 Jun 2016 15:01:39 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <20160613070325.GA16232@aurel32.net>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
	<20160613070325.GA16232@aurel32.net>
MIME-Version: 1.0
Message-Id: <9704001465905699@web22o.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 Jun 2016 15:01:39 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.9.109.178
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ii9V2hH5216v

Seems arm_cpu_do_unaligned_access() function could use it. It uses cpu_mm=
u_index() for now but I think use of mmu_idx is preferred. Anyway it's th=
e subject for another patch.

13.06.2016, 10:47, "Aurelien Jarno" <aurelien@aurel32.net>:
> On 2016-06-10 19:26, Sergey Sorokin wrote:
>> =C2=A0There are functions cpu_unaligned_access() and do_unaligned_acce=
ss() that
>> =C2=A0are called with access type and mmu index arguments. But these a=
rguments
>> =C2=A0are named 'is_write' and 'is_user' in their declarations.
>> =C2=A0The patch fixes the names to avoid a confusion.
>
> Unless I missed something, it seems that the is_user/mmu_idx argument i=
s
> never used. Should we maybe just drop it?
>
> Otherwise it looks fine.
>
> --
> Aurelien Jarno GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net http://www.aurel32.net
