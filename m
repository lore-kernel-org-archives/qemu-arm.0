Received: by 10.25.21.96 with SMTP id l93csp659185lfi;
        Thu, 23 Jun 2016 11:23:53 -0700 (PDT)
X-Received: by 10.55.130.1 with SMTP id e1mr46208612qkd.139.1466706233762;
        Thu, 23 Jun 2016 11:23:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x56si1374149qtb.41.2016.06.23.11.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 11:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:38632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9I9-0007Oz-3b
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 14:23:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG9Fj-0004Fd-N8
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 14:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG9Fh-0004yi-P5
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 14:21:22 -0400
Received: from forward5p.cmail.yandex.net ([77.88.31.20]:33231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG9Fa-0004ty-Nm; Thu, 23 Jun 2016 14:21:15 -0400
Received: from mxback9g.mail.yandex.net (mxback9g.mail.yandex.net
	[77.88.29.170])
	by forward5p.cmail.yandex.net (Yandex) with ESMTP id D976920CC1;
	Thu, 23 Jun 2016 21:21:02 +0300 (MSK)
Received: from web16g.yandex.ru (web16g.yandex.ru [95.108.252.116])
	by mxback9g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	gdEQ4aVfoH-L2iWIPwe; Thu, 23 Jun 2016 21:21:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466706062; bh=QLAZ8DSvkIgZ1y3YGsvhqJP8mOL2ebMOYmcGInYfFhM=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	X-Mailer:Date:Content-Transfer-Encoding:Content-Type;
	b=UEeBxkLkiukyVI5eXrKER7dZfmq7Q+wP7fou790Kc9Gu9Z4g5fJYHdaBPXCzspIy3
	OOB+AAjuNM7xeTdbnGLvillXTAWmsbbgdIbYo9xDjXgYPU4wkNXc4/OLsg69wbOshN
	vibRRIge05bLGYk+YRexwC12jFDn3sPADgpOdOwg=
Authentication-Results: mxback9g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web16g.yandex.ru with HTTP;
	Thu, 23 Jun 2016 21:21:02 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Richard Henderson <rth@twiddle.net>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <d021833e-312d-5dad-1a77-5800fadb733a@twiddle.net>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
	<201241466676212@web21j.yandex.ru>
	<458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
	<200981466691221@web14m.yandex.ru>
	<d021833e-312d-5dad-1a77-5800fadb733a@twiddle.net>
MIME-Version: 1.0
Message-Id: <804691466706062@web16g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 23 Jun 2016 21:21:02 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 77.88.31.20
Subject: Re: [Qemu-devel] [PATCH v2] Improve the alignment check
 infrastructure
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mkiB+cdDlwsJ

Yes, I thought about it. tcg_canonicalize_memop() is good place too.
But do you think that get_alignment_bits() is not good enough?

23.06.2016, 19:13, "Richard Henderson" <rth@twiddle.net>:
> On 06/23/2016 07:13 AM, Sergey Sorokin wrote:
>>> =C2=A0I think we ought to check this in tcg-op.c, rather than wait un=
til generating
>>> =C2=A0code in the backend.
>> =C2=A0I think it's better to check this in one place in get_alignment_=
bits() function
>> =C2=A0because there can be a direct call of helpers from softmmu_templ=
ate.h.
>
> I'm talking about the asserts in tcg/*/tcg-target.inc.c. Those asserts =
are
> better done in once place in tcg_canonicalize_memop.
>
> r~
