Received: by 10.25.21.96 with SMTP id l93csp622609lfi;
        Thu, 23 Jun 2016 09:56:24 -0700 (PDT)
X-Received: by 10.237.55.168 with SMTP id j37mr31335903qtb.102.1466700983910;
        Thu, 23 Jun 2016 09:56:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p132si952808qka.233.2016.06.23.09.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 09:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG7vT-0005qi-7V
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 12:56:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG7jk-000188-0P
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:44:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG7jj-0004Ya-6q
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:44:16 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG7jj-0004Y4-2O
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:44:15 -0400
Received: by mail-vk0-x234.google.com with SMTP id d185so114466539vkg.0
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xJSEMYPd9sJFzwYJ3nfqRo9mwO73LaTYhC/Y1EvsdTA=;
	b=Ki2NyplZP8hG6QD8+plgrKI/eNBNcOOfDGF5ENdSs8G7bxRk6y/Wx/nTHA/wzflowX
	A9epeFEoTIkNxKhMsW7DqD6N9fB02RldN768lCWNr/xOxMqXRqNQiu2GXe9Y01Q29z//
	8V6DXeV4PyJ3Djc3VKETkIcHKGogfmlMeuaBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xJSEMYPd9sJFzwYJ3nfqRo9mwO73LaTYhC/Y1EvsdTA=;
	b=bLvRoyKKhCRrQZ+hQMoO54bpyETrIy/Gm8zkux6WTDRNEtF2D6CW0+eefy8h4f4NCk
	rYh8PkcmISL3+ThYLhnSJr/mGQaeaSkZV+NqyQ4h03UgA8ZHUNwwNG0wR9RSVZyFf/5F
	NvC3zZERGdKMNHBx29nnyQGP8aHmvzUwaw7rUUNKyQRStT0sEsTo6UxR3cbwvjJtrsWj
	ksN7lkR1wIvAt6ScKF0O+zCeDfubGJbCKpTeyHvtujFVuRHT90O5hU7Sm2qkKqxiwUth
	WKI3rMBszGa3KvVZlTcxGCZk8b9d0OASSInwsjHvA0sUTYXNQNCW4Diw/VMrmLUBoFlP
	r7kA==
X-Gm-Message-State: ALyK8tI0UILYVuy19jGpJ4J2GC3t8nag8nEFS4umytw5y568prgfNpPv6/jadb/cQDpIm7uqHGzEEz5gub6z8okf
X-Received: by 10.176.65.106 with SMTP id j97mr16443488uad.64.1466700254590;
	Thu, 23 Jun 2016 09:44:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 09:43:55 -0700 (PDT)
In-Reply-To: <d86d652a-8fd5-7383-36d4-68f4e8d23627@gmail.com>
References: <cover.1466167530.git.digetx@gmail.com>
	<2bbc3737669523d9483f27276f929a6c4772fd48.1466167530.git.digetx@gmail.com>
	<CAFEAcA-v0pBZ2Thxiv38qHJcbeyrgCBvB_EeaCi2OJwGxFyyuA@mail.gmail.com>
	<d86d652a-8fd5-7383-36d4-68f4e8d23627@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 17:43:55 +0100
Message-ID: <CAFEAcA89Q80T0Xe=dXrR1Spox_pP3YXqnVQ_qAN=VuYPO7owRA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH v14 1/3] hw/ptimer: Support running with
 counter = 0 by introducing new policy feature
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58lmMgrFrBVv

On 23 June 2016 at 17:32, Dmitry Osipenko <digetx@gmail.com> wrote:
> On 23.06.2016 16:49, Peter Maydell wrote:
>> On 17 June 2016 at 14:17, Dmitry Osipenko <digetx@gmail.com> wrote:
>>> Currently ptimer prints error message and stops the running timer that has
>>> delta (counter) = 0, this is an incorrect behaviour for some of the ptimer
>>> users. There are different variants of how particular timer could handle that
>>> case besides stopping the timer, like immediate or deferred IRQ trigger.
>>> Introduce policy feature that provides ptimer with an information about the
>>> correct behaviour.
>>>
>>> Implement the "counter = 0 triggers IRQ after one period" policy, as it is
>>> known to be used by the ARM MPTimer and set "default" policy to all ptimer
>>> users, maintaining old behaviour till they get fixed.
>>
>> Could you split this into:
>>  (1) a patch which just adds the new argument to ptimer_init() and
>>      updates all its callers
>>  (2) a patch which adds support for setting the policy option to
>>      something other than the default value
>>
>> and also make sure that we only do one change per patch -- there
>> seem to be several different behaviour changes tangled up in
>> one patch here.
>>
>> I think that will be easier to review.
>>
>
> This patch isn't supposed to change behaviour for any of the current timers. I
> think it is clearly expressed in the last sentence of the commit message. There
> is one unintended behaviour change in this patch, it's my overlook [see below].

Right, but my point is that it is hard to tell that when I read
the patch to review it, and splitting this will make it easier.

thanks
-- PMM
