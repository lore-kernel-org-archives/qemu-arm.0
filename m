Received: by 10.25.208.211 with SMTP id h202csp1185706lfg;
        Wed, 16 Mar 2016 06:22:48 -0700 (PDT)
X-Received: by 10.140.92.180 with SMTP id b49mr5045664qge.81.1458134568099;
        Wed, 16 Mar 2016 06:22:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h86si3276617qkh.25.2016.03.16.06.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 06:22:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agBPT-0002tj-Js
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 09:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agBP8-0002Ii-26
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 09:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agBP7-0006Tf-5I
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 09:22:25 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:36274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agBP6-0006SG-QV
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 09:22:25 -0400
Received: by mail-oi0-x22b.google.com with SMTP id r187so38087350oih.3
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=G36KyfHvcYResKzJQnPqepcxsse0/nnRD1CpqxSqPsg=;
	b=QrQL1Ve72t+uZjK93t33GTuVeZpNnMZlsA0HO4gJKEB4nDYJ+7DSaYabYSl6mlJKO1
	vcxYrVz73u1tiv6vCziScyVObt5dbOlUJ5X3XYC6raY7GtYb1/DshvwGLQHm9/7czB+k
	j6u+vqNe0QQkSAG5cZ2GNXVfyDOi3f6vxViXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=G36KyfHvcYResKzJQnPqepcxsse0/nnRD1CpqxSqPsg=;
	b=UvbANDuJbV4+ORHrnIfEdQeN2wmUoC1dJgP2NT8DRDlOCJS0O6E51e0TGwxucO+QPs
	6TSq2Z8FewJmKKv5Sk/kkdeEqBIau44QX7HBFYoUCeZcOOkC2/NbwSagper1BYxxR2ll
	tHUxMl/AbN8v6l3jR+Gfrmd8a02dtCbnh5O5X979mesdWo43GqIPn5whw79pEBjCDqb6
	60DO50ZqEkCKT9vmHtcWUMIbecXwMNDIr0jzyVl/sCddruoyyffZdET/gT3nT50H6AMR
	cinkSW53wguUFGNSqTNhbbApJ1Tl6l6MzIVEqJVpF/OF5dRaORIE/40qzBY02mmF4H6F
	B7sA==
X-Gm-Message-State: AD7BkJIpfqMN38k4XlRzDvLtF33d0ZJuBhZT34XX7TB1+jdJ0EO0JfKEDB7lGhHLt9Z1ggDGP7lajcuAktqgisdV
MIME-Version: 1.0
X-Received: by 10.202.177.3 with SMTP id a3mr2277707oif.2.1458134544186; Wed,
	16 Mar 2016 06:22:24 -0700 (PDT)
Received: by 10.157.6.36 with HTTP; Wed, 16 Mar 2016 06:22:24 -0700 (PDT)
In-Reply-To: <CAFEAcA9u1=Dp6xN9ot2DiyP_KXBWdy8-a4zOYaTxe8F0TPGMQQ@mail.gmail.com>
References: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
	<CAA8zJ3AxgAAKzHr_sALQQ1VT5fTHRNrxot4--VREtZ2-6kK92w@mail.gmail.com>
	<CAFEAcA8SXBURzdHsKgZGNuEO==jAAKUyj6cxH3VbqrTXo1ocnw@mail.gmail.com>
	<CAFEAcA9u1=Dp6xN9ot2DiyP_KXBWdy8-a4zOYaTxe8F0TPGMQQ@mail.gmail.com>
Date: Wed, 16 Mar 2016 07:22:24 -0600
Message-ID: <CAA8zJ3B-FJw-k2nFCGJtYa=DM2ZdjeHt5j7vUSJLJJ0s9PYXjg@mail.gmail.com>
From: Thomas Hanson <thomas.hanson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22b
Cc: Patch Tracking <patches@linaro.org>, hitmoon <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH] sd: Fix "info qtree" on boards with SD cards
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /GYfI7H4gtli

Sounds like a good idea.  Much easier to fix a problem with an
explicit error than to chase a seg fault.

On 15 March 2016 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 15 March 2016 at 20:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 15 March 2016 at 20:28, Thomas Hanson <thomas.hanson@linaro.org> wrote:
>>> The patch looks good.
>>>
>>> Would it also be good to update bus_add_child() so that it NULL-checks
>>> its "bus" parameter before dereferencing it?
>>
>> No, I think it's just a programming error to call qdev_set_parent_bus()
>> with a NULL bus parameter, so crashing is fine.
>
> ...but it might be helpful to assert in qdev_try_create() that
> if we're using the default bus then the object is a sysbus
> device object. At least then the problem will be immediately
> clear rather than only showing up if you run a monitor command
> later.
>
> thanks
> -- PMM
