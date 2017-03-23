Received: by 10.25.15.230 with SMTP id 99csp852953lfp;
        Thu, 23 Mar 2017 10:05:32 -0700 (PDT)
X-Received: by 10.55.157.130 with SMTP id g124mr2122603qke.30.1490288732264;
        Thu, 23 Mar 2017 10:05:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si4158805qkh.133.2017.03.23.10.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 10:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr6B1-000423-Mm
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 13:05:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cr6AT-0003ZS-Jg
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 13:04:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cr6AS-00070V-Q1
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 13:04:57 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cr6AS-00070Q-Ix
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 13:04:56 -0400
Received: by mail-wm0-x22e.google.com with SMTP id u132so66946552wmg.0
	for <qemu-arm@nongnu.org>; Thu, 23 Mar 2017 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WmojpZdoO3wYJ/Gfrmh9JSfdvhAdqypkotYHI5Twj+0=;
	b=fqlDJEzdLy7rom4/z498tBdO7C5fbhuo+/DRiKxgi5VGlZPQ/BnZcBCpYHVCRGNYjm
	axPIt1vI8co0pxHHij8KLCLXbOY/hCST0WSj/i5sSdYg6+ZPp5ooyu7UA5fQrTg7BMKK
	surya18Oc8fScy2wFDpOvZn5uJxySLFa7w/5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WmojpZdoO3wYJ/Gfrmh9JSfdvhAdqypkotYHI5Twj+0=;
	b=WnmFVg3wlz4ctuC4i7BCPqnGZNgto5MlmCVVPbcF5YaLAqrWoKYmhnYJJdCTXcYe4M
	Xaln5Um7NUTIAyvSSQXLeHNDjO0kxsayzklFO8rhN4JU8+EblsuXfxESpOM2XS/komXU
	fT7cY5ozeRfmKdPOmibjJfZzHNNQphGDzUCI6sxvU6TJMdox4x/da58DfKCO3CxHOYeI
	b9aEloFTf25dekjwZtth22pW5lpb6MAHj/Udkm0fCQVdZzjl3p7PEuET5jPDGtMt6cMg
	JjhMXBnjH6OPzZRsg0iEMNSBAGAvJdM8DRCeKV9kSkxUtI5wXYd93A1FTz+/v72TTatN
	fcbQ==
X-Gm-Message-State: AFeK/H0HbwIaotjbL2Ke9mQQ7L/TC9d0L/y5jOBmzMaClOpzcNOc3YNwSqGnqioa5WI4vz+dDU1UWjXEcQWskhqg
X-Received: by 10.28.150.194 with SMTP id y185mr13526025wmd.92.1490288695546; 
	Thu, 23 Mar 2017 10:04:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Thu, 23 Mar 2017 10:04:35 -0700 (PDT)
In-Reply-To: <C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2017 17:04:35 +0000
Message-ID: <CAFEAcA-AjxQ-wCu3Uh8AiunbQk8LSgs7T=ymbd3_QkgZAa2TUQ@mail.gmail.com>
To: Wangjintang <wangjintang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] about armv8's prefetch decode
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
Cc: "Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, "Ori Chalak \(A\)" <Ori.Chalak@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hPro0S0c7W6j

On 20 March 2017 at 06:35, Wangjintang <wangjintang@huawei.com> wrote:
>         We see that armv8's prefetch instruction decode have been
> skipped in qemu. For some user, they need prefetch instruction,
> for example, they use qemu to generate the instruction trace.
> We want to merge this patch to community, it's ok or not?  Thanks.

It would be helpful if you could be more precise about what
is missing and what goes wrong (eg which instructions we
mishandle). In general I believe that we do correctly handle
the various prefetch instructions. They don't need to generate
any intermediate code, of course, because prefetch is just
a hint. It's possible we got the decode wrong for some subset
of them.

thanks
-- PMM
