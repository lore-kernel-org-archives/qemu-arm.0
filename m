Received: by 10.80.166.35 with SMTP id d32csp312699edc;
        Thu, 13 Oct 2016 03:45:17 -0700 (PDT)
X-Received: by 10.55.3.7 with SMTP id 7mr5355287qkd.291.1476355517099;
        Thu, 13 Oct 2016 03:45:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k97si2969885qte.42.2016.10.13.03.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 03:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1budVk-0002Km-I9
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 06:45:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budVg-0002KP-GL
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budVf-0001xo-Gw
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:45:12 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budVf-0001xT-Dq
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:45:11 -0400
Received: by mail-vk0-x22b.google.com with SMTP id b186so72997688vkb.1
	for <qemu-arm@nongnu.org>; Thu, 13 Oct 2016 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MjhjMQrJqD7WmFaM/Uvrl8P+YHDesohU5Y+q69gTAzQ=;
	b=bYlRoAtYoqETSo0RisyoD23w/FLdpRrdY/cXuMlpnHH6AjhRu5xQq/cSKesQyaoZ73
	02n332BXynJJ+hGl415P0o5SDhcw4UyN0VO4lk9DQOIEdtAoXWTgY2TX1aQ1nFoRizVo
	z4ym2a7O5H159A2m+O9fCK5IlgJhdmRZOuekk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MjhjMQrJqD7WmFaM/Uvrl8P+YHDesohU5Y+q69gTAzQ=;
	b=HNGtarlGonrhu/2jJAASlBGuNoKEp6to+JuEIScn0rFzihn9kub/3bI2Xv2ZlM+Xru
	RG8m9EXbrac5OEw3H2yJMb9mZExsyt+DEmTquSm/4nFYu9x1gQCmdu7PH1rXb1oBPKqv
	kshd6d87zix27XeBS7u4W1pAj8ioYRnFt4mNfsmj5sXjjPhRVqDdnj+3/R1Jr8RCC1ba
	p9Ff6xh23iEOGvwAW6LI9wqIHd4iKqlNRGQ6Q0/e7swZrPnCf1OwL+8Cr+5y2meJY58v
	DPk0tynvzVAqBQYPajgch4AEQSNbtJSIm8A9Knpzh3gYPUID9lCjRCVsJ43WYJPgU8mD
	3uEA==
X-Gm-Message-State: AA6/9RnSSN7paALKAdhLjNggjBxsXcOSOjgh7tcJEgAcM+4YcLUzuG3RjKCxv9JOetSFf3VAHQC8PeYSlsNBjfHM
X-Received: by 10.31.11.82 with SMTP id 79mr2549072vkl.165.1476355510872; Thu,
	13 Oct 2016 03:45:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 03:44:50 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610131141320.2125@wniryva>
References: <1475903058-729-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8LfjDEMtbT5GRryLvAEu9kzbEzykKXF9DP+dDLajT8BQ@mail.gmail.com>
	<alpine.LFD.2.20.1610131141320.2125@wniryva>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 11:44:50 +0100
Message-ID: <CAFEAcA8Vn9F7FOYqU5ddLBKtn=3vnQc-eynsOoV_X-pU7S_C-Q@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v4] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+DpnNpNy3Xe

On 13 October 2016 at 07:42, P J P <ppandit@redhat.com> wrote:
> +-- On Wed, 12 Oct 2016, Peter Maydell wrote --+
> | > -            while (gtb->compare < update.new) {
> | > +            if (gtb->compare < update.new) {
> | >
> | > +                    inc = update.new - gtb->compare - 1;
> |
> | Can you explain why the '- 1' here ?
>
>   I think I did that because while was running till gtb->compare < update.new.
> To contain gtb->compare under update.new.
>
> | Something still doesn't look right here. Consider the case where
> | update.new is only just bigger than gtb->compare (actually the
> | usual case, I think). In this case 'update.new - gtb->compare - 1'
> | is smaller than gtb->inc and so the QEMU_ALIGN_DOWN will produce
> | an inc value of 0. That would be wrong, because we should definitely
> | have done an auto-increment.
>
>    Yes, but in those cases 'gtb->compare += inc' would exceed update.new. Is
> that okay ?

Of course, and it's what you want. The point of the autoincrement
is that when the timer fires (because the current time reaches
or exceeds the comparator) the hardware automatically advances
the compare value so that it is again ahead of the current time.
That way at some future point the timer will fire again.

You can work this out also by looking at the existing code,
which reads "while (gtb->compare < update.new) { ... }"
so if the autoincrement is enabled we can't leave the while
loop until the compare has been moved forward beyond update.new.

I suggest you try putting in some sample values for the
various variables to confirm that your new code produces the
same answers that the old code did.

thanks
-- PMM
