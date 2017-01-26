Received: by 10.25.77.65 with SMTP id a62csp139751lfb;
        Thu, 26 Jan 2017 02:47:29 -0800 (PST)
X-Received: by 10.237.62.130 with SMTP id n2mr1703933qtf.204.1485427649636;
        Thu, 26 Jan 2017 02:47:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j124si830811qkf.162.2017.01.26.02.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 02:47:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWhaQ-0002Ul-Tk
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 05:47:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cWhV0-0006Vl-Hs
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 05:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cWhUz-0004Jt-Nc
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 05:41:50 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cWhUz-0004Je-Gd
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 05:41:49 -0500
Received: by mail-vk0-x233.google.com with SMTP id x75so151673343vke.2
	for <qemu-arm@nongnu.org>; Thu, 26 Jan 2017 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W1lcMrfYLX270lz/Kw0SH5h8deDifa5Rw7YwD2181lM=;
	b=GwY4QTH8VYaIWFrGlxbxQPZLKkFKWvfhaJdhRO7dgEg2if+U3+B4yULBThdxSJQVRJ
	yxvijsrAEo7LUc9wgictclceQR6mp20m0vfVByzpgwMY4E5UhiwWjuwk84F8YpQzVUx9
	hdOZ2B2kwau1ISfSljpz+m8d2roOCX0N98uxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W1lcMrfYLX270lz/Kw0SH5h8deDifa5Rw7YwD2181lM=;
	b=Sp5JXpTP7in+4qSXn3BfI+ztThfZktIp4K+NZPGsbH53Om0kWnnlZaEmyYfmJMd1kn
	oEEynnwPwOICcLm9jj3cYM9dQFLLZWJFVjW4BrmSVa9ZAElRUor/oC0YxvtXWvLXjP0+
	yTo33zQvB8WDq9AOG8d494hu4cU1wm1BbL7mTlUT4pVGSEx6Xy3Rkn5riDYIqOzLnzcJ
	97vd5Sv02PBFk0lRVqrgLYc4PIBthkmdPPrXZYuOjYUqx2w9OYWpLFEH9huRL1XQUm5y
	U820U4OPUS1VRLuDqscns76oVjjbUJyCOIQIve8RDLFSc8/KUu8nPpP00/EyS8qnVYZE
	6eSA==
X-Gm-Message-State: AIkVDXLYRpumjKcVLVuB0IEnZWgVZoUSuDjFceG9XafnYAX2Pu2xzml42e2KPseVUAg4lhvN+2ueQGQnTHDJ1XHn
X-Received: by 10.31.102.134 with SMTP id a128mr954994vkc.165.1485427308781;
	Thu, 26 Jan 2017 02:41:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Thu, 26 Jan 2017 02:41:28 -0800 (PST)
In-Reply-To: <6442c7ab-a539-c1e2-bb54-23d4643bba65@redhat.com>
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
	<1476117341-32690-3-git-send-email-drjones@redhat.com>
	<CAFEAcA92X+oCMji_bnWkjRWvqQ+CyqrR0ogy-SKOGW7TRYsZ3g@mail.gmail.com>
	<6442c7ab-a539-c1e2-bb54-23d4643bba65@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2017 10:41:28 +0000
Message-ID: <CAFEAcA-R3CBd4_g=83Gq2U0LK6qf0k-sxb3Kiu3GSv9AXqZH2A@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: no ITS on older machine
 types
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Y+rJJPpGvb7

On 26 January 2017 at 07:58, Auger Eric <eric.auger@redhat.com> wrote:
> On 20/01/2017 16:52, Peter Maydell wrote:
>> So this patch added a no_its flag which gets set for virt-2.7
>> and earlier, but there's no user-facing way to say "I'd like
>> a virt-2.8 board with no ITS", right? That's a bit unfortunate
>> because the ITS can't be migrated, which means there's no way
>> to ask for a post-2.7 virt board which can be migrated...
>
> Sorry for the delay.
>
> For 2.9 machine I can add a new property that would allow the user to
> deselect the ITS. Would that make sense?

Maybe, but Christoffer pointed out to me that we can't do
migration of the GICv3 yet anyway, so I was getting a bit
ahead of myself -- non-migratable ITS doesn't break something
that worked previously. So perhaps we're OK the way we are?

thanks
-- PMM
